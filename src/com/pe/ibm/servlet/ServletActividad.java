package com.pe.ibm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanActividad;
import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessActividad;
import com.pe.ibm.util.AppUtils;

/**
 * Servlet implementation class ServletActividad
 */
@WebServlet("/ServletActividad")
public class ServletActividad extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int strAccion;
	private int idActividad;
	private int turno;
	private int plataforma;
	private int tipoRespaldo;
	private int sede;
	private int procedimiento;
	private int servidor;
	private int cliente;
	private int tipoActividad;
	private int periodo;
	private int estado;
	private int tws;
	private LocalTime hEjecucion;
	private Time timeHoraEjecucion;
	private String descripcion;
	private LocalTime hTermino;
	private Time timeHoraTermino;
	private String jobStream;
	private String comentario;
	private LocalTime hVentanaMax;
	private Time timeVentanaMax;
	private String accion;
	private String userMod;
	private int team;
	private Time timeDuracion;
	private String motivo;
	
	
//	
//	MyBatisUtil objMyBatis = MyBatisUtil.getInstance();
//	SqlSessionFactory ssf= objMyBatis.getSqlSessionFactory();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletActividad() {
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

				this.userMod = 	objBeanSession.getObjBeanPersonal().getStrNombre().trim() + " " + 
								objBeanSession.getObjBeanPersonal().getStrApPaterno().trim() + " " +
								objBeanSession.getObjBeanPersonal().getStrApMaterno().trim();
				
				this.team = objBeanSession.getObjBeanPersonal().getiTeam();
				

				switch (this.strAccion){
				
				case 1: //Insertar
					registrarActividad(request, response,ssf);
//					registrarTurno(request, response);	
					break;
				case 2: //listar
					listarActividad(request, response,team,ssf);
					break;
				case 3: //actualizar
					actualizarActividad(request, response,ssf);
					break;
				case 4: //actualizar_estado
					actualizarActividadEstado(request, response,ssf);
					break;
				case 5: //
					listarActividadHistorial(request, response,ssf);
					break;	
				case 6: //
					listarActividadPorID(request, response,ssf);
					break;
				
				}	
		
		
	}

	private void listarActividadHistorial(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		try {
			SimpleDateFormat formatoFecha = new SimpleDateFormat("dd-MM-yyyy");
			
			//Instancear metodos 
			BusinessActividad servicio = new BusinessActividad();

			BeanActividad bean = new BeanActividad();
			
			this.idActividad = Integer.parseInt(req.getParameter("strIdActividad").trim());
			
			bean.setIdActividad(idActividad);
			

			List<BeanActividad> listaActividad = servicio.listarHistorial(bean,ssf);
			//Generar JSON
			objJson1.append("{\"ListaActividad\": [");
			
			if(listaActividad.size() > 0) {
				for (BeanActividad beanActividad2 : listaActividad) {
					

					objJson1.append("{" +
							"\"idActividad\" : \"" + beanActividad2.getIdActividad()+ "\" ," +
							"\"idTurno\" : \"" + beanActividad2.getIdturno()+ "\" ," +
							"\"descripcionTurno\" : \"" + beanActividad2.getDescripcionTurno().trim()+ "\" ," +
							"\"idSede\" : \"" + beanActividad2.getIdSede()+ "\" ," +
							"\"descripcionSede\" : \"" + beanActividad2.getDescripcionSede().trim()+ "\" ," +
							"\"horaEjecucion\" : \"" + beanActividad2.getHoraEjecucion()+ "\" ," +
							"\"descripcion\" : \"" + beanActividad2.getDescripcion().trim()+ "\" ," +
							"\"horaTermino\" : \"" + beanActividad2.getHoraTermino()+ "\" ," +
							"\"idPeriodo\" : \"" + beanActividad2.getIdPeriodo()+ "\" ," +
							"\"descripcionPeriodo\" : \"" + beanActividad2.getDescripcionPeriodo().trim()+ "\" ," +
							"\"idPlataforma\" : \"" + beanActividad2.getIdPlataforma()+ "\" ," +
							"\"descripcionPlataforma\" : \"" + beanActividad2.getDescripcionPlataforma().trim()+ "\" ," +
							"\"idProcedimiento\" : \"" + beanActividad2.getIdProcedimiento()+ "\" ," +
							"\"descripcionProcedimiento\" : \"" + AppUtils.cleanString(beanActividad2.getDescripcionProcedimiento())+ "\" ," +
							"\"idServidor\" : \"" + beanActividad2.getIdServidor()+ "\" ," +
							"\"descripcionServidor\" : \"" + beanActividad2.getDescripcionServidor().trim()+ "\" ," +
							"\"idCliente\" : \"" + beanActividad2.getIdCliente()+ "\" ," +
							"\"descripcionCliente\" : \"" +  AppUtils.cleanString(beanActividad2.getDescripcionCliente())+ "\" ," +
							"\"jobStream\" : \"" + beanActividad2.getJobStream().trim()+ "\" ," +
							"\"idTipoActividad\" : \"" + beanActividad2.getIdTipoActividad()+ "\" ," +
							"\"descripcionTipoActividad\" : \"" +  AppUtils.cleanString(beanActividad2.getDescripcionTipoActividad())+ "\" ," +
							"\"estado\" : \"" + beanActividad2.getEstado()+ "\" ," +
							"\"accion\" : \"" + beanActividad2.getAccion().trim()+ "\" ," +
							"\"idTipoRespaldo\" : \"" + beanActividad2.getIdTipoRespaldo()+ "\" ," +
							"\"descripcionTipoRespaldo\" : \"" +  AppUtils.cleanString(beanActividad2.getDescripcionTipoRespaldo())+ "\" ," +
							"\"duracion\" : \"" + beanActividad2.getDuracion()+ "\" ," +
							"\"comentario\" : \"" + beanActividad2.getComentario().trim()+ "\" ," +
							"\"ventanaMax\" : \"" + beanActividad2.getVentanaMax()+ "\" ," +
							"\"tws\" : \"" + beanActividad2.getTws()+ "\" ," +
							"\"userMod\" : \"" + beanActividad2.getUserMod().trim()+ "\" ," +
							"\"fechaMod\" : \"" + formatoFecha.format(beanActividad2.getFechaMod())+ "\" ," +
							"\"tipoMod\" : \"" + beanActividad2.getTipoMod().trim()+ "\"  ," +
							"\"motivo\" : \"" + beanActividad2.getMotivo().trim()+ "\" " +
							"},"
							);
					}
				}else {
					objJson1.append("{" +
							"\"idActividad\" : \"" + ""+ "\" ," +
							"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
							"},"
							);	
				}
				
			
			
			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaActividad\": [");
		
				objJson1.append("{" +
						"\"idActividad\" : \"" + ""+ "\" ," +
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

	
	private void listarActividad(HttpServletRequest req, HttpServletResponse res, int team,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		try {
			//Instancear metodos 
			BusinessActividad servicio = new BusinessActividad();
			BeanEmpleado bean = new BeanEmpleado();
			bean.setiTeam(this.team);
			
			List<BeanActividad> listaActividad = servicio.listar(bean,ssf);
			//Generar JSON
			objJson1.append("{\"ListaActividad\": [");
			
			if(listaActividad.size() > 0) {
			for (BeanActividad beanActividad2 : listaActividad) {
				String buscar = "JOURNAL";
				String buscar2 = "VALIDATE THE START";
				
				int result ;
				int result2 ;
				String link = "";
				int idactivid ;
				
				idactivid = beanActividad2.getIdActividad();
				result = beanActividad2.getDescripcion().trim().indexOf(buscar);
				result2 = beanActividad2.getDescripcion().trim().indexOf(buscar2);
				
//				if (result != -1 && result2 == -1 && team == 65) {
//					link = "<a href=\'https://ibm.ent.box.com/folder/31854929259\' target=\'_new\' class=\'label label-info label-mini\'|>PROCEDURE JOURNAL BACKUP</a>";
//				}else if(result2 != -1 && result == -1 && team == 65) {
//					link = "<a href=\'https://ibm.ent.box.com/file/155117196668\' target=\'_new\' class=\'label label-info label-mini\'>PROCEDURE TWS BACKUP OFFLINE</a><br><br><a href=\'https://ibm.ent.box.com/file/151483271970\' target=\'_new2\' class=\'label label-info label-mini\'>TWS ERROR BACKUP OFFLINE</a><br><br><a href=\'https://ibm.ent.box.com/file/151483553901\' target=\'_new3\' class=\'label label-info label-mini\'>TWS/OMNIBUS JOB STREAM</a>";
//				}else if(result == -1 && result2 == -1 && idactivid != 2453 && team == 65) {
//					link = "<a href=\'https://ibm.ent.box.com/file/151483553901\' target=\'_new\' class=\'label label-info label-mini\'>TWS/OMNIBUS JOB STREAM</a><br><br><a href=\'https://ibm.ent.box.com/file/210864001166\' target=\'_new2\' class=\'label label-info label-mini\'>PROCEDURE TWS EBIZ REPORT</a>";
//				}else if(result == -1 && result2 == -1 && idactivid == 2453 && team == 65) {
//					link = "<a href=\'https://ibm.ent.box.com/file/151483553901\' target=\'_new\' class=\'label label-info label-mini\'>TWS/OMNIBUS JOB STREAM</a><br><br><a href=\'https://ibm.ent.box.com/file/242349071531\' target=\'_new2\' class=\'label label-info label-mini\'>PROCEDURE MANT PREV</a>";
//				}else{
					link = beanActividad2.getDescripcionProcedimiento();
//				}								
				
				String desc = beanActividad2.getDescripcion().replaceAll("\"","'").replaceAll("[\n\r]"," <br>").trim();
				String coment = beanActividad2.getComentario().replaceAll("\"", "\'").replaceAll("[\n\r]"," <br>").trim();

				
				objJson1.append("{" +
						"\"idActividad\" : \"" + beanActividad2.getIdActividad()+ "\" ," +
						"\"idTurno\" : \"" + beanActividad2.getIdturno()+ "\" ," +
						"\"descripcionTurno\" : \"" + beanActividad2.getDescripcionTurno().trim()+ "\" ," +
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
						"\"descripcionProcedimiento\" : \"" + AppUtils.cleanString(link)+ "\" ," +
						"\"idServidor\" : \"" + beanActividad2.getIdServidor()+ "\" ," +
						"\"descripcionServidor\" : \"" + beanActividad2.getDescripcionServidor().trim()+ "\" ," +
						"\"idCliente\" : \"" + beanActividad2.getIdCliente()+ "\" ," +
						"\"descripcionCliente\" : \"" + beanActividad2.getDescripcionCliente().trim()+ "\" ," +
						"\"jobStream\" : \"" + beanActividad2.getJobStream().trim()+ "\" ," +
						"\"idTipoActividad\" : \"" + beanActividad2.getIdTipoActividad()+ "\" ," +
						"\"descripcionTipoActividad\" : \"" + beanActividad2.getDescripcionTipoActividad().trim()+ "\" ," +
						"\"estado\" : \"" + beanActividad2.getEstado()+ "\" ," +
						"\"accion\" : \"" + beanActividad2.getAccion().trim()+ "\" ," +
						"\"idTipoRespaldo\" : \"" + beanActividad2.getIdTipoRespaldo()+ "\" ," +
						"\"descripcionTipoRespaldo\" : \"" + beanActividad2.getDescripcionTipoRespaldo().trim()+ "\" ," +
						"\"duracion\" : \"" + beanActividad2.getDuracion()+ "\" ," +
						"\"comentario\" : \"" + coment + "\" ," +
						"\"ventanaMax\" : \"" + beanActividad2.getVentanaMax()+ "\" ," +
						"\"descripcionTeam\" : \"" + beanActividad2.getDescripcionTeam()+ "\" ," +
						"\"tws\" : \"" + beanActividad2.getTws()+ "\" " +
						"},"
						);
				}
			}else {
				objJson1.append("{" +
						"\"idActividad\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);	
			}
			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaActividad\": [");
		
				objJson1.append("{" +
						"\"idActividad\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	private void listarActividadPorID(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		try {
			//Instancear metodos 
			BusinessActividad servicio = new BusinessActividad();

			this.idActividad = Integer.parseInt(req.getParameter("strIdActividad").trim());
			
			BeanActividad beanBusqueda = new BeanActividad();
			beanBusqueda.setIdActividad(idActividad);

			BeanActividad beanResultado = new BeanActividad();
			beanResultado = servicio.listarPorID(beanBusqueda, ssf);
			
			//Generar JSON
			objJson1.append("{\"ListaActividad\": [");
			
			if(beanResultado != null) {
				
				String desc = beanResultado.getDescripcion().replaceAll("\"","'").replaceAll("[\n\r]"," <br>").trim();
				String coment = beanResultado.getComentario().replaceAll("\"", "\'").replaceAll("[\n\r]"," <br>").trim();

//				System.out.println(desc);
				objJson1.append("{" +
						"\"idActividad\" : \"" + beanResultado.getIdActividad()+ "\" ," +
						"\"idTurno\" : \"" + beanResultado.getIdturno()+ "\" ," +
						"\"descripcionTurno\" : \"" + beanResultado.getDescripcionTurno().trim()+ "\" ," +
						"\"idSede\" : \"" + beanResultado.getIdSede()+ "\" ," +
						"\"descripcionSede\" : \"" + beanResultado.getDescripcionSede().trim()+ "\" ," +
						"\"horaEjecucion\" : \"" + beanResultado.getHoraEjecucion()+ "\" ," +
						"\"descripcion\" : \"" + desc + "\" ," +
						"\"horaTermino\" : \"" + beanResultado.getHoraTermino()+ "\" ," +
						"\"idPeriodo\" : \"" + beanResultado.getIdPeriodo()+ "\" ," +
						"\"descripcionPeriodo\" : \"" + beanResultado.getDescripcionPeriodo().trim()+ "\" ," +
						"\"idPlataforma\" : \"" + beanResultado.getIdPlataforma()+ "\" ," +
						"\"descripcionPlataforma\" : \"" + beanResultado.getDescripcionPlataforma().trim()+ "\" ," +
						"\"idProcedimiento\" : \"" + beanResultado.getIdProcedimiento()+ "\" ," +
						"\"descripcionProcedimiento\" : \"" + beanResultado.getDescripcionProcedimiento().trim()+ "\" ," +
						"\"idServidor\" : \"" + beanResultado.getIdServidor()+ "\" ," +
						"\"descripcionServidor\" : \"" + beanResultado.getDescripcionServidor().trim()+ "\" ," +
						"\"idCliente\" : \"" + beanResultado.getIdCliente()+ "\" ," +
						"\"descripcionCliente\" : \"" + beanResultado.getDescripcionCliente().trim()+ "\" ," +
						"\"jobStream\" : \"" + beanResultado.getJobStream().trim()+ "\" ," +
						"\"idTipoActividad\" : \"" + beanResultado.getIdTipoActividad()+ "\" ," +
						"\"descripcionTipoActividad\" : \"" + beanResultado.getDescripcionTipoActividad().trim()+ "\" ," +
						"\"estado\" : \"" + beanResultado.getEstado()+ "\" ," +
						"\"accion\" : \"" + beanResultado.getAccion().trim()+ "\" ," +
						"\"idTipoRespaldo\" : \"" + beanResultado.getIdTipoRespaldo()+ "\" ," +
						"\"descripcionTipoRespaldo\" : \"" + beanResultado.getDescripcionTipoRespaldo().trim()+ "\" ," +
						"\"duracion\" : \"" + beanResultado.getDuracion()+ "\" ," +
						"\"comentario\" : \"" + coment + "\" ," +
						"\"ventanaMax\" : \"" + beanResultado.getVentanaMax()+ "\" ," +
						"\"tws\" : \"" + beanResultado.getTws()+ "\" " +
						"},"
						);
			}else {
			
				objJson1.append("{" +
						"\"idActividad\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);	
			}
					

			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
		
			objJson1.append("{\"ListaActividad\": [");
		
				objJson1.append("{" +
						"\"idActividad\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	private void actualizarActividad(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		String respuesta;
		int resultado;
		try {
			
			obtenerParametros(req, res, ssf);
			
			this.idActividad = Integer.parseInt(req.getParameter("strId"));
			this.motivo = req.getParameter("strMotivo");

			//Instancear metodos 
			BeanActividad beanActividad = new BeanActividad();
			beanActividad.setIdActividad(this.idActividad );
			beanActividad.setIdturno(this.turno);
			beanActividad.setIdPlataforma(this.plataforma);
			beanActividad.setIdTipoRespaldo(this.tipoRespaldo);
			beanActividad.setIdSede(this.sede);
			beanActividad.setIdProcedimiento(this.procedimiento);
			beanActividad.setIdServidor(this.servidor);
			beanActividad.setIdCliente(this.cliente);
			beanActividad.setIdTipoActividad(this.tipoActividad);
			beanActividad.setIdPeriodo(this.periodo);
			beanActividad.setEstado(this.estado);
			beanActividad.setTws(this.tws);
			beanActividad.setHoraEjecucion(this.timeHoraEjecucion);
			beanActividad.setDescripcion(this.descripcion);
			beanActividad.setHoraTermino(this.timeHoraTermino);
			beanActividad.setJobStream(this.jobStream);
			beanActividad.setComentario(this.comentario);
			beanActividad.setVentanaMax(this.timeVentanaMax);
			beanActividad.setAccion(this.accion);
			beanActividad.setUserMod(this.userMod);
			beanActividad.setDuracion(this.timeDuracion);
			beanActividad.setTeam(this.team);
			beanActividad.setMotivo(this.motivo);
			beanActividad.setOperacion("ACTUALIZAR");
			
			BusinessActividad servicio = new BusinessActividad();

			resultado = servicio.insertar_actualizar(beanActividad,ssf);
			
			if(resultado == 1) {
				respuesta = "El registro se realizo satisfactoriamente";	
			}else {
				respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			}
					
			//Generar JSON
			objJson1.append("{\"ActualizarActividad\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + resultado + "\" ," +
						"\"resultado\" : \"" + respuesta + "\" " +
						"},"
						);
				
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");	
			
		}catch(Exception e) {
			e.printStackTrace();
			resultado = 0;
			respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"ActualizarActividad\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + resultado + "\" ," +
						"\"resultado\" : \"" + respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	private void registrarActividad(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		String respuesta;
		int resultado = 0;
		try {
			
			obtenerParametros(req, res, ssf);	

			//Instancear metodos 
			BeanActividad beanActividad = new BeanActividad();
			beanActividad.setIdturno(this.turno);
			beanActividad.setIdPlataforma(this.plataforma);
			beanActividad.setIdTipoRespaldo(this.tipoRespaldo);
			beanActividad.setIdSede(this.sede);
			beanActividad.setIdProcedimiento(this.procedimiento);
			beanActividad.setIdServidor(this.servidor);
			beanActividad.setIdCliente(this.cliente);
			beanActividad.setIdTipoActividad(this.tipoActividad);
			beanActividad.setIdPeriodo(this.periodo);
			beanActividad.setEstado(this.estado);
			beanActividad.setTws(this.tws);
			beanActividad.setHoraEjecucion(this.timeHoraEjecucion);
			beanActividad.setDescripcion(this.descripcion);
			beanActividad.setHoraTermino(this.timeHoraTermino);
			beanActividad.setJobStream(this.jobStream);
			beanActividad.setComentario(this.comentario);
			beanActividad.setVentanaMax(this.timeVentanaMax);
			beanActividad.setAccion(this.accion);
			beanActividad.setUserMod(this.userMod);
			beanActividad.setDuracion(this.timeDuracion);
			beanActividad.setTeam(this.team);
			beanActividad.setOperacion("INSERTAR");
			
			
			BusinessActividad servicio = new BusinessActividad();

			resultado = servicio.insertar_actualizar(beanActividad,ssf);
			
			if(resultado == 1) {
				respuesta = "El registro se realizo satisfactoriamente";	
			}else {
				respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			}
					
			//Generar JSON
			objJson1.append("{\"RegistrarActividad\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + resultado + "\" ," +
						"\"resultado\" : \"" + respuesta + "\" " +
						"},"
						);
				
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");	
			
		}catch(Exception e) {
			e.printStackTrace();
			resultado = 0;
			respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"RegistrarActividad\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + resultado + "\" ," +
						"\"resultado\" : \"" + respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	private void actualizarActividadEstado(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		String respuesta;
		int resultado;
		
		try {
			
			obtenerParametros(req, res, ssf);
			
			this.idActividad = Integer.parseInt(req.getParameter("strId"));

			this.motivo = req.getParameter("strMotivo");
			
			//Instancear metodos 
			BeanActividad beanActividad = new BeanActividad();
			beanActividad.setIdActividad(this.idActividad );
			beanActividad.setIdturno(this.turno);
			beanActividad.setIdPlataforma(this.plataforma);
			beanActividad.setIdTipoRespaldo(this.tipoRespaldo);
			beanActividad.setIdSede(this.sede);
			beanActividad.setIdProcedimiento(this.procedimiento);
			beanActividad.setIdServidor(this.servidor);
			beanActividad.setIdCliente(this.cliente);
			beanActividad.setIdTipoActividad(this.tipoActividad);
			beanActividad.setIdPeriodo(this.periodo);
			beanActividad.setEstado(this.estado);
			beanActividad.setTws(this.tws);
			beanActividad.setHoraEjecucion(this.timeHoraEjecucion);
			beanActividad.setDescripcion(this.descripcion);
			beanActividad.setHoraTermino(this.timeHoraTermino);
			beanActividad.setJobStream(this.jobStream);
			beanActividad.setComentario(this.comentario);
			beanActividad.setVentanaMax(this.timeVentanaMax);
			beanActividad.setAccion(this.accion);
			beanActividad.setUserMod(this.userMod);
			beanActividad.setDuracion(this.timeDuracion);
			beanActividad.setTeam(this.team);
			beanActividad.setMotivo(this.motivo);
			beanActividad.setOperacion("ACTUALIZAR_ESTADO");
			
			
			BusinessActividad servicio = new BusinessActividad();
			resultado = servicio.insertar_actualizar(beanActividad,ssf);
			
			if(resultado == 1) {
				respuesta = "El registro se realizo satisfactoriamente";	
			}else {
				respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			}
					
			//Generar JSON
			objJson1.append("{\"ActualizarActividadEstado\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + resultado + "\" ," +
						"\"resultado\" : \"" + respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			resultado = 0;
			respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"ActualizarActividadEstado\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + resultado + "\" ," +
						"\"resultado\" : \"" + respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}

		out.print(strJson2);
	}
	
	private void obtenerParametros(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		//Obtener parametros 
		try {
			
			this.turno = Integer.parseInt(req.getParameter("strTurno"));
			this.plataforma = Integer.parseInt(req.getParameter("strPlataforma"));
			this.tipoRespaldo = Integer.parseInt(req.getParameter("strTipoRespaldo"));
			this.sede = Integer.parseInt(req.getParameter("strSede"));
			this.procedimiento = Integer.parseInt(req.getParameter("strProcedimiento"));
			this.servidor = Integer.parseInt(req.getParameter("strServidor"));
			this.cliente = Integer.parseInt(req.getParameter("strCliente"));
			this.tipoActividad = Integer.parseInt(req.getParameter("strTipoActividad"));
			this.periodo = Integer.parseInt(req.getParameter("strPeriodo"));
			this.estado = Integer.parseInt(req.getParameter("strEstado"));
			this.tws = Integer.parseInt(req.getParameter("strTWS"));
			this.hEjecucion = LocalTime.parse(req.getParameter("strHoraEjecucion")); //formato hh:mm:ss  (24 hrs)
			this.timeHoraEjecucion = Time.valueOf(hEjecucion);
			this.descripcion = req.getParameter("strDescripcion").replaceAll("\\\\", "").replaceAll("'", "\"").trim();
			System.out.print(this.descripcion);
			this.hTermino = LocalTime.parse(req.getParameter("strHoraTermino")); //formato hh:mm:ss  (24 hrs)
			this.timeHoraTermino = Time.valueOf(hTermino);
			this.jobStream = req.getParameter("strJobStream").trim();
			this.comentario = req.getParameter("strComentario").trim();
			this.hVentanaMax= LocalTime.parse(req.getParameter("strVentanaMax")); //formato hh:mm:ss  (24 hrs)
			this.timeVentanaMax = Time.valueOf(hVentanaMax);
			this.accion = req.getParameter("accion").trim();
			new AppUtils();
//			System.out.println(AppUtils.diferenciaHoras(req.getParameter("strHoraEjecucion")+":00", req.getParameter("strHoraTermino")+":00"));
			this.timeDuracion = Time.valueOf(AppUtils.diferenciaHoras(req.getParameter("strHoraEjecucion"), req.getParameter("strHoraTermino")));
//			this.timeDuracion = Time.valueOf("00:00:00");
			System.out.println(this.timeDuracion);
		}catch(Exception e) {
		e.printStackTrace();	
		}
		
		
	}
	
	
}
