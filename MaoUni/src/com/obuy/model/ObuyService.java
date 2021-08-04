package com.obuy.model;

import java.sql.Timestamp;
import java.util.List;

import com.commodity_details.model.CdVO;

public class ObuyService {

	private ObuyDAO_interface dao;

	public ObuyService() {
		dao = new ObuyJDBCDAO();

	}

//	public void insert(Integer oMemId, Integer oMoney, Integer oPaying, Integer oSend,
//			Integer oSurvive, String obuyOther) {
//
//		ObuyVO obuyVO = new ObuyVO();
//
//		obuyVO.setoMemId(oMemId);
//		obuyVO.setoMoney(oMoney);
//		obuyVO.setoPaying(oPaying);
//		obuyVO.setoSend(oSend);
//		obuyVO.setoSurvive(oSurvive);
//		obuyVO.setObuyOther(obuyOther);
//
//		dao.insert(obuyVO);
//	}

	public void update(Integer obuyId, Integer oSurvive) {
		dao.update(obuyId, oSurvive);
	}


	public ObuyVO findByPrimaryKey(Integer obuyId) {
		return dao.findByPrimaryKey(obuyId);
	}

	public List<ObuyVO> getAll() {
		return dao.getAll();
	}

	public void insertWithco(Integer oMemId, Integer oMoney, Integer oPaying, Integer oSend, String obuyOther,List<CdVO> list) {
		ObuyVO obuyVO = new ObuyVO();

		obuyVO.setoMemId(oMemId);
		obuyVO.setoMoney(oMoney);
		obuyVO.setoPaying(oPaying);
		obuyVO.setoSend(oSend);
		obuyVO.setObuyOther(obuyOther);
		dao.insertWithco(obuyVO, list);
	}

}