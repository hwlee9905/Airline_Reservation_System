<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*"  %>
<!DOCTYPE html>
<html>
	<HEAD><TITLE>배정 삭제</TITLE></HEAD>
	<body>
		<%  
   	    	    request.setCharacterEncoding("euc-kr");
            	
		  
         	DB.loadConnect();
	        ResultSet rs = DB.assign_check();
	        
	    	    // 호출되는 페이지로 Java 객체를 전달하는 방법: setAttribute()
	   	     request.setAttribute("title","배정된 항공편 조회(삭제)"); 	        
	   	     request.setAttribute("RS", rs); 
	   	     
	   	     // 새로운 페이지 호출하여 수행하기
	   	     request.getRequestDispatcher("listRS_assign2.jsp").forward(request, response);

       %>
</body>
</html>