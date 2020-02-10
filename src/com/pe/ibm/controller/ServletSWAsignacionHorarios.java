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
import com.pe.ibm.business.BusinessHorario;

/**
 * Servlet implementation class ServletSWAsignacionHorarios
 */
@WebServlet("/ServletSWAsignacionHorarios")
public class ServletSWAsignacionHorarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSWAsignacionHorarios() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		BeanParameters objBeanParameters = new BeanParameters();
		try {
			
			/* Obtener sqlsessionF*/
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
			
			String strOperacion = request.getParameter("strOperation");
			objBeanParameters.setiTeam(Integer.parseInt(request.getParameter("iTeam")));
			if (strOperacion.equals("list")) {
				list(request, response, objBeanParameters,ssf);
			}else {
				
				objBeanParameters.setiIdEmpleado(Integer.parseInt(request.getParameter("iEmpleado")));
				objBeanParameters.setiValor2(Integer.parseInt(request.getParameter("iHorario")));
				if (strOperacion.equals("delete")) {
					objBeanParameters.setiValor1(Integer.parseInt(request.getParameter("iIdAsignacion")));
					delete(request, response, objBeanParameters,ssf);
				} else if (strOperacion.equals("update")) {
					objBeanParameters.setiValor1(Integer.parseInt(request.getParameter("iIdAsignacion")));
					update(request, response, objBeanParameters,ssf);
				} else if (strOperacion.equals("save")) {
					save(request, response, objBeanParameters,ssf);
				}
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
	
	public void list(HttpServletRequest req, HttpServletResponse res, BeanParameters pobjBeanParameters, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();

		strJson1.append("{\"reporte\" : [");
		try {
			List<BeanParameters> lstBeanParameters = null;
			BusinessHorario objBusinessHorario = new BusinessHorario();
			
			lstBeanParameters = objBusinessHorario.listHorarioAsignacion(pobjBeanParameters,ssf);
			
			if (lstBeanParameters.size() > 0) {
				for (BeanParameters item : lstBeanParameters) {
					strJson1.append("{\"idLogin\" : \"" + item.getStrIdLogin() + "\",");
					strJson1.append("\"empleado\" : \"" + item.getStrValor1() + "\",");
					strJson1.append("\"area\" : \"" + item.getStrValor2() + "\",");
					strJson1.append("\"horas\" : \"" + item.getStrValor3() + "\",");
					strJson1.append("\"idHorarioEmpleado\" : \"" + item.getiValor1() + "\",");
					strJson1.append("\"idEmpleado\" : \"" + item.getiIdEmpleado() + "\",");
					strJson1.append("\"idHorario\" : \"" + item.getiValor2() + "\"");
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

	public void save(HttpServletRequest req, HttpServletResponse res, BeanParameters pobjBeanParameters, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessHorario objBusinessHorario = new BusinessHorario();

			icount = objBusinessHorario.saveHorario(pobjBeanParameters, ssf);

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

	public void update(HttpServletRequest req, HttpServletResponse res, BeanParameters pobjBeanParameters, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessHorario objBusinessHorario = new BusinessHorario();

			icount = objBusinessHorario.updateHorario(pobjBeanParameters, ssf);

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

	public void delete(HttpServletRequest req, HttpServletResponse res, BeanParameters pobjBeanParameters, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessHorario objBusinessHorario = new BusinessHorario();

			icount = objBusinessHorario.deleteHorario(pobjBeanParameters, ssf);

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
