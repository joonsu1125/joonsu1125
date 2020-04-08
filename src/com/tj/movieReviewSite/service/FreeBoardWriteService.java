package com.tj.movieReviewSite.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tj.movieReviewSite.dao.FreeBoardDao;
import com.tj.movieReviewSite.dto.FreeBoardDto;
import com.tj.movieReviewSite.dto.MemberDto;

public class FreeBoardWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String mId = ((MemberDto)session.getAttribute("member")).getmId();
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		FreeBoardDao fDao = FreeBoardDao.getInstance();
		int result = fDao.insert_freeBoard(mId, bTitle, bContent);
		if(result==FreeBoardDao.SUCCESS) {
			request.setAttribute("freeBoardWriteResult", "글입력완료");
		}else {
			request.setAttribute("errorMsg", "글입력실패");
		}

	}

}
