<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*"  %>
<!DOCTYPE html>
<html>
	<HEAD><TITLE>ȯ�� ��ȸ</TITLE></HEAD>
	<body>
		<%  
   	    	    request.setCharacterEncoding("euc-kr");
            	
		  
         	DB.loadConnect();
	        ResultSet rs = DB.refund_Check();
	        
	    	    // ȣ��Ǵ� �������� Java ��ü�� �����ϴ� ���: setAttribute()
	   	     request.setAttribute("title","ȯ�� ���� ��ȸ"); 	        
	   	     request.setAttribute("RS", rs); 
	   	     
	   	     // ���ο� ������ ȣ���Ͽ� �����ϱ�
	   	     request.getRequestDispatcher("listRS.jsp").forward(request, response);

       %>
</body>
</html>