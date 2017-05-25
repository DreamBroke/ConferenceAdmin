package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import models.Review;
import jdbc.ControlDB;

public class ReviewDAO {

	public static String getReviewProposalByrDissertation(String no){
		String sql = "SELECT rev_proposal FROM conferencemanage.review WHERE rev_dissertation = " + no;
		ResultSet rs = null;
		rs = ControlDB.executeQuery(sql);
		String str = "";
		try {
			while (rs.next()) {
				str = rs.getString("rev_proposal");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}
	
	public static int insertReview(Review rev){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sql = "INSERT INTO `conferencemanage`.`review` (`rev_dissertation`,`rev_teacher`,`rev_assigntime`) VALUES('"
				+ rev.getRev_dissertation()
				+ "', '"
				+ rev.getRev_teacher()
				+ "', '"
				+ format.format(new Date())
				+ "')";
		int i = ControlDB.executeUpdate(sql);
		return i;
	}
	
	public static Review getReviewByrDissertation(String no){
		Review rev = null;
		String sql = "SELECT * FROM conferencemanage.review WHERE rev_dissertation = " + no;
		ResultSet rs = null;
		rs = ControlDB.executeQuery(sql);
		try {
			if (rs.next()) {
				rev = new Review();
				rev.setRev_no(rs.getInt("rev_no"));
				rev.setRev_assigntime(rs.getDate("rev_assigntime"));
				rev.setRev_reviewtime(rs.getDate("rev_reviewtime"));
				rev.setRev_dissertation(rs.getInt("rev_dissertation"));
				rev.setRev_teacher(rs.getInt("rev_teacher"));
				rev.setRev_condition(rs.getInt("rev_condition"));
				rev.setRev_proposal(rs.getString("rev_proposal"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rev;
	}
	
}
