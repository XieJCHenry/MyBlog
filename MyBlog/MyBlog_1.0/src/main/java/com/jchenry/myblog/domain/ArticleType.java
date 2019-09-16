package com.jchenry.myblog.domain;

import lombok.*;

import java.io.Serializable;
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class ArticleType implements Serializable {
    private Integer typeId;

    private String typeName;

    private Integer articleNum;

}