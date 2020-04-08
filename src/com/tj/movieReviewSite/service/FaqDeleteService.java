package com.tj.movieReviewSite.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.movieReviewSite.dao.FaqDao;

public class FaqDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int fNo = Integer.parseInt(request.getParameter("fNo")); 
		FaqDao fDao = FaqDao.getInstance();
		int result = fDao.faq_board_delete(fNo);
		if(result==FaqDao.SUCCESS) {
			request.setAttribute("faqDeleteResult", "공지사항 삭제 완료");
		}else{
			request.setAttribute("errorMsg", "공지사항 삭제중 오류");
		}
	}

}
