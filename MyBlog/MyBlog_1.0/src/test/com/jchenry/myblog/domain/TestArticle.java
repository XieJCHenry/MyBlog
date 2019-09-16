package com.jchenry.myblog.domain;

/**
 * TestArticle
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/09/16 10:54
 * @Version 1.0
 **/
public class TestArticle {

    public static void main(String[] args) {

        /**
         * 测试 lombok 插件
         */
        Article article = new Article();
        article.setArticleContent("213456");
        Article article2 = new Article();
        article2.setArticleContent("213456");
        System.out.println(article);
        System.out.println(article.hashCode());
        System.out.println(article.equals(article2));
    }
}
