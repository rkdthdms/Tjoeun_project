package com.tjoeun.Tjoeun_Project;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjoeun.dao.CeoCommentDAO;
import com.tjoeun.vo.CeoVO;

@Controller
public class CeoCommentController {
	
	private static final Logger logger = LoggerFactory.getLogger(CeoCommentController.class);
	
	@Autowired
	private SqlSession sqlSession;
	
	// 사장 결재 확인 페이지 열기
	@RequestMapping("/CeoComment")
	public String CeoComment(HttpServletRequest request, Model model, CeoVO ceoVO) {
		logger.info("CeoCommentController 클래스의 CeoComment() 메소드 실행");

		// mapper 만들기
		CeoCommentDAO mapper = sqlSession.getMapper(CeoCommentDAO.class);
		// 코멘트를 달 결재글 1건 얻어오는 메소드 호출
		CeoVO co = mapper.selectByIdxCeoComment(ceoVO);
		// 코멘트를 달 결재글 1건이 저장된 VO와 목록창의 현재 페이지, 엔터 지정
		model.addAttribute("co", co);
		model.addAttribute("currentPage", request.getParameter("currentPage"));
		model.addAttribute("enter", "\r\n");
		
		return "CeoComment";
	}
	
	// 사장이 본인이 쓴 글 수정하는 페이지
	@RequestMapping("/CeoUpdate")
	public String CeoUpdate(HttpServletRequest request, Model model, CeoVO ceoVO) {
		logger.info("CeoCommentController 클래스의 CeoUpdate() 메소드 실행");
		model.addAttribute("co", ceoVO);
		model.addAttribute("currentPage", request.getParameter("currentPage"));
		return "CeoUpdate";
	}
	
	// 사장이 수정할 정보 저장 후 목록으로 가기
	@RequestMapping("/CeoUpdateOK")
	public String CeoUpdateOK(HttpServletRequest request, Model model, CeoVO ceoVO) {
		logger.info("CeoCommentController 클래스의 CeoUpdateOK() 메소드 실행");
		CeoCommentDAO mapper = sqlSession.getMapper(CeoCommentDAO.class);
		mapper.update(ceoVO);
		model.addAttribute("currentPage", request.getParameter("currentPage"));
		return "redirect:Ceo";
	}
	
	// 사장이 쓴 글 삭제하기
	@RequestMapping("/CeoDelete")
	public String CeoDelete(HttpServletRequest request, Model model, CeoVO ceoVO) {
		logger.info("CeoCommentController 클래스의 CeoDelete() 메소드 실행");
		CeoCommentDAO mapper = sqlSession.getMapper(CeoCommentDAO.class);
		mapper.delete(ceoVO);
		model.addAttribute("currentPage", request.getParameter("currentPage"));
		return "redirect:Ceo";
	}
	
	// 결재 상태를 승인으로 바꾸기
	@RequestMapping("/CeoCommentUpdate")
	public String CeoCommentUpdate(HttpServletRequest request, Model model, CeoVO ceoVO) {
		logger.info("CeoCommentController 클래스의 CeoCommentUpdate() 메소드 실행");
		
		// mapper 만들기
		CeoCommentDAO mapper = sqlSession.getMapper(CeoCommentDAO.class);
		mapper.updateStatus(ceoVO);
		// 목록창의 현재 페이지 지정
		model.addAttribute("currentPage", request.getParameter("currentPage"));
		
		return "redirect:Ceo";
	}
	
	// 팝업창 열기
	@RequestMapping("/CeoComment_Popup")
	public String CeoComment_Popup(HttpServletRequest request, Model model, CeoVO ceoVO) {
		logger.info("CeoCommentController 클래스의 CeoComment_Popup() 메소드 실행");
		
		// mapper 만들기
		CeoCommentDAO mapper = sqlSession.getMapper(CeoCommentDAO.class);
		// 코멘트를 달 결재글 1건 얻어오는 메소드 호출
		CeoVO co = mapper.selectByIdxCeoComment(ceoVO);
		// 코멘트를 달 결재글 1건이 저장된 VO 지정
		model.addAttribute("co", co);
		
		return "CeoComment_Popup";
	}
	
	// 코멘트 입력(수정) 후 팝업창 닫기
	@RequestMapping("/CeoCommentSend")
	public String CeoCommentSend(HttpServletRequest request, Model model, CeoVO ceoVO) {
		logger.info("CeoCommentController 클래스의 CeoCommentSend() 메소드 실행");
		
		// mapper 만들기
		CeoCommentDAO mapper = sqlSession.getMapper(CeoCommentDAO.class);
		// 코멘트 저장하기
		mapper.ceoCommentinsert(ceoVO);
		
		// 팝업창 닫으러 ㄱㄱ
		return "CeoComment_PopupClose";
	}
	
}
