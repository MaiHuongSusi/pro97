package model.bo;

import java.io.File;
import java.util.ArrayList;

import model.bean.Rooms;
import model.dao.RoomDao;

public class RoomBo {
	
RoomDao roomDao;
	
	public void addRooms(Rooms rooms){
		RoomDao roomDao = new RoomDao();
		
		roomDao.addRoom(rooms);
	}
	
	public void editRooms(Rooms rooms){
		RoomDao roomDao = new RoomDao();
		
		roomDao.editRoom(rooms);
	}
	
	public Rooms getOneRoom(int roomId){
		roomDao = new RoomDao();
		return roomDao.getOneRoom(roomId);
	}
	
	public boolean checkRoomnameAlreadyExistsEdit(String name) {
		roomDao = new RoomDao();
		ArrayList<Rooms> rooms = roomDao.getRooms();
		
		for(Rooms room: rooms){
			if(room.getName().equals(name)){
				return true;
			}
		}
		return false;
	}
	public ArrayList<Rooms> getRooms(){
		roomDao = new RoomDao();
		return roomDao.getRooms();
	}
}