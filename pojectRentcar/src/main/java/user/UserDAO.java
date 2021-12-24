package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import util.DBManager;

public class UserDAO {
	
	public static final int REMOVE = 0;
	public static final int UPDATE = 1;
	
	
	private UserDAO() {}
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	
// 2. DTO에 대한 객체 배열 (ArrayList)
	private ArrayList<UserDTO> users = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
//	 데이터 조회 (객체 배열을 초기화 - 가져온 데이터에 대해서)
	public ArrayList<UserDTO> getUsers(){
						
		// 쿼리를 스트링 타입으로 작성
		try {
//			conn = getConnection();				// DB연동
			
			conn = DBManager.getConnection();				// DB연동
			//util폴더의 DBManager를 만들면서 수정됌 -> conn = DBManager.getConnection(); 으로
			
			String str = "select * from users"; 	//sql 쿼리를 준비
			pstmt = conn.prepareStatement(str);		// 쿼리를 prepareStatement() 메소드를 활용해서 태움
			rs = pstmt.executeQuery();				// 쿼리를 날림과 동시에 rs로 결과값을 받음
			
			users = new ArrayList<>();
			while(rs.next()) {		// 행(row) 단위
				String id = rs.getString(1);	// id 
				String pw = rs.getString(2);	// pw
				String userName = rs.getString(3);
//				int birth = rs.getString(4);
				int birth = rs.getInt(4);
				String sex = rs.getString(5);
				String email = rs.getString(6);
				int phoneNumber = rs.getInt(7);				
				Timestamp regDate = rs.getTimestamp(8);
				
				users.add(new UserDTO(id,pw,regDate));
			}
			
			System.out.println("데이터 불러오기 완료!");
		} catch (Exception e) {		
			e.printStackTrace();
			System.out.println("데이터 불러오기 실패");
		}		
		return users;
	}
	
	
	public int addUser(UserDTO user) {
		System.out.println("여긴들어오냐");
		if (checkUser(user.getId())) {
			
			try {
				UserDTO newUser = new UserDTO(user.getId(), user.getPw(), new Timestamp(Calendar.getInstance().getTimeInMillis()));
				conn = DBManager.getConnection();
				System.out.println("conn"+conn);
				
				String str = "insert into users values(?, ?, ?, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(str);
				pstmt.setString(1, newUser.getId());
				pstmt.setString(2, newUser.getPw());
				pstmt.setString(3, user.getUserName());
				pstmt.setInt(4, user.getBirth());
				pstmt.setString(5, user.getSex());
				pstmt.setString(6, user.getEmail());
				pstmt.setInt(7, user.getPhoneNumber());
				
				pstmt.setTimestamp(8, newUser.getLegDate());
				
				pstmt.execute();
				
//				users.add(newUser);
//				System.out.println("업데이트성공");
				
				users.add(newUser);
				
				System.out.println("업데이트성공");
				return users.size();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	

	private boolean checkUser(String id) {
		users = getUsers();
		for(UserDTO user : users) {
			if(id.equals(user.getId()))
				return false;
		}
		return true;
	}
	
	public boolean checkLogin(String id, String pw) {
		users = getUsers();
		for(UserDTO user : users) {
			if(user.getId().equals(id) && user.getPw().equals(pw))
				return true;
		}
		return false;
	}
	
	
	public int deleteUser(String id, String pw) {
		users = getUsers();
		int delIdx = -1;
		for(int i=0; i<users.size(); i++) {
			if(id.equals(users.get(i).getId()) && pw.equals(users.get(i).getPw())) {
				delIdx = i;
			}				
		}
		
		if(delIdx != -1) {
			try {
				conn = DBManager.getConnection();
				
				String sql = "DELETE FROM users WHERE id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();		// DB
				
				users.remove(delIdx);		// dao객체배열에서 삭제할아이디가 들어있는 인덱스에 맞게 삭제
				
				
				return delIdx;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
		
	}
	
//	public int dateCount(String startDate, String endDate) throws ParseException {
//		String tempStartDate = startDate;
//		String tempEndDate = endDate;
//		
//		Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(tempStartDate);
//		Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(tempEndDate);
//		
//		long diffSec = (format1.getTime() - format2.getTime()) / 1000;
//		long diffDays = diffSec / (24*60*60);
//		int newDiffDays = Long.valueOf(diffDays).intValue();
//		return newDiffDays;
//	}
	
}
