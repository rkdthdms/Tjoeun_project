package com.tjoeun.Tjoeun_Project;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tjoeun.dao.AttendanceDAO;
import com.tjoeun.vo.AttendanceVO;
import com.tjoeun.vo.MainVO;

@Controller
public class MainController {
	
	// 모든 컨트롤러에 다 넣기 ======================================================
	@Autowired
	private SqlSession sqlSession;
	// ==============================================================================
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	public boolean verification(HttpSession session) {
		MainVO mvo = (MainVO) session.getAttribute("mvo");
		
		if (mvo != null ) {
			return false;
		} else return true;
	}
	
	// mainBoardList.jsp -> main.jsp
	@RequestMapping("/main")
	public String index(HttpServletRequest request,HttpSession session, Model model) {
		logger.info("MainController의 index 진입");
		
		AttendanceDAO mapper = sqlSession.getMapper(AttendanceDAO.class);
		
		// 만약 사원 정보가 없을 경우 login창으로 리턴
		MainVO mvo = (MainVO) session.getAttribute("mvo");
		if ( verification(session) ) return "redirect:login";
		
		String Atten_date = "";
		String Atten_Check = null;
		
		String Leave_date = "";
		String Leave_Check = null;
		
		Date today = new Date();
		AttendanceVO ao = new AttendanceVO();
		
		SimpleDateFormat date_N_hour = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");

//		logger.info("MainController에서 하는 mvo : {}", session.getAttribute("mvo"));

		ao.setCnum(mvo.getCnum());
		ao.setWorktime(date_format.format(today));
		ao.setHometime(date_format.format(today));
		
		// DB에 출퇴근 시간이 있나 조회
		Atten_Check = mapper.selectbyCnum_Atten(ao);
		Leave_Check = mapper.selectbyCnum_Leave(ao);
		// logger.info("Atten_Check : {}, Leave_Check : {}", Atten_Check, Leave_Check);
		
		// 출퇴근 시간이 있을경우 String인 시간들을 Date 형식? 
		try {
			Atten_date = date_N_hour.format(date_N_hour.parse(Atten_Check));
			Leave_date = date_N_hour.format(date_N_hour.parse(Leave_Check));
			if(Atten_date.equals(Leave_date)) {
				Leave_date = "";
			}
		} catch ( Exception e ) { }
		
		session.setAttribute("Atten_date", Atten_date);
		session.setAttribute("Leave_date", Leave_date);
		
		return "main";
	}
	
	// 출퇴근 버튼(main.jsp -> attendanceOK.jsp)
	@RequestMapping("/attendanceOK")
	public String attendanceOK(Model model, HttpSession session) {
		AttendanceDAO mapper = sqlSession.getMapper(AttendanceDAO.class);
		
		// 만약 사원 정보가 없을 경우 login창으로 리턴
		if ( verification(session) ) return "redirect:login";
		
		String Atten_Check = null;
		String Leave_Check = null;
		
		Date today = new Date();
		AttendanceVO ao = new AttendanceVO();
		
		SimpleDateFormat date_format = new SimpleDateFormat("yyyy-MM-dd");

		MainVO mvo = (MainVO) session.getAttribute("mvo");
		logger.info("mvo : {}", mvo);
		
		ao.setCnum(mvo.getCnum());
		ao.setWorktime(date_format.format(today));
		ao.setHometime(date_format.format(today));
		
		// DB에 출퇴근 시간이 있나 조회
		Atten_Check = mapper.selectbyCnum_Atten(ao);
		Leave_Check = mapper.selectbyCnum_Leave(ao);
		// logger.info("Atten_Check : {}, Leave_Check : {}", Atten_Check, Leave_Check);
			
		model.addAttribute("Atten_check", Atten_Check);
		model.addAttribute("Leave_check", Leave_Check);
		model.addAttribute("ao", ao);
		
		return "attendanceOK";
		
	}
	
	// 출근 완료(attendanceOK.jsp -> mainBoardList.jsp -> main.jsp)
	@RequestMapping("/attendance_Atten")
	public String attendance_Atten(Model model, HttpSession session) { 
		
		AttendanceDAO mapper = sqlSession.getMapper(AttendanceDAO.class);
		
		// 만약 사원 정보가 없을 경우 login창으로 리턴
		if ( verification(session) ) return "redirect:login";
		
		// 출근시간을 불러와 있을 경우 다시 리턴 
		String Atten_Check = (String) session.getAttribute("Atten_date");
		if ( !Atten_Check.equals("") ) return "redirect:mainBoardList";
		
		MainVO mainVO = (MainVO) session.getAttribute("mvo");
		
		mapper.insertTime(mainVO.getCnum());
		
		logger.info("출근 성공");
		
		return "redirect:mainBoardList";
	}
	
	// 퇴근 처리(attendanceOK.jsp -> mainBoardList.jsp -> main.jsp)
	@RequestMapping("/attendance_Leave")
	public String attendance_Leave(HttpServletRequest request, Model model, HttpSession session) { 
		AttendanceDAO mapper = sqlSession.getMapper(AttendanceDAO.class);
		
		// 만약 사원 정보가 없을 경우 login창으로 리턴
		if ( verification(session) ) return "redirect:login";
		
		// 퇴근 시간 있을 경우 다시 리턴.
		String Leave_Check = (String) session.getAttribute("Leave_date");
		if ( !Leave_Check.equals("") ) return "redirect:mainBoardList";
		
		// cnum 을 얻기 위해 mainVO 불러옴
		MainVO mvo = (MainVO) session.getAttribute("mvo");
		
		// sql 업데이트 위해 조건 중 하나인 출근시간 불러옴
		String worktime = request.getParameter("worktime");

		logger.info("worktime : {}", worktime);
		logger.info("mvo : {}", mvo);
		
		// cnum과 출근 시간을 VO에 담아 넣기 위해 AttendanceVO(ao) 생성
		AttendanceVO ao = new AttendanceVO();

		// 퇴근 시간을 ao에 삽입하기 위해 SimpleDateFormat 클래스 생성
		SimpleDateFormat date_N_hour = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		// 현재 시간을 불러오기 위해 Date 클래스 생성
		Date date = new Date();
		
		// 시간에 맞는 형식 찍어보기
		logger.info("time : {}", date_N_hour.format(date));
		
		String now = date_N_hour.format(date);

		// ao에 사원번호(cnum) 삽입
		ao.setCnum(mvo.getCnum());
		ao.setWorktime(worktime);
		ao.setHometime(now);
		
		logger.info("ao : {}", ao);
		
		mapper.UpdateLeaveTime(ao);
		
		return "redirect:mainBoardList";
	}
	
	// 로그아웃(index.jsp -> logoutOK.jsp -> login.jsp)
	@RequestMapping("logoutOK")
	public String logoutOK(HttpServletRequest request, HttpSession session) {
		@SuppressWarnings("rawtypes")
		Enumeration list = session.getAttributeNames();
		while ( list.hasMoreElements() ) {
			session.removeAttribute((String)list.nextElement());
		}
		request.setAttribute("error", null);
		return "redirect:login";
	}
	
	
	
}
