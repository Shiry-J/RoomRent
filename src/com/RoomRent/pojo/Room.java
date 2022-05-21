package com.RoomRent.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Room {

    private Integer id;
    private Integer rent_id;
    private String rent_name;
    private String title;
    private Integer rent_type;
    private String house_type;
    private String orientation;
    private Integer area;
    private String region;
    private String community;
    private Integer floor;
    private double price;
    private String content;
    private String image;
    private String contacts;
    private String phone;
    private Integer is_on;
    private Date gmt_create;
    private Date gmt_modified;

}
