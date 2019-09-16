package com.jchenry.myblog.util;

import com.vladsch.flexmark.ext.tables.TablesExtension;
import com.vladsch.flexmark.html.HtmlRenderer;
import com.vladsch.flexmark.parser.Parser;
import com.vladsch.flexmark.util.ast.Document;
import com.vladsch.flexmark.util.ast.Node;
import com.vladsch.flexmark.util.builder.Extension;
import com.vladsch.flexmark.util.data.DataKey;
import com.vladsch.flexmark.util.data.MutableDataSet;
import org.junit.Test;

import java.io.*;
import java.util.Collections;
import java.util.Set;

import static com.vladsch.flexmark.ext.tables.TablesExtension.*;

/**
 * TestArticleUtil
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/27 11:57
 * @Version 1.0
 **/
public class TestArticleUtil {

    private static final Set<Extension> EXTENSIONS =
            Collections.singleton(create());
    static final Parser PARSER = Parser.builder().extensions(EXTENSIONS).build();
    static final HtmlRenderer RENDERER =
            HtmlRenderer.builder().extensions(EXTENSIONS).build();

    @Test
    public void testTableRender() throws IOException {
        String fileName = "test.md";
        String source = getSourceFrom(fileName);

        MutableDataSet options =
                new MutableDataSet();
        Parser parser = Parser.builder(options).build();
        HtmlRenderer renderer = HtmlRenderer.builder(options).build();
        Node document = parser.parse(source);
        String html = renderer.render(document);
        System.out.println(html);
    }


    private String getSourceFrom(String fileName) throws IOException {
        InputStream in = this.getClass().getClassLoader().getResourceAsStream(fileName);
        BufferedReader reader = new BufferedReader(new InputStreamReader(in));
        StringBuilder sb = new StringBuilder();
        String s;
        while((s=reader.readLine())!=null){
            sb.append(s);
        }
        return sb.toString();
    }
}
