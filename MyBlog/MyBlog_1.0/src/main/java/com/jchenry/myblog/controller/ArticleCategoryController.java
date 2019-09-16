package com.jchenry.myblog.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jchenry.myblog.domain.ArticleType;
import com.jchenry.myblog.dto.Msg;
import com.jchenry.myblog.service.ArticleTypeService;
import com.jchenry.myblog.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * ArticleCategoriesController
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/24 19:45
 * @Version 1.0
 **/
@Controller
@RequestMapping(path = "categories")
public class ArticleCategoryController {

    @Autowired
    private ArticleTypeService articleTypeService;

    /**
     * 跳转到文章列表页
     *
     * @return
     */
    /*@RequestMapping(path = {"", "/"}, method = RequestMethod.GET)
    public String showArticleCategories() {
        return "article/ArticleCategories";
    }*/

    /**
     * 获取文章列表信息
     *
     * @return
     */
    @GetMapping("all")
    @ResponseBody
    public Msg fetchAll() {
        List<ArticleType> types = articleTypeService.listAll();
        return Msg.success().add("categories", types);
    }

    @GetMapping("page/{pageNum}")
    @ResponseBody
    public Msg fetchIn(@PathVariable("pageNum") Integer pageNum) {
        PageHelper.startPage(pageNum, 10);
        List<ArticleType> types = articleTypeService.listAll();
        PageInfo info = new PageInfo(types);
        return Msg.success().add("pageInfo", info);
    }

    /**
     * 检查分类名是否合法
     * 检查项：是否重复，是否是非法或无意义字符串
     *
     * @param typeName
     * @return
     */
    @PostMapping("check")
    @ResponseBody
    public Msg checkLegality(@RequestParam("typeName") String typeName) {
        return articleTypeService.checkLegality(typeName);
    }


    @PutMapping("/{oldTypeName}")
    @ResponseBody
    public Msg updateCategoryName(@PathVariable("oldTypeName") String oldTypeName,
                                  @RequestParam("newTypeName") String newTypeName) {
        articleTypeService.updateTypeName(oldTypeName, newTypeName);
        return Msg.success();
    }

    @DeleteMapping("/{typeName}")
    @ResponseBody
    public Msg deleteCategory(@PathVariable("typeName") String typeName){
        articleTypeService.deleteType(typeName);
        return Msg.success();
    }
}
