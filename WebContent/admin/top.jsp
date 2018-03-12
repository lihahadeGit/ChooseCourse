<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
    *{
       margin:0px;
    }
    #top{
       font-size:50px;
       text-align:center;
       font-style:italic;
       letter-spacing:80px;
       line-height:80px;
    }
    #welcomeInfo{
       text-align:right;
    }
    body{
       background-color:#d5e7f3;
    }
</style>
</head>
<body>
    <div id="top">
                     学生管理系统
    </div>
    <div id="welcomeInfo">
                    欢迎您，【${adminInfo.a_name}】&nbsp;&nbsp;
        <a href="${pageContext.request.contextPath}/ExitServlet.do" target="_top">安全退出</a>
    </div>
</body>
</html>