package com.gschedule.model;

import java.util.List;

import com.appointment_form.model.ApmVO;

public interface SchMonthDAO_interface {
	public SchMonthVO getMonth(Integer month, Integer groomerId); 
	public List<ApmVO> getDate(Integer date, Integer groomerId);
}
