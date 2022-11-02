package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;

public class MemberDAO {
	   private SqlSessionFactory sqlSessionFactory;

	   
	   private static MemberDAO memberDAO = new MemberDAO();

	
	   public static MemberDAO getInstance() {
		
		   return memberDAO;
	   }
	   
	   public MemberDAO() {
		   try {
				Reader reader = Resources.getResourceAsReader("mybatis-config.xml");   /* src에서 파일을 읽어와서 환경설정. 추상클래스라서 뉴를 하면안된다 */
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
	   }
	   
	   public int memberWrite(MemberDTO memberDTO) {
		   SqlSession sqlSession = sqlSessionFactory.openSession();
		   int su = sqlSession.insert("memberSQL.memberWrite", memberDTO);
		   sqlSession.commit();
		   sqlSession.close();		   
		   return su;
	   	}

	   public MemberDTO memberLogin(String id, String pwd) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("pwd", pwd);			
			
			SqlSession sqlSession = sqlSessionFactory.openSession();
			MemberDTO memberDTO = sqlSession.selectOne("memberSQL.memberLogin",map);
			sqlSession.close();
			
			return memberDTO; //memberDTO를 통채로 보내야한다.
		}
	   
	   
		public boolean isExistId(String id) {
			boolean exist = false;
			SqlSession sqlSession = sqlSessionFactory.openSession();
			MemberDTO memberDTO = sqlSession.selectOne("memberSQL.isExistId",id);
			if(memberDTO != null)
				exist = true;
			sqlSession.close();
			return exist;	
			
			
			
		}

		public MemberDTO getMember(String id) {
			SqlSession sqlSession = sqlSessionFactory.openSession();
			MemberDTO memberDTO = sqlSession.selectOne("memberSQL.getMember",id);
			sqlSession.close();
			return memberDTO;
		}

		public void memberUpdate(MemberDTO memberDTO) {
			SqlSession sqlSession = sqlSessionFactory.openSession();
			   sqlSession.update("memberSQL.memberUpdate", memberDTO);
			   sqlSession.commit();
			   sqlSession.close();		
		}


}





























