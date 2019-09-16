package com.jchenry.myblog.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jchenry.myblog.domain.Article;
import com.jchenry.myblog.domain.ArticleType;
import com.jchenry.myblog.dto.Msg;
import com.jchenry.myblog.service.ArticleService;
import com.jchenry.myblog.service.ArticleTagService;
import com.jchenry.myblog.service.ArticleTypeService;
import com.jchenry.myblog.util.ArticleUtil;
import com.jchenry.myblog.util.FileUtil;
import com.jchenry.myblog.util.StringUtil;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * ArticleController
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/20 18:39
 * @Version 1.0
 **/
@Controller
@RequestMapping(path = "article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private ArticleTypeService articleTypeService;

    @Autowired
    private ArticleTagService articleTagService;


    @GetMapping("all")
    @ResponseBody
    public Msg listAll() {
        return Msg.success().add("articles", articleService.listAll());
    }


    /**
     * 文章展示页面。
     * 1、获取文章信息
     * 需要判断这个标题在数据库中是否存在，如果不存在跳转到首页，如果存在，跳转到展示页
     *
     * @return
     */
    @GetMapping(path = "info/{title}")
    @ResponseBody
    public Msg fetchArticleInfo(@PathVariable(value = "title", required = true) String title,
                                HttpServletResponse response) throws IOException {
        if (!articleService.checkExist(title)) {
            response.sendRedirect("/");
        }
        Article article = articleService.getInfo(title);
        DateFormat format = DateFormat.getDateInstance();
        String pubDate = format.format(article.getPublishDate());
        List<ArticleType> types =
                articleTypeService.getByArticleId(article.getArticleId());
        StringJoiner joiner = new StringJoiner(",");
        for (ArticleType type : types) {
            joiner.add(type.getTypeName());
        }
        return Msg.success()
                .add("summary", article.getArticleSummary())
                .add("pubDate", pubDate)
                .add("originalAuthor", article.getOriginalAuthor())
                .add("typeStr", joiner.toString())
                .add("previous", articleService.getPrevious(article.getArticleId()))
                .add("next", articleService.getNext(article.getArticleId()));
    }

    /**
     * 文章展示页面。
     * 2、获取正文
     *
     * @param title
     * @return
     */
    @GetMapping(path = {"content/{title}"})
    @ResponseBody
    public Msg fetchArticleContent(@PathVariable(value = "title", required = true) String title) {
        /*return Msg.success().add("content",
                ArticleUtil.markdownToHtml(articleService.getContent(title)));*/
        return Msg.success().add("content", articleService.getHtmlContent(title));
    }

    /**
     * 首页文章列表
     *
     * @param
     * @return
     */
    @GetMapping(path = "page/{pageNum}")
    @ResponseBody
    public Msg fetchArticlesInfo(@PathVariable(value = "pageNum", required = false)
                                         Integer pageNum) {
        if (pageNum == null) {
            pageNum = 1;
        }
        PageHelper.startPage(pageNum, 10);
        List<Article> articles = articleService.listAll();
        PageInfo pageInfo = new PageInfo(articles, 8);
        return Msg.success().add("pageInfo", pageInfo);
    }

    /**
     * 上传图片
     * <p>
     * 不需要使用JSONObject对象，否则将无法转换成JSON格式。
     * 如何更好地命名图片？格式：文章Id+上传时间+后缀名
     *
     * @param attach
     * @param request
     * @return
     */
    @PostMapping(path = "image/upload")
    @ResponseBody
    public Map<String, Object> imageUpload(@RequestParam(value = "editormd-image-file"
            , required = true) MultipartFile attach, HttpServletRequest request) {
        String suffix = StringUtil.getSuffix(attach.getOriginalFilename());
        String rootPath = request.getSession().getServletContext()
                .getRealPath("/resource/image/");
        String fileName = System.currentTimeMillis() + "_upload" + suffix;
        File targetFile = new File(rootPath, fileName);

        Map<String, Object> res = new HashMap<>();
        if (FileUtil.save(attach, targetFile)) {
            res.put("success", 1);
            res.put("message", "upload success");
            res.put("url", request.getContextPath() + "/resource/image/" + fileName);
        } else {
            res.put("success", 0);
            res.put("message", "upload fail");
        }
        return res;
    }

    @PostMapping(path = "upload")
    @ResponseBody
    public Msg articleUpload(@RequestParam("upload") String uploadContent,
                             @RequestParam(value = "articleTitle") String title,
                             @RequestParam(value = "articleTypes") List<Integer> types,
                             @RequestParam(value = "articleTags") List<Integer> tags,
                             @RequestParam(value = "articleSummary") String summary) {
        if (StringUtil.isEmpty(title)) {
            return Msg.error().add("msg", "标题不能为空");
        }
        if (types.size() < 1) {
            return Msg.error().add("msg", "至少选择一个类别");
        }
        if (tags.size() < 1) {
            return Msg.error().add("msg", "至少选择一个标签");
        }
        boolean success = false;
        /*success = articleService.initAndSaveArticle(title, uploadContent, types
                , tags,
                summary);*/
        if (success) {
            return Msg.success().add("msg", "success");
        } else {
            return Msg.error().add("msg", "文章已存在");
        }

    }


    /**
     * 保存文章
     * <p>
     * 已完成文章内容的保存（markdown和html）、读取，接下来需要完成文章标题、标签、类别、摘要等前后端功能
     *
     * @param content
     * @param title
     * @param types
     * @param tags
     * @return
     */
    @PostMapping(path = "lasting")
    @ResponseBody
    public Msg saveArticle(
            @RequestParam(value = "articleContent") String content,
            @RequestParam(value = "htmlContent") String htmlContent,
            @RequestParam(value = "articleTitle") String title,
            @RequestParam(value = "articleTypes") List<Integer> types,
            @RequestParam(value = "articleTags") List<Integer> tags,
            @RequestParam(value = "articleSummary") String summary
    ) {
        /**
         * 保存文章的步骤
         * 1、获取作者信息、这里默认写入。（HttpSession）
         * 2、将四个字段写入新的对象中
         * 3、填充剩余字段
         * 4、调用service执行保存
         */
        if (StringUtil.isEmpty(content)) {
            return Msg.error().add("msg", "正文不能为空");
        }
        if (StringUtil.isEmpty(title)) {
            return Msg.error().add("msg", "标题不能为空");
        }
        if (types.size() < 1) {
            return Msg.error().add("msg", "至少选择一个类别");
        }
        if (tags.size() < 1) {
            return Msg.error().add("msg", "至少选择一个标签");
        }
        boolean success = articleService.initAndSaveArticle(title, content, htmlContent,
                types, tags, summary);
        if (success) {
            return Msg.success().add("msg", "success");
        } else {
            return Msg.error().add("msg", "文章已存在");
        }
    }
}
