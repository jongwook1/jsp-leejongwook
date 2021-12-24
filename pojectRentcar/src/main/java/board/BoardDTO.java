package board;

import java.sql.Timestamp;

public class BoardDTO {
	private int no;
	private String id, pw, title, content;
	Timestamp regDate;
	
	
	public BoardDTO(int no) {
		this.no = no;
	}
	
	public BoardDTO(int no, String content) {
		this.no = no;
		this.content = content;	
	}
	
	public BoardDTO(String id, String pw, String title, String content) {
	
		this.id = id;
		this.pw = pw;
		this.title = title;
		this.content = content;	
	}
	

	public BoardDTO(int no, String id, String pw, String title, String content, Timestamp regDate) {
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.title = title;
		this.content = content;
		
		this.regDate =regDate;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		
		return String.format("%s/%s/%s/%s/%s/%s", no,id,pw,title,content,regDate);
	}


}
