<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*"  %>
<!DOCTYPE html>
<html>
	<HEAD><TITLE>�װ��� �߰�</TITLE></HEAD>
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
         		out.print("<script> alert('�̹� �ִ� �װ��� ��ȣ�Դϴ�');window.history.go(-1);</script>");
         	}
	        int k = DB.aircraft_add(aircraftnum, size, weight, speed, holdpersonnumber, productiondate, price);
	        
	        if(k==0){
	        	out.print("<script> alert('�߰��� �����߽��ϴ�');window.history.go(-1);</script>");
	        }else {
	        	out.print("<script> alert('�߰��� �����߽��ϴ�');window.location.href = 'http://localhost:8080/DBairport/aircraft/aircraftCheck.jsp';</script>");
	        }
	      
       %>
	</body>
</html>