package com.jchenry.myblog.domain;

import lombok.*;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@ToString
public class User implements Serializable {
    private Integer userId;

    private String username;

    private String password;

    private String email;

}