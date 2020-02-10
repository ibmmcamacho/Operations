package com.pe.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanAlerta;
import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.bean.BeanTimeLine;
import com.pe.ibm.business.BusinessAlertaEjecutiva;
import com.pe.ibm.business.BusinessNotificacion;
import com.pe.ibm.util.AppUtils;
import com.pe.ibm.util.NotificacionAlertas;
import com.pe.ibm.ws.WsMaximo;

/**
 * Servlet implementation class ServletAlertaEjecutiva
 */
@WebServlet("/ServletAlertaEjecutiva")
public class ServletAlertaEjecutiva extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAlertaEjecutiva() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/* Obtener sqlsessionF*/
		SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
		String strOperacion = request.getParameter("strOperation");
		if(strOperacion.equals("guardar") || strOperacion.equals("actualizar") || strOperacion.equals("eliminar")){
			guardarIncidente(request,response,ssf);
		}
		else if(strOperacion.equals("guardarDetalle") || strOperacion.equals("actualizarDetalle") || strOperacion.equals("eliminarDetalle")){
			mantenimientoDetalleIncidente(request,response,ssf);
		}
		else if(strOperacion.equals("listDetalleAlerta")){
			listDetalleIncidentePorId(request,response,ssf);
		}
		else if(strOperacion.equals("listDetalleAlerta2")){
			listDetalleIncidentePorId2(request,response,ssf);
		}
		else if(strOperacion.equals("buscarTicket")){
			buscarMaximoTicket(request,response,ssf);
		}
		else if(strOperacion.equals("listTicketPrioridad1")){
			listarTicketPrioridad1(request,response,ssf);
		}
		else if(strOperacion.equals("consultar")){
			listIncidentePorId(request,response,ssf);
		}
		else if(strOperacion.equals("ticketTimeLine")){
			listTicketsAlertaTimeLine(request,response,ssf);
		}
		else if(strOperacion.equals("listGrupoDistribucion")){
			listarGrupoDistribucion(request,response,ssf);
		}
		else if(strOperacion.equals("listReporteGeneral")){
			listarReporteGeneral(request,response,ssf);
		}
		else if(strOperacion.equals("openTicket"))
			openTicket(request,response,ssf);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void buscarMaximoTicket(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		
		StringBuilder strJson1 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String strError = "";
		BeanSession objBeanSession = new BeanSession();
		BeanMaximo objBeanMaximo = new BeanMaximo();
		
		try{
			WsMaximo objWsMaximo = new WsMaximo();
			String idTicket = req.getParameter("ptxtMaximoTicketId");
			
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			
			objBeanMaximo = objWsMaximo.wsConsultaTicket(idTicket.trim().toUpperCase(), objBeanSession, ssf);
			String strFechaCreacion = (objBeanMaximo.getTicketFechaCreacion() != null ? objBeanMaximo.getTicketFechaCreacion().substring(0, 10) + " " + objBeanMaximo.getTicketFechaCreacion().substring(11, 19) : "");
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
//			Date dtFechaCreacion = sdf.parse(objBeanMaximo.getTicketFechaCreacion());
			
			strError = "Linea 113";
			strJson1.append("{\"ticketMaximo\" : [");
			if(objBeanMaximo.getTicketTitulo() != null){
				strJson1.append("{\"idCliente\" : \"" + objBeanMaximo.getTicketIdCliente() + "\",");
				strJson1.append("\"cliente\" : \"" + objBeanMaximo.getTicketCliente() + "\",");
				strJson1.append("\"idTicket\" : \"" + objBeanMaximo.getIdTicket() + "\",");
				strError = "Linea 119";
				strJson1.append("\"resumen\" : \"" + AppUtils.cleanString(objBeanMaximo.getTicketTitulo().trim()) + "\",");
				strError = "Linea 121";
				strJson1.append("\"detalle\" : \"" + (objBeanMaximo.getTicketDetalle() != null ? AppUtils.cleanString(objBeanMaximo.getTicketDetalle().trim()) + "\"," : "" + "\","));
				strError = "Linea 123";
				strJson1.append("\"prioridad\" : \"" + objBeanMaximo.getTicketPrioridad() + "\",");
				strJson1.append("\"fechaCreacion\" : \"" + strFechaCreacion + "\",");
				strJson1.append("\"idEstado\" : \"" + objBeanMaximo.getTicketIdEstado() + "\",");
				strJson1.append("\"estado\" : \"" + objBeanMaximo.getTicketEstado() + "\",");
				strJson1.append("\"usuarioPropietario\" : \"" + objBeanMaximo.getTicketPropietario() + "\",");
				strJson1.append("\"idGrupoPropietario\" : \"" + objBeanMaximo.getTicketIdGrupoPropietario() + "\",");
				strJson1.append("\"grupoPropietario\" : \"" + objBeanMaximo.getTicketGrupoPropietario() + "\"");
				strJson1.append("}");
			}
			strJson1.append("]}");
			AppUtils.convertAuditoria(req, "BUSCAR TICKETS MAXIMO", "OK", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", (objBeanMaximo.toString().length() > 9950 ? objBeanMaximo.toString().substring(0, 9950) : objBeanMaximo.toString()), ssf);
		}
		catch(Exception ex){
			System.out.println("LINEA==> " + strError + "OK, CONTINUEMOS: " + ex.getMessage());
			System.out.println("==============================================================");
			System.out.println(ex.toString());
			
//			AppUtils.addErr(ex, "BUSCAR TICKETS MAXIMO", objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno() + " " + objBeanSession.getObjBeanPersonal().getStrApMaterno(), objBeanSession.getObjBeanPersonal().getiIdEmpleado(), ssf);
//			AppUtils.convertAuditoria(req, "BUSCAR TICKETS MAXIMO", "FAIL", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", ex.toString(), ssf);
			strJson1.append("error");
		}
		out.print(strJson1);
	}
	
	public void listarTicketPrioridad1(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
	
	StringBuilder strJson1 = new StringBuilder();
	StringBuilder strJson2 = new StringBuilder();
	
	res.setCharacterEncoding("UTF-8");
	PrintWriter out = res.getWriter();
	
	
	try{
		BusinessAlertaEjecutiva objAlertaEjecutiva = new BusinessAlertaEjecutiva();
		BeanSession objBeanSession = new BeanSession();
		
		HttpSession objSessionLogin = req.getSession(false);
		String tipo = req.getParameter("pTipo");
		objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
		String strTeam = "" + objBeanSession.getObjBeanPersonal().getiTeam();
		
		List<BeanAlerta> listBeanAlerta = null;
		if(tipo.equals("0"))
			listBeanAlerta =  objAlertaEjecutiva.listAlertaEjecutivaP1(strTeam, ssf);
		if(tipo.equals("1"))
			listBeanAlerta =  objAlertaEjecutiva.listAlertaEjecutivaP1Closed(strTeam, ssf);
		
		if(listBeanAlerta.size() > 0){
			strJson1.append("{\"listTicketMaximo\" : [");
			for(BeanAlerta item : listBeanAlerta){
				strJson1.append("{\"idAlerta\" : \"" + item.getIdAlerta() + "\",");
				strJson1.append("\"ticket\" : \"" + item.getMaximoIdTicket() + "\",");
				strJson1.append("\"estado\" : \"" + item.getEstadoAlerta() + "\",");
				strJson1.append("\"cliente\" : \"" + item.getMaximoCliente() + "\",");
				strJson1.append("\"resumen\" : \"" + AppUtils.cleanString(item.getMaximoResumen()) + "\",");
				strJson1.append("\"fechaCreacion\" : \"" + item.getFecha() + "\",");
				strJson1.append("\"horaCreacion\" : \"" + item.getHora() + "\",");
				strJson1.append("\"fechaFin\" : \"" + item.getFechaFin() + "\",");
				strJson1.append("\"horaFin\" : \"" + item.getHoraFin() + "\",");
				strJson1.append("\"usuarioModificador\" : \"" + item.getUsuarioModificador() + "\"},");
			}
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		}
		else
			strJson2.append("{\"listTicketMaximo\" : []}");
	}
	catch(Exception ex){
		System.out.println(ex.toString());
		strJson2.append("error");
	}
	out.print(strJson2);
}
	
	public void guardarIncidente(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		NotificacionAlertas objNotificacionAlertas = new NotificacionAlertas();
		BeanSession objBeanSession = new BeanSession();
		BeanAlerta objBeanAlerta = new BeanAlerta();
		
		int resultado = 0, resultadoEmail = 0;
		try{
			
			BusinessAlertaEjecutiva objBusinessAlerta = new BusinessAlertaEjecutiva();
			objBeanAlerta.setStrTipo(req.getParameter("strOperation"));
			
			if(objBeanAlerta.getStrTipo().equals("eliminar")){
				objBeanAlerta.setIdAlerta(Integer.parseInt(req.getParameter("phdIdAlerta").equals("") ? "0" : req.getParameter("phdIdAlerta")));
				objBeanAlerta.setIdUsuario(Integer.parseInt(req.getParameter("pusuario")));
				objBeanAlerta.setiTeam(Integer.parseInt(req.getParameter("phdIdTeam")));
			}
			else{
				objBeanAlerta.setIdAlerta(Integer.parseInt(req.getParameter("phdIdAlerta").equals("") ? "0" : req.getParameter("phdIdAlerta")));
				objBeanAlerta.setIdEstadoAlerta(req.getParameter("pcboEstadoAlerta").equals("null") ? 0 : Integer.parseInt(req.getParameter("pcboEstadoAlerta")));
				objBeanAlerta.setEstadoAlerta(req.getParameter("pcboEstadoAlertaText").equals("null") ? "" : req.getParameter("pcboEstadoAlertaText"));
				objBeanAlerta.setIdEstadoAlerta(req.getParameter("pcboEstadoAlerta").equals("null") ? 0 : Integer.parseInt(req.getParameter("pcboEstadoAlerta")));
				objBeanAlerta.setMaximoIdCliente(req.getParameter("ptxtMaximoIdCliente").equals("null") ? "" : req.getParameter("ptxtMaximoIdCliente").trim());
				objBeanAlerta.setMaximoCliente(req.getParameter("pcboMaximoCliente").equals("null") ? "" : req.getParameter("pcboMaximoCliente").trim());
				objBeanAlerta.setMaximoIdTicket(req.getParameter("ptxtMaximoTicketId").equals("null") ? "" : req.getParameter("ptxtMaximoTicketId").trim());
				objBeanAlerta.setMaximoResumen(AppUtils.cleanString(req.getParameter("ptxtMaximoResumen")).trim().equals("null") || AppUtils.cleanString(req.getParameter("ptxtMaximoResumen")).trim() == null || AppUtils.cleanString(req.getParameter("ptxtMaximoResumen")).trim().length() <= 0 ? " " : AppUtils.cleanString(req.getParameter("ptxtMaximoResumen").trim()));
				objBeanAlerta.setMaximoDetalle(AppUtils.cleanString(req.getParameter("ptxtMaximoDetalle")).trim().equals("null") || AppUtils.cleanString(req.getParameter("ptxtMaximoDetalle")).trim() == null || AppUtils.cleanString(req.getParameter("ptxtMaximoDetalle")).trim().length() <= 0 ? " " : AppUtils.cleanString(req.getParameter("ptxtMaximoDetalle").trim()));
				objBeanAlerta.setMaximoPrioridad(req.getParameter("ptxtMaximoPrioridad").equals("null") ? "" : req.getParameter("ptxtMaximoPrioridad"));
				objBeanAlerta.setMaximoFechaCreacion(req.getParameter("ptxtMaximoFechaCreacion").equals("null") ? "" : req.getParameter("ptxtMaximoFechaCreacion"));
				objBeanAlerta.setMaximoIdEstado(req.getParameter("ptxtMaximoIdEstado").equals("null") ? "" : req.getParameter("ptxtMaximoIdEstado"));
				objBeanAlerta.setMaximoEstado(req.getParameter("pcboMaximoEstado").equals("null") ? "" : req.getParameter("pcboMaximoEstado"));
				objBeanAlerta.setMaximoIdGrupoPropietario(req.getParameter("ptxtMaximoIdGrupoPropietario").equals("null") ? null : req.getParameter("ptxtMaximoIdGrupoPropietario"));
				objBeanAlerta.setMaximoIdGrupoResolutor(req.getParameter("ptxtMaximoIdGrupoResolutor").equals("null") ? null : req.getParameter("ptxtMaximoIdGrupoResolutor"));
				
				objBeanAlerta.setPm(AppUtils.cleanString(req.getParameter("ptxtPm")).trim().equals("null") ? null : AppUtils.cleanString(req.getParameter("ptxtPm").trim()));
				//objBeanAlerta.setIdCrisisTurno(req.getParameter("ptxtCrisisTurno").equals("null") ? 0 : Integer.parseInt(req.getParameter("ptxtCrisisTurno")));
				
				objBeanAlerta.setCrisisTurno(req.getParameter("ptxtCrisisTurno").equals("null") ? null : AppUtils.cleanString(req.getParameter("ptxtCrisisTurno").trim()));
				
				objBeanAlerta.setFechaNotificacionIbm(req.getParameter("ptxtHoraNotificacionIbm").equals("null") ? null : (req.getParameter("ptxtHoraNotificacionIbm") + ":00"));
				objBeanAlerta.setDataCenter(req.getParameter("pcboDataCenter").equals("null") || req.getParameter("pcboDataCenter").equals("") ? null : req.getParameter("pcboDataCenter"));
				objBeanAlerta.setFechaFin(req.getParameter("ptxtHoraFin").equals("null") ? null : (req.getParameter("ptxtHoraFin") + ":00"));
				objBeanAlerta.setStrTeamSoporte(req.getParameter("pcboTeamSoporte").equals("null") ? null : req.getParameter("pcboTeamSoporte"));
				String varTipoFalla = req.getParameter("pcboTipoFalla");
				objBeanAlerta.setIdTipoFalla(req.getParameter("pcboTipoFalla").equals("null") || req.getParameter("pcboTipoFalla").equals("") ? 0 : Integer.parseInt(req.getParameter("pcboTipoFalla")));
				objBeanAlerta.setConcurrencia(req.getParameter("pchkIncidenteConcurrente").equals("null") ? 0 : Integer.parseInt(req.getParameter("pchkIncidenteConcurrente")));
				objBeanAlerta.setOtrosClientes(req.getParameter("pchkOtrosClientes").equals("null") ? 0 : Integer.parseInt(req.getParameter("pchkOtrosClientes")));
				objBeanAlerta.setPropietarioIncidencia(req.getParameter("pcboPropiedadInc").equals("null") ? null : req.getParameter("pcboPropiedadInc"));
				objBeanAlerta.setServicioImpactado(req.getParameter("ptxtServicioImpactado").equals("null") ? null : AppUtils.cleanString(req.getParameter("ptxtServicioImpactado")));
				objBeanAlerta.setSla(req.getParameter("pcboSla").equals("null") || req.getParameter("pcboSla").equals("") ? null : req.getParameter("pcboSla"));
				objBeanAlerta.setImpactoNegocio(req.getParameter("ptxtImpactoNegocio").equals("null") ? null : AppUtils.cleanString(req.getParameter("ptxtImpactoNegocio")));
				objBeanAlerta.setIdticketProblema(req.getParameter("ptxtTicketProblema").equals("null") ? null : AppUtils.cleanString(req.getParameter("ptxtTicketProblema").trim()));
				objBeanAlerta.setIdticketCambio(req.getParameter("ptxtTicketCambio").equals("null") ? null : AppUtils.cleanString(req.getParameter("ptxtTicketCambio").trim()));
				objBeanAlerta.setCambioPm(req.getParameter("pcboCambioPrioridad").equals("null") ? null : req.getParameter("pcboCambioPrioridad"));
				objBeanAlerta.setRecibioAlerta(req.getParameter("pcboNotificado").equals("null") || req.getParameter("pcboNotificado").equals("") ? 0 : Integer.parseInt(req.getParameter("pcboNotificado")));
				objBeanAlerta.setDerivoCambio(req.getParameter("ptxtDerivoCambio").equals("null") ? null : AppUtils.cleanString(req.getParameter("ptxtDerivoCambio").trim()));
				objBeanAlerta.setDesviacionesIncidentes(req.getParameter("pcboDesviacionIncidencia").equals("null") ? null : req.getParameter("pcboDesviacionIncidencia"));
				objBeanAlerta.setEvaluacionCrisis(req.getParameter("ptxtEvaluacionCrisis").equals("null") ? null : AppUtils.cleanString(req.getParameter("ptxtEvaluacionCrisis").trim()));
				objBeanAlerta.setObservaciones(req.getParameter("ptxtObservaciones").equals("null") ? null : AppUtils.cleanString(req.getParameter("ptxtObservaciones")).trim());
				
				objBeanAlerta.setiAprobarNotificacion(req.getParameter("pvchkNotificar").equals("null") ? 0 : Integer.parseInt(req.getParameter("pvchkNotificar")));
				objBeanAlerta.setStrTipoNotificacion(req.getParameter("pvcboTipoNotificacion").equals("null") ? null : req.getParameter("pvcboTipoNotificacion"));
				objBeanAlerta.setDistribucion(req.getParameter("pcboListaDistribucion").equals("null") ? null : req.getParameter("pcboListaDistribucion"));
				objBeanAlerta.setCopiaDistribucion(req.getParameter("pcboEmailAlternativo").equals("null") ? null : req.getParameter("pcboEmailAlternativo"));
				objBeanAlerta.setIdUsuario(req.getParameter("pusuario").equals("null") ? 0 : Integer.parseInt(req.getParameter("pusuario")));
				objBeanAlerta.setiTeam(req.getParameter("phdIdTeam").equals("null") ? 0 : Integer.parseInt(req.getParameter("phdIdTeam")));
				objBeanAlerta.setStrEmail(req.getParameter("pemail").equals("null") ? null : req.getParameter("pemail"));
				
				
				if(objBeanAlerta.getMaximoResumen().length() > 250)
					objBeanAlerta.setMaximoResumen(objBeanAlerta.getMaximoResumen().substring(0,250));
				if(objBeanAlerta.getMaximoDetalle().length() > 3500)
					objBeanAlerta.setMaximoDetalle(objBeanAlerta.getMaximoDetalle().substring(0,3500));
				
			}
			
			resultado = objBusinessAlerta.saveAlertaEjecutiva(objBeanAlerta, ssf);
			
			if(resultado > 0 && objBeanAlerta.getiAprobarNotificacion() == 1){
//				objBeanAlerta.setIdAlerta(objBusinessAlerta.obtenerIdTicketAlertaIncidencia(objBeanAlerta.getMaximoIdTicket(), ssf));
				
				System.out.println((BeanSession)req.getSession(false).getAttribute("usuarioLogin"));
				objBeanSession = (BeanSession)req.getSession(false).getAttribute("usuarioLogin");
				if(objBeanSession != null){
					
					objBeanAlerta.setStrPwd(objBeanSession.getObjBeanPersonal().getStrClave());
					objBeanAlerta.setStrNombreUsuario(objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno() + " " + objBeanSession.getObjBeanPersonal().getStrApMaterno());
				}
				
				objBeanAlerta.setIdAlerta(objBeanAlerta.getIdAlerta() == 0 ? objBusinessAlerta.obtenerIdTicketAlertaIncidencia(objBeanAlerta.getMaximoIdTicket(), ssf) : objBeanAlerta.getIdAlerta());
				resultadoEmail = objNotificacionAlertas.sendEmail(objBeanAlerta, ssf,req,objBeanSession);
			}else if(resultado > 0 && objBeanAlerta.getiAprobarNotificacion() == 0)
				resultadoEmail = 1;
			
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			
			AppUtils.convertAuditoria(req, "GUARDAR INCIDENTES", (resultado > 0 && resultadoEmail > 0 ? "OK" : resultado <= 0 ? "FAIL" : resultadoEmail <= 0 ? "FAILEMAIL" : "FAIL_"), objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", (objBeanAlerta.toString().length() > 9950 ? objBeanAlerta.toString().substring(0, 9950) : objBeanAlerta.toString()), ssf);
		}
		catch(Exception ex){
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			
			resultado = 0;
			System.out.println(ex.toString());
			AppUtils.addErr(ex, "GUARDAR | ALERTAS EJECUTIVAS", objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno() + " " + objBeanSession.getObjBeanPersonal().getStrApMaterno(), objBeanSession.getObjBeanPersonal().getiIdEmpleado(), ssf);
		}
		
		if(resultado > 0 && resultadoEmail > 0)
			out.print("ok");
		else if(resultado <= 0)
			out.print("fail");
		else if(resultadoEmail <= 0)
			out.print("failEmail");
		else
			out.print("fail");
	}
	
	public void listIncidentePorId(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		BeanAlerta objBeanAlerta = new BeanAlerta();
		BeanSession objBeanSession = new BeanSession();
		
		try{
			BusinessAlertaEjecutiva objBusinessAlerta = new BusinessAlertaEjecutiva();
			
			
			int iIdAlerta = Integer.parseInt(req.getParameter("pidAlerta"));
			objBeanAlerta = objBusinessAlerta.listAlertaEjecutivaPorId(iIdAlerta, ssf);
			strJson1.append("{\"objAlertaEjecutiva\" : [");
			strJson1.append("{");
			strJson1.append("\"piAlerta\" : \"" + iIdAlerta + "\",");
			strJson1.append("\"pcboEstadoAlerta\" : \"" + objBeanAlerta.getIdEstadoAlerta() + "\",");
			strJson1.append("\"ptxtMaximoIdCliente\" : \"" + AppUtils.cleanString(objBeanAlerta.getMaximoIdCliente().trim()) + "\",");
			strJson1.append("\"pcboMaximoCliente\" : \"" + AppUtils.cleanString(objBeanAlerta.getMaximoCliente().trim()) + "\",");
			strJson1.append("\"ptxtMaximoTicketId\" : \"" + AppUtils.cleanString(objBeanAlerta.getMaximoIdTicket().trim()) + "\",");
			strJson1.append("\"ptxtMaximoResumen\" : \"" + AppUtils.cleanString(objBeanAlerta.getMaximoResumen().trim()) + "\",");
			strJson1.append("\"ptxtMaximoDetalle\" : \"" + AppUtils.cleanString(objBeanAlerta.getMaximoDetalle().trim()) + "\",");
			strJson1.append("\"ptxtMaximoPrioridad\" : \"" + AppUtils.cleanString(objBeanAlerta.getMaximoPrioridad().trim()) + "\",");
			strJson1.append("\"ptxtMaximoFechaCreacion\" : \"" + AppUtils.cleanString(objBeanAlerta.getMaximoFechaCreacion().trim()) + "\",");
			strJson1.append("\"ptxtMaximoIdEstado\" : \"" + AppUtils.cleanString(objBeanAlerta.getMaximoIdEstado().trim()) + "\",");
			strJson1.append("\"pcboMaximoEstado\" : \"" + AppUtils.cleanString(objBeanAlerta.getMaximoEstado().trim()) + "\",");
			strJson1.append("\"ptxtMaximoIdGrupoPropietario\" : \"" + AppUtils.cleanString(objBeanAlerta.getMaximoIdGrupoPropietario().trim()) + "\",");
			strJson1.append("\"ptxtMaximoGrupoPropietario\" : \"" + AppUtils.cleanString(objBeanAlerta.getMaximoGrupoPropietario().trim()) + "\",");
			strJson1.append("\"ptxtMaximoIdGrupoResolutor\" : \"" + AppUtils.cleanString(objBeanAlerta.getMaximoIdGrupoResolutor().trim()) + "\",");
			strJson1.append("\"ptxtPm\" : \"" + AppUtils.cleanString(objBeanAlerta.getPm()) + "\",");
			strJson1.append("\"ptxtCrisisTurno\" : \"" + objBeanAlerta.getCrisisTurno() + "\",");
			strJson1.append("\"ptxtHoraNotificacionIbm\" : \"" + AppUtils.cleanString(objBeanAlerta.getFechaNotificacionIbm().trim()) + "\",");
			strJson1.append("\"pcboDataCenter\" : \"" + objBeanAlerta.getIdDataCenter() + "\",");
			strJson1.append("\"ptxtHoraFin\" : \"" + AppUtils.cleanString(objBeanAlerta.getFechaFin().trim()) + "\",");
			strJson1.append("\"pcboTeamSoporte\" : \"" + AppUtils.cleanString(objBeanAlerta.getStrTeamSoporte().trim()) + "\",");
			strJson1.append("\"pcboTipoFalla\" : \"" + objBeanAlerta.getIdTipoFalla() + "\",");
			strJson1.append("\"pchkIncidenteConcurrente\" : \"" + objBeanAlerta.getConcurrencia() + "\",");
			strJson1.append("\"pchkOtrosClientes\" : \"" + objBeanAlerta.getOtrosClientes() + "\",");
			strJson1.append("\"pcboPropiedadInc\" : \"" + AppUtils.cleanString(objBeanAlerta.getPropietarioIncidencia().trim()) + "\",");
			strJson1.append("\"ptxtServicioImpactado\" : \"" + AppUtils.cleanString(objBeanAlerta.getServicioImpactado().trim()) + "\",");
			strJson1.append("\"pcboSla\" : \"" + objBeanAlerta.getIdSla() + "\",");
			strJson1.append("\"ptxtImpactoNegocio\" : \"" + AppUtils.cleanString(objBeanAlerta.getImpactoNegocio().trim()) + "\",");
			strJson1.append("\"ptxtTicketProblema\" : \"" + AppUtils.cleanString(objBeanAlerta.getIdticketProblema().trim()) + "\",");
			strJson1.append("\"ptxtTicketCambio\" : \"" + AppUtils.cleanString(objBeanAlerta.getIdticketCambio().trim()) + "\",");
			
			strJson1.append("\"chkCambioPrioridad\" : \"" + (objBeanAlerta.getCambioPm().length() > 0 ? 1 : 0) + "\",");
			strJson1.append("\"pcboCambioPrioridad\" : \"" + objBeanAlerta.getCambioPm() + "\",");
			strJson1.append("\"pcboNotificado\" : \"" + objBeanAlerta.getRecibioAlerta() + "\",");
			strJson1.append("\"ptxtDerivoCambio\" : \"" + AppUtils.cleanString(objBeanAlerta.getDerivoCambio().trim()) + "\",");
			strJson1.append("\"pcboDesviacionIncidencia\" : \"" + AppUtils.cleanString(objBeanAlerta.getDesviacionesIncidentes().trim()) + "\",");
			strJson1.append("\"ptxtEvaluacionCrisis\" : \"" + AppUtils.cleanString(objBeanAlerta.getEvaluacionCrisis().trim()) + "\",");
			strJson1.append("\"ptxtObservaciones\" : \"" + AppUtils.cleanString(objBeanAlerta.getObservaciones().trim()) + "\",");
			
			strJson1.append("\"pcboListaDistribucion\" : \"" + objBeanAlerta.getDistribucion() + "\",");
			strJson1.append("\"pcboEmailAlternativo\" : \"" + objBeanAlerta.getCopiaDistribucion() + "\",");
			strJson1.append("\"pusuarioCreador\" : \"" + AppUtils.cleanString(objBeanAlerta.getUsuarioCreador().trim()) + "\",");
			strJson1.append("\"pusuarioModificador\" : \"" + AppUtils.cleanString(objBeanAlerta.getUsuarioModificador().trim()) + "\"");
			strJson1.append("}]}");
			
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			
			AppUtils.convertAuditoria(req, "LISTAR INCIDENTE POR ID", "OK", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", (objBeanAlerta.toString().length() > 9950 ? objBeanAlerta.toString().substring(0, 9950) : objBeanAlerta.toString()), ssf);
			
		}
		catch(Exception ex){
			System.out.println(ex.toString());
			strJson1 = new StringBuilder();
			strJson1.append("error");
			AppUtils.convertAuditoria(req, "LISTAR INCIDENTE POR ID", "FAIL", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", ex.toString(), ssf);
		}
		out.print(strJson1);
		
	}
	
	public void mantenimientoDetalleIncidente(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		BeanAlerta objBeanAlerta = new BeanAlerta();
		BeanSession objBeanSession = new BeanSession();
		
		int resultado = 0;
		try{
			
			BusinessAlertaEjecutiva objBusinessAlerta = new BusinessAlertaEjecutiva();
			
			objBeanAlerta.setStrTipo(req.getParameter("strOperation"));
			objBeanAlerta.setIdAlerta(Integer.parseInt(req.getParameter("phdIdAlerta")));
			objBeanAlerta.setIdAlertaDet(Integer.parseInt(req.getParameter("pidDetAlerta")));
			objBeanAlerta.setStrMensaje(req.getParameter("ptxtDetalleAlerta") != null ? AppUtils.cleanString(req.getParameter("ptxtDetalleAlerta").trim()) : "");
			objBeanAlerta.setIdUsuario(Integer.parseInt(req.getParameter("pusuario")));
			
			resultado = objBusinessAlerta.mantenimientoDetalleAlertaEjecutiva(objBeanAlerta, ssf);
			
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			
			AppUtils.convertAuditoria(req, "MANTENIMIENTO DETALLE INCIDENTE", (resultado > 0 ? "OK" : "FAIL"), objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", (objBeanAlerta.toString().length() > 9950 ? objBeanAlerta.toString().substring(0, 9950) : objBeanAlerta.toString()), ssf);
		}
		catch(Exception ex){
			resultado = 0;
			System.out.println(ex.toString());
			AppUtils.convertAuditoria(req, "MANTENIMIENTO DETALLE INCIDENTE", "FAIL", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", ex.toString(), ssf);
		}	
		
		if(resultado > 0)
			out.print("ok");
		else
			out.print("fail");
	}
	
	public void listDetalleIncidentePorId(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		List<BeanAlerta> listBeanAlerta = null;
		BeanSession objBeanSession = new BeanSession();
		
		try{
			BusinessAlertaEjecutiva objBusinessAlerta = new BusinessAlertaEjecutiva();
			
			int iIdDetalleAlerta = Integer.parseInt(req.getParameter("pidAlerta"));
			listBeanAlerta = objBusinessAlerta.listDetalleAlertaEjecutivaP1(iIdDetalleAlerta, ssf);
			
			strJson1.append("{\"objDetalleAlertaEjecutiva\" : [");
			for(BeanAlerta item : listBeanAlerta){
				strJson1.append("{");
				strJson1.append("\"idAlertaDet\" : \"" + item.getIdAlertaDet() + "\",");
				strJson1.append("\"fecha\" : \"" + item.getStrFechaReg() + "\",");
				
//				System.out.println("#####################################");
//				System.out.println(item.getStrMensaje());
//				System.out.println(item.getStrMensaje().replaceAll("[\n]", "||").replaceAll("\"", "'").trim() + "\",");
				
				strJson1.append("\"mensaje\" : \"" + AppUtils.cleanString(item.getStrMensaje().replaceAll("[\n]", "||").replaceAll("\"", "'").trim()) + "\",");
				
				strJson1.append("\"supervisor\" : \"" + item.getUsuarioCreador() + "\"");
				strJson1.append("},");
			}
			strJson2.append(listBeanAlerta.size() > 0 ? strJson1.substring(0, strJson1.length() - 1) + "]}" : strJson1.toString()+ "]}" );
			
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			
			AppUtils.convertAuditoria(req, "LISTA DETALLE INCIDENTE POR ID", "OK", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", "iIdDetalleAlerta : " + iIdDetalleAlerta, ssf);
		}
		catch(Exception ex){
			System.out.println(ex.toString());
			strJson1 = new StringBuilder();
			strJson1.append("error");
			AppUtils.convertAuditoria(req, "LISTA DETALLE INCIDENTE POR ID", "FAIL", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", ex.toString(), ssf);
		}
		out.print(strJson2);
	}
	
	public void listDetalleIncidentePorId2(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		List<BeanAlerta> listBeanAlerta = null;
		BeanSession objBeanSession = new BeanSession();
		
		try{
			BusinessAlertaEjecutiva objBusinessAlerta = new BusinessAlertaEjecutiva();
			
			String strTicketId = req.getParameter("pstrTicket");
			listBeanAlerta = objBusinessAlerta.listDetalleAlertaEjecutivaP12(strTicketId, ssf);
			
			strJson1.append("{\"objDetalleAlertaEjecutiva\" : [");
			for(BeanAlerta item : listBeanAlerta){
				strJson1.append("{");
				strJson1.append("\"idAlertaDet\" : \"" + item.getIdAlertaDet() + "\",");
				strJson1.append("\"fecha\" : \"" + item.getStrFechaReg() + "\",");
				
//				System.out.println("#####################################");
//				System.out.println(item.getStrMensaje());
//				System.out.println(item.getStrMensaje().replaceAll("[\n]", "||").replaceAll("\"", "'").trim() + "\",");
				
				strJson1.append("\"mensaje\" : \"" + AppUtils.cleanString(item.getStrMensaje().replaceAll("[\n]", "||").replaceAll("\"", "'").trim()) + "\",");
				
				strJson1.append("\"supervisor\" : \"" + item.getUsuarioCreador() + "\"");
				strJson1.append("},");
			}
			strJson2.append(listBeanAlerta.size() > 0 ? strJson1.substring(0, strJson1.length() - 1) + "]}" : strJson1.toString()+ "]}" );
			
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			
			AppUtils.convertAuditoria(req, "LISTA DETALLE INCIDENTE POR ID", "OK", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", "iIdDetalleAlerta : " + strTicketId, ssf);
		}
		catch(Exception ex){
			System.out.println(ex.toString());
			strJson1 = new StringBuilder();
			strJson1.append("error");
			AppUtils.convertAuditoria(req, "LISTA DETALLE INCIDENTE POR ID", "FAIL", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", ex.toString(), ssf);
		}
		out.print(strJson2);
	}
	
	public void listTicketsAlertaTimeLine(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		List<BeanAlerta> listBeanAlerta = null;
		List<BeanTimeLine> listBeanTimeLine = null;
		List<BeanMaximo> listBeanMaximo = null;
		BeanSession objBeanSession = new BeanSession();
		
		try{
			
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			
			BusinessAlertaEjecutiva objBusinessAlerta = new BusinessAlertaEjecutiva();
			BusinessNotificacion objBusinessNotificacion = new BusinessNotificacion();
			
			WsMaximo objWsMaximo = new WsMaximo();
			listBeanMaximo = objWsMaximo.wsConsultaTicketsPrioridad1(objBeanSession, ssf);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			String strdt1 = "2019-02-27T10:28:32-05:00";
//			Date firstDate = sdf.parse(strdt1);
//			
//			long diffInMillies = Math.abs(new Date().getTime() - firstDate.getTime());
//			long diff = TimeUnit.MINUTES.convert(diffInMillies, TimeUnit.MILLISECONDS);
			
			
			listBeanAlerta = objBusinessAlerta.listTicketsAlertaTimeLine(ssf);
			listBeanTimeLine = objBusinessNotificacion.getListarTimeLine(ssf);
			
			strJson1.append("{\"listTicketsTimeLine\" : [");
			if(listBeanMaximo != null && listBeanMaximo.size() > 0){
				for(BeanMaximo item : listBeanMaximo){
					
					Date firstDate = sdf.parse(item.getTicketFechaCreacion());
					
					long diffInMillies = Math.abs(new Date().getTime() - firstDate.getTime());
					long diff = TimeUnit.MINUTES.convert(diffInMillies, TimeUnit.MILLISECONDS);
					
					strJson1.append("{");
					strJson1.append("\"ticketId\" : \"" + item.getIdTicket() + "\",");
					strJson1.append("\"fecha\" : \"" + sdf1.format(firstDate) + "\",");
					strJson1.append("\"cliente\" : \"" + item.getTicketCliente() + "\",");
					strJson1.append("\"supervisor\" : \"" + item.getTicketPropietario() + "\",");
					strJson1.append("\"minutos\" : \"" + String.valueOf(diff) + "\"");
					strJson1.append("},");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
			
			strJson1 = new StringBuilder();
			strJson1.append("\"listTimeLine\" : [");
			if(listBeanTimeLine != null && listBeanTimeLine.size() > 0){
				for(BeanTimeLine item : listBeanTimeLine){
					strJson1.append("{");
					strJson1.append("\"iSumaMinutosInicio\" : \"" + item.getiSumaMinutosInicio() + "\",");
					strJson1.append("\"iSumaMinutosTarea\" : \"" + item.getiSumaMinutosTarea() + "\",");
					strJson1.append("\"strMensaje\" : \"" + item.getStrMensaje() + "\",");
					strJson1.append("\"strEtiqueta\" : \"" + item.getStrEtiqueta() + "\"");
					strJson1.append("},");
				}
			}
			else
				strJson1.append(",");
			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]");
			strJson2.append("}");
			
//			HttpSession objSessionLogin = req.getSession(false);
//			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			
			AppUtils.convertAuditoria(req, "LISTA TICKET DASHBOARD TINE LINE", "OK", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", "", ssf);
		}
		catch(Exception ex){
			System.out.println(ex.toString());
			strJson1 = new StringBuilder();
			strJson1.append("error");
			AppUtils.convertAuditoria(req, "LISTA TICKET DASHBOARD TINE LINE", "FAIL", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", ex.toString(), ssf);
		}
		out.print(strJson2);
	}
	
	
	public void listarGrupoDistribucion(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		List<BeanOptions> listBeanOptions = null;
		BeanSession objBeanSession = new BeanSession();
		BeanParameters objBeanParameters = new BeanParameters();
		
		try{
			BusinessAlertaEjecutiva objBusinessAlerta = new BusinessAlertaEjecutiva();
			objBeanParameters.setiTeam(Integer.parseInt(req.getParameter("iTeam")));
			objBeanParameters.setStrType("DISTRIBUCION_ALERTA");
			
			int iNivel = Integer.parseInt(req.getParameter("iNivel"));
			
			if(iNivel == 1)
				listBeanOptions = objBusinessAlerta.getGrupoDistribucion(objBeanParameters, ssf);
			else if(iNivel == 2)
				listBeanOptions = objBusinessAlerta.getListaContactos(objBeanParameters, ssf);
			
			strJson1.append("{\"listGrupoDistribucion\" : [");
			for(BeanOptions item : listBeanOptions){
				strJson1.append("{");
				strJson1.append("\"descripcion\" : \"" + (item.getStrDescripcion() != null ? item.getStrDescripcion() : "") + "\",");
				strJson1.append("\"valor1\" : \"" + (item.getStrValor1() != null ? item.getStrValor1() : "") + "\",");
				strJson1.append("\"valor2\" : \"" + (item.getStrValor2() != null ? item.getStrValor2() : "") + "\"");
				strJson1.append("},");
			}
			strJson2.append(listBeanOptions.size() > 0 ? strJson1.substring(0, strJson1.length() - 1) + "]}" : strJson1.toString()+ "]}" );
			
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			
			AppUtils.convertAuditoria(req, "LISTA GRUPO DE DISTRIBUCIÓN", "OK", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", (objBeanParameters.toString().length() > 9950 ? objBeanParameters.toString().substring(0, 9950) : objBeanParameters.toString()), ssf);
		}
		catch(Exception ex){
			System.out.println(ex.toString());
			strJson1 = new StringBuilder();
			strJson1.append("error");
			AppUtils.convertAuditoria(req, "LISTA GRUPO DE DISTRIBUCIÓN", "FAIL", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", ex.toString(), ssf);
		}
		out.print(strJson2);
	}

	public void listarReporteGeneral(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		List<BeanAlerta> listBeanAlerta = null;
		BeanSession objBeanSession = new BeanSession();
		BeanParameters objBeanParameters = new BeanParameters();
		
		try{
			BusinessAlertaEjecutiva objBusinessAlerta = new BusinessAlertaEjecutiva();
			objBeanParameters.setiTeam(Integer.parseInt(req.getParameter("iTeam")));
			objBeanParameters.setStrdate1(req.getParameter("pstrDateInicio"));
			objBeanParameters.setStrdate2(req.getParameter("pstrDateFin"));
			
			listBeanAlerta = objBusinessAlerta.getReporteGeneral(objBeanParameters, ssf);
			strJson1.append("{\"reporte\": [");
			if(listBeanAlerta.size() > 0)
			{
					for(BeanAlerta item : listBeanAlerta)
					{
						strJson1.append("{\"idTicket\" : \"" + item.getMaximoIdTicket() + "\",");
						strJson1.append("\"maximoEstado\" : \"" + item.getEstadoAlerta() + "\",");
						strJson1.append("\"cliente\" : \"" + item.getMaximoCliente() + "\",");
						strJson1.append("\"resumen\" : \"" + item.getMaximoResumen() + "\",");
						strJson1.append("\"detalle\" : \"" + item.getMaximoDetalle() + "\",");
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
						strJson1.append("\"tipoFalla\" : \"" + item.getIdTipoFalla() + "\",");
						strJson1.append("\"concurrencia\" : \"" + item.getConcurrencia() + "\",");
						strJson1.append("\"otrosClientes\" : \"" + item.getStrOtroCliente() + "\",");
						strJson1.append("\"propietarioIncidencia\" : \"" + item.getPropietarioIncidencia() + "\",");
						strJson1.append("\"servicioImpactado\" : \"" + item.getServicioImpactado() + "\",");
						strJson1.append("\"sla\" : \"" + item.getSla() + "\",");
						strJson1.append("\"impactoNegocio\" : \"" + item.getImpactoNegocio() + "\",");
						strJson1.append("\"idTicketProblema\" : \"" + item.getIdticketProblema() + "\",");
						strJson1.append("\"idTicketCambio\" : \"" + item.getIdticketCambio() + "\",");
						strJson1.append("\"cambioPm\" : \"" + item.getCambioPm() + "\",");
						strJson1.append("\"recibioAlerta\" : \"" + item.getRecibioAlerta() + "\",");
						strJson1.append("\"derivoCambio\" : \"" + item.getDerivoCambio() + "\",");
						strJson1.append("\"desviacionesIncidentes\" : \"" + item.getDesviacionesIncidentes() + "\",");
						strJson1.append("\"evaluacionCrisis\" : \"" + item.getEvaluacionCrisis() + "\",");
						strJson1.append("\"usuarioCreador\" : \"" + item.getUsuarioCreador() + "\",");
						strJson1.append("\"usuarioModificador\" : \"" + item.getUsuarioModificador() + "\"");
						
						strJson1.append("},");
					}
			strJson2.append(listBeanAlerta.size() > 0 ? strJson1.substring(0, strJson1.length() - 1) + "]}" : strJson1.toString()+ "]}" );
			}
			
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			
			AppUtils.convertAuditoria(req, "LISTA REPORTE GENERAL", "OK", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", (objBeanParameters.toString().length() > 9950 ? objBeanParameters.toString().substring(0, 9950) : objBeanParameters.toString()), ssf);
		}
		catch(Exception ex){
			System.out.println(ex.toString());
			strJson1 = new StringBuilder();
			strJson1.append("error");
			AppUtils.convertAuditoria(req, "LISTA REPORTE GENERAL", "FAIL", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", ex.toString(), ssf);
		}
		out.print(strJson2);
	}

	public void openTicket(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		StringBuilder strJson1 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		BeanAlerta objBeanAlerta = new BeanAlerta();
		
		objBeanAlerta.setIdAlerta(Integer.parseInt(req.getParameter("pidAlerta").equals("") ? "0" : req.getParameter("pidAlerta")));
		objBeanAlerta.setIdUsuario(Integer.parseInt(req.getParameter("pusuario")));
		BeanSession objBeanSession = new BeanSession();
		
		try{
			BusinessAlertaEjecutiva objBusinessAlerta = new BusinessAlertaEjecutiva();
			
			int resultado = objBusinessAlerta.actualizarAperturaTicket(objBeanAlerta, ssf);
			
			if(resultado > 0)
				strJson1.append("ok");
			else
				strJson1.append("error");
		
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			
			AppUtils.convertAuditoria(req, "REABRIR REGISTRO DE ALERTA DE TICKET YA FINALIZADO", "OK", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", (objBeanAlerta.toString().length() > 9950 ? objBeanAlerta.toString().substring(0, 9950) : objBeanAlerta.toString()), ssf);
		}
		catch(Exception ex){
			System.out.println(ex.toString());
			strJson1 = new StringBuilder();
			strJson1.append("error");
			AppUtils.convertAuditoria(req, "REABRIR REGISTRO DE ALERTA DE TICKET YA FINALIZADO", "FAIL", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", ex.toString(), ssf);
		}
		out.print(strJson1);
	}
}
