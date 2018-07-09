package model.bo;

import java.util.ArrayList;

import model.bean.Majors;
import model.bean.Rooms;
import model.dao.MajorDao;
import model.dao.RoomDao;

public class MajorBo {
	MajorDao majorDao;
	public ArrayList<Majors> getMajors() {
		MajorDao majorDao = new MajorDao();
		return majorDao.getMajors();
	}
	public boolean checkMajorNameAlreadyExistsEdit(String name) {
		majorDao = new MajorDao();
		ArrayList<Majors> majors = majorDao.getMajors();
		
		for(Majors major: majors){
			if(major.getName().equals(name)){
				return true;
			}
		}
		return false;
	}
	public void addMajors(Majors majors){
		MajorDao majorDao = new MajorDao();
		
		majorDao.addMajor(majors);
	}
	
	public void editMajors(Majors majors){
		MajorDao majorDao = new MajorDao();
		majorDao.editMajor(majors);
	}
	
	public Majors getOneMajor(int majorId){
		majorDao = new MajorDao();
		return majorDao.getOneMajor(majorId);
	}
	
}