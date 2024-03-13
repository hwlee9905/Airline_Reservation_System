<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*"  %>
         
<!DOCTYPE html>
<html>
	<HEAD><TITLE>관리자가 특정승객 환불</TITLE></HEAD>
	<body>
		<%  
   	    	request.setCharacterEncoding("euc-kr");
            	
			
         	DB.loadConnect();
	        ResultSet rs = DB.passenger_Check();
	        
	    	 // 호출되는 페이지로 Java 객체를 전달하는 방법: setAttribute()
	   	     request.setAttribute("title","승객 조회"); 	        
	   	     request.setAttribute("RS", rs);
	   		
	   	     // 새로운 페이지 호출하여 수행하기
	   	     request.getRequestDispatcher("listRS_passenger.jsp").forward(request, response);

       %>
</body>
</html>