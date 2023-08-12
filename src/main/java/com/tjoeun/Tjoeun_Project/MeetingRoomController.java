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

import com.tjoeun.dao.MeetingRoomDAO;
import com.tjoeun.vo.MeetingRoomList;
import com.tjoeun.vo.MeetingVO;

@Controller
public class MeetingRoomController {

	@Autowired
	private SqlSession sqlSession;
	private static final Logger logger = LoggerFactory.getLogger(MeetingRoomController.class);
	
	// 회의실 페이지로 가기
    @RequestMapping("/meetingrooms")
    public String meetingrooms(HttpServletRequest request, Model model) {
    	logger.info("MeetingController의 meetingrooms");
        
    	String room_id = request.getParameter("room_id");
    	if(room_id.equals(null))
    			return "redirect:main";
    	model.addAttribute("room_id", room_id);
    	return "datepicker/webapp/datepicker";
    }
    
    // 회의실 예약 정보 저장
    @RequestMapping("/submitreservation")
    public String submitreservation(HttpServletRequest request, Model model, MeetingVO meetingVO) {
    	logger.info("submitreservation");
    	
    	MeetingRoomDAO mapper = sqlSession.getMapper(MeetingRoomDAO.class);
//    	logger.info("{}",meetingVO);
    	mapper.meetingInsert(meetingVO);
    	
    	model.addAttribute("room_id", meetingVO.getRoom_Id());
    	return "redirect:getAllMeetingRooms";
    }
    
    // 회의실 예약현황 불러오기 
  @RequestMapping("/getAllMeetingRooms")
    public String getAllMeetingRooms(HttpServletRequest request, Model model, MeetingVO meetingVO) {
	  logger.info("MeetingRoomController의 getAllMeetingRooms");
	  
	  MeetingRoomDAO mapper = sqlSession.getMapper(MeetingRoomDAO.class);
	  
	  // 예약글 전체 개수 불러오기 
	  int pageSize = 10;
	  int currentPage = 1;
	  try {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	} catch (NumberFormatException e) {}
	  int totalCount = mapper.countAllMeetingRooms(meetingVO);
	  logger.info("{}", totalCount);
	  
	  MeetingRoomList meetingRoomList = new MeetingRoomList(pageSize, totalCount, currentPage);
	  
	  // 예약글 전체 목록 불러오기 
	  HashMap<String, Integer> hmap = new HashMap<String, Integer>();
	  hmap.put("room_id", Integer.parseInt(request.getParameter("room_id")));
	  hmap.put("startNo", meetingRoomList.getStartNo());
	  hmap.put("endNo", meetingRoomList.getEndNo());
	  meetingRoomList.setList(mapper.getAllMeetingRooms(hmap));
	  model.addAttribute("room_id", request.getParameter("room_id"));
	  model.addAttribute("MeetingRoomList", meetingRoomList);
	  model.addAttribute("currentPage", currentPage);
	  
	   return "meetingroomList";
	  
  }
  
  
}
