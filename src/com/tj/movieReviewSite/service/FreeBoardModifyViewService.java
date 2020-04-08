package com.tj.movieReviewSite.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.movieReviewSite.dao.FreeBoardDao;
import com.tj.movieReviewSite.dto.FreeBoardDto;

public class FreeBoardModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		FreeBoardDao fDao = FreeBoardDao.getInstance();
		FreeBoardDto dto = fDao.modify_freeBoardView_reply_freeBoardView(bNo);
		request.setAttribute("freeBoard_modify_view", dto);
	}

}
