package com.qtech.util;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qtech.service.AdminInfoService;
import com.qtech.service.TeacherInfoService;

/**
 * Servlet implementation class TcrDeleteServlet
 */
@WebServlet("/TcrDeleteServlet.do")
public class TcrDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TcrDeleteServlet() {
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
		// TODO Auto-generated method stub
		Map<String, String[]> param=request.getParameterMap();
		TeacherInfoService service = new TeacherInfoService();
		boolean flag = service.doDelete(param);
		if(flag){
			response.sendRedirect("admin/success.jsp");
		}
		else{
			response.sendRedirect("admin/error.jsp");
		}
	}

}
