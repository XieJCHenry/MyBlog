package com.jchenry.myblog.service;

import com.jchenry.myblog.domain.ArticleTag;
import com.jchenry.myblog.dto.Msg;
import com.jchenry.myblog.mapper.ArticleTagMapper;
import com.jchenry.myblog.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * ArticleTagService
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/24 19:40
 * @Version 1.0
 **/
@Service
public class ArticleTagService {

    @Autowired
    private ArticleTagMapper mapper;

    public List<ArticleTag> listAll() {
        return mapper.selectAll();
    }

    public List<ArticleTag> getNamesByIds(List<Integer> ids) {
        return mapper.selectByIdList(ids);
    }

    public List<ArticleTag> getByArticleId(Long articleId) {
        return mapper.selectByArticleId(articleId);
    }

  /*  public int increaseArticleNum(List<Integer> tags){
        return mapper.updateArticleNum(tags);
    }*/

    /**
     * 校验是否合法
     *
     * @param tagName
     * @return
     */
    public Msg checkLegality(String tagName) {
        if (StringUtil.isEmpty(tagName)) {
            return Msg.error("不能为空");
        }
        if (tagName.startsWith(" ") || tagName.endsWith(" ")) {
            return Msg.error("开头或末尾不能有空格");
        }
        if (mapper.selectByTagName(tagName) != null) {
            return Msg.error("已存在相同或近似类名（不区分大小写）");
        }
        if (StringUtil.containsChars(tagName)) {
            return Msg.error("不能包含符号或空白字符");
        }
        return Msg.success();
    }

    public int updateTagName(String oldTagName, String newTagName) {
        return mapper.updateTagNameByTagName(oldTagName, newTagName);
    }

    public int deleteTag(String tagName) {
        return mapper.deleteByTagName(tagName);
    }

    public void addTag(String tagName) {
        ArticleTag tag = new ArticleTag();
        tag.setArticleNum(0);
        tag.setTagName(tagName);
        tag.setTagId(null);
        mapper.insert(tag);
    }
}
