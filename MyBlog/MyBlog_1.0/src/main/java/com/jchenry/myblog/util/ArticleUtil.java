package com.jchenry.myblog.util;

import com.vladsch.flexmark.html.HtmlRenderer;
import com.vladsch.flexmark.parser.Parser;
import com.vladsch.flexmark.util.ast.Document;
import com.vladsch.flexmark.util.data.MutableDataSet;

/**
 * ArticleUtil
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/22 23:02
 * @Version 1.0
 **/
public class ArticleUtil {



    /**
     * 将markdown转换为html
     *
     * @param markdown
     * @return
     */
    public static String markdownToHtml(String markdown) {
        MutableDataSet options = new MutableDataSet();
        Parser parser = Parser.builder(options).build();
        HtmlRenderer renderer = HtmlRenderer.builder(options).build();
        Document document = parser.parse(markdown);
        return renderer.render(document);
    }

}
