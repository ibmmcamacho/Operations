package com.pe.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanTeam;
import com.pe.ibm.business.BusinessTeam;

/**
 * Servlet implementation class ServletWTeam
 */
@WebServlet("/ServletWTeam")
public class ServletWTeam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletWTeam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strOperacion = request.getParameter("strOperation");
		
		/* Obtener sqlsessionF*/
		SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
		
		if (strOperacion.equals("list"))
			list(request, response, ssf);
		else if(strOperacion.equals("listUsuario"))
			listTeams(request, response, ssf);
		else if (strOperacion.equals("listPetro"))
			listPetro(request, response, ssf);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void list(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"team\" : [");
		try {
			List<BeanTeam> lstBeanTeam = null;
			BusinessTeam objBusinessTeam = new BusinessTeam();
			
			lstBeanTeam = objBusinessTeam.obtenerTeam(ssf);

			if (lstBeanTeam.size() > 0) {
				for (BeanTeam item : lstBeanTeam) {
					strJson1.append("{\"idTeam\" : \"" + item.getiIdTeam() + "\",");
					strJson1.append("\"descripcion\" : \"" + item.getStrDescripcion() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
		} catch (Exception e) {
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	
	
	public void listPetro(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String strIdEmpleado = req.getParameter("strIdEmpleado");
		
		strJson1.append("{\"team\" : [");
		try {
			List<BeanTeam> lstBeanTeam = null;
			BeanParameters objBeanParameters = new BeanParameters();
			BusinessTeam objBusinessTeam = new BusinessTeam();
			objBeanParameters.setStrIdLogin(strIdEmpleado);
			
			lstBeanTeam = objBusinessTeam.obtenerTeamUsuarioPetro(objBeanParameters, ssf);

			if (lstBeanTeam.size() > 0) {
				for (BeanTeam item : lstBeanTeam) {
					strJson1.append("{\"idTeam\" : \"" + item.getiIdTeam() + "\",");
					strJson1.append("\"descripcion\" : \"" + item.getStrDescripcion() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
		} catch (Exception e) {
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	
	
	public void listTeams(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String strIdEmpleado = req.getParameter("strIdEmpleado");
		
		strJson1.append("{\"team\" : [");
		try {
			List<BeanTeam> lstBeanTeam = null;
			BeanParameters objBeanParameters = new BeanParameters();
			BusinessTeam objBusinessTeam = new BusinessTeam();
			objBeanParameters.setStrIdLogin(strIdEmpleado);
			
			lstBeanTeam = objBusinessTeam.obtenerTeamUsuario(objBeanParameters, ssf);

			if (lstBeanTeam.size() > 0) {
				for (BeanTeam item : lstBeanTeam) {
					strJson1.append("{\"idTeam\" : \"" + item.getiIdTeam() + "\",");
					strJson1.append("\"descripcion\" : \"" + item.getStrDescripcion() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
		} catch (Exception e) {
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}

}
