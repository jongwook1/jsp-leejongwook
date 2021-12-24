package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBManager {
	
	private DBManager() {}	
	
//	private static DBManager instance = new DBManager();
//	public static DBManager getInstance() {
//		return instance;
//	}
	
	// 모든 DAO 안에서 DB 연동이 필요할때,
	// Connection conn = DBManager.getConnection();
	
	// 연동된 DB(Schema) 안에 있는 데이터 중,
	// 어떤 테이블을 쓸지 -> use 스키마명 (sql 명렁어 추가)
	
	public static Connection getConnection() {
		Connection conn = null;
		
		//DB연동 코드
		try {
			// 드라이버 연동 (jdbc mysql connector (.jar)를 -> WEB-INF/lib 폴더로 넣어주기)
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//jdbc:mysql://localhost:3306/데이터베이스스키마명?serverTimezone=UTC
			String url = "jdbc:mysql://localhost:3306/rentcar?serverTimezone=UTC"; // 데이타베이스 주소 
			String id=  "root";
			String pw = "!kalhl7208";
			
			conn = DriverManager.getConnection(url, id, pw); 
			
			if(conn != null) {
				System.out.println("데이터베이스 연동 성공");
			}			
			
		} catch (Exception e) {
			System.out.println("데이터베이스 연동 실패..");
			e.printStackTrace();
		}
		
		
		return conn;
	}
	
	
}
