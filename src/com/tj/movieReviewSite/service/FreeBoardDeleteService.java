package com.tj.movieReviewSite.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.movieReviewSite.dao.FaqDao;
import com.tj.movieReviewSite.dao.FreeBoardDao;

public class FreeBoardDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int bNo = Integer.parseInt(request.getParameter("bNo")); 
		FreeBoardDao fDao = FreeBoardDao.getInstance();
		int result = fDao.delete_freeboard(bNo);
		if(result==FaqDao.SUCCESS) {
			request.setAttribute("freeBoardDeleteResult", "삭제 완료");
		}else{
			request.setAttribute("errorMsg", "삭제중 오류");
		}

	}

}
