 package com.tjoeun.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.tjoeun.vo.CeoVO;

public interface CeoDao {
	
	
	ArrayList<CeoVO> selectsawonListByCeo(HashMap<String, Integer> hmap); 
	int selectsawonCountByCeo(CeoVO ceoVO);
	
	
	
	/*
	 * private static CeoDao instance = new CeoDao(); private CeoDao() { }; public
	 * static CeoDao getInstance() { return instance; }
	 * 
	 * // service에서 mapper 넘겨받음. 메인글 전체 개수 얻어오는 xml파일에 있는 명령 실행 public int
	 * selectsawonCountByCeo(SqlSession mapper) {
	 * System.out.println("CeoDao의 selectsawonCount()"); return (int)
	 * mapper.selectOne("selectsawonCountByCeo"); // 글 한개 얻어오는거! }
	 * 
	 * // service에서 mapper 넘겨받음. 한 페이지 분량의 시작 인덱스, 끝 인덱스 저장된 해시맵 객체 넘겨받음.
	 * 
	 * @SuppressWarnings("unchecked") public ArrayList<ElecapprsawonVO>
	 * selectsawonListByCeo(SqlSession mapper, HashMap<String, Integer> hmap) {
	 * System.out.println("CeoDao의 selectsawonList()"); return
	 * (ArrayList<ElecapprsawonVO>) mapper.selectList("selectsawonListByCeo", hmap);
	 * }
	 * 
	 * public void updateComment(SqlSession mapper, ElecapprsawonVO eo) {
	 * System.out.println("CeoDao 클래스의 updateComment() 메소드 실행");
	 * mapper.update("updateComment", eo); };
	 * 
	 * 
	 * public void updateStatus(SqlSession mapper, int idx) {
	 * System.out.println("CeoDao 클래스의 updateStatus() 메소드 실행");
	 * mapper.update("updateStatus", idx); };
	 */
};