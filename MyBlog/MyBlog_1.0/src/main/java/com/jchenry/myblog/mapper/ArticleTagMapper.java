package com.jchenry.myblog.mapper;

import com.jchenry.myblog.domain.ArticleTag;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Repository
@Transactional
public interface ArticleTagMapper {
    int deleteByPrimaryKey(Integer tagId);

    int deleteByTagName(String tagName);

    int insert(ArticleTag record);

    ArticleTag selectByPrimaryKey(Integer tagId);

    ArticleTag selectByTagName(String tagName);

    List<ArticleTag> selectAll();

    List<ArticleTag> selectByIdList(List<Integer> ids);

    List<ArticleTag> selectByArticleId(Long articleId);

    int updateByPrimaryKey(ArticleTag record);

    int updateTagNameByTagName(@Param("oldTagName") String oldTagName,
                               @Param("newTagName") String newTagName);


}