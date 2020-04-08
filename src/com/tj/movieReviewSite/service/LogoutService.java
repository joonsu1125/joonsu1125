package com.tj.movieReviewSite.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tj.movieReviewSite.dto.AdminDto;
import com.tj.movieReviewSite.dto.MemberDto;

public class LogoutService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto)session.getAttribute("member");
		AdminDto admin = (AdminDto)session.getAttribute("admin");
		if(member != null) {
			request.setAttribute("logoutMsg", "로그아웃 완료");
		}else {
			request.setAttribute("logoutMsg", "관리자 모드 종료");
		}
		session.invalidate();
	}

}
