package administrator;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import user.UserDAO;
import user.UserDTO;
import util.DBManager;

public class administratorDAO {

	private administratorDAO() {}

	private static administratorDAO instance = new administratorDAO();

	public static administratorDAO getInstance() {
		return instance;
	}

	private ArrayList<administratorDTO> administrators = null;

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public ArrayList<administratorDTO> getAdministrators() {

		// 쿼리를 스트링 타입으로 작성
		try {
//			conn = getConnection();				// DB연동

			conn = DBManager.getConnection(); // DB연동
			// util폴더의 DBManager를 만들면서 수정됌 -> conn = DBManager.getConnection(); 으로

			String str = "select * from administrator"; // sql 쿼리를 준비
			pstmt = conn.prepareStatement(str); // 쿼리를 prepareStatement() 메소드를 활용해서 태움
			rs = pstmt.executeQuery(); // 쿼리를 날림과 동시에 rs로 결과값을 받음

			administrators = new ArrayList<>();
			while (rs.next()) { // 행(row) 단위
				String id = rs.getString(1); // id
				String pw = rs.getString(2); // pw				
				Timestamp regDate = rs.getTimestamp(3);

				administrators.add(new administratorDTO(id, pw, regDate));
			}

			System.out.println("데이터 불러오기 완료!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터 불러오기 실패");
		}
		return administrators;
	}
	
	private boolean checkUser(String id) {
		administrators = getAdministrators();
		for(administratorDTO administrator : administrators) {
			if(id.equals(administrator.getId()))
				return false;
		}
		return true;
	}
	
	public boolean checkLogin(String id, String pw) {
		administrators = getAdministrators();
		for(administratorDTO administrator : administrators) {
			if(administrator.getId().equals(id) && administrator.getPw().equals(pw))
				return true;
		}
		return false;
	}

}
