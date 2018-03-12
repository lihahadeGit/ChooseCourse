<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
  .input{
    width:150px;
    border:1px solid black;
  }
  .btn{
      width:60px;
      height:25px
      margin-right:10px;
      margin-top:10px;
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
  <form action="/ChooseCourse/SaveUpdateTcrServlet.do?tcr_id=${tcr.tcr_id}" method="post"
        onsubmit="return checkForm()">
        <%-- <input type="hidden" name="tcr_id" value="${tcr.tcr_id}"> --%>
     <table>
       <tr>
        <td>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
        <td>
          <!-- 控件的名必须与对应的表中的列名相同 -->
          <input type="text" class="input" name="tcr_name" id="tcr_name" 
          onfocus="focusText('tcr_name','name_msg')" 
          onblur="checkText('tcr_name','name_msg')"
          value="${tcr.tcr_name}">
        </td>
        <td>
          <div id="name_msg">用户名不少于两个字符</div>
        </td>
       </tr>
       
       
       <tr>
        <td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
        <td>
            <input type="radio"  name="tcr_sex" id="boy" value="男" checked="checked">男
            <input type="radio" name="tcr_sex" id="girl" value="女">女
        </td>
        <td></td>
       </tr>
       
       <tr>
        <td>联系方式：</td>
        <td><input type="text" class="input" name="tcr_tel" id="tcr_tel"
                   onfocus="focusText('tcr_tel','tel_msg')"
                   onblur="checkText('tcr_tel','tel_msg')"
                   value="${tcr.tcr_tel}"></td>
        <td><div id="tel_msg">手机号码必须是11位的数字</div></td>
       </tr>
       
       <tr>
        <td>生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日：</td>
        <td>
            <input type="date" name="tcr_birth" id="tcr_birth" value="${tcr.tcr_birth}">
        </td>
        <td><div id="birth_msg">格式必须是形如xxxx-xx-xx的字符串</div></td>
       </tr>
        
       <tr>
        <td>籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯：</td>
        <td>
            <select name="tcr_np">
              <option value="山东省">山东省</option>
            </select>
        </td>
        <td></td>
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
     var msg_text = {
         name_msg : "用户名不少于两个字符",
         tel_msg : "手机号码必须是11位的数字",
         birth_msg : "格式必须是形如xxxx-xx-xx的字符串"
     };
     var arr_textid = ["tcr_name","tcr_tel"];
     var arr_msgid = ["name_msg","tel_msg"];
     function checkText(textid,msgid){
    	 var name=document.getElementById(textid);
    	 var v=name.value;
    	 var msg=document.getElementById(msgid);
    	 var flag=false;
    	 switch(textid){
    	 case "tcr_name":
    		 if(v.length > 2){
    			 flag = true;
    		 }
    		 break;
    	 case "tcr_tel":
    		 var reg=/^[1][34578][0-9]{9}$/;
    		 if(reg.test(v)){
    			 flag=true;
    		 }
    		 break;
    	 case "tcr_birth":
    		 var reg=/^d{4}-((0[1-9])|([1][0-2]))-((0[1-9])|(1[0-9])|(2[0-9])|(3[0-1]))$/;
    		 if(reg.test(v)){
    			 flag=true;
    		 }
    	     break;
    	 }
    	 if(flag){
    		 msg.innerHTML="输入的内容正确";
    		 msg.className="success";
    		 return true;
    	 }else{
    		 msg.innerHTML="输入的内容错误";
    		 msg.className="error";
    		 return false;
    	 }
     }
     
     function focusText(textid,msgid){
    	 var text = document.getElementById(textid);
    	 text.select();
    	 var msg = document.getElementById(msgid);
    	 msg.innerText=msg_text[msgid];
    	 msg.className="";
     }
     
     function checkForm(){
    	 for(var i=0;i<arr_textid.length;i++){
    		 if(!checkText(textid[i],msgid[i])){
    			 return false;
    		 }
    	 }
    	 return true;
     }
</script>
</html>