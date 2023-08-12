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

import com.tjoeun.dao.ApprovalDAO;
import com.tjoeun.vo.CeoList;
import com.tjoeun.vo.CeoVO;
import com.tjoeun.vo.ElecapprsawonList;
import com.tjoeun.vo.ElecapprsawonVO;

@Controller
public class ApprovalController {

	private static final Logger logger = LoggerFactory.getLogger(ApprovalController.class);

	@Autowired
	private SqlSession sqlSession;
	
	// 결재안에 따른 목록 불러오기
	@RequestMapping("/approvalList")
	public String approvalList(HttpServletRequest request, Model model, ElecapprsawonVO elecapprsawonVO, CeoVO ceoVO) {
		logger.info("InsertController 클래스의 approvalList() 메소드 실행");
		int cnum = Integer.parseInt(request.getParameter("cnum").trim());
		String paper = request.getParameter("paper").trim();
		
		ApprovalDAO mapper = sqlSession.getMapper(ApprovalDAO.class);
		
		// 사장이 보는 결재글 전체 개수 불러오기
		int pageSize = 10;
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e){}
		int totalCount = mapper.selectApprovalCountByCeo(ceoVO);
		logger.info("{}", totalCount);
		
		// 사장이 보는 결재글 목록 불러오기
		CeoList ceoList = new CeoList(pageSize, totalCount, currentPage);
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("startNo", ceoList.getStartNo());
		hmap.put("endNo", ceoList.getEndNo());
		hmap.put("paper", paper);
		ceoList.setList(mapper.selectApprovalListByCeo(hmap));
		
		// 사원이 보는 결재글 전체 개수 불러오기
		pageSize = 10;
		currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (NumberFormatException e) { }
		totalCount = mapper.selectApprovalCount(elecapprsawonVO);
//		logger.info("{}", totalCount);
		
		// 사원이 보는 결재글 목록 불러오기
		ElecapprsawonList list = new ElecapprsawonList(pageSize, totalCount, currentPage);
		HashMap<String, Object> hmap_e = new HashMap<String, Object>();
		hmap_e.put("cnum", cnum);
		hmap_e.put("startNo", list.getStartNo());
		hmap_e.put("endNo", list.getEndNo());
		hmap_e.put("paper", paper);
		list.setList(mapper.selectApprovalList(hmap_e));
		logger.info("{}", list);
		
		// 결재안에 따라 보여지는 페이지 별로 return하기
		model.addAttribute("paper", paper);
		model.addAttribute("currentPage", request.getParameter("currentPage"));
		if (cnum == 220) {
			model.addAttribute("ceoList", ceoList);
			if (paper.equals("지출결의서")) {
				return "CeoApprovalList_Ji";
			} else if (paper.equals("휴가근태서")) {
				return "CeoApprovalList_Hu";
			} else if (paper.equals("제안서")) {
				return "CeoApprovalList_Je";
			} else if (paper.equals("공문")) {
				return "CeoApprovalList_Go";
			} else if (paper.equals("사직서")) {
				return "CeoApprovalList_Sa";
			} else {
				return "mainBoardList";
			}
		} else {
			model.addAttribute("elecapprsawonList", list);
			if (paper.equals("지출결의서")) {
				return "approvalList_Ji";
			} else if (paper.equals("휴가근태서")) {
				return "approvalList_Hu";
			} else if (paper.equals("제안서")) {
				return "approvalList_Je";
			} else if (paper.equals("공문")) {
				return "approvalList_Go";
			} else if (paper.equals("사직서")) {
				return "approvalList_Sa";
			} else {
				return "mainBoardList";
			}
		}
	}
	
	// 결재안 쓰는 페이지 불러오기(approvalInsert.jsp)
	@RequestMapping("/approvalInsert")
	public String approvalInsert(HttpServletRequest request, Model model) {
		logger.info("InsertController 클래스의 approvalInsert() 메소드 실행");
		model.addAttribute("paper", request.getParameter("paper"));
		model.addAttribute("currentPage", request.getParameter("currentPage"));
		return "approvalInsert";
	}
	
	// 결재안 저장
	@RequestMapping("/insert")
	public String insert(HttpServletRequest request, Model model, ElecapprsawonVO elecapprsawonVO, CeoVO ceoVO) {
		logger.info("InsertController 클래스의 insert() 메소드 실행");
		String paper = request.getParameter("paper").trim();
		ApprovalDAO mapper = sqlSession.getMapper(ApprovalDAO.class);
		
		if (ceoVO.getCnum() == 220) {
			mapper.CeoInsert(ceoVO);
		} else {
			mapper.elecapprsawonInsert(elecapprsawonVO);
		}
		model.addAttribute("cnum", request.getParameter("cnum"));
		model.addAttribute("paper", paper);
		model.addAttribute("currentPage", request.getParameter("currentPage"));
		return "redirect:approvalList";
	}
	
	
}