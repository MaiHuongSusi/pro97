package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import libralies.ConnectDBLibrary;
import model.bean.Skills;

public class SkillDao {

	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public List<Skills> getSkills(){
		List<Skills> skills= new ArrayList<>();
		conn= ConnectDBLibrary.getConnection();
		try{
			String sql= "select * from skills";
			pst= conn.prepareStatement(sql);
			rs= pst.executeQuery();
			while(rs.next()){
				Skills skill= new Skills(rs.getInt("skill_id"), rs.getString("name"));
				skills.add(skill);
			}
		}
		catch(SQLException e){
			System.out.println(e);
		}
		return skills;
	}
	public String getSkillById(int id){
		String name= "";
		conn= ConnectDBLibrary.getConnection();
		try{
			String sql= "select name from skills where skill_id =?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			rs= pst.executeQuery();
			while(rs.next()){
				name=rs.getString("name");
			}
		}catch(SQLException e){
			System.out.println(e);
		}
		return name;
		
	}
}
