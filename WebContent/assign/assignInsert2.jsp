<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*"  %>
<%@ page errorPage = "/error/erroepageSelect.jsp" %>         
<!DOCTYPE html>
<html>
	<HEAD><TITLE>배정 추가</TITLE></HEAD>
	<body>
	<%	
 	 	   request.setCharacterEncoding("utf-8");
 	
			ResultSet rs = DB.aircraft_Check();
 	       if (rs == null) {
 	    	   out.print("<H3 align=center >ResultSet 객체가 전달되지 않았습니다.</H3>");  
 	    	   return;
 	       }
 	       
 	%>
		<%  
			int rows =Integer.parseInt(request.getParameter("rows"));
		  	
			int aircraftnum=0;
			int holdpersonnumber=0;
			String date= (String) session.getAttribute("assign_date");
		 	int flightnum= Integer.parseInt((String) session.getAttribute("assign_flightnum"));
		 	String refundyn=request.getParameter("refundyn");
		 	
		 	System.out.print("   >> rs : " + rs + "\n");	       
			   ResultSetMetaData md = rs.getMetaData();
			   int count = md.getColumnCount();
			   String[] columns = new String[count];
			   String[] columnTypes = new String[count];
			   for(int i=0; i<count; i++){
				   columns[i] = md.getColumnLabel(i+1);
				   columnTypes[i] = md.getColumnTypeName(i+1);
					System.out.print("   >> clms : " + columns[i] + " " + columnTypes[i]+ "\n");	
	     	   }
			   int k=0;
				while(rs.next()) {
						for(int i=0; i<5; i++){

						Object obj= rs.getObject(columns[i]);

						if(i==0&&k==rows){
							aircraftnum = Integer.parseInt(String.valueOf(obj));
							System.out.print(aircraftnum+"\n");
						} 
						if(i==4&&k==rows){
							holdpersonnumber=Integer.parseInt(String.valueOf(obj));
							System.out.print(holdpersonnumber+"\n");
						}

					}
					k++;
				} 	
		 	
         	DB.loadConnect();
         	if(1==DB.assign_Check(flightnum,aircraftnum)){
         		out.print("<script> alert('이미 배정되어 있습니다');window.history.go(-1);</script>");
         	}
	        int a = DB.assign_add(flightnum ,aircraftnum ,date ,holdpersonnumber,refundyn);
	        	
	        if(a==0){
	        	out.print("<script language=javascript> alert('추가에 실패했습니다') ; window.location.href = 'http://localhost:8080/DBairport/assign/assign.jsp';</script>");// window.history.go(-1);
	        }else {
	        	out.print("<script language=javascript> alert('추가에 성공했습니다') ; window.location.href = 'http://localhost:8080/DBairport/assign/assign.jsp'; </script>");
	        }


       %>
	</body>
</html>