package com.tjoeun.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.tjoeun.vo.ElecapprsawonVO;

public interface ElecapprsawonDAO {
	
	void insert(ElecapprsawonVO ElecapprsawonVO);
	ArrayList<ElecapprsawonVO> selectsawonList(HashMap<String, Integer> hmap);
	int selectsawonCount(ElecapprsawonVO elecapprsawonVO);
	ElecapprsawonVO selectsawonIdx(ElecapprsawonVO elecapprsawonVO);
	void delete(ElecapprsawonVO elecapprsawonVO);
	void update(ElecapprsawonVO elecapprsawonVO);
	
}