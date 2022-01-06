package model.dto;

public class MemberVO {
	private String name;
	private String userid;
	private String pwd;
	private String phone;
	private int admin;

	public MemberVO() {
	}
	
	public MemberVO(String name, String userid, String pwd, String phone, int admin) {
		this.name = name;
		this.userid = userid;
		this.pwd = pwd;
		this.phone = phone;
		this.admin = admin;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getAdmin() {
		return admin;
	}

	public void setAdmin(int admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "MemberVO [name=" + name + ", userid=" + userid + ", pwd=" + pwd + ", phone=" + phone + ", admin="
				+ admin + "]";
	}

}
