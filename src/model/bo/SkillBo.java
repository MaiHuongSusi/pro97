package model.bo;

import java.util.List;

import model.bean.Skills;
import model.dao.SkillDao;

public class SkillBo {
	SkillDao skillDao= new SkillDao();
	public List<Skills> getSkills(){
		return skillDao.getSkills();
	}
	public String getSkillById(int id){
		return skillDao.getSkillById(id);
	}

}
