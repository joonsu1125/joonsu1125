package com.tj.movieReviewSite.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.movieReviewSite.dao.FreeBoardDao;
import com.tj.movieReviewSite.dto.FreeBoardDto;

public class FreeBoardContentService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		FreeBoardDao fDao = FreeBoardDao.getInstance();
		FreeBoardDto dto = fDao.getFreeBoard(bNo);
		request.setAttribute("freeBoard_content_view", dto);
	}

}
