package com.jchenry.myblog.service;

import com.jchenry.myblog.domain.Article;
import com.jchenry.myblog.domain.ArticleType;
import com.jchenry.myblog.dto.Msg;
import com.jchenry.myblog.mapper.ArticleTypeMapper;
import com.jchenry.myblog.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * ArticleTypeService
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/23 23:50
 * @Version 1.0
 **/
@Service
public class ArticleTypeService {

    @Autowired
    private ArticleTypeMapper mapper;

    // 非法字符过滤
    private final String illegalCharFilter = "[`~!@#$%^&*()+=|{}':;',\\[\\]" +
            ".<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";

    public List<ArticleType> listAll() {
        return mapper.selectAll();
    }

    public ArticleType getByTypeId(Integer typeId){
        return mapper.selectByPrimaryKey(typeId);
    }

    public ArticleType getByTypeName(String typeName){
        return mapper.selectByTypeName(typeName);
    }

    /**
     * 根据分类ID获得文章类型
     *
     * @param ids
     * @return
     */
    public List<ArticleType> getNamesByIds(List<Integer> ids) {
        return mapper.selectByIdList(ids);
    }

    public List<ArticleType> getByArticleId(Long articleId) {
        return mapper.selectByArticleId(articleId);
    }

 /*   public int increaseArticleNum(List<Integer> types) {
        return mapper.updateArticleNum(types);
    }*/

    public List<String> getArticlesInType(Integer typeId) {
        return mapper.selectArticlesById(typeId);
    }

   /* public List<String> getArticlesInType(String typeName){
        final List<String> strings = Collections.emptyList();
        return strings;
    }*/

    public void updateTypeName(String oldTypeName, String newTypeName) {
        mapper.updateTypeNameByTypeName(oldTypeName, newTypeName);
    }

    public void deleteType(String typeName) {
        mapper.deleteByArticleTypeName(typeName);
    }

    /**
     * 检测是否合法
     * 检测项：是否为空，数据库中是否存在，是否由一个字符组成，是否包含符号（包含则非法）
     *
     * @param typeName
     * @return
     */
    public Msg checkLegality(String typeName) {
        if (StringUtil.isEmpty(typeName)) {
            return Msg.error("不能为空");
        }
        if (typeName.length() < 2) {
            return Msg.error("长度必须大于2");
        }
        if (typeName.startsWith(" ") || typeName.endsWith(" ")) {
            return Msg.error("开头或末尾不能有空格");
        }
        if (mapper.selectTypeName(typeName) != null) {
            return Msg.error("已存在相同或近似类名（不区分大小写）");
        }
        if (StringUtil.composedOfOneChar(typeName)) {
            return Msg.error("不能只用一个字符或汉字");
        }
        if (StringUtil.containsChars(typeName)) {
            return Msg.error("不能包含符号或空白字符");
        }
        return Msg.success();
    }
}
