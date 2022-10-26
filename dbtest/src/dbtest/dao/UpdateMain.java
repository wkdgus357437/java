package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class UpdateMain {

	private Connection conn;
	private PreparedStatement pstmt;

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "pass";

	public UpdateMain() {

		try {
			Class.forName(driver);// 생성
		} catch (ClassNotFoundException e) {
			e.printStackTrace();

		}

	}// UpdateMain

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);// 생성

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// getConnection

	public void UpdateArticle() {
		Scanner scan = new Scanner(System.in);
		System.out.print("수정 할 이름 입력 : ");
		String name = scan.next();

		// DB접속
		getConnection();// 호출

		String sql = "update dbtest set age=age+1, height=height+1 where name like ?"; // %?% 안됨, %와 ? 같이 쓸 수 없다
		try {
			pstmt = conn.prepareStatement(sql);// 생성
			pstmt.setString(1, "%" + name + "%");

			int su = pstmt.executeUpdate();// 실행
			
			System.out.println(su + "개의 행을(를) 수정되었습니다.");
		} catch (SQLException e) {

			e.printStackTrace();
		}finally { //중요 
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
		
				e.printStackTrace();
			}
		}

	}// UpdateArticle

	public static void main(String[] args) {
		UpdateMain updateMain = new UpdateMain();
		updateMain.UpdateArticle();
	}

}
