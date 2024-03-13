<%@ page contentType="text/html;charset=euc-kr"
	import="java.sql.*, airport.* ,java.util.*,java.time.LocalDate"%>
<%@ page errorPage="/error/erroepageSelect.jsp"%>
<!DOCTYPE html>
<html>
<HEAD>
<TITLE>예약</TITLE>
</HEAD>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	ResultSet rs = DB.assign();
	if (rs == null) {
		out.print("<H3 align=center >ResultSet 객체가 전달되지 않았습니다.</H3>");
		return;
	}
	%>

	<%
	String rows[] = request.getParameterValues("rows");
	String[] people = new String[rows.length];

	for (int p = 0; p < rows.length; p++)
		people[p] = request.getParameter("people" + rows[p]);
	String id = (String) session.getAttribute("user_id");
	List<String> date = new ArrayList<String>();
	List<Integer> flightnum = new ArrayList<Integer>();
	List<String> stime = new ArrayList<String>();
	List<String> atime = new ArrayList<String>();
	List<String> departpoint = new ArrayList<String>();
	List<String> destination = new ArrayList<String>();
	List<Integer> aircraftnum = new ArrayList<Integer>();
	List<Integer> reservationum = new ArrayList<Integer>();
	List<Integer> fee = new ArrayList<Integer>();
	LocalDate reserdate = LocalDate.now();
	List<String> refundyn = new ArrayList<String>();

	System.out.print("   >> rs : " + rs + "\n");
	ResultSetMetaData md = rs.getMetaData();
	int count = md.getColumnCount();
	String[] columns = new String[count];
	String[] columnTypes = new String[count];
	for (int i = 0; i < count; i++) {
		columns[i] = md.getColumnLabel(i + 1);
		columnTypes[i] = md.getColumnTypeName(i + 1);
		System.out.print("   >> clms : " + columns[i] + " " + columnTypes[i] + "\n");
	}
	int k = 0;
	int j = 0;

	while (rs.next()) {

		for (int i = 0; i < 11; i++) {

			Object obj = rs.getObject(columns[i]);

			if (i == 0 && k == Integer.parseInt(rows[j])) {
		date.add(String.valueOf(obj));
		System.out.print(date + "\n");
			}
			if (i == 1 && k == Integer.parseInt(rows[j])) {
		//flightnum=Integer.parseInt(String.valueOf(obj));
		flightnum.add(Integer.parseInt(String.valueOf(obj)));
		System.out.print(flightnum + "\n");
			}
			if (i == 2 && k == Integer.parseInt(rows[j])) {
		//stime=String.valueOf(obj);
		stime.add(String.valueOf(obj));
		System.out.print(stime + "\n");
			}
			if (i == 3 && k == Integer.parseInt(rows[j])) {
		atime.add(String.valueOf(obj));
		System.out.print(atime + "\n");
			}
			if (i == 4 && k == Integer.parseInt(rows[j])) {
		departpoint.add(String.valueOf(obj));
		System.out.print(departpoint + "\n");
			}
			if (i == 5 && k == Integer.parseInt(rows[j])) {
		destination.add(String.valueOf(obj));
		System.out.print(destination + "\n");
			}
			if (i == 6 && k == Integer.parseInt(rows[j])) {
		aircraftnum.add(Integer.parseInt(String.valueOf(obj)));
		System.out.print(aircraftnum + "\n");
			}
			if (i == 8 && k == Integer.parseInt(rows[j])) {
		fee.add(Integer.parseInt(String.valueOf(obj)));
		System.out.print(fee + "\n");
			}
			if (i == 10 && k == Integer.parseInt(rows[j])) {
		refundyn.add(String.valueOf(obj));
		System.out.print(refundyn + "\n");
		reservationum.add((int) (Math.random() * 100000000));

		j++;
			}

		}
		if (rows.length == j) {
			break;
		}
		k++;

	}
	int b = 0;
	int rc = 0;
	DB.loadConnect();
	for (int i = 0; i < date.size(); i++) {
		System.out.print(DB.leftseats(flightnum.get(i), aircraftnum.get(i)) + "ddddddddddddddddd333");
		if (0 == DB.leftseats(flightnum.get(i), aircraftnum.get(i))) {
			if (rows.length == 1) {
		out.println(
				"<script language=javascript> alert('남은 좌석이 없습니다.'); window.location.href = 'http://localhost:8080/DBairport/reservation/assignCheck.jsp';</script>");//window.history.go(-1);
			}
			out.println(
			"<script language=javascript> alert('일부만 예약되었습니다.'); window.location.href = 'http://localhost:8080/DBairport/reservation/assignCheck.jsp';</script>");//window.history.go(-1);
			b++;
			break;
		}
		if (0 > DB.leftseats(flightnum.get(i), aircraftnum.get(i)) - Integer.parseInt(people[i])) {
			if (rows.length == 1) {
		out.println(
				"<script language=javascript> alert('예약인원수를 확인해주세요'); window.location.href = 'http://localhost:8080/DBairport/reservation/assignCheck.jsp';</script>");//window.history.go(-1);
			}
			out.println(
			"<script language=javascript> alert('일부만 예약되었습니다.'); window.location.href = 'http://localhost:8080/DBairport/reservation/assignCheck.jsp';</script>");//window.history.go(-1);
			b++;
			break;
		}
		while (rc != DB.reservationum_check(reservationum.get(i))) {
			reservationum.set(i, (int) (Math.random() * 100000000));
		}
		int a = DB.reservation_add(id, date.get(i), flightnum.get(i), stime.get(i), atime.get(i), departpoint.get(i),
		destination.get(i), aircraftnum.get(i), reservationum.get(i), fee.get(i) * Integer.parseInt(people[i]),
		reserdate.toString(), refundyn.get(i), Integer.parseInt(people[i]));
		if (a == 0) {
			out.println(
			"<script language=javascript> alert('예약에 실패 했습니다'); window.location.href = 'http://localhost:8080/DBairport/reservation/assignCheck.jsp';</script>");//window.history.go(-1);
			b++;
			continue;
		}
		int c = DB.leftseat_down(flightnum.get(i), aircraftnum.get(i), Integer.parseInt(people[i]));
	}
	if (b == 0) {
		out.println(
		"<script language=javascript> alert('예약하였습니다'); window.location.href = 'http://localhost:8080/DBairport/reservation/assignCheck.jsp'; </script>");
	}
	%>
</body>
</html>