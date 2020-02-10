package com.pe.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet("/ServletMobilitySLA")
public class ServletMobilitySLA extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BeanSession objBeanSession = new BeanSession();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMobilitySLA() {
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
		String semana;
		String mes;
		String anio;
		String strFecha;
		int id_opcion;
		String cliente ;
//		String periodo = request.getParameter("periodo");
//		String proyecto = request.getParameter("proyecto");
		int tipoVista;
		
		int tipo=Integer.parseInt(request.getParameter("strAccion"));
		
		switch(tipo) { 
		case 1: //Listar Proyectos Mobility
			listarProyectos(request, response, ssfSmartDesk);	
			break;
		case 2: //Listar Niveles de Servicio Mobility
			cliente = request.getParameter("cliente");
			nivelServicioProyecto(cliente, request, response, ssfSmartDesk);
			break;
		case 3: //Listar Resultado Niveles Servicio Mobility
			id_proyecto = request.getParameter("id_proyecto");
			mes = request.getParameter("mes");
			anio = request.getParameter("anio");
			obtener_resultado_sla(id_proyecto,mes ,anio, request, response, ssfSmartDesk);
			break;
		case 4: //Listar Resultado Distribucion tickets Mesa de Ayuda
			id_proyecto = request.getParameter("id_proyecto");
			mes = request.getParameter("mes");
			anio = request.getParameter("anio");
			distribucionTickets(id_proyecto ,mes ,anio, request, response, ssfSmartDesk);
			break;
		case 5: //Listar Resultado Distribucion tickets Linea Base Onsite
			id_sla = request.getParameter("id_sla");
			mes = request.getParameter("mes");
			anio = request.getParameter("anio");
			obtener_distribucion_LineaBase_Onsite(id_sla ,mes ,anio, request, response, ssfSmartDesk);
			break;
		case 6: //Listar Resultado Detalle Nivel de Servicio Onsite
			id_proyecto = request.getParameter("id_proyecto");
			id_sla = request.getParameter("id_sla");
			mes = request.getParameter("mes");
			anio = request.getParameter("anio");
			strFecha = request.getParameter("anio")+"-"+request.getParameter("mes")+"-"+"01";
			obtener_detalleNivelServicioOnsite(id_sla, mes ,anio,request, response, ssfSmartDesk);
			break;
		case 7: //Listar SABANA DE TICKETS SR FULL 
			id_proyecto = request.getParameter("id_proyecto");
			strFecha = request.getParameter("anio")+"-"+request.getParameter("mes")+"-"+"01";
			getReporteTickets(strFecha,id_proyecto,request,response,ssfSmartDesk);
			break;
		case 8: //Listar SABANA DE LLAMADAS 
			System.out.println("Case 8");
			id_proyecto = request.getParameter("id_proyecto");
			System.out.println("id_proyecto "+id_proyecto);
			tipoVista = Integer.parseInt(request.getParameter("tipoVista"));
			System.out.println("tipoVista "+tipoVista);
			strFecha = request.getParameter("anio")+"-"+request.getParameter("mes")+"-"+"01";
			System.out.println("strFecha "+strFecha);
			semana = request.getParameter("semana");
			System.out.println("semana "+semana);
			getReporteLlamadas(semana, tipoVista,strFecha,id_proyecto,request,response,ssfSmartDesk);
			break;
		case 9: //Listar SABANA DE WO 
			id_proyecto = request.getParameter("id_proyecto");
			id_opcion = Integer.parseInt(request.getParameter("id_opcion"));
			strFecha = request.getParameter("anio")+"-"+request.getParameter("mes")+"-"+"01";
			getReporteWorkOrder(strFecha,id_proyecto, id_opcion,request,response,ssfSmartDesk);
			break;
		case 10: //Listar Resumen de Resultados del mes para el Informe Mensual
			id_proyecto = request.getParameter("id_proyecto");
			strFecha = request.getParameter("anio")+"-"+request.getParameter("mes")+"-"+"01";
			cliente = request.getParameter("cliente");
			mes = request.getParameter("mes");
			anio = request.getParameter("anio");
			getResumenSLA(strFecha,id_proyecto,cliente,mes ,anio,request,response,ssfSmartDesk);
			break;
		case 11: //Graficos Dashboard para el Informe Mensual
			id_proyecto = request.getParameter("id_proyecto");
			strFecha = request.getParameter("anio")+"-"+request.getParameter("mes")+"-"+"01";
			cliente = request.getParameter("cliente");
			mes = request.getParameter("mes");
			anio = request.getParameter("anio");
			getgraficosTickets(strFecha,id_proyecto,cliente,mes ,anio,request,response,ssfSmartDesk);
			break;
		case 12: //Listar resultado NS historico
			id_proyecto = request.getParameter("id_proyecto");
			strFecha = request.getParameter("anio")+"-"+request.getParameter("mes")+"-"+"01";
			obtener_resultado_historico_sla(id_proyecto,strFecha,request,response,ssfSmartDesk);
			break;
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
	private void nivelServicioProyecto(String vcliente, HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		
		try{
			BusinessNivelServicio objNS = new BusinessNivelServicio();
			List<BeanNivelServicio>  listNS= new ArrayList<BeanNivelServicio>();
			listNS = objNS.listNivelServicio(vcliente, ssf);

			StringBuilder objJson1 = new StringBuilder();
			PrintWriter out = res.getWriter();
			
			objJson1.append("{\"NivelServicio\": [");
			for(BeanNivelServicio obj : listNS){
				objJson1.append("{" +
						"\"id_sla\" : \"" + obj.getIdNS()+ "\" ," +
						"\"id_proyecto\" : \"" + obj.getIdproyecto()+ "\" ," +
						"\"id_sl\" : \"" + obj.getId_sl()+ "\" ," +
						"\"nombre_sl\" : \"" + obj.getNombre_sl()+ "\" ," +
						"\"id_tipo\" : \"" + obj.getId_tipo()+ "\" ," +
						"\"nombre_tipo\" : \"" + obj.getNombre_tipo()+ "\" ," +
						"\"titulo\" : \"" + obj.getTitulo()+ "\" ," +
						"\"descripcion\" : \"" + obj.getDescripcion()+ "\" ," +
						"\"valornum\" : \"" + obj.getValornum()+ "\" ," +
						"\"valorletra\" : \"" + obj.getValorletra()+ "\" ," +
						"\"comentario\" : \"" + obj.getComentario()+ "\" ," +
						"\"icono\" : \"" + obj.getIcono()+ "\" ," +
						"\"color\" : \"" + obj.getColor()+ "\" ," +
						"\"red_color\" : \"" + obj.getRed_color()+ "\" ," +
						"\"red_inicio\" : \"" + obj.getRed_inicio()+ "\" ," +
						"\"red_fin\" : \"" + obj.getRed_fin()+ "\" ," +
						"\"yellow_color\" : \"" + obj.getYellow_color()+ "\" ," +
						"\"yellow_inicio\" : \"" + obj.getYellow_inicio()+ "\" ," +
						"\"yellow_fin\" : \"" + obj.getYellow_fin()+ "\" ," +
						"\"green_color\" : \"" + obj.getGreen_color()+ "\" ," +
						"\"green_inicio\" : \"" + obj.getGreen_inicio()+ "\" ," +
						"\"green_fin\" : \"" + obj.getGreen_fin()+ "\" ," +
						"\"nombre_cvs\" : \"" + obj.getNombre_cvs()+ "\" ," +
						"\"unidad\" : \"" + obj.getUnidad()+ "\" ," +
						"\"str1\" : \"" + (obj.getStr1()!=null?obj.getStr1():"")+ "\" ," +
						"\"str2\" : \"" + (obj.getStr2()!=null?obj.getStr2():"")+ "\" ," +
						"\"idtendencia\" : \"" + (obj.getIdtendencia()!=null?obj.getIdtendencia():"")+ "\" ," +
						"\"nombre_grafico_live\" : \"" + obj.getNombre_grafico_live()+ "\" ," +
						"\"nombre_grafico_historico\" : \"" + obj.getNombre_grafico_historico()+ "\" " +
						"},"
						);
			}
			StringBuilder strJson2 = new StringBuilder();
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			out.print(strJson2);
			
		}catch(Exception ex){
			
		}
	}
	
	 private void obtener_resultado_sla(String id_proyecto, String vmes, String vanio, HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException{
	    
		 res.setCharacterEncoding("UTF-8");
		 
		 StringBuilder objJson1 = new StringBuilder();
		 StringBuilder strJson2 = new StringBuilder();
		 PrintWriter out = res.getWriter();
		 try{
				BusinessNivelServicio objResultadoNS = new BusinessNivelServicio();
				List<BeanResultadoMensualNivelServicio> listResultadoNS = new ArrayList<BeanResultadoMensualNivelServicio>();
				listResultadoNS = objResultadoNS.listResultadoMensualNivelServicio(id_proyecto, vmes, vanio, ssf);
				
				objJson1.append("{\"Resultado_NS\": [");
				if(listResultadoNS.size() > 0 ) {
				for(BeanResultadoMensualNivelServicio beanResultadoNS : listResultadoNS){
					objJson1.append("{" +
							"\"valornum\" : \"" + (beanResultadoNS!=null?beanResultadoNS.getValornum():"") + "\" ," +
							"\"valorletra\" : \"" + (beanResultadoNS!=null?beanResultadoNS.getValorletra():"") + "\" ," +
							"\"colormes\" : \"" + (beanResultadoNS!=null?beanResultadoNS.getColormes():"") + "\" ," +
							"\"id_sla\" : \"" + (beanResultadoNS!=null?beanResultadoNS.getId_sla():"") + "\" ," +
							"\"valor1\" : \"" + (beanResultadoNS.getValor1()) + "\" ," +
							"\"valor2\" : \"" + (beanResultadoNS.getValor2()) + "\" ," +
							"\"icono\" : \"" + (beanResultadoNS.getIcono()) + "\"" +
							"},"
							);
				}
				}else {
					objJson1.append("{},");
				}
					
				}
				catch(Exception ex){
					ex.printStackTrace();
					objJson1.append("{},");
				}finally {
					strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
					out.print(strJson2);	
				}
	    }
	 
	 private void distribucionTickets(String id_proyecto, String vmes, String vanio, HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException{
	    	try{
				BusinessDistribucionTickets objTickets = new BusinessDistribucionTickets();
				BeanDistribucionTickets lstTickets = new BeanDistribucionTickets();
				lstTickets = objTickets.obtenerDistribucionTickets(id_proyecto, vmes, vanio, ssf);
				
				HttpSession sessionProyectos = req.getSession(false);
				sessionProyectos.setAttribute("bProyecto", lstTickets);
				
				StringBuilder objJson1 = new StringBuilder();
				
				PrintWriter out = res.getWriter();
				
				objJson1.append("{\"DistribucionTickets\": [");

					objJson1.append("{" +
									"\"telefono\" : \"" + (lstTickets!=null?lstTickets.getTelefono():"0")+ "\" ," +
									"\"correo\" : \"" + (lstTickets!=null?lstTickets.getCorreo():"0")+ "\" ," +
									"\"catalogo\" : \"" + (lstTickets!=null?lstTickets.getCatalogo():"0")+ "\" ," +
									"\"adicional\" : \"" + (lstTickets!=null?lstTickets.getAdicional():"0")+ "\" ," +
									"\"chat\" : \"" + (lstTickets!=null?lstTickets.getChat():"0")+ "\" ," +
									"\"correobuzon\" : \"" + (lstTickets!=null?lstTickets.getCorreobuzon():"0")+ "\" ," +
									"\"total\" : \"" + (lstTickets!=null?lstTickets.getTotal():"0")+ "\" ," +
									"\"totalinputs\" : \"" + (lstTickets!=null?lstTickets.getTotalinputs():"0")+ "\" " +
									"},"
									);
				StringBuilder strJson2 = new StringBuilder();
				strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
				out.print(strJson2);
				System.out.println(strJson2);
				}
				catch(Exception ex){
					ex.printStackTrace();
				}	
	    }
	 
	 private void obtener_distribucion_LineaBase_Onsite(String id_sla, String vmes, String vanio, HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException{
		
		 res.setCharacterEncoding("UTF-8");
		 
		 StringBuilder objJson1 = new StringBuilder();	
		 StringBuilder strJson2 = new StringBuilder();
		 PrintWriter out = res.getWriter();
		 try{
	    		BusinessLineaBaseOnsite objTickets = new BusinessLineaBaseOnsite();
	    		List<LineaBaseOnsiteDistribucion> listaResultado = new ArrayList<LineaBaseOnsiteDistribucion>();
	    		
	    		listaResultado = objTickets.obtenerDistribucionLineaBaseOnsite(id_sla, vmes, vanio, ssf);
				
				objJson1.append("{\"lineaBaseOnsite\": [");
				
				if(listaResultado != null) {
					for(LineaBaseOnsiteDistribucion bean: listaResultado) {
						objJson1.append("{" +
								"\"id\" : \"" + (bean!=null?bean.getId():"0")+ "\" ," +
								"\"id_resultado_sla\" : \"" + (bean!=null?bean.getId_resultado_sla():"0")+ "\" ," +
								"\"descripcion\" : \"" + (bean!=null?bean.getDescripcion():"0")+ "\" ," +
								"\"id_lineabase_detalle\" : \"" + (bean!=null?bean.getId_lineabase_detalle():"0")+ "\" ," +
								"\"resultado\" : \"" + (bean!=null?bean.getResultado():"0")+ "\" " +
								"},"
								);	
				}
					
				}else {
					objJson1.append("{},");
				}
				
				}
				catch(Exception ex){
					ex.printStackTrace();
					objJson1.append("{},");
				}finally {
					strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
					out.print(strJson2);	
				}	
	    }
	 
	 	private void obtener_detalleNivelServicioOnsite(String id_sla, String vmes, String vanio, HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException{
	 		
	 		res.setCharacterEncoding("UTF-8");
	 		
	 		StringBuilder objJson1 = new StringBuilder();
			
			PrintWriter out = res.getWriter();
	 		
	 		try{
				BusinessNivelServicio objTickets = new BusinessNivelServicio();
				BeanSLATiempoOnsiteResultado bean = new BeanSLATiempoOnsiteResultado();
				bean = objTickets.obtenerTiempoOnsiteResultado(id_sla, vmes, vanio, ssf);
//				bean = objTickets.obtenerTiempoOnsiteResultado(id_sla, id_proyecto, strFecha, ssf);
				
				
				objJson1.append("{\"DetalleNivelServicioOnsite\": [");
				if(bean != null) {
					objJson1.append("{" +
							"\"id_sla_resultado_mensual\" : \"" + (bean!=null?bean.getId_sla_resultado_mensual():"0")+ "\" ," +
							"\"vip_cant\" : \"" + (bean!=null?bean.getVip_cant():"0")+ "\" ," +
							"\"vip_en_sla\" : \"" + (bean!=null?bean.getVip_en_sla():"0")+ "\" ," +
							"\"vip_res_sla\" : \"" + (bean!=null?bean.getVip_res_sla():"0")+ "\" ," +
							"\"alta_cant\" : \"" + (bean!=null?bean.getAlta_cant():"0")+ "\" ," +
							"\"alta_en_sla\" : \"" + (bean!=null?bean.getAlta_en_sla():"0")+ "\" ," +
							"\"alta_res_sla\" : \"" + (bean!=null?bean.getAlta_res_sla():"0")+ "\" ," +
							"\"media_cant\" : \"" + (bean!=null?bean.getMedia_cant():"0")+ "\" ," +
							"\"media_en_sla\" : \"" + (bean!=null?bean.getMedia_en_sla():"0")+ "\" ," +
							"\"media_res_sla\" : \"" + (bean!=null?bean.getMedia_res_sla():"0")+ "\" ," +
							"\"baja_cant\" : \"" + (bean!=null?bean.getBaja_cant():"0")+ "\" ," +
							"\"baja_en_sla\" : \"" + (bean!=null?bean.getBaja_en_sla():"0")+ "\" ," +
							"\"baja_res_sla\" : \"" + (bean!=null?bean.getBaja_res_sla():"0")+ "\" ," +
							"\"ptrabajo_cant\" : \"" + (bean!=null?bean.getPtrabajo_cant():"0")+ "\" ," +
							"\"ptrabajo_en_sla\" : \"" + (bean!=null?bean.getPtrabajo_en_sla():"0")+ "\" ," +
							"\"ptrabajo_res_sla\" : \"" + (bean!=null?bean.getPtrabajo_res_sla():"0")+ "\" " +
							"},"
							);
				}
					
				StringBuilder strJson2 = new StringBuilder();
				strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
				out.print(strJson2);
				}
				catch(Exception ex){
					ex.printStackTrace();
				}	
	    }
	 	
	 	public void getReporteTickets(String strFecha, String id_proyecto, HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
			
	 		res.setCharacterEncoding("UTF-8");
	 		
	 		StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			try{
				BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
				
				List<BeanTicketSRINC> listTickets = new ArrayList<BeanTicketSRINC>();
				BeanTicketSRINC pBean = new BeanTicketSRINC();
				pBean.setProyectoid(id_proyecto);;
				pBean.setFechaPeriodo(strFecha);
				try {
				listTickets = objBusinessMaximoMobility.getTicketSRINC(pBean, ssf);
				}catch(Exception e) {
				e.printStackTrace();
				}
				
				strJson1 = new StringBuilder();
				strJson1.append("{\"ReporteTickets\" : [");
				new AppUtils();
				new AppUtils();
				//GENERA CONTENIDO JSON
				
				if(listTickets.size() > 0){
					for(BeanTicketSRINC item : listTickets){
						String hhmmss = "";
						double valor= 0.0;
						if(item.getStrtiemporespuesta() != null) {
							valor=Double.parseDouble(item.getStrtiemporespuesta());
							int hrs= (int)(valor);
							int min= (int)((valor-hrs)* 60);
							int seg= (int)((((valor-hrs)* 60)-min)*60);
							hhmmss = String.format("%02d:%02d:%02d", hrs, min, seg);
						}

						
						new AppUtils();
						strJson1.append("{" +
								"\"TICKETID\" : \"" + item.getTicketid() + "\" ," +
								"\"WOCH\" : \"" + item.getWoch() + "\" ," +
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
								"\"CLASIFICACION\" : \"" + AppUtils.cleanString((item.getClassification()== null ? "" : item.getClassification()))  + "\" ," +
								"\"CLASSSTRUCTUREID\" : \"" + AppUtils.cleanString((item.getClassstructureid() == null ? "" : item.getClassstructureid())) + "\" ," +
								"\"CLASSIFICATIONLEVEL1\" : \"" + AppUtils.cleanString((item.getClassificationlevel1() == null ? "" : item.getClassificationlevel1())) + "\" ," +
								"\"CLASSIFICATIONLEVEL2\" : \"" + AppUtils.cleanString((item.getClassificationlevel2() == null ? "" : item.getClassificationlevel2())) + "\" ," +
								"\"CLASSIFICATIONLEVEL3\" : \"" + AppUtils.cleanString((item.getClassificationlevel3() == null ? "" : item.getClassificationlevel3())) + "\" ," +
								"\"CLASSIFICATIONLEVEL4\" : \"" +  AppUtils.cleanString((item.getClassificationlevel4() == null ? "" : item.getClassificationlevel4())) + "\" ," +
								"\"CINUM\" : \"" + ""+ "\" ," +
								"\"CINUMDESC\" : \"" + (item.getCinumdesc()== null ? "":item.getCinumdesc()) + "\" ," +
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
								"\"DETAIL\" : \"" + (AppUtils.cleanString(item.getDetail())==null ? "" : AppUtils.cleanString(item.getDetail())) + "\" ," +
								"\"SINTOMA\" : \"" + (AppUtils.cleanString(item.getSintoma()==null ? "" : AppUtils.cleanString(item.getSintoma()))) + "\" ," +
								"\"CAUSA\" : \"" + (AppUtils.cleanString(item.getCausa()==null ? "" : AppUtils.cleanString(item.getCausa()))) + "\" ," +
								"\"SOLUCION\" : \"" + (AppUtils.cleanString(item.getSolucion()==null ? "" : AppUtils.cleanString(item.getSolucion()))) + "\" ," +
								"\"CHANGEBY_TKWEB\" : \"" + (AppUtils.cleanString(item.getChangeby_tkweb()==null ? "" : AppUtils.cleanString(item.getChangeby_tkweb()))) + "\" ," +
								"\"CHANGEDATE_TKWEB\" : \"" + (item.getChangedate_tkweb()==null ? "" : item.getChangedate_tkweb()) + "\" ," +
								"\"TIEMPO_ESCALAMIENTO\" : \"" + (item.getTiempoescalamiento()) + "\" ," +
								"\"TIEMPO_RESPUESTA\" : \"" + (item.getTiemporespuesta()) + "\" ," +
								"\"TIEMPO_SOLUCION\" : \"" + (item.getTiemposolucion()) + "\" ," +
								"\"STRTIEMPO_ESCALAMIENTO\" : \"" + (item.getStrtiempoescalamiento()!=null?item.getStrtiempoescalamiento():"" )+ "\" ," +
								"\"STRTIEMPO_RESPUESTA\" : \"" + (item.getStrtiemporespuesta()!=null?hhmmss:"") + "\" ," +
								"\"STRTIEMPO_SOLUCION\" : \"" + (item.getStrtiemposolucion() !=null?item.getStrtiemposolucion():"")+ "\" ," +
								"\"TKREABIERTO\" : \"" + (item.getTkreabierto()) + "\" ," +
								"\"GESTIONWEB\" : \"" + (item.getGestionweb()) + "\" ," +
								"\"FECHA_ENCUESTA\" : \"" + (item.getFecha_encuesta()) + "\" ," +
								"\"PREGUNTA_ENCUESTA\" : \"" + (item.getPregunta_encuesta()) + "\" ," +
								"\"RESPUESTA_ENCUESTA\" : \"" + (item.getRespuesta_encuesta()) + "\" ," +
//								"\"COMENTARIO_ENCUESTA\" : \"" + (item.getComentario_encuesta())+ "\" ," +
								"\"ATENCION_MASIVA\" : \"" + (item.getAtencion_masiva()) + "\" " +
								"},"
								);
							
					}
				}
				else
					strJson1.append(",");
							
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");

			}catch(Exception ex){
				System.out.println(ex.getStackTrace());
				strJson2 = new StringBuilder();
				strJson2.append("error");
			}
			
			out.print(strJson2);
		}
	 	
	 	public void getReporteWorkOrder(String strFecha, String id_proyecto, int opcionMapper, HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			try{
				BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
				List<WorkOrder> listTickets = new ArrayList<WorkOrder>();
				BeanBusqueda pBean = new BeanBusqueda();
				pBean.setIdproyecto(id_proyecto);
				pBean.setFechaInicio(strFecha);
				
				listTickets = objBusinessMaximoMobility.getMaximoTicketWorkOrder(opcionMapper, pBean, ssf);
				
				strJson1 = new StringBuilder();
				strJson1.append("{\"ReporteWO\" : [");
				new AppUtils();
				new AppUtils();
				//GENERA CONTENIDO JSON
				
				if(listTickets.size() > 0){
					for(WorkOrder item : listTickets){
						
						String descriptionwa = item.getDescriptionwa().replaceAll("\"", "\\\\\"").replaceAll("\r", "\\r").replaceAll("\n", "\\n");
						
						System.out.println(descriptionwa);
						new AppUtils();
						strJson1.append("{" +
								"\"id\" : \"" + item.getId() + "\" ," +
								"\"wogroupwa\" : \"" + item.getWogroupwa() + "\" ," +
								"\"taskidwa\" : \"" + item.getTaskidwa()+ "\" ," +
								"\"descriptionwa\" : \"" + descriptionwa + "\" ," +
								"\"pluspcustomerwa\" : \"" + item.getPluspcustomerwa()+ "\" ," +
								"\"estadowa\" : \"" + (item.getEstadowa()== null ? "": item.getEstadowa())+ "\" ," +
								"\"woprioritywa\" : \"" +   item.getWoprioritywa() + "\" ," +
								"\"actstartwa\" : \"" + (item.getActstartwa() == null ? "" : item.getActstartwa() ) + "\" ," +
								"\"changebywa\" : \"" + (item.getChangebywa()== null ? "" : item.getChangebywa()) + "\" ," +
								"\"cinum\" : \"" + (item.getCinum()== null ? "" : item.getCinum())  + "\" ," +
								"\"serviceline\" : \"" + (item.getServiceline()== null ? "": item.getServiceline()) + "\" ," +
								"\"ownerwa\" : \"" +  (item.getOwnerwa() == null ? "" : item.getOwnerwa() ) + "\" ," +
								"\"ownergroupwa\" : \"" +  item.getOwnergroupwa()+ "\" ," +
								"\"reportdatewa\" : \"" + (item.getReportdatewa()== null ? "": item.getReportdatewa()) + "\" ," +
								"\"reportedbywa\" : \"" + (item.getReportedbywa() == null ? "" : item.getReportedbywa()) + "\" ," +
								"\"statusdatewa\" : \"" + (item.getStatusdatewa() == null ? "" : item.getStatusdatewa()) + "\" ," +
								"\"woclasswa\" : \"" + (item.getWoclasswa() == null ? "" : item.getWoclasswa()) + "\" ," +
								"\"tarea\" : \"" + (item.getTarea() == null ? "" : item.getTarea()) + "\" ," +
								"\"jpnum\" : \"" + (item.getJpnum() == null ? "" : item.getJpnum()) + "\" ," +
								"\"jpdescription\" : \"" + (item.getJpdescription() == null ? "" : item.getJpdescription()) + "\" ," +
								"\"actfinish\" : \"" + (item.getActfinish()== null ? "": item.getActfinish()) + "\" ," +
								"\"woactualfin\" : \"" + (item.getWoactualfin() == null ? "" : item.getWoactualfin()) + "\" ," +
								"\"wonumwa\" : \"" + (item.getWonumwa() == null ? "" : item.getWonumwa()) + "\" ," +
								"\"habPuestoTrabajo\" : \"" + (item.getStrhabPuestoTrabajo() == null ? "": item.getStrhabPuestoTrabajo() )  + "\" ," +
								"\"wo_acta\" : \"" + (item.getWo_acta() == null ? "": item.getWo_acta() )  + "\" " +
								"},"
								);
					}
				}
				else {
					strJson1.append(",");
				}
				
		
			}catch(Exception ex){
				System.out.println(ex.getStackTrace());
				strJson2 = new StringBuilder();
				strJson2.append("error");
			}
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
//			System.out.println("strJson2"+strJson2);
			out.print(strJson2);
		}
	 	
	 	public void getReporteLlamadas(String semana, int tipoVista, String strFecha, String id_proyecto, HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			try{
				BusinessMaximoMobility objBusinessMaximoMobility = new BusinessMaximoMobility();
				List<BeanReporteLlamadas> listLlamadasContestadas = null;
				List<BeanReporteLlamadas> listLlamadasNoContestadas = null;
				BeanReporteLlamadas pBeanLlamadas = new BeanReporteLlamadas();
				pBeanLlamadas.setIdProyecto(Integer.parseInt(id_proyecto));
				pBeanLlamadas.setStr1(strFecha);
				pBeanLlamadas.setSemana(Integer.parseInt(semana));
				pBeanLlamadas.setTipoVista(tipoVista);
				
				listLlamadasContestadas = objBusinessMaximoMobility.getReporteLlamadasContestadas(pBeanLlamadas, ssf);
				listLlamadasNoContestadas = objBusinessMaximoMobility.getReporteLlamadasNoContestadas(pBeanLlamadas, ssf);
				
				strJson1.append("{\"ReporteLlamadas\" : [");
				
				if(listLlamadasContestadas.size() > 0){
					for(BeanReporteLlamadas item : listLlamadasContestadas){
						strJson1.append("{" +
								"\"fechaInicio\" : \"" + item.getFechainicio() + "\" ," +
								"\"tiempoCola\" : \"" + String.format("%02d:%02d:%02d", item.getTiempocolan() / 3600, (item.getTiempocolan() % 3600) / 60, item.getTiempocolan() % 60)+ "\" ," +
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
								"\"tiempoCola\" : \"" + String.format("%02d:%02d:%02d", item.getTiempocolan() / 3600, (item.getTiempocolan() % 3600) / 60, item.getTiempocolan() % 60) + "\" ," +
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
		
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		
				
			}catch(Exception ex){
				System.err.println(ex.getStackTrace());
				strJson2 = new StringBuilder();
				strJson2.append("error");
			}
			out.print(strJson2);
		}
	 	
	 	public void getResumenSLA(String strFecha, String id_proyecto, String cliente, String vmes, String vanio, HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			//Consolidar SLA de Mesa de Ayud y Soporte en Sitio
			BusinessNivelServicio objNS = new BusinessNivelServicio();
			List<BeanNivelServicio>  listNS= new ArrayList<BeanNivelServicio>();
			try{
				
			try {
				listNS = objNS.listNivelServicio(cliente, ssf);	
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			strJson1.append("{\"NivelServicio\" : [");

			if(listNS != null) {
				for(BeanNivelServicio obj : listNS){
					strJson1.append("{" +
							"\"id_sla\" : \"" + obj.getIdNS()+ "\" ," +
							"\"id_proyecto\" : \"" + obj.getIdproyecto()+ "\" ," +
							"\"id_sl\" : \"" + obj.getId_sl()+ "\" ," +
							"\"nombre_sl\" : \"" + obj.getNombre_sl()+ "\" ," +
							"\"id_tipo\" : \"" + obj.getId_tipo()+ "\" ," +
							"\"nombre_tipo\" : \"" + obj.getNombre_tipo()+ "\" ," +
							"\"titulo\" : \"" + obj.getTitulo()+ "\" ," +
							"\"descripcion\" : \"" + obj.getDescripcion()+ "\" ," +
							"\"valornum\" : \"" + obj.getValornum()+ "\" ," +
							"\"valorletra\" : \"" + obj.getValorletra()+ "\" ," +
							"\"comentario\" : \"" + obj.getComentario()+ "\" ," +
							"\"icono\" : \"" + obj.getIcono()+ "\" ," +
							"\"color\" : \"" + obj.getColor()+ "\" ," +
							"\"red_color\" : \"" + obj.getRed_color()+ "\" ," +
							"\"red_inicio\" : \"" + obj.getRed_inicio()+ "\" ," +
							"\"red_fin\" : \"" + obj.getRed_fin()+ "\" ," +
							"\"yellow_color\" : \"" + obj.getYellow_color()+ "\" ," +
							"\"yellow_inicio\" : \"" + obj.getYellow_inicio()+ "\" ," +
							"\"yellow_fin\" : \"" + obj.getYellow_fin()+ "\" ," +
							"\"green_color\" : \"" + obj.getGreen_color()+ "\" ," +
							"\"green_inicio\" : \"" + obj.getGreen_inicio()+ "\" ," +
							"\"green_fin\" : \"" + obj.getGreen_fin()+ "\" ," +
							"\"nombre_cvs\" : \"" + obj.getNombre_cvs()+ "\" ," +
							"\"unidad\" : \"" + obj.getUnidad()+ "\" ," +
							"\"str1\" : \"" + (obj.getStr1()!=null?obj.getStr1():"")+ "\" ," +
							"\"str2\" : \"" + (obj.getStr2()!=null?obj.getStr2():"")+ "\" ," +
							"\"nombre_grafico_live\" : \"" + obj.getNombre_grafico_live()+ "\" ," +
							"\"nombre_grafico_historico\" : \"" + obj.getNombre_grafico_historico()+ "\" " +
							"},"
							);
				}
			}else {
				strJson1.append(",");
			}

			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			strJson1 = new StringBuilder();
			
			// Consolidar Resultados de NIveles de Servicio
			BusinessNivelServicio objResultadoNS = new BusinessNivelServicio();
			List<BeanResultadoMensualNivelServicio> listResultadoNS = new ArrayList<BeanResultadoMensualNivelServicio>();
			listResultadoNS = objResultadoNS.listResultadoMensualNivelServicio(id_proyecto, vmes, vanio, ssf);
			
			strJson1.append("\"Resultado_NS\": [");
			if(listResultadoNS.size() > 0 ) {
			for(BeanResultadoMensualNivelServicio beanResultadoNS : listResultadoNS){
				strJson1.append("{" +
						"\"valornum\" : \"" + (beanResultadoNS!=null?beanResultadoNS.getValornum():"") + "\" ," +
						"\"valorletra\" : \"" + (beanResultadoNS!=null?beanResultadoNS.getValorletra():"") + "\" ," +
						"\"colormes\" : \"" + (beanResultadoNS!=null?beanResultadoNS.getColormes():"") + "\" ," +
						"\"id_sla\" : \"" + (beanResultadoNS!=null?beanResultadoNS.getId_sla():"") + "\" ," +
						"\"valor1\" : \"" + (beanResultadoNS.getValor1()) + "\" ," +
						"\"valor2\" : \"" + (beanResultadoNS.getValor2()) + "\"" +
						"},"
						);
			}
			}else {
				strJson1.append(",");
			}
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			strJson1 = new StringBuilder();
			
			//Consolidar linea Base Mesa de Ayuda últimos 12 meses
			
			BusinessDistribucionTickets servDistTicket = new BusinessDistribucionTickets();
			List<BeanDistribucionTickets> listDistTicket = new ArrayList<BeanDistribucionTickets>();
			
			try {
				listDistTicket = servDistTicket.getLineaBaseSDDHistorico(id_proyecto, strFecha, ssf);		
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			strJson1.append("\"DistribucionTicket\" : [");
			
			if(listDistTicket != null) {
				for(BeanDistribucionTickets bean : listDistTicket) {
						strJson1.append("{" +
										"\"mes\" : \"" + (bean.getMes()!=null?bean.getMes():"0")+ "\" ," +
										"\"anio\" : \"" + (bean.getAnio()!=null?bean.getAnio():"0")+ "\" ," +
										"\"telefono\" : \"" + (bean.getTelefono()!=null?bean.getTelefono():"0")+ "\" ," +
										"\"correo\" : \"" + (bean.getCorreo()!=null?bean.getCorreo():"0")+ "\" ," +
										"\"correobuzon\" : \"" + (bean.getCorreobuzon()!=null?bean.getCorreobuzon():"0")+ "\" ," +
										"\"catalogo\" : \"" + (bean.getCatalogo()!=null?bean.getCatalogo():"0")+ "\" ," +
										"\"adicional\" : \"" + (bean.getAdicional()!=null?bean.getAdicional():"0")+ "\" ," +
										"\"chat\" : \"" + (bean.getChat()!=null?bean.getChat():"0")+ "\" ," +
										"\"total\" : \"" + (bean.getTotal()!=null?bean.getTotal():"0")+ "\" ," +
										"\"totalinputs\" : \"" + (bean.getTotalinputs()!=null?bean.getTotalinputs():"0")+ "\" " +
										"},"
										);

				}
				
			}else {
				strJson1.append(",");
			}
	
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
				
				strJson1 = new StringBuilder();
				
				List<BeanResultadoMensualNivelServicio> listResultadoHistoricoNS = new ArrayList<BeanResultadoMensualNivelServicio>();
				listResultadoHistoricoNS = objResultadoNS.listNivelServicioHistorico(2,id_proyecto, strFecha, ssf);
				
				strJson1.append("\"ResultadoHistorico_LineaBaseOS\": [");
				System.out.println("listResultadoHistoricoNS "+listResultadoHistoricoNS.size());
				if(listResultadoHistoricoNS != null ) {
					for(BeanResultadoMensualNivelServicio beanResultadoNS : listResultadoHistoricoNS){
						strJson1.append("{" +
								"\"id_sla\" : \"" + (beanResultadoNS.getId_sla()!=null?beanResultadoNS.getId_sla():"") + "\" ," +
								"\"descripcion\" : \"" + (beanResultadoNS.getDescripcion()!=null?beanResultadoNS.getDescripcion():"") + "\" ," +
								"\"lineabase\" : \"" + (beanResultadoNS.getLineaBase()!=null?beanResultadoNS.getLineaBase():"") + "\" ," +
								"\"valorMes1\" : \"" + (beanResultadoNS.getValorMes1()!=null?beanResultadoNS.getValorMes1():"") + "\" ," +
								"\"valorMes2\" : \"" + (beanResultadoNS.getValorMes2()!=null?beanResultadoNS.getValorMes2():"") + "\" ," +
								"\"valorMes3\" : \"" + (beanResultadoNS.getValorMes3()!=null?beanResultadoNS.getValorMes3():"") + "\" ," +
								"\"valorMes4\" : \"" + (beanResultadoNS.getValorMes4()!=null?beanResultadoNS.getValorMes4():"") + "\" ," +
								"\"valorMes5\" : \"" + (beanResultadoNS.getValorMes5()!=null?beanResultadoNS.getValorMes5():"") + "\" ," +
								"\"valorMes6\" : \"" + (beanResultadoNS.getValorMes6()!=null?beanResultadoNS.getValorMes6():"") + "\" ," +
								"\"strMes1\" : \"" + (beanResultadoNS.getStrMes1()!=null?beanResultadoNS.getStrMes1():"") + "\" ," +
								"\"strMes2\" : \"" + (beanResultadoNS.getStrMes2()!=null?beanResultadoNS.getStrMes2():"") + "\" ," +
								"\"strMes3\" : \"" + (beanResultadoNS.getStrMes3()!=null?beanResultadoNS.getStrMes3():"") + "\" ," +
								"\"strMes4\" : \"" + (beanResultadoNS.getStrMes4()!=null?beanResultadoNS.getStrMes4():"") + "\" ," +
								"\"strMes5\" : \"" + (beanResultadoNS.getStrMes5()!=null?beanResultadoNS.getStrMes5():"") + "\" ," +
								"\"strMes6\" : \"" + (beanResultadoNS.getStrMes6()!=null?beanResultadoNS.getStrMes6():"") + "\" " +
								"},"
								);
					}
				}else {
						strJson1.append(",");
				}
				
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
				
				strJson1 = new StringBuilder();
				
				listResultadoHistoricoNS = new ArrayList<BeanResultadoMensualNivelServicio>();
				listResultadoHistoricoNS = objResultadoNS.listNivelServicioHistorico(3,id_proyecto, strFecha, ssf);
				
				strJson1.append("\"ResultadoHistorico_NS_OS\": [");
				
				if(listResultadoHistoricoNS != null) {
					for(BeanResultadoMensualNivelServicio beanResultadoNS : listResultadoHistoricoNS){
						strJson1.append("{" +
								"\"id_sla\" : \"" + (beanResultadoNS.getId_sla()!=null?beanResultadoNS.getId_sla():"") + "\" ," +
								"\"descripcion\" : \"" + (beanResultadoNS.getDescripcion()!=null?beanResultadoNS.getDescripcion():"") + "\" ," +
								"\"lineabase\" : \"" + (beanResultadoNS.getLineaBase()!=null?beanResultadoNS.getLineaBase():"") + "\" ," +
								"\"valorMes1\" : \"" + (beanResultadoNS.getValorMes1()!=null?beanResultadoNS.getValorMes1():"") + "\" ," +
								"\"valorMes2\" : \"" + (beanResultadoNS.getValorMes2()!=null?beanResultadoNS.getValorMes2():"") + "\" ," +
								"\"valorMes3\" : \"" + (beanResultadoNS.getValorMes3()!=null?beanResultadoNS.getValorMes3():"") + "\" ," +
								"\"valorMes4\" : \"" + (beanResultadoNS.getValorMes4()!=null?beanResultadoNS.getValorMes4():"") + "\" ," +
								"\"valorMes5\" : \"" + (beanResultadoNS.getValorMes5()!=null?beanResultadoNS.getValorMes5():"") + "\" ," +
								"\"valorMes6\" : \"" + (beanResultadoNS.getValorMes6()!=null?beanResultadoNS.getValorMes6():"") + "\" ," +
								"\"strMes1\" : \"" + (beanResultadoNS.getStrMes1()!=null?beanResultadoNS.getStrMes1():"") + "\" ," +
								"\"strMes2\" : \"" + (beanResultadoNS.getStrMes2()!=null?beanResultadoNS.getStrMes2():"") + "\" ," +
								"\"strMes3\" : \"" + (beanResultadoNS.getStrMes3()!=null?beanResultadoNS.getStrMes3():"") + "\" ," +
								"\"strMes4\" : \"" + (beanResultadoNS.getStrMes4()!=null?beanResultadoNS.getStrMes4():"") + "\" ," +
								"\"strMes5\" : \"" + (beanResultadoNS.getStrMes5()!=null?beanResultadoNS.getStrMes5():"") + "\" ," +
								"\"strMes6\" : \"" + (beanResultadoNS.getStrMes6()!=null?beanResultadoNS.getStrMes6():"") + "\" " +
								"},"
								);
					}
				}else {
						strJson1.append(",");
				}
				
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
				
				//JSON LLAMADAS
				strJson1 = new StringBuilder();
				
				BusinessLlamadasMobility objLlamadas = new BusinessLlamadasMobility();
				List<BeanLlamadas>  listLlamadas= new ArrayList<BeanLlamadas>();
				BeanBusqueda beanBusqueda = new BeanBusqueda();
				beanBusqueda.setIdproyecto(id_proyecto);
				beanBusqueda.setFechaInicio(strFecha);
				beanBusqueda.setSemana(0);
				
				try {
					listLlamadas = objLlamadas.getllamadasPorOpcion(beanBusqueda,4, ssf);// parametro opcion 4 : LLamadas por Dia del Mes
					
				}catch(Exception e) {
					e.printStackTrace();	
				}

				strJson1.append("\"LlamadasPorDiaMes\": [");
				
				if(listLlamadas != null) {
					for(BeanLlamadas beanResultadoNS : listLlamadas){
						strJson1.append("{" +
								"\"numero_dia\" : \"" + beanResultadoNS.getNumerodiaMes() + "\" ," +
								"\"Llamadas_Contestadas\" : \"" +  beanResultadoNS.getLlamadasContestadas()+ "\" ," +
								"\"Abandonadas_Mayores\" : \"" + beanResultadoNS.getLlamadasMayores()+ "\" ," +
								"\"Abandonadas_Menores\" : \"" + beanResultadoNS.getLlamadasMenores()+ "\" ," +
								"\"Tasa_Abandono\" : \"" + beanResultadoNS.getTasaAbandono() + "\" " +
								"},"
								);
					}
				}else {
						strJson1.append(",");
				}
				
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
				
				strJson1 = new StringBuilder();
				listLlamadas= new ArrayList<BeanLlamadas>();

				try {
					listLlamadas = objLlamadas.getllamadasPorOpcion(beanBusqueda,1, ssf); // parametro opcion 1 : LLamadas por Hora
					
				}catch(Exception e) {
					e.printStackTrace();	
				}

				strJson1.append("\"LlamadasPorHora\": [");
				
				if(listLlamadas != null) {
					for(BeanLlamadas beanResultadoNS : listLlamadas){
						strJson1.append("{" +
								"\"numero_hora\" : \"" + beanResultadoNS.getNumerohoraDia() + "\" ," +
								"\"Llamadas_Contestadas\" : \"" +  beanResultadoNS.getLlamadasContestadas()+ "\" ," +
								"\"Abandonadas_Mayores\" : \"" + beanResultadoNS.getLlamadasMayores()+ "\" ," +
								"\"Abandonadas_Menores\" : \"" + beanResultadoNS.getLlamadasMenores()+ "\" ," +
								"\"Tasa_Abandono\" : \"" + beanResultadoNS.getTasaAbandono() + "\" " +
								"},"
								);
					}
				}else {
						strJson1.append(",");
				}
				
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
				
				//FIN JSON LLAMADAS
				strJson1 = new StringBuilder();
				
				List<BeanSLATiempoOnsiteResultado> listTiempoOnsiteResultado = new ArrayList<BeanSLATiempoOnsiteResultado>();
				listTiempoOnsiteResultado = objResultadoNS.obtenerListaTiempoOnsiteResultado(id_proyecto, strFecha, ssf);
				
				strJson1.append("\"ResultadoDetalle_NS_OS\": [");
				
				if(listTiempoOnsiteResultado != null ) {
					for(BeanSLATiempoOnsiteResultado beanTiempoOnsiteResultado : listTiempoOnsiteResultado){
						strJson1.append("{" +
								"\"id_sla_resultado_mensual\" : \"" + (beanTiempoOnsiteResultado.getId_sla_resultado_mensual()!=null?beanTiempoOnsiteResultado.getId_sla_resultado_mensual():"") + "\" ," +
								"\"id_sla\" : \"" + (beanTiempoOnsiteResultado.getId_sla()!=null?beanTiempoOnsiteResultado.getId_sla():"") + "\" ," +
								"\"descripcion\" : \"" + (beanTiempoOnsiteResultado.getDescripcion()!=null?beanTiempoOnsiteResultado.getDescripcion():"") + "\" ," +
								"\"lineaBase\" : \"" + (beanTiempoOnsiteResultado.getLineaBase()!=null?beanTiempoOnsiteResultado.getLineaBase():"") + "\" ," +
								"\"vip_cant\" : \"" + (beanTiempoOnsiteResultado.getVip_cant()!=null?beanTiempoOnsiteResultado.getVip_cant():"") + "\" ," +
								"\"vip_en_sla\" : \"" + (beanTiempoOnsiteResultado.getVip_en_sla()!=null?beanTiempoOnsiteResultado.getVip_en_sla():"") + "\" ," +
								"\"vip_res_sla\" : \"" + (beanTiempoOnsiteResultado.getVip_res_sla()!=null?beanTiempoOnsiteResultado.getVip_res_sla():"") + "\" ," +
								"\"alta_cant\" : \"" + (beanTiempoOnsiteResultado.getAlta_cant()!=null?beanTiempoOnsiteResultado.getAlta_cant():"") + "\" ," +
								"\"alta_en_sla\" : \"" + (beanTiempoOnsiteResultado.getAlta_en_sla()!=null?beanTiempoOnsiteResultado.getAlta_en_sla():"") + "\" ," +
								"\"alta_res_sla\" : \"" + (beanTiempoOnsiteResultado.getAlta_res_sla()!=null?beanTiempoOnsiteResultado.getAlta_res_sla():"") + "\" ," +
								"\"media_cant\" : \"" + (beanTiempoOnsiteResultado.getMedia_cant()!=null?beanTiempoOnsiteResultado.getMedia_cant():"") + "\" ," +
								"\"media_en_sla\" : \"" + (beanTiempoOnsiteResultado.getMedia_en_sla()!=null?beanTiempoOnsiteResultado.getMedia_en_sla():"") + "\" ," +
								"\"media_res_sla\" : \"" + (beanTiempoOnsiteResultado.getMedia_res_sla()!=null?beanTiempoOnsiteResultado.getMedia_res_sla():"") + "\" ," +
								"\"baja_cant\" : \"" + (beanTiempoOnsiteResultado.getBaja_cant()!=null?beanTiempoOnsiteResultado.getBaja_cant():"") + "\" ," +
								"\"baja_en_sla\" : \"" + (beanTiempoOnsiteResultado.getBaja_en_sla()!=null?beanTiempoOnsiteResultado.getBaja_en_sla():"") + "\" ," +
								"\"baja_res_sla\" : \"" + (beanTiempoOnsiteResultado.getBaja_res_sla()!=null?beanTiempoOnsiteResultado.getBaja_res_sla():"") + "\" ," +
								"\"ptrabajo_cant\" : \"" + (beanTiempoOnsiteResultado.getPtrabajo_cant()!=null?beanTiempoOnsiteResultado.getPtrabajo_cant():"") + "\" ," +
								"\"ptrabajo_en_sla\" : \"" + (beanTiempoOnsiteResultado.getPtrabajo_en_sla()!=null?beanTiempoOnsiteResultado.getPtrabajo_en_sla():"") + "\" ," +
								"\"ptrabajo_res_sla\" : \"" + (beanTiempoOnsiteResultado.getPtrabajo_res_sla()!=null?beanTiempoOnsiteResultado.getPtrabajo_res_sla():"") + "\" ," +
"\"usuarioVip\" : \"" + (beanTiempoOnsiteResultado.getUsuarioVip()!=null?beanTiempoOnsiteResultado.getUsuarioVip():"") + "\" ," +
"\"prioridadAlta\" : \"" + (beanTiempoOnsiteResultado.getPrioridadAlta()!=null?beanTiempoOnsiteResultado.getPrioridadAlta():"") + "\" ," +
"\"prioridadMedia\" : \"" + (beanTiempoOnsiteResultado.getPrioridadMedia()!=null?beanTiempoOnsiteResultado.getPrioridadMedia():"") + "\" ," +
"\"prioridadBaja\" : \"" + (beanTiempoOnsiteResultado.getPrioridadBaja()!=null?beanTiempoOnsiteResultado.getPrioridadBaja():"") + "\" ," +
"\"habilitacionPuestoTrabajo\" : \"" + (beanTiempoOnsiteResultado.getHabilitacionPuestoTrabajo()!=null?beanTiempoOnsiteResultado.getHabilitacionPuestoTrabajo():"") + "\" " +
								"},"
								);
					}
				}else {
						strJson1.append(",");
				}
				
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");

			}catch(Exception ex){
				System.out.println(ex.getStackTrace());
				strJson2 = new StringBuilder();
				strJson2.append("error");
			}
			
			System.out.println("strJson2"+strJson2);
			out.print(strJson2);
		}
	 	
	 	public void getgraficosTickets(String strFecha, String id_proyecto, String cliente, String vmes, String vanio, HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			//Consolidar SLA de Mesa de Ayud y Soporte en Sitio
			BusinessNivelServicio objNS = new BusinessNivelServicio();
			List<BeanNivelServicio>  listNS= new ArrayList<BeanNivelServicio>();
			try{
				
			try {
				listNS = objNS.listNivelServicio(cliente, ssf);	
			}catch(Exception e) {
				e.printStackTrace();
			}
			int tipoBaselineSDD = 0;
			
			if(listNS != null) {
				for(int i=0; i<listNS.size(); i++) {
					if(listNS.get(i).getId_sl().equals("1") && (listNS.get(i).getId_tipo().equals("1")||listNS.get(i).getId_tipo().equals("3"))) {
						tipoBaselineSDD = Integer.parseInt(listNS.get(i).getId_tipo()); 
					break;	
					}
				}
			}
			
			//Consolidar linea Base Mesa de Ayuda últimos 12 meses
			
			BusinessDistribucionTickets servDistTicket = new BusinessDistribucionTickets();
			List<BeanDistribucionTickets> listDistTicket = new ArrayList<BeanDistribucionTickets>();
			
			try {
				listDistTicket = servDistTicket.getLineaBaseSDDHistorico(id_proyecto, strFecha, ssf);		
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			String[] nombreMeses  = {"N/A","Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
		    
			
			strJson1 = new StringBuilder();
			strJson1.append("{\"LineBase\": [");
			strJson1.append("{\"labels\": [");
			if(listDistTicket != null) {
				for(BeanDistribucionTickets obj : listDistTicket){
					strJson1.append("\"" + nombreMeses[Integer.parseInt(obj.mes)] +"\",");
				}	
			}else {
				strJson1.append(",");
			}
			
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			strJson1 = new StringBuilder();
			strJson1.append("\"datasets\": [");
			strJson1.append("{\"label\": \"Resultado Linea Base \",\"fill\": false,\"backgroundColor\": \"#00C4ED\",\"borderColor\": \"#00C4ED\",\"data\": [");
			if(listDistTicket != null){
				if(tipoBaselineSDD == 1) { //Linea Base Tickets
					for(BeanDistribucionTickets obj : listDistTicket){
						strJson1.append(obj.getTotal()+ ",");
					}
				}else { //Linea Base Inputs
					for(BeanDistribucionTickets obj : listDistTicket){
						strJson1.append(obj.getTotalinputs()+ ",");
					}
				}
				
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"DetalleLineBase\": [");
			strJson1.append("{\"labels\": [");
			if(listDistTicket != null) {
				for(BeanDistribucionTickets obj : listDistTicket){
					strJson1.append("\"" + nombreMeses[Integer.parseInt(obj.mes)] +"\",");
				}	
			}else {
				strJson1.append(",");
			}
			
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"datasets\": [");
			strJson1.append("{\"label\": \"Llamadas \",\"fill\": false,\"backgroundColor\": \"#9C27B0\",\"borderColor\": \"#9C27B0\",\"data\": [");
			if(listDistTicket != null){
				for(BeanDistribucionTickets obj : listDistTicket){
					strJson1.append(obj.getTelefono()+ ",");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
			
			strJson1 = new StringBuilder();
			strJson1.append("{\"label\": \"Correos \",\"fill\": false,\"backgroundColor\": \"#3F51B5\",\"borderColor\": \"#3F51B5\",\"data\": [");
			if(listDistTicket != null){
				if(tipoBaselineSDD == 1) { //Linea Base Tickets
					for(BeanDistribucionTickets obj : listDistTicket){
						strJson1.append(obj.getCorreo()+ ",");
					}	
				}else {//Linea Base Inputs
					for(BeanDistribucionTickets obj : listDistTicket){
						strJson1.append(obj.getCorreobuzon()+ ",");
					}
				}
				
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
			
			if(tipoBaselineSDD == 1) { //Linea Base Tickets, Generar cadena para TIPO REQUERIMIENTO ADICIONAL
				strJson1 = new StringBuilder();
				strJson1.append("{\"label\": \"Requerimiento Adicional \",\"fill\": false,\"backgroundColor\": \"#009688\",\"borderColor\": \"#009688\",\"data\": [");
				if(listDistTicket != null){
						for(BeanDistribucionTickets obj : listDistTicket){
							strJson1.append(obj.getAdicional()+ ",");
						}	
				}
				else
					strJson1.append(",");
				
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");	
			}
			
			strJson1 = new StringBuilder();
			strJson1.append("{\"label\": \"Ticket Web \",\"fill\": false,\"backgroundColor\": \"#8BC34A\",\"borderColor\": \"#8BC34A\",\"data\": [");
			if(listDistTicket != null){
					for(BeanDistribucionTickets obj : listDistTicket){
						strJson1.append(obj.getCatalogo()+ ",");
					}	
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
			
			strJson1 = new StringBuilder();
			strJson1.append("{\"label\": \"Total Linea Base \",\"fill\": false,\"backgroundColor\": \"#00C4ED\",\"borderColor\": \"#00C4ED\",\"data\": [");
			if(listDistTicket != null){
				if(tipoBaselineSDD == 1) { //Linea Base Tickets
					for(BeanDistribucionTickets obj : listDistTicket){
						strJson1.append(obj.getTotal()+ ",");
					}
				}else { //Linea Base Inputs
					for(BeanDistribucionTickets obj : listDistTicket){
						strJson1.append(obj.getTotalinputs()+ ",");
					}
				}
				
			}
			else
				strJson1.append(",");
			
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}]}");
	

			}catch(Exception ex){
				System.out.println(ex.getStackTrace());
				strJson2 = new StringBuilder();
				strJson2.append("error");
			}
			
			System.out.println("strJson2"+strJson2);
			out.print(strJson2);
		}
	 	
	 	private void obtener_resultado_historico_sla(String id_proyecto, String strFecha,HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException{  
			 res.setCharacterEncoding("UTF-8");
			 
			 StringBuilder objJson1 = new StringBuilder();
			 StringBuilder strJson2 = new StringBuilder();
			 PrintWriter out = res.getWriter();
			 try{
					BusinessNivelServicio objResultadoNS = new BusinessNivelServicio();
					List<BeanResultadoMensualNivelServicio> listResultadoNS = new ArrayList<BeanResultadoMensualNivelServicio>();
					listResultadoNS = objResultadoNS.listNivelServicioHistorico(2,id_proyecto, strFecha, ssf);
					
					objJson1.append("{\"ResultadoHistorico_LineaBaseOS\": [");
					if(listResultadoNS.size() > 0 ) {
					for(BeanResultadoMensualNivelServicio beanResultadoNS : listResultadoNS){
						objJson1.append("{" +
								"\"id_sla\" : \"" + (beanResultadoNS.getId_sla()!=null?beanResultadoNS.getId_sla():"") + "\" ," +
								"\"descripcion\" : \"" + (beanResultadoNS.getDescripcion()!=null?beanResultadoNS.getDescripcion():"") + "\" ," +
								"\"lineabase\" : \"" + (beanResultadoNS.getLineaBase()!=null?beanResultadoNS.getLineaBase():"") + "\" ," +
								"\"valorMes1\" : \"" + (beanResultadoNS.getValorMes1()!=null?beanResultadoNS.getValorMes1():"") + "\" ," +
								"\"valorMes2\" : \"" + (beanResultadoNS.getValorMes2()!=null?beanResultadoNS.getValorMes2():"") + "\" ," +
								"\"valorMes3\" : \"" + (beanResultadoNS.getValorMes3()!=null?beanResultadoNS.getValorMes3():"") + "\" ," +
								"\"valorMes4\" : \"" + (beanResultadoNS.getValorMes4()!=null?beanResultadoNS.getValorMes4():"") + "\" ," +
								"\"valorMes5\" : \"" + (beanResultadoNS.getValorMes5()!=null?beanResultadoNS.getValorMes5():"") + "\" ," +
								"\"valorMes6\" : \"" + (beanResultadoNS.getValorMes6()!=null?beanResultadoNS.getValorMes6():"") + "\" ," +
								"\"strMes1\" : \"" + (beanResultadoNS.getStrMes1()!=null?beanResultadoNS.getStrMes1():"") + "\" ," +
								"\"strMes2\" : \"" + (beanResultadoNS.getStrMes2()!=null?beanResultadoNS.getStrMes2():"") + "\" ," +
								"\"strMes3\" : \"" + (beanResultadoNS.getStrMes3()!=null?beanResultadoNS.getStrMes3():"") + "\" ," +
								"\"strMes4\" : \"" + (beanResultadoNS.getStrMes4()!=null?beanResultadoNS.getStrMes4():"") + "\" ," +
								"\"strMes5\" : \"" + (beanResultadoNS.getStrMes5()!=null?beanResultadoNS.getStrMes5():"") + "\" ," +
								"\"strMes6\" : \"" + (beanResultadoNS.getStrMes6()!=null?beanResultadoNS.getStrMes6():"") + "\" ," +
								"},"
								);
					}
					}else {
						objJson1.append(",");
					}
						
					}
					catch(Exception ex){
						ex.printStackTrace();
						objJson1.append("{},");
					}finally {
						strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
						out.print(strJson2);	
					}
		    }

}
