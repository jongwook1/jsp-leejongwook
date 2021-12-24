package userChoice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import user.UserDAO;
import user.UserDTO;
import util.DBManager;

public class UserChoiceDAO {
	
	private UserChoiceDAO() {}
	private static UserChoiceDAO instance = new UserChoiceDAO();
	public static UserChoiceDAO getInstance() {
		return instance;
	}
	
	private ArrayList<UserChoiceDTO> userChoose = null;
	private ArrayList<UserChoiceDTO> reserveInfo = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//아이디가 같은 users 테이블데이터와 userChoice테이블데이터 조회
	//로그인한 유저가 선택한 데이타전체 조회
	public ArrayList<UserChoiceDTO> getUserChoose(String reserveId){
		
		try {
			conn = DBManager.getConnection();
			
			String str = "select * from users a, userChoice b where 1=1 and a.id = b.id and a.id = ?";
						 	
			pstmt = conn.prepareStatement(str);
			pstmt.setString(1, reserveId);
			rs = pstmt.executeQuery();			
			
			System.out.println("와일문돌기전::::::::::"+pstmt);
			reserveInfo = new ArrayList<>();
			while(rs.next()) {		// 행(row) 단위
				String id1 = rs.getString(1);	// id 
				String pw = rs.getString(2);	// pw
				String uN1 = rs.getString(3);
				int birth1 = rs.getInt(4);
				String sex = rs.getString(5);
				String email = rs.getString(6);
				int phoneNumber1 = rs.getInt(7);	
				Timestamp regDate1 = rs.getTimestamp(8);
				
				int no = rs.getInt(9);
				String id2 = rs.getString(10);
				String starD = rs.getString(11);
				String endD = rs.getString(12);
				String cSpot = rs.getString(13);
				String carChoice = rs.getString(14);
				String carC = rs.getString(15);
				String carN = rs.getString(16);
				int carP = rs.getInt(17);
				String uN2 = rs.getString(18);
				int birth2 = rs.getInt(19);
				int phoneNumber2 = rs.getInt(20);
				int drL = rs.getInt(21);
				int dC = rs.getInt(22);
				int totalP = rs.getInt(23);							
				Timestamp regDate2 = rs.getTimestamp(24);
				//예약내역에 출력할 배열인 reserveInfo에 추가
				reserveInfo.add(new UserChoiceDTO(starD, endD, carC, carN, carP, uN2, dC, totalP, regDate2));
			}
			
			
//			<td>시작일자</td>
//            <td>반납일자</td>
//
//            <td>차종</td>
//            <td>차 이름</td>				
//            <td>하루가격</td>
//            <td>제 1운전자 성명</td>
//            <td>총 기간</td>
//            <td>최종비용</td>
//            <td>예약시점</td>
			
			
			System.out.println(pstmt);
			
			System.out.println("예약내역 불러오기 성공");
		} catch (Exception e) {
			System.out.println(pstmt + "---- FAIL");
			System.out.println("예약내역 불러오기 실패");
			e.printStackTrace();
		}
		
		return reserveInfo;
	}
	
	
	
	public void addUserChoose(UserChoiceDTO userC) {
		
		try {
			int max_no = 0;
			conn = DBManager.getConnection();
			String maxStr = "select max(no) from userChoice";
			pstmt = conn.prepareStatement(maxStr);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				max_no = rs.getInt(1) + 1;
			}
			
			userChoose = new ArrayList<>();
			
			UserChoiceDTO newUserCDTO = new UserChoiceDTO(userC.getId(), userC.getStartDate(), userC.getEndDate(), userC.getChoiceSopt(), userC.getCarChoice(), userC.getCarClass(), userC.getCarName(), userC.getCarPrice(), userC.getUserName(), userC.getDayCount(), userC.getTotalPrice(), new Timestamp(Calendar.getInstance().getTimeInMillis()));
			
													  //1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16
			String str = "insert into userChoice values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(str);
			pstmt.setInt(1, max_no);
			pstmt.setString(2, userC.getId());
			pstmt.setString(3, userC.getStartDate());
			pstmt.setString(4, userC.getEndDate());
			pstmt.setString(5, userC.getChoiceSopt());
			pstmt.setString(6, userC.getCarChoice());
			pstmt.setString(7, userC.getCarClass());
			pstmt.setString(8, userC.getCarName());			
			pstmt.setInt(9, userC.getCarPrice());	//carPrice 얘인트			
			pstmt.setString(10, userC.getUserName());			//이아래다인트
			pstmt.setInt(11, userC.getBirth());
			pstmt.setInt(12, userC.getPhoneN());
			pstmt.setInt(13, userC.getDrLicense());
			pstmt.setInt(14, userC.getDayCount());
			pstmt.setInt(15, userC.getTotalPrice());
			pstmt.setTimestamp(16, newUserCDTO.getLegDate());
			
			pstmt.execute();
			
			System.out.println(pstmt);
			
			userChoose.add(newUserCDTO);
			System.out.println("유저선택 추가성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(pstmt + "---- FAIL");
			System.out.println("업데이트실패");
		}
		
	}
	
	
	
	public int dateCount(String startDate, String endDate) throws ParseException {
		String tempStartDate = startDate;
		String tempEndDate = endDate;
		
		Date format1 = new SimpleDateFormat("yyyy-MM-dd").parse(tempStartDate);
		Date format2 = new SimpleDateFormat("yyyy-MM-dd").parse(tempEndDate);
		
		long diffSec = (format2.getTime() - format1.getTime()) / 1000;
		long diffDays = diffSec / (24*60*60);
		int newDiffDays = Long.valueOf(diffDays).intValue();
		return newDiffDays;
	}
	
	public int disCountPrice(int dayCount, int totalPrice) {
		System.out.println("할인메소드 들어오냐");
		int dayCount2 = dayCount;
		int monthCount = (int) Math.round(dayCount/30) ;
		int totalPrice2 = totalPrice;
		double discountA = 0.15;
		double discountB = 0.25;
		double discountC = 0.35;
		System.out.println("monthCount" + monthCount);
		if(monthCount >= 9){
			totalPrice2 =  (int) Math.round(totalPrice*(1-discountC));
			return totalPrice2;
		}
		else if(monthCount >= 6){
			totalPrice2 =  (int) Math.round(totalPrice*(1-discountB));
			return totalPrice2;
		}
		else if(monthCount >= 3){
			totalPrice2 =  (int) Math.round(totalPrice*(1-discountA));
			return totalPrice2;
		}
		return totalPrice2;
		
	}

}
