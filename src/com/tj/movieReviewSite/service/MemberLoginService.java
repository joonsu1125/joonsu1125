package com.tj.movieReviewSite.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tj.movieReviewSite.dao.MemberDao;
import com.tj.movieReviewSite.dto.MemberDto;

public class MemberLoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.login_chk(mId, mPw);
		if(result==MemberDao.LOGIN_SUCCESS) {
			HttpSession session = request.getSession();
			MemberDto member = mDao.getMember(mId);
			session.setAttribute("member", member);
			request.setAttribute("LoginResult", "안녕하세요!, 환영합니다~");
		}else {
			request.setAttribute("errorMsg", "아이디와 비밀번호를 확인해 주세요");
		}
	}

}
