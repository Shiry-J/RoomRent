package com.RoomRent.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Dialogue {

    private Integer id;
    private Integer room_id;
    private Integer question_id;
    private String question_content;
    private Date gmt_create;
    private Date gmt_modified;

}
