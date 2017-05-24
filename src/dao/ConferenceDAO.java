package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import jdbc.ControlDB;
import models.Conference;

public class ConferenceDAO {
	
	public static Conference getConference(){
		ResultSet rs = null;
		String sql = "select * from conference";
		rs = ControlDB.executeQuery(sql);
		Conference con = new Conference();
		try {
			if(rs.next()){
				con.setCon_no(rs.getInt("con_no"));
				con.setCon_name(rs.getString("con_name"));
				con.setCon_host(rs.getString("con_host"));
				con.setCon_organizer(rs.getString("con_organizer"));
				con.setCon_co_organizer(rs.getString("con_co-organizer"));
				con.setCon_startdate(rs.getDate("con_startdate"));
				con.setCon_enddate(rs.getDate("con_enddate"));
				con.setCon_upstartdate(rs.getDate("con_upstartdate"));
				con.setCon_upenddate(rs.getDate("con_upenddate"));
				con.setCon_address(rs.getString("con_address"));
				con.setCon_contents(rs.getString("con_contents"));
				con.setCon_affair_linkman(rs.getInt("con_affair-linkman"));
				con.setCon_finance_linkman(rs.getInt("con_finance-linkman"));
				con.setCon_capital(rs.getString("con_capital"));
				con.setCon_repast(rs.getString("con_repast"));
				con.setCon_scopen(rs.getString("con_scopen"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	public static void modifyConference(Conference con){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		String startdate = sdf.format(con.getCon_startdate());
		String enddate = sdf.format(con.getCon_enddate());
		String upstartdate = sdf2.format(con.getCon_upstartdate());
		String upenddate = sdf2.format(con.getCon_upenddate());
		String sql = "UPDATE `conferencemanage`.`conference` SET `con_name` = '"
				+ con.getCon_name() 
				+ "', `con_host` = '"
				+ con.getCon_host() 
				+ "', `con_organizer` = '"
				+ con.getCon_organizer() 
				+ "', `con_co-organizer` = '"
				+ con.getCon_co_organizer() 
				+ "', `con_startdate` = '"
				+ startdate
				+ "', `con_enddate` = '"
				+ enddate
				+ "', `con_upstartdate` = '"
				+ upstartdate
				+ "', `con_upenddate` = '"
				+ upenddate
				+ "', `con_address` = '"
				+ con.getCon_address() 
				+ "', `con_contents` = '"
				+ con.getCon_contents() 
				+ "', `con_affair-linkman` = '"
				+ con.getCon_affair_linkman() 
				+ "', `con_finance-linkman` = '"
				+ con.getCon_finance_linkman() 
				+ "', `con_capital` = '"
				+ con.getCon_capital() 
				+ "', `con_repast` = '"
				+ con.getCon_repast() 
				+ "', `con_scopen` = '"
				+ con.getCon_scopen() + "' WHERE `con_no` = " + con.getCon_no();
		ControlDB.executeUpdate(sql);
	}
	
}
