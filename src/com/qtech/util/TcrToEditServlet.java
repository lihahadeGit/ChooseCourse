package com.qtech.util;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qtech.service.AdminInfoService;
import com.qtech.service.TeacherInfoService;

/**
 * Servlet implementation class TcrToEditServlet
 */
@WebServlet("/TcrToEditServlet.do")
public class TcrToEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TcrToEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String[]> param = request.getParameterMap();
		TeacherInfoService service = new TeacherInfoService();
		Map<String, String> tcr = service.findByParam(param);
		HttpSession session = request.getSession();
		session.setAttribute("tcr", tcr);
		//System.out.println("haha");
		response.sendRedirect("admin/editteacher.jsp");
	}

}
