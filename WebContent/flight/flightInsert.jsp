<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*"  %>
<!DOCTYPE html>
<html>
	<HEAD><TITLE>�װ��� �߰�</TITLE></HEAD>
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
         		out.print("<script> alert('�̹� �ִ� �װ����Դϴ�');window.history.go(-1);</script>");
         	}
	        int k = DB.flight_add(date, flightnum, stime, atime, departpoint, destination, fightime,fee);
	        if(k==0){
	        	out.print("<script language=javascript> alert('�߰��� �����߽��ϴ�') ;window.history.go(-1); </script>");
	        }else {
	        	out.print("<script language=javascript> alert('�߰��� �����߽��ϴ�') ; window.location.href = 'http://localhost:8080/DBairport/flight/flightCheck.jsp'; </script>");
	        }
	       
	    	    // ȣ��Ǵ� �������� Java ��ü�� �����ϴ� ���: setAttribute()
	   	     //request.setAttribute("title","�װ����߰�"); 	        
	   	     //request.setAttribute("RS", rs); 
	   	     
	   	     // ���ο� ������ ȣ���Ͽ� �����ϱ�
	   	     //request.getRequestDispatcher("flightCheck.jsp").forward(request, response);

       %>
	</body>
</html>