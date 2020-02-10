package com.pe.ibm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.json.JSONArray;
import org.json.JSONException;

import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.bean.BeanTarea;
import com.pe.ibm.bean.BeanTareaAsignada;
import com.pe.ibm.bean.BeanTareaBacklog;
import com.pe.ibm.business.BusinessTarea;

/**
 * Servlet implementation class ServletTurno
 */
@WebServlet("/ServletTarea")
public class ServletTarea extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int accion;
	private int idTareaGenerada;
	private int idTarea;
	private int idTipoTarea;
	private String tarea;
	private String[] idOwner;
	private String[] idAprobador;
	private String frecuencia;
	private String programacion;
	private int idperiodo;
	private int avisoInicial;
	private int avisoFinal;
	private String userMod;
	private int resultado;
	private String respuesta; 
	private int estado;
	private int idEmpleado;
	private String archivo;
	private String archivoNombre;
	private String perfil;
	private int iTeam;

	private String selPeriodo;
	private String fecha;
	private String observaciones;

		
		
//	MyBatisUtil objMyBatis = MyBatisUtil.getInstance();
//	SqlSessionFactory ssf= objMyBatis.getSqlSessionFactory();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletTarea() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		// TODO Auto-generated method stub

		SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
		
		//Captura de parametros
		this.accion = Integer.parseInt(request.getParameter("strAccion"));
		
		BeanSession objBeanSession = new BeanSession();
		
		HttpSession objSessionLogin = request.getSession(true);
		objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
		this.userMod = 	objBeanSession.getObjBeanPersonal().getStrNombre() + " " + 
				objBeanSession.getObjBeanPersonal().getStrApPaterno() + " " +
				objBeanSession.getObjBeanPersonal().getStrApMaterno();
	
		this.idEmpleado = objBeanSession.getObjBeanPersonal().getiIdEmpleado();
	
		this.perfil = objBeanSession.getObjBeanPersonal().getStrPerfil();

		switch (this.accion){
		
		case 0: //Listar todas las tareas - MANTENIMIENTO
			propiedadesSession(request, response,ssf);
			break;
		case 1: //Listar todas las tareas - MANTENIMIENTO
			listarTarea(request, response,ssf);
			break;
		case 2: //Registrar tareas - MANTENIMIENTO
			registrarTarea(request, response,ssf);
			break;
		case 3: //Actualizar tareas - MANTENIMIENTO
			actualizarTarea(request, response,ssf);
			break;
		case 4: //Actualizar estado - MANTENIMIENTO
			actualizarTareaEstado(request, response,ssf);
			break;
		case 5: //listar Tareas asignadas - APROBADOR
			listarTareasAsignadas(request, response,ssf);
			break;	
		case 6: //registrar fecha y owner de ejecución de Tareas asignadas - APROBADOR
			ejecutarTarea(request, response,ssf);
			break;	
		case 7: //registrar fecha y owner de aprobación de Tareas asignadas - APROBADOR
			aprobarTarea(request, response,ssf);
			break;
		case 8: //guardar nombre de archivo y contenido del file - APROBADOR
			adjuntarFile(request, response,ssf);
			break;
		case 9: //Listar tareas por estado
			listarTareasGeneradas(request, response,ssf);
			break;
		case 10: //registrar fecha y owner de aprobación de Tareas asignadas - APROBADOR
			ejecutarReprogramar(request, response,ssf);
			break;
		case 11: //registrar fecha y owner de aprobación de Tareas asignadas - APROBADOR
			ejecutarCancelar(request, response,ssf);
			break;

		case 12: //Filtro de tareas cerradas por fecha
//			listarTareasCerradas(request, response, ssf);
			break;
			
		case 13: //Listar tareas en backlog
			listarTareaBacklog(request, response, ssf);
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
	
	private void obtenerParametros(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		//Obtener parametros 
		
			/*JSONArray aOwner = new JSONArray(req.getParameter("strOwner"));
			List<String> listOwner = new ArrayList<String>();
			for (int i=0; i<aOwner.length(); i++) {
				listOwner.add( aOwner.getString(i) );
			}*/
			
			//System.out.println(listOwner);
		
			this.idTipoTarea = Integer.parseInt(req.getParameter("strTipo"));
			this.tarea = req.getParameter("strTarea");
			this.idOwner = req.getParameterValues("strOwner[]");
			this.idAprobador = req.getParameterValues("strAprobador[]");
			this.frecuencia = req.getParameter("strFrecuencia");
			this.programacion = req.getParameter("strProgramacion");
			this.idperiodo = Integer.parseInt(req.getParameter("strPeriodo"));
			this.avisoInicial = Integer.parseInt(req.getParameter("strAvisoInicial"));
			this.avisoFinal = Integer.parseInt(req.getParameter("strAvisoFinal"));
			this.iTeam = Integer.parseInt(req.getParameter("iTeam"));
//			this.selPeriodo = req.getParameter("strSelPeriodo");
			this.fecha = req.getParameter("strFecha");
			
	        //JSONArray array = new JSONArray(req.getParameterValues("strAprobador[]"));      
			//System.out.println(getStringArray(array)[1]);
					
	}
	/*
	 private String[] getStringArray(JSONArray jsonArray) throws JSONException {
         if (jsonArray != null) {
             String[] stringsArray = new String[jsonArray.length()];
             for (int i = 0; i < jsonArray.length(); i++) {
                 stringsArray[i] = jsonArray.getString(i);
             }
             return stringsArray;
         } else
             return null;
     }*/
	
	private void propiedadesSession(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
			
			//Generar JSON
			objJson1.append("{\"Sesion\": [");
			
				objJson1.append("{" +
						"\"perfil\" : \"" + this.perfil + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		
		out.print(strJson2);

	}
	
	private void registrarTarea(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		try {
			
			obtenerParametros(req, res, ssf);
			
			BeanTarea beanTarea = new BeanTarea();
			beanTarea.setIdTipoTarea(this.idTipoTarea);
			beanTarea.setTarea(this.tarea);
			beanTarea.setIdOwner(1);
			beanTarea.setIdAprobador(1);
			beanTarea.setFrecuencia(this.frecuencia);
			beanTarea.setProgramacion(this.programacion);
			beanTarea.setIdPeriodo(this.idperiodo);
			beanTarea.setAvisoIn(this.avisoInicial);
			beanTarea.setAvisoFin(this.avisoFinal);
			beanTarea.setEstado(this.estado);
			beanTarea.setUserMod(this.userMod);
//			beanTarea.setSelPeriodo(this.selPeriodo);
			beanTarea.setFecha(this.fecha);
			beanTarea.setOperacion("INSERTAR");
			beanTarea.setiTeam(this.iTeam);
			beanTarea.setEstado(1);

			BusinessTarea servicio = new BusinessTarea();
			resultado = servicio.insertar_actualizar(beanTarea,ssf);
			
			if(resultado == 0) {
				respuesta = "Hubo un error durante el proceso de registro o actualización";	
			}else {
				/* Tipo: Owner=2, Aprobador=1*/
				beanTarea.setIdTarea(resultado);
				beanTarea.setTipo(2);
				for (int i = 0; i < this.idOwner.length; i++) {
					beanTarea.setIdEmpleado(Integer.parseInt(this.idOwner[i]));
					servicio.insertar_actualizar_gestor(beanTarea, ssf);
	            }
				
				beanTarea.setTipo(1);
				for (int i = 0; i < this.idAprobador.length; i++) {
					beanTarea.setIdEmpleado(Integer.parseInt(this.idAprobador[i]));
					servicio.insertar_actualizar_gestor(beanTarea, ssf);
	            }
				respuesta = "El registro se realizo satisfactoriamente";	
			}
			
			
			//Generar JSON
			objJson1.append("{\"RegistroTarea\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			this.resultado = 0;
			this.respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"RegistroTarea\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		
		out.print(strJson2);

	}
	
	private void actualizarTarea(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		try {
			
			obtenerParametros(req, res, ssf);
			
			this.idTarea = Integer.parseInt(req.getParameter("strIdtarea"));
			//Instancear metodos 
			BeanTarea beanTarea = new BeanTarea();
			beanTarea.setIdTarea(this.idTarea);
			beanTarea.setIdTipoTarea(this.idTipoTarea);
			beanTarea.setTarea(this.tarea);
			beanTarea.setIdOwner(1);
			beanTarea.setIdAprobador(1);
			beanTarea.setFrecuencia(this.frecuencia);
			beanTarea.setProgramacion(this.programacion);
			beanTarea.setIdPeriodo(this.idperiodo);
			beanTarea.setAvisoIn(this.avisoInicial);
			beanTarea.setAvisoFin(this.avisoFinal);
			beanTarea.setEstado(this.estado);
			beanTarea.setUserMod(this.userMod);
			beanTarea.setOperacion("ACTUALIZAR");
			beanTarea.setSelPeriodo(this.selPeriodo);
			beanTarea.setFecha(this.fecha);
			
			BusinessTarea servicio = new BusinessTarea();
			this.resultado = servicio.insertar_actualizar(beanTarea,ssf);
			
			if(this.resultado == 0) {
				this.respuesta = "Hubo un error durante el proceso de registro o actualización";	
			}else {
				/* Tipo: Owner=2, Aprobador=1*/
				beanTarea.setIdTarea(resultado);
				beanTarea.setTipo(2);
				for (int i = 0; i < this.idOwner.length; i++) {
					beanTarea.setIdEmpleado(Integer.parseInt(this.idOwner[i]));
					servicio.insertar_actualizar_gestor(beanTarea, ssf);
	            }
				
				beanTarea.setTipo(1);
				for (int i = 0; i < this.idAprobador.length; i++) {
					beanTarea.setIdEmpleado(Integer.parseInt(this.idAprobador[i]));
					servicio.insertar_actualizar_gestor(beanTarea, ssf);
	            }
				this.respuesta = "El registro se realizó satisfactoriamente";	
			}
					
			//Generar JSON
			objJson1.append("{\"ActualizarTarea\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
				
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			this.resultado = 0;
			this.respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"ActualizarTarea\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}

		out.print(strJson2);
	}
	
	private void actualizarTareaEstado(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		try {
			
			
			this.idTarea = Integer.parseInt(req.getParameter("strIdtarea"));
			this.estado = Integer.parseInt(req.getParameter("strEstado"));
			
			//Instancear metodos 
			BeanTarea beanTarea = new BeanTarea();
			beanTarea.setIdTarea(this.idTarea);
			beanTarea.setEstado(this.estado);
			beanTarea.setUserMod(this.userMod);
			beanTarea.setOperacion("ACTUALIZAR_ESTADO");
			
			BusinessTarea servicio = new BusinessTarea();
			this.resultado = servicio.insertar_actualizar(beanTarea,ssf);
			
			if(this.resultado == 1) {
				this.respuesta = "El registro se realizo satisfactoriamente";	
			}else {
				this.respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			}
					
			//Generar JSON
			objJson1.append("{\"ActualizarTareaEstado\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			this.resultado = 0;
			this.respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"ActualizarTareaEstado\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}

		out.print(strJson2);
	}
	
	private void listarTarea(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder objJson2 = new StringBuilder();
		
		try {
			//Instancear metodos 
			BusinessTarea servicio = new BusinessTarea();
			BeanTarea objBeanTarea = new BeanTarea();
			objBeanTarea.setiTeam(Integer.parseInt(req.getParameter("iTeam")));
			
			
			List<BeanTarea> listaTarea = servicio.listar(ssf, objBeanTarea);
			List<BeanTarea> listaGestor;
			
			if(listaTarea.size() > 0 ) {
				//Generar JSON
				objJson1.append("{\"ListaTareas\": [");
				
				for (BeanTarea beanTarea : listaTarea) {
					objJson1.append("{" +
							"\"idTarea\" : \"" + beanTarea.getIdTarea() + "\" ," +
							"\"idTipoTarea\" : \"" + beanTarea.getIdTipoTarea() + "\" ," +
							"\"tipoTarea\" : \"" + beanTarea.getTipoTarea() + "\" ," +
							"\"tarea\" : \"" + beanTarea.getTarea() + "\" ," +
							"\"frecuencia\" : \"" + beanTarea.getFrecuencia() + "\" ," +
							"\"programacion\" : \"" + beanTarea.getProgramacion() + "\" ," +
							"\"idPeriodo\" : \"" + beanTarea.getIdPeriodo() + "\" ," +
							"\"periodo\" : \"" + beanTarea.getPeriodo() + "\" ," +
							"\"selPeriodo\" : \"" +"-"+ "\" ," +
							"\"avisoIn\" : \"" + beanTarea.getAvisoIn()+" Días antes" + "\" ," +
							"\"avisoFin\" : \"" + beanTarea.getAvisoFin()+" Días después"+ "\" ," +
							"\"estado\" : \"" + beanTarea.getEstado() + "\" ,"
							);
					
					BeanTarea objBeanTareaG = new BeanTarea();
					objBeanTareaG.setIdTarea(beanTarea.getIdTarea());
					listaGestor=servicio.listarGestor(ssf, objBeanTareaG);
					List<String> listAprobador = new ArrayList<String>();
					List<String> listOwner = new ArrayList<String>();
					List<String> listAprobadorN = new ArrayList<String>();
					List<String> listOwnerN = new ArrayList<String>();
					
//					System.out.println("Tamaño lista : "+listaGestor.size());
					if (listaGestor.size() > 0) {
						for (BeanTarea beanTareaG : listaGestor) {
							if (beanTareaG.getTipo()==1) {
								//Aprobador
								listAprobador.add(String.valueOf(beanTareaG.getIdEmpleado()));
								listAprobadorN.add(String.valueOf(beanTareaG.getAprobador()));
							}
							else if(beanTareaG.getTipo()==2)
							{
								//Owner
								listOwner.add(String.valueOf(beanTareaG.getIdEmpleado()));
								listOwnerN.add(String.valueOf(beanTareaG.getAprobador()));
							}
						}
						this.idAprobador = listAprobador.toArray(new String[0]);
						this.idOwner = listOwner.toArray(new String[0]);
						
						JSONArray arrayO = new JSONArray(this.idOwner);
						JSONArray arrayA = new JSONArray(this.idAprobador);
//						System.out.println(String.valueOf(arrayO));
						
						objJson1.append(
								"\"aprobador\" : \"" + ConvertArrayToString(listAprobadorN.toArray(new String[0]), ",") + "\" ," +
								"\"owner\" : \"" + ConvertArrayToString(listOwnerN.toArray(new String[0]), ",") + "\" ," +
								"\"idAprobador\" : \"" + String.valueOf(arrayA).replace("\"", "") + "\" ," +
								"\"idOwner\" : \"" + String.valueOf(arrayO).replace("\"", "") + "\" " +
								"},"
								);
					}else {
						objJson1.append(
								"\"aprobador\" : \"" + "Pendiente registro" + "\" ," +
								"\"owner\" : \"" + "Pendiente registro" + "\" ," +
								"\"idAprobador\" : \"" + -1 + "\" ," +
								"\"idOwner\" : \"" + -1 + "\" " +
								"},"
								);
					}
					
				}
			}
			else {
				objJson1.append("{\"ListaTareas\": [");
				
				objJson1.append("{" +
						"\"idTarea\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);
			}
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaTareas\": [");
		
				objJson1.append("{" +
						"\"idTarea\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		}
		
		out.print(strJson2);
	}
	
	public String ConvertArrayToString(String [] array, String delimiter) {
//		StringBuilder sb = new StringBuilder();

//		for (String str : array)
//			sb.append(str).append(delimiter + " ");
//		
//		System.out.println("array: "+ sb);
//		System.out.println("length array: "+ sb.length());
		
//		return sb.substring(0, sb.length()-2);
		
		String nuevoArray = Arrays.toString(array).replace("[", "").replaceAll("]", "");
		
//		System.out.println(nuevoArray);
		return nuevoArray;
	
	}
	
	private void listarTareasAsignadas(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		try {
			//Instancear metodos 
			BusinessTarea servicio = new BusinessTarea();
			BeanTareaAsignada bean = new BeanTareaAsignada();
			
			int estado = Integer.parseInt(req.getParameter("strEstado"));
			int idOperacion = Integer.parseInt(req.getParameter("strIdOperacion"));
			int idTeam = Integer.parseInt(req.getParameter("iTeam"));
			
			bean.setIdEmpleado(this.idEmpleado);
			bean.setEstado(estado);
			bean.setIdOperacion(idOperacion);
			bean.setIdTeam(idTeam);
			
//			System.out.println("Prueba "+bean.getIdEmpleado()+" "+bean.getEstado()+" "+bean.getIdOperacion());
			
			List<BeanTareaAsignada> listaTarea = servicio.listarTareasAsignadas(bean, ssf);
			//Generar JSON
			objJson1.append("{\"ListaTareasAsignadas\": [");
			
			if(!listaTarea.isEmpty()) {
				for (BeanTareaAsignada beanTarea : listaTarea) {
					
//					String strfechaLimite = (beanTarea.getFechaGenerada() != null ? new SimpleDateFormat("yyyy-MM-dd").format(sumarRestarDiasFecha(beanTarea.getFechaGenerada(), beanTarea.getAvisoIn())) : "");
//					System.out.println("TO STRING: "+beanTarea.toString());
					
					String strfechaLimite = "";
					if(beanTarea.getFechaReprogramada() != null) {
						strfechaLimite = (beanTarea.getFechaPeriodo()!= null ? new SimpleDateFormat("yyyy-MM-dd").format(beanTarea.getFechaPeriodo()) : (beanTarea.getFechaGenerada() != null ? new SimpleDateFormat("yyyy-MM-dd").format(sumarRestarDiasFecha(beanTarea.getFechaGenerada(), 0)) : ""));
						
					}else {
						strfechaLimite = (beanTarea.getFechaPeriodo()!= null ? new SimpleDateFormat("yyyy-MM-dd").format(beanTarea.getFechaPeriodo()) : (beanTarea.getFechaGenerada() != null ? new SimpleDateFormat("yyyy-MM-dd").format(sumarRestarDiasFecha(beanTarea.getFechaGenerada(), beanTarea.getAvisoIn())) : ""));
							
					}
					
					objJson1.append("{" +
							"\"idTareaGenerada\" : \"" + beanTarea.getIdTareaGenerada() + "\" ," +
							"\"tipoTarea\" : \"" + beanTarea.getTipoTarea() + "\" ," +
							"\"tarea\" : \"" + beanTarea.getTarea() + "\" ," +
//							"\"owner\" : \"" + beanTarea.getOwner() + "\" ," +
//							"\"aprobador\" : \"" + beanTarea.getAprobador() + "\" ," +
							"\"frecuencia\" : \"" + beanTarea.getFrecuencia() + "\" ," +
							"\"programacion\" : \"" + beanTarea.getProgramacion() + "\" ," +
							"\"periodo\" : \"" + beanTarea.getPeriodo() + "\" ," +
							"\"avisoIn\" : \"" + beanTarea.getAvisoIn()+" DÃ­as antes" + "\" ," +
							"\"avisoFin\" : \"" + beanTarea.getAvisoFin()+" DÃ­as despuÃ©s"+ "\" ," +

							"\"fechaLimite\" : \"" + strfechaLimite + "\" ," +
							"\"estadoLimite\" : \"" + compararFecha(strfechaLimite) + "\" ," +
							"\"fechaRealizada\" : \"" + (beanTarea.getFechaRealizada() != null ?  new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(beanTarea.getFechaRealizada()) : "")+ "\" ," +
							"\"fechaAprobada\" : \"" + (beanTarea.getFechaAprobada() != null ?  new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(beanTarea.getFechaAprobada()) : "")  + "\" ," +
							"\"fechaReprogramada\" : \"" + (beanTarea.getFechaReprogramada() != null ?  new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(beanTarea.getFechaReprogramada()) : "")  + "\" ," +
							"\"fechaCancelada\" : \"" + (beanTarea.getFechaCancelada() != null ?  new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(beanTarea.getFechaCancelada()) : "")  + "\" ," +
							"\"observaciones\" : \"" + (beanTarea.getObservaciones() != null ? beanTarea.getObservaciones() : "") + "\", " +

							"\"archivo\" : \"" + beanTarea.getArchivo()+ "\" ," +
							"\"archivoNombre\" : \"" + beanTarea.getArchivoNombre()+ "\", " +
							"\"observaciones\" : \"" + (beanTarea.getObservaciones() != null ? beanTarea.getObservaciones().replace("\"", "\\\"") : "") + "\", " +
							"\"strEstado\" : \"" + beanTarea.getStrEstado() + "\", " 
//							"},"
							);
					
					List<BeanTarea>  listaGestor;
					BeanTarea objBeanTareaG = new BeanTarea();
//					System.out.println("ID tarea : "+ beanTarea.getIdTarea());
					
					objBeanTareaG.setIdTarea(beanTarea.getIdTarea());
					
					listaGestor= servicio.listarGestor(ssf, objBeanTareaG);
					List<String> listAprobador = new ArrayList<String>();
					List<String> listOwner = new ArrayList<String>();
					List<String> listAprobadorN = new ArrayList<String>();
					List<String> listOwnerN = new ArrayList<String>();
					
//					System.out.println("Tamaño lista : "+listaGestor.size());
					if (listaGestor.size() > 0) {
						for (BeanTarea beanTareaG : listaGestor) {
							if (beanTareaG.getTipo()==1) {
								//Aprobador
								listAprobador.add(String.valueOf(beanTareaG.getIdEmpleado()));
								listAprobadorN.add(String.valueOf(beanTareaG.getAprobador()));
							}
							else if(beanTareaG.getTipo()==2)
							{
								//Owner
								listOwner.add(String.valueOf(beanTareaG.getIdEmpleado()));
								listOwnerN.add(String.valueOf(beanTareaG.getAprobador()));
							}
						}
						this.idAprobador = listAprobador.toArray(new String[0]);
						this.idOwner = listOwner.toArray(new String[0]);
						
						JSONArray arrayO = new JSONArray(this.idOwner);
						JSONArray arrayA = new JSONArray(this.idAprobador);
//						System.out.println(String.valueOf(arrayO));
						
						objJson1.append(
								"\"aprobador\" : \"" + ConvertArrayToString(listAprobadorN.toArray(new String[0]), ",") + "\" ," +
								"\"owner\" : \"" + ConvertArrayToString(listOwnerN.toArray(new String[0]), ",") + "\" ," +
								"\"idAprobador\" : \"" + String.valueOf(arrayA).replace("\"", "") + "\" ," +
								"\"idOwner\" : \"" + String.valueOf(arrayO).replace("\"", "") + "\" " +
								"},"
								);
					}else {
						objJson1.append(
								"\"aprobador\" : \"" + "Pendiente registro" + "\" ," +
								"\"owner\" : \"" + "Pendiente registro" + "\" ," +
								"\"idAprobador\" : \"" + -1 + "\" ," +
								"\"idOwner\" : \"" + -1 + "\" " +
								"},"
								);
					}
					
							
				}	
			}else {
				objJson1.append("{" +
						"\"idTarea\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);	
			}
			
	
	
	strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
	

		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaTareasAsignadas\": [");
		
				objJson1.append("{" +
						"\"idTarea\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		}
		
		out.print(strJson2);
		
	}
	
	 public Date sumarRestarDiasFecha(Date fecha, int dias){
	      Calendar calendar = Calendar.getInstance();
	      calendar.setTime(fecha); // Configuramos la fecha que se recibe
	      calendar.add(Calendar.DAY_OF_YEAR, dias);  // numero de dÃ­as a aÃ±adir, o restar en caso de dÃ­as<0
	      return calendar.getTime(); // Devuelve el objeto Date con los nuevos dÃ­as aÃ±adidos
	 }
	 
	 public String compararFecha(String fecha) throws ParseException{
		 String result = "";
	      Calendar calendar = Calendar.getInstance();
	      Calendar pfecha = Calendar.getInstance();
	      pfecha.setTime(new SimpleDateFormat("yyyy-MM-dd").parse(fecha)); // Configuramos la fecha que se recibe
	      calendar.setTime(new Date()); 
	      if(calendar.equals(pfecha))
	    	  	result = "IGUAL";
	      else if (calendar.before(pfecha))
	    	  	result = "ANTES";
	    	  else if (calendar.after(pfecha))
	    		 result = "DESPUES";
	      return result; // Devuelve el objeto Date con los nuevos dÃ­as aÃ±adidos
	 }
	
	private void listarTareasGeneradas(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		
		BeanTarea bean = new BeanTarea();
		
		int estado = Integer.parseInt(req.getParameter("strEstado"));
		int idTeam = Integer.parseInt(req.getParameter("iTeam"));
		
		bean.setEstado(estado);
		bean.setiTeam(idTeam);
		
		try {
			//Instancear metodos 
			BusinessTarea servicio = new BusinessTarea();
			
			List<BeanTareaAsignada> listaTarea = servicio.listarTareasGeneradas(bean, ssf);
			//Generar JSON
			objJson1.append("{\"ListaTareasAsignadas\": [");
			
			if(!listaTarea.isEmpty()) {
				for (BeanTareaAsignada beanTarea : listaTarea) {
					//String strfechaLimite = (beanTarea.getFechaGenerada() != null ? new SimpleDateFormat("yyyy-MM-dd").format(sumarRestarDiasFecha(beanTarea.getFechaGenerada(), beanTarea.getAvisoIn())) : "");
					
//					System.out.println("TO STRING: "+beanTarea.toString());
					
					String strfechaLimite = "";
					if(beanTarea.getFechaReprogramada() != null) {
						strfechaLimite = (beanTarea.getFechaPeriodo()!= null ? new SimpleDateFormat("yyyy-MM-dd").format(beanTarea.getFechaPeriodo()) : (beanTarea.getFechaGenerada() != null ? new SimpleDateFormat("yyyy-MM-dd").format(sumarRestarDiasFecha(beanTarea.getFechaGenerada(), 0)) : ""));
						
					}else {
						strfechaLimite = (beanTarea.getFechaPeriodo()!= null ? new SimpleDateFormat("yyyy-MM-dd").format(beanTarea.getFechaPeriodo()) : (beanTarea.getFechaGenerada() != null ? new SimpleDateFormat("yyyy-MM-dd").format(sumarRestarDiasFecha(beanTarea.getFechaGenerada(), beanTarea.getAvisoIn())) : ""));
							
					}
					
					objJson1.append("{" +
							"\"idTareaGenerada\" : \"" + beanTarea.getIdTareaGenerada() + "\" ," +
							"\"tipoTarea\" : \"" + beanTarea.getTipoTarea() + "\" ," +
							"\"tarea\" : \"" + beanTarea.getTarea() + "\" ," +
//							"\"owner\" : \"" + beanTarea.getOwner() + "\" ," +
//							"\"aprobador\" : \"" + beanTarea.getAprobador() + "\" ," +
							"\"frecuencia\" : \"" + beanTarea.getFrecuencia() + "\" ," +
							"\"programacion\" : \"" + beanTarea.getProgramacion() + "\" ," +
							"\"periodo\" : \"" + beanTarea.getPeriodo() + "\" ," +
							"\"avisoIn\" : \"" + beanTarea.getAvisoIn()+" Dias antes" + "\" ," +
							"\"avisoFin\" : \"" + beanTarea.getAvisoFin()+" Dias después"+ "\" ," +
							
							"\"fechaLimite\" : \"" + strfechaLimite + "\" ," +
							"\"estadoLimite\" : \"" + compararFecha(strfechaLimite) + "\" ," +
							
							"\"fechaRealizada\" : \"" + (beanTarea.getFechaRealizada() != null ?  new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(beanTarea.getFechaRealizada()) : "")+ "\" ," +
							"\"fechaAprobada\" : \"" + (beanTarea.getFechaAprobada() != null ?  new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(beanTarea.getFechaAprobada()) : "")  + "\" ," +
							"\"fechaReprogramada\" : \"" + (beanTarea.getFechaReprogramada() != null ?  new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(beanTarea.getFechaReprogramada()) : "")  + "\" ," +
							"\"fechaCancelada\" : \"" + (beanTarea.getFechaCancelada() != null ?  new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(beanTarea.getFechaCancelada()) : "")  + "\" ," +
							"\"observaciones\" : \"" + (beanTarea.getObservaciones() != null ? beanTarea.getObservaciones().replace("\"", "\\\"") : "") + "\", " +
							
							"\"archivo\" : \"" + beanTarea.getArchivo()+ "\" ," +
							"\"archivoNombre\" : \"" + beanTarea.getArchivoNombre()+ "\", " +
							"\"strEstado\" : \"" + beanTarea.getStrEstado() + "\", " 
//							"},"
							);
					
					List<BeanTarea>  listaGestor;
					BeanTarea objBeanTareaG = new BeanTarea();
//					System.out.println("ID tarea : "+ beanTarea.getIdTarea());
					
					objBeanTareaG.setIdTarea(beanTarea.getIdTarea());
					
					listaGestor= servicio.listarGestor(ssf, objBeanTareaG);
					List<String> listAprobador = new ArrayList<String>();
					List<String> listOwner = new ArrayList<String>();
					List<String> listAprobadorN = new ArrayList<String>();
					List<String> listOwnerN = new ArrayList<String>();
					
//					System.out.println("Tamaño lista : "+listaGestor.size());
					if (listaGestor.size() > 0) {
						for (BeanTarea beanTareaG : listaGestor) {
							if (beanTareaG.getTipo()==1) {
								//Aprobador
								listAprobador.add(String.valueOf(beanTareaG.getIdEmpleado()));
								listAprobadorN.add(String.valueOf(beanTareaG.getAprobador()));
							}
							else if(beanTareaG.getTipo()==2)
							{
								//Owner
								listOwner.add(String.valueOf(beanTareaG.getIdEmpleado()));
								listOwnerN.add(String.valueOf(beanTareaG.getAprobador()));
							}
						}
						this.idAprobador = listAprobador.toArray(new String[0]);
						this.idOwner = listOwner.toArray(new String[0]);
						
						JSONArray arrayO = new JSONArray(this.idOwner);
						JSONArray arrayA = new JSONArray(this.idAprobador);
//						System.out.println(String.valueOf(arrayO));
						
						objJson1.append(
								"\"aprobador\" : \"" + ConvertArrayToString(listAprobadorN.toArray(new String[0]), ",") + "\" ," +
								"\"owner\" : \"" + ConvertArrayToString(listOwnerN.toArray(new String[0]), ",") + "\" ," +
								"\"idAprobador\" : \"" + String.valueOf(arrayA).replace("\"", "") + "\" ," +
								"\"idOwner\" : \"" + String.valueOf(arrayO).replace("\"", "") + "\" " +
								"},"
								);
					}else {
						objJson1.append(
								"\"aprobador\" : \"" + "Pendiente registro" + "\" ," +
								"\"owner\" : \"" + "Pendiente registro" + "\" ," +
								"\"idAprobador\" : \"" + -1 + "\" ," +
								"\"idOwner\" : \"" + -1 + "\" " +
								"},"
								);
					}
					
							
				}	
			}else {
				objJson1.append("{" +
						"\"idTarea\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);	
			}
			
	
	
	strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
	

	}catch(Exception e) {
		e.printStackTrace();
		objJson1 = new StringBuilder();
		//Generar JSON
		objJson1.append("{\"ListaTareasAsignadas\": [");
	
			objJson1.append("{" +
					"\"idTarea\" : \"" + ""+ "\" ," +
					"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
					"},"
					);			
		
		strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		
	}
	
	out.print(strJson2);

}

//	private void listarTareasCerradas(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
//		res.setCharacterEncoding("UTF-8");
//		StringBuilder strJson2 = new StringBuilder();
//		PrintWriter out = res.getWriter();
//		StringBuilder objJson1 = new StringBuilder();
//		
//		BeanTarea bean = new BeanTarea();
//		
//		int estado = Integer.parseInt(req.getParameter("strEstado"));
//		int idTeam = Integer.parseInt(req.getParameter("iTeam"));
//		String strRangoI = req.getParameter("strRangoI").toString();
//		String strRangoF = req.getParameter("strRangoF").toString();
//		
//		try {
//
//			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//			Date rangoI = formatter.parse(strRangoI);
//			Date rangoF = formatter.parse(strRangoF);
//			
//			bean.setEstado(estado);
//			bean.setiTeam(idTeam);
//			bean.setrangoI(rangoI);
//			bean.setrangoF(rangoF);
//			
//			//Instancear mÃ©todos
//			BusinessTarea servicio = new BusinessTarea();
//			
//			List<BeanTareaCerrada> listaTarea = servicio.listarTareasCerradas(bean, ssf);
//			//Generar JSON
//			objJson1.append("{\"ListaTareasCerrada\": [");
//			
//			if(!listaTarea.isEmpty()) {
//				for (BeanTareaCerrada beanTarea : listaTarea) {
//					
//					objJson1.append("{" +
//							"\"idTareaGenerada\" : \"" + beanTarea.getIdTareaGenerada() + "\" ," +
//							"\"tipoTarea\" : \"" + beanTarea.getTipoTarea() + "\" ," +
//							"\"tarea\" : \"" + beanTarea.getTarea() + "\" ," +
//							"\"owner\" : \"" + beanTarea.getOwner() + "\" ," +
//							"\"aprobador\" : \"" + beanTarea.getAprobador() + "\" ," +
//							"\"frecuencia\" : \"" + beanTarea.getFrecuencia() + "\" ," +
//							"\"programacion\" : \"" + beanTarea.getProgramacion() + "\" ," +
//							"\"periodo\" : \"" + beanTarea.getPeriodo() + "\" ," +
//							"\"avisoIn\" : \"" + beanTarea.getAvisoIn()+" DÃ­as antes" + "\" ," +
//							"\"avisoFin\" : \"" + beanTarea.getAvisoFin()+" DÃ­as despuÃ©s"+ "\" ," +
//							"\"fechaGenerada\" : \"" + (beanTarea.getFechaGenerada() != null ?  new SimpleDateFormat("yyyy/MM/dd").format(beanTarea.getFechaGenerada()) : "")+ "\" ," +
//							"\"fechaRealizada\" : \"" + (beanTarea.getFechaRealizada() != null ?  new SimpleDateFormat("yyyy/MM/dd").format(beanTarea.getFechaRealizada()) : "")+ "\" ," +
//							"\"fechaAprobada\" : \"" + (beanTarea.getFechaAprobada() != null ?  new SimpleDateFormat("yyyy/MM/dd").format(beanTarea.getFechaAprobada()) : "")  + "\" ," +
//							"\"archivo\" : \"" + beanTarea.getArchivo()+ "\" ," +
//							"\"archivoNombre\" : \"" + beanTarea.getArchivoNombre()+ "\" " +
//							"},"
//							);
//				}	
//			}else {
//				objJson1.append("{" +
//						"\"idTarea\" : \"" + ""+ "\" ," +
//						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
//						"},"
//						);	
//			}
//	
//	strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
//	
//
//	}catch(Exception e) {
//		e.printStackTrace();
//		objJson1 = new StringBuilder();
//		//Generar JSON
//		objJson1.append("{\"ListaTareasCerrada\": [");
//	
//			objJson1.append("{" +
//					"\"idTarea\" : \"" + ""+ "\" ," +
//					"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
//					"},"
//					);			
//		
//		strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
//		
//	}
//	
//	out.print(strJson2);
//
//}
	
	private void ejecutarTarea(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		try {
			
			this.idTareaGenerada = Integer.parseInt(req.getParameter("strIdTareaGenerada"));
			this.observaciones = req.getParameter("strObservaciones");
			
			//Instancear metodos 
			BeanTareaAsignada beanTareaAsignada = new BeanTareaAsignada();
			
			beanTareaAsignada.setIdTareaGenerada(this.idTareaGenerada);
			beanTareaAsignada.setUsuario(this.userMod);
			beanTareaAsignada.setObservaciones(this.observaciones);
			beanTareaAsignada.setOperacion("REALIZADO");
			
			BusinessTarea servicio = new BusinessTarea();
			this.resultado = servicio.insertar_actualizar_TareaAsignada(beanTareaAsignada,ssf);
			
			
			if(this.resultado >0) { //Registro correcto
				
				BeanTareaAsignada beanTareaAsignada2 = new BeanTareaAsignada();
				beanTareaAsignada2.setIdTareaGenerada(this.idTareaGenerada);
				
//				BeanTareaAsignada beanTarea = servicio.buscarTareaAsignada(beanTareaAsignada2, ssf);
				
				//Generar JSON
//				objJson1.append("{\"BeanTareaAsignada\": [");
				
//				if(beanTarea.getIdTareaGenerada()>0){
					objJson1.append("ok");
//						objJson1.append("{" +
//									
//								"\"idTareaGenerada\" : \"" + beanTarea.getIdTareaGenerada() + "\" ," +
//								"\"fechaRealizada\" : \"" + (beanTarea.getFechaRealizada() != null ?  new SimpleDateFormat("dd/MM/yyyy").format(beanTarea.getFechaRealizada()) : "")+ "\" ," +
//								"\"fechaAprobada\" : \"" + (beanTarea.getFechaAprobada() != null ?  new SimpleDateFormat("dd/MM/yyyy").format(beanTarea.getFechaAprobada()) : "")  + "\" ," +
//								"\"archivo\" : \"" + beanTarea.getArchivo()+ "\" ," +
//								"\"archivoNombre\" : \"" + beanTarea.getArchivoNombre()+ "\" " +
//								"},"
//								);
//				}else { // Bean vacio
					
//					objJson1.append("{" + "\"idTareaGenerada\" : \"" + "" + "\" " + "},");
//				}
			}else { // Error en el registro
				objJson1.append("fail.");
//						objJson1.append("{" + "\"idTareaGenerada\" : \"" + "" + "\" " + "},");
			}
//			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
			
		}catch(Exception e) {
//			e.printStackTrace();
//			this.resultado = 0;
//			this.respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			//Generar JSON
//			objJson1 = new StringBuilder();
//			objJson1.append("{\"BeanTareaAsignada\": [");
			
//				objJson1.append("{" +
//						"\"idTareaGenerada\" : \"" + this.resultado + "\" ," +
//						"\"resultado\" : \"" + this.respuesta + "\" " +
//						"},"
//						);
//			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			objJson1.append("fail: " + e.getMessage());
		}

		out.print(objJson1);
	}
	
	private void ejecutarReprogramar(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		try {
			
			this.idTareaGenerada = Integer.parseInt(req.getParameter("strIdTareaGenerada"));
			this.fecha = req.getParameter("strFechaReprogramada");
			this.observaciones = req.getParameter("strObservaciones");

			
			
			//Instancear metodos 
			BeanTareaAsignada beanTareaAsignada = new BeanTareaAsignada();
			
			beanTareaAsignada.setIdTareaGenerada(this.idTareaGenerada);
			beanTareaAsignada.setUsuario(this.userMod);
			beanTareaAsignada.setNuevaFecha(this.fecha);
			beanTareaAsignada.setObservaciones(this.observaciones);
			beanTareaAsignada.setOperacion("REPROGRAMADO");
			
			BusinessTarea servicio = new BusinessTarea();
			this.resultado = servicio.insertar_actualizar_TareaAsignada(beanTareaAsignada,ssf);
			
			
				if(this.resultado >0) { //Registro correcto
					
					objJson1.append("ok");
				}else { // Error en el registro
					objJson1.append("fail.");
				}
				
			}catch(Exception e) {
				objJson1.append("fail: " + e.getMessage());
			}
	
			out.print(objJson1);

	}
	
	private void ejecutarCancelar(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		try {
			
			this.idTareaGenerada = Integer.parseInt(req.getParameter("strIdTareaGenerada"));
			this.observaciones = req.getParameter("strObservaciones");
			
			//Instancear metodos 
			BeanTareaAsignada beanTareaAsignada = new BeanTareaAsignada();
			
			beanTareaAsignada.setIdTareaGenerada(this.idTareaGenerada);
			beanTareaAsignada.setUsuario(this.userMod);
			beanTareaAsignada.setObservaciones(this.observaciones);
			beanTareaAsignada.setOperacion("CANCELADO");
			
			BusinessTarea servicio = new BusinessTarea();
			this.resultado = servicio.insertar_actualizar_TareaAsignada(beanTareaAsignada,ssf);
			
			if(this.resultado >0) { //Registro correcto
							
							objJson1.append("ok");
						}else { // Error en el registro
							objJson1.append("fail.");
						}
						
		}catch(Exception e) {
			objJson1.append("fail: " + e.getMessage());
		}
			
		out.print(objJson1);
			
			
			
//			if(this.resultado >0) { //Registro correcto
//				
//				BeanTareaAsignada beanTareaAsignada2 = new BeanTareaAsignada();
//				beanTareaAsignada2.setIdTareaGenerada(this.idTareaGenerada);
//				
//				BeanTareaAsignada beanTarea = servicio.buscarTareaAsignada(beanTareaAsignada2, ssf);
//				
//				System.out.println(beanTarea.toString());
//				//Generar JSON
//				objJson1.append("{\"BeanTareaAsignada\": [");
//				
//				if(beanTarea.getIdTareaGenerada()>0){
//				
//						objJson1.append("{" +
//									
//								"\"idTareaGenerada\" : \"" + beanTarea.getIdTareaGenerada() + "\" ," +
//								"\"fechaRealizada\" : \"" + (beanTarea.getFechaRealizada() != null ?  new SimpleDateFormat("dd/MM/yyyy").format(beanTarea.getFechaRealizada()) : "")+ "\" ," +
//								"\"fechaAprobada\" : \"" + (beanTarea.getFechaAprobada() != null ?  new SimpleDateFormat("dd/MM/yyyy").format(beanTarea.getFechaAprobada()) : "")  + "\" ," +
//								"\"archivo\" : \"" + beanTarea.getArchivo()+ "\" ," +
//								"\"archivoNombre\" : \"" + beanTarea.getArchivoNombre()+ "\" " +
//								"},"
//								);
//				}else { // Bean vacio
//						objJson1.append("{" +
//								"\"idTareaGenerada\" : \"" + "" + "\" " +
//								"},"
//								);
//				}
//			}else { // Error en el registro
//						objJson1.append("{" +
//								"\"idTareaGenerada\" : \"" + "" + "\" " +
//								"},"
//								);
//			}
//
//			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
//			
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//			this.resultado = 0;
//			this.respuesta = "*Hubo un error durante el proceso de registro o actualización";	
//			//Generar JSON
//			objJson1 = new StringBuilder();
//			objJson1.append("{\"BeanTareaAsignada\": [");
//			
//				objJson1.append("{" +
//						"\"idTareaGenerada\" : \"" + this.resultado + "\" ," +
//						"\"resultado\" : \"" + this.respuesta + "\" " +
//						"},"
//						);
//			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
//		}
//
//		out.print(strJson2);
	}
	
	private void aprobarTarea(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		try {
			
			
			this.idTareaGenerada = Integer.parseInt(req.getParameter("strIdTareaGenerada"));
			this.observaciones = req.getParameter("strObservaciones");
			
			//Instancear metodos 
			BeanTareaAsignada beanTareaAsignada = new BeanTareaAsignada();
			
			beanTareaAsignada.setIdTareaGenerada(this.idTareaGenerada);
			beanTareaAsignada.setUsuario(this.userMod);
			beanTareaAsignada.setObservaciones(this.observaciones);
			beanTareaAsignada.setOperacion("APROBADO");
			
			BusinessTarea servicio = new BusinessTarea();
			this.resultado = servicio.insertar_actualizar_TareaAsignada(beanTareaAsignada,ssf);
			
			if(this.resultado >0) { //Registro correcto
							
							objJson1.append("ok");
						}else { // Error en el registro
							objJson1.append("fail.");
						}
						
		}catch(Exception e) {
			objJson1.append("fail: " + e.getMessage());
		}
			
		out.print(objJson1);
			
			
			
			

//			if(this.resultado >0) { //Registro correcto
//				BeanTareaAsignada beanTareaAsignada2 = new BeanTareaAsignada();
//				beanTareaAsignada2.setIdTareaGenerada(this.idTareaGenerada);
//				
//				BeanTareaAsignada beanTarea = servicio.buscarTareaAsignada(beanTareaAsignada2, ssf);
//				
//				System.out.println(beanTarea.toString());
//				//Generar JSON
//				objJson1.append("{\"BeanTareaAsignada\": [");
//				
//				if(beanTarea.getIdTareaGenerada()>0){
//
//						objJson1.append("{" +
//									
//								"\"idTareaGenerada\" : \"" + beanTarea.getIdTareaGenerada() + "\" ," +
//								"\"fechaRealizada\" : \"" + (beanTarea.getFechaRealizada() != null ?  new SimpleDateFormat("dd/MM/yyyy").format(beanTarea.getFechaRealizada()) : "")+ "\" ," +
//								"\"fechaAprobada\" : \"" + (beanTarea.getFechaAprobada() != null ?  new SimpleDateFormat("dd/MM/yyyy").format(beanTarea.getFechaAprobada()) : "")  + "\" ," +
//								"\"archivo\" : \"" + beanTarea.getArchivo()+ "\" ," +
//								"\"archivoNombre\" : \"" + beanTarea.getArchivoNombre()+ "\" " +
//								"},"
//								);
//				}else { // Bean vacio
//						objJson1.append("{" +
//								"\"idTareaGenerada\" : \"" + "" + "\" " +
//								"},"
//								);
//				}
//			}else { // Error en el registro
//						objJson1.append("{" +
//								"\"idTareaGenerada\" : \"" + "" + "\" " +
//								"},"
//								);
//			}
//
//			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
//			
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//			this.resultado = 0;
//			this.respuesta = "*Hubo un error durante el proceso de registro o actualización";	
//			//Generar JSON
//			objJson1 = new StringBuilder();
//			objJson1.append("{\"BeanTareaAsignada\": [");
//			
//				objJson1.append("{" +
//						"\"idTareaGenerada\" : \"" + this.resultado + "\" ," +
//						"\"resultado\" : \"" + this.respuesta + "\" " +
//						"},"
//						);
//			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
//		}
//
//		out.print(strJson2);
	}

	private void adjuntarFile(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		try {
			
			
			this.idTareaGenerada = Integer.parseInt(req.getParameter("strIdTareaGenerada"));
			this.archivo = req.getParameter("strArchivo");
			this.archivoNombre = req.getParameter("strArchivoNombre");
			//Instancear metodos 
			BeanTareaAsignada beanTareaAsignada = new BeanTareaAsignada();
			
			beanTareaAsignada.setIdTareaGenerada(this.idTareaGenerada);
			beanTareaAsignada.setArchivo(this.archivo);
			beanTareaAsignada.setArchivoNombre(this.archivoNombre);
			beanTareaAsignada.setOperacion("ADJUNTAR");
			
			BusinessTarea servicio = new BusinessTarea();
			this.resultado = servicio.insertar_actualizar_TareaAsignada(beanTareaAsignada,ssf);
			

			if(this.resultado >0) { //Registro correcto
				BeanTareaAsignada beanTareaAsignada2 = new BeanTareaAsignada();
				beanTareaAsignada2.setIdTareaGenerada(this.idTareaGenerada);
				
				BeanTareaAsignada beanTarea = servicio.buscarTareaAsignada(beanTareaAsignada2, ssf);
				
				System.out.println(beanTarea.toString());
				//Generar JSON
				objJson1.append("{\"BeanTareaAsignada\": [");
				
				if(beanTarea.getIdTareaGenerada()>0){

						objJson1.append("{" +
									
								"\"idTareaGenerada\" : \"" + beanTarea.getIdTareaGenerada() + "\" ," +
								"\"fechaRealizada\" : \"" + (beanTarea.getFechaRealizada() != null ?  new SimpleDateFormat("dd/MM/yyyy").format(beanTarea.getFechaRealizada()) : "")+ "\" ," +
								"\"fechaAprobada\" : \"" + (beanTarea.getFechaAprobada() != null ?  new SimpleDateFormat("dd/MM/yyyy").format(beanTarea.getFechaAprobada()) : "")  + "\" ," +
								"\"archivo\" : \"" + beanTarea.getArchivo()+ "\" ," +
								"\"archivoNombre\" : \"" + beanTarea.getArchivoNombre()+ "\" " +
								"},"
								);
				}else { // Bean vacio
						objJson1.append("{" +
								"\"idTareaGenerada\" : \"" + "" + "\" " +
								"},"
								);
				}
			}else { // Error en el registro
						objJson1.append("{" +
								"\"idTareaGenerada\" : \"" + "" + "\" " +
								"},"
								);
			}

			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			this.resultado = 0;
			this.respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"BeanTareaAsignada\": [");
			
				objJson1.append("{" +
						"\"idTareaGenerada\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}

		out.print(strJson2);
	}
	
	private void listarTareaBacklog(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder objJson2 = new StringBuilder();
		
		try {
			//Instancear metodos 
			BusinessTarea servicio = new BusinessTarea();
			List<BeanTareaBacklog> listaTareaBacklog = new ArrayList<BeanTareaBacklog>();
			listaTareaBacklog = servicio.listarTareasBacklog(ssf);
			
			objJson1.append("{\"listaTareasBacklog\": [");
			
			if(listaTareaBacklog.size() > 0 ) {
				//Generar JSO
				for (BeanTareaBacklog beanTareaBacklog : listaTareaBacklog) {
					objJson1.append("{" +
							"\"squad\" : \"" + beanTareaBacklog.getSquad() + "\" ," +
							"\"team\" : \"" + beanTareaBacklog.getTeam() + "\" ," +
							"\"tipoTarea\" : \"" + beanTareaBacklog.getTipoTarea() + "\" ," +
							"\"estado\" : \"" + beanTareaBacklog.getEstado() + "\" ," +
							"\"fechaVencimiento\" : \"" + beanTareaBacklog.getFechaVencimiento()+ "\" ," +
							"\"dias\" : \"" + beanTareaBacklog.getDias() + "\" ," +
							"\"fechaFinalizacion\" : \"" + beanTareaBacklog.getFechaFinalizacion() + "\" " +
							"},"
							);
				}
			}else {
				objJson1.append(",");
			}
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaTareas\": [");
		
				objJson1.append("{" +
						"\"idTarea\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		}
		
		out.print(strJson2);
	}
	
	
}