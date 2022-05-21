package com.RoomRent.service.room;

import com.RoomRent.pojo.Answer;
import com.RoomRent.pojo.Dialogue;
import com.RoomRent.pojo.Room;
import com.RoomRent.pojo.UserCollection;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface RoomService{

    List<Room> getRoomList();

    Room getRoomInfoById(Integer id);

    List<Room> getRoomListByLike(String search);

    List<Dialogue> getDialogueListByRoomId(Integer id);

    List<Answer> getAnswerByRoomId(Integer id);

    Integer addRoomQuestion(Dialogue dialogue);

    List<Answer> getAnswerByDialogueId(Integer id);

    Dialogue getDialogueById(Integer id);

    Integer addAnswer(Answer answer);

    UserCollection getUserCollectionById(Integer user_id,Integer room_id);

    Integer addCollection(UserCollection userCollection);

    Integer delCollectionById(Integer user_id,Integer room_id);

    List<Room> getRoomListByUserId(Integer user_id);

    List<Room> getRoomListByRentId(Integer rent_id);

    String saveimage(MultipartFile file) throws IOException;

    Integer addRoom(Room room);

    Integer offRoom(Integer id);

    Integer delRoom(Integer id);

    Integer onRoom(Integer id);

    Integer updateRoom(Room room);

    Integer delanswer(Integer room_id);

    Integer deldialogue(Integer room_id);

    Integer delcollection(Integer room_id);

    Integer delquestion(Integer id);

    Integer delAnswerByid(Integer id);

    Integer delAnswerByQuestionId(Integer question_id);
}
