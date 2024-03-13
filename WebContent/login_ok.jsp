<%@ page contentType="text/html;charset=utf-8"
         import="java.sql.*, airport.*"  %>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	int pw = request.getParameter("pw").hashCode();
	
    // DB연결에 필요한 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	String driver= "com.mysql.jdbc.Driver";
	String URL = "jdbc:mysql://localhost:3306/airport" ;
	String sql = "select * from passenger where ID = ? and PW = ?;";
	String sql2 = "select * from administrator where adID = ? and PW = ?;";
	try{
		// 드라이버 호출
		Class.forName(driver);
		
		// conn 생성
		conn = DriverManager.getConnection(URL, "root", "onlyroot");
		// pstmt 생성
		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, id);
		pstmt.setInt(2, pw);
		rs=pstmt.executeQuery();
		pstmt2 = conn.prepareStatement(sql);
		pstmt2.setString(1, id);
		pstmt2.setInt(2, pw);
		rs2=pstmt2.executeQuery();
		if(rs.next()){ // 로그인 성공(인증의 수단 session)
			id = rs.getString("adID");
			pw = rs.getInt("PW");		
			session.setAttribute("user_id", id);
			session.setAttribute("user_pw", pw);		
			response.sendRedirect("index_a.jsp"); // 페이지이동
		}
		else if(rs2.next()){
			id = rs2.getString("ID");
			pw = rs2.getInt("PW");		
			session.setAttribute("user_id", id);
			session.setAttribute("user_pw", pw);	
			response.sendRedirect("index_p.jsp"); // 페이지이동
		}
		else{ // 로그인 실패
			out.print("<script> alert('로그인을 실패했습니다');window.history.go(-1);</script>");
			//response.sendRedirect("login.html"); // 실패 페이지
		}
	} catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("login.html"); // 에러가 난 경우도 리다이렉트
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
 %>