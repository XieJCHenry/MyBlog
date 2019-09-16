package com.jchenry.myblog.mapper;

import com.jchenry.myblog.domain.ArticleType;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public interface ArticleTypeMapper {

    int deleteByPrimaryKey(Integer typeId);

    int deleteByArticleTypeName(String typeName);

    int insert(ArticleType record);

    ArticleType selectByPrimaryKey(Integer typeId);

    ArticleType selectByTypeName(String typeName);

    List<ArticleType> selectAll();

    /**
     * 根据文章分类的id查找
     *
     * @param ids
     * @return
     */
    List<ArticleType> selectByIdList(List<Integer> ids);

    /**
     * 查找特定文章的分类
     *
     * @param articleId
     * @return
     */
    List<ArticleType> selectByArticleId(Long articleId);

    List<String> selectArticlesById(Integer typeId);

    String selectTypeName(String typeName);

    int updateByPrimaryKey(ArticleType record);

    int updateTypeNameByTypeName(@Param("oldTypeName") String oldTypeName,
                                 @Param("newTypeName") String newTypeName);



}