<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.* "  %>


<!DOCTYPE html>
<html>
<head>

<title>idCheckProc.jsp</title>
</head>
<body>
	<div style="text-align: center"></div> 
	<h3>* ���̵� �ߺ� Ȯ�� ��� *</h3>
<% 
	
	String id=request.getParameter("id"); 
	DB.loadConnect();
	int cnt = DB.duplicateID(id);
	out.println("�Է� ID : <strong>" + id + "</stong>"); 
	if(cnt==0){
		out.println("<p>��� ������ ���̵��Դϴ�.</p>");
		out.println("<a href='javascript:apply(\"" + id + "\")'>[����]</a>"); 
%> 
	<script> 
		function apply(id){ 
			//2) �ߺ�Ȯ�� id�� �θ�â�� ���� 
			//�θ�â opener 
			opener.document.regform.id.value=id;
			window.close();
		} 
	</script> 
<% 
		}else{ 
			out.println("<p style='color: red'>�ش� ���̵�� ����Ͻ� �� �����ϴ�.</p>"); }
	//if end 
%> 
	<hr> 
	<a href="javascript:history.back()">[�ٽýõ�]</a> 
	&nbsp; &nbsp; 
	<a href="javascript:window.close()">[â�ݱ�]</a>


</body>
</html>