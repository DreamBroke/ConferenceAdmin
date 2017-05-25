package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.Scope;
import jdbc.ControlDB;

public class ScopeDAO {

	public static String getScopeNameByNo(String no){
		String str = "";
		String sql = "select sco_name from scope where sco_no = " + no;
		ResultSet rs = null;
		rs = ControlDB.executeQuery(sql);
		try {
			if(rs.next()){
				str = rs.getString("sco_name");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
	
	public static ArrayList<Scope> getAllScope(){
		ArrayList<Scope> al = new ArrayList<Scope>();
		ResultSet rs = null;
		String sql = "select * from scope";
		rs = ControlDB.executeQuery(sql);
		Scope s = null;
		try {
			while(rs.next()){
				s = new Scope();
				s.setSco_createman(rs.getInt("sco_createman"));
				s.setSco_brief(rs.getString("sco_brief"));
				s.setSco_createtime(rs.getDate("sco_createtime"));
				s.setSco_name(rs.getString("sco_name"));
				s.setSco_no(rs.getInt("sco_no"));
				al.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	
}
