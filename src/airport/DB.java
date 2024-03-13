package airport;

import java.sql.*;
import java.io.IOException;
import java.util.Vector;

public class DB {

	static Connection con = null;
	static Statement stmt = null;
	static ResultSet rs = null;

	static String driver = "com.mysql.cj.jdbc.Driver";
	static String URL = "jdbc:mysql://localhost:3306/airport";

	public static String find_id_passenger(String name, String tel) {
		String mid = null;
		try {
			String sql = "select ID from passenger where name=? and tel=? ;";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, tel);
			System.out.println(pstmt.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mid = rs.getString("ID");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		return mid;
	}

	public static String find_id_admin(String name, String tel) {
		String mid = null;
		try {
			String sql = "select adID from administrator where name=? and tel=? ;";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, tel);
			System.out.println(pstmt.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mid = rs.getString("adID");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		return mid;
	}

	public static String find_pw_admin(String name, String id) {
		String mid = null;
		try {
			String sql = "select adID from administrator where name=? and adID=? ;";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			System.out.println(pstmt.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mid = rs.getString("adID");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		return mid;
	}

	public static String find_pw_passenger(String name, String id) {
		String mid = null;
		try {
			String sql = "select ID from passenger where name=? and ID=? ;";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			System.out.println(pstmt.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mid = rs.getString("ID");
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		return mid;
	}

	public static void update_pw_passenger(String id, String name, String pw) {
		try {
			String sql = "update passenger set PW = ? where ID = ? and name = ? ;";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pw.hashCode());
			pstmt.setString(2, id);
			pstmt.setString(3, name);
			System.out.println(pstmt.toString());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	public static void update_pw_admin(String id, String name, String pw) {

		try {
			String sql = "update administrator set PW = ? where adID = ? and name = ? ;";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pw.hashCode());
			pstmt.setString(2, id);
			pstmt.setString(3, name);
			System.out.println(pstmt.toString());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	public static void loadConnect() {
		try {
			// ������ �ݴ´�.
			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();
		} catch (SQLException ex) {
		}
		;

		// ����̹� �ε�
		try {
			Class.forName(driver);

		} catch (java.lang.ClassNotFoundException e) {
			System.err.println("** Driver loaderror in loadConnect: " + e.getMessage());
			e.printStackTrace();
		}

		try {
			// �����ϱ�
			con = DriverManager.getConnection(URL, "hwlee", "7948");
			System.out.println("\n" + URL + "�� �����");
		} catch (SQLException ex) {
			System.err.println("** connection error in loadConnect: " + ex.getMessage());
			ex.printStackTrace();
		}

	}

	public static int duplicateID(String id) {
		int cnt = 0;
		int cnt2 = 0;
		try {

			String sql = "SELECT count(ID) as cnt FROM passenger WHERE ID = ?;";
			String sql2 = "SELECT count(adID) as cnt FROM administrator WHERE adID = ?;";
			PreparedStatement pstmt = con.prepareStatement(sql);
			PreparedStatement pstmt2 = con.prepareStatement(sql2);
			pstmt2.setString(1, id);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			ResultSet rs2 = pstmt2.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
			if (rs2.next()) {
				cnt2 = rs2.getInt("cnt");
			}
		} catch (SQLException ex) {
			System.out.println("���̵� �ߺ� Ȯ�� ���� : " + ex);
		}
		return cnt + cnt2;
	}

	public static void disconnect() {
		try {
			// ������ �ݴ´�.
			if (stmt != null)
				stmt.close();
			if (con != null)
				con.close();
		} catch (SQLException ex) {
		}
		;
	}

	// �־��� select ���Ǹ� �����Ͽ� ResultSet ��ȯ
	public static ResultSet selectQuery(String sql) {
		try {
			// Statement ����
			stmt = con.createStatement();

			rs = stmt.executeQuery(sql);

		} catch (SQLException ex) {
			System.err.println("** SQL exec error in selectQuery() : " + ex.getMessage());
		}

		return rs;

	}

	public static ResultSet selectPassenger(String id) {
		String sql = "select * from passenger where id = " + id + " ;";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}

	public static ResultSet selectAllPassenger() {
		String sql = "select * from passenger;";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}

	// �־��� ������Ʈ ���� ���Ǹ� �����Ͽ� update count ��ȯ
	// �װ��� �ߺ� üũ
	public static int flight_Check_2(String date, int flightnum, String stime, String atime) {
		int cnt = 0;
		try {

			String sql = "select count(date) as cnt from flight where date = ? and flightnum = ? and stime=? and atime=?;";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setInt(2, flightnum);
			pstmt.setString(3, stime);
			pstmt.setString(4, atime);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException ex) {
			System.out.println("�װ��� �ߺ� " + ex);
		}
		return cnt;
	}

	public static int updateQuery(String sql) {
		int count;

		try {
			// Statement ����
			stmt = con.createStatement();
			count = stmt.executeUpdate(sql);
			return count;

		} catch (SQLException ex) {
			System.err.println("** SQL exec error in updateQuery() : " + ex.getMessage());
			return 0;
		}
	}

	public static ResultSet insertPassenger(String id, String pw, String name, String address, String passport,
			String date, String tel) {

		String sql = "insert into passenger values ('" + id + "'," + pw.hashCode() + ", '" + name + "', '" + address
				+ "' , '" + passport + "','" + date + "','" + tel + "'); ";
		System.out.println("   >> SQL : " + sql + "\n");

		int count = updateQuery(sql);

		if (count == 1)
			return selectAllPassenger();
		else
			return null;
	}

	// �װ��� ��ȸ
	public static ResultSet flight_Check() {
		String sql = "select * " + "from flight ;";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}

	// �װ��� �߰�
	public static int flight_add(String date, int flightnum, String stime, String atime, String departpoint,
			String destination, String fightime, int fee) {
		String sql = "insert into flight values('" + date + "'," + flightnum + ",'" + stime + "','" + atime + "','"
				+ departpoint + "','" + destination + "','" + fightime + "'," + fee + ");";

		return updateQuery(sql);
	}

	// �װ��� ����
	public static int flight_delete(String date, int flightnum, String stime, String atime) {
		String sql = "delete from flight where flight.date='" + date + "' and flight.flightnum =" + flightnum
				+ " and flight.stime= '" + stime + "' and flight.atime='" + atime + "';";

		return updateQuery(sql);
	}

	// Ư�� �°��� ������ ȯ�� (������ refund�� �߰�)
	public static int reservation_delete(String date, int flightnum, String stime, String atime, int aircraftnum,
			String id, int reservationum, String adid, String refundreason, String refundate, int fee) {
		String sql = "delete from reservation where date='" + date + "' and flightnum = " + flightnum + " and stime ='"
				+ stime + "' and atime ='" + atime + "' and aircraftnum =" + aircraftnum + " and id ='" + id
				+ "' and reservationum=" + reservationum + ";";
		updateQuery(sql);

		String sql2 = "insert into refund values(" + reservationum + ",'" + id + "','" + adid + "','" + refundreason
				+ "','" + refundate + "'," + fee + ");";
		return updateQuery(sql2);
	}

	// ������ �߰�

	public static int administrator_add(String adid, int pw, String name, String address, String regdate, String tel,
			String rank) {
		String sql = "insert into administrator values('" + adid + "'," + pw + ",'" + name + "','" + address + "','"
				+ regdate + "','" + tel + "','" + rank + "');";

		return updateQuery(sql);
	}

	// �װ��� ��ȸ

	public static ResultSet aircraft_Check() {
		String sql = "select * from aircraft";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}

	// �װ��� �ߺ� üũ
	public static int aircraft_check(int aircraftnum) {
		int cnt = 0;
		try {

			String sql = "select count(aircraftnum) as cnt from aircraft where aircraftnum = ?;";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, aircraftnum);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException ex) {
			System.out.println("���ప �ߺ�" + ex);
		}
		return cnt;
	}

	// �װ��� �߰�
	public static int aircraft_add(int aircraftnum, int size, int weight, int speed, int holdpersonnumber,
			String productiondate, int price) {
		String sql = "insert into aircraft values(" + aircraftnum + "," + size + "," + weight + "," + speed + ","
				+ holdpersonnumber + ",'" + productiondate + "'," + price + ");";

		return updateQuery(sql);
	}

	// �װ��� ����
	public static int aircraf_delete(int aircraftnum) {
		String sql = "delete from aircraft where aircraftnum=" + aircraftnum + ";";

		return updateQuery(sql);
	}

	// ���� �߰�
	public static int assign_add(int flightnum, int aircraftnum, String date, int holdpersonnumber, String refundyn) {
		String sql = "insert into assign values(" + flightnum + "," + aircraftnum + ",'" + date + "',"
				+ holdpersonnumber + ",'" + refundyn + "');";

		return updateQuery(sql);
	}

	// ���� ����
	public static int assign_delete(int flightnum, int aircraftnum) {
		String sql = "delete from assign where aircraftnum=" + aircraftnum + ";";

		return updateQuery(sql);
	}

	// ���� �ߺ� üũ
	public static int assign_Check(int flightnum, int aircraftnum) {
		int cnt = 0;
		try {

			String sql = "select count(date) as cnt from assign where flightnum = ? and aircraftnum = ?;";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, flightnum);
			pstmt.setInt(2, aircraftnum);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException ex) {
			System.out.println("���� �ߺ� " + ex);
		}
		return cnt;
	}

	// �°� ��ȸ
	public static ResultSet passenger_Check() {
		String sql = "select id,name,address,passport,regdate,tel " + "from passenger;";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}

	// �°��� ���� ���� ��ȸ
	public static ResultSet reservation_Check(String id) {
		String sql = "select * " + "from reservation " + "where reservation.ID='" + id + "';";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}

	// ��� �°� ���� ����
	public static ResultSet reservation() {
		String sql = "select *" + "from reservation ;";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}

	// Ư�� �°��� ������ ȯ�� (������ refund�� �߰�)
	public static int reservation_delete(String id, String date, int flightnum, String stime, String atime,
			int aircraftnum, int reservationum, String adid, String refundreason, String refundate, int fee) {
		String sql = "delete from reservation where id='" + id + "' and date ='" + date + "' and flightnum = "
				+ flightnum + " and stime ='" + stime + "' and atime ='" + atime + "' and aircraftnum =" + aircraftnum
				+ " and reservationum=" + reservationum + ";";
		updateQuery(sql);

		String sql2 = "insert into refund values(" + reservationum + ",'" + id + "','" + adid + "','" + refundreason
				+ "','" + refundate + "'," + fee + ");";
		return updateQuery(sql2);
	}

	// ������ ��ȸ (�н����� �� ppt�� �ٸ���)
	public static ResultSet administrator_Check() {
		String sql = "select adID,name,address,regdate,tel,rank " + "from administrator;";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}

	// ������ ��ȸ (��ȣȭ�� pw ����)
	public static ResultSet administrator_Check_pw() {
		String sql = "select * " + "from administrator;";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}

	// ������ ����
	public static int administrator_delete(String adid) {
		String sql = "delete from administrator where adID='" + adid + "';";

		return updateQuery(sql);
	}

	// ȯ�� ���� ��ȸ
	public static ResultSet refund_Check() {
		String sql = "select * " + "from refund;";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}

	// ������ �װ��� ��ȸ
	public static ResultSet assign() {
		String sql = "select flight.date,flight.flightnum, flight.stime , flight.atime , flight.departpoint , flight.destination, assign.aircraftnum, flight.fightime,flight.fee, assign.leftseats ,assign.refundyn "
				+ "from flight,assign " + "where flight.flightnum = assign.flightnum and flight.date = assign.date;";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}

	// ���� ��ȸ
	public static ResultSet assign_check() {
		String sql = "select * " + "from assign;";
		System.out.println("   >> SQL : " + sql + "\n");

		return selectQuery(sql);
	}

	// �ܿ� �¼��� Ȯ��
	public static int leftseats(int flightnum, int aircraftnum) {
		int leftseat = 1;
		try {
			String sql = "select leftseats " + "from assign where flightnum =? and aircraftnum = ?;";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, flightnum);
			pstmt.setInt(2, aircraftnum);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				leftseat = rs.getInt("leftseats");
			}

		} catch (SQLException ex) {
			System.out.println("�¼��� Ȯ�� ����" + ex);
		}
		return leftseat;
	}

	// ������ ���� ���� ���� �ܿ� �¼��� ����(�ο��� ����)
	public static int leftseat_down(int flightnum, int aircraftnum, int people) {
		int leftseat = leftseats(flightnum, aircraftnum) - people;

		String sql = "update assign set leftseats=" + leftseat + " where flightnum=" + flightnum + " and aircraftnum="
				+ aircraftnum + ";";
		return updateQuery(sql);
	}

	// ȯ�ҷ� ���� �ܿ� �¼��� ����
	public static int leftseat_up(int flightnum, int aircraftnum, int people) {
		int leftseat = leftseats(flightnum, aircraftnum) + people;
		String sql = "update assign set leftseats=" + leftseat + " where flightnum=" + flightnum + " and aircraftnum="
				+ aircraftnum + ";";

		return updateQuery(sql);
	}

	// �����߰�
	public static int reservation_add(String id, String date, int flightnum, String stime, String atime,
			String departpoint, String destination, int aircraftnum, int reservationum, int fee, String reserdate,
			String refundyn, int people) {
		String sql = "insert into reservation values('" + id + "','" + date + "'," + flightnum + ",'" + stime + "','"
				+ atime + "','" + departpoint + "','" + destination + "'," + aircraftnum + "," + reservationum + ","
				+ fee + ",'" + reserdate + "','" + refundyn + "'," + people + ");";

		return updateQuery(sql);
	}

	// ���� ��ȣ �ߺ� üũ
	public static int reservationum_check(int k) {
		int cnt = 0;
		try {

			String sql = "select count(reservationum) as cnt from reservation where reservationum = ?;";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, k);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException ex) {
			System.out.println("���ప �ߺ�" + ex);
		}
		return cnt;
	}

}
