<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*"  %>
<%@ page errorPage = "/error/erroepageSelect.jsp" %>

<HTML> 
    <HEAD><TITLE>id �������� ���</TITLE></HEAD>

    <BODY> 
    <%	
 	 	   request.setCharacterEncoding("utf-8");
 	
		   ResultSet rs1 = DB.passenger_Check();
 	       if (rs1 == null) {
 	    	   out.print("<H3 align=center >ResultSet ��ü.</H3>");  
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
 					Object obj1= rs1.getObject(columns[1]);/////////////////////////////////////////////////////////////////////////�����ʿ�
 					if(k==rows){
 						id = String.valueOf(obj)+"";
 						name = String.valueOf(obj1)+"";
 						break;
 				}
 				k++;
 			}
 			DB.loadConnect();
	        ResultSet rs = DB.reservation_Check(id);
  			
	        // ȣ��Ǵ� �������� Java ��ü�� �����ϴ� ���: setAttribute()
	        request.setAttribute("title", name+"��(id:" +id+" )�� ��������"); 	        
	        session.setAttribute("RS1", rs); 
	        session.setAttribute("ID", id); 
	        
	        // ���ο� ������ ȣ���Ͽ� �����ϱ�
	        request.getRequestDispatcher("listRS_reservatoin.jsp").forward(request, response);

       %>         
     </BODY>
</HTML>