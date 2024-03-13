<%@ page contentType="text/html;charset=euc-kr"	
         import="java.sql.*, airport.* ,java.time.LocalDate"  %>
<!DOCTYPE html>
<html>
	<HEAD><TITLE>환불</TITLE></HEAD>
	<body>
<%	
 	 	   request.setCharacterEncoding("euc-kr");

 			String id = (String) session.getAttribute("ID");
			ResultSet rs = DB.reservation_Check(id);
			
 	       if (rs == null) {
 	    	   out.print("<H3 align=center >ResultSet 객체가 전달되지 않았습니다.</H3>");  
 	    	   return;
 	       }
 	       
 	%>

 	<%
 	
 	int rows =Integer.parseInt(String.valueOf(session.getAttribute("rows1")));

 	String date=""; 
 	int flightnum=0;
 	String stime="";
 	String atime="";
 	int aircraftnum=0;
 	int reservationum=0;
 	String adid = (String) session.getAttribute("user_id");
 	String refundreason=request.getParameter("refundreason");
 	
 	LocalDate refundate = LocalDate.now();
 	int fee=0;
 	int people=0;
 		System.out.print("   >> rs : " + rs + "\n");	       
	   ResultSetMetaData md = rs.getMetaData();
	   int count = md.getColumnCount();
	   String[] columns = new String[count];
	   String[] columnTypes = new String[count];
	   for(int i=0; i<count; i++){
		   columns[i] = md.getColumnLabel(i+1);
		   columnTypes[i] = md.getColumnTypeName(i+1);
			System.out.print("   >>! clms : " + columns[i] + " " + columnTypes[i]+ "\n");	
	   }
		   int k=0;
			while(rs.next()) {
					
					if(k==rows){
						Object obj1= rs.getObject(columns[1]);
						date = String.valueOf(obj1);
						
						Object obj2= rs.getObject(columns[2]);
						flightnum = Integer.parseInt(String.valueOf(obj2));
						
						Object obj3= rs.getObject(columns[3]);
						stime = String.valueOf(obj3);
						
						Object obj4= rs.getObject(columns[4]);
						atime = String.valueOf(obj4);
						
						Object obj7= rs.getObject(columns[7]);
						aircraftnum = Integer.parseInt(String.valueOf(obj7));
						
						Object obj8= rs.getObject(columns[8]);
						reservationum = Integer.parseInt(String.valueOf(obj8));
						
						Object obj9= rs.getObject(columns[9]);
						fee = Integer.parseInt(String.valueOf(obj9));
						Object obj12= rs.getObject(columns[12]);
						people = Integer.parseInt(String.valueOf(obj12));
						break;
					}

				
				k++;
			}
			
			
			
			
			DB.loadConnect();
	        int a = DB.reservation_delete(id, date, flightnum, stime, atime, aircraftnum, reservationum, adid, refundreason, refundate.toString(), fee);
	        if(a==0){
	        	out.print("<script> alert('환불에 실패했습니다');window.location.href = 'http://localhost:8080/DBairport/refund_a/passenger_Check.jsp';</script>");
	        }else {
	        	int b=DB.leftseat_up(flightnum,aircraftnum,people);
	        	out.print("<script> alert('환불했습니다');window.location.href = 'http://localhost:8080/DBairport/refund_a/passenger_Check.jsp';</script>");
	        }
	        

			
      %>
	</body>
</html>