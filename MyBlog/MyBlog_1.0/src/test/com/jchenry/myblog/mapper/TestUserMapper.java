package com.jchenry.myblog.mapper;

import com.jchenry.myblog.domain.User;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

/**
 * TestUserMapper
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/09/01 12:47
 * @Version 1.0
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "/spring/application-context.xml")
@Transactional
@Rollback
public class TestUserMapper {


    @Autowired
    private UserMapper mapper;

    @Test
    public void testSelectUser() {
        User user = mapper.selectUser("jc-henry", "xjc241003+");
        System.out.println(user);
    }
}
