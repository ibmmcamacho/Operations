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

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanHorario;
import com.pe.ibm.business.BusinessHorario;

/**
 * Servlet implementation class ServletWHorario
 */
@WebServlet("/ServletWHorario")
public class ServletWHorario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletWHorario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			BeanHorario objBeanHorario = new BeanHorario();
			BeanEmpleado objBeanPersonal = new BeanEmpleado();
		try {
			
			/* Obtener sqlsessionF*/
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
			
			String strOperacion = request.getParameter("strOperation");
			
			if (strOperacion.equals("list")) {
				objBeanHorario.setiTeam(Integer.parseInt(request.getParameter("iTeam")));
				list(request, response, objBeanHorario,ssf);
			} else {
				objBeanHorario.setiIdHoras(Integer.parseInt(request.getParameter("iIdHorario")));
				objBeanHorario.setStrHoras(request.getParameter("strHorario"));
				objBeanHorario.setStrUsuario(request.getParameter("strUsuario"));
				objBeanHorario.setiTeam(Integer.parseInt(request.getParameter("iTeam")));
				objBeanPersonal.setiIdEmpleado(Integer.parseInt(request.getParameter("iIdPersonal")));
				if (strOperacion.equals("delete")) {
					delete(request, response, objBeanHorario,ssf);
				} else if (strOperacion.equals("update")) {
					update(request, response, objBeanHorario,ssf);
				} else if (strOperacion.equals("save")) {
					save(request, response, objBeanHorario,ssf);
				}
				
				
			}
		} catch (Exception ex) {
			objBeanHorario.setiTeam(Integer.parseInt(request.getParameter("iTeam")));
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void list(HttpServletRequest req, HttpServletResponse res, BeanHorario objBeanHorario, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();

		strJson1.append("{\"reporte\" : [");
		try {
			List<BeanHorario> lstBeanHorario = null;
			BusinessHorario objBusinessHorario = new BusinessHorario();
			
			lstBeanHorario = objBusinessHorario.listHorario(objBeanHorario,ssf);

			if (lstBeanHorario.size() > 0) {
				for (BeanHorario item : lstBeanHorario) {
					strJson1.append("{\"idHorario\" : \"" + item.getiIdHoras() + "\",");
					strJson1.append("\"horas\" : \"" + item.getStrHoras() + "\"");
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

	public void save(HttpServletRequest req, HttpServletResponse res, BeanHorario pobjBeanHorario, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessHorario objBusinessHorario = new BusinessHorario();

			icount = objBusinessHorario.saveHorario(pobjBeanHorario,ssf);

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

	public void update(HttpServletRequest req, HttpServletResponse res, BeanHorario pobjBeanHorario, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessHorario objBusinessHorario = new BusinessHorario();

			icount = objBusinessHorario.updateHorario(pobjBeanHorario,ssf);

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

	public void delete(HttpServletRequest req, HttpServletResponse res, BeanHorario pobjBeanHorario, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessHorario objBusinessHorario = new BusinessHorario();

			icount = objBusinessHorario.deleteHorario(pobjBeanHorario,ssf);

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
