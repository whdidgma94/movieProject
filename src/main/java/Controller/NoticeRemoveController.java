package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import FrontController.Controller;
import Notice.NoticeDAO;

public class NoticeRemoveController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		if(request.getParameter("noticeNo")==null){
			request.setCharacterEncoding("utf-8");
			HttpSession session = request.getSession();
			session.setAttribute("noticeList", NoticeDAO.getInstance().getAllNotice());
			return"noticeRemove";
		}
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		NoticeDAO.getInstance().removeNotice(noticeNo);
		return "noticeRemove";
	}

}
