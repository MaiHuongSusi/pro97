package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Majors;
import model.bean.Rooms;
import model.bo.MajorBo;
import model.bo.RoomBo;

/**
 * Servlet implementation class EditRoomController
 */
@WebServlet("/EditMajorController")
public class EditMajorController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		MajorBo majorBo = new MajorBo();
		
		int majorId = Integer.parseInt(request.getParameter("id"));
		System.out.println(majorId);
		Majors major = majorBo.getOneMajor(majorId);
		major.setName(request.getParameter("name"));
		
		if (majorBo.checkMajorNameAlreadyExistsEdit(request.getParameter("name"))) {
			
			request.setAttribute("major", major);
			request.setAttribute("ErrorEdit", " This major is already exists in system");
			response.sendRedirect(request.getContextPath() + "/major?msg=4");
			
//			response.sendRedirect(request.getContextPath() + "/room");

			
			}
		else {
			request.setAttribute("major", major);
			request.setAttribute("SuccessEdit", " Edit major successfully");
			majorBo.editMajors(major);
			response.sendRedirect(request.getContextPath() + "/major?msg=3");
//			response.sendRedirect(request.getContextPath() + "/room");

		
		}

	}
}
