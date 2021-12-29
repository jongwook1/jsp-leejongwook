package carInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import administrator.administratorDTO;
import board.BoardDTO;
import util.DBManager;

public class CarInfoDAO {
		
	private CarInfoDAO() {}
	private static CarInfoDAO instance =new CarInfoDAO();
	public static CarInfoDAO getInstance() {
		return instance;
	}
	
	private ArrayList<CarInfoDTO> carInfos = null;

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<CarInfoDTO> getCarInfos(){
		
		try {
			conn = DBManager.getConnection();
			
			String str = "select * from carinfo";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			carInfos = new ArrayList<CarInfoDTO>();
			
			while(rs.next()) {
				int n = rs.getInt(1);
				String carClass = rs.getString(2);
				String carName = rs.getString(3);
				int carPrice = rs.getInt(4);
				String startDate = rs.getString(5);
				String endDate = rs.getString(6);
				
				carInfos.add(new CarInfoDTO(carClass, carName, carPrice));
			};
			
			System.out.println("데이터 불러오기 완료!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터 불러오기 실패!");
		}
		
		return carInfos;
	}
	
	
	public void updateCarInfo(CarInfoDTO reserveCar) {
		try {
			
//			BoardDTO updateBoard = new BoardDTO(board.getContent());
			conn = DBManager.getConnection();
			
			String str = "update carinfo set startDate=?, endDate=? where carName=?";
			pstmt = conn.prepareStatement(str);
			
			pstmt.setString(1, reserveCar.getStartDate());
			pstmt.setString(2, reserveCar.getEndDate());
			pstmt.setString(3, reserveCar.getCarName());
			
			pstmt.executeUpdate();
			System.out.println("carinfo수정 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("carinfo수정 실패");
		}
	}
	
	
	
	
	
	
	
}
