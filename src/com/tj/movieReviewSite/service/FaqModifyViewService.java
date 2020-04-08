package com.tj.movieReviewSite.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.movieReviewSite.dao.FaqDao;
import com.tj.movieReviewSite.dto.FaqDto;

public class FaqModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int fNo = Integer.parseInt(request.getParameter("fNo"));
		FaqDao fDao = FaqDao.getInstance();
		FaqDto dto = fDao.faq_modify_view(fNo);
		request.setAttribute("faq_modify_view", dto);

	}

}
