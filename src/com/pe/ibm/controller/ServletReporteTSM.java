package com.pe.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanReporteTSM;
import com.pe.ibm.business.BusinessReportesTSM;

/**
 * Servlet implementation class ServletReporteTSM
 */
@WebServlet("/ServletReporteTSM")
public class ServletReporteTSM extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletReporteTSM() {
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
			if (operation.equals("listReports"))
				listReportes(request, response, ssf);
			else if (operation.equals("listGraficos"))
				listGraficos(request, response, ssf);
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
	
	
	
	
	
	private void listReportes(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException
	{
		String strFechaInicio = req.getParameter("strFechaInicio");
		String strFechaFin = req.getParameter("strFechaFin");
		String strTipo = req.getParameter("strTipo");
		
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setStrdate1(strFechaInicio);
		objBeanParameters.setStrdate2(strFechaFin);
		objBeanParameters.setStrType(strTipo);
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"reporte\": [");
		try
		{
		
		List<BeanReporteTSM> lstBeanReportsTSM;
		BusinessReportesTSM objBusinessReports = new BusinessReportesTSM();
		
		lstBeanReportsTSM = objBusinessReports.listReportesTSM(objBeanParameters, ssf);
		
			if(lstBeanReportsTSM.size() > 0)
			{
				for(BeanReporteTSM item : lstBeanReportsTSM)
					{
						strJson1.append("{\"nombretsm\" : \"" + item.getNombretsm() + "\",");
						strJson1.append("\"datescheduled\" : \"" + item.getDatescheduled() + "\",");
						strJson1.append("\"timescheduled\" : \"" + item.getTimescheduled() + "\",");
						strJson1.append("\"datestart\" : \"" + item.getDatestart() + "\",");
						strJson1.append("\"timestart\" : \"" + item.getTimestart() + "\",");
						strJson1.append("\"schedule_name\" : \"" + item.getSchedule_name() + "\",");
						strJson1.append("\"node_name\" : \"" + item.getNode_name() + "\",");
						strJson1.append("\"status\" : \"" + item.getStatus() + "\",");
						strJson1.append("\"result\" : \"" + item.getResult() + "\",");
						strJson1.append("\"reason\" : \"" + item.getReason() + "\",");
						strJson1.append("\"datecompleted\" : \"" + item.getDatecompleted() + "\",");
						strJson1.append("\"timecompleted\" : \"" + item.getTimecompleted() + "\"");
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
	
	private void listGraficos(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException
	{
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		
		strJson1.append("{\"reporte\": [");
		try{
			
			String strFechaInicio = req.getParameter("strFechaInicio");
			String strFechaFin = req.getParameter("strFechaFin");
			String strTipo = req.getParameter("strTipo");
			
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrdate1(strFechaInicio);
			objBeanParameters.setStrdate2(strFechaFin);
			objBeanParameters.setStrType(strTipo);
			if(strTipo.equals("1"))
				objBeanParameters.setStrValor1("FAILED");
			else if(strTipo.equals("2"))
				objBeanParameters.setStrValor1("COMPLETED");
			else if(strTipo.equals("3"))
				objBeanParameters.setStrValor1(null);
			
			List<BeanReporteTSM> lstBeanReportsTSM;
			BusinessReportesTSM objBusinessReports = new BusinessReportesTSM();
			lstBeanReportsTSM = objBusinessReports.listGraficoTSM(objBeanParameters, ssf);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM");
			Date firstDate = sdf.parse(strFechaInicio);
			Date secondDate = sdf.parse(strFechaFin);
			 
			long diffInMillies = Math.abs(secondDate.getTime() - firstDate.getTime());
			long diff = (TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS)) + 1;
			String[] arrFechas = new String[(int)(diff == 0 ? 1 : diff)];
			
			strJson1.append("{\"labels\": [");
			if(lstBeanReportsTSM.size() > 0){
				
//				if(diff == 0) {
//					Calendar calendar = Calendar.getInstance();
//					calendar.setTime(firstDate); // Configuramos la fecha que se recibe
//					calendar.add(Calendar.DAY_OF_YEAR, 0);
//					strJson1.append("\"" + sdf2.format(calendar.getTime()) + "\",");
//					arrFechas[0] = sdf.format(calendar.getTime());
//				}
				
				for(int i = 0 ; i < diff ; i++){
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(firstDate); // Configuramos la fecha que se recibe
					calendar.add(Calendar.DAY_OF_YEAR, i);
					strJson1.append("\"" + sdf2.format(calendar.getTime()) + "\",");
					arrFechas[i] = sdf.format(calendar.getTime());
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			int iClient = 0;
			String strClient = "";
			String[] arrClient = null;
			if(lstBeanReportsTSM.size() > 0){
				iClient++;
				strClient = lstBeanReportsTSM.get(0).getCliente();
				for(int i = 0 ; i < lstBeanReportsTSM.size() ; i++) {
					if(!strClient.equals(lstBeanReportsTSM.get(i).getCliente())) {
						strClient = lstBeanReportsTSM.get(i).getCliente();
						iClient++;
					}
				}
				
				arrClient = new String[iClient];
				strClient = lstBeanReportsTSM.get(0).getCliente();
				arrClient[0] = lstBeanReportsTSM.get(0).getCliente();
				iClient = 1;
				
				for(int i = 0 ; i < lstBeanReportsTSM.size() ; i++) {
					if(!strClient.equals(lstBeanReportsTSM.get(i).getCliente())) {
						strClient = lstBeanReportsTSM.get(i).getCliente();
						arrClient[iClient] = lstBeanReportsTSM.get(i).getCliente();
						iClient++;
					}
				}
			}
			
			strJson1 = new StringBuilder();
			strJson1.append("\"datasets\": [");
			int iEncontroFecha = 0; //comodin para saber si encontró la fecha o no
			
			if(arrClient != null) {
				for(int i = 1 ; i <= arrClient.length ; i++) {
					
					strJson1.append("{\"name\": \"" + arrClient[i-1] + "\",\"data\": [");
					
//					strJson1.append("{\"label\": \"" + arrClient[i-1] + "\",\"fill\": false,\"backgroundColor\": ");
//					long color = Math.round(Math.random()*1000000);
//					strJson1.append("\"#" + (int)color + "\",\"borderColor\": \"#" + (int)color + "\",\"data\": [");
					if(lstBeanReportsTSM.size() > 0){
						
//						if(diff == 0 ) {
//							for(BeanReporteTSM item : lstBeanReportsTSM){
//								if(iEncontroFecha == 1) break;
//								if(arrFechas[0].equals(item.getFecha()) && item.getCliente().equals(arrClient[i-1])) {
//									iEncontroFecha = 1;
//									strJson1.append(item.getCantidad() + ",");
//								}
//							}
//							if(iEncontroFecha == 0) strJson1.append("0,");;
//						}
						iEncontroFecha = 0;
						for(int j = 0 ; j < diff ; j++) {
							iEncontroFecha = 0;
							for(BeanReporteTSM item : lstBeanReportsTSM){
								if(iEncontroFecha == 1) break;
								if(arrFechas[j].equals(item.getFecha()) && item.getCliente().equals(arrClient[i-1])) {
									iEncontroFecha = 1;
									strJson1.append(item.getCantidad() + ",");
								}
							}
							if(iEncontroFecha == 0) strJson1.append("0,");;
						}
						strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
						strJson1 = new StringBuilder();
					}
					else
						strJson1.append(",");
				}
			}
			else
				strJson1.append("{[]},");
			if(strJson1.length() == 0) {
				strJson1.append(strJson2.substring(0, strJson2.length() - 1) + "]}]}");
				strJson2 = new StringBuilder();
				strJson2 = strJson1;
			}
				
		}	
		catch(Exception ex){
			System.out.println(ex.getMessage());
			ex.printStackTrace();
			
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}

		out.print(strJson2);
	}
	

}
