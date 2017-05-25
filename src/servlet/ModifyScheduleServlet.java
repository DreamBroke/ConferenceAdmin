package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ScheduleDAO;
import models.Schedule;

public class ModifyScheduleServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ModifyScheduleServlet() {
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
		String sche_no = request.getParameter("sche_no");
		String sche_date = request.getParameter("sche_date");
		String sche_starttime = request.getParameter("sche_starttime");
		String sche_endtime = request.getParameter("sche_endtime");
		String sche_speaker = request.getParameter("sche_speaker");
		String sche_address = request.getParameter("sche_address");
		String sche_category = request.getParameter("sche_category");
		String sche_content = request.getParameter("sche_content");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Schedule sche = new Schedule();
		sche.setSche_no(Integer.parseInt(sche_no));
		sche.setSche_address(sche_address);
		sche.setSche_category(sche_category);
		sche.setSche_content(sche_content);
		sche.setSche_speaker(Integer.parseInt(sche_speaker));
		try {
			sche.setSche_date(sdf.parse(sche_date));
			sche.setSche_starttime(sdf2.parse(sche_date + " " + sche_starttime));
			sche.setSche_endtime(sdf2.parse(sche_date + " " + sche_endtime));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int i = ScheduleDAO.modifySchedule(sche);
		String message = "";
		if (i > 0) {
			message = "修改成功！";
		} else {
			message = "修改失败！";
		}
		request.setAttribute("message", message);
		request.getRequestDispatcher("conference_schedule.jsp").forward(
				request, response);
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
