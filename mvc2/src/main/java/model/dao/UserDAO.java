package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

import model.dto.UserDTO;
import util.DBManager;

public class UserDAO {
	
	private UserDAO() {}
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	
	private ArrayList<model.dto.UserDTO> users = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	
	public ArrayList<UserDTO> getUsers(){
		
		try {
			conn = DBManager.getConnection();
			
			String str = "select * from users";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			users = new ArrayList<UserDTO>();
			while(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				Timestamp regDate = rs.getTimestamp(3);
				
				users.add(new UserDTO(id, pw, regDate));
			}
			System.out.println("데이터 불러오기 완료!");			
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터 불러오기 실패");
		}
		return users;
	}
	
	
	
	
	
	
	public int addUser(UserDTO user) {
		if(checkUser(user.getId())) {
			try {
				UserDTO newUser = new UserDTO(user.getId(), user.getPw(), new Timestamp(Calendar.getInstance().getTimeInMillis()));
				
				conn = DBManager.getConnection();
				
				String str = "insert into users values(?, ?, ?)";	// ?  자리는 맵핑값을 setter로 처리할 포맷이다
				pstmt = conn.prepareStatement(str);
				pstmt.setString(1, newUser.getId());
				pstmt.setString(2, newUser.getPw());
				pstmt.setTimestamp(3, newUser.getRegDate());  // 여기까지 쿼리 완성
				
				pstmt.executeUpdate();						// 완성된 쿼리를 연동된 데이터베이스에 날림	<<DB
				
				users.add(newUser);							// 실행중인 상태에서 dao의 객체배열도 업데이트	<< DAO
				
				System.out.println("업데이트 성공");
				return users.size();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("업데이트 실패");
			}
		}
		return -1;
	}


	private boolean checkUser(String id) {
		users = getUsers();
		for(UserDTO user : users ) {
			if(id.equals(user.getId()))
				return false;
		}
		return true;
	}
	
	public boolean checkLogin(String id, String pw) {
		users = getUsers();
		for(UserDTO user : users) {
			if(id.equals(user.getId()) && pw.equals(user.getPw())) {
				return true;
			}
		}
		return false;
	}
	
	
	
	

}
