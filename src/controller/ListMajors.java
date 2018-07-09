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
 * Servlet implementation class RoomListController
 */
@WebServlet("/major")
public class ListMajors extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getParameter("msg")!=null){
			String check = request.getParameter("msg");
			request.setAttribute("check", check);
		}
		
	    MajorBo majorBo = new MajorBo();
		ArrayList<Majors> majorlist = majorBo.getMajors();
		for(Majors major: majorlist){
			System.out.println(major.getMajorId());
		}
		request.setAttribute("majorList", majorlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("/admin/majors/MajorList.jsp");
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