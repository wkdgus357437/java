package user.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {
	private SqlSessionFactory sqlSessionFactory; // sql 세션 만들어주기 딱 1번만 하면됨 그리고 생성자 만들기
	private static UserDAO userDAO = new UserDAO();
	// private 으로 설정했기 떄문에 외부에서는 접근안된다.

	public static UserDAO getInstance() {
		return userDAO;

	}

	public UserDAO() { // 생성자
		// 1.환경설정 파일(mybatis-config.xml)을 읽어온다.
		// Reader reader= new Reader(); 추상클래스이기 떄문에 new 안된다 .
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml"); // 진행 후 try,catch
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void write(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); // 생성
		sqlSession.insert("userSQL.write", userDTO); // 메소드의 이름을 맵퍼에 있는 이름(insert id="")과 통일하여 써놓아야 구분가능
		sqlSession.commit(); // 꼭 해주기 자동으로 안됨
		sqlSession.close();

	}

	public List<UserDTO> getList() {
		SqlSession sqlSession = sqlSessionFactory.openSession(); // 생성
		List<UserDTO> list = sqlSession.selectList("userSQL.getList");
		sqlSession.close();
		return list;
	}

	public UserDTO getUser(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); // 생성
		UserDTO userDTO = sqlSession.selectOne("userSQL.getUser", id); // id값을 달라
		System.out.println("userDTO = " + userDTO);
		sqlSession.close();
		return userDTO;
	}

	public int update(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); // 생성
		int su = sqlSession.update("userSQL.update", map);
		sqlSession.commit(); // 꼭 해주기 자동으로 안됨
		sqlSession.close();
		return su;
	}

	public void delete(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("userSQL.delete", id);
		sqlSession.commit(); // 꼭 해주기 자동으로 안됨
		sqlSession.close();
	}

	public List<UserDTO> search(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.search", map);
		sqlSession.close();
		return list;

	}

}

//mybatis-config.xml 환경설정
//1. Connection
//2. mapper.xml(SQL)의 위치, SQL 문장 집어넣어 처리해라
//3. 별칭
// 
//commit -> insert / delete / update 떄 한다