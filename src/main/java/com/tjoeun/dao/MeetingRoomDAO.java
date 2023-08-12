package com.tjoeun.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.tjoeun.vo.MeetingVO;

public interface MeetingRoomDAO {

	
	void getMeetingRoomById(MeetingVO meetingVO);
	
	void meetingInsert(MeetingVO meetingVO);

	int selectmeetingCount(MeetingVO meetingVO);

	ArrayList<MeetingVO> getAllMeetingRooms(HashMap<String, Integer> hmap);

	int countAllMeetingRooms(MeetingVO meetingVO);
}
