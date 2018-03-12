<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
    *{
       font-size:12px;
    }
    table{
       width:70%;
       border:1px solid black;
       border-collapse:collapse;
    }
    td{
       border:1px solid black;
       text-align:center;
    }
    
</style>
</head>
<body>
    <center>
    <form action="${pageContext.request.contextPath}/AdminDeleteServlet.do" method="post" onsubmit="return checkIds();">
      <table>
			<tr>
			    <!-- 把复选框的选择情况传递给函数，如果复选框选中了传递true
			                       否则传递false -->
				<td><input type="checkbox" onclick="selectCheckBox(this.checked)"></td>
				<td>编号</td>
				<td>姓名</td>
				<td>电话</td>
				<td>状态</td>
				<td>操作</td>
			</tr>
			<!-- 循环遍历list -->
			<c:forEach var="admin" items="${admins}">
			    <tr>
			       <td>
			           <!-- value中的a_id就是数据表中的列名 -->
			          <input type="checkbox" name="a_id" value="${admin.a_id}">
			       </td>
					<td>${admin.a_num}</td>
					<td>${admin.a_name}</td>
					<td>${admin.a_tel}</td>
					<td>${admin.a_status}</td>
					<td>
					    <a href="#" onclick="doDelete('${admin.a_id}')">删除</a>
					    <a href="${pageContext.request.contextPath}/AdminsToEditServlet.do?a_id=${admin.a_id}">修改</a>
					</td>
				</tr>
			</c:forEach>
			<tr>
			    <td colspan="6">
			        <input type="submit" value="批量删除">
			    </td>
			</tr>
		</table>
    </form>
    </center>
</body>
<script type="text/javascript">
    function selectCheckBox(flag){
    	var chs=document.getElementsByName("a_id");
    	//遍历所有name属性为a_id的控件
    	for(var i=0;i<chs.length;i++){
    		//获取下标为i的控件
    		chs[i].checked=flag;
    	}
    }
    function checkIds(){
    	var chs=document.getElementsByName("a_id");
    	var flag=false;
    	for(var i=0;i<chs.length;i++){
    		if(chs[i].checked==true){
    			flag=true;
    			break;
    		}
    	}
    	if(flag){
    		return true;
    	}
    	alert("请选择要要删除的数据");
    	return false;
    }
    
    function doDelete(id){
    	var f=confirm("你是否要删除该记录？");
    	if(f){
    		window.location.href="${pageContext.request.contextPath}/AdminDeleteServlet.do?a_id="+id;
    	}
    }
</script>
</html>