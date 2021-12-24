package user;

import java.sql.Timestamp;

public class UserDTO {
	private String id, pw, userName, sex, email ;
	private int birth, phoneNumber;
	private Timestamp legDate;
	
	public UserDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	
	public UserDTO(String id, String pw, Timestamp legDate) {
		this.id =  id;
		this.pw =  pw;
		this.legDate = legDate;
	}
	
	public UserDTO(String id, String pw, String userName, int birth, String sex, String email, int phoneNumber) {
		this.id = id;
		this.pw = pw;
		this.userName = userName;
		this.birth = birth;
		this.sex = sex;
		this.email = email;
		this.phoneNumber = phoneNumber;
		
	}
	
	public UserDTO(String id, String pw, String userName, int birth, String sex, String email, int phoneNumber, Timestamp legDate) {
		this.id = id;
		this.pw = pw;
		this.userName = userName;
		this.birth = birth;
		this.sex = sex;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.legDate = legDate;
	}
	

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getBirth() {
		return birth;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}

	public int getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public Timestamp getLegDate() {
		return legDate;
	}

	public void setLegDate(Timestamp legDate) {
		this.legDate = legDate;
	}
	
	
}
