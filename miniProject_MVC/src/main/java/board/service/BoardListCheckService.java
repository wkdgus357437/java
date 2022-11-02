package board.service;

import java.awt.im.InputMethodRequests;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardListCheckService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
	
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		//세션
		HttpSession session = request.getSession();
		String id ="hong";
		//String id = (String)session.getAttribute("memId");
		
		//페이징 처리
		int endNum = pg*5;
		int startNum = endNum -4;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		//DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> list = boardDAO.boardList(map);
		request.setAttribute("list",list);
		
		//페이징 처리
		int totalA = boardDAO.getTotalA(); //총 글수

		BoardPaging boardPaging =new BoardPaging();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		
		
		//request.setAttribute("pg",pg);
		//request.setAttribute("list",list);
		//request.setAttribute("boardPaging",boardPaging);
		//request.setAttribute("id",id);
		request.setAttribute("pagingHTML",boardPaging.getPagingHTML());

		return "/board/boardListCheck.jsp";
	}

}
