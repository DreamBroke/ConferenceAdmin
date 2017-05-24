package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ConferenceDAO;
import models.Conference;

public class ModifyConferenceServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ModifyConferenceServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String host = request.getParameter("host");
		String organizer = request.getParameter("organizer");
		String co_organizer = request.getParameter("co_organizer");
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		String upstartdate = request.getParameter("upstartdate");
		String upenddate = request.getParameter("upenddate");
		String address = request.getParameter("address");
		String affair_linkman = request.getParameter("affair_linkman");
		String finance_linkman = request.getParameter("finance_linkman");
		String content = request.getParameter("content");
		String repast = request.getParameter("repast");
		String scopen = request.getParameter("scopen");
		Conference con = new Conference();
		con.setCon_address(address);
		con.setCon_affair_linkman(Integer.parseInt(affair_linkman));
		con.setCon_capital(repast);
		con.setCon_co_organizer(co_organizer);
		con.setCon_contents(content);
		try {
			con.setCon_enddate(sdf.parse(enddate));
			con.setCon_startdate(sdf.parse(startdate));
			con.setCon_upenddate(sdf2.parse(upenddate));
			con.setCon_upstartdate(sdf2.parse(upstartdate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		con.setCon_finance_linkman(Integer.parseInt(finance_linkman));
		con.setCon_host(host);
		con.setCon_name(name);
		con.setCon_no(1);
		con.setCon_organizer(organizer);
		con.setCon_repast(repast);
		con.setCon_scopen(scopen);
		ConferenceDAO.modifyConference(con);
		HttpSession session = request.getSession();
		session.setAttribute("message", "修改会议基础信息成功！");
		response.sendRedirect("conference_manage.jsp");
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
