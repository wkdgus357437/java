package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.bean.MemberDTO;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "pass";

	public MemberDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();

		}
}//MemberDAO
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);// 생성

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//getConnection
	
	private static MemberDAO memberDAO = new MemberDAO();
	
	public static MemberDAO getInstance() {
		
		return memberDAO;
	}//getInstance
	public int memberWrite(MemberDTO memberDTO) {
		int su =0;
		
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";
		
		getConnection();
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getId());
			pstmt.setString(3, memberDTO.getPwd());
			pstmt.setString(4, memberDTO.getGender());
			pstmt.setString(5, memberDTO.getEmail1());
			pstmt.setString(6, memberDTO.getEmail2());
			pstmt.setString(7, memberDTO.getTel1());
			pstmt.setString(8, memberDTO.getTel2());
			pstmt.setString(9, memberDTO.getTel3());
			pstmt.setString(10, memberDTO.getZipcode());
			pstmt.setString(11, memberDTO.getAddr1());
			pstmt.setString(12, memberDTO.getAddr2());
			
			su=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null)  conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return su;
	}
	public String memberLogin(String id, String pwd) {
		String name=null;
		String sql = "SELECT * FROM member WHERE id=? AND pwd=?";
		
		getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery(); //실행 -ResultSet 리턴
			if(rs.next())
				name = rs.getString("name");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			try {
			if ( rs != null )rs.close();
			 if ( pstmt != null )pstmt.close();
			 if ( conn != null )conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return name;
	}
	
}

