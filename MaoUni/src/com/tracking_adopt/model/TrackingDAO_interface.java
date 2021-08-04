package com.tracking_adopt.model;


import java.util.*;

import com.adopt_imf.model.ImfVO;
import com.member.model.MemberVO;




public interface TrackingDAO_interface {
	public Integer insert (TrackingVO trackingVO);
	public void update(TrackingVO trackingVO); 
	public void delete(Integer Id);
	public TrackingVO findByPrimaryKey(Integer det);
	public List<TrackingVO> getAll();
	
	public List<TrackingVO> getMemberByid(Integer id);//一個會員認養多少寵物
	public Set<ImfVO> getImfVObyid(Integer id);
	
	
	
}