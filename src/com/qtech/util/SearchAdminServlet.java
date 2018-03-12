package com.qtech.util;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.qtech.service.AdminInfoService;

/**
 * Servlet implementation class SearchAdminServlet
 */
@WebServlet("/SearchAdminServlet.do")
public class SearchAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//添加doPost方法的调用，不用再考虑提交方式
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInfoService service = new AdminInfoService();
		List<Map<String,String>> admins = service.findAll();
        //把servlet中的数据传递给jsp页面，利用会话机制HttpSession
		//HttpSession session = request.getSession();
		HttpSession session = request.getSession();
		session.setAttribute("admins",admins);
		response.sendRedirect("admin/findadmin.jsp");
	}

}
