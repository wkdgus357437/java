package user.service;

import java.util.List;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDeleteService implements UserService {

	@Override
	public void execute() {
		System.out.println();
		Scanner scan = new Scanner(System.in);

		//데이터
		System.out.print("삭제할 아이디 입력 : ");
		String id = scan.next();

		UserDAO userDAO = UserDAO.getInstance();//싱글톤
		UserDTO userDTO = userDAO.getUser(id);
		
		//응답 //한 사람의 정보
		if(userDTO == null) {
			System.out.println("찾고자 하는 아이디가 없습니다.");
			return;
		}
		userDAO.delete(id);
		System.out.println("데이터를 삭제하였습니다.");
	}
}

/*
 * 삭제 할 아이디 입력 : angel 
 찾고자 하는 아이디가 없습니다.
  
  삭제할 아이디 입력 : hong 데이터를 삭제하였습니다.
 */
