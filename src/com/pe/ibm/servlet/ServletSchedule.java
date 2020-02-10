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

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSchedule;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessSchedule;

/**
 * Servlet implementation class ServletActividad
 */
@WebServlet("/ServletSchedule")
public class ServletSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int strAccion;
	private int idUser = 0;
	private int idTeam = 0;

//	MyBatisUtil objMyBatis = MyBatisUtil.getInstance();
//	SqlSessionFactory ssf= objMyBatis.getSqlSessionFactory();

	 
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSchedule() {
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
				
		//SESION DE USUARIO
//				    //Creación
//					HttpSession objSessionUser = request.getSession(true);
//					int idUser = 277;
//					objSessionUser.setAttribute("sesionUsuario", idUser);	
					//Consumo
				
				BeanSession objBeanSession = new BeanSession();
				
				HttpSession objSessionLogin = request.getSession(true);
				objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
				this.idUser =  (Integer) objBeanSession.getObjBeanPersonal().getiIdEmpleado();
				this.idTeam = (Integer)  objBeanSession.getObjBeanPersonal().getiTeam();

				switch (this.strAccion){
				
				case 1: //Insertar
					//registrarActividad(request, response);
					//registrarTurno(request, response);	
					break;
				case 2: //listar
					listarSchedule(request, response, idTeam,ssf);
					break;
				case 3: //listar mis Schedules - enviar como 3er parametro el ID del usuario
					listarMisSchedules(request, response, idUser,ssf);
					break;
				case 4: //actualizar_estado
					seleccionarSchedule(request, response, idUser,ssf);
					break;
				case 5: //redireccionar a Detalle Schedules
					redireccionarDetalleSchedule(request, response, idUser,ssf);
					break;
				case 6: //redireccionar a Detalle Schedules
					generarSchedule(request, response, idTeam, idUser,ssf);
					break;
				case 7: //redireccionar a Detalle Schedules
					listarSchedulesActivos(request, response,ssf);
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

	
	private void listarSchedule(HttpServletRequest req, HttpServletResponse res, int idTeam,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8"); 
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		try {
			//Instancear metodos 
			BusinessSchedule servicio = new BusinessSchedule();
			BeanEmpleado bean = new BeanEmpleado();
			bean.setiTeam(this.idTeam);
			
			List<BeanSchedule> listaSchedule = servicio.listar(bean,ssf);
			
			
			//Generar JSON
			objJson1.append("{\"ListaSchedule\": [");
			
			if(listaSchedule.size() > 0) {
				for (BeanSchedule beanSchedule2 : listaSchedule) {
					

					objJson1.append("{" +
							"\"idSchedule\" : \"" + beanSchedule2.getIdSchedule()+ "\" ," +
							"\"fecha\" : \"" + beanSchedule2.getFecha()+ "\" ," +
							"\"estado\" : \"" + beanSchedule2.getEstado()+ "\" ," +
							"\"idTurno\" : \"" + beanSchedule2.getIdTurno()+ "\" ," +
							"\"descripcionTurno\" : \"" + beanSchedule2.getDescripcionTurno()+ "\" ," +
							"\"horaInicioTurno\" : \"" + beanSchedule2.getHoraInicioTurno()+ "\" ," +
							"\"horaFinTurno\" : \"" + beanSchedule2.getHoraFinTurno()+ "\" ," +
							"\"gTurnos\" : \"" + beanSchedule2.getGrupoTurnos()+ "\" ," +		//BG001
							"\"idOption\" : \"" + beanSchedule2.getIdOption()+ "\" ," +			//BG001
							"\"usermod\" : \"" + beanSchedule2.getUsermod()+ "\" ," +
							"\"idSede\" : \"" + beanSchedule2.getIdSede()+ "\" ," +
							"\"descripcionSede\" : \"" + beanSchedule2.getDescripcionSede() + "\" ," +
							"\"operadorAsignado\" : \"" + beanSchedule2.getOperadorAsignado() + "\" " +
							"},"
							);
				}
			}else {
				objJson1.append("{" +
						"\"idSchedule\" : \"" + "" + "\" " +
						"},"
						);
			}
			
			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaSchedule\": [");
		
				objJson1.append("{" +
						"\"idSchedule\" : \"" + ""+ "\" ," +
						"\"descripcionTurno\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	private void listarSchedulesActivos(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		try {
			//Instancear metodos 
			BusinessSchedule servicio = new BusinessSchedule();

			List<BeanSchedule> listaSchedule = servicio.listar_schedules_activos(ssf);
			
			
			//Generar JSON
			objJson1.append("{\"ListaScheduleActivos\": [");
			
			if(listaSchedule.size() > 0) {
				for (BeanSchedule beanSchedule2 : listaSchedule) {
					

					objJson1.append("{" +
							"\"idSchedule\" : \"" + beanSchedule2.getIdSchedule()+ "\" ," +
							"\"fecha\" : \"" + beanSchedule2.getFecha()+ "\" ," +
							"\"estado\" : \"" + beanSchedule2.getEstado()+ "\" ," +
							"\"idTurno\" : \"" + beanSchedule2.getIdTurno()+ "\" ," +
							"\"descripcionTurno\" : \"" + beanSchedule2.getDescripcionTurno()+ "\" ," +
							"\"horaInicioTurno\" : \"" + beanSchedule2.getHoraInicioTurno()+ "\" ," +
							"\"horaFinTurno\" : \"" + beanSchedule2.getHoraFinTurno()+ "\" ," +
							"\"usermod\" : \"" + beanSchedule2.getUsermod()+ "\" ," +
							"\"idSede\" : \"" + beanSchedule2.getIdSede()+ "\" ," +
							"\"descripcionSede\" : \"" + beanSchedule2.getDescripcionSede() + "\" ," +
							"\"operadorAsignado\" : \"" + beanSchedule2.getOperadorAsignado() + "\" " +
							"},"
							);
				}
			}else {
				objJson1.append("{" +
						"\"idSchedule\" : \"" + "" + "\" " +
						"},"
						);
			}
			
			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaScheduleActivos\": [");
		
				objJson1.append("{" +
						"\"idSchedule\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	private void listarMisSchedules(HttpServletRequest req, HttpServletResponse res, int idUsuario,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		try {
			
			String usermod = req.getParameter("strUsermod");

			
			//Instancear metodos 
			
			
			BeanSchedule beanSchedule = new BeanSchedule();
			beanSchedule.setIdusermod(idUsuario);
			
			BusinessSchedule servicio = new BusinessSchedule();
			
			List<BeanSchedule> listaMisSchedule = servicio.listar_mis_schedules(beanSchedule, ssf);
			
			
			//Generar JSON
			objJson1.append("{\"MisSchedules\": [");
			
			if(listaMisSchedule.size() > 0) {
				for (BeanSchedule beanSchedule2 : listaMisSchedule) {
					

					objJson1.append("{" +
							"\"idSchedule\" : \"" + beanSchedule2.getIdSchedule()+ "\" ," +
							"\"fecha\" : \"" + beanSchedule2.getFecha()+ "\" ," +
							"\"estado\" : \"" + beanSchedule2.getEstado()+ "\" ," +
							"\"descripcionEstado\" : \"" + beanSchedule2.getDescripcionEstado()+ "\" ," +
							"\"idTurno\" : \"" + beanSchedule2.getIdTurno()+ "\" ," +
							"\"descripcionTurno\" : \"" + beanSchedule2.getDescripcionTurno()+ "\" ," +
							"\"horaInicioTurno\" : \"" + beanSchedule2.getHoraInicioTurno()+ "\" ," +
							"\"horaFinTurno\" : \"" + beanSchedule2.getHoraFinTurno()+ "\" ," +
							"\"usermod\" : \"" + beanSchedule2.getUsermod()+ "\" ," +
							"\"descripcionSede\" : \"" + beanSchedule2.getDescripcionSede()+ "\" " +
							"},"
							);
				}	
			}else {
				objJson1.append("{" +
						"\"idSchedule\" : \"" + "" + "\" " +
						"},"
						);
			}
			
			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"MisSchedules\": [");
		
				objJson1.append("{" +
						"\"idSchedule\" : \"" + ""+ "\" ," +
						"\"descripcionTurno\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
		
	private void seleccionarSchedule(HttpServletRequest req, HttpServletResponse res, int idUsuario,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		String respuesta;
		int resultado;
		
		
		
		try {
		
			String operacion = req.getParameter("strOperacion");
			
			int idSchedule = Integer.parseInt(req.getParameter("strId"));
			int estado = Integer.parseInt(req.getParameter("strEstado"));
			
					
			//Instancear metodos 
			BeanSchedule beanSchedule = new BeanSchedule();
			beanSchedule.setIdSchedule(idSchedule);
			beanSchedule.setEstado(estado);
			beanSchedule.setOperacion(operacion);
			beanSchedule.setIdusermod(idUsuario);
			
			BusinessSchedule servicio = new BusinessSchedule();
			resultado = servicio.insertar_actualizar(beanSchedule,ssf);
			
			if(resultado == 1) {
				respuesta = "El registro se realizo satisfactoriamente";	
			}else {
				respuesta = "*Hubo un error durante el proceso de asignacion de Schedule, El Schedule Ya se encuentra asignado";	
			}
					
			//Generar JSON
			objJson1.append("{\"SeleccionarSchedule\": [");
			
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
			objJson1.append("{\"SeleccionarSchedule\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + resultado + "\" ," +
						"\"resultado\" : \"" + respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}

		out.print(strJson2);
	}

	private void redireccionarDetalleSchedule(HttpServletRequest req, HttpServletResponse res, int idUsuario,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		String respuesta;
		int idRespuesta = 0;
		
		try {
			
			int idSchedule = Integer.parseInt(req.getParameter("strIdSchedule"));
			
			String cabeceraSchedule = req.getParameter("strCabecera");
			
		
			//Instancear metodos 
			BeanSchedule beanSchedule = new BeanSchedule();
			beanSchedule.setIdSchedule(idSchedule);
			beanSchedule.setIdusermod(idUsuario);
			beanSchedule.setCabecera(cabeceraSchedule);
			
			HttpSession objSessionSchedule = req.getSession(false);
			objSessionSchedule.setAttribute("schedule", beanSchedule);
			
						
			if(idSchedule != 0  && idUsuario != 0) {
				idRespuesta = 1;
				respuesta = "Satisfactorio";	
			}else {
				idRespuesta = 0;
				respuesta = "*Hubo un error durante el proceso";	
			}
					
			//Generar JSON
			objJson1.append("{\"iniciarSchedule\": [");
			
				objJson1.append("{" +
						"\"idRespuesta\" : \"" + idRespuesta + "\" ," +
						"\"respuesta\" : \"" + respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			idRespuesta = 0;
			respuesta = "*Hubo un error durante el proceso";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"iniciarSchedule\": [");
			
				objJson1.append("{" +
						"\"idRespuesta\" : \"" + idRespuesta + "\" ," +
						"\"respuesta\" : \"" + respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}

		out.print(strJson2);
		
	}

	private void generarSchedule(HttpServletRequest req, HttpServletResponse res, int idTeam, int idUsuario,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		String respuesta;
		int resultado;
		
		try {
		
//			String operacion = req.getParameter("strOperacion");
			
			String strTipo = req.getParameter("strType").toString();
			String strFechaSchedule = req.getParameter("strFechaSchedule").toString();
			
			BeanParameters objBeanParameters = new BeanParameters();
			objBeanParameters.setStrValor1(strTipo);
			
			BeanEmpleado bean = new BeanEmpleado();
			bean.setiTeam(this.idTeam);
			
//			objBeanParameters.setStrValor2(strFechaSchedule);
			
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = formatter.parse(strFechaSchedule);
			objBeanParameters.setObjDate(date);
			objBeanParameters.setStrValor2(formatter.format(date));
			
			BusinessSchedule servicio = new BusinessSchedule();
			respuesta = servicio.generarSchedule(ssf, objBeanParameters);
			
//			if(resultado == 1) {
//				respuesta = "El registro se realizo satisfactoriamente";	
//			}else {
//				respuesta = "*Hubo un error durante el proceso de asignacion de Schedule, El Schedule Ya se encuentra asignado";	
//			}

			//Generar JSON
			objJson1.append("{\"SeleccionarSchedule\": [");
			
				objJson1.append("{" +
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
			objJson1.append("{\"SeleccionarSchedule\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + resultado + "\" ," +
						"\"resultado\" : \"" + respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}

		out.print(strJson2);
	}


}
