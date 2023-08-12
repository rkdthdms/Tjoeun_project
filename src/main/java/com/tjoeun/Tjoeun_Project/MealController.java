package com.tjoeun.Tjoeun_Project;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjoeun.dao.MealDAO;
import com.tjoeun.vo.Board_MealList;
import com.tjoeun.vo.Board_MealVO;

@Controller
public class MealController {

private static final Logger logger = LoggerFactory.getLogger(MealController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping("/mealListView")
	public String mealListView(HttpServletRequest request, Model model, HttpSession session) {
		
		Object loginSession = session.getAttribute("mvo");
		if ( loginSession == null ) return "redirect:login";

		MealDAO mapper = sqlSession.getMapper(MealDAO.class);
		
		// 전체 임원이 보는 식단표 전체 개수 불러오기
		int pageSize = 10;
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e){}
		int totalCount = mapper.selectMealCount();
		logger.info("{}", totalCount);
						
		Board_MealList mealList = new Board_MealList(pageSize, totalCount, currentPage);
						
		// 전체 임원이 보는 글 목록 불러오기
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", mealList.getStartNo());
		hmap.put("endNo", mealList.getEndNo());
		mealList.setList(mapper.selectMealList(hmap));
						
		model.addAttribute("mealList", mealList);
		model.addAttribute("currentPage", currentPage);
				
		
		
		return "mealListView";
	}
	
	@RequestMapping("/mealContentView")
	public String mealContentView(HttpSession session, HttpServletRequest request, Model model) {
		
		Object loginSession = session.getAttribute("mvo");
		if ( loginSession == null ) return "redirect:login";
		
		int idx = 1;
		int currentPage = 1;
		try {
			idx = Integer.parseInt(request.getParameter("idx"));
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			} catch (NumberFormatException e) { }
		
		
		MealDAO mapper = sqlSession.getMapper(MealDAO.class);
		
		Board_MealVO bmo = mapper.selectMealbyIdx(idx);
		
		model.addAttribute("bmo", bmo);
		model.addAttribute("currentPage", currentPage);
		return "mealContentView";
	}
	
	
	
	@RequestMapping("/mealInsert")
	public String mealInsert(HttpServletRequest request, Model model, HttpSession session) {
		
		Object loginSession = session.getAttribute("mvo");
		if ( loginSession == null ) return "redirect:login";
		
		MealDAO mapper = sqlSession.getMapper(MealDAO.class);
		
		
		
		return "mealInsert";
	}
	
	
	@RequestMapping("/mealInsertOK")
	public String mealInsertOK(HttpSession session, Board_MealVO mealVO) {
		
		Object loginSession = session.getAttribute("mvo");
		if ( loginSession == null ) return "redirect:login";
		
		logger.info("mealVO : {}", mealVO);
		
		MealDAO mapper = sqlSession.getMapper(MealDAO.class);
		mapper.mealinsert(mealVO);
		
		
		return "redirect:mealListView";
	}
	

	@RequestMapping("/mealContentDelete")
	public String mealContentDelete(HttpSession session, int idx) {
		
		Object loginSession = session.getAttribute("mvo");
		if ( loginSession == null ) return "redirect:login";
		
		logger.info(" Delete idx : {}", idx);
		
		MealDAO mapper = sqlSession.getMapper(MealDAO.class);
		mapper.mealdelete(idx);
		
		
		return "redirect:mealListView";
	}
	
	
	
}
