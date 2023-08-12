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

import com.tjoeun.dao.ElecapprsawonDAO;
import com.tjoeun.vo.ElecapprsawonList;
import com.tjoeun.vo.ElecapprsawonVO;

@Controller
public class SawonController {

	private static final Logger logger = LoggerFactory.getLogger(SawonController.class);

	@Autowired
	private SqlSession sqlSession;
	
	// 결재안 올리는 페이지 불러오기(elecapprsawon.jsp)
	@RequestMapping("/elecapprsawon")
	public String elecapprsawon(HttpServletRequest request, Model model) {
		return "elecapprsawon";
	}
	
	// 사원이 보는 결재 목록 불러오기(elecapprsawonListView.jsp)
	@RequestMapping("/elecapprsawonList")
	public String elecapprsawonList(HttpServletRequest request, Model model, ElecapprsawonVO elecapprsawonVO) { 
		logger.info("elecapprsawonList");
		ElecapprsawonDAO mapper = sqlSession.getMapper(ElecapprsawonDAO.class); 
		
		// 테이블의 전체 글 개수 얻어오기
		int pageSize = 10;
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) { }
		int totalCount = mapper.selectsawonCount(elecapprsawonVO);
		logger.info("{}", totalCount);
		
		ElecapprsawonList list = new ElecapprsawonList(pageSize, totalCount, currentPage);
		
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("cnum", Integer.parseInt(request.getParameter("cnum")));
		hmap.put("startNo", list.getStartNo());
		hmap.put("endNo", list.getEndNo());
		list.setList(mapper.selectsawonList(hmap));
		
		model.addAttribute("elecapprsawonList", list);
		model.addAttribute("currentPage", currentPage);
		
		return "elecapprsawonListView"; 
	}
	  
	// 사원이 보는 글 한건 얻어오기(sawonContentView.jsp)
	@RequestMapping("/selectsawonIdx")
    public String selectsawonIdx(HttpServletRequest request, Model model, ElecapprsawonVO elecapprsawonVO) {
        logger.info(request.getParameter("selectsawonIdx"));
        ElecapprsawonDAO mapper = sqlSession.getMapper(ElecapprsawonDAO.class);
        ElecapprsawonVO eo = mapper.selectsawonIdx(elecapprsawonVO);
        model.addAttribute("eo", eo);
        model.addAttribute("currentPage", request.getParameter("currentPage"));
        return "elecapprsawonContentView";
	}
	
	// 사원이 본인이 쓴 글 수정하는 페이지
	@RequestMapping("/elecapprsawonUpdate")
	public String update(HttpServletRequest request, Model model, ElecapprsawonVO elecapprsawonVO) {
		logger.info("update");
		model.addAttribute("eo", elecapprsawonVO);
		model.addAttribute("currentPage", request.getParameter("currentPage"));
		return "elecapprsawonUpdate";
	}
	
	// 사원이 수정할 정보 저장 후 목록으로 가기
	@RequestMapping("/elecapprsawonUpdateOK")
	public String updateOK(HttpServletRequest request, Model model, ElecapprsawonVO elecapprsawonVO) {
		logger.info("updateOK");
		ElecapprsawonDAO mapper = sqlSession.getMapper(ElecapprsawonDAO.class);
		mapper.update(elecapprsawonVO);
		model.addAttribute("currentPage", request.getParameter("currentPage"));
		model.addAttribute("cnum", request.getParameter("cnum"));
		return "redirect:elecapprsawonList";
	}
	
	// 사원이 쓴 글 삭제하기
	@RequestMapping("/elecapprsawonDelete")
	public String delete(HttpServletRequest request, Model model, ElecapprsawonVO elecapprsawonVO) {
		logger.info(request.getParameter("delete"));
		ElecapprsawonDAO mapper = sqlSession.getMapper(ElecapprsawonDAO.class);
		mapper.delete(elecapprsawonVO);
		model.addAttribute("currentPage", request.getParameter("currentPage"));
		model.addAttribute("cnum", request.getParameter("cnum"));
		return "redirect:elecapprsawonList";
	}
	
}