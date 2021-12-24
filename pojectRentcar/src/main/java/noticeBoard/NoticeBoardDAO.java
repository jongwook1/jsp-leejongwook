package noticeBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

import board.BoardDAO;
import board.BoardDTO;
import util.DBManager;

public class NoticeBoardDAO {

	private NoticeBoardDAO() {};
	private static NoticeBoardDAO instance = new NoticeBoardDAO();
	public static NoticeBoardDAO getInstance(){
		return instance;
	}
	
	private ArrayList<NoticeBoardDTO> noticeBoardList = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;	
	
	
	//전체조회
	public ArrayList<NoticeBoardDTO> getNoticeBoard(){
		try {
			conn = DBManager.getConnection();
			String str = "select * from noticeBoard";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			noticeBoardList = new ArrayList<>();
			while(rs.next()) {				
				int no =  Integer.parseInt(rs.getString(1));
				String id = rs.getString(2);
				String pw = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);				
				Timestamp regDate = rs.getTimestamp(6);
				
				noticeBoardList.add(new NoticeBoardDTO(no, id, pw, title, content, regDate));
				
				
			}
			System.out.println("공지보드데이터 불러오기 완료!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("공지보드데이터 불러오기 실패");
		}
		
		
		return noticeBoardList;
	}
	
	//단건 조회
	public ArrayList<NoticeBoardDTO> getBoardOne(String strNo ){
		try {
			conn = DBManager.getConnection();
			String str = "select no, id, pw, title, content, regDate from noticeBoard where no = "+ strNo;
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			noticeBoardList = new ArrayList<>();
			while(rs.next()) {				
				int no =  Integer.parseInt(rs.getString(1));
				String id = rs.getString(2);
				String pw = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);				
				Timestamp regDate = rs.getTimestamp(6);
				
				
				noticeBoardList.add(new NoticeBoardDTO(no, id, pw, title, content, regDate));
			}
			System.out.println("보드데이터 단건 불러오기 완료!");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("보드데이터 단건 불러오기 실패");
		}
		
		
		return noticeBoardList;
	}	
	
//추가	
	public void addNoitceBoard(NoticeBoardDTO board) {
		
		try {
			int max_no = 0;
			conn = DBManager.getConnection();

			String maxStr = "select max(no) from noticeBoard"; 
			pstmt = conn.prepareStatement(maxStr);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				max_no= rs.getInt(1) + 1;
			}
			
			//System.out.println("max_no == " + max_no);
			
			BoardDTO newBoard = new BoardDTO(board.getId(), board.getPw(), board.getTitle(), board.getContent());
			String str = "insert into noticeBoard values(?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(str);
			pstmt.setInt(1, max_no);
			pstmt.setString(2, newBoard.getId());
			pstmt.setString(3, newBoard.getPw());
			pstmt.setString(4, newBoard.getTitle());
			pstmt.setString(5, newBoard.getContent());									
			pstmt.setTimestamp(6, new Timestamp(Calendar.getInstance().getTimeInMillis()));			
			pstmt.executeUpdate();
			
			
			System.out.println(pstmt);			
	
			
			System.out.println("공지보드추가 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("공지보드추가 실패");
		}
	}
	
	//수정
	public void updateNoticeBoard(NoticeBoardDTO board) {
		try {
			
//			BoardDTO updateBoard = new BoardDTO(board.getContent());
			conn = DBManager.getConnection();
			
			String str = "update noticeBoard set content=? where no=?";
			pstmt = conn.prepareStatement(str);
			pstmt.setString(1, board.getContent());
			pstmt.setInt(2, board.getNo());
			pstmt.executeUpdate();
			System.out.println("보드수정 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("보드수정 실패");
		}
	}
	
	//삭제
	
	public void deleteNoticeBoard(NoticeBoardDTO board) {
		try {
			conn = DBManager.getConnection();
			
			String str = "delete from noticeBoard where no=?";
			
			pstmt = conn.prepareStatement(str);
			pstmt.setInt(1, board.getNo());
			pstmt.executeUpdate();
			System.out.println("보드삭제 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("보드삭제 실패");
		}
	}
	
	
}
