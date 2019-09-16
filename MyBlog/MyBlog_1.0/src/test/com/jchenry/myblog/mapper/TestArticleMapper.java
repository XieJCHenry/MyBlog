package com.jchenry.myblog.mapper;

import com.jchenry.myblog.domain.Article;
import com.jchenry.myblog.domain.ArticleTag;
import com.jchenry.myblog.domain.ArticleType;
import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * TestArticleMapper
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/20 18:23
 * @Version 1.0
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:spring/application-context.xml")
//@Transactional(transactionManager = "transactionManager")
//@Rollback
public class TestArticleMapper {

    @Autowired
    private SqlSession session;

    @Autowired
    private ArticleMapper mapper;

    @Before
    public void init() {
        mapper = session.getMapper(ArticleMapper.class);
    }

    @Test
    public void testListAll() {
        List<Article> list = mapper.selectAll();

        list.forEach(article -> {
            System.out.println(article.getArticleTitle());
        });
    }

    @Test
    public void testSelectByPrimaryKey() {
        Article article = mapper.selectByPrimaryKey(1L);
        System.out.println(article);
    }

    @Test
    public void testSelectByArticleTitle() {
        Article article = mapper.selectByArticleTitle("Collections类解析");
        System.out.println(article.getArticleAuthor());
    }

    @Test
    public void testSelectArticleTitle() {
        String title = mapper.selectArticleTitle("categories");
        System.out.println(title);
    }

    @Test
    public void testInsert() {
        List<Integer> types = new ArrayList<>();
        types.add(1);
        types.add(3);
        List<Integer> tags = new ArrayList<>();
        tags.add(1);
        tags.add(2);

        Article article = new Article();
        article.setArticleId(1013102340124L);
        article.setArticleTitle("测试标题");
        article.setArticleAuthor("JC-Henry");
        article.setOriginalAuthor("JC-Henry");
        article.setArticleContent("测试内容");
        article.setArticleSummary("测试简介");
        article.setPublishDate(new Date());
        article.setUpdateDate(new Date());
        mapper.insert(article, types, tags);
    }


    @Test
    public void testSelectContent() {
        Long id = 7467451566701562203L;
        String content = mapper.selectContentByPrimaryKey(id);
        System.out.println(content.length());
    }

    @Test
    public void testSelectContentByArticleTitle(){
        System.out.println(mapper.selectContentByTitle("Collections 类解析").length());
    }

    @Test
    public void testSelectPrevious(){
        Long id = 7467451567087249747L;
        System.out.println(mapper.selectPrevious(id));
    }

    @Test
    public void testSelectNext(){
        Long id = 7467451567087249747L;
        System.out.println(mapper.selectNext(id));
    }

}
