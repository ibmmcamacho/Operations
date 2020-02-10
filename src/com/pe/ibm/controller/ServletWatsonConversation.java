package com.pe.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.ibm.watson.developer_cloud.conversation.v1.model.MessageResponse;
import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessOptions;
import com.pe.ibm.business.BusinessPersonal;
import com.pe.ibm.ws.WatsonConversation;
import com.pe.ibm.ws.WatsonTextToVoice;
import com.pe.ibm.ws.WsMaximo;

/**
 * Servlet implementation class ServletWatsonConversation
 */
@WebServlet("/ServletWatsonConversation")
public class ServletWatsonConversation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletWatsonConversation() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* Obtener sqlsessionF */
		SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
		SqlSessionFactory ssfCisco = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfCisco");
		String strOperacion = request.getParameter("strOperation");
		if (strOperacion.equals("conversationInput")) {
			watsonConversation(request, response, ssf);
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

	public void watsonConversation(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf)
			throws IOException {

		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		WatsonConversation objWatsonConversation = new WatsonConversation();
		WatsonTextToVoice objWatsonTextToVoice = new WatsonTextToVoice();
		
		BeanSession objBeanSession = new BeanSession();
		StringBuilder strBuilderConversation = new StringBuilder();
		StringBuilder respListTickets = new StringBuilder();
		String strTicketCreado = "";
		List<BeanMaximo> lstBeanMaximo = new ArrayList<BeanMaximo>();
		String accion ="" ;
		int iResultado = 1;
		
		String strInput = req.getParameter("strInput");
		String strVoice = req.getParameter("strVoice");
		String strCliente = req.getParameter("strCliente");
		int iTeam = Integer.parseInt(req.getParameter("iTeam"));
		Map context = new HashMap();
		MessageResponse response = null;
		
		
		TimeZone timeZone = TimeZone.getDefault();
		try {
			
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			
			context.put("UsuarioSession", objBeanSession.getObjBeanPersonal().getStrNombre());
			context.put("UsuarioEmail", objBeanSession.getObjBeanPersonal().getStrIdLogin());
			context.put("currentTime", Calendar.getInstance(timeZone).getTime().toString());
			context.put("timezone", timeZone.getID());

			if(objBeanSession.getContextConversationWatson() != null) {
				context = objBeanSession.getContextConversationWatson();
			}
			
			if(strInput.equals(""))
				context.put("welcome", "on");
			

			response = objWatsonConversation.conversationAPI(strInput, context);
			context = response.getContext();
			
//			if(objBeanSession.getContextConversationWatson() == null) {
//				objBeanSession.setStrIdConversationWatson(context.get("conversation_id").toString());
				if(strInput.equals(""))
					context.put("welcome", "off");
				objBeanSession.setContextConversationWatson(context);
				objSessionLogin.setAttribute("usuarioLogin", objBeanSession);
				
//			}
			
			accion = (String) response.getOutput().get("action");
			
			if(strInput != "" && accion != null){
				if (accion.equals("listar30ultimosTickets")){
					
					WsMaximo objWsMaximo = new WsMaximo();
					
					lstBeanMaximo = objWsMaximo.wsConsultarUltimo30TicketsCreados(objBeanSession, ssf);
					
					if(lstBeanMaximo.size()>0){
						iResultado = 1;
						respListTickets = new StringBuilder();
						for(int i = 0 ; i < lstBeanMaximo.size(); i++) {
							respListTickets.append("{")
							.append("\"nro\": \"" + (i+1) + "\",")
							.append("\"fecha\": \"" + lstBeanMaximo.get(i).getTicketFechaCreacion() + "\",")
							.append("\"idticket\": \"" + lstBeanMaximo.get(i).getIdTicket() + "\",")
							.append("\"ticketEstado\": \"" + lstBeanMaximo.get(i).getTicketEstado() + "\",")
							.append("\"ticketTitulo\": \"" + lstBeanMaximo.get(i).getTicketTitulo().replace("\"", "\\\"").replace("~null~", "") + "\",")
							.append("\"ticketPropietario\": \"" + lstBeanMaximo.get(i).getTicketEmailPropietario() + "\"")
							.append("},");
						}  
					}else{
						iResultado = 1;
						respListTickets.append(",");
					}
				}
				else if (accion.equals("listarTicketsMes")){
					
					WsMaximo objWsMaximo = new WsMaximo();
					
					lstBeanMaximo = objWsMaximo.wsConsultarMesActual(objBeanSession, ssf);
					
					if(lstBeanMaximo.size()>0){
						iResultado = 1;
						respListTickets = new StringBuilder();
						for(int i = 0 ; i < lstBeanMaximo.size(); i++) {
							respListTickets.append("{")
							.append("\"nro\": \"" + (i+1) + "\",")
							.append("\"fecha\": \"" + lstBeanMaximo.get(i).getTicketFechaCreacion() + "\",")
							.append("\"idticket\": \"" + lstBeanMaximo.get(i).getIdTicket() + "\",")
							.append("\"ticketEstado\": \"" + lstBeanMaximo.get(i).getTicketEstado() + "\",")
							.append("\"ticketTitulo\": \"" + lstBeanMaximo.get(i).getTicketTitulo().replace("\"", "\\\"").replace("~null~", "")  + "\",")
							.append("\"ticketPropietario\": \"" + lstBeanMaximo.get(i).getTicketEmailPropietario() + "\"")
							.append("},");
						}
					}else{
						iResultado = 1;
						respListTickets.append(",");
					}
				}
				else if (accion.equals("buscarTicket")){
							
					BeanMaximo objBeanticket = new BeanMaximo();
					String strIdTicket = (String) response.getContext().get("TICKETID");
					
					WsMaximo objWsMaximo = new WsMaximo();
					
					objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
					objBeanticket = objWsMaximo.wsConsultarTicketMobility(strIdTicket, objBeanSession, ssf);

					if(objBeanticket.getIdTicket() != null){
					
						BusinessOptions objBusinessOptions = new BusinessOptions();
						BeanParameters objBeanParameters = new BeanParameters();
						objBeanParameters = objBusinessOptions.listCalculotiempo(objBeanticket, (SqlSessionFactory) req.getServletContext().getAttribute("sqlsfCisco"));
//						BeanCalculoTiempoSolucion beanCalculo = new BeanCalculoTiempoSolucion();
						iResultado = 1;
//						if(objBeanParameters != null) {
							
							
							respListTickets = new StringBuilder();
							respListTickets.append("{")
							.append("\"fecha\": \"" + objBeanticket.getTicketFechaCreacion() + "\",")
							.append("\"idTicket\": \"" + objBeanticket.getIdTicket() + "\",")
							.append("\"ticketEstado\": \"" + objBeanticket.getTicketEstado() + "\",")
							.append("\"ticketTitulo\": \"" + objBeanticket.getTicketTitulo().replace("\"", "\\\"").replace("~null~", "")  + "\",")
							.append("\"ticketAffectado\": \"" + objBeanticket.getTicketPersonaAfectada() + "" + "\",")
							.append("\"ticketEmailAffectado\": \"" + objBeanticket.getTicketEmailPersonaAfectada() + "" + "\",")
							.append("\"ticketEmailPropietario\": \"" + objBeanticket.getTicketEmailPropietario() + "\",")
							.append("\"dias\": \"" + (objBeanParameters.getStrValor1() != null ? objBeanParameters.getStrValor1() : "") + "\"")
							.append("},");
						
					}else {
						iResultado = 1;
						respListTickets.append(",");
					}
				}
				else if (accion.equals("listarComentarios")){
					
					BeanMaximo objBeanticket = new BeanMaximo();
					String strIdTicket = (String) response.getContext().get("TICKETID");
					
					WsMaximo objWsMaximo = new WsMaximo();
					
					objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
					objBeanticket = objWsMaximo.wsConsultarTicketMobility(strIdTicket, objBeanSession, ssf);

					if(objBeanticket.getIdTicket() != null){
						iResultado = 1;
						respListTickets = new StringBuilder();
						if(objBeanticket.getBeanMaximoWorklog() != null) {
							for(int i = 0 ; i < objBeanticket.getBeanMaximoWorklog().size(); i++) {
								respListTickets.append("{")
								.append("\"nro\": \"" + (i+1) + "\",")
								.append("\"idTicket\": \"" + objBeanticket.getIdTicket() + "\",")
								.append("\"fecha\": \"" + objBeanticket.getBeanMaximoWorklog().get(i).getCreateDate() + "\",")
								.append("\"descripcion\": \"" + objBeanticket.getBeanMaximoWorklog().get(i).getDescription().replace("\"", "\\\"").replace("~null~", "")  + "\",")
								.append("\"descripcion_log\": \"" + objBeanticket.getBeanMaximoWorklog().get(i).getDescription_long().replace("\"", "\\\"").replace("~null~", "")  + "\"")
								.append("},");
							}
						}
					}else {
						iResultado = 1;
						respListTickets.append(",");
					}
				}
				else if (accion.equals("registrarWorkLog")){
					
					BeanMaximo objBeanticket = new BeanMaximo();
					String strIdTicket = (String) response.getContext().get("TICKETID");
					String strClassTicket = (String) response.getContext().get("TIPOTICKET");

				    objBeanticket.setTicketClass(strClassTicket);
//				    objBeanticket.setTicketSiteId("");
				    objBeanticket.setIdTicket(strIdTicket);
				    objBeanticket.getObjBeanMaximoWorkLog().setDescription("COMENTARIO CHATBOT SAYRI MOBILITY");
				    objBeanticket.getObjBeanMaximoWorkLog().setDescription_long(strInput);
				    objBeanticket.getObjBeanMaximoWorkLog().setLogType("WORK");
					
					WsMaximo objWsMaximo = new WsMaximo();
					
					objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
					String resp = objWsMaximo.wsRegistrarWorkLog(objBeanticket, objBeanSession, ssf);
					
					iResultado = 1;
					
				}
				else if (accion.equals("procedimiento")){			
					respListTickets = new StringBuilder();
					respListTickets.append("{\"nombreProcedimiento\" : \"" + (String) response.getOutput().get("nprocedimiento") + "\"," +
							"\"urlProcedimiento\" : \"" + (String) response.getOutput().get("urlprocedimiento") + "\"},");
					iResultado = 1;
				}
				else if (accion.equals("listarProcedimientos")){
					
					String strProcedimientos = response.getOutput().get("procedimientos").toString();
					
					respListTickets = new StringBuilder();
					respListTickets.append("{\"procedimientos\" : " + strProcedimientos + "},");
					iResultado = 1;
				}
				else if(accion.equals("informacionResponsables")) {
					
					BeanParameters objParameters = new BeanParameters();
					BusinessOptions objBusinessOptions = new BusinessOptions();
					BeanEmpleado objEmpleado = null;
					BusinessPersonal objBusinessEmpleado = new BusinessPersonal();
					
					List<BeanOptions> lstOptions = new ArrayList<BeanOptions>();
					objParameters.setiTeam(iTeam);
					objParameters.setStrType("CHATBOT_RESPONSABLES");
					objParameters.setStrValor1(strCliente);
//					lstOptions = objBusinessOptions.listOptions3(objParameters, ssf);
					lstOptions = objBusinessEmpleado.getResponsablesChatbot(objParameters, ssf);
					
						respListTickets = new StringBuilder();
					
					if(lstOptions != null) {
						for(int i = 0 ; i < lstOptions.size(); i++) {
							objEmpleado = new BeanEmpleado();
							objEmpleado.setStrIdLogin(lstOptions.get(i).getStrDescripcion());
							objEmpleado.setiTeam(iTeam);
							objEmpleado = objBusinessEmpleado.listPersonalIdLogin(objEmpleado, (SqlSessionFactory) req.getServletContext().getAttribute("sqlsf"));
							
							respListTickets.append("{")
							.append("\"correo\": \"" + lstOptions.get(i).getStrDescripcion() + "\",")
							.append("\"nombre\": \"" + objEmpleado.getStrNombre() + " " + objEmpleado.getStrApPaterno() + "\",")
							.append("\"cargo\": \"" + lstOptions.get(i).getStrValor2() + "\",");
							
//							String strPhoto = objBusinessEmpleado.listImage(objEmpleado, (SqlSessionFactory) req.getServletContext().getAttribute("sqlsf"));
							respListTickets.append("\"foto\": \"http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=" + objEmpleado.getStrEmail() + "\"")
							.append("},");
						}
					}
					iResultado = 1;
				}
				else if(accion.equals("crearTicket")) {
					
					BeanParameters objParameters = new BeanParameters();
					BusinessOptions objBusinessOptions = new BusinessOptions();
					BeanEmpleado objEmpleado = null;
					BusinessPersonal objBusinessEmpleado = new BusinessPersonal();
					BeanMaximo objMaximo = new BeanMaximo();
					WsMaximo objWsMaximo = new WsMaximo();
					
					objMaximo.setTicketEmailPersonaAfectada((String) response.getContext().get("personaafectada"));
					objMaximo.setTicketNumeroCI((String) response.getContext().get("numci"));
//					objMaximo.setTicketIdClasificacion((String) response.getContext().get("classificationid"));
//					objMaximo.setTicketEmailPersonaCreadora((String) response.getContext().get("UsuarioEmail"));
					objMaximo.setTicketTitulo((String) response.getContext().get("descripcion"));
//					objMaximo.setTicketExternalSystem("CHAT");
					objMaximo.setTicketImpact((String) response.getContext().get("impacto"));
					objMaximo.setTicketUrgencia((String) response.getContext().get("urgencia"));
					objMaximo.setTicketReportador((String) response.getContext().get("UsuarioEmail"));
					
					objMaximo.setTicketGrupoPropietario("I-PCT-TWS-PE-VIR01");
					strTicketCreado = objWsMaximo.wsRegistrarTicket(objMaximo, objBeanSession, ssf); 
					
					if(strTicketCreado != null && !strTicketCreado.equals("")) {
//						response = response.getText().get(0).replace("TTTTTT", strTicketCreado);
						iResultado = 1;
					}
					
					
				}
				
				
//				else if (accion.equals("registrar_worklog")){
//					
//					WorklogBean wlBean = new WorklogBean ();
//					wlBean.setDescripcion("Chatbot: Usuario registr� un comentario");
//					wlBean.setDetalle(response.getInputText());
//					wlBean.setTicketid((String) response.getContext().get("TICKETID"));
//					wlBean.setClase("SR");
//				
//					boolean estado = servicio.registrarWL(beanUsuario, wlBean);
//					
//					if(estado) {
//						respuestaWatson1.append(response.getText().get(0));
//					}else {
//						respuestaWatson1.append(response.getOutput().get("text_error"));	
//					}
//				}
//				else
//					respuestaWatson1.append(response.getText().get(0));	
//		}else {
//			respuestaWatson1.append(response.getText().get(0));	
		}
			
			String responseText = response.getText().get(0).replace("EEEEEE", "</br>").replace("TTTTTT", strTicketCreado);
			String strWav = "";
			if(strVoice.equals("1"))
				strWav = objWatsonTextToVoice.transformationTextToVoice(responseText);
			
			strBuilderConversation.append("{\"watson\" : [");
			strBuilderConversation.append("{");
			strBuilderConversation.append("\"response\" : \"" + (iResultado == 1 ? responseText : response.getOutput().get("no_data")) + "\",");
			strBuilderConversation.append("\"action\" : \"" + accion + "\",");
			strBuilderConversation.append("\"objMaximo\" : [" + (respListTickets.length() > 0 ? respListTickets.toString().substring(0,respListTickets.length() - 1) : "") + "],");
			strBuilderConversation.append("\"wav\" : \"" + strWav + "\"");
			strBuilderConversation.append("}]}");

		} catch (Exception ex) {
			System.out.println(ex);
			strBuilderConversation = new StringBuilder();
			strBuilderConversation.append("error");
		}
		
		out.print(strBuilderConversation.toString());

	}
	
	
	
//	public void watsonConversationBackUp(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf)
//			throws IOException {
//
//		res.setCharacterEncoding("UTF-8");
//		PrintWriter out = res.getWriter();
//		WatsonConversation objWatsonConversation = new WatsonConversation();
//		WatsonTextToVoice objWatsonTextToVoice = new WatsonTextToVoice();
//
//		StringBuilder strBuilderConversation = new StringBuilder();
//		String strInput = req.getParameter("strInput");
//		Map context = new HashMap();
//		MessageResponse response = null;
//		TimeZone timeZone = TimeZone.getDefault();
//		try {
//			context.put("userName", "Manuel");
//			context.put("currentTime", Calendar.getInstance(timeZone).getTime().toString());
//			context.put("timezone", timeZone.getID());
//
//			// System.out.print(userName + " : ");
//			// String input = br.readLine();
//			response = objWatsonConversation.conversationAPI(strInput, context);
//			// System.out.println("Watson Response: " + response.getText().get(0));
//			// System.out.println("id generado: " + response.getText().get(1));
//			context = response.getContext();
//			// System.out.println("———–");
//			
//			
//			
//			String strWav = objWatsonTextToVoice.transformationTextToVoice(response.getText().get(0));
//
//			strBuilderConversation.append("{\"watson\" : [");
//			strBuilderConversation.append("{");
//			strBuilderConversation.append("\"response\" : \"" + response.getText().get(0) + "\",");
//			strBuilderConversation.append("\"wav\" : \"" + strWav + "\"");
//			strBuilderConversation.append("}]}");
//			
//
////			File f=new File("output.wav");
////			URL u= f.toURL();
////			AudioClip clip = Applet.newAudioClip(u);
////			System.out.println(f.toURL());
////			clip.play();
//
//			//
//			// //archivo de audio
//			// File f=new File("output.wav");
//			// //lo convertimos a url
//			// URL u= f.toURL();
//			// System.out.println(f.toURL());
//			// System.out.println(f.toPath());
//			// System.out.println(f.getPath());
//			// //Bueno de la AudioClip no se puede instancias por eso esto
//			// AudioClip sonido=JApplet.newAudioClip(u);
//			// //para que suene
//			// sonido.play();
//			// //como el programa se ejecuta muy rapido el audio no se alcanza a escuchar
//			//// Thread.currentThread().sleep(5000);
//			// //si fuese una ventana no fuese necesario esa linea
//
//		} catch (Exception ex) {
//			System.out.println(ex);
//		}
//
//		out.print(strBuilderConversation.toString());
//
//	}
	
//	public Chat respuestaChat (String mensajeUsuarioChat, String idchat, Usuario beanUsuario){
//		
//		//Captura mensaje recibido del usuario
//		String input = mensajeUsuarioChat.trim().toLowerCase();
//		
//		//Inicializaci�n de variables
//		StringBuilder respuestaWatson1 = new StringBuilder();
//		StringBuilder respuestaWatson2 = new StringBuilder();
//		String accion ="" ;
//		Chat objChat = new Chat();
//    	Map context = null;
//		MessageResponse response = null;
//		Utilitario util = new Utilitario();
//		BusinessTicket servicio = new BusinessTicket();
//		
//		//Invocaci�n servicio Watson Conversation
//		response = ServicioWatsonConversacion.conversationAPI(input, beanUsuario.getMapContext()); 
//		//Agregando cuenta de usuario al contexto, siempre y cuando la variable USUARIO se encuentra vacia.
//		response.getContext().replace("USUARIO","", beanUsuario.getUsuario());
//		
//		
//		
//		try{
//			//Captura de mapa de la variable "action" 
//			accion = (String) response.getOutput().get("action");
//
//
//			if(input != "" && accion != null){
//				
//					switch(accion){
//					
//					case "listar_tickets":
//						
//						List<TicketBean> lstickets = new ArrayList<>();
//						String usuario_afectado = String.valueOf(response.getOutput().get("USUARIO_AFECTADO"));
//						lstickets = servicio.listarTickets(beanUsuario, util.fechaInicio() , util.fechaActual(), usuario_afectado);
//						
//						if(lstickets.size()>0){
//							respuestaWatson1.append(response.getText().get(0));	
//							respuestaWatson1.append(new Formato_HTML().obtenerListaTickets(lstickets));	
//						}else{
//							respuestaWatson1.append(response.getOutput().get("no_data"));
//						}
//						break;
//					
//					case "buscar_ticket":
//									
//						TicketBean beanticket=new TicketBean();
//						String ticketID = (String) response.getContext().get("TICKETID");
//						beanticket.setIdticket(ticketID);
//						beanticket = servicio.buscarSR(beanUsuario, beanticket);
//						
//						if(beanticket != null) {
//						
//							BeanTiempoSolucion btiempo = new BeanTiempoSolucion();
//							btiempo = servicio.obtenerTiempoEstimadoSolucion(beanticket.getCliente(), beanticket.getClassstructureid());
//							BeanCalculoTiempoSolucion beanCalculo = new BeanCalculoTiempoSolucion();
//							
//							if(btiempo != null) {
//								beanCalculo = util.calculoFechaSolucion(beanticket.getFecha_creacion(), btiempo.getTiempo(), btiempo.getUnidad());	
//								
//								if(beanCalculo.isEstado()) {
//								response.getContext().replace("WORKLOG_ENABLE", "false");
//								}else {
//								response.getContext().replace("WORKLOG_ENABLE", "true");
//								respuestaWatson1.append(response.getText().get(0));
//								response = ServicioWatsonConversacion.conversationAPI("", response.getContext()); 
//								respuestaWatson2.append(response.getText().get(0));
//								response.getContext().replace("WORKLOG_ENABLE", "false");
//								}
//								
//							}else {
//								respuestaWatson1.append(response.getText().get(0));
//								response.getContext().replace("WORKLOG_ENABLE", "false");
//							}
//							
//							respuestaWatson1.append(new Formato_HTML().obtenerDestalleTicket(beanticket, btiempo, beanCalculo));
//							
//							
//							
//						}else {
//							respuestaWatson1.append(response.getOutput().get("no_data"));
//						}
//						
//						break;
//				
//					case "registrar_worklog":
//						
//						WorklogBean wlBean = new WorklogBean ();
//						wlBean.setDescripcion("Chatbot: Usuario registr� un comentario");
//						wlBean.setDetalle(response.getInputText());
//						wlBean.setTicketid((String) response.getContext().get("TICKETID"));
//						wlBean.setClase("SR");
//					
//						boolean estado = servicio.registrarWL(beanUsuario, wlBean);
//						
//						if(estado) {
//							respuestaWatson1.append(response.getText().get(0));
//						}else {
//							respuestaWatson1.append(response.getOutput().get("text_error"));	
//						}
//
//						break;
//					default :
//						respuestaWatson1.append(response.getText().get(0));	
//						break;
//					
//					}
//
//			}else {
//				respuestaWatson1.append(response.getText().get(0));	
//			}
//
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		
//		
//		//Almacenamiento de contexto Watson Conversation
//			context = response.getContext();
//				
//			objChat.setMensaje1(String.valueOf(respuestaWatson1));	
//			objChat.setMensaje2(String.valueOf(respuestaWatson2));	
//			objChat.setId_context(context);
//
//
//		return objChat;
//		
//	}

}
