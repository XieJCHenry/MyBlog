package com.jchenry.myblog.domain;

import lombok.*;

import java.io.Serializable;

/**
 * Photo
 *
 * @Description TODO
 * @Author jc-henry
 * @Date 2019/08/22 20:28
 * @Version 1.0
 **/
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class Photo implements Serializable {

    private Integer photoId;
    private String photoName;
    private String photoPath;

}
