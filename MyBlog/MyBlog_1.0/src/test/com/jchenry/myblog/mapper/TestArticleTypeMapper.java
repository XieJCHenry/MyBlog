package com.jchenry.myblog.mapper;

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
import java.util.List;

/**
 * TestArticleTypeMapper
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/23 23:32
 * @Version 1.0
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath*:spring/application-context.xml")
@Transactional(transactionManager = "transactionManager")
@Rollback
public class TestArticleTypeMapper {

    @Autowired
    private SqlSession session;

    private ArticleTypeMapper mapper;

    @Before
    public void init() {
        mapper = session.getMapper(ArticleTypeMapper.class);
    }

    @Test
    public void testSelectAll() {
        List<ArticleType> list = mapper.selectAll();
        list.forEach((type) -> {
            System.out.println(type);
        });
    }

    @Test
    public void testSelectByIdList() {
        List<Integer> list = new ArrayList();
        list.add(1);
        list.add(3);
        list.add(5);
        List<ArticleType> types = mapper.selectByIdList(list);
        types.forEach(type -> {
            System.out.println(type);
        });
    }

    @Test
    public void testInsert() {
        ArticleType type = new ArticleType();
        type.setTypeName("Java集合");
        type.setArticleNum(0);
        int insert = mapper.insert(type);
        System.out.println(insert);
    }

    @Test
    public void testDeleteByPrimaryKey() {
        int delete = mapper.deleteByPrimaryKey(1);
        System.out.println(delete);
    }

    @Test
    public void testDeleteByArticleTypeName() {
        int delete = mapper.deleteByArticleTypeName("SpringMVC");
        System.out.println(delete);
    }

    @Test
    public void testIncreaseArticleNum() {
        List<Integer> list = new ArrayList<>();
        list.add(1);
        list.add(3);
        list.add(6);
//        int i = mapper.updateArticleNum(list);
//        System.out.println(i);
    }

    @Test
    public void testSelectByArticleId() {
        Long id = 7467451566821111812L;
        List<ArticleType> strings = mapper.selectByArticleId(id);
        strings.forEach(type -> {
            System.out.println(type);
        });
    }

    @Test
    public void testSelectTypeName() {
        String typeName = "JavaSE";
        String s = mapper.selectTypeName(typeName);
        System.out.println(s);
    }

    @Test
    public void testUpdateTypeNameByTypeName(){
        String oldName = "Spring";
        String newName = "SpringMVC";
        mapper.updateTypeNameByTypeName(oldName,newName);
    }

}
