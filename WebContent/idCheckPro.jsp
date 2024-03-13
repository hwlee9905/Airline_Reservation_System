<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.* "  %>


<!DOCTYPE html>
<html>
<head>

<title>idCheckProc.jsp</title>
</head>
<body>
	<div style="text-align: center"></div> 
	<h3>* 아이디 중복 확인 결과 *</h3>
<% 
	
	String id=request.getParameter("id"); 
	DB.loadConnect();
	int cnt = DB.duplicateID(id);
	out.println("입력 ID : <strong>" + id + "</stong>"); 
	if(cnt==0){
		out.println("<p>사용 가능한 아이디입니다.</p>");
		out.println("<a href='javascript:apply(\"" + id + "\")'>[적용]</a>"); 
%> 
	<script> 
		function apply(id){ 
			//2) 중복확인 id를 부모창에 적용 
			//부모창 opener 
			opener.document.regform.id.value=id;
			window.close();
		} 
	</script> 
<% 
		}else{ 
			out.println("<p style='color: red'>해당 아이디는 사용하실 수 없습니다.</p>"); }
	//if end 
%> 
	<hr> 
	<a href="javascript:history.back()">[다시시도]</a> 
	&nbsp; &nbsp; 
	<a href="javascript:window.close()">[창닫기]</a>


</body>
</html>