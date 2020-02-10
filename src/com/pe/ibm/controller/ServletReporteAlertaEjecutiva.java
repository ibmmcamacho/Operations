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

import com.pe.ibm.bean.BeanAlerta;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.business.BusinessReportes;
import com.pe.ibm.util.AppUtils;

/**
 * Servlet implementation class ServletReporteAlertaEjecutiva
 */
@WebServlet("/ServletReporteAlertaEjecutiva")
public class ServletReporteAlertaEjecutiva extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletReporteAlertaEjecutiva() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			/* Obtener sqlsessionF*/
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
			
			String operation = request.getParameter("strOperation");
			if(operation.equals("listReporteAE"))
				listAE(request, response, ssf);
		}
		catch(Exception ex){
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
	
	private void listAE(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException
	{
		
		int iTeam = Integer.parseInt( req.getParameter("iTeam"));
		String strFechaInicio = req.getParameter("pstrDateInicio");
		String strFechaFin = req.getParameter("pstrDateFin");
		
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setiTeam(iTeam);
		objBeanParameters.setStrdate1(strFechaInicio);
		objBeanParameters.setStrdate2(strFechaFin);
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"reporte\": [");
		try
		{
		
		List<BeanAlerta> lstBeanReports;
		BusinessReportes objBusinessReports = new BusinessReportes();
		
		lstBeanReports = objBusinessReports.listAlertasEjecutivas(objBeanParameters, ssf);
		
		if(lstBeanReports != null) {
			if(lstBeanReports.size() > 0)
			{
					for(BeanAlerta item : lstBeanReports)
					{
						strJson1.append("{\"idTicket\" : \"" + item.getMaximoIdTicket() + "\",");
						strJson1.append("\"maximoEstado\" : \"" + item.getEstadoAlerta() + "\",");
						strJson1.append("\"cliente\" : \"" + item.getMaximoCliente() + "\",");
						strJson1.append("\"resumen\" : \"" + AppUtils.cleanString(item.getMaximoResumen()) + "\",");
						strJson1.append("\"detalle\" : \"" + AppUtils.cleanString(item.getMaximoDetalle()) + "\",");
						strJson1.append("\"prioridad\" : \"" + item.getMaximoPrioridad() + "\",");
						strJson1.append("\"fechaCreacion\" : \"" + item.getMaximoFechaCreacion() + "\",");
						strJson1.append("\"estado\" : \"" + item.getMaximoEstado() + "\",");
						strJson1.append("\"idGrupoPropietario\" : \"" + item.getMaximoIdGrupoPropietario() + "\",");
						strJson1.append("\"grupoPropietario\" : \"" + item.getMaximoGrupoPropietario() + "\",");
						strJson1.append("\"pm\" : \"" + item.getPm() + "\",");
						strJson1.append("\"crisisTurno\" : \"" + item.getCrisisTurno() + "\",");
						strJson1.append("\"fechaNotificacionIBM\" : \"" + item.getFechaNotificacionIbm() + "\",");
						strJson1.append("\"dataCenter\" : \"" + item.getDataCenter() + "\",");
						strJson1.append("\"fechaFin\" : \"" + item.getFechaFin() + "\",");
						strJson1.append("\"tipoFalla\" : \"" + item.getStrTipoFalla() + "\",");
						strJson1.append("\"concurrencia\" : \"" + item.getConcurrencia() + "\",");
						strJson1.append("\"otrosClientes\" : \"" + item.getStrOtroCliente() + "\",");
						strJson1.append("\"propietarioIncidencia\" : \"" + item.getPropietarioIncidencia() + "\",");
						strJson1.append("\"servicioImpactado\" : \"" + item.getServicioImpactado() + "\",");
						strJson1.append("\"sla\" : \"" + item.getSla() + "\",");
						strJson1.append("\"impactoNegocio\" : \"" + item.getImpactoNegocio() + "\",");
						strJson1.append("\"idTicketProblema\" : \"" + item.getIdticketProblema() + "\",");
						strJson1.append("\"idTicketCambio\" : \"" + item.getIdticketCambio() + "\",");
						strJson1.append("\"cambioPm\" : \"" + item.getCambioPm() + "\",");
						strJson1.append("\"recibioAlerta\" : \"" + item.getStrRecibioAlerta() + "\",");
						strJson1.append("\"derivoCambio\" : \"" + item.getDerivoCambio() + "\",");
						strJson1.append("\"desviacionesIncidentes\" : \"" + AppUtils.cleanString(item.getDesviacionesIncidentes()) + "\",");
						strJson1.append("\"evaluacionCrisis\" : \"" + item.getEvaluacionCrisis() + "\",");
						strJson1.append("\"observaciones\" : \"" + item.getObservaciones() + "\",");
						strJson1.append("\"usuarioCreador\" : \"" + item.getUsuarioCreador() + "\",");
						strJson1.append("\"usuarioModificador\" : \"" + item.getUsuarioModificador() + "\"");
						
						strJson1.append("},");
					}
			}
			else
			{
//				strJson1.append("{\"reporte\" : \"null\"},");
				strJson1.append(",");
			}
		}
		}
		catch(Exception e)
		{
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		
		out.print(strJson2);
	}

}
