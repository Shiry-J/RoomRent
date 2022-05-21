package com.RoomRent.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Answer {

    private Integer id;
    private Integer room_id;
    private Integer question_id;
    private Integer answer_id;
    private String answer_content;
    private Date answer_time;
    private Date gmt_create;
    private Date gmt_modified;

}
