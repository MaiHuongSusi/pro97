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

import model.bean.Rooms;
import model.bo.RoomBo;
import model.dao.RoomDao;

@WebServlet("/AddNewRoom")
public class AddNewRoomController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddNewRoomController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/admin/rooms/addRoom.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Rooms room = new Rooms(0, request.getParameter("name"), Integer.parseInt(request.getParameter("capacity")),
				Integer.parseInt(request.getParameter("status")));

		RoomBo roomBo = new RoomBo();
		if (roomBo.checkRoomnameAlreadyExistsEdit(request.getParameter("name"))) {

			HttpSession session = request.getSession();
			session.setAttribute("room", room);
			session.setAttribute("Error", "This username is already exists in system");

			response.sendRedirect(request.getContextPath() + "/room?msg=1");
//			response.sendRedirect(request.getContextPath() + "/room");
			return;
		} else {
			roomBo.addRooms(room);
			HttpSession session = request.getSession();
			session.setAttribute("room", room);
			session.setAttribute("abc", "Adding room successfully");
			response.sendRedirect(request.getContextPath() + "/room?msg=2");
//			response.sendRedirect(request.getContextPath() + "/room");
			return;
		}

	}

}