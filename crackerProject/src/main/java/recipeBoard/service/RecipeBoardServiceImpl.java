package recipeBoard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import recipeBoard.bean.RecipeBoardDTO;
import recipeBoard.bean.RecipeBoardPaging;
import recipeBoard.dao.RecipeBoardDAO;

@Service
public class RecipeBoardServiceImpl implements RecipeBoardService {
	@Autowired
	private HttpSession session;
	
	@Autowired
	private RecipeBoardDAO recipeBoardDAO;
	
	@Autowired
	private RecipeBoardPaging recipeBoardPaging;
	@Override
	public RecipeBoardDTO getRecipeBoardView(String seq) {
		
		return recipeBoardDAO.getRecipeBoardView(seq);
	}

	@Override
	public Map<String, Object> getRecipeBoardList(Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg"))*20;
		int startNum = endNum - 19;
		//DB 1페이지당 5개
		
		map.put("endNum", endNum+"");
		map.put("startNum", startNum+"");
		List<BoardDTO> list = recipeBoardDAO.getRecipeBoardList(map);
		//세션
		String memId= (String)session.getAttribute("memLogin");
		//페이징 처리
//		recipeBoardPaging = this.getBoardPaging(pg);
		//새로고침 방지
		if(session.getAttribute("memLogin") != null) {
			session.setAttribute("memHit", 0);
		}
		Map<String,Object> sendMap = new HashMap<String,Object>();
		sendMap.put("memId",memId);
		sendMap.put("list", list);
//		sendMap.put("recipeBoardPaging", recipeBoardPaging);
		return sendMap;
	}

	@Override
	public void recipeBoardWrite(Map<String, String> map) {
		String nickName = (String) session.getAttribute("memLogin");
		map.put("nickName",nickName);
		System.out.println(map.get("nickName"));
		
		recipeBoardDAO.recipeBoardWrite(map);
		
	}

}
