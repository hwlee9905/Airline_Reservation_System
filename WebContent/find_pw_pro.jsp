<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"
     import="java.sql.*, airport.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script> 
</script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center"></div> 
	<h3>* 비밀번호 찾기 결과 *</h3>
	<% 
	
	String name= new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	DB.loadConnect();
	String cnt = DB.find_pw_passenger(name, id);
	String cnt2 = DB.find_pw_admin(name, id);
	if(cnt==null){
		if(cnt2==null){
			out.println("<p style='color: red'>해당 이름으로 가입한 아이디가 없거나, 입력한 정보가 틀립니다.</p>");
		}
		else{
			out.println("<p>새로운 비밀번호로 변경되었습니다.</p>");
			DB.update_pw_admin(id, name, pw);
		
		
		}
	}
	else{
		out.println("<p>새로운 비밀번호로 변경되었습니다.</p>");
		DB.update_pw_passenger(id, name, pw);
	}
	%>
	<hr> 
	<a href="javascript:history.back()">[다시시도]</a> 
	&nbsp; &nbsp; 
	<a href="javascript:window.close()">[창닫기]</a>
</body>
</html>