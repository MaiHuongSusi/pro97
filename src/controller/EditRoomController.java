package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Rooms;
import model.bo.RoomBo;

/**
 * Servlet implementation class EditRoomController
 */
@WebServlet("/EditRoomController")
public class EditRoomController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		RoomBo roomBo = new RoomBo();
//		int roomId = Integer.parseInt(request.getParameter("id"));
//		this.roomId = roomId;
//		request.setAttribute("room", roomBo.getOneRoom(roomId));
//	
//		ArrayList<Rooms> roomlist = roomBo.getRooms();
//		request.setAttribute("roomList", roomlist);	
//		RequestDispatcher rd = request.getRequestDispatcher("/admin/rooms/RoomList.jsp?id=add-post2");
//		rd.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		RoomBo roomBo = new RoomBo();
		
		int roomId = Integer.parseInt(request.getParameter("id"));
		System.out.println(roomId);
		Rooms room = roomBo.getOneRoom(roomId);
		room.setName(request.getParameter("name"));
		
		room.setCapacity( Integer.parseInt(request.getParameter("capacity")));
		room.setStatus(Integer.parseInt(request.getParameter("status")));
		
		if (roomBo.checkRoomnameAlreadyExistsEdit(request.getParameter("name"))) {
			
			request.setAttribute("room", room);
			request.setAttribute("ErrorEdit", " This username is already exists in system");
			response.sendRedirect(request.getContextPath() + "/room?msg=4");
			
//			response.sendRedirect(request.getContextPath() + "/room");

			
			}
		else {
			request.setAttribute("room", room);
			request.setAttribute("SuccessEdit", " Edit room successfully");
			roomBo.editRooms(room);
			response.sendRedirect(request.getContextPath() + "/room?msg=3");
//			response.sendRedirect(request.getContextPath() + "/room");

		
		}

	}
}
