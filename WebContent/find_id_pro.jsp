<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"
     import="java.sql.*, airport.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script> 
		function apply(id){ 
			//2) 중복확인 id를 부모창에 적용 
			//부모창 opener 
			opener.document.regform.id.value=id;
			window.close();
		} 
</script> 

<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center"></div> 
	<h3>* 아이디 찾기 결과 *</h3>
	<% 
	
	String name= new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
	String tel=request.getParameter("tel");
	DB.loadConnect();
	String cnt = DB.find_id_passenger(name, tel);
	String cnt2 = DB.find_id_admin(name, tel);
	if(cnt==null){
		if(cnt2==null){
			out.println("<p style='color: red'>해당 이름으로 가입한 아이디가 없거나, 입력한 정보가 틀립니다.</p>");
		}
		else{
			out.println("<strong>" + name + "</stong><p> 님의 ID는 </p>"+cnt2+"입니다.");
			out.println("<a href='javascript:apply(\"" + cnt2 + "\")'>[적용]</a>.");
		}
	}
	else{
		out.println("<strong>" + name + "</stong><p> 님의 ID는 </p>"+cnt+"입니다.");
		out.println("<a href='javascript:apply(\"" + cnt + "\")'>[적용]</a>.");
	}
	%>
	<hr> 
	<a href="javascript:history.back()">[다시시도]</a> 
	&nbsp; &nbsp; 
	<a href="javascript:window.close()">[창닫기]</a>
	
</body>
</html>