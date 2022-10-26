package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SelectMain {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "pass";

	public SelectMain() {
		try {
			Class.forName(driver);// 생성
		} catch (ClassNotFoundException e) {
			e.printStackTrace();

		}
	}// SelectMain

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);// 생성

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// getConnection

	public void selectArticle() {
		String sql = "select * from dbtest";

		getConnection(); // 접속

		try {
			pstmt = conn.prepareStatement(sql); //생성
			rs = pstmt.executeQuery(); //ResultSet 리턴
	
		while(rs.next()) {
			System.out.println(rs.getString("name")+"\t"
								+rs.getInt("age")+"\t"
								+rs.getDouble("height")+"\t"
								+rs.getString("logtime"));
		}//while
		
		} catch (SQLException e) {
			e.printStackTrace();
		}finally { //중요
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			
			} catch (SQLException e) {
		
				e.printStackTrace();
				}
			}
	}// selectAricle

	public static void main(String[] args) {
		SelectMain selectMain = new SelectMain();
		selectMain.selectArticle();
	}

}

