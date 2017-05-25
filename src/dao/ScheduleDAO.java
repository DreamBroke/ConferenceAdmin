package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import jdbc.ControlDB;
import models.Schedule;

public class ScheduleDAO {

	public static ArrayList<Schedule> getAllSchedule() {
		ArrayList<Schedule> al = new ArrayList<Schedule>();
		ResultSet rs = null;
		String sql = "select * from schedule";
		Schedule sc = null;
		rs = ControlDB.executeQuery(sql);
		try {
			while (rs.next()) {
				sc = new Schedule();
				sc.setSche_no(rs.getInt("sche_no"));
				sc.setSche_date(rs.getDate("sche_date"));
				sc.setSche_starttime(rs.getTime("sche_starttime"));
				sc.setSche_endtime(rs.getTime("sche_endtime"));
				sc.setSche_speaker(rs.getInt("sche_speaker"));
				if (rs.getString("sche_content") == null
						|| rs.getString("sche_content").equals("")) {
					sc.setSche_content("无");
				} else {
					sc.setSche_content(rs.getString("sche_content"));
				}
				if (rs.getString("sche_address") == null
						|| rs.getString("sche_address").equals("")) {
					sc.setSche_address("无");
				} else {
					sc.setSche_address(rs.getString("sche_address"));
				}
				if (rs.getString("sche_category") == null
						|| rs.getString("sche_category").equals("")) {
					sc.setSche_category("无");
				} else {
					sc.setSche_category(rs.getString("sche_category"));
				}
				al.add(sc);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return al;
	}
	
	public static Schedule getScheduleByNo(String no){
		Schedule sc = null;
		ResultSet rs = null;
		String sql = "select * from schedule where sche_no = " + no;
		rs = ControlDB.executeQuery(sql);
		try {
			if (rs.next()) {
				sc = new Schedule();
				sc.setSche_no(rs.getInt("sche_no"));
				sc.setSche_date(rs.getDate("sche_date"));
				sc.setSche_starttime(rs.getTime("sche_starttime"));
				sc.setSche_endtime(rs.getTime("sche_endtime"));
				sc.setSche_speaker(rs.getInt("sche_speaker"));
				if (rs.getString("sche_content") == null
						|| rs.getString("sche_content").equals("")) {
					sc.setSche_content("无");
				} else {
					sc.setSche_content(rs.getString("sche_content"));
				}
				if (rs.getString("sche_address") == null
						|| rs.getString("sche_address").equals("")) {
					sc.setSche_address("无");
				} else {
					sc.setSche_address(rs.getString("sche_address"));
				}
				if (rs.getString("sche_category") == null
						|| rs.getString("sche_category").equals("")) {
					sc.setSche_category("无");
				} else {
					sc.setSche_category(rs.getString("sche_category"));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sc;
	}
	
	public static int modifySchedule(Schedule sche){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql = "UPDATE `conferencemanage`.`schedule` SET `sche_date` = '"
				+ format.format(sche.getSche_date())
				+ "', `sche_starttime` = '"
				+ format.format(sche.getSche_starttime())
				+ "', `sche_endtime` = '"
				+ format.format(sche.getSche_endtime())
				+ "', `sche_speaker` = '"
				+ sche.getSche_speaker()
				+ "', `sche_content` = '"
				+ sche.getSche_content()
				+ "', `sche_address` = '"
				+ sche.getSche_address()
				+ "', `sche_category` = '"
				+ sche.getSche_category() + "' WHERE `sche_no` = " + sche.getSche_no();
		int i = ControlDB.executeUpdate(sql);
		return i;
	}

	public static int addSchedule(Schedule sche){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql = "INSERT INTO `conferencemanage`.`schedule` (`sche_date`,`sche_starttime`,`sche_endtime`,`sche_speaker`,`sche_content`,`sche_address`,`sche_category`) VALUES ('"
				+ format.format(sche.getSche_date()) 
				+ "', '"
				+ format.format(sche.getSche_starttime()) 
				+ "', '"
				+ format.format(sche.getSche_endtime()) 
				+ "', '"
				+ sche.getSche_speaker()
				+ "', '"
				+ sche.getSche_content()
				+ "', '"
				+ sche.getSche_address()
				+ "', '"
				+ sche.getSche_category() + "')";
		int i = ControlDB.executeUpdate(sql);
		return i;
	}
	
	public static int deleteScheduleByNo(String no){
		String sql = "DELETE FROM `conferencemanage`.`schedule` WHERE sche_no = " + no;
		int i = ControlDB.executeUpdate(sql);
		return i;
	}
	
}
