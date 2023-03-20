package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FrontController.Controller;
import Notice.NoticeDAO;
import Notice.NoticeVO;

public class AddNoticeController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if(request.getParameter("title")==null) {
			return "addNotice";
		}
		NoticeVO notice = new NoticeVO();
		notice.setTitle(request.getParameter("title"));
		notice.setContent(request.getParameter("content"));
		NoticeDAO.getInstance().addNotice(notice);
		String ctx = request.getContextPath();
		System.out.println("controller");
		return "redirect:"+ctx+"/_main.do";
	}

}
