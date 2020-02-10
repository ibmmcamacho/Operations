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

import com.pe.ibm.bean.BeanBusqueda;
import com.pe.ibm.bean.BeanConsumoBackup;
import com.pe.ibm.bean.BeanConsumoDisco;
import com.pe.ibm.bean.BeanConsumoSistema;
import com.pe.ibm.bean.BeanHorario;
import com.pe.ibm.business.BusinessConsumos;

/**
 * Servlet implementation class ServletWHorario
 */
@WebServlet("/ServletWConsumos")
public class ServletWConsumos extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BeanBusqueda beanBusqueda;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletWConsumos() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			BeanHorario objBeanHorario = new BeanHorario();
		try {
			
			/* Obtener sqlsessionF*/
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
			
			String strOperacion = request.getParameter("strOperation");
			
			
			
			if (strOperacion.equals("consumosDisco")) {
				beanBusqueda = null;
				listConsumoDisco(request, response, ssf);
			} else if (strOperacion.equals("consumosBackup")){
				beanBusqueda = null;
				listConsumoBackup(request, response, ssf);
			} else if (strOperacion.equals("consumosSistema")){
				beanBusqueda = null;
				listConsumoSistema(request, response, ssf);
			} else if (strOperacion.equals("historicoConsumosDisco")){
				obtenerFechas(request, response);
				listConsumoDisco(request, response, ssf);
			} else if (strOperacion.equals("historicoConsumosSistema")){
				obtenerFechas(request, response);
				listConsumoSistema(request, response, ssf);
			} else if (strOperacion.equals("historicoConsumosBackup")){
				obtenerFechas(request, response);
				listConsumoBackup(request, response, ssf);
			}else if (strOperacion.equals("registrarBackup")){
				registrarConsumoBackup(request, response, ssf);
			}
			
			
			
		} catch (Exception ex) {
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void obtenerFechas(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String strFechaInicio = req.getParameter("strFechaInicio") + " 00:00:00.0";
		String strFechaFin = req.getParameter("strFechaFin") + " 23:59:59.9";
		
		this.beanBusqueda = new BeanBusqueda();
		beanBusqueda.setFechaInicio(strFechaInicio);
		beanBusqueda.setFechaFin(strFechaFin);
	
	}
	
	
	public void listConsumoDisco(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"reporteConsumoDisco\" : [");
		try {
			List<BeanConsumoDisco> lstBeanConsumoDisco = null;
			BusinessConsumos objBusinessConsumos = new BusinessConsumos();
			
			lstBeanConsumoDisco = objBusinessConsumos.listConsumosDisco(ssf, this.beanBusqueda);	
			

			if (lstBeanConsumoDisco.size() > 0) {
				for (BeanConsumoDisco item : lstBeanConsumoDisco) {
					strJson1.append("{\"lpart\" : \"" + item.getLpart() + "\",");
					strJson1.append("\"sysbase\" : \"" + item.getSysbase() + "\",");
					strJson1.append("\"tmoviasp\" : \"" + item.getTmoviasp() + "\",");
					strJson1.append("\"ssd\" : \"" + item.getSsd() + "\",");
					strJson1.append("\"hora\" : \"" + item.getHora() + "\",");
					strJson1.append("\"fecha\" : \"" + item.getFecha() + "\",");
					strJson1.append("\"tmoviasp_dispo\" : \"" + item.getTmoviasp_dispo() + "\"");
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
	
	
	
	
	public void listConsumoBackup(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();

		strJson1.append("{\"reporteConsumoBackup\" : [");
		try {
			List<BeanConsumoBackup> lstBeanConsumoBackup = null;
			BusinessConsumos objBusinessConsumos = new BusinessConsumos();
			
			lstBeanConsumoBackup = objBusinessConsumos.listConsumosBackup(ssf, this.beanBusqueda);

			if (lstBeanConsumoBackup.size() > 0) {
				for (BeanConsumoBackup item : lstBeanConsumoBackup) {
					strJson1.append("{\"id\" : \"" + item.getId()+ "\",");
					strJson1.append("\"fcfull\" : \"" + item.getFcfull() + "\",");
					strJson1.append("\"hora\" : \"" + item.getHora() + "\",");
					strJson1.append("\"fecha\" : \"" + item.getFecha() + "\",");
					strJson1.append("\"inicio\" : \"" + item.getInicio() + "\",");
					strJson1.append("\"fin\" : \"" + item.getFin() + "\",");
					strJson1.append("\"estado\" : \"" + item.getEstado()+ "\",");
					strJson1.append("\"descripcionEstado\" : \"" + item.getDescripcionEstado()+ "\",");
					strJson1.append("\"observacion\" : \"" + item.getObservacion()+"\"");
					
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
	
	public void registrarConsumoBackup(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();

		strJson1.append("{\"resultado\" : [");
		try {
			int idBackup = Integer.parseInt(req.getParameter("strIdBackup"));
			int estado = Integer.parseInt(req.getParameter("strEstado"));
			String observacion = req.getParameter("strObservacion");
			String opcion = req.getParameter("strOpcion");
			
			BeanConsumoBackup bean = new BeanConsumoBackup();
			bean.setId(idBackup);
			bean.setEstado(estado);
			bean.setObservacion(observacion);
			bean.setOperacion(opcion);

			BusinessConsumos objBusinessConsumos = new BusinessConsumos();
		
			int resultado = objBusinessConsumos.insertarActualizarBackup(bean, ssf);

			if (resultado != 0) {
					strJson1.append("{\"codigo\" : \"" + "1"+ "\",");
					strJson1.append("\"descripcion\" : \"" + "Se realizó el registro satisfactoriamente"+ "\"");
			} else {
					strJson1.append("{\"codigo\" : \"" + "0"+ "\",");
					strJson1.append("\"descripcion\" : \"" + "Hubo un error durante el registro"+ "\"");
			}
			strJson1.append("},");
			
		} catch (Exception e) {
			strJson1.append("{\"codigo\" : \"" + "0"+ "\",");
			strJson1.append("\"descripcion\" : \"" + "Hubo un error durante el registro"+ "\"");
			strJson1.append("},");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	
	public void listConsumoSistema(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();

		strJson1.append("{\"reporteConsumoSistema\" : [");
		try {
			List<BeanConsumoSistema> lstBeanConsumoSistema = null;
			BusinessConsumos objBusinessConsumos = new BusinessConsumos();
			
			lstBeanConsumoSistema = objBusinessConsumos.listConsumosSistema(ssf, this.beanBusqueda);

			if (lstBeanConsumoSistema.size() > 0) {
				for (BeanConsumoSistema item : lstBeanConsumoSistema) {
					strJson1.append("{\"estado\" : \"" + item.getEstado() + "\",");
					strJson1.append("\"hora\" : \"" + item.getHora() + "\",");
					strJson1.append("\"fecha\" : \"" + item.getFecha() + "\",");
					strJson1.append("\"cantidad\" : \"" + item.getCantidad() + "\",");
					strJson1.append("\"porcent\" : \"" + item.getPorcent() + "\",");
					strJson1.append("\"umbral\" : \"" + item.getUmbral() + "\",");
					strJson1.append("\"valmax\" : \"" + item.getValmax() + "\"");
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
