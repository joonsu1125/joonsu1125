package com.tj.movieReviewSite.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.movieReviewSite.dao.FreeBoardDao;

public class FreeBoardReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		 String mId = request.getParameter("mId");
		 String bTitle = request.getParameter("bTitle");
		 String bContent = request.getParameter("bContent");
		 int bGroup = Integer.parseInt(request.getParameter("bGroup"));
		 int bStep = Integer.parseInt(request.getParameter("bStep"));
		 int bIndent = Integer.parseInt(request.getParameter("bIndent"));
		 FreeBoardDao fDao = FreeBoardDao.getInstance();
		 int result = fDao.reply_freeBoard(mId, bTitle, bContent, bGroup, bStep, bIndent);
		 if(result==FreeBoardDao.SUCCESS) {
			 request.setAttribute("freeBoardReplyResult", "답변글쓰기완료");
		 }else {
			 request.setAttribute("errorMsg", "답변글쓰기 증 오류 발생");
		 }
	}

}
