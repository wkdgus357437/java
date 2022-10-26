package dbtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class InsertMain {

	private Connection conn;
	private PreparedStatement pstmt;
	
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "pass";
	
	public InsertMain() { //생성자 
		//driver loading
		//OracleDriver.class =>파일명만 알고있다 =>클래스 ? 인터페이스 ?
				
		//Class.forName("풀 쿼리 네임 =>패키지")
	
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");//oracle.jdbc.driver.OracleDriver //oracle.jdbc.OracleDriver.class
		System.out.println("driver loading success");
	} catch (ClassNotFoundException e) {
		
		e.printStackTrace();
	}
	
	}//InsertMain
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);//생성 
			System.out.println("connection success");
		
		} catch (SQLException e) {			
			e.printStackTrace();
		}
	}//getConnection
	
	public void insertArticle() {
		//	데이터
		Scanner scan = new Scanner(System.in);
		System.out.print("이름 입력 : ");
		String name = scan.next();
		System.out.print("나이 입력 : ");
		int age = scan.nextInt();
		System.out.print("키 입력 : ");
		double height = scan.nextDouble();
		
		
		this.getConnection();
		
		//preparedStatement pstmt = Connection의 prepareStatement() 통해서 생성
		try {
			pstmt = conn.prepareStatement("insert into dbtest values( ?, ?, ?, sysdate)");//생성
			pstmt.setString(1, name);
			pstmt.setInt(2, age);
			pstmt.setDouble(3, height);
			
			int su = pstmt.executeUpdate();//실행 -개수 리턴
			System.out.println(su+"개의 행 이(가)삽입되었습니다");
		
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
		
				e.printStackTrace();
			}
		}
	}//insertArticle
	public static void main(String[] args) {
		InsertMain insertMain = new InsertMain();
		insertMain.insertArticle();
	}

}

