package com.tj.movieReviewSite.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.movieReviewSite.dao.FreeBoardDao;

public class FreeBoardModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		FreeBoardDao fDao = FreeBoardDao.getInstance();
		int result = fDao.modify_freeBoard(bTitle, bContent, bNo);
		if(result==FreeBoardDao.SUCCESS) {
			request.setAttribute("freeBoardModifyResult", "글 수정 성공");
		}else {
			request.setAttribute("errorMsg", "공지 사항 수정 실패");
		}
		String pageNum = request.getParameter("pageNum");
		request.setAttribute("pageNum", pageNum);
	}

}
