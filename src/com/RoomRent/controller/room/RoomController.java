package com.RoomRent.controller.room;

import com.RoomRent.controller.user.UserController;
import com.RoomRent.pojo.*;
import com.RoomRent.service.room.RoomService;
import com.RoomRent.service.user.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Controller
public class RoomController {

    //log4j
    private static final Logger logger = Logger.getLogger(UserController.class);

    @Autowired
    private RoomService roomService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/roominfo.html")
    public String roominfo(HttpServletRequest request,
                           HttpSession session,
                           Model model){
        logger.debug("enter RoomController============>showRoomInfo method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        Room roomInfo = this.roomService.getRoomInfoById(id);
        if(roomInfo != null){
            //收藏信息
            User user = (User) session.getAttribute("userSession");
            if (user.getUsername().equals("游客")){
                return "login";
            }
            UserCollection collection = this.roomService.getUserCollectionById(user.getId(),id);
            if (collection!=null){
                model.addAttribute("is_collected",1);
            }else{
                model.addAttribute("is_collected",0);
            }
            //获取房间信息
            model.addAttribute("RoomInfo", roomInfo);
            List<Dialogue> dialogue = this.roomService.getDialogueListByRoomId(id);
            //获取房间问题信息
            model.addAttribute("Dialogue", dialogue);
            //获取问题答案
            List<Answer> answer = this.roomService.getAnswerByRoomId(id);
            model.addAttribute("Answer", answer);
            return "roominfo";
        }
        return "frame";
    }

    @RequestMapping(value = "/do_search.html")
    public String RoomSearch(@RequestParam(value = "search") String search, Model model){
        logger.debug("enter RoomController============>showRoomsearch method");
        if (search==null|| search.equals("")){
            model.addAttribute("roomList",roomService.getRoomList());
            return "frame";
        }
        List<Room> roomList = roomService.getRoomListByLike(search);
        model.addAttribute("RoomInfoSearch",roomList);
        return "search";
    }

    @RequestMapping(value = "/addQuestionPage")
    public String addQuestionPage(HttpServletRequest request,Model model){
        logger.debug("enter RoomController============>addQuestionPage method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        Room room = roomService.getRoomInfoById(id);
        model.addAttribute("question_Room", room);
        return "question";
    }

    @RequestMapping(value = "/addQuestion")
    public String addQuestion(@RequestParam(value = "question") String question,
                              HttpServletRequest request,
                              HttpSession session,
                              Model model){
        logger.debug("enter RoomController============>addQuestion method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        User user = (User) session.getAttribute("userSession");
        Dialogue dialogue = new Dialogue();
        Date date = new Date();
        dialogue.setRoom_id(id);
        dialogue.setQuestion_id(user.getId());
        dialogue.setQuestion_content(question);
        dialogue.setGmt_create(date);
        dialogue.setGmt_modified(date);
        int i = this.roomService.addRoomQuestion(dialogue);
        model.addAttribute("RoomInfo", this.roomService.getRoomInfoById(id));
        model.addAttribute("Dialogue", this.roomService.getDialogueListByRoomId(id));
        model.addAttribute("Answer", this.roomService.getAnswerByRoomId(id));
        return "roominfo";
    }

    @RequestMapping(value = "/addAnswerPage")
    public String addAnswerPage(HttpServletRequest request,Model model){
        logger.debug("enter RoomController============>addAnswerPage method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        Integer dialogue = Integer.valueOf(request.getParameter("Dialogue"));
        model.addAttribute("Dialogue", this.roomService.getDialogueById(dialogue));
        model.addAttribute("answer_Room", this.roomService.getRoomInfoById(id));
        model.addAttribute("answer_Dialogue", this.roomService.getAnswerByDialogueId(dialogue));
        return "answer";
    }

    @RequestMapping(value = "/addAnswer")
    public String addAnswer(@RequestParam(value = "answer") String answer,
                            HttpServletRequest request,
                            HttpSession session,
                            Model model){
        logger.debug("enter RoomController============>addAnswer method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        Integer dialogue = Integer.valueOf(request.getParameter("Dialogue"));
        User user = (User) session.getAttribute("userSession");
        Date date = new Date();
        Answer ans = new Answer();
        ans.setRoom_id(id);
        ans.setAnswer_content(answer);
        ans.setQuestion_id(dialogue);
        ans.setAnswer_time(date);
        ans.setAnswer_id(user.getId());
        ans.setGmt_create(date);
        ans.setGmt_modified(date);
        int i = this.roomService.addAnswer(ans);
        model.addAttribute("Dialogue", this.roomService.getDialogueById(dialogue));
        model.addAttribute("answer_Room", this.roomService.getRoomInfoById(id));
        model.addAttribute("answer_Dialogue", this.roomService.getAnswerByDialogueId(dialogue));
        return "answer";
    }

    @RequestMapping(value = "/addCollection")
    public String addCollection(HttpServletRequest request,
                                HttpSession session,
                                Model model){
        logger.debug("enter RoomController============>addCollection method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        User user = (User) session.getAttribute("userSession");
        Date date = new Date();
        UserCollection userCollection = new UserCollection();
        userCollection.setRoom_id(id);
        userCollection.setUser_id(user.getId());
        userCollection.setGmt_create(date);
        userCollection.setGmt_modified(date);
        int i = this.roomService.addCollection(userCollection);
        UserCollection collection = this.roomService.getUserCollectionById(user.getId(),id);
        if (collection!=null){
            model.addAttribute("is_collected",1);
        }else{
            model.addAttribute("is_collected",0);
        }
        //获取房间信息
        model.addAttribute("RoomInfo", this.roomService.getRoomInfoById(id));
        List<Dialogue> dialogue = this.roomService.getDialogueListByRoomId(id);
        //获取房间问题信息
        model.addAttribute("Dialogue", dialogue);
        //获取问题答案
        List<Answer> answer = this.roomService.getAnswerByRoomId(id);
        model.addAttribute("Answer", answer);
        return "roominfo";
    }

    @RequestMapping(value = "/delCollection")
    public String delCollection(HttpServletRequest request,
                                HttpSession session,
                                Model model){
        logger.debug("enter RoomController============>delCollection method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        User user = (User) session.getAttribute("userSession");
        int i = this.roomService.delCollectionById(user.getId(), id);
        UserCollection collection = this.roomService.getUserCollectionById(user.getId(),id);
        if (collection!=null){
            model.addAttribute("is_collected",1);
        }else{
            model.addAttribute("is_collected",0);
        }
        //获取房间信息
        model.addAttribute("RoomInfo", this.roomService.getRoomInfoById(id));
        List<Dialogue> dialogue = this.roomService.getDialogueListByRoomId(id);
        //获取房间问题信息
        model.addAttribute("Dialogue", dialogue);
        //获取问题答案
        List<Answer> answer = this.roomService.getAnswerByRoomId(id);
        model.addAttribute("Answer", answer);
        return "roominfo";
    }

    @RequestMapping(value = "/MyCollectionPage")
    public String MyCollectionPage(HttpSession session,
                                   Model model){
        logger.debug("enter RoomController============>MyCollectionPage method");
        User user = (User) session.getAttribute("userSession");
        if (user.getUsername().equals("游客")){
            return "login";
        }
        List<Room> roomList = roomService.getRoomListByUserId(user.getId());
        model.addAttribute("RoomCollected", roomList);
        return "mycollection";
    }

    @RequestMapping(value = "/delSingleCollection")
    public String delSingleCollection(HttpServletRequest request,
                                      HttpSession session,
                                      Model model){
        logger.debug("enter RoomController============>delSingleCollection method");
        Integer id = Integer.valueOf(request.getParameter("id"));
        User user = (User) session.getAttribute("userSession");
        int i = this.roomService.delCollectionById(user.getId(), id);
        List<Room> roomList = roomService.getRoomListByUserId(user.getId());
        model.addAttribute("RoomCollected", roomList);
        return "mycollection";
    }

    @RequestMapping(value = "/myRoomPage")
    public String MyRoomPage(Model model,
                             HttpSession session){
        logger.debug("enter RoomController============>MyRoomPage method");
        User user = (User) session.getAttribute("userSession");
        if (user.getUsername().equals("游客")){
            return "login";
        }
        List<Room> roomList = this.roomService.getRoomListByRentId(user.getId());
        model.addAttribute("RoomListByRentId", roomList);
        return "myRoom";
    }

    @RequestMapping(value = "/addRoomPage")
    public String addRoomPage(){
        logger.debug("enter RoomController============>addRoomPage method");
        return "addRoom";
    }

    @RequestMapping(value = "/addRoom")
    public String addRoom(@RequestParam(value = "title") String title,
                          @RequestParam(value = "rent_type") String rent_type,
                          @RequestParam(value = "house_type") String house_type,
                          @RequestParam(value = "orientation") String orientation,
                          @RequestParam(value = "area") Integer area,
                          @RequestParam(value = "region") String region,
                          @RequestParam(value = "community") String community,
                          @RequestParam(value = "floor") Integer floor,
                          @RequestParam(value = "price") Double price,
                          @RequestParam(value = "content") String content,
                          @RequestParam(value = "image")MultipartFile image,
                          @RequestParam(value = "contacts")String contacts,
                          @RequestParam(value = "phone")String phone,
                          HttpSession session,
                          Model model) throws IOException {
        logger.debug("enter RoomController============>addRoom method");
        User user = (User) session.getAttribute("userSession");
        Room room = new Room();
        Date date = new Date();
        room.setRent_id(user.getId());
        room.setTitle(title);
        if (rent_type.equals("合租")){
            room.setRent_type(0);
        }
        else if(rent_type.equals("整租")){
            room.setRent_type(1);
        }
        room.setHouse_type(house_type);
        room.setOrientation(orientation);
        room.setArea(area);
        room.setRegion(region);
        room.setCommunity(community);
        room.setFloor(floor);
        room.setPrice(price);
        room.setContent(content);
        room.setImage(roomService.saveimage(image));
        room.setContacts(contacts);
        room.setPhone(phone);
        room.setIs_on(1);
        room.setGmt_create(date);
        room.setGmt_modified(date);
        int i = this.roomService.addRoom(room);
        List<Room> roomList = this.roomService.getRoomListByRentId(user.getId());
        model.addAttribute("RoomListByRentId", roomList);
        return "myRoom";
    }

    @RequestMapping(value = "/offRoom")
    public String offRoom(HttpServletRequest request,
                          HttpSession session,
                          Model model){
        logger.debug("enter RoomController============>offRoom method");
        User user = (User) session.getAttribute("userSession");
        Integer id = Integer.valueOf(request.getParameter("id"));
        int i = this.roomService.offRoom(id);
        List<Room> roomList = this.roomService.getRoomListByRentId(user.getId());
        model.addAttribute("RoomListByRentId", roomList);
        return "myRoom";
    }

    @RequestMapping(value = "/delRoom")
    public String delRoom(HttpServletRequest request,
                          HttpSession session,
                          Model model){
        logger.debug("enter RoomController============>delRoom method");
        User user = (User) session.getAttribute("userSession");
        Integer id = Integer.valueOf(request.getParameter("id"));
        int i = this.roomService.delRoom(id);
        int j = this.roomService.delanswer(id);
        int p = this.roomService.deldialogue(id);
        int a = this.roomService.delcollection(id);
        List<Room> roomList = this.roomService.getRoomListByRentId(user.getId());
        model.addAttribute("RoomListByRentId", roomList);
        return "myRoom";
    }

    @RequestMapping(value = "/onRoom")
    public String onRoom(HttpServletRequest request,
                          HttpSession session,
                          Model model){
        logger.debug("enter RoomController============>onRoom method");
        User user = (User) session.getAttribute("userSession");
        Integer id = Integer.valueOf(request.getParameter("id"));
        int i = this.roomService.onRoom(id);
        List<Room> roomList = this.roomService.getRoomListByRentId(user.getId());
        model.addAttribute("RoomListByRentId", roomList);
        return "myRoom";
    }

    @RequestMapping(value = "/updateRoomPage")
    public String updateRoomPage(HttpServletRequest request,
                                 HttpSession session,
                                 Model model){
        logger.debug("enter RoomController============>updateRoomPage method");
        User user = (User) session.getAttribute("userSession");
        Integer id = Integer.valueOf(request.getParameter("id"));
        model.addAttribute("updateRoomInfo",roomService.getRoomInfoById(id));
        return "updateRoom";
    }

    @RequestMapping(value = "/updateRoom")
    public String updateRoom(@RequestParam(value = "title") String title,
                             @RequestParam(value = "rent_type") String rent_type,
                             @RequestParam(value = "house_type") String house_type,
                             @RequestParam(value = "orientation") String orientation,
                             @RequestParam(value = "area") Integer area,
                             @RequestParam(value = "region") String region,
                             @RequestParam(value = "community") String community,
                             @RequestParam(value = "floor") Integer floor,
                             @RequestParam(value = "price") Double price,
                             @RequestParam(value = "content") String content,
                             @RequestParam(value = "image")MultipartFile image,
                             @RequestParam(value = "contacts")String contacts,
                             @RequestParam(value = "phone")String phone,
                             HttpServletRequest request,
                             HttpSession session,
                             Model model) throws IOException {
        logger.debug("enter RoomController============>onRoom method");
        User user = (User) session.getAttribute("userSession");
        Integer id = Integer.valueOf(request.getParameter("id"));
        Room orgRoom = this.roomService.getRoomInfoById(id);
        String Filename = image.getOriginalFilename();
        Room room = new Room();
        Date date = new Date();
        room.setTitle(title);
        if (Filename == null || Filename.equals("")){
            room.setImage(orgRoom.getImage());
        }else{
            room.setImage(roomService.saveimage(image));
        }
        if (rent_type.equals("合租")){
            room.setRent_type(0);
        }
        else if(rent_type.equals("整租")){
            room.setRent_type(1);
        }
        room.setId(id);
        room.setHouse_type(house_type);
        room.setOrientation(orientation);
        room.setArea(area);
        room.setRegion(region);
        room.setCommunity(community);
        room.setFloor(floor);
        room.setPrice(price);
        room.setContent(content);
        room.setContacts(contacts);
        room.setPhone(phone);
        room.setGmt_modified(date);
        int i = this.roomService.updateRoom(room);
        List<Room> roomList = this.roomService.getRoomListByRentId(user.getId());
        model.addAttribute("RoomListByRentId", roomList);
        return "myRoom";
    }

    @RequestMapping("/delQuestion")
    public String delQuestion(HttpServletRequest request,
                              HttpSession session,
                              Model model){
        User user = (User) session.getAttribute("userSession");
        Integer id = Integer.valueOf(request.getParameter("id"));
        int i = roomService.delquestion(id);
        if (i > 0){
            int a = roomService.delAnswerByQuestionId(id);
        }
        List<Dialogue> dialogueList = userService.getDialogueListByUserId(user.getId());
        model.addAttribute("questionSession", dialogueList);
        return "myQuestion";
    }

    @RequestMapping("/delAnswer")
    public String delAnswer(HttpServletRequest request,
                            HttpSession session,
                            Model model){
        User user = (User) session.getAttribute("userSession");
        Integer id = Integer.valueOf(request.getParameter("id"));
        int i = roomService.delAnswerByid(id);
        List<Answer> answers = userService.getAnswerListByUserId(user.getId());
        model.addAttribute("answerSession", answers);
        return "myAnswer";
    }

}
