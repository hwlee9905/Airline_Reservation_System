package airport;

public class Passenger {
	String id;
	int pw;
	String name;
	String address;
	String passport;
	String regdate;
	String tel;
	String grade;
	public void setid(String id) {
		this.id = id;
	}
	public void setpw(String pw) {
		this.pw = pw.hashCode();
	}
	public void setname(String name) {
		this.name = name;
	}
	public void setaddress(String address) {
		this.address = address;
	}
	public void setpassport(String passport) {
		this.passport = passport;
	}
	public void settel(String tel) {
		this.tel = tel;
	}
	public void setgrade(String grade) {
		this.grade = grade;
	}
	public String getid() {
		return id;
	}
	public int getpw() {
		return pw;
	}
	public String getname() {
		return name;
	}
	public String getaddress() {
		return address;
	}
	public String getpassport() {
		return passport;
	}
	public String getregdate() {
		return regdate;
	}
	public String gettel() {
		return tel;
	}
	public String getgrade() {
		return grade;
	}
}
