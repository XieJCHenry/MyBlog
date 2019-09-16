package com.jchenry.myblog.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jchenry.myblog.domain.ArticleTag;
import com.jchenry.myblog.dto.Msg;
import com.jchenry.myblog.service.ArticleTagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * ArticleTagController
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/24 19:44
 * @Version 1.0
 **/
@Controller
@RequestMapping(path = "tags")
public class ArticleTagController {

    @Autowired
    private ArticleTagService service;

    @GetMapping("all")
    @ResponseBody
    public Msg fetchArticleTags() {
        List<ArticleTag> tags = service.listAll();
        return Msg.success().add("tags", tags);
    }

    @GetMapping("page/{pageNum}")
    @ResponseBody
    public Msg fetchIn(@PathVariable("pageNum") Integer pageNum) {
        PageHelper.startPage(pageNum, 10);
        List<ArticleTag> tags = service.listAll();
        PageInfo info = new PageInfo(tags);
        return Msg.success().add("pageInfo", info);
    }

    @PutMapping("/{oldTagName}")
    @ResponseBody
    public Msg updateTagName(@PathVariable("oldTagName") String oldTagName,
                             @RequestParam("newTagName") String newTagName) {
        service.updateTagName(oldTagName, newTagName);
        return Msg.success();
    }

    @DeleteMapping("/{tagName}")
    @ResponseBody
    public Msg deleteTag(@PathVariable("tagName") String tagName) {
        service.deleteTag(tagName);
        return Msg.success();
    }

    @PostMapping("/check")
    @ResponseBody
    public Msg checkLegality(@RequestParam("tagName") String tagName) {
        return service.checkLegality(tagName);
    }

    @PostMapping("/{tagName}")
    @ResponseBody
    public Msg addTag(@PathVariable("tagName") String tagName) {
        service.addTag(tagName);
        return Msg.success();
    }
}
