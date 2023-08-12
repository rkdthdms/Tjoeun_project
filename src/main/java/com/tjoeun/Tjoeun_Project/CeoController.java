package com.tjoeun.Tjoeun_Project;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjoeun.dao.CeoDao;
import com.tjoeun.vo.CeoList;
import com.tjoeun.vo.CeoVO;

@Controller
public class CeoController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(CeoController.class);
	
	// 사장이 보는 결재 목록 불러오기(CeoView.jsp)
	@RequestMapping("/Ceo")
	public String Ceo(HttpServletRequest request, Model model, CeoVO ceoVO) {
		logger.info("CeoController의 CeoView");
		
		CeoDao mapper = sqlSession.getMapper(CeoDao.class);
		
		// 사장이 보는 결재글 전체 개수 불러오기
		int pageSize = 10;
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e){}
		int totalCount = mapper.selectsawonCountByCeo(ceoVO);
		logger.info("{}", totalCount);
		
		CeoList ceoList = new CeoList(pageSize, totalCount, currentPage);
		
		// 사장이 보는 결재글 목록 불러오기
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", ceoList.getStartNo());
		hmap.put("endNo", ceoList.getEndNo());
		ceoList.setList(mapper.selectsawonListByCeo(hmap));
		
		model.addAttribute("ceoList", ceoList);
		model.addAttribute("currentPage", currentPage);
		
		return "CeoView";
	}
	
}