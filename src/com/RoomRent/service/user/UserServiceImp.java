package com.RoomRent.service.user;


import com.RoomRent.dao.user.UserMapper;
import com.RoomRent.pojo.Answer;
import com.RoomRent.pojo.Dialogue;
import com.RoomRent.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImp implements UserService{

    @Autowired
    private UserMapper userMapper;

    public List<User> getUserList(){
        return userMapper.getUserList();
    }

    public User getUserByUserName(String username){
        return userMapper.getUserByUserName(username);
    }

    public Integer addUser(User user){
        return userMapper.addUser(user);
    }

    public Integer modifyPasswordByid(Integer id, String password){
        return userMapper.modifyPasswordByid(id,password);
    }

    public Integer modifyNickNameByid(Integer id, String nickname){
        return userMapper.modifyNickNameByid(id,nickname);
    }

    public Integer modifyEmailByid(Integer id, String email){
        return userMapper.modifyEmailByid(id,email);
    }

    public Integer modifyPhoneByid(Integer id, String phone){
        return userMapper.modifyPhoneByid(id,phone);
    }

    public List<Dialogue> getDialogueListByUserId(Integer question_id){
        return userMapper.getDialogueListByUserId(question_id);
    }

    public List<Answer> getAnswerListByUserId(Integer answer_id){
        return userMapper.getAnswerListByUserId(answer_id);
    }


}
