<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*"  %>
<%@ page errorPage = "/error/erroepageSelect.jsp" %>

<HTML> 
    <HEAD><TITLE>id 예약정보 출력</TITLE></HEAD>

    <BODY> 
    <%	
 	 	   request.setCharacterEncoding("utf-8");
 	
		   ResultSet rs1 = DB.passenger_Check();
 	       if (rs1 == null) {
 	    	   out.print("<H3 align=center >ResultSet 객체.</H3>");  
 	    	   return;
 	       }
 	       
 	%>
 	
    <%  
            
    int rows =Integer.parseInt(request.getParameter("rows")); 
    
    
  	String id = "";
  	String name = "";
  	
  		   System.out.print("   >> rs : " + rs1 + "\n");	       
 		   ResultSetMetaData md = rs1.getMetaData();
 		   int count = md.getColumnCount();
 		   String[] columns = new String[count];
 		   String[] columnTypes = new String[count];
 		   for(int i=0; i<count; i++){
 			   columns[i] = md.getColumnLabel(i+1);
 			   columnTypes[i] = md.getColumnTypeName(i+1);
 				System.out.print("   >> clms : " + columns[i] + " " + columnTypes[i]+ "\n");	
      	   }
 		   int k=0;
 			while(rs1.next()) {
 					Object obj= rs1.getObject(columns[0]);
 					Object obj1= rs1.getObject(columns[1]);/////////////////////////////////////////////////////////////////////////수정필요
 					if(k==rows){
 						id = String.valueOf(obj)+"";
 						name = String.valueOf(obj1)+"";
 						break;
 				}
 				k++;
 			}
 			DB.loadConnect();
	        ResultSet rs = DB.reservation_Check(id);
  			
	        // 호출되는 페이지로 Java 객체를 전달하는 방법: setAttribute()
	        request.setAttribute("title", name+"님(id:" +id+" )의 예약정보"); 	        
	        session.setAttribute("RS1", rs); 
	        session.setAttribute("ID", id); 
	        
	        // 새로운 페이지 호출하여 수행하기
	        request.getRequestDispatcher("listRS_reservatoin.jsp").forward(request, response);

       %>         
     </BODY>
</HTML>