package com.tj.movieReviewSite.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tj.movieReviewSite.service.AdminLoginService;
import com.tj.movieReviewSite.service.FreeBoardDeleteService;
import com.tj.movieReviewSite.service.FreeBoardContentService;
import com.tj.movieReviewSite.service.FaqContentService;
import com.tj.movieReviewSite.service.FaqListService;
import com.tj.movieReviewSite.service.FaqModifyService;
import com.tj.movieReviewSite.service.FaqModifyViewService;
import com.tj.movieReviewSite.service.FaqWriteService;
import com.tj.movieReviewSite.service.FaqDeleteService;
import com.tj.movieReviewSite.service.FreeBoardListService;
import com.tj.movieReviewSite.service.FreeBoardModifyService;
import com.tj.movieReviewSite.service.FreeBoardModifyViewService;
import com.tj.movieReviewSite.service.FreeBoardWriteService;
import com.tj.movieReviewSite.service.FreeBoardReplyService;
import com.tj.movieReviewSite.service.FreeBoardReplyViewService;
import com.tj.movieReviewSite.service.LogoutService;
import com.tj.movieReviewSite.service.MemberDeleteService;
import com.tj.movieReviewSite.service.MemberJoinIdChkService;
import com.tj.movieReviewSite.service.MemberJoinService;
import com.tj.movieReviewSite.service.MemberListService;
import com.tj.movieReviewSite.service.MemberLoginService;
import com.tj.movieReviewSite.service.MemberModifyService;
import com.tj.movieReviewSite.service.MoiveModifyViewService;
import com.tj.movieReviewSite.service.MovieContentService;
import com.tj.movieReviewSite.service.MovieDeleteService;
import com.tj.movieReviewSite.service.MovieModifyService;
import com.tj.movieReviewSite.service.MovieWriteService;
import com.tj.movieReviewSite.service.MoviewListService;
import com.tj.movieReviewSite.service.MovieReviewListAppendService;
import com.tj.movieReviewSite.service.FreeBoardReviewDeleteService;
import com.tj.movieReviewSite.service.FreeBoardReviewWriteService;
import com.tj.movieReviewSite.service.Service;

/**
 * Servlet implementation class Controller
 */
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		Service service = null;
		String viewPage = null;
		if(command.equals("/main.do")) {
			viewPage = "main/main.jsp";
		}else if(command.equals("/join_view.do")) {
			viewPage = "member/join.jsp";
		}else if(command.equals("/joinIdChk.do")) {
			service = new MemberJoinIdChkService();
			service.execute(request, response);
			viewPage = "member/joinIdChk.jsp";
		}else if(command.equals("/join.do")){
			service = new MemberJoinService();
			service.execute(request, response);
			viewPage = "member/login.jsp";
		}else if(command.equals("/login_view.do")) {
			viewPage = "member/login.jsp"; 
		}else if(command.equals("/login.do")) {
			service = new MemberLoginService();
			service.execute(request, response);
			viewPage = "main.do";
		}else if(command.equals("/logout.do")) {
			service = new LogoutService();
			service.execute(request, response);
			viewPage = "login_view.do";
		}else if(command.equals("/modify_view.do")) {
			viewPage = "member/modify.jsp";
		}else if(command.equals("/modify.do")) {
			service = new MemberModifyService();
			service.execute(request, response);
			viewPage = "modify_view.do";
		}else if(command.equals("/memberDelete.do")) {
			service = new MemberDeleteService();
			service.execute(request, response);
			viewPage ="logout.do";
		}
		/* * * * * * * * * * * * * * * * * */
		/* * * * * * * * 관리자* * * * * * * */
		/* * * * * * * * * * * * * * * * * */
		else if(command.equals("/adminLoginView.do")) {
			viewPage = "admin/adminLogin.jsp";
		}else if(command.equals("/adminLogin.do")) {
			service = new AdminLoginService();
			service.execute(request, response);
			viewPage = "main.do";
		}else if(command.equals("/memberList.do")) {
			service = new MemberListService();
			service.execute(request, response);
			viewPage = "member/memberList.jsp";
		}
		/* * * * * * * * * * * * * * * * * */
		/* * * * * * * * 공지사항* * * * * * * */
		/* * * * * * * * * * * * * * * * * */
		else if(command.equals("/faqList.do")) {
			service = new FaqListService();
			service.execute(request, response);
			viewPage = "faq/faqList.jsp";
		}else if(command.equals("/faq_write_view.do")) {
			viewPage = "faq/faq_write_view.jsp";
		}else if(command.equals("/faqWrite.do")){
			service = new FaqWriteService();
			service.execute(request, response);
			viewPage = "faqList.do";
		}else if(command.equals("/faq_content_view.do")) {
			service = new FaqContentService();
			service.execute(request, response);
			viewPage = "faq/faq_content_view.jsp";
		}else if(command.equals("/faq_modify_view.do")) {
			service = new FaqModifyViewService();
			service.execute(request, response);
			viewPage = "faq/faq_modify_view.jsp";
		}else if(command.equals("/faqModify.do")) {
			service = new FaqModifyService();
			service.execute(request, response);
			viewPage = "faqList.do";
		}else if(command.equals("/faqDlete.do")){
			service = new FaqDeleteService();
			service.execute(request, response);
			viewPage = "faqList.do";
		}
		/* * * * * * * * * * * * * * * * * */
		/* * * * * * * * 영화정보* * * * * * * */
		/* * * * * * * * * * * * * * * * * */
		else if(command.equals("/movieList.do")) {
			service = new MoviewListService();
			service.execute(request, response);
			viewPage = "movie/movieList.jsp";
		}else if(command.equals("/movie_write_view.do")) {
			viewPage = "movie/movie_write.jsp";
		}else if(command.equals("/movieWrite.do")) {
			service = new MovieWriteService();
			service.execute(request, response);
			viewPage = "movieList.do";
		}else if(command.equals("/movie_content_view.do")) {
			service = new MovieContentService();
			service.execute(request, response);
			viewPage = "movie/movie_content.jsp";
		}else if(command.equals("/movie_modify_view.do")) {
			service = new MoiveModifyViewService();
			service.execute(request, response);
			viewPage = "movie/movie_modify_view.jsp";
		}else if(command.equals("/movieModify.do")) {
			service = new MovieModifyService();
			service.execute(request, response);
			viewPage = "movieList.do";
		}else if(command.equals("/movieDelete.do")) {
			service = new MovieDeleteService();
			service.execute(request, response);
			viewPage ="movieList.do";
			/* * * * * * * * * * * * * * * * * */
			/* * * * * * * * 댓글(REVIEW)* * * * * * * */
			/* * * * * * * * * * * * * * * * * */	
		}else if(command.equals("/reviewList.do")) {
			viewPage = "movie_content_view.do";
		}else if(command.equals("/review_write.do")) {
			service = new FreeBoardReviewWriteService();
			service.execute(request, response);
			viewPage = "movie_content_view.do";
		}else if(command.equals("/appendReviewList.do")) {
			service = new MovieReviewListAppendService();
			service.execute(request, response);
			viewPage = "review/appendReview.jsp";
		}
		/* * * * * * * * * * * * * * * * * */
		/* * * * * * * * 자유게시판* * * * * * * */
		/* * * * * * * * * * * * * * * * * */	
		else if(command.equals("/freeBoardList.do")) {
			service = new FreeBoardListService();
			service.execute(request, response);
			viewPage = "freeboard/freeBoardList.jsp";
		}else if(command.equals("/freeBoard_write_view.do")) {
			viewPage = "freeboard/freeBoard_write_view.jsp";
		}else if(command.equals("/freeBoardWrite.do")) {
			service = new FreeBoardWriteService();
			service.execute(request, response);
			viewPage = "freeBoardList.do";
		}else if(command.equals("/freeBoard_content_view.do")) {
			service = new FreeBoardContentService();
			service.execute(request, response);
			viewPage = "freeboard/freeBoard_content_view.jsp";
		}else if(command.equals("/freeBoard_modify_view.do")) {
			service = new FreeBoardModifyViewService();
			service.execute(request, response);
			viewPage = "freeboard/freeBoard_modify_view.jsp";
		}else if(command.equals("/freeBoardModify.do")) {
			service = new FreeBoardModifyService();
			service.execute(request, response);
			viewPage = "freeBoardList.do";
		}else if(command.equals("/freeBoardDelete.do")) {
			service = new FreeBoardDeleteService();
			service.execute(request, response);
			viewPage = "freeBoardList.do";
		}else if(command.equals("/freeBoard_reply_view.do")) {
			service = new FreeBoardReplyViewService();
			service.execute(request, response);
			viewPage = "freeboard/freeBoard_reply_view.jsp";
		}else if(command.equals("/freeBoardReply.do")) {
			service = new FreeBoardReplyService();
			service.execute(request, response);
			viewPage = "freeBoardList.do";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
