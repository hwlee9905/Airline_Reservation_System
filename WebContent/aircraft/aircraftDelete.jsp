<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*, airport.*"  %>
<%@ page errorPage = "/error/erroepageSelect.jsp" %>
<!DOCTYPE html>
<html>
	<HEAD><TITLE>�װ��� ����</TITLE></HEAD>
	<body>
<%	
 	 	   request.setCharacterEncoding("utf-8");
 	
			ResultSet rs = DB.aircraft_Check();
 	       if (rs == null) {
 	    	   out.print("<H3 align=center >ResultSet ��ü�� ���޵��� �ʾҽ��ϴ�.</H3>");  
 	    	   return;
 	       }
 	       
 	%>

 	<%
 	
 	int rows =Integer.parseInt(request.getParameter("rows"));
 	int aircraftnum=0;
 	   
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
					Object obj= rs.getObject(columns[0]);

					if(k==rows){
						aircraftnum = Integer.parseInt(String.valueOf(obj));
						//out.print(aircraftnum+"\n");

				}

				if(k==rows){
					
					break;
				}
				k++;
			}
		
			DB.loadConnect();
	        int a = DB.aircraf_delete(aircraftnum);
	        if(a==0){
	        	out.print("<script> alert('������ �����߽��ϴ�');window.history.go(-1);</script>");
	        }else {
	        	out.print("<script> alert('������ �����߽��ϴ�');window.location.href = 'http://localhost:8080/DBairport/aircraft/aircraftCheck.jsp';</script>");
	        }
	        
	

       %>
	</body>
</html>