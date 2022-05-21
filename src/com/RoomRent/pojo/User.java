package com.RoomRent.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;


import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {

    private Integer id;
    @NotBlank(message = "账号不能为空")
    private String username;
    @NotBlank(message = "昵称不能为空")
    private String nickname;
    @NotBlank(message = "密码不能为空")
    private String password;
    @NotBlank(message = "电话不能为空")
    private String phone;
    @NotBlank(message = "邮箱不能为空")
    @Email
    private String email;
    private Integer type;
    private Date gmt_create;
    private Date gmt_modified;

}
