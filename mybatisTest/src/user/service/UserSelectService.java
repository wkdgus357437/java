package user.service;

import java.util.List;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSelectService implements UserService {

	@Override
	public void execute() {
		System.out.println();

		// DB
		UserDAO userDAO = UserDAO.getInstance();// 싱글톤
		List<UserDTO> list = userDAO.getList();

		// 응답
		for (UserDTO userDTO : list) {
			System.out.println(userDTO.getName() + "\t" 
							+ userDTO.getId() + "\t" 
							+ userDTO.getPwd());

		} // for

	}//execute

}
