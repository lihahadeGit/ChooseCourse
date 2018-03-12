<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
     .menu{
        font-size:15px;
        width:200px;
        height:30px;
        line-height:30px;
        padding-left:5px;
        letter-spacing:3px;
     }
     
     .item{
        font-size:12px;
        height:20px;
        padding-left: 10px;
        line-height: 10px;
        letter-spacing: 1px;
     }
     
     *{
        background-color:#d5e7f3;
     }
     a{
        text-decoration:none;
        cursor:pointer;
     }
     /*鼠标悬停*/
     a:hover{
        font-style:italic;
     }
</style>
</head>
<body>
	<div class="menu">教师维护</div>
	<div>
		<table>
			<tr>
				<td class="item" ><a href="addteacher.jsp" target="main">添加教师</a></td>
			</tr>
			<tr>
				<td class="item"><a href="${pageContext.request.contextPath}/SearchTcrServlet.do" target="main">查询教师</a></td>
			</tr>
		</table>
	</div>

	<div class="menu">课程维护</div>
	<div>
		<table>
			<tr>
				<td class="item">添加课程</td>
			</tr>
			<tr>
				<td class="item">查询课程</td>
			</tr>
		</table>
	</div>
	
	<div class="menu">学生维护</div>
	<div>
		<table>
			<tr>
				<td class="item">添加学生</td>
			</tr>
			<tr>
				<td class="item">查询学生</td>
			</tr>
		</table>
	</div>
	
	<div class="menu">任课维护</div>
	<div>
		<table>
			<tr>
				<td class="item">添加任课</td>
			</tr>
			<tr>
				<td class="item">查询任课</td>
			</tr>
		</table>
	</div>

	<div class="menu">管理员维护</div>
	<div>
		<table>
			<tr>
				<td class="item"><a href="addadmin.jsp" target="main">添加管理员</a></td>
			</tr>
			<tr>
				<td class="item"><a href="${pageContext.request.contextPath}/SearchAdminServlet.do" target="main">查询管理员</a></td>
			</tr>
		</table>
	</div>
</body>
</html>