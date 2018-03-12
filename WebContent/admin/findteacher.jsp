<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
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
<body>
<center>
    <form action="${pageContext.request.contextPath}/TcrDeleteServlet.do" method="post" onsubmit="return checkIds();">
      <table>
			<tr>
			    <!-- 把复选框的选择情况传递给函数，如果复选框选中了传递true
			                       否则传递false -->
				<td><input type="checkbox" onclick="selectCheckBox(this.checked)"></td>
				<td>编号</td>
				<td>姓名</td>
				<td>性别</td>
				<td>电话</td>
				<td>生日</td>
				<td>籍贯</td>
				<td>状态</td>
				<td>操作</td>
			</tr>
			<!-- 循环遍历list -->
			<c:forEach var="tcr" items="${tcrs}">
			    <tr>
			       <td>
			           <!-- value中的a_id就是数据表中的列名 -->
			          <input type="checkbox" name="tcr_id" value="${tcr.tcr_id}">
			       </td>
					<td>${tcr.tcr_num}</td>
					<td>${tcr.tcr_name}</td>
					<td>${tcr.tcr_sex}</td>
					<td>${tcr.tcr_tel}</td>
					<td>${tcr.tcr_birth}</td>
					<td>${tcr.tcr_np}</td>
					<td>${tcr.tcr_status}</td>
					<td>
					    <a href="#" onclick="doDelete('${tcr.tcr_id}')">删除</a>
					    <a href="${pageContext.request.contextPath}/TcrToEditServlet.do?tcr_id=${tcr.tcr_id}">修改</a>
					</td>
				</tr>
			</c:forEach>
			<tr>
			    <td colspan="9">
			        <input type="submit" value="批量删除">
			    </td>
			</tr>
		</table>
    </form>
    </center>
</body>
<script type="text/javascript">
    function selectCheckBox(flag){
    	var chs=document.getElementsByName("tcr_id");
    	//遍历所有name属性为a_id的控件
    	for(var i=0;i<chs.length;i++){
    		//获取下标为i的控件
    		chs[i].checked=flag;
    	}
    }
    function checkIds(){
    	var chs=document.getElementsByName("tcr_id");
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
    		window.location.href="${pageContext.request.contextPath}/TcrDeleteServlet.do?tcr_id="+id;
    	}
    }
</script>
</html>