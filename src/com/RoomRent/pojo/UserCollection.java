package com.RoomRent.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserCollection {

    private Integer id;
    private Integer user_id;
    private Integer room_id;
    private Date gmt_create;
    private Date gmt_modified;

}
