package com.pe.ibm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;
//import org.eclipse.persistence.jpa.jpql.tools.model.query.IdentificationVariableDeclarationStateObject;

import com.pe.ibm.bean.BeanPerfil;
import com.pe.ibm.bean.BeanPerfilDet;
import com.pe.ibm.bean.BeanRCT;
import com.pe.ibm.bean.BeanSchedule;
import com.pe.ibm.bean.BeanScheduleActividad;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.bean.BeanUsuario;
import com.pe.ibm.business.BusinessPerfil;
import com.pe.ibm.business.BusinessRCT;
import com.pe.ibm.business.BusinessSchedule;
import com.pe.ibm.business.BusinessScheduleActividad;
import com.pe.ibm.business.BusinessUsuario;
import com.pe.ibm.util.AppUtils;

/**
 * Servlet implementation class ServletDetalleSchedule
 */
@WebServlet("/ServletDetalleSchedule")
public class ServletDetalleSchedule extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private int strAccion;
	private int strIdSchedule;
	private int strIdScheduleActividad;
	private String strComentario;
	private int strEstado;
	private int strIdUsuario;
	private int resultado = 0;
	private String respuesta;
	private int team;
	private int user;
	private String horainicio;
	private String fecha;
	private String fechainicio;
	private String fechafin;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletDetalleSchedule() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
		//Captura de parametros
		this.strAccion = Integer.parseInt(request.getParameter("strAccion"));
		
		BeanSession objBeanSession = new BeanSession();
		
		HttpSession objSessionLogin = request.getSession(true);
		objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
		
		this.team = objBeanSession.getObjBeanPersonal().getiTeam();
//		this.user = objBeanSession.getObjBeanPersonal().getStrIdLogin();

		switch (this.strAccion){
		
		case 1: //Insertar
			break;
		case 2: //listar
			listarDetalleSchedule(request, response,team,ssf);
			break;
		case 3: //actualizar Hora Inicio
			actualizarHoraInicio(request, response,ssf);
			break;
		case 4: //actualizar Hora Fin
			actualizarHoraFin(request, response,ssf);
			break;
		case 5: //actualizar Comentario
			actualizarComentario(request, response,ssf);
			break;
		case 6: //actualizar Estado
			actualizarEstado(request, response,ssf);
			break;
		case 7: //actualizar Usuario
			actualizarUsuario(request, response,ssf);
			break;
		case 8: //listar Personas
			listarPersonas(request, response,ssf);
			break;
		case 9: //listar Personas
			generarCabecera(request, response,ssf);
			break;
		case 10: //listar Personas
			listarMonitoreoIndia(request, response,ssf);
			break;
		case 11: //Mandar a RCT
			saveRCT(request, response,ssf);
			break;
		}

		
		
	}
	
	private void actualizarHoraInicio(HttpServletRequest request, HttpServletResponse response,SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		
		
		response.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = response.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		
		//Instancear metodos 
		BusinessScheduleActividad servicio = new BusinessScheduleActividad();
		BeanScheduleActividad bean = new BeanScheduleActividad();
		
		try {

			//captura de parametros
			this.strIdScheduleActividad = Integer.parseInt(request.getParameter("strIdScheduleActividad"));
			
			this.strIdSchedule = Integer.parseInt(request.getParameter("strIdSchedule"));
			
			bean.setIdSchedule(strIdSchedule);
			bean.setIdScheact(strIdScheduleActividad);
			bean.setOperacion("ACTUALIZAR_HORA_INICIO");
			
		
			resultado = servicio.insertar_actualizar(bean, ssf);
			
			
			if(resultado >0) { //Registro correcto
				
				
				BeanScheduleActividad beanScheduleActividad = servicio.buscarScheduleActividad(bean, ssf);
				
				//Generar JSON
				objJson1.append("{\"BeanScheduleActividad\": [");
				
				if(beanScheduleActividad.getIdScheact()>0){

						objJson1.append("{" +
								"\"idScheact\" : \"" + beanScheduleActividad.getIdScheact()+ "\" ," +
								"\"horaInicio\" : \"" + beanScheduleActividad.getHoraInicio()+ "\" ," +
								"\"horaFin\" : \"" + beanScheduleActividad.getHoraFin()+ "\" ," +
								"\"duracion\" : \"" + beanScheduleActividad.getDuracion()+ "\" ," +
								"\"comentariosched\" : \"" + beanScheduleActividad.getComentariosched().replace("\"", "\\\"")+ "\" ," +
								"\"usermod\" : \"" + beanScheduleActividad.getUsermod()+ "\" ," +
								"\"estadotar\" : \"" + beanScheduleActividad.getEstadotar()+ "\"" +
								"},"
								);
				}else { // Bean vacio
						objJson1.append("{" +
								"\"idScheduleActividad\" : \"" + "" + "\" " +
								"},"
								);
				}
			}else { // Error en el registro
						objJson1.append("{" +
								"\"idScheduleActividad\" : \"" + "" + "\" " +
								"},"
								);
			}

			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaScheduleActividad\": [");
		
				objJson1.append("{" +
						"\"idScheduleActividad\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
		
	}
	
	private void actualizarHoraFin(HttpServletRequest request, HttpServletResponse response,SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = response.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		int iIdSchedule = 0; 
		
		//Instancear metodos 
		BusinessScheduleActividad servicio = new BusinessScheduleActividad();
		BeanScheduleActividad bean = new BeanScheduleActividad();
		
		try {

			//captura de parametros
			this.strIdScheduleActividad = Integer.parseInt(request.getParameter("strIdScheduleActividad"));

			this.strIdSchedule = Integer.parseInt(request.getParameter("strIdSchedule"));
			
			bean.setIdSchedule(strIdSchedule);
			
			bean.setIdScheact(strIdScheduleActividad);
			bean.setOperacion("ACTUALIZAR_HORA_FIN");
			
			
			
			resultado = servicio.insertar_actualizar(bean, ssf);
			
			
			
			if(resultado >0) { //Registro correcto
				
				
				BeanScheduleActividad beanScheduleActividad = servicio.buscarScheduleActividad(bean, ssf);
				
				
				//Generar JSON
				objJson1.append("{\"BeanScheduleActividad\": [");
				
				if(beanScheduleActividad.getIdScheact()>0){

						objJson1.append("{" +
								"\"idScheact\" : \"" + beanScheduleActividad.getIdScheact()+ "\" ," +
								"\"horaInicio\" : \"" + beanScheduleActividad.getHoraInicio()+ "\" ," +
								"\"horaFin\" : \"" + beanScheduleActividad.getHoraFin()+ "\" ," +
								"\"duracion\" : \"" + beanScheduleActividad.getDuracion()+ "\" ," +
								"\"comentariosched\" : \"" + beanScheduleActividad.getComentariosched().trim().replace("\"", "\\\"")+ "\" ," +
								"\"usermod\" : \"" + beanScheduleActividad.getUsermod().trim()+ "\" ," +
								"\"estadotar\" : \"" + beanScheduleActividad.getEstadotar()+ "\"" +
								"},"
								);
				}else { // Bean vacio
						objJson1.append("{" +
								"\"idScheduleActividad\" : \"" + "" + "\" " +
								"},"
								);
				}
			}else { // Error en el registro
						objJson1.append("{" +
								"\"idScheduleActividad\" : \"" + "" + "\" " +
								"},"
								);
			}

			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaScheduleActividad\": [");
		
				objJson1.append("{" +
						"\"idScheduleActividad\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
		
	}
	
	private void actualizarComentario(HttpServletRequest request, HttpServletResponse response,SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		
		
		response.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = response.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		
		//Instancear metodos 
		BusinessScheduleActividad servicio = new BusinessScheduleActividad();
		BeanScheduleActividad bean = new BeanScheduleActividad();
		
		try {

			//captura de parametros
			this.strIdScheduleActividad = Integer.parseInt(request.getParameter("strIdScheduleActividad"));
			this.strComentario = request.getParameter("strComentario");
			this.strIdSchedule = Integer.parseInt(request.getParameter("strIdSchedule"));
			
			bean.setIdSchedule(strIdSchedule);
			
			bean.setIdScheact(strIdScheduleActividad);
			bean.setOperacion("ACTUALIZAR_COMENTARIO");
			bean.setComentariosched(this.strComentario.trim());
			
			resultado = servicio.insertar_actualizar(bean, ssf);

			if(resultado >0) { //Registro correcto
				this.respuesta = "El registro se realizo satisfactoriamente";			
			}else { // Error en el registro
				this.respuesta = "*Hubo un error durante el proceso de registro o actualizacióne";	
			}
			
			//Generar JSON
			objJson1.append("{\"ActualizarComentario\": [");
			objJson1.append("{" +
					"\"codigo\" : \"" + this.resultado + "\" ," +
					"\"resultado\" : \"" + this.respuesta + "\" " +
					"},"
					);

			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			resultado = 0;
			respuesta = "*Hubo un error durante el proceso de registro o actualización";
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ActualizarComentario\": [");
			objJson1.append("{" +
					"\"codigo\" : \"" + this.resultado + "\" ," +
					"\"resultado\" : \"" + this.respuesta + "\" " +
					"},"
					);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
		
	}
	
	private void actualizarEstado(HttpServletRequest request, HttpServletResponse response,SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		
		
		response.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = response.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		
		//Instancear metodos 
		BusinessScheduleActividad servicio = new BusinessScheduleActividad();
		BeanScheduleActividad bean = new BeanScheduleActividad();
		
		try {

			//captura de parametros
			this.strIdScheduleActividad = Integer.parseInt(request.getParameter("strIdScheduleActividad"));
			this.strEstado = Integer.parseInt(request.getParameter("strEstado"));
			this.strIdSchedule = Integer.parseInt(request.getParameter("strIdSchedule"));
			
			bean.setIdSchedule(strIdSchedule);
			bean.setIdScheact(strIdScheduleActividad);
			bean.setOperacion("ACTUALIZAR_ESTADO");
			bean.setEstadotar(this.strEstado);
			
			resultado = servicio.insertar_actualizar(bean, ssf);

			if(resultado >0) { //Registro correcto
				this.respuesta = "El registro se realizo satisfactoriamente";			
			}else { // Error en el registro
				this.respuesta = "*Hubo un error durante el proceso de registro o actualizacióne";	
			}
			
			//Generar JSON
			objJson1.append("{\"ActualizarEstado\": [");
			objJson1.append("{" +
					"\"codigo\" : \"" + this.resultado + "\" ," +
					"\"resultado\" : \"" + this.respuesta + "\" " +
					"},"
					);

			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			resultado = 0;
			respuesta = "*Hubo un error durante el proceso de registro o actualización";
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ActualizarEstado\": [");
			objJson1.append("{" +
					"\"codigo\" : \"" + this.resultado + "\" ," +
					"\"resultado\" : \"" + this.respuesta + "\" " +
					"},"
					);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
		
	}
		
	private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response,SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		
		
		response.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = response.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		
		//Instancear metodos 
		BusinessScheduleActividad servicio = new BusinessScheduleActividad();
		BeanScheduleActividad bean = new BeanScheduleActividad();
		
		try {

			//captura de parametros
			this.strIdScheduleActividad = Integer.parseInt(request.getParameter("strIdScheduleActividad"));
			this.strIdUsuario = Integer.parseInt(request.getParameter("strUsuario"));
			
			bean.setIdScheact(strIdScheduleActividad);
			bean.setOperacion("ASIGNAR_TAREA");
			bean.setIdusermod(this.strIdUsuario);
			
			resultado = servicio.insertar_actualizar(bean, ssf);

			if(resultado > 0) { //Registro correcto
				this.respuesta = "El registro se realizo satisfactoriamente";			
			}else { // Error en el registro
				this.respuesta = "*Hubo un error durante el proceso de registro o actualizacióne";	
			}
			
			//Generar JSON
			objJson1.append("{\"ActualizarUsuario\": [");
			objJson1.append("{" +
					"\"codigo\" : \"" + this.resultado + "\" ," +
					"\"resultado\" : \"" + this.respuesta + "\" " +
					"},"
					);

			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			resultado = 0;
			respuesta = "*Hubo un error durante el proceso de registro o actualización";
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ActualizarUsuario\": [");
			objJson1.append("{" +
					"\"codigo\" : \"" + this.resultado + "\" ," +
					"\"resultado\" : \"" + this.respuesta + "\" " +
					"},"
					);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
		
	}

	private void listarDetalleSchedule(HttpServletRequest request, HttpServletResponse response, int team,SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = response.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		
		//Instancear metodos 
		BusinessScheduleActividad servicio = new BusinessScheduleActividad();
		BeanScheduleActividad bean = new BeanScheduleActividad();
		
		try {
			
			//captura de parametros
			BeanSchedule beanSchedule = new BeanSchedule();
			
			HttpSession objSessionSchedule = request.getSession(true);
			beanSchedule =  (BeanSchedule) objSessionSchedule.getAttribute("schedule");
			
			
			this.strIdSchedule = beanSchedule.getIdSchedule();
			this.strIdUsuario = beanSchedule.getIdusermod();
			
			bean.setIdSchedule(strIdSchedule);
			bean.setIdusermod(strIdUsuario);
			
			
			List<BeanScheduleActividad> listaScheduleActividad = servicio.listar(bean, ssf);
			//Generar JSON
			objJson1.append("{\"ListaScheduleActividad\": [");
			
			if(listaScheduleActividad.size()>0){
				for (BeanScheduleActividad beanActividad2 : listaScheduleActividad) {
					
					String buscar = "JOURNAL";
					String buscar2 = "VALIDATE THE START";
					
					int result ;
					int result2 ;
					String link = "";
					int idactivid ;
					
					idactivid = beanActividad2.getIdActividad();
					result = beanActividad2.getDescripcion().trim().indexOf(buscar);
					result2 = beanActividad2.getDescripcion().trim().indexOf(buscar2);
					
					//--BG001 Comentario según el ticket SR2911848 - Richard Caso INDIA
//					if (result != -1 && result2 == -1 && team == 65) {
//						link = "<a href=\'https://ibm.ent.box.com/folder/31854929259\' target=\'_new\' class=\'label label-info label-mini\'|>PROCEDURE JOURNAL BACKUP</a>";
//					}else if(result2 != -1 && result == -1 && team == 65) {
//						link = "<a href=\'https://ibm.ent.box.com/file/155117196668\' target=\'_new\' class=\'label label-info label-mini\'>PROCEDURE TWS BACKUP OFFLINE</a><br><br><a href=\'https://ibm.ent.box.com/file/151483271970\' target=\'_new2\' class=\'label label-info label-mini\'>TWS ERROR BACKUP OFFLINE</a><br><br><a href=\'https://ibm.ent.box.com/file/151483553901\' target=\'_new3\' class=\'label label-info label-mini\'>TWS/OMNIBUS JOB STREAM</a>";
//					}else if(result == -1 && result2 == -1 && idactivid != 2453 && team == 65) {
//						link = "<a href=\'https://ibm.ent.box.com/file/151483553901\' target=\'_new\' class=\'label label-info label-mini\'>TWS/OMNIBUS JOB STREAM</a><br><br><a href=\'https://ibm.ent.box.com/file/210864001166\' target=\'_new2\' class=\'label label-info label-mini\'>PROCEDURE TWS EBIZ REPORT</a>";
//					}else if(result == -1 && result2 == -1 && idactivid == 2453 && team == 65) {
//						link = "<a href=\'https://ibm.ent.box.com/file/151483553901\' target=\'_new\' class=\'label label-info label-mini\'>TWS/OMNIBUS JOB STREAM</a><br><br><a href=\'https://ibm.ent.box.com/file/242349071531\' target=\'_new2\' class=\'label label-info label-mini\'>PROCEDURE MANT PREV</a>";
//					}else if(beanActividad2.getUrlProcedimiento().equals("") || beanActividad2.getUrlProcedimiento().equals(null)) {
						link = beanActividad2.getDescripcionProcedimiento();
//					}else{
//						link = "<a href="+"\'"+beanActividad2.getUrlProcedimiento()+"\'"+" target=\'_new\'>"+beanActividad2.getDescripcionProcedimiento()+"</a>";
//					}
					
					String desc = beanActividad2.getDescripcion().replaceAll("\"","'").replaceAll("[\n\r]"," <br>").trim();
					String coment = beanActividad2.getComentario().replaceAll("\"", "\'").replaceAll("[\n\r]"," <br>").trim();

					
					objJson1.append("{" +
							"\"idActividad\" : \"" + beanActividad2.getIdActividad()+ "\" ," +
							"\"idTurno\" : \"" + beanActividad2.getIdturno()+ "\" ," +
							"\"descripcionTurno\" : \"" + beanActividad2.getDescripcionTurno().trim().replace("\"", "\\\"")+ "\" ," +
							"\"idSede\" : \"" + beanActividad2.getIdSede()+ "\" ," +
							"\"descripcionSede\" : \"" + beanActividad2.getDescripcionSede().trim()+ "\" ," +
							"\"horaEjecucion\" : \"" + beanActividad2.getHoraEjecucion()+ "\" ," +
							"\"descripcion\" : \"" + AppUtils.cleanString(desc) + "\" ," +
							"\"horaTermino\" : \"" + beanActividad2.getHoraTermino()+ "\" ," +
							"\"idPeriodo\" : \"" + beanActividad2.getIdPeriodo()+ "\" ," +
							"\"descripcionPeriodo\" : \"" + beanActividad2.getDescripcionPeriodo().trim()+ "\" ," +
							"\"idPlataforma\" : \"" + beanActividad2.getIdPlataforma()+ "\" ," +
							"\"descripcionPlataforma\" : \"" + beanActividad2.getDescripcionPlataforma().trim()+ "\" ," +
							"\"idProcedimiento\" : \"" + beanActividad2.getIdProcedimiento()+ "\" ," +
							"\"descripcionProcedimiento\" : \"" + link+ "\" ," +
							"\"idServidor\" : \"" + beanActividad2.getIdServidor()+ "\" ," +
							"\"descripcionServidor\" : \"" + beanActividad2.getDescripcionServidor().trim()+ "\" ," +
							"\"idCliente\" : \"" + beanActividad2.getIdCliente()+ "\" ," +
							"\"descripcionCliente\" : \"" + beanActividad2.getDescripcionCliente().trim()+ "\" ," +
							"\"jobStream\" : \"" + beanActividad2.getJobStream().trim()+ "\" ," +
							"\"idTipoActividad\" : \"" + beanActividad2.getIdTipoActividad()+ "\" ," +
							"\"descripcionTipoActividad\" : \"" + beanActividad2.getDescripcionTipoActividad().trim()+ "\" ," +
							"\"estado\" : \"" + beanActividad2.getEstado()+ "\" ," +
							"\"accion\" : \"" + beanActividad2.getAccion()+ "\" ," +
							"\"idTipoRespaldo\" : \"" + beanActividad2.getIdTipoRespaldo()+ "\" ," +
							"\"descripcionTipoRespaldo\" : \"" + beanActividad2.getDescripcionTipoRespaldo().trim()+ "\" ," +
							"\"duracion\" : \"" + beanActividad2.getDuracion()+ "\" ," +
							"\"comentario\" : \"" + coment + "\" ," +
							"\"ventanaMax\" : \"" + beanActividad2.getVentanaMax()+ "\" ," +
							"\"tws\" : \"" + beanActividad2.getTws()+ "\" ," +
							"\"idScheact\" : \"" + beanActividad2.getIdScheact()+ "\" ," +
							"\"idSchedule\" : \"" + beanActividad2.getIdSchedule()+ "\" ," +
							"\"estadoschedact\" : \"" + beanActividad2.getEstadoschedact()+ "\" ," +
							"\"ip\" : \"" + beanActividad2.getIp().trim()+ "\" ," +
							"\"horaInicio\" : \"" + beanActividad2.getHoraInicio()+ "\" ," +
							"\"horaFin\" : \"" + beanActividad2.getHoraFin()+ "\" ," +
							"\"duracion\" : \"" + beanActividad2.getDuracion()+ "\" ," +
							"\"comentariosched\" : \"" + beanActividad2.getComentariosched().trim().replaceAll("\"","\\\"")+ "\" ," +
							"\"usermod\" : \"" + beanActividad2.getUsermod().trim()+ "\" ," +
							"\"estadotar\" : \"" + beanActividad2.getEstadotar()+ "\" "+
							"},"
							);
				}
				
			}else {
					objJson1.append("{" +
							"\"idScheduleActividad\" : \"" + "" + "\" " +
							"},"
							);
			}

			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaScheduleActividad\": [");
		
				objJson1.append("{" +
						"\"idScheduleActividad\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay informaciÓn disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
		
	}
	
	private void generarCabecera(HttpServletRequest request, HttpServletResponse response,SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = response.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		

		try {
			
			
			//captura de parametros
			BeanSchedule beanSchedule = new BeanSchedule();
			
			HttpSession objSessionSchedule = request.getSession(true);
			beanSchedule =  (BeanSchedule) objSessionSchedule.getAttribute("schedule");

			//Generar JSON
			objJson1.append("{\"CabeceraSchedule\": [");

					objJson1.append("{" +
							"\"cabecera\" : \"" + beanSchedule.getCabecera()+ "\" "+
							"},"
							);			
		
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"CabeceraSchedule\": [");
		
				objJson1.append("{" +
						"\"id\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
		
	}
	
	private void listarPersonas(HttpServletRequest request, HttpServletResponse response,SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = response.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		
		//Instancear metodos 
		BusinessUsuario servicio = new BusinessUsuario();
		
		try {
			List<BeanUsuario> listaUsuarios = servicio.listar(ssf);
			//Generar JSON
			objJson1.append("{\"ListaUsuarios\": [");
			
			if(listaUsuarios.size()>0){
				
				for (BeanUsuario beanUsuario : listaUsuarios) {
					objJson1.append("{" +
							"\"id\" : \"" + beanUsuario.getId()+ "\" ," +
							"\"empleado\" : \"" + beanUsuario.getNombres()+" "+beanUsuario.getApellidos()+ "\" " +
							"},"
							);
				}
				
			}else {
					objJson1.append("{" +
							"\"id\" : \"" + "" + "\" " +
							"},"
							);
			}

			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaUsuarios\": [");
		
				objJson1.append("{" +
						"\"id\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
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

	
	private void listarMonitoreoIndia(HttpServletRequest request, HttpServletResponse response,SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		
		response.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = response.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		
		
		try {
			
			String strFechaSchedule = request.getParameter("strFechaSchedule").toString();
			
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date tt = formatter.parse(strFechaSchedule);
			
			//captura de parametros
			BeanScheduleActividad bean = new BeanScheduleActividad();
			bean.setFecha(tt);
			
			BusinessScheduleActividad servicio = new BusinessScheduleActividad();
			
			List<BeanScheduleActividad> listaScheduleActividad = servicio.listarMonitoreoIndia(bean, ssf);
			
	
			
			//Generar JSON
			objJson1.append("{\"ListaScheduleActividad\": [");
			
			if(listaScheduleActividad.size()>0){
				for (BeanScheduleActividad beanActividad2 : listaScheduleActividad) {
					
					String desc = beanActividad2.getDescripcion().replaceAll("\"","'").replaceAll("[\n\r]"," <br>").trim();
					String coment = beanActividad2.getComentario().replaceAll("\"", "\'").replaceAll("[\n\r]"," <br>").trim();
					
					
					
					objJson1.append("{" +
							"\"idActividad\" : \"" + beanActividad2.getIdActividad()+ "\" ," +
							"\"idTurno\" : \"" + beanActividad2.getIdturno()+ "\" ," +
							"\"descripcionTurno\" : \"" + beanActividad2.getDescripcionTurno().trim().replace("\"", "\\\"")+ "\" ," +
							"\"idSede\" : \"" + beanActividad2.getIdSede()+ "\" ," +
							"\"descripcionSede\" : \"" + beanActividad2.getDescripcionSede().trim()+ "\" ," +
							"\"horaEjecucion\" : \"" + beanActividad2.getHoraEjecucion()+ "\" ," +
							"\"descripcion\" : \"" + desc+ "\" ," +
							"\"horaTermino\" : \"" + beanActividad2.getHoraTermino()+ "\" ," +
							"\"idPeriodo\" : \"" + beanActividad2.getIdPeriodo()+ "\" ," +
							"\"descripcionPeriodo\" : \"" + beanActividad2.getDescripcionPeriodo().trim()+ "\" ," +
							"\"idPlataforma\" : \"" + beanActividad2.getIdPlataforma()+ "\" ," +
							"\"descripcionPlataforma\" : \"" + beanActividad2.getDescripcionPlataforma().trim()+ "\" ," +
							"\"idProcedimiento\" : \"" + beanActividad2.getIdProcedimiento()+ "\" ," +
							"\"descripcionProcedimiento\" : \"" + beanActividad2.getDescripcionProcedimiento().trim()+ "\" ," +
							"\"idServidor\" : \"" + beanActividad2.getIdServidor()+ "\" ," +
							"\"descripcionServidor\" : \"" + beanActividad2.getDescripcionServidor().trim()+ "\" ," +
							"\"idCliente\" : \"" + beanActividad2.getIdCliente()+ "\" ," +
							"\"descripcionCliente\" : \"" + beanActividad2.getDescripcionCliente().trim()+ "\" ," +
							"\"jobStream\" : \"" + beanActividad2.getJobStream().trim()+ "\" ," +
							"\"idTipoActividad\" : \"" + beanActividad2.getIdTipoActividad()+ "\" ," +
							"\"descripcionTipoActividad\" : \"" + beanActividad2.getDescripcionTipoActividad().trim()+ "\" ," +
							"\"estado\" : \"" + beanActividad2.getEstado()+ "\" ," +
							"\"accion\" : \"" + beanActividad2.getAccion()+ "\" ," +
							"\"idTipoRespaldo\" : \"" + beanActividad2.getIdTipoRespaldo()+ "\" ," +
							"\"descripcionTipoRespaldo\" : \"" + beanActividad2.getDescripcionTipoRespaldo().trim()+ "\" ," +
							"\"duracion\" : \"" + beanActividad2.getDuracion()+ "\" ," +
							"\"comentario\" : \"" + coment + "\" ," +
							"\"ventanaMax\" : \"" + beanActividad2.getVentanaMax()+ "\" ," +
							"\"tws\" : \"" + beanActividad2.getTws()+ "\" ," +
							"\"idScheact\" : \"" + beanActividad2.getIdScheact()+ "\" ," +
							"\"idSchedule\" : \"" + beanActividad2.getIdSchedule()+ "\" ," +
							"\"estadoschedact\" : \"" + beanActividad2.getEstadoschedact()+ "\" ," +
							"\"ip\" : \"" + beanActividad2.getIp().trim()+ "\" ," +
							"\"horaInicio\" : \"" + beanActividad2.getHoraInicio()+ "\" ," +
							"\"horaFin\" : \"" + beanActividad2.getHoraFin()+ "\" ," +
							"\"duracion\" : \"" + beanActividad2.getDuracion()+ "\" ," +
							"\"comentariosched\" : \"" + beanActividad2.getComentariosched().trim().replace("\"", "\\\"")+ "\" ," +
							"\"usermod\" : \"" + beanActividad2.getUsermod().trim()+ "\" ," +
							"\"estadotar\" : \"" + beanActividad2.getEstadotar()+ "\" "+
							"},"
							);
				}
				
			}else {
					objJson1.append("{" +
							"\"idScheduleActividad\" : \"" + "" + "\" " +
							"},"
							);
			}

			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaScheduleActividad\": [");
		
				objJson1.append("{" +
						"\"idScheduleActividad\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
		
	}
	
	public void saveRCT(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;
			
			BeanSession objBeanSession = new BeanSession();
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			
			this.user = objBeanSession.getObjBeanPersonal().getiIdEmpleado();
			this.horainicio = req.getParameter("HORAINICIO");
			
			BeanSchedule beanSchedule = new BeanSchedule();
			
			HttpSession objSessionSchedule = req.getSession(false);
			beanSchedule =  (BeanSchedule) objSessionSchedule.getAttribute("schedule");
			this.fecha = beanSchedule.getCabecera().substring(1, 11);		
			
			this.fechainicio ="["+this.fecha +"] " + req.getParameter("HORAEJECUCION");
			this.fechafin = "["+this.fecha +"] " + req.getParameter("FECHAVIGENCIA");
			this.team = objBeanSession.getObjBeanPersonal().getiTeam();
			BeanRCT beanRCT = new BeanRCT();
			beanRCT.setiTeam("'"+this.team+"'");
			beanRCT.setIntValor1(Integer.parseInt(req.getParameter("IDCLIENTE")));
			beanRCT.setIntValor2(Integer.parseInt(req.getParameter("IDSERVIDOR")));
			beanRCT.setIntValor3(Integer.parseInt(req.getParameter("IDTURNO")));
			beanRCT.setStrValor4(this.fechainicio);
			beanRCT.setStrValor5(this.fechafin);
			beanRCT.setIDACTIVIDAD(Integer.parseInt(req.getParameter("IDACTIVIDAD")));
			beanRCT.setIDSCHEDULEORIGEN(Integer.parseInt(req.getParameter("IDSCHEDULEORIGEN")));
			beanRCT.setDESCRIPCION(req.getParameter("DESCRIPCION"));
			beanRCT.setStrValor10(this.horainicio.equals("") || this.horainicio == null ? "0" : this.horainicio);
			beanRCT.setStrValor11(this.fecha);
			
			beanRCT.setIDUSUARIOORIGEN(this.user);
			BusinessRCT objBusinessRCT = new BusinessRCT();
			icount = objBusinessRCT.saveRCT(beanRCT,ssf);

			if (icount > 0) {
				resultado = "ok";
			} else {
				resultado = "fail";
			}
		} catch (Exception e) {
			resultado = "fail";
		}
		out.print(resultado);
	}
	
	
	
}
