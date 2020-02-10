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

import com.pe.ibm.bean.BeanPerfil;
import com.pe.ibm.bean.BeanPerfilDet;
import com.pe.ibm.business.BusinessPerfil;

/**
 * Servlet implementation class ServletWPerfil
 */
@WebServlet("/ServletWPerfil")


public class ServletWPerfil extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletWPerfil() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		try {
			/* Obtener sqlsessionF*/
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
			
			String strOperacion = request.getParameter("strOperation");

			if (strOperacion.equals("listPerfil")) {
				listPerfil(request, response,ssf);
			} else if (strOperacion.equals("listComboPerfilDet")) {
				listPerfilDet(request, response,ssf);
			}else{
				BeanPerfil objPerfil = new BeanPerfil();
				objPerfil.setiIdPerfil(Integer.parseInt(request.getParameter("iIdPerfil")));
				objPerfil.setStrDescripcion(request.getParameter("strDescripcion"));
				objPerfil.setiTeam(Integer.parseInt(request.getParameter("iTeam")));
				if (strOperacion.equals("deletePerfil")) {
					deletePerfil(request, response, objPerfil,ssf);
				} else if (strOperacion.equals("updatePerfil")) {
					updatePerfil(request, response, objPerfil,ssf);
				} else if (strOperacion.equals("savePerfil")) {
					savePerfil(request, response, objPerfil,ssf);
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.getCause().getMessage());
		}
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void listPerfil(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"reporte\" : [");
		try {
			List<BeanPerfil> lstBeanPerfil = null;
			BusinessPerfil objBusinessPerfil = new BusinessPerfil();
			BeanPerfil objBeanPerfil = new BeanPerfil();
			
			objBeanPerfil.setiTeam(Integer.parseInt(req.getParameter("iTeam").equals("0") ? "0" : req.getParameter("iTeam")));
			
			//objBeanPerfil.setiTeam(Integer.parseInt(req.getParameter("iTeam")));	
			lstBeanPerfil = objBusinessPerfil.listPerfil(objBeanPerfil,ssf);
			
			if (lstBeanPerfil.size() > 0) {
				for (BeanPerfil item : lstBeanPerfil) {
					strJson1.append("{\"idPerfil\" : \"" + item.getiIdPerfil() + "\",");
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
	
	
	
	
	
	
	
	public void listPerfilDet(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"reporte\" : [");
		try {
			List<BeanPerfil> lstBeanPerfil = null;
			BusinessPerfil objBusinessPerfil = new BusinessPerfil();
			BeanPerfil objBeanPerfil = new BeanPerfil();
			
			
			objBeanPerfil.setiTeam(Integer.parseInt(req.getParameter("iTeam").equals("0") ? "0" : req.getParameter("iTeam")));
			
			//objBeanPerfil.setiTeam(Integer.parseInt(req.getParameter("iTeam")));	
			lstBeanPerfil = objBusinessPerfil.listPerfilDet(objBeanPerfil,ssf);
			
			if (lstBeanPerfil.size() > 0) {
				for (BeanPerfil item : lstBeanPerfil) {
					strJson1.append("{\"idPerfil\" : \"" + item.getiIdPerfil() + "\",");
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	public void savePerfil(HttpServletRequest req, HttpServletResponse res, BeanPerfil pobjBeanPerfil, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessPerfil objBusinessPerfil = new BusinessPerfil();

			icount = objBusinessPerfil.savePerfil(pobjBeanPerfil,ssf);

			if (icount > 0) {
				resultado = "ok";
			} else {
				resultado = "fail";
			}
		} catch (Exception e) {
			resultado = "fail";
		}
		out.print(resultado);
	}

	public void updatePerfil(HttpServletRequest req, HttpServletResponse res, BeanPerfil pobjBeanPerfil, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessPerfil objBusinessPerfil = new BusinessPerfil();

			icount = objBusinessPerfil.updatePerfil(pobjBeanPerfil,ssf);

			if (icount > 0) {
				resultado = "ok";
			} else {
				resultado = "fail";
			}
		} catch (Exception e) {
			resultado = "fail";
		}
		out.print(resultado);
	}

	public void deletePerfil(HttpServletRequest req, HttpServletResponse res, BeanPerfil pobjBeanPerfil, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessPerfil objBusinessPerfil = new BusinessPerfil();

			icount = objBusinessPerfil.deletePerfil(pobjBeanPerfil,ssf);

			if (icount > 0) {
				resultado = "ok";
			} else {
				resultado = "fail";
			}
		} catch (Exception e) {
			resultado = "fail";
		}
		out.print(resultado);
	}

}
