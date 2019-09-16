package com.jchenry.myblog.mapper;

import com.jchenry.myblog.domain.ArticleTag;
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
import java.util.List;

/**
 * TestArticleTagMapper
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/24 19:26
 * @Version 1.0
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "/spring/application-context.xml")
@Transactional
@Rollback
public class TestArticleTagMapper {

    @Autowired
    private SqlSession session;

    private ArticleTagMapper mapper;

    @Before
    public void init() {
        mapper = session.getMapper(ArticleTagMapper.class);
    }

    @Test
    public void testListAll() {
        List<ArticleTag> tags = mapper.selectAll();
        tags.forEach(tag -> {
            System.out.println(tag);
        });
    }

    @Test
    public void testSelectByIdList() {
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
        List<ArticleTag> tags = mapper.selectByIdList(list);
        tags.forEach(tag -> {
            System.out.println(tag);
        });
    }

    @Test
    public void testUpdateArticleNum(){
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(2);
//        System.out.println(mapper.updateArticleNum(list));
    }

    @Test
    public void testInsert(){
        ArticleTag tag = new ArticleTag();
        tag.setArticleNum(0);
        tag.setTagName("测试标签名");
        tag.setTagId(null);
        mapper.insert(tag);
    }
}
