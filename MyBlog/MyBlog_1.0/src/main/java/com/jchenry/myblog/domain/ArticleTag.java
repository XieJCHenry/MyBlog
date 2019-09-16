package com.jchenry.myblog.domain;

import lombok.*;

import java.io.Serializable;

@Setter
@Getter
@EqualsAndHashCode
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ArticleTag implements Serializable {
    private Integer tagId;

    private String tagName;

    private Integer articleNum;

}