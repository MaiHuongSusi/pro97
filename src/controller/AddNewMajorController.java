package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Majors;
import model.bean.Rooms;
import model.bo.MajorBo;
import model.bo.RoomBo;
import model.dao.RoomDao;

@WebServlet("/AddNewMajor")
public class AddNewMajorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddNewMajorController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/admin/majors/addMajor.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Majors major = new Majors(0, request.getParameter("name"));

		MajorBo majorBo = new MajorBo();
		if (majorBo.checkMajorNameAlreadyExistsEdit(request.getParameter("name"))) {

			HttpSession session = request.getSession();
			session.setAttribute("major", major);
			session.setAttribute("Error", "This major is already exists in system");

			response.sendRedirect(request.getContextPath() + "/major?msg=1");
//			response.sendRedirect(request.getContextPath() + "/room");
			return;
		} else {
			majorBo.addMajors(major);
			HttpSession session = request.getSession();
			session.setAttribute("major", major);
			session.setAttribute("abc", "Adding major successfully");
			response.sendRedirect(request.getContextPath() + "/major?msg=2");
//			response.sendRedirect(request.getContextPath() + "/room");
			return;
		}

	}

}