package com.tjoeun.Tjoeun_Project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjoeun.dao.MyPageDAO;
import com.tjoeun.vo.MainVO;

@Controller
public class MyPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	// MainController 내 함수 사용 위해 의존성 주입 ( 권장 방법 X )
	private final MainController mainController;
	@Autowired
    public MyPageController(MainController mainController) {
        this.mainController = mainController;
    }
	
	@Autowired
	private SqlSession sqlSession;
	
    
	
	@RequestMapping("myPage")
	public String myPage(HttpServletRequest request, HttpSession session) {
		
		// 만약 사원 정보가 없을 경우 login창으로 리턴
		if ( mainController.verification(session) ) return "redirect:login";
		
		return "myPage";
	}
	
	@RequestMapping("myPageUpdate")
	public String myPageUpdate(HttpServletRequest request, HttpSession session) {
		
		// 만약 사원 정보가 없을 경우 login창으로 리턴
		if ( mainController.verification(session) ) return "redirect:login";
		
		return "myPageUpdate";
	}
	
	@RequestMapping("myPageUpdateOK")
	public String myPageUpdateOK(HttpServletRequest request, HttpSession session) {
		MyPageDAO mapper = sqlSession.getMapper(MyPageDAO.class);
		
		// 만약 사원 정보가 없을 경우 login창으로 리턴
		if ( mainController.verification(session)) return "redirect:login";
		
		
		// 현재 사원정보 불러오고(mvo), 새로 넣을 이메일, 전화번호 불러옴 
		MainVO mvo = (MainVO)session.getAttribute("mvo");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		mvo.setEmail(email);
		mvo.setPhone(phone);
		
		logger.info("MyPageUpdateOK 의 최종 mvo : {}", mvo);
		
		mapper.updateinfo(mvo);
		
		
		return "redirect:myPage";
	}
	
}
