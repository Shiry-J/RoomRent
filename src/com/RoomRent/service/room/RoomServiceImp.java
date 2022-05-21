package com.RoomRent.service.room;

import com.RoomRent.dao.room.RoomMapper;
import com.RoomRent.pojo.Answer;
import com.RoomRent.pojo.Dialogue;
import com.RoomRent.pojo.Room;
import com.RoomRent.pojo.UserCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class RoomServiceImp implements RoomService{

    @Autowired
    private RoomMapper roomMapper;

    public List<Room> getRoomList(){
        return roomMapper.getRoomList();
    }

    public Room getRoomInfoById(Integer id){
        return roomMapper.getRoomInfoById(id);
    }

    public List<Room> getRoomListByLike(String search){
        return roomMapper.getRoomListByLike(search);
    }

    public List<Dialogue> getDialogueListByRoomId(Integer id){
        return roomMapper.getDialogueListByRoomId(id);
    }

    public List<Answer> getAnswerByRoomId(Integer id){
        return roomMapper.getAnswerByRoomId(id);
    }

    public Integer addRoomQuestion(Dialogue dialogue){
        return roomMapper.addRoomQuestion(dialogue);
    }

    public Dialogue getDialogueById(Integer id){
        return roomMapper.getDialogueById(id);
    }

    public List<Answer> getAnswerByDialogueId(Integer id){
        return roomMapper.getAnswerByDialogueId(id);
    }

    public Integer addAnswer(Answer answer){
        return roomMapper.addAnswer(answer);
    }

    public UserCollection getUserCollectionById(Integer user_id, Integer room_id){
        return roomMapper.getUserCollectionById(user_id,room_id);
    }

    public Integer addCollection(UserCollection userCollection){
        return roomMapper.addCollection(userCollection);
    }

    public Integer delCollectionById(Integer user_id,Integer room_id){
        return roomMapper.delCollectionById(user_id,room_id);
    }

    public List<Room> getRoomListByUserId(Integer user_id){
        return roomMapper.getRoomListByUserId(user_id);
    }

    public List<Room> getRoomListByRentId(Integer rent_id){
        return roomMapper.getRoomListByRentId(rent_id);
    }

    //保存房间图片
    public String saveimage(MultipartFile image) throws IOException {
        String filePath="D:/IdeaProjects/RoomRent/web/statics/img/saveimg";
        String localPath="/statics/img/saveimg";
        String originalFilename = image.getOriginalFilename();
        String newFileName = UUID.randomUUID()+originalFilename;
        File targetFile = new File(filePath,newFileName);
        image.transferTo(targetFile);
        return newFileName;
    }

    public Integer addRoom(Room room){
        return roomMapper.addRoom(room);
    }

    public Integer offRoom(Integer id){
        return roomMapper.offRoom(id);
    }

    public Integer delRoom(Integer id){
        return roomMapper.delRoom(id);
    }

    public Integer onRoom(Integer id){
        return roomMapper.onRoom(id);
    }

    public Integer updateRoom(Room room){
        return roomMapper.updateRoom(room);
    }

    public Integer delanswer(Integer room_id){
        return roomMapper.delanswer(room_id);
    }

    public Integer deldialogue(Integer room_id){
        return roomMapper.deldialogue(room_id);
    }

    public Integer delcollection(Integer room_id){
        return roomMapper.delcollection(room_id);
    }

    public Integer delquestion(Integer id){
        return roomMapper.delquestion(id);
    }

    public Integer delAnswerByid(Integer id){
        return roomMapper.delAnswerByid(id);
    }

    public Integer delAnswerByQuestionId(Integer question_id){
        return roomMapper.delAnswerByQuestionId(question_id);
    }

}
