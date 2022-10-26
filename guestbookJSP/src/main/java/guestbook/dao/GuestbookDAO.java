package guestbook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import guestbook.bean.GuestbookDTO;

public class GuestbookDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "pass";
	
	private static GuestbookDAO guestbookDAO = new GuestbookDAO();
	
	public static GuestbookDAO getInstance() {
		System.out.println("getInstance()");
		return guestbookDAO;
	}
	
	public GuestbookDAO() {
		try {
			Class.forName(driver);
			System.out.println("driver loading");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);
			System.out.println("Connection");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void guestbookWrite(GuestbookDTO guestbookDTO) {
		String sql = "insert into guestbook values(seq_guestbook.nextval,?,?,?,?,?,sysdate)";
		
		this.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql); //생성
			pstmt.setString(1, guestbookDTO.getName());
			pstmt.setString(2, guestbookDTO.getEmail());
			pstmt.setString(3, guestbookDTO.getHomepage());
			pstmt.setString(4, guestbookDTO.getSubject());
			pstmt.setString(5, guestbookDTO.getContent());
			
			pstmt.executeUpdate();//실행
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<GuestbookDTO> guestbookList(Map<String, Integer> map){
		ArrayList<GuestbookDTO> list = new ArrayList<GuestbookDTO>();//생성
		
		String sql = "select * from "
				+ "(select rownum rn, tt.* from "
				+ "(select seq, name, email, homepage, subject, content, to_char(logtime, 'yyyy.mm.dd') as logtime "
				+ " from guestbook order by seq desc) tt"
				+ ") where rn>=? and rn<=?";
		
		getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, map.get("startNum"));
			pstmt.setInt(2, map.get("endNum"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				GuestbookDTO guestbookDTO = new GuestbookDTO();
				guestbookDTO.setSeq(rs.getInt("seq"));
				guestbookDTO.setName(rs.getString("name"));
				guestbookDTO.setEmail(rs.getString("email"));
				guestbookDTO.setHomepage(rs.getString("homepage"));
				guestbookDTO.setSubject(rs.getString("subject"));
				guestbookDTO.setContent(rs.getString("content"));
				guestbookDTO.setLogtime(rs.getString("logtime"));
				
				list.add(guestbookDTO);
				
			}//while
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	public int getTotalA() {
		int totalA = 0;
		String sql = "select count(*) from guestbook";
		
		getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql); //생성
			rs = pstmt.executeQuery(); //실행
			
			rs.next();
			totalA = rs.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return totalA;
	}
}













