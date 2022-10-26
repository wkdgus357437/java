package student.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class Student {
	Scanner scan = new Scanner(System.in);
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String username = "c##java";
	private String password = "pass";

	public Student() {

		try {
			Class.forName(driver);// 생성
		} catch (ClassNotFoundException e) {
			e.printStackTrace();

		}
	}// Student

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, password);// 생성

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// getConnection

	public void menu() {

		while (true) {
			System.out.println();
			System.out.println("****************");
			System.out.println("관리");
			System.out.println("****************");
			System.out.println("1 .입력");
			System.out.println("2. 검색");
			System.out.println("3. 삭제");
			System.out.println("4. 종료");
			System.out.println("****************");
			System.out.print("번호 선택 : ");
			int num = scan.nextInt();

			if (num == 4)
				break;

			if (num == 1)
				insertArticle();
			else if (num == 2)
				selectArticle();
			else if (num == 3)
				deleteArticle();

		} // while

	}// menu

	public void insertArticle() {

		while (true) {
			System.out.println();
			System.out.println("****************");
			System.out.println("1 .학생");
			System.out.println("2. 교수");
			System.out.println("3. 관리자");
			System.out.println("4. 이전메뉴");
			System.out.println("****************");
			System.out.print("번호 선택 : ");
			int num = scan.nextInt();
			if (num == 4)
				break;
			if (num == 1) {
				System.out.print("이름 입력 : ");
				String name = scan.next();
				System.out.print("학번 입력 : ");
				String hak = scan.next();
				this.getConnection();

				try {
					pstmt = conn.prepareStatement("insert into student values( ?, ?, 1)");// 생성
					pstmt.setString(1, name);
					pstmt.setString(2, hak);

					int su = pstmt.executeUpdate();
					System.out.println(su + "개의 행 이(가)삽입되었습니다");

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					try {
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
					} catch (SQLException e) {

						e.printStackTrace();
					}
				}
			} else if (num == 2) {
				System.out.print("이름 입력 : ");
				String name = scan.next();
				System.out.print("과목 입력 : ");
				String sub = scan.next();
				this.getConnection();

				try {
					pstmt = conn.prepareStatement("insert into student values( ?, ?, 2)");// 생성
					pstmt.setString(1, name);
					pstmt.setString(2, sub);

					int su = pstmt.executeUpdate();
					System.out.println(su + "개의 행 이(가)삽입되었습니다");

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					try {
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
					} catch (SQLException e) {

						e.printStackTrace();
					}
				}
			} else if (num == 3) {
				System.out.print("이름 입력 : ");
				String name = scan.next();
				System.out.print("부서 입력 : ");
				String dep = scan.next();
				this.getConnection();

				try {
					pstmt = conn.prepareStatement("insert into student values( ?, ?, 3)");// 생성
					pstmt.setString(1, name);
					pstmt.setString(2, dep);

					int su = pstmt.executeUpdate();
					System.out.println(su + "개의 행 이(가)삽입되었습니다");

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					try {
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
					} catch (SQLException e) {

						e.printStackTrace();
					}
				}
			}

		} // while

	}// insertArticle

	public void selectArticle() {

		while (true) {
			System.out.println("****************");
			System.out.println("관리");
			System.out.println("****************");
			System.out.println("1  이름검색");
			System.out.println("2. 전체검색");
			System.out.println("3. 이전메뉴");
			System.out.println("****************");
			System.out.print("번호 선택 : ");
			int num = scan.nextInt();

			if (num == 3)
				break;

			if (num == 1) {
				getConnection();
				System.out.print("검색 할 이름 입력 : ");
				String name = scan.next();

				String sql = "select * from student where name like ?";

				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + name + "%");

					rs = pstmt.executeQuery();//ResultSet으로 리턴

					while (rs.next()) {
						if (rs.getInt("code") == 1) {
							System.out.println("이름은" + rs.getString("name") + "\t" + "학번은" + rs.getString("value"));
						} else if (rs.getInt("code") == 2) {
							System.out.println("이름은" + rs.getString("name") + "\t" + "과목은" + rs.getString("value"));
						} else if (rs.getInt("code") == 3) {
							System.out.println("이름은" + rs.getString("name") + "\t" + "부서는" + rs.getString("value"));
						}
					}

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					try {
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();

					} catch (SQLException e) {

						e.printStackTrace();
					}
				}
			}
			if (num == 2) {
				String sql = "select * from student";
				getConnection();

				try {
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();

					while (rs.next()) {
						if (rs.getInt("code") == 1) {
							System.out.println("이름은" + rs.getString("name") + "\t" + "학번은" + rs.getString("value"));
						} else if (rs.getInt("code") == 2) {
							System.out.println("이름은" + rs.getString("name") + "\t" + "과목은" + rs.getString("value"));
						} else if (rs.getInt("code") == 3) {
							System.out.println("이름은" + rs.getString("name") + "\t" + "부서는" + rs.getString("value"));
						}
					}

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					try {
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();

					} catch (SQLException e) {

						e.printStackTrace();
					}
				}
			}
		} // while
	}// selectArticle

	public void deleteArticle() {
		String sql = "delete student where name =?";
		getConnection();
		System.out.print("삭제할 이름 입력 : ");
		String name = scan.next();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			int su = pstmt.executeUpdate();

			System.out.println(su + "개의 행을(를) 삭제되었습니다.");

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
	}// deleteArticle

	public static void main(String[] args) {
		Student student = new Student();
		student.menu();
		System.out.println("프로그램 종료");
	}

}

/*
[문제]
Project : student 
Package : student.dao 
Class : Student.java

# 테이블 작성
create table student(
name varchar2(15) not null, -- 이름
value varchar2(15), -- 학번 or 과목 or 부서
code number -- 1이면 학생, 2이면 교수, 3이면 관리자 );

menu() 
****************
관리 
****************
1. 입력 
2. 검색 
3. 삭제
4. 종료 
****************
번호선택 : 4 프로그램 종료합니다

1번인 경우 insertArticle() 
****************
1. 학생
2. 교수
3. 관리자 
4. 이전메뉴
******************
번호선택 :

1번 학생인 경우 
이름입력 : 
학번입력 :

2번 교수인 경우 
이름입력 : 
과목입력 :

3번 관리자인 경우 
이름입력 : 
부서입력 :

2번인 경우 selectArticle() 
****************
1. 이름 검색 (1개 글자가 포함된 이름은 모두 검색) 
2. 전체 검색
3. 이전메뉴
**************** 
번호선택 : 1

1번 경우
검색할 이름 입력 : 이 
이름=희동이 학번=2015 
이름=이교수 과목=JAVA

3번인 경우
deleteArticle()
삭제를 원하는 이름 입력 : (정확하게 3개의 글자가 모두 입력된 상태)



*/