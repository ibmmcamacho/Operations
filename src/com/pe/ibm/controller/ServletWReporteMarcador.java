package com.pe.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanReporte;
import com.pe.ibm.business.BusinessReportes;
import com.pe.ibm.util.AppUtils;

/**
 * Servlet implementation class ServletWReporteMarcador
 */
@WebServlet("/ServletWReporteMarcador")
public class ServletWReporteMarcador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletWReporteMarcador() {
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
			SqlSessionFactory ssfWHMaximo = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfMaximo");
			
			String operation = request.getParameter("strOperation");
			if(operation.equals("listTeams"))
				listTeams(request, response, ssf);
			else if (operation.equals("listReports"))
				listReportes(request, response, ssf);
			else if (operation.equals("listTopTardanza"))
				listTop(request, response, ssf,"listTopTardanza");
			else if (operation.equals("listSLA_Rimac"))
				listSLA_Rimac(request, response, ssfWHMaximo);
			else if (operation.equals("listSLA_RimacPromedio"))
				listSLA_RimacPromedio(request, response, ssfWHMaximo);
			else if (operation.equals("listSLA_RimacPromTotal"))
				listSLA_RimacPromTotal(request, response, ssfWHMaximo);
			else if (operation.equals("listSLA_EspecialistasPrioridad"))
				listSLA_EspecialistasPrioridad(request, response, ssfWHMaximo);
			else if (operation.equals("listReportSLA_RimacPromTotal"))
				listReportSLA_RimacPromTotal(request, response, ssfWHMaximo);
			else if (operation.equals("listSLA"))
				listSLA(request, response, ssfWHMaximo);
		}
		catch(Exception ex){
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
	
	private void listTeams(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException
	{
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("[");
		try
		{
		
		List<BeanReporte> lstBeanReports;
		BusinessReportes objBusinessReports = new BusinessReportes();
		
		lstBeanReports = objBusinessReports.listTeams(ssf);
		
			if(lstBeanReports.size() > 0)
			{
				for(BeanReporte item : lstBeanReports)
				{
					strJson1.append("{\"area\" : \"" + item.getStrArea() + "\"},");
				}
			}
			else
			{
				strJson1.append("{\"area\" : \"null\"},");
			}
		}
		catch(Exception e)
		{
			strJson1.append("{\"area\" : \"null\"},");
		}
		strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]");
		out.print(strJson2);
	}

	private void listReportes(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException
	{
		String strFechaInicio = req.getParameter("strFechaInicio");
		String strFechaFin = req.getParameter("strFechaFin");
		String strTipo = req.getParameter("strTipo");
		int iTeam = Integer.parseInt( req.getParameter("iTeam"));
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setStrdate1(strFechaInicio);
		objBeanParameters.setStrdate2(strFechaFin);
		objBeanParameters.setStrType(strTipo);
		objBeanParameters.setiTeam(iTeam);
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"reporte\": [");
		try
		{
		
		List<BeanReporte> lstBeanReports;
		BusinessReportes objBusinessReports = new BusinessReportes();
		
		lstBeanReports = objBusinessReports.listReportes(objBeanParameters, ssf);
		
			if(lstBeanReports.size() > 0)
			{
				if(strTipo.equals("1"))
					for(BeanReporte item : lstBeanReports)
					{
						strJson1.append("{\"area\" : \"" + item.getStrArea() + "\",");
						strJson1.append("\"modalidad\" : \"" + item.getStrModalidad() + "\",");
						strJson1.append("\"cargo\" : \"" + item.getStrCargo() + "\",");
						strJson1.append("\"idempleado\" : \"" + item.getStrIdLogin() + "\",");
						strJson1.append("\"personal\" : \"" + item.getStrEmpleado() + "\",");
						strJson1.append("\"email\" : \"" + item.getStrEmail() + "\",");
						strJson1.append("\"horario\" : \"" + item.getStrHorario() + "\",");
						strJson1.append("\"mes\" : \"" + item.getStrMes() + "\",");
						strJson1.append("\"fechaEntrada\" : \"" + item.getStrFechaEntrada() + "\",");
						strJson1.append("\"horaEntrada\" : \"" + item.getStrHoraEntrada() + "\",");
						strJson1.append("\"fechaSalida\" : \"" + item.getStrFechaSalida() + "\",");
						strJson1.append("\"horaSalida\" : \"" + item.getStrHoraSalida() + "\",");
						strJson1.append("\"minutos\" : \"" + item.getStrMinutos() + "\",");
						strJson1.append("\"obs\" : \"" + AppUtils.cleanString(item.getStrObs()) + "\",");
						strJson1.append("\"ip\" : \"" + item.getStrIp() + "\",");
						strJson1.append("\"os\" : \"" + item.getStrSo() + "\",");
						strJson1.append("\"browser\" : \"" + item.getStrBrowser() + "\"");
						strJson1.append("},");
					}
				else if(strTipo.equals("2"))
					for(BeanReporte item : lstBeanReports)
					{
						strJson1.append("{\"area\" : \"" + item.getStrArea() + "\",");
						strJson1.append("\"idempleado\" : \"" + item.getStrEmpleado() + "\",");
						strJson1.append("\"personal\" : \"" + item.getStrIdLogin() + "\",");
						strJson1.append("\"enero\" : \"" + item.getStrEnero() + "\",");
						strJson1.append("\"febrero\" : \"" + item.getStrFebrero() + "\",");
						strJson1.append("\"marzo\" : \"" + item.getStrMarzo() + "\",");
						strJson1.append("\"abril\" : \"" + item.getStrAbril() + "\",");
						strJson1.append("\"mayo\" : \"" + item.getStrMayo() + "\",");
						strJson1.append("\"junio\" : \"" + item.getStrJunio() + "\",");
						strJson1.append("\"julio\" : \"" + item.getStrJulio() + "\",");
						strJson1.append("\"agosto\" : \"" + item.getStrAgosto() + "\",");
						strJson1.append("\"septiembre\" : \"" + item.getStrSeptiembre() + "\",");
						strJson1.append("\"octubre\" : \"" + item.getStrOctubre() + "\",");
						strJson1.append("\"noviembre\" : \"" + item.getStrNoviembre() + "\",");
						strJson1.append("\"diciembre\" : \"" + item.getStrDiciembre() + "\"");
						strJson1.append("},");
					}
				else if(strTipo.equals("3")){
					
					int iMaxDia = 0;
					for(int i = 0 ; i < lstBeanReports.size(); i++)
					{
						if(lstBeanReports.get(i).getiDia() > iMaxDia)
							iMaxDia = lstBeanReports.get(i).getiDia(); 
					}
					for(BeanReporte item : lstBeanReports)
					{
						strJson1.append("{\"area\" : \"" + item.getStrArea() + "\",");
						strJson1.append("\"idempleado\" : \"" + item.getStrEmpleado() + "\",");
						strJson1.append("\"personal\" : \"" + item.getStrIdLogin() + "\",");
//						for(int i = 0 ; i < iMaxDia; i++)
//						{
//							if(item.getiDia() == iMaxDia)
//								strJson1.append("");
//							else
//								strJson1.append("");
//						}
					
						strJson1.append("\"horario\" : \"" + item.getStrHorario() + "\",");
						strJson1.append("\"mes\" : \"" + item.getStrMes() + "\",");
						strJson1.append("\"fechaEntrada\" : \"" + item.getStrFechaEntrada() + "\",");
						strJson1.append("\"horaEntrada\" : \"" + item.getStrHoraEntrada() + "\",");
						strJson1.append("\"fechaSalida\" : \"" + item.getStrFechaSalida() + "\",");
						strJson1.append("\"horaSalida\" : \"" + item.getStrHoraSalida() + "\",");
						strJson1.append("\"minutos\" : \"" + item.getStrMinutos() + "\"");
						strJson1.append("},");
					}
				} else if(strTipo.equals("4")){
					for(BeanReporte item : lstBeanReports)
					{
						strJson1.append("{\"area\" : \"" + item.getStrArea() + "\",");
						strJson1.append("\"modalidad\" : \"" + item.getStrModalidad() + "\",");
						strJson1.append("\"cargo\" : \"" + item.getStrCargo() + "\",");
						strJson1.append("\"idempleado\" : \"" + item.getStrIdLogin() + "\",");
						strJson1.append("\"personal\" : \"" + item.getStrEmpleado() + "\",");
						strJson1.append("\"email\" : \"" + item.getStrEmail() + "\",");
						strJson1.append("\"horario\" : \"" + item.getStrHorario() + "\",");
						strJson1.append("\"mes\" : \"" + item.getStrMes() + "\",");
						strJson1.append("\"semana\" : \"" + item.getStrSemana() + "\",");
						strJson1.append("\"minutos\" : \"" + item.getStrMinutos() + "\"");
						strJson1.append("},");
					}
				} else if(strTipo.equals("5")){
					for(BeanReporte item : lstBeanReports)
					{
						strJson1.append("{\"idempleado\" : \"" + item.getStrIdLogin() + "\",");
						strJson1.append("\"personal\" : \"" + item.getStrEmpleado() + "\",");
						strJson1.append("\"email\" : \"" + item.getStrEmail() + "\",");
						strJson1.append("\"dia\" : \"" + item.getStrDia() + "\",");
						strJson1.append("\"fecha\" : \"" + item.getStrFechaEntrada() + "\",");
						strJson1.append("\"horario\" : \"" + item.getStrHorario() + "\",");
						strJson1.append("\"asistencia\" : \"" + item.getStrAsistencia() + "\",");
						strJson1.append("\"obs\" : \"" + AppUtils.cleanString(item.getStrObs()) + "\"");
						strJson1.append("},");
					}
				}
			}
			else
			{
//				strJson1.append("{\"reporte\" : \"null\"},");
				strJson1.append(",");
			}
		}
		catch(Exception e)
		{
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		
		out.print(strJson2);
	}

	private void listTop(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf, String strParFecha) throws IOException
	{
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Date date = new Date();
		
		String strTipo = req.getParameter("strTipo");
		int iTeam = Integer.parseInt( req.getParameter("iTeam"));
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setStrType(strTipo);
		objBeanParameters.setiTeam(iTeam);
		
		
		objBeanParameters.setStrdate1(dateFormat.format(date));
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		if(strParFecha.equals("listTopTardanza"))
			objBeanParameters.setStrValor1(null); //del día
		else if(strParFecha.equals("listTopAsistencia"))
			objBeanParameters.setStrValor1("mes"); //del mes
		
		
		strJson1.append("{\"reporte\": [");
		try
		{
		
		List<BeanReporte> lstBeanReports;
		BusinessReportes objBusinessReports = new BusinessReportes();
		
		lstBeanReports = objBusinessReports.listReportes(objBeanParameters, ssf);
		
			if(lstBeanReports.size() > 0)
			{
				if(strTipo.equals("1"))
					for(BeanReporte item : lstBeanReports)
					{
						strJson1.append("{\"area\" : \"" + item.getStrArea() + "\",");
						strJson1.append("\"modalidad\" : \"" + item.getStrModalidad() + "\",");
						strJson1.append("\"cargo\" : \"" + item.getStrCargo() + "\",");
						strJson1.append("\"idempleado\" : \"" + item.getStrIdLogin() + "\",");
						strJson1.append("\"personal\" : \"" + item.getStrEmpleado() + "\",");
						strJson1.append("\"horario\" : \"" + item.getStrHorario() + "\",");
						strJson1.append("\"mes\" : \"" + item.getStrMes() + "\",");
						strJson1.append("\"fechaEntrada\" : \"" + item.getStrFechaEntrada() + "\",");
						strJson1.append("\"horaEntrada\" : \"" + item.getStrHoraEntrada() + "\",");
						strJson1.append("\"fechaSalida\" : \"" + item.getStrFechaSalida() + "\",");
						strJson1.append("\"horaSalida\" : \"" + item.getStrHoraSalida() + "\",");
						strJson1.append("\"minutos\" : \"" + item.getStrMinutos() + "\",");
						strJson1.append("\"obs\" : \"" + AppUtils.cleanString(item.getStrObs()) + "\",");
						strJson1.append("\"ip\" : \"" + item.getStrIp() + "\",");
						strJson1.append("\"os\" : \"" + item.getStrSo() + "\",");
						strJson1.append("\"browser\" : \"" + item.getStrBrowser() + "\"");
						strJson1.append("},");
					}
				
			}
			else
			{
//				strJson1.append("{\"reporte\" : \"null\"},");
				strJson1.append(",");
			}
		}
		catch(Exception e)
		{
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		
		out.print(strJson2);
	}
	
	private void listSLA_Rimac(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException
	{
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		String strProyecto = req.getParameter("strProyecto");
		String strFechaInicio = req.getParameter("strFechaInicio");
		String strFechaFin = req.getParameter("strFechaFin");
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setStrTeam(strProyecto);
		objBeanParameters.setStrdate1(strFechaInicio);
		objBeanParameters.setStrdate2(strFechaFin);
		
		strJson1.append("{\"reporte\": [");
		try
		{
		
		List<BeanMaximo> lstBeanMaximo;
		BusinessReportes objBusinessReports = new BusinessReportes();
		
		lstBeanMaximo = objBusinessReports.listSLA_Rimac(objBeanParameters,ssf);
		
			if(lstBeanMaximo.size() > 0)
			{
				for(BeanMaximo item : lstBeanMaximo)
					{
						strJson1.append("{\"ticket\" : \"" + item.getIdTicket() + "\",");
						strJson1.append("\"class\" : \"" + item.getTicketClass() + "\",");
						strJson1.append("\"prioridad\" : \"" + item.getTicketPrioridad() + "\",");
						strJson1.append("\"fechaCreacion\" : \"" + item.getTicketFechaCreacion() + "\",");
						strJson1.append("\"tiempo\" : \"" + item.getStrValor1() + "\",");
						strJson1.append("\"sla\" : \"" + item.getStrValor2() + "\",");
						strJson1.append("\"slaestado\" : \"" + item.getStrValor3() + "\",");
						strJson1.append("\"estado\" : \"" + item.getTicketEstado() + "\",");
						strJson1.append("\"idGrupoPropietario\" : \"" + item.getTicketIdGrupoPropietario() + "\",");
						strJson1.append("\"grupoPropietario\" : \"" + item.getTicketGrupoPropietario() + "\",");
						strJson1.append("\"propietario\" : \"" + item.getTicketPropietario() + "\",");
						strJson1.append("\"emailPropietario\" : \"" + item.getTicketEmailPropietario() + "\",");
						strJson1.append("\"titulo\" : \"" + AppUtils.cleanString(item.getTicketTitulo()) + "\",");
						strJson1.append("\"worklog\" : \"" + AppUtils.cleanString(item.getStrValor4()) + "\",");
						strJson1.append("\"pais\" : \"" + AppUtils.cleanString(item.getStrValor5()) + "\"");
						strJson1.append("},");
					}
				
			}
			else
			{
//				strJson1.append("{\"reporte\" : \"null\"},");
				strJson1.append(",");
			}
		}
		catch(Exception e)
		{
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		
		out.print(strJson2);
	}
	
	
	private void listSLA_RimacPromedio(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException
	{
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		String strP1 = "", strP2 = "", strP3 = "", strP4 = "", strTotal = "", strFecha = "";
		List<BeanParameters> objFechas = new ArrayList<BeanParameters>();
		int iCount = 1;
		
		String strProyecto = req.getParameter("strProyecto");
		String strFechaInicio = req.getParameter("strFechaInicio");
		String strFechaFin = req.getParameter("strFechaFin");
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setStrTeam(strProyecto);
		objBeanParameters.setStrdate1(strFechaInicio);
		objBeanParameters.setStrdate2(strFechaFin);
		
		strJson1.append("{\"fechas\": [");
		try
		{
		
		List<BeanMaximo> lstBeanMaximo;
		BusinessReportes objBusinessReports = new BusinessReportes();
		
		lstBeanMaximo = objBusinessReports.listSLA_Promedio(objBeanParameters,ssf);
		
			if(lstBeanMaximo.size() > 0)
			{

				for(int i = 1; i < lstBeanMaximo.size() ; i++) {
					if(!lstBeanMaximo.get(i-1).getTicketFechaCreacion().equalsIgnoreCase(lstBeanMaximo.get(i).getTicketFechaCreacion())) {
						iCount ++;
					}
				}
				
				String strFechas[] = new String [iCount];
				iCount = 1;
				strFechas[0] = lstBeanMaximo.get(0).getTicketFechaCreacion();
				for(int i = 1 ; i < lstBeanMaximo.size() ; i++) {
					if(!lstBeanMaximo.get(i-1).getTicketFechaCreacion().equalsIgnoreCase(lstBeanMaximo.get(i).getTicketFechaCreacion())) {
						strFechas[iCount] = lstBeanMaximo.get(i).getTicketFechaCreacion();
						iCount++;
					}
				}
				
				iCount = 0;
				
				for(int i = 0 ; i < strFechas.length ; i++) {
					if(strProyecto.toUpperCase().equalsIgnoreCase("RIMAC")) {
						if(lstBeanMaximo.get(iCount).getTicketPrioridad().equalsIgnoreCase("1")) {
							strP1 += "\"" + lstBeanMaximo.get(iCount).getStrValor1() + "\",";
							iCount++;
							}
						else
							strP1 += "\"0\",";
						
						if(lstBeanMaximo.get(iCount).getTicketPrioridad().equalsIgnoreCase("2")) {
							strP2 += "\"" + lstBeanMaximo.get(iCount).getStrValor1() + "\",";
							iCount++;	
							}
						else
							strP2 += "\"" + "0\",";
						
						if(lstBeanMaximo.get(iCount).getTicketPrioridad().equalsIgnoreCase("3")) {
							strP3 += "\"" + lstBeanMaximo.get(iCount).getStrValor1() + "\",";
							iCount++;
						}
						else
							strP3 += "\"0\",";
						
						if(lstBeanMaximo.get(iCount).getTicketPrioridad().equalsIgnoreCase("4")) {
							strP4 += "\"" + lstBeanMaximo.get(iCount).getStrValor1() + "\",";
							iCount++;	
						}
						else
							strP4 += "\"0\",";
					}
					else if(strProyecto.toUpperCase().equalsIgnoreCase("CENTRIA")) {
						if(lstBeanMaximo.get(iCount).getTicketPrioridad().equalsIgnoreCase("TOTAL")) {
							strTotal += "\"" + lstBeanMaximo.get(iCount).getStrValor1() + "\",";
							iCount++;	
						}
						else
							strTotal += "\"0\",";
					}
				}
				
			
				for(int i = 0 ; i < strFechas.length ; i++) {
//					strJson1.append("{\"fechas\": [");
					strJson1.append("{\"fecha\" : \"" + strFechas[i] + "\"},");
				}
				strJson2.append(strJson1.substring(0,strJson1.length() - 1) + "]");
				
				strJson1 = new StringBuilder();
				strJson1.append(",\"dataFechas\": [");
				
				strJson1.append("");
				if(strProyecto.equalsIgnoreCase("CENTRIA"))
					strJson1.append("{\"prio\" : [" + strTotal.substring(0,strTotal.length() -1 ) + "]}]");
				else {
					strJson1.append("{\"prio\" : [" + strP1.substring(0,strP1.length() -1 ) + "]},");
					strJson1.append("{\"prio\" : [" + strP2.substring(0,strP2.length() -1 ) + "]},");
					strJson1.append("{\"prio\" : [" + strP3.substring(0,strP3.length() -1 ) + "]},");
					strJson1.append("{\"prio\" : [" + strP4.substring(0,strP4.length() -1 ) + "]}]");
				}
				
				strJson1.append("}");
				
			}
			else
			{
//				strJson1.append("{\"reporte\" : \"null\"},");
				strJson1.append(",");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			strJson1 = new StringBuilder();
			strJson1.append("error");
		}
		strJson2.append(strJson1.substring(0,strJson1.length()));
		
		out.print(strJson2);
	}
	
	
	private void listSLA_RimacPromTotal(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException
	{
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		String strProyecto = req.getParameter("strProyecto");
		String strFechaInicio = req.getParameter("strFechaInicio");
		String strFechaFin = req.getParameter("strFechaFin");
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setStrTeam(strProyecto);
		objBeanParameters.setStrdate1(strFechaInicio);
		objBeanParameters.setStrdate2(strFechaFin);
		
		strJson1.append("{\"reporte\": [");
		try
		{
		
		List<BeanMaximo> lstBeanMaximo;
		BusinessReportes objBusinessReports = new BusinessReportes();
		
		lstBeanMaximo = objBusinessReports.listSLA_PromedioTotal(objBeanParameters,ssf);
		
			if(lstBeanMaximo.size() > 0)
			{
				for(BeanMaximo item : lstBeanMaximo)
					{
						strJson1.append("{\"prioridad\" : \"" + item.getTicketPrioridad() + "\",");
						strJson1.append("\"sla\" : \"" + item.getStrValor1() + "\",");
						strJson1.append("\"estado\" : \"" + item.getStrValor2() + "\",");
						strJson1.append("\"total\" : \"" + item.getStrValor3() + "\",");
						strJson1.append("\"promedio\" : \"" + item.getStrValor4() + "\"");
						strJson1.append("},");
					}
			}
			else
			{
//				strJson1.append("{\"reporte\" : \"null\"},");
				strJson1.append(",");
			}
		}
		catch(Exception e)
		{
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		
		out.print(strJson2);
	}
	
	
	private void listReportSLA_RimacPromTotal(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException
	{
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		String strProyecto = req.getParameter("strProyecto");
		String strFechaInicio = req.getParameter("strFechaInicio");
		String strFechaFin = req.getParameter("strFechaFin");
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setStrTeam(strProyecto);
		objBeanParameters.setStrdate1(strFechaInicio);
		objBeanParameters.setStrdate2(strFechaFin);
		
		strJson1.append("{\"reporte\": [");
		try
		{
		
		List<BeanMaximo> lstBeanMaximo;
		BusinessReportes objBusinessReports = new BusinessReportes();
		
		lstBeanMaximo = objBusinessReports.listReportSLA_PromedioTotal(objBeanParameters,ssf);
		
			if(lstBeanMaximo.size() > 0)
			{
				for(BeanMaximo item : lstBeanMaximo)
					{
						strJson1.append("{\"idticket\" : \"" + item.getIdTicket() + "\",");
						strJson1.append("\"class\" : \"" + item.getTicketClass() + "\",");
						strJson1.append("\"status\" : \"" + item.getTicketEstado() + "\",");
						strJson1.append("\"prioridad\" : \"" + item.getTicketPrioridad() + "\",");
						strJson1.append("\"fechacreacion\" : \"" + item.getTicketFechaCreacion() + "\",");
						strJson1.append("\"fechafin\" : \"" + item.getTicketFechaFin() + "\",");
						strJson1.append("\"summary\" : \"" + AppUtils.cleanString(item.getTicketTitulo()) + "\",");
						strJson1.append("\"creador\" : \"" + item.getTicketCreador() + "\",");
						strJson1.append("\"correocreador\" : \"" + item.getTicketCreador() + "\",");
						strJson1.append("\"propietario\" : \"" + item.getTicketPropietario() + "\",");
						strJson1.append("\"correopropietario\" : \"" + item.getTicketEmailPropietario() + "\",");
						strJson1.append("\"worklog\" : \"" + AppUtils.cleanString(item.getTicketLastWorkLog()) + "\",");
						strJson1.append("\"grupopropietario\" : \"" + item.getTicketGrupoPropietario() + "\",");
						strJson1.append("\"timeresolve\" : \"" + item.getTicketTimeToResolve() + "\",");
						strJson1.append("\"tiempo\" : \"" + item.getStrValor1() + "\",");
						strJson1.append("\"sla\" : \"" + item.getStrValor2() + "\",");
						strJson1.append("\"statussla\" : \"" + item.getStrValor3() + "\"");
						strJson1.append("},");
					}
			}
			else
			{
//				strJson1.append("{\"reporte\" : \"null\"},");
				strJson1.append(",");
			}
		}
		catch(Exception e)
		{
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		
		out.print(strJson2);
	}
	
	
	private void listSLA_EspecialistasPrioridad(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException
	{
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		String strProyecto = req.getParameter("strProyecto");
		String strFechaInicio = req.getParameter("strFechaInicio");
		String strFechaFin = req.getParameter("strFechaFin");
		int iPrioridad = Integer.parseInt(req.getParameter("iPrioridad"));
		BeanParameters objBeanParameters = new BeanParameters();
		
		objBeanParameters.setStrTeam(strProyecto);
		objBeanParameters.setStrdate1(strFechaInicio);
		objBeanParameters.setStrdate2(strFechaFin);
		objBeanParameters.setiValor1(iPrioridad);
		
		strJson1.append("{\"reporte\": [");
		try
		{
		
		List<BeanMaximo> lstBeanMaximo;
		BusinessReportes objBusinessReports = new BusinessReportes();
		
		lstBeanMaximo = objBusinessReports.listSLA_EspecialistasPrioridad(objBeanParameters,ssf);
		int iContador = 0;
		
			if(lstBeanMaximo.size() > 0)
			{
				for(BeanMaximo item : lstBeanMaximo)
					{
						strJson1.append("{\"owner\" : \"" + item.getTicketPropietario() + "\",");
						strJson1.append("\"ownerId\" : \"" + item.getTicketEmailPropietario() + "\",");
						strJson1.append("\"total\" : \"" + item.getStrValor1() + "\",");
						strJson1.append("\"prom\" : \"" + item.getStrValor2() + "\"");
						strJson1.append("},");
						iContador += Integer.parseInt(item.getStrValor1());
					}
				strJson1.append("{\"owner\" : \"TOTAL\",");
				strJson1.append("\"ownerId\" : \"TOTAL GENERAL\",");
				strJson1.append("\"total\" : \"" + iContador + "\",");
				strJson1.append("\"prom\" : \"\"");
				strJson1.append("},");
			}
			else
			{
//				strJson1.append("{\"reporte\" : \"null\"},");
				strJson1.append(",");
			}
			
			
			
		}
		catch(Exception e)
		{
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		
		out.print(strJson2);
	}
	
	
	private void listSLA(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException
	{
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
//		String strProyecto = req.getParameter("strProyecto");
		String strFechaInicio = req.getParameter("strFechaInicio");
		String strFechaFin = req.getParameter("strFechaFin");
		String strSla = req.getParameter("strSla");	
		String strTipo = req.getParameter("strTipo");
		BeanParameters objBeanParameters = new BeanParameters();
		
//		objBeanParameters.setStrTeam(strProyecto);
		objBeanParameters.setStrdate1(strFechaInicio);
		objBeanParameters.setStrdate2(strFechaFin);
		objBeanParameters.setStrValor1(strTipo);
//		objBeanParameters.setStrValor2(strSla.equals("PASENOPRODUCTIVO") ? "PASE NO P" : "PASE A P");
//		objBeanParameters.setiValor1(iPrioridad);
		
		strJson1.append("{\"reporte\": [");
		try{
		
		List<BeanMaximo> lstBeanMaximo;
		BusinessReportes objBusinessReports = new BusinessReportes();
		
		lstBeanMaximo = strSla.equals("PASENOPRODUCTIVO") ? objBusinessReports.listPasesNoProductivos(objBeanParameters,ssf) : objBusinessReports.listPasesProductivos(objBeanParameters,ssf);
		
			if(lstBeanMaximo.size() > 0)
			{
				for(BeanMaximo item : lstBeanMaximo)
					{
						strJson1.append("{\"idTicket\" : \"" + item.getIdTicket() + "\",");
						strJson1.append("\"estado\" : \"" + item.getTicketIdEstado() + "\",");
						strJson1.append("\"creador\" : \"" + item.getTicketCreador() + "\",");
						strJson1.append("\"grupoCreador\" : \"" + item.getTicketGrupoPropietario() + "\",");
						strJson1.append("\"propietario\" : \"" + item.getTicketPropietario() + "\",");
						strJson1.append("\"titulo\" : \"" + AppUtils.cleanString(item.getTicketTitulo()) + "\",");
						strJson1.append("\"lastWorklog\" : \"" + AppUtils.cleanString(item.getTicketLastWorkLog()) + "\",");
						strJson1.append("\"fechaCreacion\" : \"" + item.getTicketFechaCreacion() + "\",");
						strJson1.append("\"fechaFin\" : \"" + item.getTicketFechaFin() + "\",");
						strJson1.append("\"horarioCreacion\" : \"" + item.getStrValor1() + "\",");
						strJson1.append("\"fechaLimite\" : \"" + item.getStrValor2() + "\",");
						strJson1.append("\"estadoSLA\" : \"" + item.getStrValor3() + "\",");
						strJson1.append("\"tiempoRestante\" : \"" + item.getStrValor4() + "\",");
						strJson1.append("\"tiempoTranscurrido\" : \"" + item.getTicketTimeToResolve() + "\"");
						strJson1.append("},");
					}
			}
			else
			{
				strJson1.append(",");
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
