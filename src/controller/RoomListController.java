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
 * Servlet implementation class RoomListController
 */
@WebServlet("/room")
public class RoomListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String room_id = (String) request.getParameter("room_id");
//		int id = Integer.parseInt(room_id);
		if(request.getParameter("msg")!=null){
			String check = request.getParameter("msg");
			request.setAttribute("check", check);
		}
		
	    RoomBo roomBo = new RoomBo();
		ArrayList<Rooms> roomlist = roomBo.getRooms();
		for(Rooms room: roomlist){
			System.out.println(room.getRoomId());
		}
		request.setAttribute("roomList", roomlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/rooms/RoomList.jsp");
		rd.forward(request, response);
		return;
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}