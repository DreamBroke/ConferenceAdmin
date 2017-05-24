package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jdbc.ControlDB;
import models.Teacher;

public class TeacherDAO {

	public static String getTeacherNameByNo(int no){
		ResultSet rs = null;
		String sql = "select tea_name from teacher where tea_no = " + no;
		rs = ControlDB.executeQuery(sql);
		String name = "";
		try {
			if(rs.next()){
				name = rs.getString("tea_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return name;
	}
	
	public static Teacher getTeacherByNo(int no){
		ResultSet rs = null;
		String sql = "select * from teacher where tea_no = " + no;
		rs = ControlDB.executeQuery(sql);
		Teacher t = null;
		try {
			while(rs.next()){
				t = new Teacher();
				t.setTea_name(rs.getString("tea_name"));
				t.setTea_no(rs.getInt("tea_no"));
				t.setTea_username(rs.getString("tea_username"));
				t.setTea_password(rs.getString("tea_password"));
				t.setTea_sex(rs.getString("tea_sex"));
				t.setTea_position(rs.getString("tea_position"));
				t.setTea_professional(rs.getInt("tea_professional"));
				t.setTea_email(rs.getString("tea_email"));
				t.setTea_tel(rs.getString("tea_tel"));
				t.setTea_qq(rs.getString("tea_qq"));
				t.setTea_scope(rs.getInt("tea_scope"));
				t.setTea_realm(rs.getInt("tea_realm"));
				t.setTea_jurisdiction(rs.getInt("tea_jurisdiction"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return t;
	}
	
	public static ArrayList<Teacher> getAllTeacher(){
		ArrayList<Teacher> al = new ArrayList<>();
		String sql = "select * from teacher";
		ResultSet rs = null;
		Teacher t = null;
		rs = ControlDB.executeQuery(sql);
		try {
			while(rs.next()){
				t = new Teacher();
				t.setTea_name(rs.getString("tea_name"));
				t.setTea_no(rs.getInt("tea_no"));
				t.setTea_username(rs.getString("tea_username"));
				t.setTea_password(rs.getString("tea_password"));
				t.setTea_sex(rs.getString("tea_sex"));
				t.setTea_position(rs.getString("tea_position"));
				t.setTea_professional(rs.getInt("tea_professional"));
				t.setTea_email(rs.getString("tea_email"));
				t.setTea_tel(rs.getString("tea_tel"));
				t.setTea_qq(rs.getString("tea_qq"));
				t.setTea_scope(rs.getInt("tea_scope"));
				t.setTea_realm(rs.getInt("tea_realm"));
				t.setTea_jurisdiction(rs.getInt("tea_jurisdiction"));
				al.add(t);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	
	public static Teacher doLogin(String username, String password) {
		Teacher t = null;
		String sql = "select * from teacher where tea_username = ? and tea_password = ?";
		ResultSet rs = null;
		String[] args = { username, password };
		rs = ControlDB.executeQuery(sql, args);
		try {
			while(rs.next()){
				t = new Teacher();
				t.setTea_name(rs.getString("tea_name"));
				t.setTea_no(rs.getInt("tea_no"));
				t.setTea_username(rs.getString("tea_username"));
				t.setTea_password(rs.getString("tea_password"));
				t.setTea_sex(rs.getString("tea_sex"));
				t.setTea_position(rs.getString("tea_position"));
				t.setTea_professional(rs.getInt("tea_professional"));
				t.setTea_email(rs.getString("tea_email"));
				t.setTea_tel(rs.getString("tea_tel"));
				t.setTea_qq(rs.getString("tea_qq"));
				t.setTea_scope(rs.getInt("tea_scope"));
				t.setTea_realm(rs.getInt("tea_realm"));
				t.setTea_jurisdiction(rs.getInt("tea_jurisdiction"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return t;
	}
}
