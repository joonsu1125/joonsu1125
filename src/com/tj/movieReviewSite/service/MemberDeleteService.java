package com.tj.movieReviewSite.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tj.movieReviewSite.dao.MemberDao;
import com.tj.movieReviewSite.dto.MemberDto;

public class MemberDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto)session.getAttribute("member");
		MemberDao mDao = MemberDao.getInstance();
		if(mPw.equals(member.getmPw())) {
			int result = mDao.delete_member(mId, mPw);
			if(result==MemberDao.SUCCESS) {
				request.setAttribute("deleteResult", "탈퇴가 완료되었습니다.");
			}else {
				request.setAttribute("errorMsg", "탈퇴 처리 중 오류 발생");
			}
				
		}else {
			request.setAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
		}
		

	}

}
