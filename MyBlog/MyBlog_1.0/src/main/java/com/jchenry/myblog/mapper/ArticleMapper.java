package com.jchenry.myblog.mapper;

import com.jchenry.myblog.domain.Article;
import org.apache.ibatis.annotations.Arg;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public interface ArticleMapper {


    /**
     *  保存文章
     *  分三部分：保存文章信息到article表、保存正文到article_content表、保存文章类别和文章标签
     * @param record
     * @param types
     * @param tags
     * @return
     */
    int insert(@Param("article") Article record,
               @Param("types") List<Integer> types,
               @Param("tags") List<Integer> tags);


    Article selectByPrimaryKey(Long articleId);

    Article selectByArticleTitle(String title);

    String selectArticleTitle(String title);

    /**
     * 从 article_content 表中查询文章内容
     *
     * @param articleId 文章id
     * @return
     */
    String selectContentByPrimaryKey(Long articleId);

    String selectHtmlContentByPrimaryKey(Long articleId);

    String selectContentByTitle(String title);

    String selectHtmlContentByTitle(String title);

    String selectPrevious(Long articleId);

    String selectNext(Long articleId);

    List<Article> selectAll();

    int updateByPrimaryKey(Article record);

    int deleteByPrimaryKey(@Param("articleId")Long articleId,
                           @Param("types") List<Integer> types,
                           @Param("tags") List<Integer> tags);
}