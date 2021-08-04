package com.member.model;

import java.util.List;

import com.util.MailService;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberService {

	private MemberDAO_interface dao;

	public MemberService() {
		dao = new MemberJDBCDAO();
	}

	public void update(MemberVO memberVO) {
		dao.update(memberVO);
	}

	public void delete(Integer memId) {
		dao.delete(memId);
	}

	public MemberVO findByPrimaryKey(Integer memId) {
		return dao.findByPrimaryKey(memId);
	}

	public List<MemberVO> getAll() {
		return dao.getAll();
	}

	public String checkemail(String memEmail) {
		return dao.checkemail(memEmail);
	}

	public MemberVO getOneMember(Integer memid) { // 查單筆
		return dao.findByPrimaryKey(memid);
	}

	public void insert(String memName, String memEmail, String memPassword, String memIdenity, String memGender,
			Integer memPh, String memAddres, Date memBirthday, Integer memPosition, Integer memReserve,
			Integer memSurvive) {

		MemberVO memberVO = new MemberVO();
		memberVO.setMemName(memName);
		memberVO.setMemEmail(memEmail);
		memberVO.setMemPassword(memPassword);
		memberVO.setMemIdenity(memIdenity);
		memberVO.setMemGender(memGender);
		memberVO.setMemPh(memPh);
		memberVO.setMemAddres(memAddres);
		memberVO.setMemBirthday(memBirthday);
		memberVO.setMemPosition(memPosition);
		memberVO.setMemReserve(memReserve);
		memberVO.setMemSurvive(memSurvive);
		dao.insert(memberVO);
	}

	public void signup(String memName, String memEmail, String memPassword, String memIdenity, String memGender,
			Integer memPh, String memAddres, Date memBirthday) { // 註冊啦

		MemberVO memberVO = new MemberVO();
		memberVO.setMemName(memName);
		memberVO.setMemEmail(memEmail);
		memberVO.setMemPassword(memPassword);
		memberVO.setMemIdenity(memIdenity);
		memberVO.setMemGender(memGender);
		memberVO.setMemPh(memPh);
		memberVO.setMemAddres(memAddres);
		memberVO.setMemBirthday(memBirthday);

		dao.signup(memberVO);
		
		// ========================註冊成功後寄信給註冊的人========================
		MailService mailSvc = new MailService();
		mailSvc.setTo("healwriter@gmail.com");
		mailSvc.setSubject("MaoUni毛孩有你  註冊成功通知");
		StringBuffer messageText = new StringBuffer();

		messageText.append("嗨，親愛的毛爸媽，歡迎您加入MaoUni！請點選網址登入：") ;
//		message.setContent("<h1>嗨，親愛的毛爸媽，歡迎您加入MaoUni</h1><br><a href=\"http://localhost:8081/MaoUni/front-end/home/login.jsp">請點擊連結進行登入</a>",\"text/html;charset=UTF-8\");
		
		mailSvc.setMessageText(messageText.toString());
		mailSvc.start();

// =====================使用執行續處理信件寄送曼導致畫面卡卡問題====================
		
		
	}

	public MemberVO findByUseremailAndpassword(String memEmail, String memPassword) { // 會員登入
		return dao.findByUseremailAndpassword(memEmail, memPassword);

	}

	public MemberVO OutUser(String memEmail, String memPassword) { // 登出
		return dao.OutUser(memEmail, memPassword);
	}

	public MemberVO MemberVO(String memEmail) {
		return null;
	}

	// 更新會員密碼
	public void updatePassword(String memEmail, String memPassword) {// 前台更新密碼
		MemberVO memberVO = new MemberVO();
		memberVO.setMemEmail(memEmail);
		memberVO.setMemPassword(memPassword);
		dao.updatePassword(memberVO);
	}

}