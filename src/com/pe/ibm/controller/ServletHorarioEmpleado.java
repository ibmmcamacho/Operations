package com.pe.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanHorarioEmpleado;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.business.BusinessHorarioEmpleado;
import com.pe.ibm.business.BusinessPersonal;
import com.pe.ibm.util.AppUtils;

/**
 * Servlet implementation class ServletHorarioEmpleadoEmpleado
 */
@WebServlet("/ServletHorarioEmpleado")
public class ServletHorarioEmpleado extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletHorarioEmpleado() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BeanHorarioEmpleado objBeanHorarioEmpleado = new BeanHorarioEmpleado();
		BeanEmpleado objBeanPersonal = new BeanEmpleado();
		try {

			/* Obtener sqlsessionF */
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");

			String strOperacion = request.getParameter("strOperation");
			// String strIdPersonal = request.getParameter("iIdPersonal");

			if (strOperacion.equals("list")) {
				objBeanHorarioEmpleado.setIdteam(Integer.parseInt(request.getParameter("iTeam")));
				objBeanHorarioEmpleado.setIdRegistrador(Integer.parseInt(request.getParameter("iIdPersonal")));
				list(request, response, objBeanHorarioEmpleado, ssf);
			} else if (strOperacion.equals("listPersonal")) {
				objBeanPersonal.setiIdEmpleado(Integer.parseInt(request.getParameter("iIdPersonal")));
				listPersonal(request, response, objBeanPersonal, ssf);
			} else {
				objBeanHorarioEmpleado.setId(Integer.parseInt(request.getParameter("iIdHorarioEmpleado")));
				objBeanHorarioEmpleado.setIdempleado(Integer.parseInt(request.getParameter("iIdEmpleado")));
				objBeanHorarioEmpleado.setIdRegistrador(Integer.parseInt(request.getParameter("iIdPersonal")));
				objBeanHorarioEmpleado.setIdteam(Integer.parseInt(request.getParameter("iTeam")));
				objBeanHorarioEmpleado.setFechainicio(request.getParameter("strFechaInicio"));
				objBeanHorarioEmpleado.setHorainicio(request.getParameter("strHorarioInicio"));
				objBeanHorarioEmpleado.setFechafin(request.getParameter("strFechaFin"));
				objBeanHorarioEmpleado.setHorafin(request.getParameter("strHorarioFin"));
				objBeanHorarioEmpleado.setObservaciones(AppUtils.cleanString(request.getParameter("strObservaciones")));
				objBeanHorarioEmpleado.setDuplicar(Integer.parseInt(request.getParameter("strDuplicar")));
				objBeanHorarioEmpleado.setFechaDuplicar(request.getParameter("strFechaDuplicar"));
				objBeanHorarioEmpleado.setConcatHorarioInicio();
				objBeanHorarioEmpleado.setConcatHorarioFin();

				if (strOperacion.equals("delete")) {
					delete(request, response, objBeanHorarioEmpleado, ssf);
				} else if (strOperacion.equals("update")) {
					update(request, response, objBeanHorarioEmpleado, ssf);
				} else if (strOperacion.equals("save")) {
					save(request, response, objBeanHorarioEmpleado, ssf);
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}

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

	public void list(HttpServletRequest req, HttpServletResponse res, BeanHorarioEmpleado objBeanHorarioEmpleado,
			SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();

		strJson1.append("{\"reporte\" : [");
		try {
			List<BeanHorarioEmpleado> lstBeanHorarioEmpleado = null;
			BusinessHorarioEmpleado objBusinessHorarioEmpleado = new BusinessHorarioEmpleado();

			lstBeanHorarioEmpleado = objBusinessHorarioEmpleado.listHorarioEmpleado(objBeanHorarioEmpleado, ssf);

			if (lstBeanHorarioEmpleado.size() > 0) {
				for (BeanHorarioEmpleado item : lstBeanHorarioEmpleado) {
					strJson1.append("{\"id\" : \"" + item.getId() + "\",");
					strJson1.append("\"idEmpleado\" : \"" + item.getIdempleado() + "\",");
					strJson1.append("\"title\" : \"" + item.getEmpleado() + "\",");
					strJson1.append("\"start\" : \"" + item.getFechayhorainicio() + "\",");
					strJson1.append("\"end\" : \"" + item.getFechayhorafin() + "\",");
					strJson1.append("\"observaciones\" : \"" + AppUtils.cleanString(item.getObservaciones()) + "\"");
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

	public void save(HttpServletRequest req, HttpServletResponse res, BeanHorarioEmpleado pobjBeanHorarioEmpleado,
			SqlSessionFactory ssf) throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessHorarioEmpleado objBusinessHorarioEmpleado = new BusinessHorarioEmpleado();

			icount = objBusinessHorarioEmpleado.saveHorario(pobjBeanHorarioEmpleado, ssf);

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

	public void update(HttpServletRequest req, HttpServletResponse res, BeanHorarioEmpleado pobjBeanHorarioEmpleado,
			SqlSessionFactory ssf) throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {

			int icount = 0;
			BusinessHorarioEmpleado objBusinessHorarioEmpleado = new BusinessHorarioEmpleado();
			if (pobjBeanHorarioEmpleado.getDuplicar() > 0) {
				int iDiferencia = AppUtils.difereciaDias(pobjBeanHorarioEmpleado.getFechainicio(),
					pobjBeanHorarioEmpleado.getFechaDuplicar());
				if (iDiferencia > 0) {
					icount = objBusinessHorarioEmpleado.updateHorario(pobjBeanHorarioEmpleado, ssf);
					if (icount == 0)
						icount = objBusinessHorarioEmpleado.saveHorario(pobjBeanHorarioEmpleado, ssf);
					
					for (int i = 0; i < iDiferencia; i++) {
						pobjBeanHorarioEmpleado.setId(0);
						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
						Date fecha1 = dateFormat.parse(pobjBeanHorarioEmpleado.getFechainicio());
						Date fecha2 = AppUtils.sumarDiasAFecha(fecha1, 1);
						pobjBeanHorarioEmpleado.setFechainicio(dateFormat.format(fecha2));

						fecha1 = dateFormat.parse(pobjBeanHorarioEmpleado.getFechafin());
						fecha2 = AppUtils.sumarDiasAFecha(fecha1, 1);
						pobjBeanHorarioEmpleado.setFechafin(dateFormat.format(fecha2));
						pobjBeanHorarioEmpleado.setConcatHorarioInicio();
						pobjBeanHorarioEmpleado.setConcatHorarioFin();
						icount = objBusinessHorarioEmpleado.saveHorario(pobjBeanHorarioEmpleado, ssf);
					}
				} else
					icount = objBusinessHorarioEmpleado.saveHorario(pobjBeanHorarioEmpleado, ssf);
				
				if (icount > 0) {
					resultado = "ok";
				} else {
					resultado = "fail";
				}
			} else {
				icount = objBusinessHorarioEmpleado.updateHorario(pobjBeanHorarioEmpleado, ssf);

				if (icount > 0) {
					resultado = "ok";
				} else {
					icount = objBusinessHorarioEmpleado.saveHorario(pobjBeanHorarioEmpleado, ssf);
					if (icount > 0) {
						resultado = "ok";
					} else {
						resultado = "fail";
					}
				}
			}
		} catch (Exception e) {
			resultado = "fail";
		}
		out.print(resultado);
	}

	public void delete(HttpServletRequest req, HttpServletResponse res, BeanHorarioEmpleado pobjBeanHorarioEmpleado,
			SqlSessionFactory ssf) throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessHorarioEmpleado objBusinessHorarioEmpleado = new BusinessHorarioEmpleado();

			icount = objBusinessHorarioEmpleado.deleteHorario(pobjBeanHorarioEmpleado, ssf);

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

	public void listPersonal(HttpServletRequest req, HttpServletResponse res, BeanEmpleado pobjBeanPersonal,
			SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();

		try {
			strJson1.append("{\"personal\" : [");
			List<BeanOptions> lstBeanPersonal = null;
			BusinessPersonal objBusinessPersonal = new BusinessPersonal();

			lstBeanPersonal = objBusinessPersonal.getPersonalHorario(pobjBeanPersonal, ssf);

			if (lstBeanPersonal.size() > 0) {
				for (BeanOptions item : lstBeanPersonal) {
					strJson1.append("{\"idOption\" : \"" + item.getiIdOption() + "\",");
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
