<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*"  %>
         
<!DOCTYPE html>
<html>
	<HEAD><TITLE>�����ڰ� Ư���°� ȯ��</TITLE></HEAD>
	<body>
		<%  
   	    	request.setCharacterEncoding("euc-kr");
            	
			
         	DB.loadConnect();
	        ResultSet rs = DB.passenger_Check();
	        
	    	 // ȣ��Ǵ� �������� Java ��ü�� �����ϴ� ���: setAttribute()
	   	     request.setAttribute("title","�°� ��ȸ"); 	        
	   	     request.setAttribute("RS", rs);
	   		
	   	     // ���ο� ������ ȣ���Ͽ� �����ϱ�
	   	     request.getRequestDispatcher("listRS_passenger.jsp").forward(request, response);

       %>
</body>
</html>