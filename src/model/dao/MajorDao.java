package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import libralies.ConnectDBLibrary;
import model.bean.Majors;
import model.bean.Rooms;

public class MajorDao {

	private Connection conn;
	private Statement st;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public int addMajor(Majors majors) {
		int kq = 0;
		conn = ConnectDBLibrary.getConnection();
		try{
			String sql = "insert into majors value (0,?)";
			
			pst = conn.prepareStatement(sql);
			pst.setString(1, majors.getName());
			kq = pst.executeUpdate();
		}
		catch(SQLException e){
			System.out.println(e);
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		return kq;
		
	}
	
	public Majors getOneMajor(int majorId) {
		int kq = 0;
		conn = ConnectDBLibrary.getConnection();
		Majors onemajor = new Majors();
		try{
			String sql = "select * from majors where major_id = ?";
			
			pst = conn.prepareStatement(sql);
			pst.setInt(1, majorId);
			rs = pst.executeQuery();
			while (rs.next()) {
				onemajor.setMajorId(majorId);;
				onemajor.setName(rs.getInt(2));;
			}
			
		} catch (SQLException e) {
			System.out.println(e);
		}
		finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		return onemajor;
	}
	
	public int editMajor(Majors majors) {
		int kq = 0;
		conn = ConnectDBLibrary.getConnection();
		try{
			String sql = "UPDATE majors SET name = ? WHERE major_id=?";
			
			pst = conn.prepareStatement(sql);
			pst.setInt(1, majors.getMajorId());
			pst.setString(2, majors.getName());
			kq = pst.executeUpdate();
		}
		catch(SQLException e){
			System.out.println(e);
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		return kq;
		
	}
			
	
	public ArrayList<Majors> getMajors() {
		ArrayList<Majors> majors = new ArrayList<>();
		
		conn = ConnectDBLibrary.getConnection();
		
		String sql = "select * from majors";
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Majors major = new Majors(rs.getInt("major_id"), rs.getString("name"));
				majors.add(major);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			ConnectDBLibrary.close(rs, pst, conn);
		}
		
		return majors;
	}
}