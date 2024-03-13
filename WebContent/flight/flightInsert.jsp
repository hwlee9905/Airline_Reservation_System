<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*"  %>
<!DOCTYPE html>
<html>
	<HEAD><TITLE>항공편 추가</TITLE></HEAD>
	<body>

		<%  
   	    	request.setCharacterEncoding("euc-kr");     	
		  
			
			String date = (String) request.getParameter("date");
			int flightnum =Integer.parseInt(request.getParameter("flightnum"));
			String stime = (String) request.getParameter("stime");
			String atime = (String) request.getParameter("atime");
			String departpoint = (String) request.getParameter("departpoint");
			String destination = (String) request.getParameter("destination");
			String fightime = (String) request.getParameter("fightime");
			int fee =Integer.parseInt(request.getParameter("fee"));
			
         	DB.loadConnect();
         	if(1==DB.flight_Check_2(date,flightnum,stime,atime)){
         		out.print("<script> alert('이미 있는 항공편입니다');window.history.go(-1);</script>");
         	}
	        int k = DB.flight_add(date, flightnum, stime, atime, departpoint, destination, fightime,fee);
	        if(k==0){
	        	out.print("<script language=javascript> alert('추가에 실패했습니다') ;window.history.go(-1); </script>");
	        }else {
	        	out.print("<script language=javascript> alert('추가에 성공했습니다') ; window.location.href = 'http://localhost:8080/DBairport/flight/flightCheck.jsp'; </script>");
	        }
	       
	    	    // 호출되는 페이지로 Java 객체를 전달하는 방법: setAttribute()
	   	     //request.setAttribute("title","항공편추가"); 	        
	   	     //request.setAttribute("RS", rs); 
	   	     
	   	     // 새로운 페이지 호출하여 수행하기
	   	     //request.getRequestDispatcher("flightCheck.jsp").forward(request, response);

       %>
	</body>
</html>