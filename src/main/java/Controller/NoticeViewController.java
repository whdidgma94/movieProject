package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import FrontController.Controller;
import Notice.NoticeDAO;
import Notice.NoticeVO;

public class NoticeViewController implements Controller{

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("noticeNo"));
		List<NoticeVO> list = NoticeDAO.getInstance().getAllNotice();
		for(NoticeVO n : list) {
			if(num==n.getNoticeNo()) {
				request.setAttribute("notice", n);
				break;
			}
		}
		return "noticeView";
	}

}
