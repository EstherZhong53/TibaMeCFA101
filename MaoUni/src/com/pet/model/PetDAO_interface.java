package com.pet.model;

import java.util.*;

import com.groomer.model.GroVO;

public interface PetDAO_interface {

	public void insert(PetVO petVO);
    public void update(PetVO petVO);
    public void delete(Integer PetId);
    public PetVO findByPrimaryKey(Integer PetId);
    public List<PetVO> getAll();
    public List<PetVO> findByMemId(Integer petMemId); //一個會員找多個寵物
//    public List<PetVO> getAll(Map<String, String[]> map);// 複合查詢
	
}