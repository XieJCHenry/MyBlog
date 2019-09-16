package com.jchenry.myblog.domain;

import lombok.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class Article implements Serializable {

    @NotNull
    private Long articleId;

    @NotEmpty
    private String articleAuthor;

    @NotEmpty
    private String originalAuthor;

    @NotEmpty
    private String articleTitle;

    @Size(min = 0, max = 200)
    private String articleSummary;

    @NotNull
    private String articleContent;  // 后期将articleContent拆到另一个表中

    // markdown的html代码
    @NotNull
    private String articleHtmlContent;

    private List<ArticleType> articleTypes;

    private List<ArticleTag> articleTags;

    @NotNull
    private Date publishDate;

    @NotNull
    private Date updateDate;

    private String previousArticle; // 上一篇文章标题

    private String nextArticle; // 下一篇文章标题

    private Integer articleLike;

    public Article(Long articleId, String articleAuthor, String originalAuthor,
                   String articleTitle, String articleSummary, Date publishDate,
                   Date updateDate, Integer articleLike) {
        this.articleId = articleId;
        this.articleAuthor = articleAuthor;
        this.originalAuthor = originalAuthor;
        this.articleTitle = articleTitle;
        this.articleSummary = articleSummary;
        this.publishDate = publishDate;
        this.updateDate = updateDate;
        this.articleLike = articleLike;
    }

}