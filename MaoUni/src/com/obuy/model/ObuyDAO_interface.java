package com.obuy.model;

import java.util.*;

import com.commodity_details.model.CdVO;

public interface ObuyDAO_interface {

    public void update(Integer obuyId, Integer oSurvive);
    public ObuyVO findByPrimaryKey(Integer obuyId);
     public List<ObuyVO> getAll();
    public void insertWithco(ObuyVO obuyVO , List<CdVO> list); //同時新增訂單與清單 ()
    
    //查詢(一對多)(回傳 Set)
//    public Set<ObuyVO> getEmpsByDeptno(Integer OId);
    
}