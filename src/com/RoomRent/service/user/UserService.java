package com.RoomRent.service.user;

import com.RoomRent.pojo.Answer;
import com.RoomRent.pojo.Dialogue;
import com.RoomRent.pojo.User;
import java.util.List;

public interface UserService {

    List<User> getUserList();

    User getUserByUserName(String username);

    Integer addUser(User user);

    Integer modifyPasswordByid(Integer id, String password);

    Integer modifyNickNameByid(Integer id, String nickname);

    Integer modifyEmailByid(Integer id, String email);

    Integer modifyPhoneByid(Integer id, String phone);

    List<Dialogue> getDialogueListByUserId(Integer question_id);

    List<Answer> getAnswerListByUserId(Integer answer_id);
}
