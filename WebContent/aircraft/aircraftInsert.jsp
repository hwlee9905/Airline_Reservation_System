<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*"  %>
<!DOCTYPE html>
<html>
	<HEAD><TITLE>항공기 추가</TITLE></HEAD>
	<body>

		<%  
   	    	request.setCharacterEncoding("euc-kr");     	
		  
			
			int aircraftnum = Integer.parseInt(request.getParameter("aircraftnum"));
			int size = Integer.parseInt(request.getParameter("size"));
			int weight = Integer.parseInt(request.getParameter("weight"));
			int speed = Integer.parseInt(request.getParameter("speed"));
			int holdpersonnumber = Integer.parseInt(request.getParameter("holdpersonnumber"));
			String productiondate = (String) request.getParameter("productiondate");
			int price = Integer.parseInt(request.getParameter("price"));
			
         	DB.loadConnect();
         	if(1==DB.aircraft_check(aircraftnum)){
         		out.print("<script> alert('이미 있는 항공기 번호입니다');window.history.go(-1);</script>");
         	}
	        int k = DB.aircraft_add(aircraftnum, size, weight, speed, holdpersonnumber, productiondate, price);
	        
	        if(k==0){
	        	out.print("<script> alert('추가에 실패했습니다');window.history.go(-1);</script>");
	        }else {
	        	out.print("<script> alert('추가에 성공했습니다');window.location.href = 'http://localhost:8080/DBairport/aircraft/aircraftCheck.jsp';</script>");
	        }
	      
       %>
	</body>
</html>