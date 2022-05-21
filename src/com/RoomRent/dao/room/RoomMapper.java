package com.RoomRent.dao.room;

import com.RoomRent.pojo.Answer;
import com.RoomRent.pojo.Dialogue;
import com.RoomRent.pojo.Room;
import com.RoomRent.pojo.UserCollection;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoomMapper {

    List<Room> getRoomList();

    Room getRoomInfoById(@Param("id") Integer id);

    List<Room> getRoomListByLike(@Param("search") String search);

    List<Dialogue> getDialogueListByRoomId(@Param("id") Integer id);

    List<Answer> getAnswerByRoomId(@Param("id") Integer id);

    Integer addRoomQuestion(Dialogue dialogue);

    List<Answer> getAnswerByDialogueId(Integer id);

    Dialogue getDialogueById(Integer id);

    Integer addAnswer(Answer answer);

    UserCollection getUserCollectionById(@Param("user_id") Integer user_id, @Param("room_id") Integer room_id);

    Integer addCollection(UserCollection userCollection);

    Integer delCollectionById(@Param("user_id") Integer user_id, @Param("room_id") Integer room_id);

    List<Room> getRoomListByUserId(@Param("user_id") Integer user_id);

    List<Room> getRoomListByRentId(@Param("rent_id") Integer rent_id);

    Integer addRoom(Room room);

    Integer offRoom(@Param("id") Integer id);

    Integer delRoom(@Param("id") Integer id);

    Integer onRoom(@Param("id") Integer id);

    Integer updateRoom(Room room);

    Integer delanswer(@Param("room_id") Integer room_id);

    Integer deldialogue(@Param("room_id") Integer room_id);

    Integer delcollection(@Param("room_id") Integer room_id);

    Integer delquestion(@Param("id") Integer id);

    Integer delAnswerByid(@Param("id") Integer id);

    Integer delAnswerByQuestionId(@Param("question_id") Integer question_id);
}
