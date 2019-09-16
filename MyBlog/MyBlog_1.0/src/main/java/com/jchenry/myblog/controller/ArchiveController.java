package com.jchenry.myblog.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jchenry.myblog.domain.Article;
import com.jchenry.myblog.dto.Msg;
import com.jchenry.myblog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * ArchivesController
 *
 * @Description 归档（根据日期）
 * @Author jc-henry
 * @Date 2019/08/29 15:34
 * @Version 1.0
 **/
@Controller
@RequestMapping(path = "archives")
public class ArchiveController {

    @Autowired
    private ArticleService articleService;

    @GetMapping("/{pageNum}")
    @ResponseBody
    public Msg getArchivesAtPage(@PathVariable(value = "pageNum") Integer pageNum) {
        PageHelper.startPage(pageNum,10);
        List<Article> articles = articleService.listAll();
        articles.sort((o1, o2) ->
                (int) (o2.getPublishDate().getTime() - o1.getPublishDate().getTime())
        );
        PageInfo info = new PageInfo(articles);
        return Msg.success().add("pageInfo",info);
    }
}
