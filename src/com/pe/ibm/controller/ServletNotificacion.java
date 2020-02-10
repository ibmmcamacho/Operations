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

import com.pe.ibm.bean.BeanNotificacion;
import com.pe.ibm.business.BusinessNotificacion;

/**
 * Servlet implementation class ServletNotificaciones
 */
@WebServlet("/ServletNotificaciones")
public class ServletNotificacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletNotificacion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			/* Obtener sqlsessionF*/
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
			
			String strOperacion = request.getParameter("strOperation");
			
			if (strOperacion.equals("listNotificacionesIni")) {
				listBuscarNotificacionesIni(request, response, ssf);
			}else if (strOperacion.equals("listNotificaciones")) {
				listBuscarNotificaciones(request, response, ssf);
			}else if (strOperacion.equals("listNotificacionesNuevas")) {
				listBuscarNotificacionesNuevas(request, response, ssf);
			}else if (strOperacion.equals("actualizarNotificaciones")) {
				getActualizarLectura(request, response, ssf);
			}
		} catch (Exception ex) {
			System.out.println(ex.getCause().getMessage());
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void listBuscarNotificacionesIni(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		int pidEmpleado = Integer.parseInt(req.getParameter("iIdUsuario"));
		int itipo = Integer.parseInt(req.getParameter("itipo"));
		
		
		strJson1.append("{\"notificacionIni\" : [");
		try {
			List<BeanNotificacion> lstBeanNotificacion = null;
			List<BeanNotificacion> lstBeanNotificacionNuevos = null;
			BusinessNotificacion objBusinessNotificacion = new BusinessNotificacion();

			lstBeanNotificacion = objBusinessNotificacion.getBuscarNotificaciones(pidEmpleado, ssf);
			lstBeanNotificacionNuevos = objBusinessNotificacion.getBuscarNotificacionesNuevas(pidEmpleado, ssf);

			if (lstBeanNotificacion.size() > 0) {
				for (BeanNotificacion item : lstBeanNotificacion) {
					strJson1.append("{");
					strJson1.append("\"titulo\" : \"" + item.getStrTitulo() + "\",");
					strJson1.append("\"contenido\" : \"" + item.getStrContenido() + "\",");
					strJson1.append("\"fecha\" : \"" + item.getStrDateReg() + "\",");
					strJson1.append("\"img\" : \"" + item.getStrImg() + "\",");
					strJson1.append("\"enviado\" : \"" + item.getiEnviado() + "\",");
					strJson1.append("\"tipo\" : \"" + item.getStrTipo() + "\",");
					strJson1.append("\"fechaLectura\" : \"" + item.getStrDateLectura() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			strJson1 = strJson2;
			strJson2 = new StringBuilder();
			
			strJson1.append("\"notificacionNuevosIni\" : [");
			
			if (lstBeanNotificacionNuevos.size() > 0) {
				for (BeanNotificacion item : lstBeanNotificacionNuevos) {
					strJson1.append("{");
					strJson1.append("\"titulo\" : \"" + item.getStrTitulo() + "\",");
					strJson1.append("\"contenido\" : \"" + item.getStrContenido() + "\",");
					strJson1.append("\"img\" : \"" + item.getStrImg() + "\",");
					strJson1.append("\"fecha\" : \"" + item.getStrImg() + "\",");
					strJson1.append("\"img\" : \"" + item.getStrImg() + "\",");
					strJson1.append("\"enviado\" : \"" + item.getiEnviado() + "\",");
					strJson1.append("\"tipo\" : \"" + item.getStrTipo() + "\",");
					strJson1.append("\"fechaLectura\" : \"" + item.getStrDateLectura() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
			
			if(itipo == 1)
				getActualizarEnvio(req, res, ssf);
			if(itipo == 2)
				getActualizarLectura(req, res, ssf);
			
		} catch (Exception e) {
			strJson1.append(",");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		}
		
		out.print(strJson2);
	}
	
	
	public void listBuscarNotificaciones(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		int pidEmpleado = Integer.parseInt(req.getParameter("iIdUsuario"));
		int itipo = Integer.parseInt(req.getParameter("itipo"));
		
		strJson1.append("{\"notificacion\" : [");
		try {
			List<BeanNotificacion> lstBeanNotificacion = null;
			BeanNotificacion objBeanNotificacion = new BeanNotificacion();
			BusinessNotificacion objBusinessNotificacion = new BusinessNotificacion();

			lstBeanNotificacion = objBusinessNotificacion.getBuscarNotificaciones(pidEmpleado, ssf);

			if (lstBeanNotificacion.size() > 0) {
				for (BeanNotificacion item : lstBeanNotificacion) {
					strJson1.append("{");
					strJson1.append("\"titulo\" : \"" + item.getStrTitulo() + "\",");
					strJson1.append("\"contenido\" : \"" + item.getStrContenido() + "\",");
					strJson1.append("\"img\" : \"" + item.getStrImg() + "\",");
					strJson1.append("\"fecha\" : \"" + item.getStrImg() + "\",");
					strJson1.append("\"img\" : \"" + item.getStrImg() + "\",");
					strJson1.append("\"enviado\" : \"" + item.getiEnviado() + "\",");
					strJson1.append("\"tipo\" : \"" + item.getStrTipo() + "\",");
					strJson1.append("\"fechaLectura\" : \"" + item.getStrDateLectura() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
			if(itipo == 1)
				getActualizarEnvio(req, res, ssf);
			
		} catch (Exception e) {
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	
	public void listBuscarNotificacionesNuevas(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		int pidEmpleado = Integer.parseInt(req.getParameter("iIdUsuario"));
		
		strJson1.append("{\"notificacionNuevo\" : [");
		try {
			List<BeanNotificacion> lstBeanNotificacion = null;
			BeanNotificacion objBeanNotificacion = new BeanNotificacion();
			BusinessNotificacion objBusinessNotificacion = new BusinessNotificacion();

			lstBeanNotificacion = objBusinessNotificacion.getBuscarNotificacionesNuevas(pidEmpleado, ssf);

			if (lstBeanNotificacion.size() > 0) {
				for (BeanNotificacion item : lstBeanNotificacion) {
					strJson1.append("{");
					strJson1.append("\"titulo\" : \"" + item.getStrTitulo() + "\",");
					strJson1.append("\"contenido\" : \"" + item.getStrContenido() + "\",");
					strJson1.append("\"img\" : \"" + item.getStrImg() + "\",");
					strJson1.append("\"fecha\" : \"" + item.getStrImg() + "\",");
					strJson1.append("\"img\" : \"" + item.getStrImg() + "\",");
					strJson1.append("\"enviado\" : \"" + item.getiEnviado() + "\",");
					strJson1.append("\"tipo\" : \"" + item.getStrTipo() + "\",");
					strJson1.append("\"fechaLectura\" : \"" + item.getStrDateLectura() + "\"");
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
	
	public void getActualizarLectura(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
//		StringBuilder strJson1 = new StringBuilder();
//		res.setCharacterEncoding("UTF-8");
//		PrintWriter out = res.getWriter();
		int pidEmpleado = Integer.parseInt(req.getParameter("iIdUsuario"));
		
		try {
			BusinessNotificacion objBusinessNotificacion = new BusinessNotificacion();

			int icount = objBusinessNotificacion.getActualizarNotificaciones(pidEmpleado, ssf);

//			if(icount > 0)
//				strJson1.append("ok");
//			else
//				strJson1.append("fail");
			
		} catch (Exception e) {
//			strJson1.append("fail");
		}
//		out.print(strJson1);
	}
	
	public void getActualizarEnvio(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
//		StringBuilder strJson1 = new StringBuilder();
//		res.setCharacterEncoding("UTF-8");
//		PrintWriter out = res.getWriter();
		int pidEmpleado = Integer.parseInt(req.getParameter("iIdUsuario"));

		try {
			BeanNotificacion objBeanNotificacion = new BeanNotificacion();
			BusinessNotificacion objBusinessNotificacion = new BusinessNotificacion();

			int icount = objBusinessNotificacion.getActualizarEnvio(pidEmpleado, ssf);

//			if(icount > 0)
//				strJson1.append("ok");
//			else
//				strJson1.append("fail");
			
		} catch (Exception e) {
//			strJson1.append("fail");
		}
//		out.print(strJson1);
	}
	
}
