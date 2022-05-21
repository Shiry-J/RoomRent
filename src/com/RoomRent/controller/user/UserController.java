package com.RoomRent.controller.user;

import com.RoomRent.pojo.Answer;
import com.RoomRent.pojo.Dialogue;
import com.RoomRent.pojo.User;
import com.RoomRent.service.room.RoomService;
import com.RoomRent.service.user.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {

    //log4j
    private static final Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private RoomService roomService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String Show(Model model, HttpSession session){
        User user = new User();
        user.setUsername("游客");
        user.setNickname("游客");
        session.setAttribute("userSession", user);
        model.addAttribute("roomList",roomService.getRoomList());
        return "frame";
    }

    @RequestMapping("/dologin.html")
    public String doLoginPage(@RequestParam(value = "username") String username,
                              @RequestParam(value = "password") String password,
                              Model model,
                              HttpSession session){
        logger.debug("enter UserController=============>doLoginPage method");
        User user = userService.getUserByUserName(username);
        if (user == null || !user.getPassword().equals(password)){
            model.addAttribute("error","用户名或者密码错误，请重新输入");
        }else{
            session.setAttribute("userSession", user);
            model.addAttribute("roomList",roomService.getRoomList());
            return "frame";
        }
        return "login";
    }

    @RequestMapping("/register.html")
    public String register(){
        logger.debug("enter UserController=============>RegisterPage");
        return "register";
    }

    @RequestMapping("/doRegister.html")
    public String doRegisterPage(@RequestParam(value = "username") String username,
                             @RequestParam(value = "nickname") String nickname,
                             @RequestParam(value = "password1") String password1,
                             @RequestParam(value = "password2") String password2,
                             @RequestParam(value = "phone") String phone,
                             @RequestParam(value = "email") String email){
        logger.debug("enter UserController=============>doRegisterPage method");
        if (password1.equals(password2)){
            User user = new User();
            Date date = new Date();
            user.setUsername(username);
            user.setNickname(nickname);
            user.setPassword(password1);
            user.setPhone(phone);
            user.setEmail(email);
            user.setType(0);
            user.setGmt_create(date);
            user.setGmt_modified(date);
            int is_add = userService.addUser(user);
            if (is_add == 1){
                return "login";
            }else {
                return "register";
            }
        }
        return "register";
    }

    @RequestMapping("/backLogin.html")
    public String BackLoginPage(){
        logger.debug("enter UserController=============>ExitLoginPage method");
        return "login";
    }

    @RequestMapping("/Login.html")
    public String LoginPage(HttpSession session, Model model){
        logger.debug("enter UserController=============>ExitLoginPage method");
        User user = (User) session.getAttribute("userSession");
        if (user.getUsername().equals("游客")){
            return "login";
        }
        User newuser = new User();
        newuser.setUsername("游客");
        newuser.setNickname("游客");
        session.setAttribute("userSession", newuser);
        model.addAttribute("roomList",roomService.getRoomList());
        return "frame";
    }

    @RequestMapping("/back")
    public String BackFrame(Model model){
        logger.debug("enter UserController=============>BackFrame method");
        model.addAttribute("roomList",roomService.getRoomList());
        return "frame";
    }

    @RequestMapping("userinfo.html")
    public String userInfoPage(HttpSession session){
        logger.debug("enter UserController=============>userInfoPage method");
        User user = (User) session.getAttribute("userSession");
        if (user.getUsername().equals("游客")){
            return "login";
        }
        return "userinfo";
    }

    @RequestMapping("modifyPassword.html")
    public String modifyPassword(){
        logger.debug("enter UserController=============>modifyPasswordPage method");
        return "modifyPassword";
    }

    @RequestMapping("doModifyPassword")
    public String doModifyPassword(@RequestParam(value = "newPas1") String password1,
                                   @RequestParam(value = "newPas2") String password2,
                                   HttpSession session){
        logger.debug("enter UserController=============>doModifyPassword method");
        if (password1.equals(password2)){
            User user = (User) session.getAttribute("userSession");
            int i = userService.modifyPasswordByid(user.getId(),password1);
            session.removeAttribute("userSession");
            return "login";
        }
        return "modifyPassword";
    }

    @RequestMapping("modifyNickName.html")
    public String modifyNickName(){
        logger.debug("enter UserController=============>modifyNickNamePage method");
        return "modifyNickName";
    }

    @RequestMapping("domodifyNickName")
    public String doModifyNickName(@RequestParam(value = "newNickName") String newNickName,
                                   HttpSession session){
        logger.debug("enter UserController=============>doModifyNickName method");
        User user = (User) session.getAttribute("userSession");
        int i = userService.modifyNickNameByid(user.getId(),newNickName);
        user.setNickname(newNickName);
        session.setAttribute("userSession",user);
        return "userinfo";
    }

    @RequestMapping("modifyEmail.html")
    public String modifyEmail(){
        logger.debug("enter UserController=============>modifyEmailPage method");
        return "modifyEmail";
    }

    @RequestMapping("doModifyEmail")
    public String doModifyEmail(@RequestParam(value = "email") String email,
                                   HttpSession session){
        logger.debug("enter UserController=============>doModifyEmail method");
        User user = (User) session.getAttribute("userSession");
        int i = userService.modifyEmailByid(user.getId(),email);
        user.setEmail(email);
        session.setAttribute("userSession",user);
        return "userinfo";
    }

    @RequestMapping("modifyPhone.html")
    public String modifyPhone(){
        logger.debug("enter UserController=============>modifyPhonePage method");
        return "modifyPhone";
    }

    @RequestMapping("doModifyPhone")
    public String doModifyPhone(@RequestParam(value = "phone") String phone,
                                HttpSession session){
        logger.debug("enter UserController=============>doModifyEmail method");
        User user = (User) session.getAttribute("userSession");
        int i = userService.modifyPhoneByid(user.getId(),phone);
        user.setPhone(phone);
        session.setAttribute("userSession",user);
        return "userinfo";
    }

    @RequestMapping("MyQuestionPage")
    public String MyQuestionPage(HttpSession session, Model model){
        logger.debug("enter UserController=============>MyQuestionPage method");
        User user = (User) session.getAttribute("userSession");
        if (user.getUsername().equals("游客")){
            return "login";
        }
        List<Dialogue> dialogueList = userService.getDialogueListByUserId(user.getId());
        model.addAttribute("questionSession",dialogueList);
        return "myQuestion";
    }

    @RequestMapping("MyAnswerPage")
    public String MyAnswerPage(HttpSession session, Model model){
        logger.debug("enter UserController=============>MyAnswerPage method");
        User user = (User) session.getAttribute("userSession");
        if (user.getUsername().equals("游客")){
            return "login";
        }
        List<Answer> answerList = userService.getAnswerListByUserId(user.getId());
        model.addAttribute("answerSession",answerList);
        return "myAnswer";
    }

}
