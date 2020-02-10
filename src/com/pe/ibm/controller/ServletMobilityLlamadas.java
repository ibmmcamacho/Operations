package com.pe.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanBusqueda;
import com.pe.ibm.bean.BeanDistribucionTickets;
import com.pe.ibm.bean.BeanLlamadas;
import com.pe.ibm.bean.BeanNivelServicio;
import com.pe.ibm.bean.BeanProyecto;
import com.pe.ibm.bean.BeanReporteLlamadas;
import com.pe.ibm.bean.BeanResultadoMensualNivelServicio;
import com.pe.ibm.bean.BeanSLATiempoOnsiteResultado;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.bean.BeanSlaMDA;
import com.pe.ibm.bean.BeanTicketSRINC;
import com.pe.ibm.bean.LineaBaseOnsiteDistribucion;
import com.pe.ibm.bean.WorkOrder;
import com.pe.ibm.business.BusinessDistribucionTickets;
import com.pe.ibm.business.BusinessLineaBaseOnsite;
import com.pe.ibm.business.BusinessLlamadasMobility;
import com.pe.ibm.business.BusinessMaximoMobility;
import com.pe.ibm.business.BusinessNivelServicio;
import com.pe.ibm.business.BusinessProyecto;
import com.pe.ibm.util.AppUtils;

/**
 * Servlet implementation class ServletWDashboardProyecto
 */
@WebServlet("/ServletMobilityLlamadas")
public class ServletMobilityLlamadas extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BeanSession objBeanSession = new BeanSession();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMobilityLlamadas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SqlSessionFactory ssfSmartDesk = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfCisco");
		String id_proyecto;
		String id_sla;
		String mes;
		String anio;
		String strFecha;
		int id_opcion;
		String cliente ;
		String semana;
//		String periodo = request.getParameter("periodo");
//		String proyecto = request.getParameter("proyecto");
		
		int tipo=Integer.parseInt(request.getParameter("strAccion"));
		
		switch(tipo) { 
		case 1: //Listar Proyectos Mobility
			listarProyectos(request, response, ssfSmartDesk);	
			break;
		case 2: //Listar Niveles de Servicio Mobility
			id_proyecto = request.getParameter("id_proyecto");
			strFecha = request.getParameter("anio")+"-"+request.getParameter("mes")+"-"+"01";
			semana = request.getParameter("semana");
			obtenerResultadoLlamadas(id_proyecto,strFecha,semana,request, response, ssfSmartDesk);
			break;
//		case 3: //Listar Resultado Niveles Servicio Mobility
//			id_proyecto = request.getParameter("id_proyecto");
//			mes = request.getParameter("mes");
//			anio = request.getParameter("anio");
//			obtener_resultado_sla(id_proyecto,mes ,anio, request, response, ssfSmartDesk);
//			break;
//		case 4: //Listar Resultado Distribucion tickets Mesa de Ayuda
//			id_proyecto = request.getParameter("id_proyecto");
//			mes = request.getParameter("mes");
//			anio = request.getParameter("anio");
//			distribucionTickets(id_proyecto ,mes ,anio, request, response, ssfSmartDesk);
//			break;
//		case 5: //Listar Resultado Distribucion tickets Linea Base Onsite
//			id_sla = request.getParameter("id_sla");
//			mes = request.getParameter("mes");
//			anio = request.getParameter("anio");
//			obtener_distribucion_LineaBase_Onsite(id_sla ,mes ,anio, request, response, ssfSmartDesk);
//			break;
//		case 6: //Listar Resultado Detalle Nivel de Servicio Onsite
//			id_sla = request.getParameter("id_sla");
//			mes = request.getParameter("mes");
//			anio = request.getParameter("anio");
//			obtener_detalleNivelServicioOnsite(id_sla ,mes ,anio, request, response, ssfSmartDesk);
//			break;
//		case 7: //Listar SABANA DE TICKETS SR FULL 
//			id_proyecto = request.getParameter("id_proyecto");
//			strFecha = request.getParameter("anio")+"-"+request.getParameter("mes")+"-"+"01";
//			getReporteTickets(strFecha,id_proyecto,request,response,ssfSmartDesk);
//			break;
//		case 8: //Listar SABANA DE LLAMADAS 
//			id_proyecto = request.getParameter("id_proyecto");
//			strFecha = request.getParameter("anio")+"-"+request.getParameter("mes")+"-"+"01";
//			getReporteLlamadas(strFecha,id_proyecto,request,response,ssfSmartDesk);
//			break;
//		case 9: //Listar SABANA DE WO 
//			id_proyecto = request.getParameter("id_proyecto");
//			id_opcion = Integer.parseInt(request.getParameter("id_opcion"));
//			strFecha = request.getParameter("anio")+"-"+request.getParameter("mes")+"-"+"01";
//			getReporteWorkOrder(strFecha,id_proyecto, id_opcion,request,response,ssfSmartDesk);
//			break;
//		case 10: //Listar Resumen de Resultados del mes para el Informe Mensual
//			id_proyecto = request.getParameter("id_proyecto");
//			strFecha = request.getParameter("anio")+"-"+request.getParameter("mes")+"-"+"01";
//			cliente = request.getParameter("cliente");
//			mes = request.getParameter("mes");
//			anio = request.getParameter("anio");
//			getResumenSLA(strFecha,id_proyecto,cliente,mes ,anio,request,response,ssfSmartDesk);
//			break;
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	private void listarProyectos(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException{
	
		res.setCharacterEncoding("UTF-8");
		
	try{
		BusinessProyecto objProyecto = new BusinessProyecto();
		List<BeanProyecto> lstproyecto = new ArrayList<BeanProyecto>();
		try {
		lstproyecto = objProyecto.listProyectosTodos(ssf);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		StringBuilder objJson1 = new StringBuilder();
		
		PrintWriter out = res.getWriter();
		
		objJson1.append("{\"Proyecto\": [");
		
		System.out.println("lstproyecto "+lstproyecto.size());
		if(lstproyecto != null) {
			for(BeanProyecto obj : lstproyecto){
				
				objJson1.append("{" +
								"\"idproyecto\" : \"" + obj.getIdproyecto()+ "\", " +
								"\"nombreProyecto\" : \"" + obj.getNombreProyecto() + "\"" +
								"},"
								);
			}	
		}else {
				objJson1.append(",");
		}
		

		StringBuilder strJson2 = new StringBuilder();
		strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		
		out.print(strJson2);
		
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
			ex.printStackTrace();
		}
	
	
	}
	

	
	private void obtenerResultadoLlamadas(String id_proyecto, String strFecha, String strSemana, HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		
		BusinessLlamadasMobility objLlamadas = new BusinessLlamadasMobility();
		List<BeanLlamadas>  listLlamadas= new ArrayList<BeanLlamadas>();
		StringBuilder objJson1 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder strJson2 = new StringBuilder();
		
		BeanBusqueda beanBusqueda = new BeanBusqueda();
		try{
			beanBusqueda.setIdproyecto(id_proyecto);
			beanBusqueda.setFechaInicio(strFecha);
			beanBusqueda.setSemana(Integer.parseInt(strSemana));
			
			System.out.println(beanBusqueda.toString());
			try {
			listLlamadas = objLlamadas.getllamadasPorOpcion(beanBusqueda,1, ssf); // parametro opcion 1 : LLamadas por Hora
			
			}catch(Exception e) {
			e.printStackTrace();	
			}
			
			objJson1 = new StringBuilder();
			objJson1.append("{\"LlamadasPorHora\": [");
			objJson1.append("{\"labels\": [");
			if(listLlamadas != null) {
				for(BeanLlamadas obj : listLlamadas){
					objJson1.append("\"" + obj.getStrhoraDia() +"\",");
				}	
			}else {
				objJson1.append(",");
			}
			
			
			strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "],");
			
			objJson1 = new StringBuilder();
			objJson1.append("\"datasets\": [");
			objJson1.append("{\"label\": \"Llamadas Contestadas \",\"fill\": false,\"backgroundColor\": \"#558b2f\",\"borderColor\": \"#558b2f\",\"data\": [");
			if(listLlamadas != null){
				for(BeanLlamadas obj : listLlamadas){
					objJson1.append(obj.getLlamadasContestadas()+ ",");
				}
			}
			else
				objJson1.append(",");
			
			strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "]},");
			
			
			objJson1 = new StringBuilder();
			objJson1.append("{\"label\": \"Abandonadas Mayores \", \"fill\": false,\"backgroundColor\": \"#c62828\",\"borderColor\": \"#c62828\",\"data\": [");
			
			if(listLlamadas != null){
				for(BeanLlamadas obj : listLlamadas){
					objJson1.append(obj.getLlamadasMayores()+ ",");
				}
			}
			else
				objJson1.append(",");
			
			strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "]},");
			
			objJson1 = new StringBuilder();
			objJson1.append("{\"label\": \"Abandonadas Menores \", \"fill\": false,\"backgroundColor\": \"#fbc02d\",\"borderColor\": \"#fbc02d\",\"data\": [");
			
			if(listLlamadas != null){
				for(BeanLlamadas obj : listLlamadas){
					objJson1.append(obj.getLlamadasMenores()+ ",");
				}
			}
			else
				objJson1.append(",");
			
			strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "]},");
			
			objJson1 = new StringBuilder();
			objJson1.append("{\"label\": \"Tasa Abandono (%) \", \"fill\": false,\"backgroundColor\": \"#3454d7\",\"borderColor\": \"#3454d7\",\"data\": [");
			
			if(listLlamadas != null){
				for(BeanLlamadas obj : listLlamadas){
					objJson1.append(obj.getTasaAbandono()+ ",");
				}
			}
			else
				objJson1.append(",");
			
			
			strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "]}]}],");
			
			try {
				listLlamadas = objLlamadas.getllamadasPorOpcion(beanBusqueda,2, ssf); // parametro opcion 2 : LLamadas por Semana
				}catch(Exception e) {
				e.printStackTrace();	
				}
				
				objJson1 = new StringBuilder();
				objJson1.append("\"LlamadasPorSemana\": [");
				objJson1.append("{\"labels\": [");
				if(listLlamadas != null) {
					for(BeanLlamadas obj : listLlamadas){
						objJson1.append("\"" + obj.getNumeroSemana() +"\",");
					}	
				}else {
					objJson1.append(",");
				}
				
				
				strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "],");
				
				objJson1 = new StringBuilder();
				objJson1.append("\"datasets\": [");
				objJson1.append("{\"label\": \"Llamadas Contestadas \",\"fill\": false,\"backgroundColor\": \"#558b2f\",\"borderColor\": \"#558b2f\",\"data\": [");
				if(listLlamadas != null){
					for(BeanLlamadas obj : listLlamadas){
						objJson1.append(obj.getLlamadasContestadas()+ ",");
					}
				}
				else
					objJson1.append(",");
				
				strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "]},");
				
				
				objJson1 = new StringBuilder();
				objJson1.append("{\"label\": \"Abandonadas Mayores \", \"fill\": false,\"backgroundColor\": \"#c62828\",\"borderColor\": \"#c62828\",\"data\": [");
				
				if(listLlamadas != null){
					for(BeanLlamadas obj : listLlamadas){
						objJson1.append(obj.getLlamadasMayores()+ ",");
					}
				}
				else
					objJson1.append(",");
				
				strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "]},");
				
				objJson1 = new StringBuilder();
				objJson1.append("{\"label\": \"Abandonadas Menores \", \"fill\": false,\"backgroundColor\": \"#fbc02d\",\"borderColor\": \"#fbc02d\",\"data\": [");
				
				if(listLlamadas != null){
					for(BeanLlamadas obj : listLlamadas){
						objJson1.append(obj.getLlamadasMenores()+ ",");
					}
				}
				else
					objJson1.append(",");
				
				strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "]},");
				
				objJson1 = new StringBuilder();
				objJson1.append("{\"label\": \"Tasa Abandono (%) \", \"fill\": false,\"backgroundColor\": \"#3454d7\",\"borderColor\": \"#3454d7\",\"data\": [");
				
				if(listLlamadas != null){
					for(BeanLlamadas obj : listLlamadas){
						objJson1.append(obj.getTasaAbandono()+ ",");
					}
				}
				else
					objJson1.append(",");
				
				
				strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "]}]}],");
				
				try {
					listLlamadas = objLlamadas.getllamadasPorOpcion(beanBusqueda,3, ssf); // parametro opcion 3 : LLamadas por Dia de la Semana
					}catch(Exception e) {
					e.printStackTrace();	
					}
					
					objJson1 = new StringBuilder();
					objJson1.append("\"LlamadasPorDiaSemana\": [");
					objJson1.append("{\"labels\": [");
					if(listLlamadas != null) {
						for(BeanLlamadas obj : listLlamadas){
							objJson1.append("\"" + obj.getNombrediaSemana() +"\",");
						}	
					}else {
						objJson1.append(",");
					}
					
					
					strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "],");
					
					objJson1 = new StringBuilder();
					objJson1.append("\"datasets\": [");
					objJson1.append("{\"label\": \"Llamadas Contestadas \",\"fill\": false,\"backgroundColor\": \"#558b2f\",\"borderColor\": \"#558b2f\",\"data\": [");
					if(listLlamadas != null){
						for(BeanLlamadas obj : listLlamadas){
							objJson1.append(obj.getLlamadasContestadas()+ ",");
						}
					}
					else
						objJson1.append(",");
					
					
					
					strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "]},");
					
					
					objJson1 = new StringBuilder();
					objJson1.append("{\"label\": \"Abandonadas Mayores \", \"fill\": false,\"backgroundColor\": \"#c62828\",\"borderColor\": \"#c62828\",\"data\": [");
					
					if(listLlamadas != null){
						for(BeanLlamadas obj : listLlamadas){
							objJson1.append(obj.getLlamadasMayores()+ ",");
						}
					}
					else
						objJson1.append(",");
					
					strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "]},");
					
					objJson1 = new StringBuilder();
					objJson1.append("{\"label\": \"Abandonadas Menores \", \"fill\": false,\"backgroundColor\": \"#fbc02d\",\"borderColor\": \"#fbc02d\",\"data\": [");
					
					if(listLlamadas != null){
						for(BeanLlamadas obj : listLlamadas){
							objJson1.append(obj.getLlamadasMenores()+ ",");
						}
					}
					else
						objJson1.append(",");
					
					
					strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "]},");
					
					objJson1 = new StringBuilder();
					objJson1.append("{\"label\": \"Tasa Abandono (%) \", \"fill\": false,\"backgroundColor\": \"#3454d7\",\"borderColor\": \"#3454d7\",\"data\": [");
					
					if(listLlamadas != null){
						for(BeanLlamadas obj : listLlamadas){
							objJson1.append(obj.getTasaAbandono()+ ",");
						}
					}
					else
						objJson1.append(",");
					
					strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "]}]}],");
					
					try {
						listLlamadas = objLlamadas.getllamadasPorOpcion(beanBusqueda,4, ssf); // parametro opcion 4 : LLamadas por Dia del Mes
						}catch(Exception e) {
						e.printStackTrace();	
						}
						
						objJson1 = new StringBuilder();
						objJson1.append("\"LlamadasPorDiaMes\": [");
						objJson1.append("{\"labels\": [");
						if(listLlamadas != null) {
							for(BeanLlamadas obj : listLlamadas){
								objJson1.append("\"" + obj.getNumerodiaMes() +"\",");
							}	
						}else {
							objJson1.append(",");
						}
						
						
						strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "],");
						
						objJson1 = new StringBuilder();
						objJson1.append("\"datasets\": [");
						objJson1.append("{\"label\": \"Llamadas Contestadas \",\"fill\": false,\"backgroundColor\": \"#558b2f\",\"borderColor\": \"#558b2f\",\"data\": [");
						if(listLlamadas != null){
							for(BeanLlamadas obj : listLlamadas){
								objJson1.append(obj.getLlamadasContestadas()+ ",");
							}
						}
						else
							objJson1.append(",");
						
						
						
						strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "]},");
						
						
						objJson1 = new StringBuilder();
						objJson1.append("{\"label\": \"Abandonadas Mayores \", \"fill\": false,\"backgroundColor\": \"#c62828\",\"borderColor\": \"#c62828\",\"data\": [");
						
						if(listLlamadas != null){
							for(BeanLlamadas obj : listLlamadas){
								objJson1.append(obj.getLlamadasMayores()+ ",");
							}
						}
						else
							objJson1.append(",");
						
						strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "]},");
						
						objJson1 = new StringBuilder();
						objJson1.append("{\"label\": \"Abandonadas Menores \", \"fill\": false,\"backgroundColor\": \"#fbc02d\",\"borderColor\": \"#fbc02d\",\"data\": [");
						
						if(listLlamadas != null){
							for(BeanLlamadas obj : listLlamadas){
								objJson1.append(obj.getLlamadasMenores()+ ",");
							}
						}
						else
							objJson1.append(",");
						
						
						strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "]},");
						
						objJson1 = new StringBuilder();
						objJson1.append("{\"label\": \"Tasa Abandono (%) \", \"fill\": false,\"backgroundColor\": \"#3454d7\",\"borderColor\": \"#3454d7\",\"data\": [");
						
						if(listLlamadas != null){
							for(BeanLlamadas obj : listLlamadas){
								objJson1.append(obj.getTasaAbandono()+ ",");
							}
						}
						else
							objJson1.append(",");
					
				strJson2.append(objJson1.substring(0, objJson1.length() - 1) + "]}]}]}");
			
			
//			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
//			
//			objJson1.append("{" +
//					"\"HORADIA\" : \"" + obj.getHoraDia()+ "\" ," +
//					"\"CONTESTADAS\" : \"" + obj.getLlamadasContestadas()+ "\" ," +
//					"\"MAYORES\" : \"" + obj.getLlamadasMayores()+ "\" ," +
//					"\"MENORES\" : \"" + obj.getLlamadasMenores()+ "\" " +
//					"},"
//					);
			
			
		}catch(Exception ex){
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		
		out.print(strJson2);	
		
	}
	
//	 private void obtener_resultado_sla(String id_proyecto, String vmes, String vanio, HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException{
//	    
//		 res.setCharacterEncoding("UTF-8");
//		 
//		 StringBuilder objJson1 = new StringBuilder();
//		 StringBuilder strJson2 = new StringBuilder();
//		 PrintWriter out = res.getWriter();
//		 try{
//				BusinessNivelServicio objResultadoNS = new BusinessNivelServicio();
//				List<BeanResultadoMensualNivelServicio> listResultadoNS = new ArrayList<BeanResultadoMensualNivelServicio>();
//				listResultadoNS = objResultadoNS.listResultadoMensualNivelServicio(id_proyecto, vmes, vanio, ssf);
//				
//				objJson1.append("{\"Resultado_NS\": [");
//				if(listResultadoNS.size() > 0 ) {
//				for(BeanResultadoMensualNivelServicio beanResultadoNS : listResultadoNS){
//					objJson1.append("{" +
//							"\"valornum\" : \"" + (beanResultadoNS!=null?beanResultadoNS.getValornum():"") + "\" ," +
//							"\"valorletra\" : \"" + (beanResultadoNS!=null?beanResultadoNS.getValorletra():"") + "\" ," +
//							"\"colormes\" : \"" + (beanResultadoNS!=null?beanResultadoNS.getColormes():"") + "\" ," +
//							"\"id_sla\" : \"" + (beanResultadoNS!=null?beanResultadoNS.getId_sla():"") + "\" ," +
//							"\"valor1\" : \"" + (beanResultadoNS.getValor1()) + "\" ," +
//							"\"valor2\" : \"" + (beanResultadoNS.getValor2()) + "\"" +
//							"},"
//							);
//				}
//				}else {
//					objJson1.append("{},");
//				}
//					
//				}
//				catch(Exception ex){
//					ex.printStackTrace();
//					objJson1.append("{},");
//				}finally {
//					strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
//					out.print(strJson2);	
//				}
//	    }
//	 
//	 private void distribucionTickets(String id_proyecto, String vmes, String vanio, HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException{
//	    	try{
//				BusinessDistribucionTickets objTickets = new BusinessDistribucionTickets();
//				BeanDistribucionTickets lstTickets = new BeanDistribucionTickets();
//				lstTickets = objTickets.obtenerDistribucionTickets(id_proyecto, vmes, vanio, ssf);
//				
//				HttpSession sessionProyectos = req.getSession(true);
//				sessionProyectos.setAttribute("bProyecto", lstTickets);
//				
//				StringBuilder objJson1 = new StringBuilder();
//				
//				PrintWriter out = res.getWriter();
//				
//				objJson1.append("{\"DistribucionTickets\": [");
//
//					objJson1.append("{" +
//									"\"telefono\" : \"" + (lstTickets!=null?lstTickets.getTelefono():"0")+ "\" ," +
//									"\"correo\" : \"" + (lstTickets!=null?lstTickets.getCorreo():"0")+ "\" ," +
//									"\"catalogo\" : \"" + (lstTickets!=null?lstTickets.getCatalogo():"0")+ "\" ," +
//									"\"adicional\" : \"" + (lstTickets!=null?lstTickets.getAdicional():"0")+ "\" ," +
//									"\"chat\" : \"" + (lstTickets!=null?lstTickets.getChat():"0")+ "\" ," +
//									"\"correobuzon\" : \"" + (lstTickets!=null?lstTickets.getCorreobuzon():"0")+ "\" ," +
//									"\"total\" : \"" + (lstTickets!=null?lstTickets.getTotal():"0")+ "\" ," +
//									"\"totalinputs\" : \"" + (lstTickets!=null?lstTickets.getTotalinputs():"0")+ "\" " +
//									"},"
//									);
//				StringBuilder strJson2 = new StringBuilder();
//				strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
//				out.print(strJson2);
//				System.out.println(strJson2);
//				}
//				catch(Exception ex){
//					ex.printStackTrace();
//				}	
//	    }
//	 
//	 private void obtener_distribucion_LineaBase_Onsite(String id_sla, String vmes, String vanio, HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException{
//		
//		 res.setCharacterEncoding("UTF-8");
//		 
//		 StringBuilder objJson1 = new StringBuilder();	
//		 StringBuilder strJson2 = new StringBuilder();
//		 PrintWriter out = res.getWriter();
//		 try{
//	    		BusinessLineaBaseOnsite objTickets = new BusinessLineaBaseOnsite();
//	    		List<LineaBaseOnsiteDistribucion> listaResultado = new ArrayList<LineaBaseOnsiteDistribucion>();
//	    		
//	    		listaResultado = objTickets.obtenerDistribucionLineaBaseOnsite(id_sla, vmes, vanio, ssf);
//				
//				objJson1.append("{\"lineaBaseOnsite\": [");
//				
//				if(listaResultado != null) {
//					for(LineaBaseOnsiteDistribucion bean: listaResultado) {
//						objJson1.append("{" +
//								"\"id\" : \"" + (bean!=null?bean.getId():"0")+ "\" ," +
//								"\"id_resultado_sla\" : \"" + (bean!=null?bean.getId_resultado_sla():"0")+ "\" ," +
//								"\"descripcion\" : \"" + (bean!=null?bean.getDescripcion():"0")+ "\" ," +
//								"\"id_lineabase_detalle\" : \"" + (bean!=null?bean.getId_lineabase_detalle():"0")+ "\" ," +
//								"\"resultado\" : \"" + (bean!=null?bean.getResultado():"0")+ "\" " +
//								"},"
//								);	
//				}
//					
//				}else {
//					objJson1.append("{},");
//				}
//				
//				}
//				catch(Exception ex){
//					ex.printStackTrace();
//					objJson1.append("{},");
//				}finally {
//					strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
//					out.print(strJson2);	
//				}	
//	    }
//	 
//	 	private void obtener_detalleNivelServicioOnsite(String id_sla, String vmes, String vanio, HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException{
//	 		
//	 		res.setCharacterEncoding("UTF-8");
//	 		
//	 		StringBuilder objJson1 = new StringBuilder();
//			
//			PrintWriter out = res.getWriter();
//	 		
//	 		try{
//				BusinessNivelServicio objTickets = new BusinessNivelServicio();
//				BeanSLATiempoOnsiteResultado bean = new BeanSLATiempoOnsiteResultado();
//				bean = objTickets.obtenerTiempoOnsiteResultado(id_sla, vmes, vanio, ssf);
//			
//				
//				
//				objJson1.append("{\"DetalleNivelServicioOnsite\": [");
//				if(bean != null) {
//					objJson1.append("{" +
//							"\"id_sla_resultado_mensual\" : \"" + (bean!=null?bean.getId_sla_resultado_mensual():"0")+ "\" ," +
//							"\"vip_cant\" : \"" + (bean!=null?bean.getVip_cant():"0")+ "\" ," +
//							"\"vip_en_sla\" : \"" + (bean!=null?bean.getVip_en_sla():"0")+ "\" ," +
//							"\"vip_res_sla\" : \"" + (bean!=null?bean.getVip_res_sla():"0")+ "\" ," +
//							"\"alta_cant\" : \"" + (bean!=null?bean.getAlta_cant():"0")+ "\" ," +
//							"\"alta_en_sla\" : \"" + (bean!=null?bean.getAlta_en_sla():"0")+ "\" ," +
//							"\"alta_res_sla\" : \"" + (bean!=null?bean.getAlta_res_sla():"0")+ "\" ," +
//							"\"media_cant\" : \"" + (bean!=null?bean.getMedia_cant():"0")+ "\" ," +
//							"\"media_en_sla\" : \"" + (bean!=null?bean.getMedia_en_sla():"0")+ "\" ," +
//							"\"media_res_sla\" : \"" + (bean!=null?bean.getMedia_res_sla():"0")+ "\" ," +
//							"\"baja_cant\" : \"" + (bean!=null?bean.getBaja_cant():"0")+ "\" ," +
//							"\"baja_en_sla\" : \"" + (bean!=null?bean.getBaja_en_sla():"0")+ "\" ," +
//							"\"baja_res_sla\" : \"" + (bean!=null?bean.getBaja_res_sla():"0")+ "\" ," +
//							"\"ptrabajo_cant\" : \"" + (bean!=null?bean.getPtrabajo_cant():"0")+ "\" ," +
//							"\"ptrabajo_en_sla\" : \"" + (bean!=null?bean.getPtrabajo_en_sla():"0")+ "\" ," +
//							"\"ptrabajo_res_sla\" : \"" + (bean!=null?bean.getPtrabajo_res_sla():"0")+ "\" " +
//							"},"
//							);
//				}
//					
//				StringBuilder strJson2 = new StringBuilder();
//				strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
//				out.print(strJson2);
//				System.out.println(strJson2);
//				}
//				catch(Exception ex){
//					ex.printStackTrace();
//				}	
//	    }
//	 	
//	 	public void getReporteTickets(String strFecha, String id_proyecto, HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
//			
//	 		res.setCharacterEncoding("UTF-8");
//	 		
//	 		StringBuilder strJson1 = new StringBuilder();
//			StringBuilder strJson2 = new StringBuilder();
//			
//			res.setCharacterEncoding("UTF-8");
//			PrintWriter out = res.getWriter();
//			
//			try{
//				BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
//				
//				List<BeanTicketSRINC> listTickets = new ArrayList<BeanTicketSRINC>();
//				BeanTicketSRINC pBean = new BeanTicketSRINC();
//				pBean.setProyectoid(id_proyecto);;
//				pBean.setFechaPeriodo(strFecha);
//				try {
//				listTickets = objBusinessMaximoMobility.getTicketSRINC(pBean, ssf);
//				}catch(Exception e) {
//				e.printStackTrace();
//				System.out.println("Entro al catch");
//				}
//				
//				System.out.println("Tamañp lista Tickets: "+objBusinessMaximoMobility.getTicketSRINC(pBean, ssf).size());
//				strJson1 = new StringBuilder();
//				strJson1.append("{\"ReporteTickets\" : [");
//				new AppUtils();
//				new AppUtils();
//				//GENERA CONTENIDO JSON
//				
//				if(listTickets.size() > 0){
//					for(BeanTicketSRINC item : listTickets){
//						
//						new AppUtils();
//						strJson1.append("{" +
//								"\"TICKETID\" : \"" + item.getTicketid() + "\" ," +
//								"\"WOCH\" : \"" + item.getWoch() + "\" ," +
//								"\"STRCLASS\" : \"" + item.getStrclass() + "\" ," +
//								"\"STATUS\" : \"" + item.getStatus() + "\" ," +
//								"\"INTERNALPRIORITY\" : \"" + item.getInternalpriority() + "\" ," +
//								"\"EXTERNALSYSTEM\" : \"" + item.getExternalsystem() + "\" ," +
//								"\"IDCALLMNG\" : \"" + (item.getIdcallmng() == null ? "": item.getIdcallmng())+ "\" ," +
//								"\"SERVICE\" : \"" +  (item.getService() == null ? "" : item.getService())+ "\" ," +
//								"\"SERVICELINE\" : \"" + (item.getServiceline() == null ? "" : item.getServiceline() ) + "\" ," +
//								"\"PLUSCUSTOMER\" : \"" + (item.getPluscustomer() == null ? "" : item.getPluscustomer()) + "\" ," +
//								"\"NAMECLIENTE\" : \"" + (item.getNamecliente() == null ? "" : item.getNamecliente())  + "\" ," +
//								"\"LOCATION\" : \"" + (item.getLocation() == null ? "": item.getLocation()) + "\" ," +
//								"\"DESCRIPTIONLOCATION\" : \"" +  (item.getDescriptionlocation() == null ? "" : item.getDescriptionlocation() ) + "\" ," +
//								"\"CREATIONDATE\" : \"" +  item.getCreationdate()+ "\" ," +
//								"\"ITDCHCREATEDBYGROUP\" : \"" + (item.getItdchcreatedbygroup() == null ? "": item.getItdchcreatedbygroup()) + "\" ," +
//								"\"EMAILCREATEDBY\" : \"" + (item.getEmailcreatedby() == null ? "" : item.getEmailcreatedby()) + "\" ," +
//								"\"NAMECREATEDBY\" : \"" + (item.getNamecreatedby() == null ? "" : item.getNamecreatedby()) + "\" ," +
//								"\"EMAILREPORTEDBY\" : \"" + (item.getEmailreportedby() == null ? "" : item.getEmailreportedby()) + "\" ," +
//								"\"NAMEREPORTEDBY\" : \"" + (item.getNamereportedby() == null ? "" : item.getNamereportedby()) + "\" ," +                   
//								"\"EMAILAFFECTEDPERSON\" : \"" + (item.getEmailaffectedperson() == null ? "" : item.getEmailaffectedperson()) + "\" ," +
//								"\"NAMEAFFECTEDPERSON\" : \"" + (item.getNameaffectedperson() == null ? "" : item.getNameaffectedperson()) + "\" ," +
//								"\"OWNERGROUP\" : \"" + (item.getOwnergroup() == null ? "": item.getOwnergroup()) + "\" ," +
//								"\"ITDRESOLVERGROUP\" : \"" + (item.getItdresolvergroup() == null ? "" : item.getItdresolvergroup()) + "\" ," +
//								"\"EMAILOWNER\" : \"" + (item.getEmailowner() == null ? "" : item.getEmailowner()) + "\" ," +
//								"\"NAMEOWNER\" : \"" + (item.getNameowner() == null ? "" : item.getNameowner()) + "\" ," +
//								"\"FINISHDATE\" : \"" + (item.getFinishdate() == null ? "" : item.getFinishdate())  + "\" ," +
//								"\"CLASSIFICATIONID\" : \"" + (item.getClassificationid() == null ? "" : item.getClassstructureid())  + "\" ," +
//								"\"CLASIFICACION\" : \"" + (item.getClassification()== null ? "" : item.getClassification())  + "\" ," +
//								"\"CLASSSTRUCTUREID\" : \"" + (item.getClassstructureid() == null ? "" : item.getClassstructureid()) + "\" ," +
//								"\"CLASSIFICATIONLEVEL1\" : \"" + (item.getClassificationlevel1() == null ? "" : item.getClassificationlevel1()) + "\" ," +
//								"\"CLASSIFICATIONLEVEL2\" : \"" + (item.getClassificationlevel2() == null ? "" : item.getClassificationlevel2()) + "\" ," +
//								"\"CLASSIFICATIONLEVEL3\" : \"" + (item.getClassificationlevel3() == null ? "" : item.getClassificationlevel3()) + "\" ," +
//								"\"CLASSIFICATIONLEVEL4\" : \"" +  (item.getClassificationlevel4() == null ? "" : item.getClassificationlevel4() == null) + "\" ," +
//								"\"CINUM\" : \"" + (item.getCinum() == null ? "":item.getCinum()) + "\" ," +
//								"\"CINUMDESC\" : \"" + (item.getCinumdesc()== null ? "":item.getCinumdesc()) + "\" ," +
//								"\"FCR\" : \"" + (item.getFcr() == null ? "":item.getFcr()) + "\" ," +
//								"\"ISGLOBAL\" : \"" + item.getIsglobal() + "\" ," +
//								"\"GLOBALTICKETCLASS\" : \"" +  (item.getGlobalticketclass() == null ? "": item.getGlobalticketclass())+ "\" ," +
//								"\"GLOBALTICKETID\" : \"" +  (item.getGlobalticketid() == null ? "": item.getGlobalticketid())+ "\" ," +
//								"\"ITDCLOSURECODE\" : \"" + (item.getItdclosurecode() == null ? "" : item.getItdclosurecode()) + "\" ," +
//								"\"ITDMAJORINCIDENT\" : \"" + (item.getItdmajorincident() == null ? "": item.getItdmajorincident()) + "\" ," +
//								"\"ORIGRECORDCLASS\" : \"" +  (item.getOrigrecordclass() == null ? "": item.getOrigrecordclass() ) + "\" ," +
//								"\"ORIGRECORDID\" : \"" + (item.getOrigrecordid() == null ? "": item.getOrigrecordid()) + "\" ," +
//								"\"RELATEDTOGLOBAL\" : \"" + (item.getRelatedtoglobal() == null ? "" : item.getRelatedtoglobal()) + "\" ," +
//								"\"DESCRIPTION\" : \"" + (AppUtils.cleanString(item.getDescription())== null ? "": AppUtils.cleanString(item.getDescription())) + "\" ," +
//								"\"DETAIL\" : \"" + (AppUtils.cleanString(item.getDetail())==null ? "" : AppUtils.cleanString(item.getDetail())) + "\" ," +
//								"\"SINTOMA\" : \"" + (AppUtils.cleanString(item.getSintoma()==null ? "" : AppUtils.cleanString(item.getSintoma()))) + "\" ," +
//								"\"CAUSA\" : \"" + (AppUtils.cleanString(item.getCausa()==null ? "" : AppUtils.cleanString(item.getCausa()))) + "\" ," +
//								"\"SOLUCION\" : \"" + (AppUtils.cleanString(item.getSolucion()==null ? "" : AppUtils.cleanString(item.getSolucion()))) + "\" ," +
//								"\"CHANGEBY_TKWEB\" : \"" + (AppUtils.cleanString(item.getChangeby_tkweb()==null ? "" : AppUtils.cleanString(item.getChangeby_tkweb()))) + "\" ," +
//								"\"CHANGEDATE_TKWEB\" : \"" + (item.getChangedate_tkweb()==null ? "" : item.getChangedate_tkweb()) + "\" ," +
//								"\"TIEMPO_ESCALAMIENTO\" : \"" + (item.getTiempoescalamiento()) + "\" ," +
//								"\"TIEMPO_RESPUESTA\" : \"" + (item.getTiemporespuesta()) + "\" ," +
//								"\"TIEMPO_SOLUCION\" : \"" + (item.getTiemposolucion()) + "\" ," +
//								"\"TKREABIERTO\" : \"" + (item.getTkreabierto()) + "\" ," +
//								"\"GESTIONWEB\" : \"" + (item.getGestionweb()) + "\" ," +
//								"\"FECHA_ENCUESTA\" : \"" + (item.getFecha_encuesta()) + "\" ," +
//								"\"PREGUNTA_ENCUESTA\" : \"" + (item.getPregunta_encuesta()) + "\" ," +
//								"\"RESPUESTA_ENCUESTA\" : \"" + (item.getRespuesta_encuesta()) + "\" ," +
////								"\"COMENTARIO_ENCUESTA\" : \"" + (item.getComentario_encuesta())+ "\" ," +
//								"\"ATENCION_MASIVA\" : \"" + (item.getAtencion_masiva()) + "\" " +
//								"},"
//								);
//							
//					}
//				}
//				else
//					strJson1.append(",");
//							
//				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
//
//			}catch(Exception ex){
//				System.out.println(ex.getStackTrace());
//				strJson2 = new StringBuilder();
//				strJson2.append("error");
//			}
//			
//			out.print(strJson2);
//		}
//	 	
//	 	public void getReporteWorkOrder(String strFecha, String id_proyecto, int opcionMapper, HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
//			StringBuilder strJson1 = new StringBuilder();
//			StringBuilder strJson2 = new StringBuilder();
//			
//			res.setCharacterEncoding("UTF-8");
//			PrintWriter out = res.getWriter();
//			
//			try{
//				BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
//				List<WorkOrder> listTickets = new ArrayList<WorkOrder>();
//				BeanBusqueda pBean = new BeanBusqueda();
//				pBean.setIdproyecto(id_proyecto);
//				pBean.setFechaInicio(strFecha);
//
//				listTickets = objBusinessMaximoMobility.getMaximoTicketWorkOrder(opcionMapper, pBean, ssf);
//				
//				
//				System.out.println("Tamaño lista Ticketswo: "+listTickets.size());
//				strJson1 = new StringBuilder();
//				strJson1.append("{\"ReporteWO\" : [");
//				new AppUtils();
//				new AppUtils();
//				//GENERA CONTENIDO JSON
//				
//				if(listTickets.size() > 0){
//					for(WorkOrder item : listTickets){
//						
//						new AppUtils();
//						strJson1.append("{" +
//								"\"id\" : \"" + item.getId() + "\" ," +
//								"\"wogroupwa\" : \"" + item.getWogroupwa() + "\" ," +
//								"\"taskidwa\" : \"" + item.getTaskidwa()+ "\" ," +
//								"\"descriptionwa\" : \"" + item.getDescriptionwa()+ "\" ," +
//								"\"pluspcustomerwa\" : \"" + item.getPluspcustomerwa()+ "\" ," +
//								"\"estadowa\" : \"" + (item.getEstadowa()== null ? "": item.getEstadowa())+ "\" ," +
//								"\"woprioritywa\" : \"" +   item.getWoprioritywa() + "\" ," +
//								"\"actstartwa\" : \"" + (item.getActstartwa() == null ? "" : item.getActstartwa() ) + "\" ," +
//								"\"changebywa\" : \"" + (item.getChangebywa()== null ? "" : item.getChangebywa()) + "\" ," +
//								"\"cinum\" : \"" + (item.getCinum()== null ? "" : item.getCinum())  + "\" ," +
//								"\"serviceline\" : \"" + (item.getServiceline()== null ? "": item.getServiceline()) + "\" ," +
//								"\"ownerwa\" : \"" +  (item.getOwnerwa() == null ? "" : item.getOwnerwa() ) + "\" ," +
//								"\"ownergroupwa\" : \"" +  item.getOwnergroupwa()+ "\" ," +
//								"\"reportdatewa\" : \"" + (item.getReportdatewa()== null ? "": item.getReportdatewa()) + "\" ," +
//								"\"reportedbywa\" : \"" + (item.getReportedbywa() == null ? "" : item.getReportedbywa()) + "\" ," +
//								"\"statusdatewa\" : \"" + (item.getStatusdatewa() == null ? "" : item.getStatusdatewa()) + "\" ," +
//								"\"woclasswa\" : \"" + (item.getWoclasswa() == null ? "" : item.getWoclasswa()) + "\" ," +
//								"\"tarea\" : \"" + (item.getTarea() == null ? "" : item.getTarea()) + "\" ," +
//								"\"jpnum\" : \"" + (item.getJpnum() == null ? "" : item.getJpnum()) + "\" ," +
//								"\"jpdescription\" : \"" + (item.getJpdescription() == null ? "" : item.getJpdescription()) + "\" ," +
//								"\"actfinish\" : \"" + (item.getActfinish()== null ? "": item.getActfinish()) + "\" ," +
//								"\"woactualfin\" : \"" + (item.getWoactualfin() == null ? "" : item.getWoactualfin()) + "\" ," +
//								"\"wonumwa\" : \"" + (item.getWonumwa() == null ? "" : item.getWonumwa()) + "\" ," +
//								"\"habPuestoTrabajo\" : \"" + item.getHabPuestoTrabajo() + "\" " +
//								"},"
//								);
//					}
//				}
//				else
//					strJson1.append(",");
//	
//				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
//		
//			}catch(Exception ex){
//				System.out.println(ex.getStackTrace());
//				strJson2 = new StringBuilder();
//				strJson2.append("error");
//			}
//			
//			System.out.println("strJson2"+strJson2);
//			out.print(strJson2);
//		}
//	 	
//	 	public void getReporteLlamadas(String strFecha, String id_proyecto, HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
//			StringBuilder strJson1 = new StringBuilder();
//			StringBuilder strJson2 = new StringBuilder();
//			
//			res.setCharacterEncoding("UTF-8");
//			PrintWriter out = res.getWriter();
//			
//			try{
//				BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
//				List<BeanReporteLlamadas> listLlamadasContestadas = null;
//				List<BeanReporteLlamadas> listLlamadasNoContestadas = null;
//				BeanReporteLlamadas pBeanLlamadas = new BeanReporteLlamadas();
//				pBeanLlamadas.setIdProyecto(Integer.parseInt(id_proyecto));
//				pBeanLlamadas.setStr1(strFecha);
//				System.out.println("BEAN "+ pBeanLlamadas.getStr1());
//				listLlamadasContestadas = objBusinessMaximoMobility.getReporteLlamadasContestadas(pBeanLlamadas, ssf);
//				listLlamadasNoContestadas = objBusinessMaximoMobility.getReporteLlamadasNoContestadas(pBeanLlamadas, ssf);
//				
//				strJson1.append("{\"ReporteLlamadas\" : [");
//				
//				if(listLlamadasContestadas.size() > 0){
//					for(BeanReporteLlamadas item : listLlamadasContestadas){
//						strJson1.append("{" +
//								"\"fechaInicio\" : \"" + item.getFechainicio() + "\" ," +
//								"\"tiempoCola\" : \"" + String.format("%02d:%02d:%02d", item.getTiempocolan() / 3600, (item.getTiempocolan() % 3600) / 60, item.getTiempocolan() % 60)+ "\" ," +
//								"\"tiempoConversacion\" : \"" + item.getTiempoconversacion() + "\" ," +
//								"\"agente\" : \"" + item.getAgente()+ "\" ," +
//								"\"tipo\" : \"" + "Contestada"+ "\" " +
//								"},"
//								);
//					}
//				}
//				
//				if(listLlamadasNoContestadas.size() > 0){
//					for(BeanReporteLlamadas item : listLlamadasNoContestadas){
//						strJson1.append("{" +
//								"\"fechaInicio\" : \"" + item.getFechainicio() + "\" ," +
//								"\"tiempoCola\" : \"" + String.format("%02d:%02d:%02d", item.getTiempocolan() / 3600, (item.getTiempocolan() % 3600) / 60, item.getTiempocolan() % 60) + "\" ," +
//								"\"tiempoConversacion\" : \"" + "" + "\" ," +
//								"\"agente\" : \"" + ""+ "\" ," +
//								"\"tipo\" : \"" + item.getTipollamada() + "\" " +
//								"},"
//								);
//					}
//				}
//				else {
//					strJson1.append(",");
//				}
//		
//				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
//		
//				
//			}catch(Exception ex){
//				System.out.println(ex.getStackTrace());
//				strJson2 = new StringBuilder();
//				strJson2.append("error");
//			}
//			
//			System.out.println("strJson2"+strJson2);
//			out.print(strJson2);
//		}
//	 	
//	 	public void getResumenSLA(String strFecha, String id_proyecto, String cliente, String vmes, String vanio, HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
//			StringBuilder strJson1 = new StringBuilder();
//			StringBuilder strJson2 = new StringBuilder();
//			
//			res.setCharacterEncoding("UTF-8");
//			PrintWriter out = res.getWriter();
//			
//			//Consolidar SLA de Mesa de Ayud y Soporte en Sitio
//			BusinessNivelServicio objNS = new BusinessNivelServicio();
//			List<BeanNivelServicio>  listNS= new ArrayList<BeanNivelServicio>();
//			try{
//				
//			try {
//				listNS = objNS.listNivelServicio(cliente, ssf);	
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//			
//			strJson1.append("{\"NivelServicio\" : [");
//			
//			
//			
//			if(listNS != null) {
//				for(BeanNivelServicio obj : listNS){
//					strJson1.append("{" +
//							"\"id_sla\" : \"" + obj.getIdNS()+ "\" ," +
//							"\"id_proyecto\" : \"" + obj.getIdproyecto()+ "\" ," +
//							"\"id_sl\" : \"" + obj.getId_sl()+ "\" ," +
//							"\"nombre_sl\" : \"" + obj.getNombre_sl()+ "\" ," +
//							"\"id_tipo\" : \"" + obj.getId_tipo()+ "\" ," +
//							"\"nombre_tipo\" : \"" + obj.getNombre_tipo()+ "\" ," +
//							"\"titulo\" : \"" + obj.getTitulo()+ "\" ," +
//							"\"descripcion\" : \"" + obj.getDescripcion()+ "\" ," +
//							"\"valornum\" : \"" + obj.getValornum()+ "\" ," +
//							"\"valorletra\" : \"" + obj.getValorletra()+ "\" ," +
//							"\"comentario\" : \"" + obj.getComentario()+ "\" ," +
//							"\"icono\" : \"" + obj.getIcono()+ "\" ," +
//							"\"color\" : \"" + obj.getColor()+ "\" ," +
//							"\"red_color\" : \"" + obj.getRed_color()+ "\" ," +
//							"\"red_inicio\" : \"" + obj.getRed_inicio()+ "\" ," +
//							"\"red_fin\" : \"" + obj.getRed_fin()+ "\" ," +
//							"\"yellow_color\" : \"" + obj.getYellow_color()+ "\" ," +
//							"\"yellow_inicio\" : \"" + obj.getYellow_inicio()+ "\" ," +
//							"\"yellow_fin\" : \"" + obj.getYellow_fin()+ "\" ," +
//							"\"green_color\" : \"" + obj.getGreen_color()+ "\" ," +
//							"\"green_inicio\" : \"" + obj.getGreen_inicio()+ "\" ," +
//							"\"green_fin\" : \"" + obj.getGreen_fin()+ "\" ," +
//							"\"nombre_cvs\" : \"" + obj.getNombre_cvs()+ "\" ," +
//							"\"unidad\" : \"" + obj.getUnidad()+ "\" ," +
//							"\"str1\" : \"" + (obj.getStr1()!=null?obj.getStr1():"")+ "\" ," +
//							"\"str2\" : \"" + (obj.getStr2()!=null?obj.getStr2():"")+ "\" ," +
//							"\"nombre_grafico_live\" : \"" + obj.getNombre_grafico_live()+ "\" ," +
//							"\"nombre_grafico_historico\" : \"" + obj.getNombre_grafico_historico()+ "\" " +
//							"},"
//							);
//				}
//			}else {
//				strJson1.append(",");
//			}
//
//			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
//			strJson1 = new StringBuilder();
//			
//			// Consolidar Resultados de NIveles de Servicio
//			BusinessNivelServicio objResultadoNS = new BusinessNivelServicio();
//			List<BeanResultadoMensualNivelServicio> listResultadoNS = new ArrayList<BeanResultadoMensualNivelServicio>();
//			listResultadoNS = objResultadoNS.listResultadoMensualNivelServicio(id_proyecto, vmes, vanio, ssf);
//			
//			strJson1.append("\"Resultado_NS\": [");
//			if(listResultadoNS.size() > 0 ) {
//			for(BeanResultadoMensualNivelServicio beanResultadoNS : listResultadoNS){
//				strJson1.append("{" +
//						"\"valornum\" : \"" + (beanResultadoNS!=null?beanResultadoNS.getValornum():"") + "\" ," +
//						"\"valorletra\" : \"" + (beanResultadoNS!=null?beanResultadoNS.getValorletra():"") + "\" ," +
//						"\"colormes\" : \"" + (beanResultadoNS!=null?beanResultadoNS.getColormes():"") + "\" ," +
//						"\"id_sla\" : \"" + (beanResultadoNS!=null?beanResultadoNS.getId_sla():"") + "\" ," +
//						"\"valor1\" : \"" + (beanResultadoNS.getValor1()) + "\" ," +
//						"\"valor2\" : \"" + (beanResultadoNS.getValor2()) + "\"" +
//						"},"
//						);
//			}
//			}else {
//				strJson1.append(",");
//			}
//			
//			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
//			strJson1 = new StringBuilder();
//			
//			//Consolidar linea Base Mesa de Ayuda últimos 12 meses
//			
//			BusinessDistribucionTickets servDistTicket = new BusinessDistribucionTickets();
//			List<BeanDistribucionTickets> listDistTicket = new ArrayList<BeanDistribucionTickets>();
//			
//			try {
//				listDistTicket = servDistTicket.getLineaBaseSDDHistorico(id_proyecto, strFecha, ssf);		
//			}catch(Exception e) {
//				e.printStackTrace();
//			}
//			
//			strJson1.append("\"DistribucionTicket\" : [");
//			
//			if(listDistTicket != null) {
//				for(BeanDistribucionTickets bean : listDistTicket) {
//						strJson1.append("{" +
//										"\"mes\" : \"" + (bean.getMes()!=null?bean.getMes():"0")+ "\" ," +
//										"\"anio\" : \"" + (bean.getAnio()!=null?bean.getAnio():"0")+ "\" ," +
//										"\"telefono\" : \"" + (bean.getTelefono()!=null?bean.getTelefono():"0")+ "\" ," +
//										"\"correo\" : \"" + (bean.getCorreo()!=null?bean.getCorreo():"0")+ "\" ," +
//										"\"correobuzon\" : \"" + (bean.getCorreobuzon()!=null?bean.getCorreobuzon():"0")+ "\" ," +
//										"\"catalogo\" : \"" + (bean.getCatalogo()!=null?bean.getCatalogo():"0")+ "\" ," +
//										"\"adicional\" : \"" + (bean.getAdicional()!=null?bean.getAdicional():"0")+ "\" ," +
//										"\"chat\" : \"" + (bean.getChat()!=null?bean.getChat():"0")+ "\" ," +
//										"\"total\" : \"" + (bean.getTotal()!=null?bean.getTotal():"0")+ "\" ," +
//										"\"totalinputs\" : \"" + (bean.getTotalinputs()!=null?bean.getTotalinputs():"0")+ "\" " +
//										"},"
//										);
//
//				}
//				
//			}else {
//				strJson1.append(",");
//			}
//	
//				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
//
//			}catch(Exception ex){
//				System.out.println(ex.getStackTrace());
//				strJson2 = new StringBuilder();
//				strJson2.append("error");
//			}
//			
//			System.out.println("strJson2"+strJson2);
//			out.print(strJson2);
//		}

}
