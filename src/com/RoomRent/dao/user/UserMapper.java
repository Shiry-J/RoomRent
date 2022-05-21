package com.RoomRent.dao.user;


import com.RoomRent.pojo.Answer;
import com.RoomRent.pojo.Dialogue;
import com.RoomRent.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {

    List<User> getUserList();

    User getUserByUserName(@Param("username") String username);

    Integer addUser(User user);

    Integer modifyPasswordByid(@Param("id") Integer id, @Param("password") String password);

    Integer modifyNickNameByid(@Param("id") Integer id, @Param("nickname") String nickname);

    Integer modifyEmailByid(@Param("id") Integer id, @Param("email") String email);

    Integer modifyPhoneByid(@Param("id") Integer id, @Param("phone") String phone);

    List<Dialogue> getDialogueListByUserId(@Param("question_id") Integer question_id);

    List<Answer> getAnswerListByUserId(@Param("answer_id") Integer answer_id);
}
