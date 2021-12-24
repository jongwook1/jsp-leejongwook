package administrator;

import java.sql.Timestamp;

public class administratorDTO {
	private String id, pw;
	private Timestamp legDate;
	
	public administratorDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	
	public administratorDTO(String id, String pw, Timestamp legDate) {
		this.id = id;
		this.pw = pw;
		this.legDate = legDate;
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
