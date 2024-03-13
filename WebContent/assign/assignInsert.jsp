<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*"  %>
<%@ page errorPage = "/error/erroepageSelect.jsp" %>         
<!DOCTYPE html>
<html>
	<HEAD><TITLE>항공편 배정 항공기 선택</TITLE></HEAD>
	<body>
		<%	
 	 	   request.setCharacterEncoding("utf-8");
 	
			ResultSet rs = DB.flight_Check();
 	       if (rs == null) {
 	    	   out.print("<H3 align=center >ResultSet 객체가 전달되지 않았습니다.</H3>");  
 	    	   return;
 	       }
 	       
 	%>
 	
 	<% 
			int rows =Integer.parseInt(request.getParameter("rows"));
			
			String date="";
		 	int flightnum=0;
			
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
						for(int i=0; i<4; i++){

						Object obj= rs.getObject(columns[i]);

						if(i==0&&k==rows){
							date = String.valueOf(obj)+"";
							System.out.print(date+"\n");
						} 
						if(i==1&&k==rows){
							flightnum=Integer.parseInt(String.valueOf(obj));
							System.out.print(flightnum+"\n");
							break;
						}

					

					}
					k++;
				}
		
         	DB.loadConnect();
	        ResultSet rs1 = DB.aircraft_Check();
	        
	    	    // 호출되는 페이지로 Java 객체를 전달하는 방법: setAttribute()
	   	     request.setAttribute("title","항공기 선택"); 	        
	   	     request.setAttribute("RS", rs1); 
	   	  	 String flightnum1 = String.valueOf(flightnum);
	   	  	 session.setAttribute("assign_date", date);
	   	 	 session.setAttribute("assign_flightnum", flightnum1);
	   	 	 
	   	     // 새로운 페이지 호출하여 수행하기
	   	     request.getRequestDispatcher("listRS_assignInsert.jsp").forward(request, response);

       %>
</body>
</html>