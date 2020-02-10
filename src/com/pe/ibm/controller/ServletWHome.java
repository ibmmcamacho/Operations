package com.pe.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanMenu;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.business.BusinessMenu;

/**
 * Servlet implementation class ServletWHome
 */
@WebServlet("/ServletWHome")
public class ServletWHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletWHome() {
        super();
        // TODO Auto-generated constructor stub
    }

    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			
			/* Obtener sqlsessionF*/
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
			
			String strOpcion = request.getParameter("op");
			
			if(strOpcion.equals("Menu"))
			{
				listMenu(request, response,ssf);	
			}
			else if(strOpcion.equals("Logout"))
			{
				System.out.println("destroy Session WHome");
				PrintWriter out = response.getWriter();
				HttpSession objSessionLogin = request.getSession();
				
				if (objSessionLogin != null){
					objSessionLogin.setAttribute("usuarioLogin", null);
					response.sendRedirect("windex.jsp");
	//				return;
					out.print("ok");
				}
				else
				{
	//				response.sendRedirect("whome.jsp");
	//				return;
					out.print("failed");
				}
			}
		}
		catch(Exception ex)
		{
			System.out.println(ex.getCause().getMessage());
		}
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void listMenu(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException{
//		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		try{
		List<BeanMenu> lstMenu = new ArrayList<BeanMenu>();
		BusinessMenu objBusinessMenu = new BusinessMenu();
		BeanParameters objBeanParameters = new BeanParameters();
		
		objBeanParameters.setiIdEmpleado(Integer.parseInt(req.getParameter("us")));
		objBeanParameters.setiTeam(Integer.parseInt(req.getParameter("iteam")));
		
		lstMenu = objBusinessMenu.obtenerMenuUsuario(objBeanParameters,ssf);
		
		if(lstMenu.size() > 0)
		{
		StringBuilder objJson1 = new StringBuilder();
		
		objJson1.append("[");
		
		for(BeanMenu obj : lstMenu){
			objJson1.append("{" +
							"\"descripcion\" : \"" + obj.getStrDescripcion() + "\" ," +
							"\"url\" : \"" + obj.getStrUrl() + "\" ," +
							"\"iconizq\" : \"" + obj.getStrIconIzq() + "\" ," +
							"\"iconder\" : \"" + obj.getStrIconDer() + "\" ," +
							"\"nivel\" : \"" + obj.getstrNivel() + "\" ," +
							"\"usuario\" : \"" + obj.getStrUsuario() + "\" ," +
							"\"orden\" : \"" + obj.getiOrden() + "\"" +
							"},"
							);
		}
		
		StringBuilder strJson2 = new StringBuilder();
		strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]");
		out.print(strJson2);
		}
		else
		{
			out.print("[]");
		}
		}
		catch(Exception ex){
			out.print("Error");
		}
	}
}
