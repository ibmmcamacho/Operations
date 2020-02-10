package com.pe.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanHorario;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanPerfil;
import com.pe.ibm.bean.BeanPerfilDet;
import com.pe.ibm.bean.BeanReporteDispatch;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessPerfil;
import com.pe.ibm.business.BusinessPerfilDet;




@WebServlet("/ServletWPerfilDet")
public class ServletWPerfilDet extends HttpServlet  {	
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletWPerfilDet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		
		try {
			/* Obtener sqlsessionF*/
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
			
			String strOperacion = request.getParameter("strOperation");			
				
			 if (strOperacion.equals("listReporterPerfilDet")) {				
				listReportePerfilDet(request, response, ssf);							
			 	}  
			 else if (strOperacion.equals("listComboPerfilDet")) {
					listCboPerfilDet(request, response,ssf);			 
			 	} 
			 else {
					BeanPerfilDet objPerfilDet = new BeanPerfilDet();
					objPerfilDet.setiIdPerfilDet(Integer.parseInt(request.getParameter("iIdPerfilDet")));
					objPerfilDet.setStrDescripcion(request.getParameter("strDescripcion"));
					objPerfilDet.setUrl(request.getParameter("url"));
					objPerfilDet.setIconizq(request.getParameter("iconizq"));
					objPerfilDet.setIconder(request.getParameter("iconder"));
					objPerfilDet.setNivel(request.getParameter("nivel"));
					objPerfilDet.setOrden(Integer.parseInt(request.getParameter("orden")));
					objPerfilDet.setIdPerfil(Integer.parseInt(request.getParameter("IdPerfil")));
					
					if (strOperacion.equals("update")) {
						updatePerfilDet(request, response, objPerfilDet,ssf);
					} else if (strOperacion.equals("delete")) {
						deletePerfilDet(request, response, objPerfilDet,ssf);
					} else if (strOperacion.equals("save")) {
						savePerfilDet(request, response, objPerfilDet,ssf);
					}
				}
			} catch (Exception ex) {
				System.out.println(ex.getCause().getMessage());
			}
		}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public void listReportePerfilDet(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
	
		
		strJson1.append("{\"ListaReportePerfilDet\": [");	
		
		try {
			List<BeanPerfilDet> lstBeanPerfilDet = null;			
			BeanPerfilDet objBeanPerfilDet = new BeanPerfilDet();
			BusinessPerfilDet objBusinessPerfilDet = new BusinessPerfilDet();
						
			
			objBeanPerfilDet.setIdPerfil(Integer.parseInt(request.getParameter("IdPerfil")));
			//int cboPerfil = Integer.parseInt(request.getParameter("strcboPerfil"));
			
			lstBeanPerfilDet = objBusinessPerfilDet.listPerfilDet(objBeanPerfilDet,ssf);
			
			if (lstBeanPerfilDet.size() > 0) {
				for (BeanPerfilDet item : lstBeanPerfilDet){
						strJson1.append("{\"IdPerfilDet\" : \"" + item.getiIdPerfilDet() + "\",");
						strJson1.append("\"Descripcion\" : \"" + item.getStrDescripcion() + "\",");
						strJson1.append("\"Url\" : \"" + item.getUrl() + "\",");
						strJson1.append("\"IconIzq\" : \"" + item.getIconizq() + "\",");
						strJson1.append("\"IconDer\" : \"" + item.getIconder() + "\",");
						strJson1.append("\"Nivel\" : \"" + item.getNivel() + "\",");
						strJson1.append("\"Orden\" : \"" + item.getOrden() + "\"");							
						strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
		} catch (Exception e) {
			System.out.println(e.getCause().getMessage());
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	public void listCboPerfilDet(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"reporte\" : [");
		try {
			List<BeanPerfilDet> lstBeanPerfilDet = null;
			BusinessPerfilDet objBusinessPerfilDet = new BusinessPerfilDet();
			BeanPerfilDet objBeanPerfilDet = new BeanPerfilDet();
			
			objBeanPerfilDet.setIdPerfil(Integer.parseInt(req.getParameter("IdPerfil")));
			//objBeanPerfilDet.setiTeam(Integer.parseInt(req.getParameter("iTeam").equals("0") ? "0" : req.getParameter("iTeam")));
			
			//objBeanPerfil.setiTeam(Integer.parseInt(req.getParameter("iTeam")));	
			
			lstBeanPerfilDet = objBusinessPerfilDet.listCboPerfilDet(objBeanPerfilDet,ssf);
			
			if (lstBeanPerfilDet.size() > 0) {
				for (BeanPerfilDet item : lstBeanPerfilDet) {
					strJson1.append("{\"idPerfilDet\" : \"" + item.getiIdPerfilDet() + "\",");
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
	
	public void savePerfilDet(HttpServletRequest req, HttpServletResponse res, BeanPerfilDet pobjBeanPerfilDet, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessPerfilDet objBusinessPerfilDet = new BusinessPerfilDet();

			icount = objBusinessPerfilDet.savePerfilDet(pobjBeanPerfilDet,ssf);

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

	public void updatePerfilDet(HttpServletRequest req, HttpServletResponse res, BeanPerfilDet pobjBeanPerfilDet, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessPerfilDet objBusinessPerfilDet = new BusinessPerfilDet();

			icount = objBusinessPerfilDet.updatePerfilDet(pobjBeanPerfilDet,ssf);

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

	public void deletePerfilDet(HttpServletRequest req, HttpServletResponse res, BeanPerfilDet pobjBeanPerfilDet, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessPerfilDet objBusinessPerfilDet = new BusinessPerfilDet();

			icount = objBusinessPerfilDet.deletePerfilDet(pobjBeanPerfilDet,ssf);

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