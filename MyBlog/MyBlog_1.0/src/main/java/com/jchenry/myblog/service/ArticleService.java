package com.jchenry.myblog.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jchenry.myblog.domain.Article;
import com.jchenry.myblog.domain.ArticleTag;
import com.jchenry.myblog.domain.ArticleType;
import com.jchenry.myblog.dto.Msg;
import com.jchenry.myblog.mapper.ArticleMapper;
import com.jchenry.myblog.mapper.ArticleTagMapper;
import com.jchenry.myblog.mapper.ArticleTypeMapper;
import com.jchenry.myblog.util.ArticleUtil;
import com.jchenry.myblog.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * ArticleService
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/22 14:26
 * @Version 1.0
 **/
@Service
public class ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Autowired
    private ArticleTypeMapper articleTypeMapper;

    @Autowired
    private ArticleTagMapper articleTagMapper;

    @Autowired
    private ArticleTypeService articleTypeService;

    @Autowired
    private ArticleTagService articleTagService;

    public List<Article> listAll() {
        List<Article> articles = articleMapper.selectAll();
        articles.forEach(article -> {
            List<ArticleType> types =
                    articleTypeMapper.selectByArticleId(article.getArticleId());
            article.setArticleTypes(types);
        });
        articles.forEach(article -> {
            List<ArticleTag> tags =
                    articleTagMapper.selectByArticleId(article.getArticleId());
            article.setArticleTags(tags);
        });
        return articles;
    }


    /**
     * 查找整篇文章，包括信息和正文
     *
     * @param title
     * @return
     */
    public Article getArticleByTitle(String title) {
        Article article = articleMapper.selectByArticleTitle(title);   // 查找信息
        String content = articleMapper
                .selectContentByPrimaryKey(article.getArticleId());  // 查找内容
        String htmlContent =
                articleMapper.selectHtmlContentByPrimaryKey(article.getArticleId());
        article.setArticleContent(content);
        article.setArticleHtmlContent(htmlContent);
        return article;
    }

    /*public List<Article> getInfos(Integer pageNum,Integer pageSize){
        PageHelper.startPage(pageNum,pageSize);
        List<Article> articles = articleMapper.selectAll();
        PageInfo
        return articles;
    }*/

    public Article getInfo(String title) {
        return articleMapper.selectByArticleTitle(title);
    }

    public String getContentById(Long id) {
        return articleMapper.selectContentByPrimaryKey(id);
    }

    public String getContent(String title) {
        return articleMapper.selectContentByTitle(title);
    }

    public String getHtmlContent(String title) {
        return articleMapper.selectHtmlContentByTitle(title);
    }

    public String getPrevious(Long articleId){
        return articleMapper.selectPrevious(articleId);
    }

    public String getNext(Long articleId){
        return articleMapper.selectNext(articleId);
    }

    /**
     * 保存文章，分为三步：保存文章信息，保存正文、保存文章类别和标签
     *
     * @param article
     */
    public void saveArticle(Article article, List<Integer> types, List<Integer> tags) {
        articleMapper.insert(article, types, tags);
    }

    public boolean initAndSaveArticle(String title, String content,
                                      String htmlContent, List<Integer> types,
                                      List<Integer> tags, String summary) {
        Date pubDate = new Date();
        Article article = new Article();
        article.setArticleAuthor("JC-Henry");
        article.setOriginalAuthor("JC-Henry");
        article.setArticleTitle(title);
        article.setArticleSummary(summary);
        article.setArticleContent(content);
        article.setArticleHtmlContent(htmlContent);
        article.setArticleTypes(articleTypeService.getNamesByIds(types));
        article.setArticleTags(articleTagService.getNamesByIds(tags));
        article.setPublishDate(pubDate);
        article.setUpdateDate(pubDate);
        article.setArticleId(this.generateArticleId(article));
        article.setArticleLike(0);
        if (!this.checkExist(title)) {
            this.saveArticle(article, types, tags);
            return true;
        } else {
            return false;
        }
    }

    /**
     * 检查文章是否已经存，避免重复插入
     *
     * @param title
     * @return
     */
    public boolean checkExist(String title) {
        return articleMapper.selectArticleTitle(title) != null;
    }

    /**
     * 生成文章ID
     *
     * @param article
     * @return
     */
    public long generateArticleId(Article article) {
        Date publishDate = article.getPublishDate();
        String author = article.getOriginalAuthor();
        if (publishDate == null) {
            publishDate = new Date();
            article.setPublishDate(publishDate);
        }
        if (StringUtil.isEmpty(author)) {
            throw new IllegalArgumentException("Article Author cannot be null or empty");
        }

        char[] chars = author.toCharArray();
        StringBuilder sb = new StringBuilder();
        for (char c : chars) {
            sb.append((int) c);
        }
        long articleId = Long.parseLong(
                sb.toString().substring(0, 6) + publishDate.getTime());
        return articleId;
    }
}
