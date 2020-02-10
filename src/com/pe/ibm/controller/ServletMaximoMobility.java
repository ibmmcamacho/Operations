package com.pe.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanMaximoWorkOrder;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanReporteLlamadas;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.bean.BeanSlaMDA;
import com.pe.ibm.bean.BeanTicketSRINC;
import com.pe.ibm.business.BusinessMaximoMobility;
import com.pe.ibm.business.BusinessMaximoWH;
import com.pe.ibm.business.BusinessOptions;
import com.pe.ibm.util.AppUtils;

/**
 * Servlet implementation class ServletMaximoWH
 */
@WebServlet("/ServletMaximoMobility")
public class ServletMaximoMobility extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	BeanSession objBeanSession = new BeanSession();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMaximoMobility() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* Obtener sqlsessionF*/
//		SqlSessionFactory ssfMaximo = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
//		SqlSessionFactory ssfCisco = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfCisco");
		
//		SqlSessionFactory ssfLocal = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
//		SqlSessionFactory ssfCisco = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfCisco");
//		SqlSessionFactory ssfMaximo = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfMaximoMobility");
		SqlSessionFactory ssfMaximo = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfCisco");
			
		HttpSession objSessionLogin = request.getSession(true);
		objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
		
		System.out.println("session: "+ objBeanSession.getObjBeanPersonal().getStrCodCliente());
		
		String strOperacion = request.getParameter("strOperation");
		if(strOperacion.equals("listpais")){
			listPaises(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("listclientes")){
			listClientes(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("listFrecuencia")){
			listFrecuencia(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("listDiario")){
			listDiario(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("listTendenciaActual")){
			getTendenciaActual(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("listticketspais")){
			listTicketsPaises(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("listticketsclientes")){
			listTicketsClientes(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("listticketsFrecuencia")){
			listTicketsFrecuencia(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("listticketsTendenciaActual")){
			getTicketsTendenciaActual(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("getClientMobility")){
			getClientMobility(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("listBacklogGSP")){
			listBacklogGSP(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("listCiscoGSP")){
//			listCiscoGSP(request,response,ssfCisco);
			listCiscoGSP(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("getTiempoSolucion")){
			getTiempoSolucion(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("getTicketsResueltos")){
			getTicketsResueltos(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("getUsuariosTop")){
			getUsuariosTop(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("getBackLog")){
			getBackLog(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("getBackLogDetalle")){
			getBackLogDetalle(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("getSedes")){
			getSedes(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("getMaximoTicketsBackLog")){
			getMaximoTicketsBackLog(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("getTicketsResueltosEstados")){
			getTicketsResueltosEstados(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("getTicketsResueltosFechas")){
			getTicketsResueltosFechas(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("getMaximoTicketsResueltos")){
			getMaximoTicketsResueltos(request,response,ssfMaximo);
		}else if(strOperacion.equals("getBackLogWO")){
			getBackLogWO(request,response,ssfMaximo);
		}else if(strOperacion.equals("getMaximoTicketsBackLogWO")){
			getMaximoTicketsBackLogWO(request,response,ssfMaximo);
		}else if(strOperacion.equals("getMaximoTicketsBackLogWOTareas")){
			getMaximoTicketsBackLogWOTareas(request,response,ssfMaximo);
		}else if(strOperacion.equals("getSlaMDA")){
			getResultadoSlaMDA(request,response,ssfMaximo);
		}else if(strOperacion.equals("getSlaMDAReport")){
			getReporte(request,response,ssfMaximo);
		}else if(strOperacion.equals("updateCorreo")){
			updateCorreo(request,response,ssfMaximo);
		}else if(strOperacion.equals("getSession")){
			getSession(request,response,ssfMaximo);
		}
		
		
	}
	
	
	
	
	
	public void getSession(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		
		String strcodCliente = objBeanSession.getObjBeanPersonal().getStrCodCliente();
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			
			
			strJson1.append("{\"session\" : [");
			
			strJson1.append("{" +
							"\"strcodCliente\" : \"" + strcodCliente + "\" " +
							"},"
							);

			
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
			
			
			
		}catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}
	
	public void updateCorreo(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		int resultado = 0;
		String strFecha = req.getParameter("ptxtPeriodo");
		String strCorreo = req.getParameter("ptxtCorreo");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
			BeanSlaMDA pBean = new BeanSlaMDA();
			pBean.setIdProyecto(11);
			pBean.setStrFechaSla(strFecha);
			pBean.setCorreoRecibido(Integer.parseInt(strCorreo));
			
			resultado = objBusinessMaximoMobility.updateCorreo(pBean, ssf);
			
			
			
			strJson1.append("{\"resultadoUpdate\" : [");
			
			if(resultado > 0){
					strJson1.append("{" +
							"\"idResultado\" : \"" + resultado + "\" " +
							"},"
							);

			}else
				strJson1.append(",");
			
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
			
			
			
		}catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}
	
	public void getReporte(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		int acumuladoCorreo = 0;
		String strFecha = req.getParameter("ptxtPeriodo") + "-01";
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
			List<BeanReporteLlamadas> listLlamadasContestadas = null;
			List<BeanReporteLlamadas> listLlamadasNoContestadas = null;
			BeanReporteLlamadas pBeanLlamadas = new BeanReporteLlamadas();
			pBeanLlamadas.setIdProyecto(11);
			pBeanLlamadas.setStr1(strFecha);
			listLlamadasContestadas = objBusinessMaximoMobility.getReporteLlamadasContestadas(pBeanLlamadas, ssf);
			listLlamadasNoContestadas = objBusinessMaximoMobility.getReporteLlamadasNoContestadas(pBeanLlamadas, ssf);
			
			strJson1.append("{\"ReporteLlamadas\" : [");
			
			if(listLlamadasContestadas.size() > 0){
				for(BeanReporteLlamadas item : listLlamadasContestadas){
					strJson1.append("{" +
							"\"fechaInicio\" : \"" + item.getFechainicio() + "\" ," +
							"\"tiempoCola\" : \"" + item.getTiempocolan()+ "\" ," +
							"\"tiempoConversacion\" : \"" + item.getTiempoconversacion() + "\" ," +
							"\"agente\" : \"" + item.getAgente()+ "\" ," +
							"\"tipo\" : \"" + "Contestada"+ "\" " +
							"},"
							);
				}
			}

			if(listLlamadasNoContestadas.size() > 0){
				for(BeanReporteLlamadas item : listLlamadasNoContestadas){
					strJson1.append("{" +
							"\"fechaInicio\" : \"" + item.getFechainicio() + "\" ," +
							"\"tiempoCola\" : \"" + item.getTiempocolan() + "\" ," +
							"\"tiempoConversacion\" : \"" + "" + "\" ," +
							"\"agente\" : \"" + ""+ "\" ," +
							"\"tipo\" : \"" + item.getTipollamada() + "\" " +
							"},"
							);
				}
			}
			else {
				strJson1.append(",");
			}

			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
			simbolos.setDecimalSeparator('.');
			
			List<BeanSlaMDA> listSlaDiario = null;
			BeanSlaMDA slaMensual = null;
			BeanSlaMDA pBeanSla = new BeanSlaMDA();
			pBeanSla.setIdProyecto(11);
			pBeanSla.setStrFechaSla(strFecha);

			listSlaDiario = objBusinessMaximoMobility.getSlaMDADiario(pBeanSla, ssf);


			List<BeanSlaMDA> listaTR = new ArrayList<BeanSlaMDA>();
			listaTR = objBusinessMaximoMobility.getTasaResolucionDiario(pBeanSla, ssf);
			
			strJson1 = new StringBuilder();
			strJson1.append("\"ReporteSlaDiario\" : [");
			new AppUtils();
			new AppUtils();
			//GENERA CONTENIDO JSON
			
			
			if(listSlaDiario.size() > 0){
				for(BeanSlaMDA item : listSlaDiario){
					
					String strTasaResolucion = "0";
					for(BeanSlaMDA item2 :listaTR) {
						
						String fecha1 = new SimpleDateFormat("yyyy-MM-dd").format(item.getFechaSla());
						String fecha2 = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd").parse(item2.getStrFechaSla()));
						if (fecha1.equals(fecha2) ){
							strTasaResolucion = (new DecimalFormat("##.##",simbolos).format(item2.getTasaResolucion() * 100.00 ));	break;
						}
						
					}
					
					strJson1.append("{" +
							"\"fecha\" : \"" + new SimpleDateFormat("dd-MM-yyyy").format(item.getFechaSla())  + "\" ," +
							"\"tasaAbandono\" : \"" + new DecimalFormat("##.##",simbolos).format(item.getTasAb())  + "\" ," +
							"\"tasaRespuesta\" : \"" + new DecimalFormat("##.##",simbolos).format(item.getTasResp() * 100.00) + "\" ," +
							"\"tiempoSolucion\" : \"" + new DecimalFormat("##.##",simbolos).format(item.getPromLlam() / 60.00) + "\" ," +
							"\"tasaResolucion\" : \"" + strTasaResolucion + "\" ," +
							"\"correoRecibido\" : \"" + item.getCorreoRecibido() + "\" " +
							"},"
							);
				}
			}
			else
				strJson1.append(",");
			
			
//			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");

			
			List<BeanTicketSRINC> listTickets = new ArrayList<BeanTicketSRINC>();
			BeanTicketSRINC pBean = new BeanTicketSRINC();
			pBean.setIdProyectoCisco(11);
			pBean.setFechaPeriodo(strFecha);

			listTickets = objBusinessMaximoMobility.getTicketSRINC(pBean, ssf);
			
//			System.out.println("Tamañp lista Tickets: "+objBusinessMaximoMobility.getTicketSRINC(pBean, ssf).size());
			strJson1 = new StringBuilder();
			strJson1.append("\"ReporteTickets\" : [");
			new AppUtils();
			new AppUtils();
			//GENERA CONTENIDO JSON
			
			if(listTickets.size() > 0){
				for(BeanTicketSRINC item : listTickets){
					
					new AppUtils();
					strJson1.append("{" +
							"\"TICKETID\" : \"" + item.getTicketid() + "\" ," +
							"\"STRCLASS\" : \"" + item.getStrclass() + "\" ," +
							"\"STATUS\" : \"" + item.getStatus() + "\" ," +
							"\"INTERNALPRIORITY\" : \"" + item.getInternalpriority() + "\" ," +
							"\"EXTERNALSYSTEM\" : \"" + item.getExternalsystem() + "\" ," +
							"\"IDCALLMNG\" : \"" + (item.getIdcallmng() == null ? "": item.getIdcallmng())+ "\" ," +
							"\"SERVICE\" : \"" +  (item.getService() == null ? "" : item.getService())+ "\" ," +
							"\"SERVICELINE\" : \"" + (item.getServiceline() == null ? "" : item.getServiceline() ) + "\" ," +
							"\"PLUSCUSTOMER\" : \"" + (item.getPluscustomer() == null ? "" : item.getPluscustomer()) + "\" ," +
							"\"NAMECLIENTE\" : \"" + (item.getNamecliente() == null ? "" : item.getNamecliente())  + "\" ," +
							"\"LOCATION\" : \"" + (item.getLocation() == null ? "": item.getLocation()) + "\" ," +
							"\"DESCRIPTIONLOCATION\" : \"" +  (item.getDescriptionlocation() == null ? "" : item.getDescriptionlocation() ) + "\" ," +
							"\"CREATIONDATE\" : \"" +  item.getCreationdate()+ "\" ," +
							"\"ITDCHCREATEDBYGROUP\" : \"" + (item.getItdchcreatedbygroup() == null ? "": item.getItdchcreatedbygroup()) + "\" ," +
							"\"EMAILCREATEDBY\" : \"" + (item.getEmailcreatedby() == null ? "" : item.getEmailcreatedby()) + "\" ," +
							"\"NAMECREATEDBY\" : \"" + (item.getNamecreatedby() == null ? "" : item.getNamecreatedby()) + "\" ," +
							"\"EMAILREPORTEDBY\" : \"" + (item.getEmailreportedby() == null ? "" : item.getEmailreportedby()) + "\" ," +
							"\"NAMEREPORTEDBY\" : \"" + (item.getNamereportedby() == null ? "" : item.getNamereportedby()) + "\" ," +
							"\"EMAILAFFECTEDPERSON\" : \"" + (item.getEmailaffectedperson() == null ? "" : item.getEmailaffectedperson()) + "\" ," +
							"\"NAMEAFFECTEDPERSON\" : \"" + (item.getNameaffectedperson() == null ? "" : item.getNameaffectedperson()) + "\" ," +
							"\"OWNERGROUP\" : \"" + (item.getOwnergroup() == null ? "": item.getOwnergroup()) + "\" ," +
							"\"ITDRESOLVERGROUP\" : \"" + (item.getItdresolvergroup() == null ? "" : item.getItdresolvergroup()) + "\" ," +
							"\"EMAILOWNER\" : \"" + (item.getEmailowner() == null ? "" : item.getEmailowner()) + "\" ," +
							"\"NAMEOWNER\" : \"" + (item.getNameowner() == null ? "" : item.getNameowner()) + "\" ," +
							"\"FINISHDATE\" : \"" + (item.getFinishdate() == null ? "" : item.getFinishdate())  + "\" ," +
							"\"CLASSIFICATIONID\" : \"" + (item.getClassificationid() == null ? "" : item.getClassstructureid())  + "\" ," +
							"\"CLASSSTRUCTUREID\" : \"" + (item.getClassstructureid() == null ? "" : item.getClassstructureid()) + "\" ," +
							"\"CLASSIFICATIONLEVEL1\" : \"" + (item.getClassificationlevel1() == null ? "" : item.getClassificationlevel1()) + "\" ," +
							"\"CLASSIFICATIONLEVEL2\" : \"" + (item.getClassificationlevel2() == null ? "" : item.getClassificationlevel2()) + "\" ," +
							"\"CLASSIFICATIONLEVEL3\" : \"" + (item.getClassificationlevel3() == null ? "" : item.getClassificationlevel3()) + "\" ," +
							"\"CLASSIFICATIONLEVEL4\" : \"" +  (item.getClassificationlevel4() == null ? "" : item.getClassificationlevel4() == null) + "\" ," +
							"\"CINUM\" : \"" + (item.getCinum() == null ? "":item.getCinum()) + "\" ," +
							"\"FCR\" : \"" + (item.getFcr() == null ? "":item.getFcr()) + "\" ," +
							"\"ISGLOBAL\" : \"" + item.getIsglobal() + "\" ," +
							"\"GLOBALTICKETCLASS\" : \"" +  (item.getGlobalticketclass() == null ? "": item.getGlobalticketclass())+ "\" ," +
							"\"GLOBALTICKETID\" : \"" +  (item.getGlobalticketid() == null ? "": item.getGlobalticketid())+ "\" ," +
							"\"ITDCLOSURECODE\" : \"" + (item.getItdclosurecode() == null ? "" : item.getItdclosurecode()) + "\" ," +
							"\"ITDMAJORINCIDENT\" : \"" + (item.getItdmajorincident() == null ? "": item.getItdmajorincident()) + "\" ," +
							"\"ORIGRECORDCLASS\" : \"" +  (item.getOrigrecordclass() == null ? "": item.getOrigrecordclass() ) + "\" ," +
							"\"ORIGRECORDID\" : \"" + (item.getOrigrecordid() == null ? "": item.getOrigrecordid()) + "\" ," +
							"\"RELATEDTOGLOBAL\" : \"" + (item.getRelatedtoglobal() == null ? "" : item.getRelatedtoglobal()) + "\" ," +
							"\"DESCRIPTION\" : \"" + (AppUtils.cleanString(item.getDescription())== null ? "": AppUtils.cleanString(item.getDescription())) + "\" ," +
							"\"DETAIL\" : \"" + (AppUtils.cleanString(item.getDetail())==null ? "" : AppUtils.cleanString(item.getDetail())) + "\" " +
							"},"
							);
				}
			}
			else
				strJson1.append(",");
			
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
//			
			
			
		}catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}

	public void getResultadoSlaMDA(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		String strFecha = req.getParameter("ptxtPeriodo") + "-01";
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			DecimalFormatSymbols simbolos = new DecimalFormatSymbols();
			simbolos.setDecimalSeparator('.');
			
			//JSON Tasa de Abandono MENSUAL
			BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
			List<BeanSlaMDA> listSlaDiario = null;
			BeanSlaMDA slaMensual = null;
			BeanSlaMDA pBeanSla = new BeanSlaMDA();
			pBeanSla.setIdProyecto(11);
			pBeanSla.setStrFechaSla(strFecha);
			
			//Obtener resultado de SLA Diario
			listSlaDiario = objBusinessMaximoMobility.getSlaMDADiario(pBeanSla, ssf);
			System.out.println("INICIO SlaTasaAbandonoDiario");
			//JSON Tasa de Abandono Diario
			strJson1.append("{\"SlaTasaAbandonoDiario\" : [");
			strJson1.append("{\"labels\": [");
			if(listSlaDiario.size() > 0){
				for(BeanSlaMDA item : listSlaDiario){
				strJson1.append("\"" + new SimpleDateFormat("yyyy-MM-dd").format(item.getFechaSla())  +"\",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"datasets\": [");
			strJson1.append("{\"label\": \"SLA Mensual (%) \",\"fill\": false,\"backgroundColor\": \"#0096d2\",\"borderColor\": \"#0096d2\",\"data\": [");
			
			if(listSlaDiario.size() > 0){
				for(BeanSlaMDA item : listSlaDiario){
					strJson1.append(10+ ",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
			
			
			strJson1 = new StringBuilder();
			strJson1.append("{\"label\": \"Resultado (%) \", \"fill\": false,\"backgroundColor\": \"#FACC2E\",\"borderColor\": \"#FACC2E\",\"data\": [");
			
			if(listSlaDiario.size() > 0){
				for(BeanSlaMDA item : listSlaDiario){
					strJson1.append(new DecimalFormat("##.##",simbolos).format(item.getTasAb())+ ",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}],");
			
			System.out.println("INICIO SlaTasaAbandonoMensual");
			//JSON Tasa de Abandono MENSUAL
			Date fechaActual = new SimpleDateFormat("yyyy-MM-dd").parse(strFecha);
			Calendar nuevaFecha = Calendar.getInstance();
			nuevaFecha.clear();
			nuevaFecha.setTime(fechaActual);
			nuevaFecha.add(Calendar.MONTH, -1);
			Date fechaAnterior = nuevaFecha.getTime();

			strJson1 = new StringBuilder();
			strJson1.append("\"SlaTasaAbandonoMensual\" : [");
			BeanSlaMDA resultBeanSlaActual = new BeanSlaMDA();
			BeanSlaMDA resultBeanSlaAnterior = new BeanSlaMDA();
			resultBeanSlaActual = objBusinessMaximoMobility.getSlaMDAMensual(pBeanSla, ssf);
			pBeanSla.setStrFechaSla(new SimpleDateFormat("yyyy-MM-dd").format(fechaAnterior));
			resultBeanSlaAnterior = objBusinessMaximoMobility.getSlaMDAMensual(pBeanSla, ssf);
			new AppUtils();
			new AppUtils();
			new AppUtils();
			//GENERA CONTENIDO JSON
			strJson1.append("{" +
					"\"slaTasaAbandonoMesActual\" : \"" + new DecimalFormat("##.##",simbolos).format(resultBeanSlaActual.getTasAb()) + "\" ," +
					"\"strMesActual\" : \"" + AppUtils.formatoMes(new SimpleDateFormat("MM").format(fechaActual)) +" "+new SimpleDateFormat("yyyy").format(fechaActual)+ "\" ," +
					"\"slaTasaColorMesActual\" : \"" + resultBeanSlaActual.getIdColor() + "\" ," +
					"\"slaTasaAbandonoMesAnterior\" : \"" + new DecimalFormat("##.##",simbolos).format(resultBeanSlaAnterior.getTasAb())+ "\" ," +
					"\"strMesAnterior\" : \"" + AppUtils.formatoMes(new SimpleDateFormat("MM").format(fechaAnterior)) +" "+new SimpleDateFormat("yyyy").format(fechaAnterior)+ "\" ," +
					"\"slaTasaColorMesAnterior\" : \"" + resultBeanSlaAnterior.getIdColor()+ "\" " +
					"},"
					);
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
		
			System.out.println("INICIO SlaTasaRespuestaDiario");
			//JSON SLA TASA RESPUESTA DIARIO
			strJson1 = new StringBuilder();
			strJson1.append("\"SlaTasaRespuestaDiario\" : [");
			strJson1.append("{\"labels\": [");
			if(listSlaDiario.size() > 0){
				for(BeanSlaMDA item : listSlaDiario){
				strJson1.append("\"" + new SimpleDateFormat("yyyy-MM-dd").format(item.getFechaSla())  +"\",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"datasets\": [");
			strJson1.append("{\"label\": \"SLA Mensual (%) \",\"fill\": false,\"backgroundColor\": \"#0096d2\",\"borderColor\": \"#0096d2\",\"data\": [");
			if(listSlaDiario.size() > 0){
				for(BeanSlaMDA item : listSlaDiario){
					strJson1.append(80+ ",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
			
			strJson1 = new StringBuilder();
			
			strJson1.append("{\"label\": \"Resultado (%) \", \"fill\": false,\"backgroundColor\": \"#FACC2E\",\"borderColor\": \"#FACC2E\",\"data\": [");
			
			
			if(listSlaDiario.size() > 0){
				for(BeanSlaMDA item : listSlaDiario){
					
					strJson1.append(new DecimalFormat("##.##",simbolos).format(item.getTasResp() * 100.00) + ",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}],");
			
			System.out.println("INICIO SlaTasaRespuestaMensual");
			
			//JSON SLA TASA RESPUESTA MENSUAL
			strJson1 = new StringBuilder();
			strJson1.append("\"SlaTasaRespuestaMensual\" : [");
			new AppUtils();
			new AppUtils();
			
			if( Double.parseDouble(new DecimalFormat("##.##",simbolos).format(resultBeanSlaActual.getTasResp() * 100.00)) < 80.00) {
				resultBeanSlaActual.setIdColor(2);	 // id color rojo fuera del sla
			}else if(Double.parseDouble(new DecimalFormat("##.##",simbolos).format(resultBeanSlaActual.getTasResp() * 100.00)) < 84.00 && Double.parseDouble(new DecimalFormat("##.##",simbolos).format(resultBeanSlaActual.getTasResp() * 100.00)) > 79.99) {
				resultBeanSlaActual.setIdColor(1);	// id color amarillo cerca al limite del sla
			}else {
				resultBeanSlaActual.setIdColor(0);	// id color verde dentro del sla
			}
			
			if(Double.parseDouble(new DecimalFormat("##.##",simbolos).format(resultBeanSlaAnterior.getTasResp() * 100.00)) < 80.00) {
				resultBeanSlaAnterior.setIdColor(2);	 // id color rojo fuera del sla
			}else if(Double.parseDouble(new DecimalFormat("##.##",simbolos).format(resultBeanSlaAnterior.getTasResp() * 100.00))  < 84.00 && Double.parseDouble(new DecimalFormat("##.##",simbolos).format(resultBeanSlaAnterior.getTasResp() * 100.00))  > 79.99) {
				resultBeanSlaAnterior.setIdColor(1);	// id color amarillo cerca al limite del sla
			}else {
				resultBeanSlaAnterior.setIdColor(0);	// id color verde dentro del sla
			}
			
			//GENERA CONTENIDO JSON
			strJson1.append("{" +
					"\"slaTasaRespuestaMesActual\" : \"" + new DecimalFormat("##.##",simbolos).format(resultBeanSlaActual.getTasResp() * 100.00) + "\" ," +
					"\"strMesActual\" : \"" + AppUtils.formatoMes(new SimpleDateFormat("MM").format(fechaActual)) +" "+new SimpleDateFormat("yyyy").format(fechaActual)+ "\" ," +
					"\"slaTasaColorMesActual\" : \"" + resultBeanSlaActual.getIdColor() + "\" ," +
					"\"slaTasaRespuestaMesAnterior\" : \"" +  new DecimalFormat("##.##",simbolos).format(resultBeanSlaAnterior.getTasResp() * 100.00)+ "\" ," +
					"\"strMesAnterior\" : \"" + AppUtils.formatoMes(new SimpleDateFormat("MM").format(fechaAnterior)) +" "+new SimpleDateFormat("yyyy").format(fechaAnterior)+ "\" ," +
					"\"slaTasaColorMesAnterior\" : \"" + resultBeanSlaAnterior.getIdColor()+ "\" " +
					"},"
					);
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			System.out.println("INICIO SlaTiempoConversacionDiario");
			//JSON SLA TIEMPO PROMEDIO DE LLAMADA DIARIO
			strJson1 = new StringBuilder();
			strJson1.append("\"SlaTiempoConversacionDiario\" : [");
			strJson1.append("{\"labels\": [");
			if(listSlaDiario.size() > 0){
				for(BeanSlaMDA item : listSlaDiario){
				strJson1.append("\"" + new SimpleDateFormat("yyyy-MM-dd").format(item.getFechaSla())  +"\",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"datasets\": [");
			strJson1.append("{\"label\": \"SLA Mensual (Min) \",\"fill\": false,\"backgroundColor\": \"#0096d2\",\"borderColor\": \"#0096d2\",\"data\": [");
			if(listSlaDiario.size() > 0){
				for(BeanSlaMDA item : listSlaDiario){
					strJson1.append(10+ ",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
			
			strJson1 = new StringBuilder();
			
			strJson1.append("{\"label\": \"Resultado (Min) \", \"fill\": false,\"backgroundColor\": \"#FACC2E\",\"borderColor\": \"#FACC2E\",\"data\": [");
			
			if(listSlaDiario.size() > 0){
				for(BeanSlaMDA item : listSlaDiario){
					strJson1.append(new DecimalFormat("##.##",simbolos).format(item.getPromLlam() / 60.00) + ",");
//					strJson1.append( (double)item.getPromLlam() / 60.00) + ",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}],");
			
			System.out.println("INICIO SlaTiempoConversacionMensual");
//			JSON SLA TIEMPO PROMEDIO DE LLAMADA MENSUAL
			strJson1 = new StringBuilder();
			strJson1.append("\"SlaTiempoConversacionMensual\" : [");
			new AppUtils();
			new AppUtils();
			
			double promLlamActual = ((double) resultBeanSlaActual.getPromLlam() / 60.00);
			
			if(Double.parseDouble(new DecimalFormat("##.##",simbolos).format(promLlamActual)) > 10.00) {
				resultBeanSlaActual.setIdColor(2);	 // id color rojo fuera del sla
			}else if(Double.parseDouble(new DecimalFormat("##.##",simbolos).format(promLlamActual)) <= 10.00 && Double.parseDouble(new DecimalFormat("##.##",simbolos).format(promLlamActual)) > 8.00) {
				resultBeanSlaActual.setIdColor(1);	// id color amarillo cerca al limite del sla
			}else {
				resultBeanSlaActual.setIdColor(0);	// id color verde dentro del sla
			}
			
			double promLlamAnterior = ((double) resultBeanSlaAnterior.getPromLlam() / 60.00);
			if(Double.parseDouble(new DecimalFormat("##.##",simbolos).format(promLlamAnterior)) > 10.00) {
				resultBeanSlaAnterior.setIdColor(2);	 // id color rojo fuera del sla
			}else if(Double.parseDouble(new DecimalFormat("##.##",simbolos).format(promLlamAnterior))  <= 10.00 && Double.parseDouble(new DecimalFormat("##.##",simbolos).format(promLlamAnterior))  > 8.00) {
				resultBeanSlaAnterior.setIdColor(1);	// id color amarillo cerca al limite del sla
			}else {
				resultBeanSlaAnterior.setIdColor(0);	// id color verde dentro del sla
			}
			//GENERA CONTENIDO JSON
			strJson1.append("{" +
					"\"slaTiempoConversacionMesActual\" : \"" + new AppUtils().convierteAformatoHHMMSS((double) resultBeanSlaActual.getPromLlam() / 60.00)+ "\" ," +
					"\"strMesActual\" : \"" + AppUtils.formatoMes(new SimpleDateFormat("MM").format(fechaActual)) +" "+new SimpleDateFormat("yyyy").format(fechaActual)+ "\" ," +
					"\"slaTasaColorMesActual\" : \"" + resultBeanSlaActual.getIdColor() + "\" ," +
					"\"slaTiempoConversacionMesAnterior\" : \"" + new AppUtils().convierteAformatoHHMMSS((double)resultBeanSlaAnterior.getPromLlam() / 60.00) + "\" ," +
					"\"strMesAnterior\" : \"" + AppUtils.formatoMes(new SimpleDateFormat("MM").format(fechaAnterior)) +" "+new SimpleDateFormat("yyyy").format(fechaAnterior)+ "\" ," +
					"\"slaTasaColorMesAnterior\" : \"" + resultBeanSlaAnterior.getIdColor()+ "\" " +
					"},"
					);
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			System.out.println("INICIO SlaTasaResolucionDiario");
			//JSON SLA TASA RESOLUCION DIARIO
			strJson1 = new StringBuilder();
			pBeanSla.setIdProyecto(11);
			pBeanSla.setStrFechaSla(strFecha);
			List<BeanSlaMDA> listaTR = new ArrayList<BeanSlaMDA>();
			listaTR = objBusinessMaximoMobility.getTasaResolucionDiario(pBeanSla, ssf);

			strJson1.append("\"SlaTasaResolucionDiario\" : [");
			strJson1.append("{\"labels\": [");
			if(listaTR.size() > 0){
				for(BeanSlaMDA item : listaTR){
				strJson1.append("\"" + new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd").parse(item.getStrFechaSla()))  +"\",");
				}                 
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"datasets\": [");
			strJson1.append("{\"label\": \"SLA Mensual (%) \",\"fill\": false,\"backgroundColor\": \"#0096d2\",\"borderColor\": \"#0096d2\",\"data\": [");
			if(listaTR.size() > 0){
				for(BeanSlaMDA item : listaTR){
					strJson1.append(85 + ",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
			
			strJson1 = new StringBuilder();
			
			strJson1.append("{\"label\": \"Resultado (%) \", \"fill\": false,\"backgroundColor\": \"#FACC2E\",\"borderColor\": \"#FACC2E\",\"data\": [");
			
			
			if(listaTR.size() > 0){
				for(BeanSlaMDA item : listaTR){
					
					strJson1.append(new DecimalFormat("##.##",simbolos).format(item.getTasaResolucion()* 100.00) + ",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}],");
			
			System.out.println("INICIO SlaTasaResolucionMensual");
//			JSON SLA TASA RESOLUCION  MENSUAL
			strJson1 = new StringBuilder();
			
			resultBeanSlaActual = objBusinessMaximoMobility.getTasaResolucionMensual(pBeanSla, ssf);
			
			if(Double.parseDouble(new DecimalFormat("##.##",simbolos).format(resultBeanSlaActual.getTasaResolucion() * 100.00)) < 85.00) {
				resultBeanSlaActual.setIdColor(2);	 // id color rojo fuera del sla
			}else if(Double.parseDouble(new DecimalFormat("##.##",simbolos).format(resultBeanSlaActual.getTasaResolucion() * 100.00)) > 84.99 && Double.parseDouble(new DecimalFormat("##.##",simbolos).format(resultBeanSlaActual.getTasaResolucion() * 100.00)) < 88.00) {
				resultBeanSlaActual.setIdColor(1);	// id color amarillo cerca al limite del sla
			}else {
				resultBeanSlaActual.setIdColor(0);	// id color verde dentro del sla
			}
			
			pBeanSla.setStrFechaSla(new SimpleDateFormat("yyyy-MM-dd").format(fechaAnterior));
			resultBeanSlaAnterior = objBusinessMaximoMobility.getTasaResolucionMensual(pBeanSla, ssf);
			
			if(Double.parseDouble(new DecimalFormat("##.##",simbolos).format(resultBeanSlaAnterior.getTasaResolucion() * 100.00)) < 85.00) {
				resultBeanSlaAnterior.setIdColor(2);	 // id color rojo fuera del sla
			}else if(Double.parseDouble(new DecimalFormat("##.##",simbolos).format(resultBeanSlaAnterior.getTasaResolucion() * 100.00)) > 84.99 && Double.parseDouble(new DecimalFormat("##.##",simbolos).format(resultBeanSlaAnterior.getTasaResolucion() * 100.00)) < 88.00) {
				resultBeanSlaAnterior.setIdColor(1);	// id color amarillo cerca al limite del sla
			}else {
				resultBeanSlaAnterior.setIdColor(0);	// id color verde dentro del sla
			}
			
			System.out.println("TICKETS TOTAL: " + resultBeanSlaActual.getTotalTicket()+"TICKETS RESUELTOS PRIMER NIVEL: " + resultBeanSlaActual.getTicketPrimerNivel() + "TICKETS RESUELTOS OTROS NIVEL: " + resultBeanSlaActual.getTicketOtroNivel() );
			System.out.println("TICKETS TOTAL: " + resultBeanSlaAnterior.getTotalTicket()+"TICKETS RESUELTOS PRIMER NIVEL: " + resultBeanSlaAnterior.getTicketPrimerNivel() + "TICKETS RESUELTOS OTROS NIVEL: " + resultBeanSlaAnterior.getTicketOtroNivel() );
			strJson1.append("\"SlaTasaResolucionMensual\" : [");
			new AppUtils();
			new AppUtils();
			//GENERA CONTENIDO JSON
			strJson1.append("{" +
					"\"slaTasaResolucionMesActual\" : \"" + new DecimalFormat("##.##",simbolos).format(resultBeanSlaActual.getTasaResolucion() * 100.00) + "\" ," +
					"\"strMesActual\" : \"" + AppUtils.formatoMes(new SimpleDateFormat("MM").format(fechaActual)) +" "+new SimpleDateFormat("yyyy").format(fechaActual)+ "\" ," +
					"\"slaTasaColorMesActual\" : \"" + resultBeanSlaActual.getIdColor() + "\" ," +
					"\"slaTasaResolucionMesAnterior\" : \"" +  new DecimalFormat("##.##",simbolos).format(resultBeanSlaAnterior.getTasaResolucion()* 100.00)+ "\" ," +
					"\"strMesAnterior\" : \"" + AppUtils.formatoMes(new SimpleDateFormat("MM").format(fechaAnterior)) +" "+new SimpleDateFormat("yyyy").format(fechaAnterior)+ "\", " +
					"\"slaTasaColorMesAnterior\" : \"" + resultBeanSlaAnterior.getIdColor()+ "\" " +
					"},"
					);
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");			
			
		}catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}

	private void getBackLogWO(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		StringBuilder strJson3 = new StringBuilder();
		
		try {
			
			BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
			List<BeanMaximo> listMaximo = null;
			BeanParameters objBeanParameters = new BeanParameters();
			
			
			String strCliente = req.getParameter("strCliente");

			if(strCliente.equals("ALL")) {
				objBeanParameters.setStrValor1(null);
			}else {
				objBeanParameters.setStrValor1(strCliente);
			}

			//CONSULTAR SOLICITUD
			listMaximo = objBusinessMaximoMobility.getTableBackLogWO(objBeanParameters, ssf);

			//GENERA APERTURA JSON
			
			strJson1.append("{\"backlogWO\" : [");
			
			//Armar JSON con data de valores totales
			strJson1.append("{\"datasets\": [{\"data\": [");
			
			if(listMaximo.size() > 0){
				for(BeanMaximo bean : listMaximo){
					strJson1.append(bean.getiCantidad()+ ",");
				}
			}
			else {
				strJson1.append(",");
			}
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			//Armar JSON con colores
			strJson1 = new StringBuilder();
			strJson1.append("\"backgroundColor\": [");
			int count = 1;
			if(listMaximo.size() > 0){
				for(int i=0; i<listMaximo.size(); i++){
					switch (count) {
					case 1: strJson1.append("\"#7986CB\","); count++; break;
					case 2: strJson1.append("\"#EC407A\","); count++; break;
					case 3: strJson1.append("\"#AB47BC\","); count++; break;
					case 4: strJson1.append("\"#42A5F5\","); count++; break;
					case 5: strJson1.append("\"#009688\","); count++; break;
					case 6: strJson1.append("\"#CDDC39\","); count = 1; break;
					}
				}
			}else {
				strJson1.append(",");
			}
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}],");
			
			//Armar JSON con labels
			strJson1 = new StringBuilder();
			strJson1.append("\"labels\":[");
			if(listMaximo.size() > 0){
				for(BeanMaximo bean : listMaximo){
						strJson1.append("\"" + bean.getTicketGrupoPropietario()+ "\",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}],");
			strJson3 = strJson2;
			
			//Armar JSON tabla backlog
			strJson1 = new StringBuilder();
			strJson2 = new StringBuilder();
			strJson1.append("\"tblBacklogWO\": [");
			
			if(listMaximo.size() > 0) { //SE ENCONTRARON REGISTROS
					
					for(BeanMaximo bean : listMaximo) {
					
						//GENERA CONTENIDO JSON
						strJson1.append("{" +
								"\"ticketGrupoPropietario\" : \"" + bean.getTicketGrupoPropietario() + "\" ," +
								"\"strValor1\" : \"" + bean.getStrValor1()+ "\" ," +
								"\"strValor2\" : \"" + bean.getStrValor2() + "\" ," +
								"\"strValor3\" : \"" + bean.getStrValor3() + "\" ," +
								"\"strValor4\" : \"" + bean.getStrValor4() + "\" ," +
								"\"strValor5\" : \"" + bean.getStrValor5() + "\" ," +
								"\"strValor6\" : \"" + bean.getStrValor6() + "\" ," +
								"\"strValor7\" : \"" + bean.getStrValor7() + "\" ," +
								"\"strValor8\" : \"" + bean.getStrValor8() + "\" ," +
								"\"strValor9\" : \"" + bean.getStrValor9() + "\" ," +
								"\"strValor10\" : \"" + bean.getStrValor10() + "\" " +
								"},"
								);
					}

			}else{// NO SE ENCONTRARON REGISTROS
				
						//GENERA CONTENIDO JSON
						strJson1.append("{" +
								"\"ticketGrupoPropietario\" : \"" + 0 + "\" ," +
								"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
								"},"
								);	
			}
			
			// GENERA CIERRE JSON
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "],");
			strJson3.append(strJson2.substring(0, strJson2.length() - 1) + "}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			strJson1 = new StringBuilder();
			//Generar JSON
			strJson1.append("{\"tblBacklogWO\": [");
		
			strJson1.append("{" +
						"\"ticketGrupoPropietario\" : \"" + 0 + "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);			
			
			strJson3.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			
		}
		
		out.print(strJson3);
	}

	public void getMaximoTicketsBackLogWO(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		StringBuilder strJson3 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			//Captura de parametros
			String strCliente = req.getParameter("strCliente");
			String strEstado = req.getParameter("strEstado");
			String strNombreGrupoResolutor = req.getParameter("strNombreGrupoResolutor");

			BeanParameters objBeanParameters = new BeanParameters();

			if(strCliente.equals("ALL")) {
				objBeanParameters.setStrValor1(null);
			}else {
				objBeanParameters.setStrValor1(strCliente);
			}
			
			if(strEstado.equals("ALL")){
				objBeanParameters.setStrValor2(null);
			}else {
				objBeanParameters.setStrValor2(strEstado);
			}
			
			if(strEstado.equals("ALL")){
				objBeanParameters.setStrValor3(null);
			}else {
				objBeanParameters.setStrValor3(strNombreGrupoResolutor);
			}
			
			//Generación de consulta de Tickets Backlog WO
			
			BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
			List<BeanMaximoWorkOrder> listMaximoWO = null;
			listMaximoWO = objBusinessMaximoMobility.getMaximoTicketBackLogWO(objBeanParameters, ssf);
			
			strJson1.append("{\"ticketsReporte\" : [");			
			
				if(listMaximoWO.size() > 0){
					for(BeanMaximoWorkOrder item : listMaximoWO){
						strJson1.append("{");
						strJson1.append("\"idTicketWO\" : \"" + item.getIdWorkOrder() + "\",");
						strJson1.append("\"ticketWOSRRelacionado\" : \"" + item.getTicketWOSRRelacionado() + "\",");
						strJson1.append("\"ticketWOPrincipal\" : \"" + item.getTicketWOPrincipal() + "\",");
						strJson1.append("\"ticketWORelacionada\" : \"" + item.getTicketWORelacionada() + "\",");
						strJson1.append("\"ticketWOTarea\" : \"" + item.getTicketWOTarea()+ "\",");
						strJson1.append("\"ticketWODuracion\" : \"" + item.getTicketWODuracion() + "\",");
						strJson1.append("\"ticketWODescripcion\" : \"" + AppUtils.cleanString(item.getTicketWODescripcion()) + "\",");
						strJson1.append("\"ticketWOCliente\" : \"" + item.getTicketWOCliente() + "\",");
						strJson1.append("\"ticketWOEstado\" : \"" + item.getTicketWOEstado() + "\",");
						strJson1.append("\"ticketWOPrioridad\" : \"" + item.getTicketWOPrioridad() + "\",");
						strJson1.append("\"ticketWOFechaInicio\" : \"" + (item.getTicketWOFechaInicio() == null ? "" :  new SimpleDateFormat("dd/MM/yyyy HH:mm").format(item.getTicketWOFechaInicio()))+ "\",");
						strJson1.append("\"ticketWOCI\" : \"" + item.getTicketWOCI() + "\",");
						strJson1.append("\"ticketWOGrupoResolutor\" : \"" + item.getTicketWOGrupoResolutor()+ "\",");
						strJson1.append("\"ticketWONombreGResolutor\" : \"" + item.getTicketWONombreGResolutor() + "\",");
						strJson1.append("\"ticketWOPropietario\" : \"" + item.getTicketWOPropietario() + "\",");
						strJson1.append("\"ticketWOFechaReportada\" : \"" + ( item.getTicketWOFechaReportada() == null ? "" : new SimpleDateFormat("dd/MM/yyyy HH:mm").format(item.getTicketWOFechaReportada())) + "\",");
						strJson1.append("\"ticketWOReportadoPor\" : \"" + item.getTicketWOReportadoPor()+ "\",");
						strJson1.append("\"ticketWOUsuarioAfectado\" : \"" + item.getTicketWOUsuarioAfectado()+ "\",");
						strJson1.append("\"ticketWOFechaFin\" : \"" + (item.getTicketWOFechaFin() == null ? "" : new SimpleDateFormat("dd/MM/yyyy HH:mm").format(item.getTicketWOFechaFin())) + "\",");
						strJson1.append("\"ticketWODiasBacklog\" : \"" + (item.getTicketWODiasBacklog() == null ? "" : item.getTicketWODiasBacklog())+ "\",");
						strJson1.append("\"ticketWORangoBancklog\" : \"" + item.getTicketWORangoBancklog() + "\"");
						strJson1.append("},");
					}
				} else {
					strJson1.append(",");
					}
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
			
		}
		catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}
	
	public void getMaximoTicketsBackLogWOTareas(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			//Captura de parametros
			String strCliente = req.getParameter("strCliente");
			String strEstado = req.getParameter("strEstado");
			String strDescripcionWOPrincipal = req.getParameter("strDescripcionWOPrincipal");

			BeanParameters objBeanParameters = new BeanParameters();

			if(strCliente.equals("ALL")) {
				objBeanParameters.setStrValor1(null);
			}else {
				objBeanParameters.setStrValor1(strCliente);
			}
			
			if(strEstado.equals("ALL")){
				objBeanParameters.setStrValor2(null);
			}else {
				objBeanParameters.setStrValor2(strEstado);
			}
			
			if(strDescripcionWOPrincipal.equals("ALL")){
				objBeanParameters.setStrValor3(null);
			}else {
				objBeanParameters.setStrValor3(strDescripcionWOPrincipal);
			}
			
			//Generación de consulta de Tickets Backlog WO
			
			BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
			List<BeanMaximoWorkOrder> listMaximoWO = null;
			listMaximoWO = objBusinessMaximoMobility.getMaximoTicketBackLogWOTareas(objBeanParameters, ssf);
			
			strJson1.append("{\"ticketsReporte\" : [");			
			
				if(listMaximoWO.size() > 0){
					for(BeanMaximoWorkOrder item : listMaximoWO){
						strJson1.append("{");
						strJson1.append("\"idTicketWO\" : \"" + item.getIdWorkOrder() + "\",");
						strJson1.append("\"ticketWOSRRelacionado\" : \"" + item.getTicketWOSRRelacionado() + "\",");
						strJson1.append("\"ticketWOPrincipal\" : \"" + item.getTicketWOPrincipal() + "\",");
						strJson1.append("\"ticketWODescripcionWOPrincipal\" : \"" + AppUtils.cleanString(item.getTicketWODescripcion()) + "\",");
						strJson1.append("\"ticketWOTarea\" : \"" + item.getTicketWOTarea()+ "\",");
						strJson1.append("\"ticketWORelacionada\" : \"" + item.getTicketWORelacionada() + "\",");
						strJson1.append("\"ticketWODescripcionWORelacionada\" : \"" + AppUtils.cleanString(item.getTicketWODescripcion1()) + "\",");
						strJson1.append("\"ticketWOFechaReportada\" : \"" + ( item.getTicketWOFechaReportada() == null ? "" : new SimpleDateFormat("dd/MM/yyyy HH:mm").format(item.getTicketWOFechaReportada())) + "\",");
						strJson1.append("\"ticketWOGrupoResolutor\" : \"" + item.getTicketWOGrupoResolutor()+ "\",");
						strJson1.append("\"ticketWONombreGResolutor\" : \"" + item.getTicketWONombreGResolutor() + "\",");
						strJson1.append("\"ticketWOPropietario\" : \"" + item.getTicketWOPropietario() + "\",");
						strJson1.append("\"ticketWODuracion\" : \"" + item.getTicketWODuracion() + "\",");
						strJson1.append("\"ticketWOCliente\" : \"" + item.getTicketWOCliente() + "\",");
						strJson1.append("\"ticketWOEstado\" : \"" + item.getTicketWOEstado() + "\",");
						strJson1.append("\"ticketWOPrioridad\" : \"" + item.getTicketWOPrioridad() + "\",");
						strJson1.append("\"ticketWOFechaInicio\" : \"" + (item.getTicketWOFechaInicio() == null ? "" :  new SimpleDateFormat("dd/MM/yyyy HH:mm").format(item.getTicketWOFechaInicio()))+ "\",");
						strJson1.append("\"ticketWOCI\" : \"" + item.getTicketWOCI() + "\",");
						strJson1.append("\"ticketWOReportadoPor\" : \"" + item.getTicketWOReportadoPor()+ "\",");
						strJson1.append("\"ticketWOUsuarioAfectado\" : \"" + item.getTicketWOUsuarioAfectado()+ "\",");
						strJson1.append("\"ticketWOFechaFin\" : \"" + (item.getTicketWOFechaFin() == null ? "" : new SimpleDateFormat("dd/MM/yyyy HH:mm").format(item.getTicketWOFechaFin())) + "\",");
						strJson1.append("\"ticketWODiasBacklog\" : \"" + (item.getTicketWODiasBacklog() == null ? "" : item.getTicketWODiasBacklog())+ "\",");
						strJson1.append("\"ticketWORangoBancklog\" : \"" + item.getTicketWORangoBancklog() + "\"");
						strJson1.append("},");
					}
				} else {
					strJson1.append(",");
					}
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
			
		}
		catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	public void getTiempoSolucion(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
			List<BeanMaximo> listMaximo = null;
			
			String strPeriodoInicio = req.getParameter("ptxtInicio");
			String strPeriodoFin = req.getParameter("ptxtFin");
			String strClientes = req.getParameter("pcboClientes");
			String strTipo = req.getParameter("ptipo") == null ? "" : req.getParameter("ptipo");
			String strClient = req.getParameter("strClient") == null ? "" : req.getParameter("strClient");
			
			BusinessOptions objBusinessOption = new BusinessOptions();
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrValor1(strClientes);
			objBeanParameters.setStrdate1(strPeriodoInicio);
			objBeanParameters.setStrdate2(strPeriodoFin);
			
			if(strClientes.equals("ALL")) {
				objBeanParameters.setStrValor1(null);
				objBeanParameters.setStrValor2(objBeanSession.getObjBeanPersonal().getStrCodCliente());
			}else{
				objBeanParameters.setStrValor1(strClientes);
				objBeanParameters.setStrValor2(null);
			}
			
			listMaximo = objBusinessMaximoMobility.getTiempoSolucion(objBeanParameters, ssf);
			strJson1.append("{\"tiempoSolucion\" : [");
			strJson1.append("{\"datasets\": [{\"data\": [");
			if(listMaximo != null && listMaximo.size() > 0){
				if(listMaximo.get(0) != null){
					for(BeanMaximo item : listMaximo){
						strJson1.append(item.getiValor1() + ",");
					}
				}
				else
					strJson1.append(",");
					strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			}
			else{
				strJson1.append(",");
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			}
			
			
			strJson1 = new StringBuilder();
			strJson1.append("\"backgroundColor\": [");
			int count = 1;
			if(listMaximo != null && listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					switch (count) {
					case 1: strJson1.append("\"#7986CB\","); count++; break;
					case 2: strJson1.append("\"#EC407A\","); count++; break;
					case 3: strJson1.append("\"#AB47BC\","); count++; break;
					case 4: strJson1.append("\"#42A5F5\","); count++; break;
					case 5: strJson1.append("\"#009688\","); count++; break;
					case 6: strJson1.append("\"#CDDC39\","); count = 1; break;
					}
				}
			}
			else
				strJson1.append(",");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"labels\":[");
			if(listMaximo != null && listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					strJson1.append("\"" + 
							(objBusinessOption.listOptions3(new BeanParameters(item.getTicketIdGrupoResolutor(),"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).size() > 0 ? objBusinessOption.listOptions3(new BeanParameters(item.getTicketIdGrupoResolutor(),"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).get(0).getStrDescripcion() : item.getTicketIdGrupoResolutor()) +
							" [" + item.getStrValor1() + "]\",");
				}
			}
			else {
				strJson1.append(",");
			}
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}");
		}
		catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}
	
	public void getTicketsResueltos(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
			List<BeanMaximo> listMaximo = null;
			
			String strPeriodoInicio = req.getParameter("ptxtInicio");
			String strPeriodoFin = req.getParameter("ptxtFin");
			String strClientes = req.getParameter("pcboClientes");
			String strClient = req.getParameter("strClient") == null ? "" : req.getParameter("strClient");

			BusinessOptions objBusinessOption = new BusinessOptions();
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrValor1(strClientes);
			objBeanParameters.setStrdate1(strPeriodoInicio);
			objBeanParameters.setStrdate2(strPeriodoFin);
			
			if(strClientes.equals("ALL")) {
				objBeanParameters.setStrValor1(null);
//				objBeanParameters.setStrValor2(strClient);
				objBeanParameters.setStrValor2(objBeanSession.getObjBeanPersonal().getStrCodCliente());
			}else{
				objBeanParameters.setStrValor1(strClientes);
				objBeanParameters.setStrValor2(null);
			}
			
			listMaximo = objBusinessMaximoMobility.getTicketsResueltos(objBeanParameters, ssf);
			
			strJson1.append("{\"ticketsResueltos\" : [");
			strJson1.append("{\"labels\": [");
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					strJson1.append("\"" +
							(objBusinessOption.listOptions3(new BeanParameters(item.getTicketIdGrupoResolutor(),"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).size() > 0 ? objBusinessOption.listOptions3(new BeanParameters(item.getTicketIdGrupoResolutor(),"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).get(0).getStrDescripcion() : item.getTicketIdGrupoResolutor()) +
							"\",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"datasets\": [");
			strJson1.append("{\"label\": \"Requerimiento\",\"backgroundColor\": \"#00897B\",\"data\": [");
			
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					strJson1.append(item.getiValor1() + ",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
			
			strJson1 = new StringBuilder();
			strJson1.append("{\"label\": \"Incidencia\",\"backgroundColor\": \"#FFEA00\",\"data\": [");
			
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					strJson1.append(item.getiValor2() + ",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}]}");
			
		}
		catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}
	
	public void getTicketsResueltosFechas(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
			List<BeanMaximo> listMaximo = null;
			
			String strPeriodoInicio = req.getParameter("ptxtInicio");
			String strPeriodoFin = req.getParameter("ptxtFin");
			String strClientes = req.getParameter("pcboClientes");
			String strTipo = req.getParameter("ptipo").equals("0") ? null : req.getParameter("ptipo");
			String strClient = req.getParameter("strClient") == null ? "" : req.getParameter("strClient");
			
			BusinessOptions objBusinessOption = new BusinessOptions();
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrValor1(strClientes);
			objBeanParameters.setStrdate1(strPeriodoInicio);
			objBeanParameters.setStrdate2(strPeriodoFin);
			objBeanParameters.setStrValor2(strTipo != null ? objBusinessOption.listOptions4(new BeanParameters(strTipo,"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).size() > 0 ? objBusinessOption.listOptions4(new BeanParameters(strTipo,"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).get(0).getStrValor1() : strTipo : null);
			
			if(strClientes.equals("ALL")) {
				objBeanParameters.setStrValor1(null);
//				objBeanParameters.setStrValor3(strClient);
				objBeanParameters.setStrValor3(objBeanSession.getObjBeanPersonal().getStrCodCliente());
			}else{
				objBeanParameters.setStrValor1(strClientes);
				objBeanParameters.setStrValor3(null);
			}
			
			listMaximo = objBusinessMaximoMobility.getTicketsResueltosFechas(objBeanParameters, ssf);
			
			strJson1.append("{\"ticketFechas\" : [");
			strJson1.append("{\"labels\": [");
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
						strJson1.append("\"" + item.getStrValor1() + "\",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"datasets\": [");
			strJson1.append("{\"label\": \"Requerimiento\",\"fill\": false,\"backgroundColor\": \"#00897B\",\"borderColor\": \"#00897B\",\"data\": [");
			
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
						strJson1.append(item.getiValor2() + ",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
			
			strJson1 = new StringBuilder();
			strJson1.append("{\"label\": \"Incidencia\",\"fill\": false,\"backgroundColor\": \"#FFEA00\",\"borderColor\": \"#FFEA00\",\"data\": [");
			
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
						strJson1.append(item.getiValor1() + ",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}]}");
		}
		catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}
	
	public void getTicketsResueltosEstados(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
			List<BeanMaximo> listMaximo = null;
			
			String strPeriodoInicio = req.getParameter("ptxtInicio");
			String strPeriodoFin = req.getParameter("ptxtFin");
			String strClientes = req.getParameter("pcboClientes");
			String strTipo = req.getParameter("ptipo").equals("0")? null : req.getParameter("ptipo");
			String strClient = req.getParameter("strClient") == null ? "" : req.getParameter("strClient");
			
			BusinessOptions objBusinessOption = new BusinessOptions();
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrValor1(strClientes);
			objBeanParameters.setStrdate1(strPeriodoInicio);
			objBeanParameters.setStrdate2(strPeriodoFin);
			objBeanParameters.setStrValor2(strTipo != null ? objBusinessOption.listOptions4(new BeanParameters(strTipo,"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).size() > 0 ? objBusinessOption.listOptions4(new BeanParameters(strTipo,"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).get(0).getStrValor1() : strTipo : null);
			
			if(strClientes.equals("ALL")) {
				objBeanParameters.setStrValor1(null);
//				objBeanParameters.setStrValor3(strClient);
				objBeanParameters.setStrValor3(objBeanSession.getObjBeanPersonal().getStrCodCliente());
			}else{
				objBeanParameters.setStrValor1(strClientes);
				objBeanParameters.setStrValor3(null);
			}
			
			listMaximo = objBusinessMaximoMobility.getTicketsResueltosEstados(objBeanParameters, ssf);
			int iSr = 0;
			int iInc = 0;
			
			strJson1.append("{\"estadoServicio\" : [");
			strJson1.append("{\"datasets\": [{\"data\": [");
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					if(item.getTicketClass().toUpperCase().equals("SR"))
						strJson1.append(item.getiCantidad() + ",");
				}
				if(!strJson1.substring(strJson1.length() -1, strJson1.length()).equals(","))
					strJson1.append(",");
			}
			else {
				strJson1.append(",");
			}
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"backgroundColor\": [");
			int count = 1;
			
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					if(item.getTicketClass().toUpperCase().equals("SR"))
						
						switch (count) {
							case 1: strJson1.append("\"#7986CB\","); count++; break;
							case 2: strJson1.append("\"#EC407A\","); count++; break;
							case 3: strJson1.append("\"#AB47BC\","); count++; break;
							case 4: strJson1.append("\"#42A5F5\","); count++; break;
							case 5: strJson1.append("\"#009688\","); count++; break;
							case 6: strJson1.append("\"#CDDC39\","); count = 1; break;
						}
				}
				if(!strJson1.substring(strJson1.length() -1, strJson1.length()).equals(","))
					strJson1.append(",");
			}
			else {
				strJson1.append(",");
			}
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}],");

			strJson1 = new StringBuilder();
			strJson1.append("\"labels\":[");
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					if(item.getTicketClass().toUpperCase().equals("SR"))
						strJson1.append("\"" + 
						(objBusinessOption.listOptions3(new BeanParameters(item.getTicketIdEstado(),"ESTADOMAXIMO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).size() > 0 ? objBusinessOption.listOptions3(new BeanParameters(item.getTicketIdEstado(),"ESTADOMAXIMO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).get(0).getStrDescripcion() : item.getTicketIdEstado()) +
						"\",");
				}
				if(!strJson1.substring(strJson1.length() -1, strJson1.length()).equals(","))
					strJson1.append(",");
			}
			else {
				strJson1.append(",");
			}
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"estadoIncidencia\" : [");
			strJson1.append("{\"datasets\": [{\"data\": [");
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					if(item.getTicketClass().toUpperCase().equals("INCIDENT"))
						strJson1.append(item.getiCantidad() + ",");
				}
			}
			else {
				strJson1.append(",");
			}
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"backgroundColor\": [");
			count = 1;
			if(listMaximo.size() > 0){
				
				for(BeanMaximo item : listMaximo){
					if(item.getTicketClass().toUpperCase().equals("INCIDENT"))
						switch (count) {
							case 1: strJson1.append("\"#7986CB\","); count++; break;
							case 2: strJson1.append("\"#EC407A\","); count++; break;
							case 3: strJson1.append("\"#AB47BC\","); count++; break;
							case 4: strJson1.append("\"#42A5F5\","); count++; break;
							case 5: strJson1.append("\"#009688\","); count++; break;
							case 6: strJson1.append("\"#CDDC39\","); count = 1; break;
						}
				}
				if(!strJson1.substring(strJson1.length() -1, strJson1.length()).equals(","))
					strJson1.append(",");
			}
			else {
				strJson1.append(",");
			}
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"labels\":[");
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					if(item.getTicketClass().toUpperCase().equals("INCIDENT"))
						strJson1.append("\"" + 
						(objBusinessOption.listOptions3(new BeanParameters(item.getTicketIdEstado(),"ESTADOMAXIMO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).size() > 0 ? objBusinessOption.listOptions3(new BeanParameters(item.getTicketIdEstado(),"ESTADOMAXIMO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).get(0).getStrDescripcion() : item.getTicketIdEstado()) +
						"\",");
				}
				if(!strJson1.substring(strJson1.length() -1, strJson1.length()).equals(","))
					strJson1.append(",");
			}
			else {
				strJson1.append(",");
			}
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}");
			
		}
		catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}
		
	public void getUsuariosTop(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
			List<BeanMaximo> listMaximo = null;
			
			String strPeriodoInicio = req.getParameter("ptxtInicio");
			String strPeriodoFin = req.getParameter("ptxtFin");
			String strClientes = req.getParameter("pcboClientes");
			String strTipo = req.getParameter("ptipo").equals("0")? null : req.getParameter("ptipo");
			String strClient = req.getParameter("strClient") == null ? "" : req.getParameter("strClient");
			
			BusinessOptions objBusinessOption = new BusinessOptions();
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrValor1(strClientes);
			objBeanParameters.setStrdate1(strPeriodoInicio);
			objBeanParameters.setStrdate2(strPeriodoFin);
			objBeanParameters.setStrValor2(strTipo != null ? objBusinessOption.listOptions4(new BeanParameters(strTipo,"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).size() > 0 ? objBusinessOption.listOptions4(new BeanParameters(strTipo,"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).get(0).getStrValor1() : strTipo : null);
			
			if(strClientes.equals("ALL")) {
				objBeanParameters.setStrValor1(null);
//				objBeanParameters.setStrValor3(strClient);
				objBeanParameters.setStrValor3(objBeanSession.getObjBeanPersonal().getStrCodCliente());
			}else{
				objBeanParameters.setStrValor1(strClientes);
				objBeanParameters.setStrValor3(null);
			}
			
			listMaximo = objBusinessMaximoMobility.getUsuariosTop(objBeanParameters, ssf);
			
			
			strJson1.append("{\"usuariosTop\" : [");
			strJson1.append("{\"labels\": [");
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					strJson1.append("\"" + AppUtils.cleanString(item.getTicketPersonaAfectada()) + "\",");
				}
			}
			else
				strJson1.append(",");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"datasets\": [");
			strJson1.append("{\"label\": \"Requerimiento\",\"backgroundColor\": \"#FF8A65\",\"borderColor\": \"#FF8A65\",\"borderWidth\": 1,\"data\": [");
			
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					strJson1.append(item.getiValor1() + ",");
				}
			}
			else
				strJson1.append(",");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
			
			strJson1 = new StringBuilder();
			strJson1.append("{\"label\": \"Incidencia\",\"backgroundColor\": \"#FFEA00\",\"borderColor\": \"#FFEA00\",\"borderWidth\": 1,\"data\": [");
			
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					strJson1.append(item.getiValor2() + ",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}]}");
			

			
//			strJson1.append("{\"usuariosTop\" : [");
//			strJson1.append("{\"labels\": [");
//			if(listMaximo.size() > 0){
//				for(BeanMaximo item : listMaximo){
//					strJson1.append("\"" + AppUtils.cleanString(item.getTicketReportador()) + "\",");
//				}
//			}
//			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
//			
//			strJson1 = new StringBuilder();
//			strJson1.append("\"datasets\": [");
//			strJson1.append("{\"label\": \"Tickets\",\"backgroundColor\": \"#FF8A65\",\"borderColor\": \"#FF8A65\",\"borderWidth\": 1,\"data\": [");
//			
//			if(listMaximo.size() > 0){
//				for(BeanMaximo item : listMaximo){
//					strJson1.append(item.getiCantidad() + ",");
//				}
//			}
//			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}]}");
			
		}
		catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}
	
	public void getSedes(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		StringBuilder strJson3 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		try{
			BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
			List<BeanMaximo> listMaximo = null;
			List<BeanOptions> listSedes = null;
			
			String strPeriodoInicio = req.getParameter("ptxtInicio");
			String strPeriodoFin = req.getParameter("ptxtFin");
			String strClientes = req.getParameter("pcboClientes");
			String strTipo = req.getParameter("ptipo").equals("0")? null : req.getParameter("ptipo");
			String strClient = req.getParameter("strClient") == null ? "" : req.getParameter("strClient");
			
			BusinessOptions objBusinessOption = new BusinessOptions();
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrValor1(strClientes);
			objBeanParameters.setStrdate1(strPeriodoInicio);
			objBeanParameters.setStrdate2(strPeriodoFin);
			objBeanParameters.setStrValor2(strTipo != null ? objBusinessOption.listOptions4(new BeanParameters(strTipo,"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).size() > 0 ? objBusinessOption.listOptions4(new BeanParameters(strTipo,"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).get(0).getStrValor1() : strTipo : null);
			
			if(strClientes.equals("ALL")) {
				objBeanParameters.setStrValor1(null);
//				objBeanParameters.setStrValor3(strClient);
				objBeanParameters.setStrValor3(objBeanSession.getObjBeanPersonal().getStrCodCliente());
			}else{
				objBeanParameters.setStrValor1(strClientes);
				objBeanParameters.setStrValor3(null);
			}
			
			listMaximo = objBusinessMaximoMobility.getSedes(objBeanParameters, ssf);
			
			for(BeanMaximo item : listMaximo){
				if(item.getTicketLocal() != null)
				strJson1.append(AppUtils.validate(item.getTicketLocal())+ ",");
			}
			
			listSedes = objBusinessOption.listOptions5(new BeanParameters(strJson1.substring(0, strJson1.length() - 1),"DASHBOARDMOBILITY_SEDES",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf"));
			String[] gruposSedes;
			strJson1 = new StringBuilder();
			strJson1.append("{\"sede\" : [");
			strJson1.append("{\"datasets\": [{\"data\": [");
			
			if(listSedes != null && listSedes.size() > 0) {
					strJson3.append("'" + listSedes.get(0).getStrDescripcion() + "',");
					String val1 = "";
					for(int i = 0 ; i < listSedes.size() -1 ; i++){
						val1 = listSedes.get(i+1).getStrDescripcion();
						if(!val1.equals(listSedes.get(i).getStrDescripcion()))
							if(!strJson3.toString().contains("'" + val1 + "'"))
								strJson3.append("'" + val1 + "',");
					}
				
				gruposSedes = strJson3.substring(1,strJson3.toString().length() - 2).toString().split("','");
				int countSede = 0;
				
				if(gruposSedes.length > 0){
					for(int i = 0 ; i < gruposSedes.length ; i++){
						countSede = 0;
						for(int j = 0 ; j < listSedes.size() ; j++){
							for(int k = 0 ; k < listMaximo.size() ; k++){
								if(listSedes.get(j).getStrDescripcion().equals(gruposSedes[i]) && listSedes.get(j).getStrValor1().equals(listMaximo.get(k).getTicketLocal())){
									countSede += listMaximo.get(k).getiCantidad();
								}
							}
						}
						strJson1.append("" + countSede + ",");
					}
				}
			}
			else{
				if(listMaximo.size() > 0){
					strJson3.append("'" + listMaximo.get(0).getTicketLugar() + "',");
					String val1 = "";
					for(int i = 1 ; i < listMaximo.size(); i++){
						val1 = listMaximo.get(i-1).getTicketLugar();
						if(!val1.equals(listMaximo.get(i).getTicketLugar()))
							if(!strJson3.toString().contains("'" + listMaximo.get(i).getTicketLugar() + "'"))
								strJson3.append("'" + listMaximo.get(i).getTicketLugar() + "',");
					}
				}
				
				gruposSedes = strJson3.substring(1,strJson3.toString().length() - 2).toString().split("','");
				int countSede = 0;
				
				if(gruposSedes.length > 0){
					for(int i = 0 ; i < gruposSedes.length ; i++){
						countSede = 0;
						for(int j = 0 ; j < listMaximo.size() ; j++){
							for(int k = 0 ; k < listMaximo.size() ; k++){
								if(listMaximo.get(j).getTicketLugar().equals(gruposSedes[i]) && listMaximo.get(j).getTicketLocal().equals(listMaximo.get(k).getTicketLocal())){
									countSede += listMaximo.get(k).getiCantidad();
								}
							}
						}
						
						strJson1.append("" + countSede + ",");
					}
				}
			}
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"backgroundColor\": [");
			int count = 1;
			if(listMaximo.size() > 0){
				for(String item : gruposSedes){
						switch (count) {
							case 1: strJson1.append("\"#7986CB\","); count++; break;
							case 2: strJson1.append("\"#EC407A\","); count++; break;
							case 3: strJson1.append("\"#AB47BC\","); count++; break;
							case 4: strJson1.append("\"#42A5F5\","); count++; break;
							case 5: strJson1.append("\"#009688\","); count++; break;
							case 6: strJson1.append("\"#CDDC39\","); count = 1; break;
						}
				}
			}
			else
				strJson1.append(",");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}],");

			strJson1 = new StringBuilder();
			strJson1.append("\"labels\":[");
			if(listMaximo.size() > 0){
				for(int i = 0 ; i < gruposSedes.length ; i++){
					strJson1.append("\"" + gruposSedes[i] + "\",");
				}
			}
			else
				strJson1.append(",");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}");
			
		}
		catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}

	public void getBackLog(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		StringBuilder strJson3 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
			List<BeanMaximo> listMaximo = null;
			
			String strPeriodoInicio = req.getParameter("ptxtInicio");
			String strPeriodoFin = req.getParameter("ptxtFin");
			String strClientes = req.getParameter("pcboClientes");
			String strTipo = req.getParameter("ptipo");
			String strOnVip = req.getParameter("pOnVip");
			String strClient = req.getParameter("strClient") == null ? "" : req.getParameter("strClient");
			
			BusinessOptions objBusinessOption = new BusinessOptions();
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrValor1(strClientes);
			objBeanParameters.setStrdate1(strPeriodoInicio);
			objBeanParameters.setStrdate2(strPeriodoFin);
			String val1 = "";
			
			if(strOnVip.equals("1")) {
				if(strOnVip.equals("1")) {
					listMaximo = objBusinessMaximoMobility.getTableBackLog(objBeanParameters, ssf);
					if(listMaximo != null && listMaximo.size() > 0) {
						strJson2 = new StringBuilder();
						strJson2.append("'" + listMaximo.get(0).getTicketEmailPersonaAfectada() + "',");
						val1 = "";
						for(int i = 0 ; i < listMaximo.size() -1 ; i++){
							val1 = listMaximo.get(i + 1).getTicketEmailPersonaAfectada();
							if(!val1.equals(listMaximo.get(i).getTicketEmailPersonaAfectada()))
								if(!strJson2.toString().contains("'" + val1 + "'"))
									strJson2.append("'" + val1 + "',");
						}
						List<BeanOptions> listPersonasAfectadas = objBusinessOption.listOptions3_(new BeanParameters(strJson2.substring(0,strJson2.toString().length() - 1).toString(),"DASHBOARDMOBILITY_USUARIOSVIP",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf"));
						
						if(listPersonasAfectadas != null && listPersonasAfectadas.size() > 0) {
							strJson2 = new StringBuilder();
							strJson2.append("'" + listPersonasAfectadas.get(0).getStrValor1() + "',");
							val1 = "";
							for(int i = 0 ; i < listPersonasAfectadas.size() -1 ; i++){
								val1 = listPersonasAfectadas.get(i + 1).getStrValor1();
								if(!val1.equals(listPersonasAfectadas.get(i).getStrValor1()))
									if(!strJson2.toString().contains("'" + val1 + "'"))
										strJson2.append("'" + val1 + "',");
							}
							objBeanParameters.setStrValor3(strJson2.substring(0, strJson2.length() - 1));
						}
					}
				}
			}
			strJson2 = new StringBuilder();
			
			
			
			if(strClientes.equals("ALL")) {
				objBeanParameters.setStrValor1(null);
//				objBeanParameters.setStrValor4(strClient);
				objBeanParameters.setStrValor4(objBeanSession.getObjBeanPersonal().getStrCodCliente());
			}else{
				objBeanParameters.setStrValor1(strClientes);
				objBeanParameters.setStrValor4(null);
			}
			
			listMaximo = objBusinessMaximoMobility.getBackLog(objBeanParameters, ssf);
			
			strJson1.append("{\"backlog\" : [");
			strJson1.append("{\"datasets\": [{\"data\": [");
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					strJson1.append(item.getiCantidad() + ",");
				}
			}
			else
				strJson1.append(",");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"backgroundColor\": [");
			int count = 1;
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					switch (count) {
					case 1: strJson1.append("\"#7986CB\","); count++; break;
					case 2: strJson1.append("\"#EC407A\","); count++; break;
					case 3: strJson1.append("\"#AB47BC\","); count++; break;
					case 4: strJson1.append("\"#42A5F5\","); count++; break;
					case 5: strJson1.append("\"#009688\","); count++; break;
					case 6: strJson1.append("\"#CDDC39\","); count = 1; break;
					}
				}
			}
			else
				strJson1.append(",");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"labels\":[");
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					List<BeanOptions> listOptions = new ArrayList<BeanOptions>();
					listOptions = objBusinessOption.listOptions3(new BeanParameters(item.getTicketIdGrupoResolutor(),"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf"));
					if(listOptions != null && listOptions.size() > 0)
						strJson1.append("\"" + listOptions.get(0).getStrDescripcion() + "\",");
					else
						strJson1.append("\"" + item.getTicketIdGrupoResolutor() + "\",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}],");
			strJson3 = strJson2;
			
			strJson1 = new StringBuilder();
			strJson2 = new StringBuilder();
			
			listMaximo = objBusinessMaximoMobility.getTableBackLog(objBeanParameters, ssf);
			
			strJson1.append("\"backlogTbl\" : [");
			if(listMaximo != null){
				if(listMaximo.size() > 0){
					String strClass = "";
					
					strJson2 = new StringBuilder();
					strJson2.append("'" + listMaximo.get(0).getTicketClass() + "',");
					
					for(int i = 0 ; i < listMaximo.size() -1 ; i++){
						val1 = listMaximo.get(i + 1).getTicketClass();
						if(!val1.equals(listMaximo.get(i).getTicketClass()))
							if(!strJson2.toString().contains("'" + val1 + "'"))
								strJson2.append("'" + val1 + "',");
					}
					String[] arrGrupo = strJson2.substring(1,strJson2.toString().length() - 2).toString().split("','");
					
					strJson2 = new StringBuilder();
					strJson2.append("'" + listMaximo.get(0).getTicketGrupoResolutor() + "',");
					val1 = "";
					for(int i = 0 ; i < listMaximo.size() -1 ; i++){
						val1 = listMaximo.get(i + 1).getTicketGrupoResolutor();
						if(!val1.equals(listMaximo.get(i).getTicketGrupoResolutor()))
							if(!strJson2.toString().contains("'" + val1 + "'"))
								strJson2.append("'" + val1 + "',");
					}
					List<BeanOptions> listGrupoResolutor = objBusinessOption.listOptions3_(new BeanParameters(strJson2.substring(0,strJson2.toString().length() - 1).toString(),"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf"));
					
					strJson2 = new StringBuilder();
					strJson2.append("'" + listMaximo.get(0).getTicketEmailPersonaAfectada() + "',");
					val1 = "";
					for(int i = 0 ; i < listMaximo.size() -1 ; i++){
						val1 = listMaximo.get(i + 1).getTicketEmailPersonaAfectada();
						if(!val1.equals(listMaximo.get(i).getTicketEmailPersonaAfectada()))
							if(!strJson2.toString().contains("'" + val1 + "'"))
								strJson2.append("'" + val1 + "',");
					}
					
					List<BeanOptions> listPersonasAfectadas = objBusinessOption.listOptions3_(new BeanParameters(strJson2.substring(0,strJson2.toString().length() - 1).toString(),"DASHBOARDMOBILITY_USUARIOSVIP",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf"));
					strJson2 = new StringBuilder();
					
						count = 0;
						for(int i = 0 ; i < arrGrupo.length ; i++){
							strClass = arrGrupo[i];
							strJson1.append("{\"class\": [");
							for(int j = 0 ; j < listMaximo.size() ; j++){
								if(strClass.equals(listMaximo.get(j).getTicketClass())){
									strJson1.append("{");
									strJson1.append("\"strClass\" :\"" + listMaximo.get(j).getTicketClass() + "\",");
									
									count = 0;
									for(BeanOptions item : listGrupoResolutor){
										if(listMaximo.get(j).getTicketGrupoResolutor().equals(item.getStrValor1())){
											count++;
											strJson1.append("\"strGrupo\" :\"" + item.getStrDescripcion() + "\",");
											break;
										}
									}
									
									if(count == 0)
										strJson1.append("\"strGrupo\" :\"" + listMaximo.get(j).getTicketGrupoResolutor() + "\",");
									
									count = 0;
									for(BeanOptions item : listPersonasAfectadas){
										if(listMaximo.get(j).getTicketEmailPersonaAfectada().toUpperCase().equals(item.getStrValor1().toUpperCase())){
											count++;
											strJson1.append("\"strEmail\" :\"" + item.getStrValor1() + " <label class='label label-success'>VIP</label>\",");
											break;
										}
									}
									
									if(count == 0)
										strJson1.append("\"strEmail\" :\"" + listMaximo.get(j).getTicketEmailPersonaAfectada() + "\",");

									strJson1.append("\"strValor1\" :\"" + listMaximo.get(j).getStrValor1() + "\",");
									strJson1.append("\"strValor2\" :\"" + listMaximo.get(j).getStrValor2() + "\",");
									strJson1.append("\"strValor3\" :\"" + listMaximo.get(j).getStrValor3() + "\",");
									strJson1.append("\"strValor4\" :\"" + listMaximo.get(j).getStrValor4() + "\"");
									strJson1.append("},");
								}
							}
							strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
							strJson1 = new StringBuilder();
						}
				}else
					strJson2.append(strJson1 + ",");
			}else
				strJson2.append(strJson1 + ",");
			strJson3.append(strJson2.substring(0, strJson2.length() - 1) + "]}");
		}
		catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson3 = new StringBuilder();
			strJson3.append("error");
		}
		out.print(strJson3);
	}
	
	public void getBackLogDetalle(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		StringBuilder strJson3 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
			List<BeanMaximo> listMaximo = null;
			
			String strPeriodoInicio = req.getParameter("ptxtInicio");
			String strPeriodoFin = req.getParameter("ptxtFin");
			String strClientes = req.getParameter("pcboClientes");
			String strTipo = req.getParameter("ptipo") == null ? "" : req.getParameter("ptipo");
			String strOnVip = req.getParameter("pOnVip");
			
			BusinessOptions objBusinessOption = new BusinessOptions();
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrValor1(strClientes);
			objBeanParameters.setStrdate1(strPeriodoInicio);
			objBeanParameters.setStrdate2(strPeriodoFin);
			objBeanParameters.setStrValor2(strTipo != null ? objBusinessOption.listOptions4(new BeanParameters(strTipo,"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).size() > 0 ? objBusinessOption.listOptions4(new BeanParameters(strTipo,"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).get(0).getStrValor1() : strTipo : null);
//			objBeanParameters.setStrValor2(objBeanParameters.getStrValor2().equals("I-DCS-PE-VIR04-OS") ? "'I-DCS-PE-VIR04-OSNR','I-DCS-PE-VIR04-OSRT'" : "'" + objBeanParameters.getStrValor2() + "'");
			String val1 = "";
			
			if(strOnVip.equals("1")) {
				listMaximo = objBusinessMaximoMobility.getTableBackLog(objBeanParameters, ssf);
				if(listMaximo != null && listMaximo.size() > 0) {
					strJson2 = new StringBuilder();
					strJson2.append("'" + listMaximo.get(0).getTicketEmailPersonaAfectada() + "',");
					val1 = "";
					for(int i = 0 ; i < listMaximo.size() -1 ; i++){
						val1 = listMaximo.get(i + 1).getTicketEmailPersonaAfectada();
						if(!val1.equals(listMaximo.get(i).getTicketEmailPersonaAfectada()))
							if(!strJson2.toString().contains("'" + val1 + "'"))
								strJson2.append("'" + val1 + "',");
					}
					List<BeanOptions> listPersonasAfectadas = objBusinessOption.listOptions3_(new BeanParameters(strJson2.substring(0,strJson2.toString().length() - 1).toString(),"DASHBOARDMOBILITY_USUARIOSVIP",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf"));
					
					if(listPersonasAfectadas != null && listPersonasAfectadas.size() > 0) {
						strJson2 = new StringBuilder();
						strJson2.append("'" + listPersonasAfectadas.get(0).getStrValor1() + "',");
						val1 = "";
						for(int i = 0 ; i < listPersonasAfectadas.size() -1 ; i++){
							val1 = listPersonasAfectadas.get(i + 1).getStrValor1();
							if(!val1.equals(listPersonasAfectadas.get(i).getStrValor1()))
								if(!strJson2.toString().contains("'" + val1 + "'"))
									strJson2.append("'" + val1 + "',");
						}
						objBeanParameters.setStrValor3(strJson2.substring(0, strJson2.length() - 1));
					}
				}
			}
			strJson2 = new StringBuilder();
			
			
			listMaximo = objBusinessMaximoMobility.getBackLog(objBeanParameters, ssf);
			
			strJson1.append("{\"backlog\" : [");
			strJson1.append("{\"datasets\": [{\"data\": [");
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					strJson1.append(item.getiCantidad() + ",");
				}
			}
			else
				strJson1.append(",");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"backgroundColor\": [");
			int count = 1;
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					switch (count) {
					case 1: strJson1.append("\"#7986CB\","); count++; break;
					case 2: strJson1.append("\"#EC407A\","); count++; break;
					case 3: strJson1.append("\"#AB47BC\","); count++; break;
					case 4: strJson1.append("\"#42A5F5\","); count++; break;
					case 5: strJson1.append("\"#009688\","); count++; break;
					case 6: strJson1.append("\"#CDDC39\","); count = 1; break;
					}
				}
			}
			else
				strJson1.append(",");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"labels\":[");
			if(listMaximo.size() > 0){
				for(BeanMaximo item : listMaximo){
					strJson1.append("\"" + 
							(objBusinessOption.listOptions3(new BeanParameters(item.getTicketIdGrupoResolutor(),"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).size() > 0 ? objBusinessOption.listOptions3(new BeanParameters(item.getTicketIdGrupoResolutor(),"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).get(0).getStrDescripcion() : item.getTicketIdGrupoResolutor()) +
							"\",");
				}
			}
			else
				strJson1.append(",");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}],");
			strJson3 = strJson2;
			
			strJson1 = new StringBuilder();
			strJson2 = new StringBuilder();
			
			listMaximo = objBusinessMaximoMobility.getTableBackLog(objBeanParameters, ssf);
			
			
			strJson1.append("\"backlogTbl\" : [");
			if(listMaximo != null){
				if(listMaximo.size() > 0){
					String strClass = "";
					
					strJson2 = new StringBuilder();
					strJson2.append("'" + listMaximo.get(0).getTicketClass() + "',");
					for(int i = 0 ; i < listMaximo.size() -1 ; i++){
						val1 = listMaximo.get(i + 1).getTicketClass();
						if(!val1.equals(listMaximo.get(i).getTicketClass()))
							if(!strJson2.toString().contains("'" + val1 + "'"))
								strJson2.append("'" + val1 + "',");
					}
					String[] arrGrupo = strJson2.substring(1,strJson2.toString().length() - 2).toString().split("','");
					
					
					strJson2 = new StringBuilder();
					strJson2.append("'" + listMaximo.get(0).getTicketGrupoResolutor() + "',");
					val1 = "";
					for(int i = 0 ; i < listMaximo.size() -1 ; i++){
						val1 = listMaximo.get(i + 1).getTicketGrupoResolutor();
						if(!val1.equals(listMaximo.get(i).getTicketGrupoResolutor()))
							if(!strJson2.toString().contains("'" + val1 + "'"))
								strJson2.append("'" + val1 + "',");
					}
					List<BeanOptions> listGrupoResolutor = objBusinessOption.listOptions3_(new BeanParameters(strJson2.substring(0,strJson2.toString().length() - 1).toString(),"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf"));
					
					
					strJson2 = new StringBuilder();
					strJson2.append("'" + listMaximo.get(0).getTicketEmailPersonaAfectada() + "',");
					val1 = "";
					for(int i = 0 ; i < listMaximo.size() -1 ; i++){
						val1 = listMaximo.get(i + 1).getTicketEmailPersonaAfectada();
						if(!val1.equals(listMaximo.get(i).getTicketEmailPersonaAfectada()))
							if(!strJson2.toString().contains("'" + val1 + "'"))
								strJson2.append("'" + val1 + "',");
					}
					
					List<BeanOptions> listPersonasAfectadas = objBusinessOption.listOptions3_(new BeanParameters(strJson2.substring(0,strJson2.toString().length() - 1).toString(),"DASHBOARDMOBILITY_USUARIOSVIP",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf"));
					strJson2 = new StringBuilder();
					
					count = 0;
					for(int i = 0 ; i < arrGrupo.length ; i++){
						strClass = arrGrupo[i];
						strJson1.append("{\"class\": [");
						for(int j = 0 ; j < listMaximo.size() ; j++){
							if(strClass.equals(listMaximo.get(j).getTicketClass())){
								strJson1.append("{");
								strJson1.append("\"strClass\" :\"" + listMaximo.get(j).getTicketClass() + "\",");
								
								count = 0;
								for(BeanOptions item : listGrupoResolutor){
									if(listMaximo.get(j).getTicketGrupoResolutor().equals(item.getStrValor1())){
										count++;
										strJson1.append("\"strGrupo\" :\"" + item.getStrDescripcion() + "\",");
										break;
									}
								}
								
								if(count == 0)
									strJson1.append("\"strGrupo\" :\"" + listMaximo.get(j).getTicketGrupoResolutor() + "\",");
								
								
								count = 0;
								for(BeanOptions item : listPersonasAfectadas){
									if(listMaximo.get(j).getTicketEmailPersonaAfectada().equals(item.getStrValor1())){
										count++;
										strJson1.append("\"strEmail\" :\"" + item.getStrValor1() + " <label class='label label-success'>VIP</label>\",");
										break;
									}
								}
								
								if(count == 0)
									strJson1.append("\"strEmail\" :\"" + listMaximo.get(j).getTicketEmailPersonaAfectada() + "\",");

								strJson1.append("\"strValor1\" :\"" + listMaximo.get(j).getStrValor1() + "\",");
								strJson1.append("\"strValor2\" :\"" + listMaximo.get(j).getStrValor2() + "\",");
								strJson1.append("\"strValor3\" :\"" + listMaximo.get(j).getStrValor3() + "\",");
								strJson1.append("\"strValor4\" :\"" + listMaximo.get(j).getStrValor4() + "\"");
								strJson1.append("},");
							}
						}
						strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
						strJson1 = new StringBuilder();
					}
				}else
					strJson2.append(strJson1.toString() + ",");
			}else
				strJson2.append(strJson1.toString() + ",");
			strJson3.append(strJson2.substring(0, strJson2.length() - 1) + "]}");
			
			
		}
		catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson3 = new StringBuilder();
			strJson3.append("error");
		}
		out.print(strJson3);
	}
	
	public void getMaximoTicketsBackLog(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		StringBuilder strJson3 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
			List<BeanMaximo> listMaximo = null;
			
			String strPeriodoInicio = req.getParameter("ptxtInicio");
			String strPeriodoFin = req.getParameter("ptxtFin");
			String strClientes = req.getParameter("pcboClientes");
			String strTipo = req.getParameter("ptipo").equals("0") ? null : req.getParameter("ptipo");
			String strOnVip = req.getParameter("pOnVip");
			String strClient = req.getParameter("strClient") == null ? "" : req.getParameter("strClient");
			
			BusinessOptions objBusinessOption = new BusinessOptions();
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrValor1(strClientes);
			objBeanParameters.setStrdate1(strPeriodoInicio);
			objBeanParameters.setStrdate2(strPeriodoFin);
			objBeanParameters.setStrValor2(strTipo != null ? objBusinessOption.listOptions4(new BeanParameters(strTipo,"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).size() > 0 ? objBusinessOption.listOptions4(new BeanParameters(strTipo,"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).get(0).getStrValor1() : strTipo : null);
//			objBeanParameters.setStrValor2(objBeanParameters.getStrValor2().equals("I-DCS-PE-VIR04-OS") ? "'I-DCS-PE-VIR04-OSNR','I-DCS-PE-VIR04-OSRT'" : "'" + objBeanParameters.getStrValor2() + "'");
			String val1 = "";
			
			if(strClientes.equals("ALL")) {
				objBeanParameters.setStrValor1(null);
//				objBeanParameters.setStrValor4(strClient);
				objBeanParameters.setStrValor4(objBeanSession.getObjBeanPersonal().getStrCodCliente());
			}else{
				objBeanParameters.setStrValor1(strClientes);
				objBeanParameters.setStrValor4(null);
			}
			
			if(strOnVip.equals("1")) {
				listMaximo = objBusinessMaximoMobility.getTableBackLog(objBeanParameters, ssf);
				if(listMaximo != null && listMaximo.size() > 0) {
					strJson2 = new StringBuilder();
					strJson2.append("'" + listMaximo.get(0).getTicketEmailPersonaAfectada() + "',");
					val1 = "";
					for(int i = 0 ; i < listMaximo.size() -1 ; i++){
						val1 = listMaximo.get(i + 1).getTicketEmailPersonaAfectada();
						if(!val1.equals(listMaximo.get(i).getTicketEmailPersonaAfectada()))
							if(!strJson2.toString().contains("'" + val1 + "'"))
								strJson2.append("'" + val1 + "',");
					}
					List<BeanOptions> listPersonasAfectadas = objBusinessOption.listOptions3_(new BeanParameters(strJson2.substring(0,strJson2.toString().length() - 1).toString(),"DASHBOARDMOBILITY_USUARIOSVIP",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf"));
					
					if(listPersonasAfectadas != null && listPersonasAfectadas.size() > 0) {
						strJson2 = new StringBuilder();
						strJson2.append("'" + listPersonasAfectadas.get(0).getStrValor1() + "',");
						val1 = "";
						for(int i = 0 ; i < listPersonasAfectadas.size() -1 ; i++){
							val1 = listPersonasAfectadas.get(i + 1).getStrValor1();
							if(!val1.equals(listPersonasAfectadas.get(i).getStrValor1()))
								if(!strJson2.toString().contains("'" + val1 + "'"))
									strJson2.append("'" + val1 + "',");
						}
						objBeanParameters.setStrValor3(strJson2.substring(0, strJson2.length() - 1));
					}
				}
			}
			strJson2 = new StringBuilder();

			listMaximo = objBusinessMaximoMobility.getMaximoTicketBackLog(objBeanParameters, ssf);
			
			strJson1.append("{\"ticketsReporte\" : [");			
			
				if(listMaximo.size() > 0){
					for(BeanMaximo item : listMaximo){
						strJson1.append("{");
						strJson1.append("\"idTicket\" : \"" + item.getIdTicket() + "\",");
						strJson1.append("\"ticketTitulo\" : \"" + com.pe.ibm.util.AppUtils.cleanString(item.getTicketTitulo()) + "\",");
						strJson1.append("\"ticketClass\" : \"" + item.getTicketClass() + "\",");
						strJson1.append("\"ticketUsuarioVip\" : \"" + item.getTicketUsuarioVip() + "\",");
						strJson1.append("\"ticketEstado\" : \"" + item.getTicketEstado() + "\",");
						strJson1.append("\"ticketCliente\" : \"" + item.getTicketCliente() + "\",");
						strJson1.append("\"ticketIdCliente\" : \"" + item.getTicketIdCliente() + "\",");
						strJson1.append("\"ticketIdLugar\" : \"" + AppUtils.cleanString(item.getTicketIdLugar()) + "\",");
						strJson1.append("\"ticketLugar\" : \"" + AppUtils.cleanString(item.getTicketLugar()) + "\",");
						strJson1.append("\"ticketClassNivel2\" : \"" + item.getTicketClasificacionNivel2() + "\",");
						strJson1.append("\"ticketITGrupoResolutor\" : \"" + item.getTicketITGrupoResolutor() + "\",");
						strJson1.append("\"ticketGrupoResolutor\" : \"" + item.getTicketGrupoResolutor() + "\",");
						strJson1.append("\"ticketIdGrupoResolutor\" : \"" + item.getTicketIdGrupoResolutor() + "\",");
						strJson1.append("\"ticketFechaCreacion\" : \"" + item.getTicketFechaCreacion() + "\",");
						strJson1.append("\"ticketFechaFin\" : \"" + item.getTicketFechaFin() + "\",");
						strJson1.append("\"ticketPersonaReportado\" : \"" + AppUtils.cleanString(item.getTicketPersonaReportado()) + "\",");
						strJson1.append("\"ticketEmailPersonaAfectada\" : \"" + AppUtils.cleanString(item.getTicketEmailPersonaAfectada()) + "\",");
						strJson1.append("\"ticketPersonaAfectada\" : \"" + AppUtils.cleanString(item.getTicketPersonaAfectada()) + "\",");
						strJson1.append("\"ticketNumeroCI\" : \"" + AppUtils.cleanString(item.getTicketNumeroCI()) + "\"");
						strJson1.append("},");
					}
				} else {
					strJson1.append(",");
					}
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
			
		}
		catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}

	public void getMaximoTicketsResueltos(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		StringBuilder strJson3 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
			List<BeanMaximo> listMaximo = null;
			
			String strPeriodoInicio = req.getParameter("ptxtInicio");
			String strPeriodoFin = req.getParameter("ptxtFin");
			String strClientes = req.getParameter("pcboClientes");
			String strTipo = req.getParameter("ptipo").equals("0") ? null : req.getParameter("ptipo");
			String strClient = req.getParameter("strClient") == null ? "" : req.getParameter("strClient");
			
			BusinessOptions objBusinessOption = new BusinessOptions();
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrValor1((strClientes.equals("null") ? null : strClientes));
			objBeanParameters.setStrdate1(strPeriodoInicio);
			objBeanParameters.setStrdate2(strPeriodoFin);
			objBeanParameters.setStrValor2(strTipo != null ? objBusinessOption.listOptions4(new BeanParameters(strTipo,"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).size() > 0 ? objBusinessOption.listOptions4(new BeanParameters(strTipo,"GRUPOPROPIETARIO_ALERTA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).get(0).getStrValor1() : strTipo : null);
			
			if(strClientes.equals("ALL")) {
				objBeanParameters.setStrValor1(null);
//				objBeanParameters.setStrValor4(strClient);
				objBeanParameters.setStrValor4(objBeanSession.getObjBeanPersonal().getStrCodCliente());
			}else{
				objBeanParameters.setStrValor1(strClientes);
				objBeanParameters.setStrValor4(null);
			}
			
			listMaximo = objBusinessMaximoMobility.getMaximoTicketsResueltos(objBeanParameters, ssf);
			
			strJson1.append("{\"ticketsReporte\" : [");			
			
				if(listMaximo.size() > 0){
					for(BeanMaximo item : listMaximo){
						strJson1.append("{");
						strJson1.append("\"idTicket\" : \"" + item.getIdTicket() + "\",");
						strJson1.append("\"ticketTitulo\" : \"" + com.pe.ibm.util.AppUtils.cleanString(item.getTicketTitulo()) + "\",");
						strJson1.append("\"ticketClass\" : \"" + item.getTicketClass() + "\",");
						strJson1.append("\"ticketUsuarioVip\" : \"" + item.getTicketUsuarioVip() + "\",");
						strJson1.append("\"ticketEstado\" : \"" + item.getTicketEstado() + "\",");
						strJson1.append("\"ticketCliente\" : \"" + item.getTicketCliente() + "\",");
						strJson1.append("\"ticketIdCliente\" : \"" + item.getTicketIdCliente() + "\",");
						strJson1.append("\"ticketIdLugar\" : \"" + AppUtils.cleanString(item.getTicketIdLugar()) + "\",");
						strJson1.append("\"ticketLugar\" : \"" + AppUtils.cleanString(item.getTicketLugar()) + "\",");
						strJson1.append("\"ticketClassNivel2\" : \"" + item.getTicketClasificacionNivel2() + "\",");
						strJson1.append("\"ticketITGrupoResolutor\" : \"" + item.getTicketITGrupoResolutor() + "\",");
						strJson1.append("\"ticketGrupoResolutor\" : \"" + item.getTicketGrupoResolutor() + "\",");
						strJson1.append("\"ticketIdGrupoResolutor\" : \"" + item.getTicketIdGrupoResolutor() + "\",");
						strJson1.append("\"ticketFechaCreacion\" : \"" + item.getTicketFechaCreacion() + "\",");
						strJson1.append("\"ticketFechaFin\" : \"" + item.getTicketFechaFin() + "\",");
						strJson1.append("\"ticketPersonaReportado\" : \"" + AppUtils.cleanString(item.getTicketPersonaReportado()) + "\",");
						strJson1.append("\"ticketEmailPersonaAfectada\" : \"" + AppUtils.cleanString(item.getTicketEmailPersonaAfectada()) + "\",");
						strJson1.append("\"ticketPersonaAfectada\" : \"" + AppUtils.cleanString(item.getTicketPersonaAfectada()) + "\",");
						strJson1.append("\"ticketNumeroCI\" : \"" + AppUtils.cleanString(item.getTicketNumeroCI()) + "\"");
						strJson1.append("},");
					}
				} else {
					strJson1.append(",");
					}
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
			
		}
		catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}
	
	public void listCiscoGSP(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			BusinessMaximoWH objBusinessMaximoWH = new BusinessMaximoWH();
			List<BeanMaximo> listMaximo = null;
			
			DateFormat dateFormat1 = new SimpleDateFormat("MMyyyy");
			DateFormat dateFormat2 = new SimpleDateFormat("yyyyMM");
			DateFormat dateFormat3 = new SimpleDateFormat("yyyyMMdd");
			Date date = new Date();
			
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrdate1(dateFormat1.format(date));
			objBeanParameters.setStrdate2(dateFormat2.format(date));
			objBeanParameters.setStrdate3(dateFormat3.format(date));
			
			BusinessOptions objBusinessOptions = new BusinessOptions();
			String strClient = req.getParameter("pclient");
			
			List<BeanOptions> listClient = objBusinessOptions.listOptions3(new BeanParameters(strClient, "AREA", 1), (SqlSessionFactory) req.getServletContext().getAttribute("sqlsf"));
			objBeanParameters.setStrValor1(listClient.get(0).getStrValor2());
			
			listMaximo = objBusinessMaximoWH.getCiscoMesa(objBeanParameters, ssf);
			if(listMaximo != null && listMaximo.size() > 0){
				strJson1.append("{\"cisco\": [{\"tasaabandonodia\":\"" + listMaximo.get(0).getStrValor1() + "\",\"tasaabandonomes\" :\"" + listMaximo.get(0).getStrValor2() + 
						"\",\"residente\" :\"" + listMaximo.get(0).getStrValor3() + "\",\"noresidente\" :\"" + listMaximo.get(0).getStrValor4() + "\",\"timedia\" :\"" + listMaximo.get(0).getStrValor5() + 
						"\",\"timemes\" :\"" + listMaximo.get(0).getStrValor6() + "\", slaTasaAbandono : \"" + listMaximo.get(0).getStrValor7() + "\",\" slaTiempoRespuestaResidente : \"" + listMaximo.get(0).getStrValor8() + 
						"\",\"slaTiempoRespuestaNoResidente\" :\"" + listMaximo.get(0).getStrValor9() + "\",\"slaTiempoConversacion\" :\"" + listMaximo.get(0).getStrValor10() + "\"}]}");
			}
			else{
				strJson1.append("{\"cisco\": [{\"tasaabandonodia\":\"0\",\"tasaabandonomes\" :\"0\"" + 
						",\"residente\" :\"0\",\"noresidente\" :\"0\",\"timedia\" :\"0\"" + 
						",\"timemes\" :\"0\"}]}");
			}
		}
			catch(Exception ex){
				System.out.println(ex);
				strJson1 = new StringBuilder();
				strJson1.append("error");
			}
			out.print(strJson1);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	public void listBacklogGSP(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		StringBuilder strJson3 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			BusinessMaximoWH objBusinessMaximoWH = new BusinessMaximoWH();
			List<BeanMaximo> listMaximo = null;
			
			String strTxtInicio = (req.getParameter("ptxtInicio") == null ? "0" : req.getParameter("ptxtInicio"));
			String strTxtFin = (req.getParameter("ptxtFin") == null ? "0" : req.getParameter("ptxtFin"));
			String strCboTipoTickets = (req.getParameter("pcboTipoTickets") == null ? "0" : req.getParameter("pcboTipoTickets"));
			String strClase = (req.getParameter("pcboClase") == null ? "0" : req.getParameter("pcboClase"));
			String strFuente = (req.getParameter("pcboFuente") == null ? "0" : req.getParameter("pcboFuente"));
			String strGrupoPropietario = (req.getParameter("pcboGrupoPropietario") == null ? "0" : req.getParameter("pcboGrupoPropietario"));
			String strGrupoResolutor = (req.getParameter("pcboGrupoResolutor") == null ? "0" : req.getParameter("pcboGrupoResolutor"));
			String strTeam = (req.getParameter("pteam") == null ? "0" : req.getParameter("pteam"));
			
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrdateE("'" + strTxtInicio + "'");
			objBeanParameters.setStrdateS("'" + strTxtFin + "'");
			
			if(strCboTipoTickets.toLowerCase().contains("0") || (strCboTipoTickets.toLowerCase().contains("backlog") && strCboTipoTickets.toLowerCase().contains("resueltos"))){
				objBeanParameters.setStrBackLog("1");
				objBeanParameters.setStrResueltos("1");
			}
			if(strCboTipoTickets.toLowerCase().contains("backlog")){
				objBeanParameters.setStrBackLog("1");
			}
			if(strCboTipoTickets.toLowerCase().contains("resueltos")){
				objBeanParameters.setStrResueltos("1");
			}
			
			objBeanParameters.setStrValor1((strClase.equals("0") || strClase == null || strClase.toLowerCase().contains("todos") ? null : "'" + strClase.replaceAll(",", "','") + "'"));
			objBeanParameters.setStrValor2((strFuente.equals("0") || strFuente == null || strFuente.toLowerCase().contains("todos") ? null : "'" + strFuente.replaceAll(",", "','") + "'"));
			objBeanParameters.setStrValor3((strGrupoPropietario.equals("0") || strGrupoPropietario == null || strGrupoPropietario.toLowerCase().contains("todos") ? null : "'" + strGrupoPropietario.replaceAll(",", "','") + "'"));
			objBeanParameters.setStrValor4((strGrupoResolutor.equals("0") || strGrupoResolutor == null || strGrupoResolutor.toLowerCase().contains("todos") ? null : "'" + strGrupoResolutor.replaceAll(",", "','") + "'"));
			
			BusinessOptions objBusinessOption = new BusinessOptions();
			
			listMaximo = objBusinessMaximoWH.getBacklogGSP(objBeanParameters, ssf);
			strJson1.append("{\"backlogGSP\" : [");
			if(listMaximo != null){
				if(listMaximo.size() > 0){
					String strClass = "";
					ArrayList<String> arrGrupo = new ArrayList<String>();
					int count = 0;
					strClass = listMaximo.get(0).getTicketClass();
					arrGrupo.add(listMaximo.get(0).getTicketClass());
					for(int i = 0 ; i < listMaximo.size() ; i++){
						if(!strClass.equals(listMaximo.get(i).getTicketClass())){
							if(!arrGrupo.contains(listMaximo.get(i).getTicketClass()))
								arrGrupo.add(listMaximo.get(i).getTicketClass());
						}
					}
					
					count = 0;
					for(int i = 0 ; i < arrGrupo.size() ; i++){
						strClass = arrGrupo.get(i);
						strJson1.append("{\"class\": [");
						for(int j = 0 ; j < listMaximo.size() ; j++){
							if(strClass.equals(listMaximo.get(j).getTicketClass())){
//								List<BeanOptions> listOptions = new ArrayList<BeanOptions>();
//								listOptions = ;
								strJson1.append("{");
								strJson1.append("\"strClass\" :\"" + listMaximo.get(j).getTicketClass() + "\",");
								strJson1.append("\"strGrupo\" :\"" + (listMaximo.get(j).getTicketGrupoResolutor().equals("SIN ASIGNAR") ? listMaximo.get(j).getTicketGrupoResolutor() : objBusinessOption.listOptions3(new BeanParameters(listMaximo.get(j).getTicketGrupoResolutor(),"GRUPOPROPIETARIO_ALERTA",Integer.parseInt(strTeam)), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf")).get(0).getStrDescripcion())  + "\",");
								strJson1.append("\"strValor1\" :\"" + listMaximo.get(j).getStrValor1() + "\",");
								strJson1.append("\"strValor2\" :\"" + listMaximo.get(j).getStrValor2() + "\",");
								strJson1.append("\"strValor3\" :\"" + listMaximo.get(j).getStrValor3() + "\",");
								strJson1.append("\"strValor4\" :\"" + listMaximo.get(j).getStrValor4() + "\"");
								strJson1.append("},");
							}
						}
						strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
						strJson1 = new StringBuilder();
					}
				}
			}else
				strJson2.append(",");
			strJson3.append(strJson2.substring(0, strJson2.length() - 1) + "],");
			
			strJson1 = new StringBuilder();
			strJson2 = new StringBuilder();
			
			strJson1.append("\"backlogGSPChart\" : [");
			if(listMaximo != null){
				if(listMaximo.size() > 0){
					String strClass = "";
					ArrayList<String> arrGrupo = new ArrayList<String>();
					int count = 0;
					strClass = listMaximo.get(0).getTicketClass();
					arrGrupo.add(listMaximo.get(0).getTicketClass());
					for(int i = 0 ; i < listMaximo.size() ; i++){
						if(!strClass.equals(listMaximo.get(i).getTicketClass())){
							if(!arrGrupo.contains(listMaximo.get(i).getTicketClass()))
								arrGrupo.add(listMaximo.get(i).getTicketClass());
						}
					}
					
					
					DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					Date date = new Date();
					String fecha = dateFormat.format(date);
					
					strJson1.append("{\"title\": {\"text\": \"BackLog Cliente GSP\",\"subtext\": \"backlog a la fecha " + fecha + "\"}," +
							"\"tooltip\": {\"trigger\": \"axis\", \"axisPointer\": {\"type\": \"shadow\"}},\"toolbox\": {\"show\" : true," +
							"\"feature\" : {\"dataView\" : {\"show\": true, \"readOnly\": false},\"magicType\" : {\"show\": true, \"type\": [\"line\", \"bar\"]}" + 
							",\"restore\" : {\"show\": true},\"saveAsImage\" : {\"show\": true}}},\"legend\": {\"data\": [");
					for(int i = 0 ; i < arrGrupo.size() ; i++){
						if(i == 0)
							strJson1.append("\"" + arrGrupo.get(i) + "\"");
						else
							strJson1.append(",\"" + arrGrupo.get(i) + "\"");
					}
					strJson1.append("]},\"grid\": {\"left\": \"3%\",\"right\": \"4%\",\"bottom\": \"3%\",\"containLabel\": true},\"xAxis\": {" + 
							"\"type\": \"value\",\"boundaryGap\": [0, 0.01]},\"yAxis\": {\"type\": \"category\",\"data\": [");
						strJson1.append("\"BackLog\"");
					strJson1.append("]},\"series\": [");
					
					count = 0;
					for(int i = 0 ; i < arrGrupo.size() ; i++){
						strClass = arrGrupo.get(i);
						strJson1.append("{");
						strJson1.append("\"name\" :\"" + strClass + "\",");
						strJson1.append("\"type\" :\"bar\",");
						for(int j = 0 ; j < listMaximo.size() ; j++){
							if(strClass.equals(listMaximo.get(j).getTicketClass())){
								count = (count + Integer.parseInt(listMaximo.get(j).getStrValor1()) + Integer.parseInt(listMaximo.get(j).getStrValor2()) + Integer.parseInt(listMaximo.get(j).getStrValor3()) + Integer.parseInt(listMaximo.get(j).getStrValor4()));
							}
						}
						strJson1.append("\"data\" :[" + count + "],");
						count = 0;
						strJson1.append("\"label\":{\"normal\":{\"show\" : true,\"position\" : \"right\"},\"emphasis\":{\"show\" : true,\"position\" : [10, 10]}}},");
					}
				}
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
			}else
				strJson2.append(",");
			strJson3.append(strJson2.substring(0, strJson2.length() - 1) + "]}");
			
		}
		catch(Exception ex){
			System.out.println(ex);
			strJson2 = new StringBuilder();
			strJson2.append("e	rror");
		}
		out.print(strJson3);
	}

	
public void listPaises(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		StringBuilder strJson3 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			BusinessMaximoWH objBusinessMaximoWH = new BusinessMaximoWH();
			List<BeanMaximo> listMaximo = null;
			
			String strTxtInicio = (req.getParameter("ptxtInicio") == null ? "0" : req.getParameter("ptxtInicio"));
			String strTxtFin = (req.getParameter("ptxtFin") == null ? "0" : req.getParameter("ptxtFin"));
			String strCboTipoTickets = (req.getParameter("pcboTipoTickets") == null ? "0" : req.getParameter("pcboTipoTickets"));
			String strClase = (req.getParameter("pcboClase") == null ? "0" : req.getParameter("pcboClase"));
			String strFuente = (req.getParameter("pcboFuente") == null ? "0" : req.getParameter("pcboFuente"));
			String strGrupoPropietario = (req.getParameter("pcboGrupoPropietario") == null ? "0" : req.getParameter("pcboGrupoPropietario"));
			String strGrupoResolutor = (req.getParameter("pcboGrupoResolutor") == null ? "0" : req.getParameter("pcboGrupoResolutor"));
			
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrdateE("'" + strTxtInicio + "'");
			objBeanParameters.setStrdateS("'" + strTxtFin + "'");
			
			if(strCboTipoTickets.toLowerCase().contains("0") || (strCboTipoTickets.toLowerCase().contains("backlog") && strCboTipoTickets.toLowerCase().contains("resueltos"))){
				objBeanParameters.setStrBackLog("1");
				objBeanParameters.setStrResueltos("1");
			}
			if(strCboTipoTickets.toLowerCase().contains("backlog")){
				objBeanParameters.setStrBackLog("1");
			}
			if(strCboTipoTickets.toLowerCase().contains("resueltos")){
				objBeanParameters.setStrResueltos("1");
			}
			
			objBeanParameters.setStrValor1((strClase.equals("0") || strClase == null || strClase.toLowerCase().contains("todos") ? null : "'" + strClase.replaceAll(",", "','") + "'"));
			objBeanParameters.setStrValor2((strFuente.equals("0") || strFuente == null || strFuente.toLowerCase().contains("todos") ? null : "'" + strFuente.replaceAll(",", "','") + "'"));
			objBeanParameters.setStrValor3((strGrupoPropietario.equals("0") || strGrupoPropietario == null || strGrupoPropietario.toLowerCase().contains("todos") ? null : "'" + strGrupoPropietario.replaceAll(",", "','") + "'"));
			objBeanParameters.setStrValor4((strGrupoResolutor.equals("0") || strGrupoResolutor == null || strGrupoResolutor.toLowerCase().contains("todos") ? null : "'" + strGrupoResolutor.replaceAll(",", "','") + "'"));
			
			listMaximo = objBusinessMaximoWH.getPaises(objBeanParameters, ssf);
			strJson1.append("{\"paises\" : [");
			
			if(listMaximo != null){
				if(listMaximo.size() > 0){
					for(BeanMaximo item : listMaximo){
						strJson1.append("{\"");
						strJson1.append("pais\" : \"" + item.getStrValor1() + "\",");
						strJson1.append("\"cantidad\" : \"" + item.getiCantidad() + "\"");
						strJson1.append("},");
					}
				} else {
					strJson1.append(",");
				}
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
				strJson3 = strJson2;
				
				strJson1 = new StringBuilder();
				strJson2 = new StringBuilder();
				strJson1.append("\"dataPaises\" : {\"labels\":[");
				if(listMaximo.size() > 0){
					for(BeanMaximo item : listMaximo){
						strJson1.append("\"" + item.getStrValor1() + "\",");
					}
				}
				else{
					strJson1.append(",");
				}
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
				
				strJson1 = new StringBuilder();
				strJson1.append("\"datasets\": [{\"label\":\"Paises\",\"backgroundColor\":[");
				
				if(listMaximo.size() > 0){
					for(int i = 0 ; i < listMaximo.size() ; i++){
						if(i%2 == 0)
							strJson1.append("\"rgba(230, 81, 0, 0.8)\",");
						else
							strJson1.append("\"rgba(60, 141, 188, 0.8)\",");
					}
				}
				else{
					strJson1.append(",");
				}
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
				
				strJson1 = new StringBuilder();
				strJson1.append("\"borderColor\":[");
				
				if(listMaximo.size() > 0){
					for(int i = 0 ; i < listMaximo.size() ; i++){
						if(i%2 == 0)
							strJson1.append("\"rgba(153, 102, 255, 1)\",");
						else
							strJson1.append("\"rgba(255, 159, 64, 1)\",");
					}
				}
				else{
					strJson1.append(",");
				}
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],\"borderWidth\": 1,");
				
				strJson1 = new StringBuilder();
				strJson1.append("\"data\":[");
				
				if(listMaximo.size() > 0){
					for(BeanMaximo item : listMaximo){
							strJson1.append("" + item.getiCantidad() + ",");
					}
				}
				else{
					strJson1.append(",");
				}
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}");
			}
			else{
				strJson1.append(",");
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]");
			}
			strJson3.append(strJson2.toString() + "}");
		}
		catch(Exception ex){
			System.out.println(ex);
			strJson3 = new StringBuilder();
			strJson3.append("error");
		}
		out.print(strJson3);
	}

public void listClientes(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
	
	StringBuilder strJson1 = new StringBuilder();
	StringBuilder strJson2 = new StringBuilder();
	StringBuilder strJson3 = new StringBuilder();
	
	res.setCharacterEncoding("UTF-8");
	PrintWriter out = res.getWriter();
	
	try{
		BusinessMaximoWH objBusinessMaximoWH = new BusinessMaximoWH();
		List<BeanMaximo> listMaximo = null;
		
		
		String strTxtInicio = (req.getParameter("ptxtInicio") == null ? "0" : req.getParameter("ptxtInicio"));
		String strTxtFin = (req.getParameter("ptxtFin") == null ? "0" : req.getParameter("ptxtFin"));
		String strCboTipoTickets = (req.getParameter("pcboTipoTickets") == null ? "0" : req.getParameter("pcboTipoTickets"));
		String strClase = (req.getParameter("pcboClase") == null ? "0" : req.getParameter("pcboClase"));
		String strFuente = (req.getParameter("pcboFuente") == null ? "0" : req.getParameter("pcboFuente"));
		String strGrupoPropietario = (req.getParameter("pcboGrupoPropietario") == null ? "0" : req.getParameter("pcboGrupoPropietario"));
		String strGrupoResolutor = (req.getParameter("pcboGrupoResolutor") == null ? "0" : req.getParameter("pcboGrupoResolutor"));
		String strPais = (req.getParameter("ptipo") == null ? "0" : req.getParameter("ptipo"));
		
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setStrdateE("'" + strTxtInicio + "'");
		objBeanParameters.setStrdateS("'" + strTxtFin + "'");
		
		if(strCboTipoTickets.toLowerCase().contains("0") || (strCboTipoTickets.toLowerCase().contains("backlog") && strCboTipoTickets.toLowerCase().contains("resueltos"))){
			objBeanParameters.setStrBackLog("1");
			objBeanParameters.setStrResueltos("1");
		}
		if(strCboTipoTickets.toLowerCase().contains("backlog")){
			objBeanParameters.setStrBackLog("1");
		}
		if(strCboTipoTickets.toLowerCase().contains("resueltos")){
			objBeanParameters.setStrResueltos("1");
		}
		
		objBeanParameters.setStrValor1((strClase.equals("0") || strClase == null || strClase.toLowerCase().contains("todos") ? null : "'" + strClase.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor2((strFuente.equals("0") || strFuente == null || strFuente.toLowerCase().contains("todos") ? null : "'" + strFuente.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor3((strGrupoPropietario.equals("0") || strGrupoPropietario == null || strGrupoPropietario.toLowerCase().contains("todos") ? null : "'" + strGrupoPropietario.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor4((strGrupoResolutor.equals("0") || strGrupoResolutor == null || strGrupoResolutor.toLowerCase().contains("todos") ? null : "'" + strGrupoResolutor.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor5((strPais.equals("0") || strPais == null || strPais.toLowerCase().contains("todos") ? null : (strPais.equals("PERU") ? "'-PE-'" : (strPais.equals("INDIA") ? "'-IN-'" : null))));
		
		
		
//		String strPeriodoInicio = req.getParameter("ptxtInicio");
//		String strPeriodoFin = req.getParameter("ptxtFin");
//		String strGrupoEvaluacionTotal = req.getParameter("pcboGrupoPropietario");
//		String strcboFuente = req.getParameter("pcboFuente") == null ? "0" : req.getParameter("pcboFuente");
//		String strTipo = req.getParameter("ptipo");
		
//		BeanParameters objBeanParameters = new BeanParameters();
//		objBeanParameters.setStrdateE(strPeriodoInicio);
//		objBeanParameters.setStrdateS(strPeriodoFin);
//		objBeanParameters.setStrValor1("'" + strGrupoEvaluacionTotal.replace(",", "','") + "'");
//		objBeanParameters.setStrValor2(strTipo != null && strTipo.length() > 0  ? "" + strTipo.replace(",", "','").substring(0, 2) : null);
//		objBeanParameters.setStrValor3(strcboFuente.equals("0") || strcboFuente == null ? null : "'" + strcboFuente.replace(",", "','") + "'");
		
		listMaximo = objBusinessMaximoWH.getClientes(objBeanParameters, ssf);
		strJson1.append("{\"clientes\" : [");
		
		if(listMaximo.size() > 0){
			for(BeanMaximo item : listMaximo){
				strJson1.append("{\"");
				strJson1.append("cliente\" : \"" + item.getStrValor1() + "\",");
				strJson1.append("\"cantidad\" : \"" + item.getiCantidad() + "\"");
				strJson1.append("},");
			}
		} else {
			strJson1.append(",");
			}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
		strJson3 = strJson2;
		

		strJson1 = new StringBuilder();
		strJson2 = new StringBuilder();
		
		
		strJson1.append("\"dataClientes\" : {\"title\":{\"text\":\"Tickets generado por clientes\"}, \"toolbox\": {\"show\" : true,\"feature\" : {\"mark\" : {\"show\": true},\"dataView\" : {\"show\": true, \"readOnly\": false},\"restore\" : {\"show\": true},\"saveAsImage\" : {\"show\": true}}},\"tooltip\":{\"show\":true},\"series\": [ {\"name\":\"Tickets generado por clientes\",\"type\": \"wordCloud\",\"size\": [\"100%\", \"100%\"],\"textRotation\": [0, 45, 90, -45],\"textPadding\": 0,\"autoSize\": {\"enable\":true,\"minSize\":16},");
//		strJson1.append("\"dataClientes\" : {\"title\":{\"text\":\"Tickets generado por clientes\"}, \"tooltip\":{\"show\":true},\"series\": [ {\"name\":\"Tickets generado por clientes\",\"type\": \"wordCloud\",\"size\": [\"100%\", \"100%\"],\"textRotation\": [0, 45, 90, -45],\"textPadding\": 0,\"autoSize\": {\"enable\":true,\"minSize\":16},");
		strJson1.append("\"data\": [");

		if(listMaximo.size() > 0){
			for(int i = 0 ; i < listMaximo.size() ; i++){
				if(i == 0)
					strJson1.append("{\"name\":\"" + listMaximo.get(i).getStrValor1() + "\",\"value\":" + listMaximo.get(i).getiCantidad() + ",\"itemStyle\": {\"normal\": {\"color\": \"black\",\"fontSize\": 500}}},");
				else
					strJson1.append("{\"name\":\"" + listMaximo.get(i).getStrValor1() + "\",\"value\":" + listMaximo.get(i).getiCantidad() + ",\"itemStyle\": " + createRandomItemStyle() + ",\"fontSize\": 500},");
			}
		}
		else{
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}");
		strJson3.append(strJson2.toString() + "}");
		
	}
	catch(Exception ex){
		System.out.println(ex);
		strJson3 = new StringBuilder();
		strJson3.append("error");
	}
	out.print(strJson3);
}

public void listFrecuencia(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
	
	StringBuilder strJson1 = new StringBuilder();
	StringBuilder strJson2 = new StringBuilder();
	
	res.setCharacterEncoding("UTF-8");
	PrintWriter out = res.getWriter();
	
	try{
		BusinessMaximoWH objBusinessMaximoWH = new BusinessMaximoWH();
		List<BeanMaximo> listMaximo = null;
		
		String strTxtInicio = (req.getParameter("ptxtInicio") == null ? "0" : req.getParameter("ptxtInicio"));
		String strTxtFin = (req.getParameter("ptxtFin") == null ? "0" : req.getParameter("ptxtFin"));
		String strCboTipoTickets = (req.getParameter("pcboTipoTickets") == null ? "0" : req.getParameter("pcboTipoTickets"));
		String strClase = (req.getParameter("pcboClase") == null ? "0" : req.getParameter("pcboClase"));
		String strFuente = (req.getParameter("pcboFuente") == null ? "0" : req.getParameter("pcboFuente"));
		String strGrupoPropietario = (req.getParameter("pcboGrupoPropietario") == null ? "0" : req.getParameter("pcboGrupoPropietario"));
		String strGrupoResolutor = (req.getParameter("pcboGrupoResolutor") == null ? "0" : req.getParameter("pcboGrupoResolutor"));
		String strCliente = (req.getParameter("ptipo") == null ? "0" : req.getParameter("ptipo"));
		
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setStrdateE("'" + strTxtInicio + "'");
		objBeanParameters.setStrdateS("'" + strTxtFin + "'");
		
		if(strCboTipoTickets.toLowerCase().contains("0") || (strCboTipoTickets.toLowerCase().contains("backlog") && strCboTipoTickets.toLowerCase().contains("resueltos"))){
			objBeanParameters.setStrBackLog("1");
			objBeanParameters.setStrResueltos("1");
		}
		if(strCboTipoTickets.toLowerCase().contains("backlog")){
			objBeanParameters.setStrBackLog("1");
		}
		if(strCboTipoTickets.toLowerCase().contains("resueltos")){
			objBeanParameters.setStrResueltos("1");
		}
		
		objBeanParameters.setStrValor1((strClase.equals("0") || strClase == null || strClase.toLowerCase().contains("todos") ? null : "'" + strClase.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor2((strFuente.equals("0") || strFuente == null || strFuente.toLowerCase().contains("todos") ? null : "'" + strFuente.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor3((strGrupoPropietario.equals("0") || strGrupoPropietario == null || strGrupoPropietario.toLowerCase().contains("todos") ? null : "'" + strGrupoPropietario.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor4((strGrupoResolutor.equals("0") || strGrupoResolutor == null || strGrupoResolutor.toLowerCase().contains("todos") ? null : "'" + strGrupoResolutor.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor5((strCliente.equals("0") || strCliente == null || strCliente.toLowerCase().contains("todos") ? null : "'" + strCliente.replaceAll(",", "','") + "'"));
		
		listMaximo = objBusinessMaximoWH.getMensual(objBeanParameters, ssf);
		strJson1.append("{\"frecuencias\" : [");
			
		if(listMaximo.size() > 0){
			for(BeanMaximo item : listMaximo){
				strJson1.append("{\"");
				strJson1.append("frecuencia\" : \"" + item.getStrValor1() + "\",");
				strJson1.append("\"cantidad\" : \"" + item.getiCantidad() + "\"");
				strJson1.append("},");
			}
		} else {
			strJson1.append(",");
			}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
		
		strJson1 = new StringBuilder();
		strJson1.append("\"dataFrecuencia\" : {\"labels\":[\"0\",");
		if(listMaximo.size() > 0){
			for(BeanMaximo item : listMaximo){
				strJson1.append("\"" + item.getStrValor1() + "\",");
				}
			}
//		else
//			strJson1.append(",");
		
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
		
		strJson1 = new StringBuilder();
		strJson1.append("\"datasets\": [");
		strJson1.append("{\"label\":\"Frecuencias\",\"backgroundColor\":\"#D32F2F\",\"fill\": false,");
		strJson1.append("\"data\":[0");
		if(listMaximo.size() > 0){
			for(BeanMaximo item : listMaximo){
					strJson1.append("," + item.getiCantidad());
			}
			strJson1.append(",");
		}
		else
			strJson1.append(",");

		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
		
		strJson1 = new StringBuilder();
		strJson1.append("\"yAxisID\": \"y-axis-1\",");
		
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "}]},");
		
		listMaximo = objBusinessMaximoWH.getEstados(objBeanParameters, ssf);
		
		strJson1 = new StringBuilder();
		strJson1.append("\"estados\":{\"datasets\": [");
		strJson1.append("{\"label\":\"Estados Tickets\",\"backgroundColor\":[");
		if(listMaximo.size() > 0){
			for(int i = 0; i < listMaximo.size() ; i++){
				if(i%2 == 0)
					strJson1.append("\"rgba(153, 102, 255, 1)\",");
				else
					strJson1.append("\"rgba(255, 159, 64, 1)\",");
			}
		}
		else
			strJson1.append(",");
		
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
		
		strJson1 = new StringBuilder();
		strJson1.append("\"data\":[");
		if(listMaximo.size() > 0){
			for(BeanMaximo item : listMaximo){
				strJson1.append(item.getiCantidad() + ",");
			}
		}
		else
			strJson1.append(",");
		
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}],");
		strJson1 = new StringBuilder();
		strJson1.append("\"labels\":[");
		if(listMaximo.size() > 0){
			for(BeanMaximo item : listMaximo){
				strJson1.append("\"" + item.getStrValor1() + "\",");
			}
		}
		else
			strJson1.append(",");
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}}");

	}
	catch(Exception ex){
		System.out.println(ex);
		strJson2 = new StringBuilder();
		strJson2.append("error");
	}
	out.print(strJson2);
}

public String createRandomItemStyle() {
	String strRandom = "";
	strRandom = "{\"normal\":{\"color\":\"rgb(" + Math.round(Math.random() * 160) + "," + Math.round(Math.random() * 160) + "," + Math.round(Math.random() * 160) + ")\"}}";
	return strRandom;
};

public void getTendenciaActual(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
	
	StringBuilder strJson1 = new StringBuilder();
	StringBuilder strJson2 = new StringBuilder();
	
	StringBuilder strJson01 = new StringBuilder();
	StringBuilder strJson02 = new StringBuilder();
	StringBuilder strJson03 = new StringBuilder();
	StringBuilder strJson04 = new StringBuilder();
	StringBuilder strJson05 = new StringBuilder();
	StringBuilder strJson06 = new StringBuilder();
	
	res.setCharacterEncoding("UTF-8");
	PrintWriter out = res.getWriter();
	
	try{
		BusinessMaximoWH objBusinessMaximoWH = new BusinessMaximoWH();
		List<BeanMaximo> listMaximo = null;
		
		String strTxtInicio = (req.getParameter("ptxtInicio") == null ? "0" : req.getParameter("ptxtInicio"));
		String strTxtFin = (req.getParameter("ptxtFin") == null ? "0" : req.getParameter("ptxtFin"));
		String strCboTipoTickets = (req.getParameter("pcboTipoTickets") == null ? "0" : req.getParameter("pcboTipoTickets"));
		String strClase = (req.getParameter("pcboClase") == null ? "0" : req.getParameter("pcboClase"));
		String strFuente = (req.getParameter("pcboFuente") == null ? "0" : req.getParameter("pcboFuente"));
		String strGrupoPropietario = (req.getParameter("pcboGrupoPropietario") == null ? "0" : req.getParameter("pcboGrupoPropietario"));
		String strGrupoResolutor = (req.getParameter("pcboGrupoResolutor") == null ? "0" : req.getParameter("pcboGrupoResolutor"));
//		String strCliente = (req.getParameter("ptipo") == null ? "0" : req.getParameter("ptipo"));
		
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setStrdateE("'" + strTxtInicio + "'");
		objBeanParameters.setStrdateS("'" + strTxtFin + "'");
		
		if(strCboTipoTickets.toLowerCase().contains("0") || (strCboTipoTickets.toLowerCase().contains("backlog") && strCboTipoTickets.toLowerCase().contains("resueltos"))){
			objBeanParameters.setStrBackLog("1");
			objBeanParameters.setStrResueltos("1");
		}
		if(strCboTipoTickets.toLowerCase().contains("backlog")){
			objBeanParameters.setStrBackLog("1");
		}
		if(strCboTipoTickets.toLowerCase().contains("resueltos")){
			objBeanParameters.setStrResueltos("1");
		}
		
		objBeanParameters.setStrValor1((strClase.equals("0") || strClase == null || strClase.toLowerCase().contains("todos") ? null : "'" + strClase.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor2((strFuente.equals("0") || strFuente == null || strFuente.toLowerCase().contains("todos") ? null : "'" + strFuente.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor3((strGrupoPropietario.equals("0") || strGrupoPropietario == null || strGrupoPropietario.toLowerCase().contains("todos") ? null : "'" + strGrupoPropietario.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor4((strGrupoResolutor.equals("0") || strGrupoResolutor == null || strGrupoResolutor.toLowerCase().contains("todos") ? null : "'" + strGrupoResolutor.replaceAll(",", "','") + "'"));
//		objBeanParameters.setStrValor5((strCliente.equals("0") || strCliente == null || strCliente.toLowerCase().contains("todos") ? null : "'" + strCliente.replaceAll(",", "','") + "'"));
		
		
		
		
//		String strPeriodoInicio = req.getParameter("ptxtInicio");
//		String strPeriodoFin = req.getParameter("ptxtFin");
//		String strGrupoEvaluacionTotal = req.getParameter("pcboGrupoPropietario");
//		String strcboFuente = req.getParameter("pcboFuente") == null ? "0" : req.getParameter("pcboFuente");
		String strTipo = req.getParameter("ptipo");
		String strLabels = "";
		String strLabelsOriginal = "";
		String strLabelsValidar = "";
//		
//		BeanParameters objBeanParameters = new BeanParameters();
//		objBeanParameters.setStrdateE(strPeriodoInicio);
//		objBeanParameters.setStrdateS(strPeriodoFin);
//		objBeanParameters.setStrValor1("'" + strGrupoEvaluacionTotal.replace(",", "','") + "'");
//		objBeanParameters.setStrValor3(strcboFuente.equals("0") || strcboFuente == null ? null : "'" + strcboFuente.replace(",", "','") + "'");
//		//objBeanParameters.setStrValor2(strTipo != null && strTipo.length() > 0  ? "" + strTipo.replace(",", "','").substring(0, 2) : null);
		
		listMaximo = objBusinessMaximoWH.getTendenciaActual(objBeanParameters, ssf);
		if(listMaximo.size() > 0){
			String[] arrayGrupo = strGrupoPropietario.split(",");
			
//			strJson01.append("{\"label\":\"" + arrayGrupo[0] + "\",\"fill\": false,\"backgroundColor\": \"#1565C0\",\"borderColor\": \"#1565C0\",\"data\": [0");
//			strJson02.append("{\"label\":\"" + arrayGrupo[1] + "\",\"fill\": false,\"backgroundColor\": \"#00897B\",\"borderColor\": \"#00897B\",\"borderDash\": [3, 3],\"data\": [0");
//			strJson03.append("{\"label\":\"" + arrayGrupo[2] + "\",\"fill\": false,\"backgroundColor\": \"#F44336\",\"borderColor\": \"#F44336\",\"data\": [0");
//			strJson04.append("{\"label\":\"" + arrayGrupo[3] + "\",\"fill\": false,\"backgroundColor\": \"#00397B\",\"borderColor\": \"#00397B\",\"borderDash\": [3, 3],\"data\": [0");
			
			for(int i = 0; i < arrayGrupo.length ; i++){
				switch (i) {
				case 0:
					strJson01.append("{\"label\":\"" + arrayGrupo[i] + "\",\"fill\": false,\"backgroundColor\": \"#1565C0\",\"borderColor\": \"#1565C0\",\"data\": [0");
					break;
				case 1:
					strJson02.append("{\"label\":\"" + arrayGrupo[i] + "\",\"fill\": false,\"backgroundColor\": \"#00897B\",\"borderColor\": \"#00897B\",\"borderDash\": [3, 3],\"data\": [0");
					break;
				case 2:
					strJson03.append("{\"label\":\"" + arrayGrupo[i] + "\",\"fill\": false,\"backgroundColor\": \"#F44336\",\"borderColor\": \"#F44336\",\"data\": [0");
					break;
				case 3:
					strJson04.append("{\"label\":\"" + arrayGrupo[i] + "\",\"fill\": false,\"backgroundColor\": \"#00397B\",\"borderColor\": \"#00397B\",\"borderDash\": [3, 3],\"data\": [0");
					break;
				case 4:
					strJson05.append("{\"label\":\"" + arrayGrupo[i] + "\",\"fill\": false,\"backgroundColor\": \"#1565C0\",\"borderColor\": \"#1565C0\",\"data\": [0");
					break;
				case 5:
					strJson06.append("{\"label\":\"" + arrayGrupo[i] + "\",\"fill\": false,\"backgroundColor\": \"#1565C0\",\"borderColor\": \"#1565C0\",\"data\": [0");
					break;
				default:
					break;
				}
			}
			
			strJson1.append("{\"tendenciaActual\" : {\"type\": \"line\", \"data\": {\"labels\": [\"0\",");
			
			if(listMaximo.size() > 0){
				strLabels = "\"" + listMaximo.get(0).getStrValor1().trim() + "\"";
				strLabelsOriginal = "" + listMaximo.get(0).getStrValor1().trim();
				strLabelsValidar = listMaximo.get(0).getStrValor1().trim();
				for(BeanMaximo item : listMaximo){
					if(!item.getStrValor1().equals(strLabelsValidar.trim())){
						strLabels = strLabels + ",\"" + item.getStrValor1() + "\"";
						strLabelsOriginal = strLabelsOriginal + "," + item.getStrValor1();
						strLabelsValidar = item.getStrValor1();
					}
				}
				strJson1.append(strLabels + ",");
			} else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			strJson1 = new StringBuilder();
			String[] arrayLabel = strLabelsOriginal.split(",");
			int indicador = 0;
			
			strJson1.append("\"datasets\": [");
			if(listMaximo.size() > 0){
				for(int i = 0 ; i < listMaximo.size() ; i++){
					for(int j = 0 ; j < arrayLabel.length ; j++){
						
						if(listMaximo.get(i).getStrValor1().equals(arrayLabel[j])){
							switch (arrayGrupo.length) {
							case 1:
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[0])){
									strJson01.append("," + listMaximo.get(i).getiCantidad());
									indicador = 1;
								}
								break;
							case 2:
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[0])){
									strJson01.append("," + listMaximo.get(i).getiCantidad());
									indicador = 1;
								}
									
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[1])){
									strJson02.append("," + listMaximo.get(i).getiCantidad());
									indicador = 2;
								}
								break;
							case 3:
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[0])){
									strJson01.append("," + listMaximo.get(i).getiCantidad());
									indicador = 1;
								}
									
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[1])){
									strJson02.append("," + listMaximo.get(i).getiCantidad());
									indicador = 2;
								}
									
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[2])){
									strJson03.append("," + listMaximo.get(i).getiCantidad());
									indicador = 3;
								}
								break;
							case 4:
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[0])){
									strJson01.append("," + listMaximo.get(i).getiCantidad());
									indicador = 1;
								}
									
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[1])){
									strJson02.append("," + listMaximo.get(i).getiCantidad());
									indicador = 2;
								}
									
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[2])){
									strJson03.append("," + listMaximo.get(i).getiCantidad());
									indicador = 3;
								}
									
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[3])){
									strJson04.append("," + listMaximo.get(i).getiCantidad());
									indicador = 4;
								}
								break;	
							case 5:
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[0])){
									strJson01.append("," + listMaximo.get(i).getiCantidad());
									indicador = 1;
								}
									
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[1])){
									strJson02.append("," + listMaximo.get(i).getiCantidad());
									indicador = 2;
								}
									
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[2])){
									strJson03.append("," + listMaximo.get(i).getiCantidad());
									indicador = 3;
								}
									
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[3])){
									strJson04.append("," + listMaximo.get(i).getiCantidad());
									indicador = 4;
								}
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[4])){
									strJson05.append("," + listMaximo.get(i).getiCantidad());
									indicador = 5;
								}
								break;
							case 6:
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[0])){
									strJson01.append("," + listMaximo.get(i).getiCantidad());
									indicador = 1;
								}
									
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[1])){
									strJson02.append("," + listMaximo.get(i).getiCantidad());
									indicador = 2;
								}
									
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[2])){
									strJson03.append("," + listMaximo.get(i).getiCantidad());
									indicador = 3;
								}
									
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[3])){
									strJson04.append("," + listMaximo.get(i).getiCantidad());
									indicador = 4;
								}
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[4])){
									strJson05.append("," + listMaximo.get(i).getiCantidad());
									indicador = 5;
								}
								if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[5])){
									strJson06.append("," + listMaximo.get(i).getiCantidad());
									indicador = 6;
								}
								break;
							default:
								break;
							}
							
							
//							if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[0])){
//								strJson01.append("," + listMaximo.get(i).getiCantidad());
//								indicador = 1;
//							}
//								
//							if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[1])){
//								strJson02.append("," + listMaximo.get(i).getiCantidad());
//								indicador = 2;
//							}
//								
//							if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[2])){
//								strJson03.append("," + listMaximo.get(i).getiCantidad());
//								indicador = 3;
//							}
//								
//							if(listMaximo.get(i).getStrValor2().equals(arrayGrupo[3])){
//								strJson04.append("," + listMaximo.get(i).getiCantidad());
//								indicador = 4;
//							}
								if(indicador > 0){
									if(indicador == 1){ 
										strJson02.append(",0");
										strJson03.append(",0");
										strJson04.append(",0");
										strJson05.append(",0");
										strJson06.append(",0");
									}else if(indicador == 2){ 
										strJson01.append(",0");
										strJson03.append(",0");
										strJson04.append(",0");
										strJson05.append(",0");
										strJson06.append(",0");
									}else if(indicador == 3){ 
										strJson01.append(",0");
										strJson02.append(",0");
										strJson04.append(",0");
										strJson05.append(",0");
										strJson06.append(",0");
									}else if(indicador == 4){ 
										strJson01.append(",0");
										strJson02.append(",0");
										strJson03.append(",0");
										strJson05.append(",0");
										strJson06.append(",0");
									}else if(indicador == 5){ 
										strJson01.append(",0");
										strJson02.append(",0");
										strJson03.append(",0");
										strJson04.append(",0");
										strJson06.append(",0");
									}else if(indicador == 6){ 
										strJson01.append(",0");
										strJson02.append(",0");
										strJson03.append(",0");
										strJson04.append(",0");
										strJson05.append(",0");
									}
									break;
								}
						}	
					}
				}


				switch (arrayGrupo.length) {
				case 1:
					strJson1.append(strJson01 + "]},");
					break;
				case 2:
					strJson1.append(strJson01 + "]},");
					strJson1.append(strJson02 + "]},");
					break;
				case 3:
					strJson1.append(strJson01 + "]},");
					strJson1.append(strJson02 + "]},");
					strJson1.append(strJson03 + "]},");
					break;
				case 4:
					strJson1.append(strJson01 + "]},");
					strJson1.append(strJson02 + "]},");
					strJson1.append(strJson03 + "]},");
					strJson1.append(strJson04 + "]},");
					break;
				case 5:
					strJson1.append(strJson01 + "]},");
					strJson1.append(strJson02 + "]},");
					strJson1.append(strJson03 + "]},");
					strJson1.append(strJson04 + "]},");
					strJson1.append(strJson05 + "]},");
					break;
				case 6:
					strJson1.append(strJson01 + "]},");
					strJson1.append(strJson02 + "]},");
					strJson1.append(strJson03 + "]},");
					strJson1.append(strJson04 + "]},");
					strJson1.append(strJson05 + "]},");
					strJson1.append(strJson06 + "]},");
					break;
				}
				
				
//				strJson1.append(strJson02 + "]},");
//				strJson1.append(strJson03 + "]},");
//				strJson1.append(strJson04 + "]},");
//				strJson1.append(strJson05 + "]},");
//				strJson1.append(strJson06 + "]},");
				
			} else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
			strJson1 = new StringBuilder();
			
			if(strTipo.equals("no"))
				strJson2.append("\"options\": {\"animation\": {\"duration\": 0},\"responsive\": true,\"title\":{\"display\":true,\"text\":\"Evolución de tickets\"},\"tooltips\": {\"mode\": \"index\",\"intersect\": false},\"hover\": {\"mode\": \"nearest\",\"intersect\": true},\"scales\": {\"xAxes\": [{\"display\": true,\"scaleLabel\": {\"display\": true}}],\"yAxes\": [{\"display\": true,\"scaleLabel\": {\"display\": true}}]}}");
			else
				strJson2.append("\"options\": {\"scaleOverride\" : true, \"responsive\": true,\"title\":{\"display\":true,\"text\":\"Evolución de tickets\"},\"tooltips\": {\"mode\": \"index\",\"intersect\": false},\"hover\": {\"mode\": \"nearest\",\"intersect\": true},\"scales\": {\"xAxes\": [{\"display\": true,\"scaleLabel\": {\"display\": true}}],\"yAxes\": [{\"display\": true,\"scaleLabel\": {\"display\": true}}]}}");
			
			strJson2.append("}}");
		}
		else{
 			strJson2.append("vacio");
		}
	}
	catch(Exception ex){
		System.out.println(ex);
		strJson2 = new StringBuilder();
		strJson2.append("error");
	}
	out.print(strJson2);
}

public void listTicketsPaises(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
	
	StringBuilder strJson1 = new StringBuilder();
	StringBuilder strJson2 = new StringBuilder();
	
	res.setCharacterEncoding("UTF-8");
	PrintWriter out = res.getWriter();
	
	try{
		BusinessMaximoWH objBusinessMaximoWH = new BusinessMaximoWH();
		List<BeanMaximo> listMaximo = null;
		
		String strPeriodoInicio = req.getParameter("ptxtInicio");
		String strPeriodoFin = req.getParameter("ptxtFin");
		String strGrupoEvaluacionTotal = req.getParameter("pcboGrupoPropietario");
		String strcboFuente = req.getParameter("pcboFuente") == null ? "0" : req.getParameter("pcboFuente");
		
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setStrdateE(strPeriodoInicio);
		objBeanParameters.setStrdateS(strPeriodoFin);
		objBeanParameters.setStrValor1("'" + strGrupoEvaluacionTotal.replace(",", "','") + "'");
		objBeanParameters.setStrValor3(strcboFuente.equals("0") || strcboFuente == null ? null : "'" + strcboFuente.replace(",", "','") + "'");
		
		listMaximo = objBusinessMaximoWH.getTicketsPaises(objBeanParameters, ssf);
		strJson1.append("{\"ticketsReporte\" : [");
		
		if(listMaximo.size() > 0){
			for(BeanMaximo item : listMaximo){
				strJson1.append("{");
				strJson1.append("\"pais\" : \"" + item.getTicketPais() + "\",");
				strJson1.append("\"ticket\" : \"" + item.getIdTicket() + "\",");
				strJson1.append("\"estado\" : \"" + item.getTicketEstado() + "\",");
				strJson1.append("\"cliente\" : \"" + item.getTicketCliente() + "\",");
				strJson1.append("\"titulo\" : \"" + item.getTicketTitulo().replace("\\", "/").replace("\n", "").replace("\"", "'") + "\",");
				strJson1.append("\"fecha\" : \"" + item.getTicketFechaCreacion() + "\"");
				strJson1.append("},");
			}
		} else {
			strJson1.append(",");
			}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
	}
	catch(Exception ex){
		System.out.println(ex);
		strJson2 = new StringBuilder();
		strJson2.append("error");
	}
	out.print(strJson2);
}

public void listTicketsClientes(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {

	StringBuilder strJson1 = new StringBuilder();
	StringBuilder strJson2 = new StringBuilder();
	
	res.setCharacterEncoding("UTF-8");
	PrintWriter out = res.getWriter();
	
	try{
		BusinessMaximoWH objBusinessMaximoWH = new BusinessMaximoWH();
		List<BeanMaximo> listMaximo = null;
		
		String strPeriodoInicio = req.getParameter("ptxtInicio");
		String strPeriodoFin = req.getParameter("ptxtFin");
		String strGrupoEvaluacionTotal = req.getParameter("pcboGrupoPropietario");
		String strcboFuente = req.getParameter("pcboFuente") == null ? "0" : req.getParameter("pcboFuente");
		
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setStrdateE(strPeriodoInicio);
		objBeanParameters.setStrdateS(strPeriodoFin);
		objBeanParameters.setStrValor1("'" + strGrupoEvaluacionTotal.replace(",", "','") + "'");
		objBeanParameters.setStrValor3(strcboFuente.equals("0") || strcboFuente == null ? null : "'" + strcboFuente.replace(",", "','") + "'");
		
		listMaximo = objBusinessMaximoWH.getTicketsClientes(objBeanParameters, ssf);
		strJson1.append("{\"ticketsReporte\" : [");
		
		if(listMaximo.size() > 0){
			for(BeanMaximo item : listMaximo){
				strJson1.append("{");
				strJson1.append("\"pais\" : \"" + item.getTicketPais() + "\",");
				strJson1.append("\"ticket\" : \"" + item.getIdTicket() + "\",");
				strJson1.append("\"estado\" : \"" + item.getTicketEstado() + "\",");
				strJson1.append("\"cliente\" : \"" + item.getTicketCliente() + "\",");
//				strJson1.append("\"titulo\" : \"" + item.getTicketTitulo() + "\",");
				strJson1.append("\"titulo\" : \"" + item.getTicketTitulo().replace("\\", "/").replace("\n", "").replace("\"", "'") + "\",");
				strJson1.append("\"fecha\" : \"" + item.getTicketFechaCreacion() + "\"");
				strJson1.append("},");
			}
		} else {
			strJson1.append(",");
			}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
	}
	catch(Exception ex){
		System.out.println(ex);
		strJson2 = new StringBuilder();
		strJson2.append("error");
	}
	out.print(strJson2);
}

public void listTicketsFrecuencia(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {

	StringBuilder strJson1 = new StringBuilder();
	StringBuilder strJson2 = new StringBuilder();
	
	res.setCharacterEncoding("UTF-8");
	PrintWriter out = res.getWriter();
	
	try{
		BusinessMaximoWH objBusinessMaximoWH = new BusinessMaximoWH();
		List<BeanMaximo> listMaximo = null;
		
		String strPeriodoInicio = req.getParameter("ptxtInicio");
		String strPeriodoFin = req.getParameter("ptxtFin");
		String strGrupoEvaluacionTotal = req.getParameter("pcboGrupoPropietario");
		String strcboFuente = req.getParameter("pcboFuente") == null ? "0" : req.getParameter("pcboFuente");
		
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setStrdateE(strPeriodoInicio);
		objBeanParameters.setStrdateS(strPeriodoFin);
		objBeanParameters.setStrValor1("'" + strGrupoEvaluacionTotal.replace(",", "','") + "'");
		objBeanParameters.setStrValor3(strcboFuente.equals("0") || strcboFuente == null ? null : "'" + strcboFuente.replace(",", "','") + "'");
		
		listMaximo = objBusinessMaximoWH.getTicketsMensual(objBeanParameters, ssf);
		strJson1.append("{\"ticketsReporte\" : [");
		
		if(listMaximo.size() > 0){
			for(BeanMaximo item : listMaximo){
				strJson1.append("{");
				strJson1.append("\"pais\" : \"" + item.getTicketPais() + "\",");
				strJson1.append("\"ticket\" : \"" + item.getIdTicket() + "\",");
				strJson1.append("\"estado\" : \"" + item.getTicketEstado() + "\",");
				strJson1.append("\"cliente\" : \"" + item.getTicketCliente() + "\",");
//				strJson1.append("\"titulo\" : \"" + item.getTicketTitulo() + "\",");
				strJson1.append("\"titulo\" : \"" + item.getTicketTitulo().replace("\\", "/").replace("\n", "").replace("\"", "'") + "\",");
				strJson1.append("\"fecha\" : \"" + item.getTicketFechaCreacion() + "\"");
				strJson1.append("},");
			}
		} else {
			strJson1.append(",");
			}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
	}
	catch(Exception ex){
		System.out.println(ex);
		strJson2 = new StringBuilder();
		strJson2.append("error");
	}
	out.print(strJson2);
}

public void getTicketsTendenciaActual(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {

	StringBuilder strJson1 = new StringBuilder();
	StringBuilder strJson2 = new StringBuilder();
	
	StringBuilder strJson01 = new StringBuilder();
	StringBuilder strJson02 = new StringBuilder();
	StringBuilder strJson03 = new StringBuilder();
	StringBuilder strJson04 = new StringBuilder();
	StringBuilder strJson05 = new StringBuilder();
	StringBuilder strJson06 = new StringBuilder();
	
	res.setCharacterEncoding("UTF-8");
	PrintWriter out = res.getWriter();
	
	try{
		BusinessMaximoWH objBusinessMaximoWH = new BusinessMaximoWH();
		List<BeanMaximo> listMaximo = null;
		
		String strTxtInicio = (req.getParameter("ptxtInicio") == null ? "0" : req.getParameter("ptxtInicio"));
		String strTxtFin = (req.getParameter("ptxtFin") == null ? "0" : req.getParameter("ptxtFin"));
		String strCboTipoTickets = (req.getParameter("pcboTipoTickets") == null ? "0" : req.getParameter("pcboTipoTickets"));
		String strClase = (req.getParameter("pcboClase") == null ? "0" : req.getParameter("pcboClase"));
		String strFuente = (req.getParameter("pcboFuente") == null ? "0" : req.getParameter("pcboFuente"));
		String strGrupoPropietario = (req.getParameter("pcboGrupoPropietario") == null ? "0" : req.getParameter("pcboGrupoPropietario"));
		String strGrupoResolutor = (req.getParameter("pcboGrupoResolutor") == null ? "0" : req.getParameter("pcboGrupoResolutor"));
//		String strCliente = (req.getParameter("ptipo") == null ? "0" : req.getParameter("ptipo"));
		
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setStrdateE("'" + strTxtInicio + "'");
		objBeanParameters.setStrdateS("'" + strTxtFin + "'");
		
		if(strCboTipoTickets.toLowerCase().contains("0") || (strCboTipoTickets.toLowerCase().contains("backlog") && strCboTipoTickets.toLowerCase().contains("resueltos"))){
			objBeanParameters.setStrBackLog("1");
			objBeanParameters.setStrResueltos("1");
		}
		if(strCboTipoTickets.toLowerCase().contains("backlog")){
			objBeanParameters.setStrBackLog("1");
		}
		if(strCboTipoTickets.toLowerCase().contains("resueltos")){
			objBeanParameters.setStrResueltos("1");
		}
		
		objBeanParameters.setStrValor1((strClase.equals("0") || strClase == null || strClase.toLowerCase().contains("todos") ? null : "'" + strClase.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor2((strFuente.equals("0") || strFuente == null || strFuente.toLowerCase().contains("todos") ? null : "'" + strFuente.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor3((strGrupoPropietario.equals("0") || strGrupoPropietario == null || strGrupoPropietario.toLowerCase().contains("todos") ? null : "'" + strGrupoPropietario.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor4((strGrupoResolutor.equals("0") || strGrupoResolutor == null || strGrupoResolutor.toLowerCase().contains("todos") ? null : "'" + strGrupoResolutor.replaceAll(",", "','") + "'"));
//		objBeanParameters.setStrValor5((strCliente.equals("0") || strCliente == null || strCliente.toLowerCase().contains("todos") ? null : "'" + strCliente.replaceAll(",", "','") + "'"));
		
	
	
	
	
	
//	res.setCharacterEncoding("UTF-8");
//	PrintWriter out = res.getWriter();
//	
//	try{
//		BusinessMaximoWH objBusinessMaximoWH = new BusinessMaximoWH();
//		List<BeanMaximo> listMaximo = null;
//		
//		String strPeriodoInicio = req.getParameter("ptxtInicio");
//		String strPeriodoFin = req.getParameter("ptxtFin");
//		String strGrupoEvaluacionTotal = req.getParameter("pcboGrupoPropietario");
//		String strcboFuente = req.getParameter("pcboFuente") == null ? "0" : req.getParameter("pcboFuente");
//		
//		BeanParameters objBeanParameters = new BeanParameters();
//		objBeanParameters.setStrdateE(strPeriodoInicio);
//		objBeanParameters.setStrdateS(strPeriodoFin);
//		objBeanParameters.setStrValor1("'" + strGrupoEvaluacionTotal.replace(",", "','") + "'");
//		objBeanParameters.setStrValor3(strcboFuente.equals("0") || strcboFuente == null ? null : "'" + strcboFuente.replace(",", "','") + "'");
		
		listMaximo = objBusinessMaximoWH.getTicketsTendenciaActual(objBeanParameters, ssf);
		strJson1.append("{\"ticketsReporte\" : [");
		
		if(listMaximo.size() > 0){
			for(BeanMaximo item : listMaximo){
				strJson1.append("{");
				strJson1.append("\"pais\" : \"" + item.getTicketPais() + "\",");
				strJson1.append("\"ticket\" : \"" + item.getIdTicket() + "\",");
				strJson1.append("\"estado\" : \"" + item.getTicketEstado() + "\",");
				strJson1.append("\"cliente\" : \"" + item.getTicketCliente() + "\",");
				strJson1.append("\"titulo\" : \"" + item.getTicketTitulo().replace("\\", "/").replace("\n", "").replace("\"", "'") + "\",");
				strJson1.append("\"fecha\" : \"" + item.getTicketFechaCreacion() + "\"");
				strJson1.append("},");
			}
		} else {
			strJson1.append(",");
			}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
	}
	catch(Exception ex){
		System.out.println(ex);
		strJson2 = new StringBuilder();
		strJson2.append("error");
	}
	out.print(strJson2);
}




















public void listMensual(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
	
	StringBuilder strJson1 = new StringBuilder();
	StringBuilder strJson2 = new StringBuilder();
	
	StringBuilder strJson01 = new StringBuilder();
	StringBuilder strJson02 = new StringBuilder();
	StringBuilder strJson03 = new StringBuilder();
	StringBuilder strJson04 = new StringBuilder();
	StringBuilder strJson05 = new StringBuilder();
	StringBuilder strJson06 = new StringBuilder();
	
	res.setCharacterEncoding("UTF-8");
	PrintWriter out = res.getWriter();
	
	try{
		BusinessMaximoWH objBusinessMaximoWH = new BusinessMaximoWH();
		List<BeanMaximo> listMaximo = null;
		
		String strTxtInicio = (req.getParameter("ptxtInicio") == null ? "0" : req.getParameter("ptxtInicio"));
		String strTxtFin = (req.getParameter("ptxtFin") == null ? "0" : req.getParameter("ptxtFin"));
		String strCboTipoTickets = (req.getParameter("pcboTipoTickets") == null ? "0" : req.getParameter("pcboTipoTickets"));
		String strClase = (req.getParameter("pcboClase") == null ? "0" : req.getParameter("pcboClase"));
		String strFuente = (req.getParameter("pcboFuente") == null ? "0" : req.getParameter("pcboFuente"));
		String strGrupoPropietario = (req.getParameter("pcboGrupoPropietario") == null ? "0" : req.getParameter("pcboGrupoPropietario"));
		String strGrupoResolutor = (req.getParameter("pcboGrupoResolutor") == null ? "0" : req.getParameter("pcboGrupoResolutor"));
		String strCliente = (req.getParameter("ptipo") == null ? "0" : req.getParameter("ptipo"));
		
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setStrdateE("'" + strTxtInicio + "'");
		objBeanParameters.setStrdateS("'" + strTxtFin + "'");
		
		if(strCboTipoTickets.toLowerCase().contains("0") || (strCboTipoTickets.toLowerCase().contains("backlog") && strCboTipoTickets.toLowerCase().contains("resueltos"))){
			objBeanParameters.setStrBackLog("1");
			objBeanParameters.setStrResueltos("1");
		}
		if(strCboTipoTickets.toLowerCase().contains("backlog")){
			objBeanParameters.setStrBackLog("1");
		}
		if(strCboTipoTickets.toLowerCase().contains("resueltos")){
			objBeanParameters.setStrResueltos("1");
		}
		
		objBeanParameters.setStrValor1((strClase.equals("0") || strClase == null || strClase.toLowerCase().contains("todos") ? null : "'" + strClase.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor2((strFuente.equals("0") || strFuente == null || strFuente.toLowerCase().contains("todos") ? null : "'" + strFuente.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor3((strGrupoPropietario.equals("0") || strGrupoPropietario == null || strGrupoPropietario.toLowerCase().contains("todos") ? null : "'" + strGrupoPropietario.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor4((strGrupoResolutor.equals("0") || strGrupoResolutor == null || strGrupoResolutor.toLowerCase().contains("todos") ? null : "'" + strGrupoResolutor.replaceAll(",", "','") + "'"));
		objBeanParameters.setStrValor5((strCliente.equals("0") || strCliente == null || strCliente.toLowerCase().contains("todos") ? null : "'" + strCliente.replaceAll(",", "','") + "'"));
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	
//	res.setCharacterEncoding("UTF-8");
//	PrintWriter out = res.getWriter();
//	
//	try{
//		BusinessMaximoWH objBusinessMaximoWH = new BusinessMaximoWH();
//		List<BeanMaximo> listMaximo = null;
//		
//		String strPeriodoInicio = req.getParameter("ptxtInicio");
//		String strPeriodoFin = req.getParameter("ptxtFin");
//		String strGrupoEvaluacionTotal = req.getParameter("pcboGrupoPropietario");
//		String strcboFuente = req.getParameter("pcboFuente") == null ? "0" : req.getParameter("pcboFuente");
//		
//		BeanParameters objBeanParameters = new BeanParameters();
//		objBeanParameters.setStrdateE(strPeriodoInicio);
//		objBeanParameters.setStrdateE(strPeriodoFin);
//		objBeanParameters.setStrValor1(strGrupoEvaluacionTotal);
//		objBeanParameters.setStrValor3(strcboFuente.equals("0") || strcboFuente == null ? null : "'" + strcboFuente.replace(",", "','") + "'");
		
		listMaximo = objBusinessMaximoWH.getMensual(objBeanParameters, ssf);
		strJson1.append("{\"paises\" : [");
		
		if(listMaximo.size() > 0){
			for(BeanMaximo item : listMaximo){
				strJson1.append("{\"");
				strJson1.append("mes\" : \"" + item.getStrValor1() + "\",");
				strJson1.append("\"cantidad\" : \"" + item.getiCantidad() + "\"");
				strJson1.append("},");
			}
		} else {
			strJson1.append(",");
			}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]");
	}
	catch(Exception ex){
		System.out.println(ex);
		strJson2.append("error");
	}
	out.print(strJson2);
}

public void listDiario(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
	
	StringBuilder strJson1 = new StringBuilder();
	StringBuilder strJson2 = new StringBuilder();
	
	res.setCharacterEncoding("UTF-8");
	PrintWriter out = res.getWriter();
	
	try{
		BusinessMaximoWH objBusinessMaximoWH = new BusinessMaximoWH();
		List<BeanMaximo> listMaximo = null;
		
		String strPeriodoInicio = req.getParameter("ptxtInicio");
		String strPeriodoFin = req.getParameter("ptxtFin");
		String strGrupoEvaluacionTotal = req.getParameter("pcboGrupoPropietario");
		String strcboFuente = req.getParameter("pcboFuente") == null ? "0" : req.getParameter("pcboFuente");
		
		BeanParameters objBeanParameters = new BeanParameters();
		objBeanParameters.setStrdateE(strPeriodoInicio);
		objBeanParameters.setStrdateE(strPeriodoFin);
		objBeanParameters.setStrValor1(strGrupoEvaluacionTotal);
		objBeanParameters.setStrValor3(strcboFuente.equals("0") || strcboFuente == null ? null : "'" + strcboFuente.replace(",", "','") + "'");
		
		listMaximo = objBusinessMaximoWH.getDiario(objBeanParameters, ssf);
		strJson1.append("{\"dias\" : [");
		
		if(listMaximo.size() > 0){
			for(BeanMaximo item : listMaximo){
				strJson1.append("{\"");
				strJson1.append("dia\" : \"" + item.getStrValor1() + "\",");
				strJson1.append("\"cantidad\" : \"" + item.getiCantidad() + "\"");
				strJson1.append("},");
			}
		} else {
			strJson1.append(",");
			}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]");
	}
	catch(Exception ex){
		System.out.println(ex);
		strJson2.append("error");
	}
	out.print(strJson2);
	}



public void getClientMobility(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
	
	StringBuilder strJson1 = new StringBuilder();
	StringBuilder strJson2 = new StringBuilder();
	
	res.setCharacterEncoding("UTF-8");
	PrintWriter out = res.getWriter();
	
	try{
		BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
		List<BeanMaximo> listMaximo = null;
		String strClient = req.getParameter("strClient");
		
		BeanParameters objBeanParameters = new BeanParameters();
		if(strClient.equals("null") || strClient.equals(""))
			objBeanParameters.setStrValor1(null);
		else
			objBeanParameters.setStrValor1(strClient);
		
		listMaximo = objBusinessMaximoMobility.getClientMobility(objBeanParameters,ssf);
		strJson1.append("{\"clientMobility\" : [");
		
		if(listMaximo.size() > 0){
			for(BeanMaximo item : listMaximo){
				strJson1.append("{\"");
				strJson1.append("idClient\" : \"" + item.getTicketIdCliente() + "\",");
				strJson1.append("\"client\" : \"" + item.getTicketCliente() + "\"");
				strJson1.append("},");
			}
		} else {
			strJson1.append(",");
			}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
	}
	catch(Exception ex){
		System.out.println("error: " + ex.getStackTrace());
		strJson2.append("error: " + ex.getStackTrace());
	}
	out.print(strJson2);
	}

}