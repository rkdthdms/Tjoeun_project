package com.tjoeun.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.tjoeun.vo.CeoVO;
import com.tjoeun.vo.ElecapprsawonVO;

public interface ApprovalDAO {

	void CeoInsert(CeoVO ceoVO);
	void elecapprsawonInsert(ElecapprsawonVO elecapprsawonVO);
	int selectApprovalCountByCeo(CeoVO ceoVO);
	ArrayList<CeoVO> selectApprovalListByCeo(HashMap<String, Object> hmap);
	int selectApprovalCount(ElecapprsawonVO elecapprsawonVO);
	ArrayList<ElecapprsawonVO> selectApprovalList(HashMap<String, Object> hmap);

}
