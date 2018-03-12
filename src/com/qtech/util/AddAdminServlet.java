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
 * Servlet implementation class AddAdminServlet
 */
//访问该类的路径，要添加到form表单的action中
@WebServlet("/AddAdminServlet.do")
public class AddAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		//获取客户端提交的数据
		Map<String,String[]> map = request.getParameterMap();
		//创建业务逻辑的对象
		AdminInfoService service = new AdminInfoService();
		//调用其中的dosave方法
		boolean flag = service.doSave(map);
	    if(flag){
	         //如果flag为true，表示操作成功，把成功页面显示给用户
	         response.sendRedirect("admin/success.jsp");
	    }else{
	    	//如果flag为false,则表示操作失败，把失败页面返回给用户
	    	response.sendRedirect("admin/error.jsp");
	    }
	}

}
