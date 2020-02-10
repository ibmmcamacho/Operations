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
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.business.BusinessMaximoWH;
import com.pe.ibm.business.BusinessOptions;

/**
 * Servlet implementation class ServletMaximoWH
 */
@WebServlet("/ServletMaximoWH")
public class ServletMaximoWH extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMaximoWH() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* Obtener sqlsessionF*/
		SqlSessionFactory ssfMaximo = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfMaximo");
		SqlSessionFactory ssfCisco = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfCisco");
		
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
			listTicketsTendenciaActual(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("listBacklogGSP")){
			listBacklogGSP(request,response,ssfMaximo);
		}
		else if(strOperacion.equals("listCiscoGSP")){
			listCiscoGSP(request,response,ssfCisco);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	public void listCiscoGSP(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		BusinessOptions objBusinessOptions = new BusinessOptions();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try{
			BusinessMaximoWH objBusinessMaximoWH = new BusinessMaximoWH();
			List<BeanMaximo> listMaximo = null;
			
			DateFormat dateFormat1 = new SimpleDateFormat("MMyyyy");
			DateFormat dateFormat2 = new SimpleDateFormat("yyyyMM");
			DateFormat dateFormat3 = new SimpleDateFormat("yyyyMMdd");
			
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String pDate = req.getParameter("pDate");
			Date date = formatter.parse(pDate);
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrdate1(dateFormat1.format(date));
			objBeanParameters.setStrdate2(dateFormat2.format(date));
			objBeanParameters.setStrdate3(dateFormat3.format(date));
			String strClient = req.getParameter("pclient");
			List<BeanOptions> listClientMobility = objBusinessOptions.listOptions3(new BeanParameters(strClient,"AREA",1), (SqlSessionFactory)req.getServletContext().getAttribute("sqlsf"));
			if(listClientMobility.size() > 0)
				objBeanParameters.setStrValor1(listClientMobility.get(0).getStrValor2());
			else
				objBeanParameters.setStrValor1("");
			
			listMaximo = objBusinessMaximoWH.getCiscoMesa(objBeanParameters, ssf);
			if(listMaximo != null && listMaximo.size() > 0){
				strJson1.append("{\"cisco\": [{\"tasaabandonodia\":\"" + (listMaximo.get(0).getStrValor1() != null ? listMaximo.get(0).getStrValor1() : "0") + "\",\"tasaabandonomes\" :\"" + (listMaximo.get(0).getStrValor2() != null ? listMaximo.get(0).getStrValor2() : "0") + 
						"\",\"residente\" :\"" + (listMaximo.get(0).getStrValor3() != null ? listMaximo.get(0).getStrValor3() : "0") + "\",\"noresidente\" :\"" + (listMaximo.get(0).getStrValor4() != null ? listMaximo.get(0).getStrValor4() : "0") + "\",\"timedia\" :\"" + (listMaximo.get(0).getStrValor5() != null ? listMaximo.get(0).getStrValor5() : "0") + 
						"\",\"timemes\" :\"" + (listMaximo.get(0).getStrValor6() != null ? listMaximo.get(0).getStrValor6() : "0") + "\",\"slaTasaAbandono\" :\"" + (listMaximo.get(0).getStrValor7() != null ? listMaximo.get(0).getStrValor7() : "") + 
						"\",\"slaTiempoRespuestaResidente\" :\"" + (listMaximo.get(0).getStrValor8() != null ? listMaximo.get(0).getStrValor8() : "") + "\",\"slaTiempoRespuestaNoResidente\" :\"" + (listMaximo.get(0).getStrValor9() != null ? listMaximo.get(0).getStrValor9() : "") +
						"\",\"slaTiempoConversacion\" :\"" + (listMaximo.get(0).getStrValor10() != null ? listMaximo.get(0).getStrValor10() : "") + "\"}]}");
			}
			else{
				strJson1.append("{\"cisco\": [{\"tasaabandonodia\":\"0\",\"tasaabandonomes\" :\"0\"" + 
						",\"residente\" :\"0\",\"noresidente\" :\"0\",\"timedia\" :\"0\"" +
						",\"timemes\" :\"0\",\"slaTasaAbandono\" :\"\",\"slaTiempoRespuestaResidente\" :\"\"" +
						",\"slaTiempoRespuestaNoResidente\" :\"\",\"slaTiempoConversacion\" :\"\"}]}");
			}
		}
			catch(Exception ex){
				System.out.println(ex.getCause().getMessage());
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
//					for(int i = 0 ; i < arrGrupo.size() ; i++){
//						if(i == 0)
//							strJson1.append("\"" + arrGrupo.get(i) + "\"");
//						else
//							strJson1.append(",\"" + arrGrupo.get(i) + "\"");
						strJson1.append("\"BackLog\"");
//					}
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
			
			
//			if(listMaximo != null){
//				if(listMaximo.size() > 0){
//					for(BeanMaximo item : listMaximo){
//						strJson1.append("{");
//						strJson1.append("\"class\" : \"" + item.getTicketClass() + "\",");
//						strJson1.append("\"grupo\" : \"" + item.getTicketGrupoResolutor() + "\"");
//						strJson1.append("},");
//					}
//				} else {
//					strJson1.append(",");
//				}
//				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
//				strJson3 = strJson2;
//				
//				strJson1 = new StringBuilder();
//				strJson2 = new StringBuilder();
//				strJson1.append("\"dataPaises\" : {\"labels\":[");
//				if(listMaximo.size() > 0){
//					for(BeanMaximo item : listMaximo){
//						strJson1.append("\"" + item.getStrValor1() + "\",");
//					}
//				}
//				else{
//					strJson1.append(",");
//				}
//				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
//				
//				strJson1 = new StringBuilder();
//				strJson1.append("\"datasets\": [{\"label\":\"Paises\",\"backgroundColor\":[");
//				
//				if(listMaximo.size() > 0){
//					for(int i = 0 ; i < listMaximo.size() ; i++){
//						if(i%2 == 0)
//							strJson1.append("\"rgba(230, 81, 0, 0.8)\",");
//						else
//							strJson1.append("\"rgba(60, 141, 188, 0.8)\",");
//					}
//				}
//				else{
//					strJson1.append(",");
//				}
//				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
//				
//				strJson1 = new StringBuilder();
//				strJson1.append("\"borderColor\":[");
//				
//				if(listMaximo.size() > 0){
//					for(int i = 0 ; i < listMaximo.size() ; i++){
//						if(i%2 == 0)
//							strJson1.append("\"rgba(153, 102, 255, 1)\",");
//						else
//							strJson1.append("\"rgba(255, 159, 64, 1)\",");
//					}
//				}
//				else{
//					strJson1.append(",");
//				}
//				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],\"borderWidth\": 1,");
//				
//				strJson1 = new StringBuilder();
//				strJson1.append("\"data\":[");
//				
//				if(listMaximo.size() > 0){
//					for(BeanMaximo item : listMaximo){
//							strJson1.append("" + item.getiCantidad() + ",");
//					}
//				}
//				else{
//					strJson1.append(",");
//				}
//				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}");
//			}
//			else{
//				strJson1.append(",");
//				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]");
//			}
//			strJson3.append(strJson2.toString() + "}");
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
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
			System.out.println(ex.getCause().getMessage());
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
		System.out.println(ex.getCause().getMessage());
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
		System.out.println(ex.getCause().getMessage());
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
			System.out.println(ex.getCause().getMessage());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}

	public void listTicketsPaises(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		
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
		
		
//		StringBuilder strJson1 = new StringBuilder();
//		StringBuilder strJson2 = new StringBuilder();
//		
//		res.setCharacterEncoding("UTF-8");
//		PrintWriter out = res.getWriter();
//		
//		try{
//			BusinessMaximoWH objBusinessMaximoWH = new BusinessMaximoWH();
//			List<BeanMaximo> listMaximo = null;
//			
//			String strPeriodoInicio = req.getParameter("ptxtInicio");
//			String strPeriodoFin = req.getParameter("ptxtFin");
//			String strGrupoEvaluacionTotal = req.getParameter("pcboGrupoPropietario");
//			String strcboFuente = req.getParameter("pcboFuente") == null ? "0" : req.getParameter("pcboFuente");
//			
//			BeanParameters objBeanParameters = new BeanParameters();
//			objBeanParameters.setStrdateE(strPeriodoInicio);
//			objBeanParameters.setStrdateS(strPeriodoFin);
//			objBeanParameters.setStrValor3("'" + strGrupoEvaluacionTotal.replace(",", "','") + "'");
//			objBeanParameters.setStrValor2(strcboFuente.equals("0") || strcboFuente == null ? null : "'" + strcboFuente.replace(",", "','") + "'");
			
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
			System.out.println(ex.getCause().getMessage());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}
	
	public void listTicketsClientes(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
	
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
			System.out.println(ex.getCause().getMessage());
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
			System.out.println(ex.getCause().getMessage());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		out.print(strJson2);
	}
	
	public void listTicketsTendenciaActual(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
	
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
			System.out.println(ex.getCause().getMessage());
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
		System.out.println(ex.getCause().getMessage());
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
		System.out.println(ex.getCause().getMessage());
		strJson2.append("error");
	}
	out.print(strJson2);
}
}