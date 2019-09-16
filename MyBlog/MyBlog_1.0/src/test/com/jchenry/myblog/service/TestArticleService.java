package com.jchenry.myblog.service;

import com.jchenry.myblog.domain.Article;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * TestArticleService
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/23 8:57
 * @Version 1.0
 **/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = "/spring/application-context.xml")
@Transactional
@Rollback
public class TestArticleService {

    @Autowired
    private ArticleService service;

    @Test
    public void testGenerateArticleId() {
        String author = "JC-Henry";
        char[] chars = author.toCharArray();
        StringBuilder sb = new StringBuilder();
        for (char c : chars) {
            sb.append((int) c);
        }
        long current = new Date().getTime();
        long articleId =
                Long.parseLong((sb.toString().substring(0, 6) + current));
        System.out.println(articleId);
    }

    @Test
    public void testListAll() {
        List<Article> articles = service.listAll();
        articles.forEach(article -> {
            System.out.println(article);
        });
    }

    @Test
    public void getUUID(){
        System.out.println(UUID.randomUUID().toString());
    }

}
