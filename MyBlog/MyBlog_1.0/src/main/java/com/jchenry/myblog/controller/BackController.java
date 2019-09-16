package com.jchenry.myblog.controller;

import com.jchenry.myblog.domain.ArticleType;
import com.jchenry.myblog.service.ArticleTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * BackController
 *
 * @Description 所有页面跳转
 * @Author jc-henry
 * @Date 2019/08/29 14:18
 * @Version 1.0
 **/
@Controller
public class BackController {

    @Autowired
    private ArticleTypeService articleTypeService;

    /**
     * 首页
     *
     * @return
     */
    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/categories")
    public String articleCategories() {
        return "article/ArticleCategories";
    }


    @GetMapping(path = "/categories/{categoryId}")
    public ModelAndView fetchCategoryInfoById(@PathVariable("categoryId") Integer categoryId) {
        List<String> articles = articleTypeService.getArticlesInType(categoryId);
        ArticleType type = articleTypeService.getByTypeId(categoryId);
        ModelAndView mav = new ModelAndView("article/CategoryPresent");
        mav.addObject("articles", articles);
        mav.addObject("articleType", type);
        return mav;
    }


    /*@GetMapping("/categories/{categoryName}")
    public ModelAndView fetchCategoryInfoByName(@PathVariable("categoryName") String categoryName) {
        ModelAndView mav = new ModelAndView("article/CategoryPresent");
        mav.addObject("articleType", articleTypeService.getByTypeName(categoryName));
        return mav;
    }*/

    @GetMapping("/archives")
    public String archives() {
        return "article/ArticleArchives";
    }

    @GetMapping("/article/edit")
    public String articleEdit() {
        return "article/ArticleEdit";
    }

    @GetMapping("/article/{title}")
    public ModelAndView article(@PathVariable(value = "title") String title) {
        ModelAndView mav = new ModelAndView("article/ShowArticle");
        mav.addObject("title", title);
        return mav;
    }

    @GetMapping("/login")
    public String login() {
        return "user/login";
    }

    @GetMapping("/console")
    public String console() {
        return "user/BlogConsole";
    }
}
