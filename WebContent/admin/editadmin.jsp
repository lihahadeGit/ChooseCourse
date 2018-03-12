<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加管理员</title>
<style type="text/css">
   .input {
	width: 150px;
	border: 1px solid blue;
   }
   
   *{
    
   }
   
   .td{
      text-align:right;
   }
   
   .btn{
      width:60px;
      height:25px
      margin-right:10px;
      margin-top:10px;
   }
   
   #top{
      height:50px;
   }
   
   .error{
      color:red;
      width:200px;
   }

   .success{
      color:green;
      width:200px;
   }
</style>
</head>
<body>
   <form action="/ChooseCourse/SaveUpdateAdminServlet.do" method="post"
   onsubmit="return checkForm();">
   <!-- 表单控件的name属性的值必须和对应表中的列名相同
        如果该控件的值不需要保存在数据库中，name属性不能提供
        单选按钮，复选框必须提供value属性的值 -->
        <input type="hidden" name="a_id" value="${admin.a_id}">
   <table>
      <tr>
        <td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
        <td>
          <!-- 控件的名必须与对应的表中的列名相同 -->
          <input type="text" class="input" name="a_name" 
          id="a_name" onblur="checkName()"
           onfocus="focusName()"
           value="${admin.a_name}"> 
        </td>
        <td>
          <div id="name_msg">用户名不少于两个字符</div>
        </td>
      </tr>
      
      <tr>
        <td>联系方式：</td>
        <td><input type="text" class="input" name="a_tel" 
        id="a_tel" value="${admin.a_tel}"onfocus="focusTel()" onblur="checkTel()"></td>
        <td><div id="tel_msg">手机号码必须是11位的数字</div></td>      
      </tr>
      <tr>
        <td></td>
        <td>
            <input type="submit" class="btn" value="完成">
            <input type="reset" class="btn" value="重置">
        </td>
        <td></td>
      </tr>
   </table>
   </form>
</body>

<script type="text/javascript">
    //弱类型，所有变量的声明统一使用var
    function checkName(){
    	//区分大小写，且没有提示
    	var name=document.getElementById("a_name");
        //获取用户在文本框中输入的值，所有表单控件都有value属性
        var msg=document.getElementById("name_msg");
        var v = name.value;
        //除了表单控件以外，其他的都使用innerHTML设置显示的内容
        if(v.length >= 2){
        	msg.innerHTML="用户名正确";
        	msg.className="success";
        	return true;
        }else{
        	msg.innerHTML="用户名错误";
        	msg.className="error";
        	return false;
        }
    }
    function focusName(){
    	var name = document.getElementById("a_name");
    	name.select();
    	var msg = document.getElementById("name_msg");
    	msg.innerHTML="用户名不少于两个字符";
    	msg.className=" ";
    }
    
    
    function focusTel(){
    	var tel = document.getElementById("a_tel");
    	tel.select();
    	var msg = document.getElementById("tel_msg");
    	msg.innerHTML="手机号码必须是11位的数字";
    	msg.className="";
    }
    function checkTel(){
    	var tel=document.getElementById("a_tel");
    	var v=tel.value;
    	var msg=document.getElementById("tel_msg");
    	var reg=/^1[34578][0-9]{9}$/;
    	if(reg.test(v)){
    		msg.innerHTML="手机号码正确";
    		msg.className="success";
    	    return true;
    	}else{
    		msg.innerHTML="手机号码格式有误";
    		msg.className="error";
    	    return false;
    	}
    }
    function checkForm(){
    	if(checkName()&&checkTel()){
    		return true;
    	}
    	else{
    		return false;
    	}
    }
</script>
</html>