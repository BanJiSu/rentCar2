package model.dto;

import java.sql.Timestamp;

public class UserDTO {
	
	private String id, pw, day1, day2, time1, time2, area;
	private int phNumber, license;
	private Timestamp regDate;

	public UserDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	
	public UserDTO(String id, String pw, String day1, String day2, String time1, String time2, String area, Timestamp regDate) {
		this.id = id;
		this.pw = pw;
		this.area = area;
		this.day1 = day1;
		this.day2 = day2;
		this.time1 = time1;
		this.time2 = time2;
		this.regDate = regDate;
	}
	
	
	public String getDay1() {
		return day1;
	}

	public void setDay1(String day1) {
		this.day1 = day1;
	}

	public String getDay2() {
		return day2;
	}

	public void setDay2(String day2) {
		this.day2 = day2;
	}

	public String getTime1() {
		return time1;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public String getTime2() {
		return time2;
	}

	public void setTime2(String time2) {
		this.time2 = time2;
	}

	public int getPhNumber() {
		return phNumber;
	}

	public int getLicense() {
		return license;
	}

	public void setLicense(int license) {
		this.license = license;
	}


	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Timestamp getRegDate() {
		return regDate;
	}


	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}


}
