<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
<style type="text/css">
.input {
	width: 150px;
	border: 1px solid blue;
}

.btn {
	width: 70px;
	height: 30px;
	margin-right: 10px;
	margin-top: 10px;
	color: gray;
}

#main{
    position:absolute;
    width:300px;
    height:200px;
    background-color:green;
    top:50%;
    left:50%;
    margin-top:-100px;
    margin-left:-150px;
}

</style>
</head>
<body>
	<div id="main">
		<form action="${pageContext.request.contextPath}/AdminLoginServlet.do" method="post">
			<table name="table1">
			    <tr height="50px"></tr>
				<tr>
				    <td width="20px"></td>
					<td>账号：</td>
					<td><input class="input" type="text" name="a_num" id="a_num"></td>
					<td>
						<!-- 显示错误信息 -->
						<div id="num_msg"></div>
					</td>
				</tr>
				<tr>
				    <td width="20px"></td>
					<td>密码：</td>
					<td><input class="input" type="password" name="a_pass"
						id="a_pass"></td>
					<td>
						<!-- 显示错误信息 -->
						<div id="pass_msg"></div>
					</td>
				</tr>
				<tr>
				    <td width="20px"></td>
					<td></td>
					<td>
						<!-- 如果该控件的值不需要保存在数据库中，
                                                               那么该控件 必须不提供name属性--> <input
						type="submit" class="btn" value="完成"> <input type="reset"
						class="btn" value="重置">
					</td>
					<td></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>