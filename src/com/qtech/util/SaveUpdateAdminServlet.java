package com.qtech.util;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qtech.service.AdminInfoService;

/**
 * Servlet implementation class SaveUpdateAdminServlet
 */
@WebServlet("/SaveUpdateAdminServlet.do")
public class SaveUpdateAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveUpdateAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Map< String, String[]> param = request.getParameterMap();
		AdminInfoService service = new AdminInfoService();
		boolean flag = service.doUpdate(param);
		if(flag){
			response.sendRedirect("admin/success.jsp");
		}
		else{
			response.sendRedirect("admin/error.jsp");
		}
	}

}
