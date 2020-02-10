package com.pe.ibm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.bean.BeanTurno;
import com.pe.ibm.business.BusinessTurno;

/**
 * Servlet implementation class ServletTurno
 */
@WebServlet("/ServletTurno")
public class ServletTurno extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int accion;
	private int idTurno;
	private String descripcion;
	private int estado;
	private int resultado;
	private Time timeHoraInicio;
	private Time timeHoraFin;
	private String respuesta;
	
	//Extra values -> Begin of BG001
	private int opcion;
	private String gturnos;
	private int vfecha;
	//Primary option
	private int team;
	// -> End of BG001
	
//	MyBatisUtil objMyBatis = MyBatisUtil.getInstance();
//	SqlSessionFactory ssf= objMyBatis.getSqlSessionFactory();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletTurno() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());

		SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
		
		//Datos de sesion
		BeanSession objBeanSession = new BeanSession();
		HttpSession objSessionLogin = request.getSession(true);
		objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
		this.team = objBeanSession.getObjBeanPersonal().getiTeam();
		System.out.println("El team es: "+ this.team);		//BG001
		//Captura de parametros
		this.accion = Integer.parseInt(request.getParameter("strAccion"));
		

		switch (this.accion){
		
		case 1: //Insertar
			registrarTurno(request, response,ssf);	
			break;
		case 2: //listar
			listarTurno(request, response,ssf);
			break;
		case 3: //actualizar
			actualizarTurno(request, response,ssf);
			break;
		case 4: //actualizar_estado
			actualizarTurnoEstado(request, response,ssf);
			break;
		case 5: //new saveTurno
			saveTurno(request, response,ssf);
			break;
		case 6: //new updateTurno
			updateTurno(request, response,ssf);
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
		
			this.descripcion = req.getParameter("strDescripcion");	
			
			//-> Begin of BG001
			//El idTeam ya se obtiene en el DoGet()
			this.gturnos = req.getParameter("strGTurnos");
			this.opcion = Integer.parseInt(req.getParameter("strOption"));
			this.vfecha = Integer.parseInt(req.getParameter("strVFecha"));
			//-> End of BG001
			if (req.getParameter("strHoraInicio") == null || req.getParameter("strHoraInicio").equals("")) {
				LocalTime timeInicio = LocalTime.parse("00:00:00"); //formato hh:mm:ss  (24 hrs)
				this.timeHoraInicio = Time.valueOf(timeInicio);
				
				LocalTime timeFin = LocalTime.parse("00:00:00"); //formato hh:mm:ss  (24 hrs)
				this.timeHoraFin = Time.valueOf(timeFin);
			}else {
				LocalTime timeInicio = LocalTime.parse(req.getParameter("strHoraInicio")); //formato hh:mm:ss  (24 hrs)
				this.timeHoraInicio = Time.valueOf(timeInicio);
				
				LocalTime timeFin = LocalTime.parse(req.getParameter("strHoraFin")); //formato hh:mm:ss  (24 hrs)
				this.timeHoraFin = Time.valueOf(timeFin);
			}
	}
	
	private void registrarTurno(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		try {
			
			obtenerParametros(req, res, ssf);
			
			BeanTurno beanTurno = new BeanTurno();
			beanTurno.setDescripcion(this.descripcion);
			beanTurno.setHoraInicio(this.timeHoraInicio);
			beanTurno.setHoraFin(this.timeHoraFin);
			beanTurno.setOperacion("INSERTAR");
			beanTurno.setEstado(1);
			
			BusinessTurno servicio = new BusinessTurno();
			resultado = servicio.insertar_actualizar(beanTurno,ssf);
			
			if(resultado == 1) {
				respuesta = "El registro se realizo satisfactoriamente";	
			}else {
				respuesta = "Hubo un error durante el proceso de registro o actualizaci�n";	
			}
					
			//Generar JSON
			objJson1.append("{\"Turno\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			this.resultado = 0;
			this.respuesta = "*Hubo un error durante el proceso de registro o actualizaci�n";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"Turno\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		
		out.print(strJson2);

	}
	
	
	private void actualizarTurno(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		try {
			
			obtenerParametros(req, res, ssf);
			this.idTurno = Integer.parseInt(req.getParameter("strId"));
			
			//Instancear metodos 
			BeanTurno beanTurno = new BeanTurno();
			beanTurno.setIdTurno(this.idTurno);
			beanTurno.setDescripcion(this.descripcion);
			beanTurno.setHoraInicio(this.timeHoraInicio);
			beanTurno.setHoraFin(this.timeHoraFin);
			beanTurno.setOperacion("ACTUALIZAR");
			
			BusinessTurno servicio = new BusinessTurno();
			this.resultado = servicio.insertar_actualizar(beanTurno,ssf);
			
			if(this.resultado == 1) {
				this.respuesta = "El registro se realizo satisfactoriamente";	
			}else {
				this.respuesta = "*Hubo un error durante el proceso de registro o actualizaci�n";	
			}
					
			//Generar JSON
			objJson1.append("{\"ActualizarTurno\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
				
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			this.resultado = 0;
			this.respuesta = "*Hubo un error durante el proceso de registro o actualizaci�n";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"ActualizarTurno\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}

		out.print(strJson2);
	}
	
	private void actualizarTurnoEstado(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		try {
			this.idTurno = Integer.parseInt(req.getParameter("strId"));
			this.estado = Integer.parseInt(req.getParameter("strEstado"));
			
			//Instancear metodos 
			BeanTurno beanTurno = new BeanTurno();
			beanTurno.setIdTurno(this.idTurno);
			beanTurno.setEstado(this.estado);
			beanTurno.setOperacion("ACTUALIZAR_ESTADO");
			
			BusinessTurno servicio = new BusinessTurno();
			this.resultado = servicio.insertar_actualizar(beanTurno,ssf);
			
			if(this.resultado == 1) {
				this.respuesta = "El registro se realizo satisfactoriamente";	
			}else {
				this.respuesta = "*Hubo un error durante el proceso de registro o actualizaci�n";	
			}
					
			//Generar JSON
			objJson1.append("{\"ActualizarTurnoEstado\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			this.resultado = 0;
			this.respuesta = "*Hubo un error durante el proceso de registro o actualizaci�n";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"ActualizarTurnoEstado\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}

		out.print(strJson2);
	}
	
	private void listarTurno(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		try {
			//Instancear metodos 
			BusinessTurno servicio = new BusinessTurno();
			BeanTurno beanTurno = new BeanTurno();
			beanTurno.setDescripcion(this.descripcion);
			beanTurno.setEstado(this.estado);
			beanTurno.setTeam(this.team);						//BG001
			
//			List<BeanTurno> listaTurno = servicio.listar(ssf);	//--BG001
			List<BeanTurno> listaTurno = new ArrayList<BeanTurno>();//++BG001
					
			listaTurno = servicio.listarTurnos(beanTurno, ssf);
			
			
			//Generar JSON
			objJson1.append("{\"ListaTurno\": [");
			if (listaTurno.size() > 0) {
				for (BeanTurno beanTurno2 : listaTurno) {
					objJson1.append("{" +
							"\"idTurno\" : \"" + beanTurno2.getIdTurno() + "\" ," +
							"\"descripcion\" : \"" + beanTurno2.getDescripcion() + "\" ," +
							"\"horaInicio\" : \"" + beanTurno2.getHoraInicio() + "\" ," +
							"\"horaFin\" : \"" + beanTurno2.getHoraFin() + "\" ," +
							//Begin of BG001
							"\"gTurnos\" : \"" + beanTurno2.getGturnos() + "\" ," +
							"\"idTeam\" : \"" + beanTurno2.getTeam() + "\" ," +
							"\"idOption\" : \"" + beanTurno2.getOpcion() + "\" ," +
							"\"vFecha\" : \"" + beanTurno2.getVfecha() + "\" ," +
							//End of BG001
							"\"estado\" : \"" + beanTurno2.getEstado() + "\" " +
							"},"
							);
				}
			}else {
				objJson1.append("{" +
						"\"idTurno\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);	
			}
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaTurno\": [");
		
				objJson1.append("{" +
						"\"idTurno\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay información disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		}
		
		out.print(strJson2);
		
	}
	
	//Complete -	AUX BG001
	
	//Begin of BG001
	private void saveTurno(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		//Set params
		this.obtenerParametros(req, res, ssf);
		//Prepare writer
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		try {
			BeanTurno beanTurno = new BeanTurno();
			beanTurno.setDescripcion(this.descripcion);
			beanTurno.setHoraInicio(this.timeHoraInicio);
			beanTurno.setHoraFin(this.timeHoraFin);
			beanTurno.setTeam(this.team);
			beanTurno.setOpcion(this.opcion);
			beanTurno.setGturnos(this.gturnos);
			beanTurno.setVfecha(this.vfecha);
			beanTurno.setEstado(1);
			
			BusinessTurno servicio = new BusinessTurno();
			this.resultado = servicio.saveTurno(beanTurno,ssf);
			
			if(this.resultado == 1) {
				this.respuesta = "El registro se realizo satisfactoriamente";	
			}else {
				this.respuesta = "Hubo un error durante el proceso de registro o actualizaci�n";	
			}
			
			//Generar JSON
			objJson1.append("{\"Turno\": [");
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		} catch (Exception e) {
			e.printStackTrace();
			this.resultado = 0;
			this.respuesta = "*Hubo un error durante el proceso de registro o actualizaci�n";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"Turno\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	private void updateTurno(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		//Set params
		this.obtenerParametros(req, res, ssf);
		this.idTurno = Integer.parseInt(req.getParameter("strId"));
		//Prepare writer
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		//Opcion para cambiar el estado
		String stateChange = req.getParameter("strOperacion");
		try {
			BeanTurno beanTurno = new BeanTurno();
			beanTurno.setIdTurno(this.idTurno);
			beanTurno.setDescripcion(this.descripcion);
			beanTurno.setHoraInicio(this.timeHoraInicio);
			beanTurno.setHoraFin(this.timeHoraFin);
			beanTurno.setTeam(this.team);
			beanTurno.setOpcion(this.opcion);
			beanTurno.setGturnos(this.gturnos);
			beanTurno.setVfecha(this.vfecha);
			beanTurno.setEstado(1);
			
			BusinessTurno servicio = new BusinessTurno();
			if (stateChange.equals("DELETE")) {
				this.resultado = servicio.updateTurnoEstado(beanTurno,ssf);
			}else {
				this.resultado = servicio.updateTurno(beanTurno,ssf);
			}
			
			if(this.resultado == 1) {
				this.respuesta = "El registro se actualizo satisfactoriamente";	
			}else {
				this.respuesta = "Hubo un error durante el proceso de actualización";	
			}
			
			//Generar JSON
			objJson1.append("{\"ActualizarTurno\": [");
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		} catch (Exception e) {
			e.printStackTrace();
			this.resultado = 0;
			this.respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"ActualizarTurno\": [");
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	private String splitQueryVariable(String element) {
			String[] aux = element.split(",");
			
			if (aux.length > 1) {
				String result = "";
				for (int i = 0; i < aux.length; i++) {
					
					if (aux.length-i == 1) {
						result += "'"+aux[i]+"'";
					}else {
						result += "'"+aux[i]+"',";
					}
				}
				return result;
			}else if(element.equals("TODOS")){
				/*Case: User could choose option TODOS - Validates in Mapper*/
				return element;
			}else if(element.equals("EMPTY")){
				return "TODOS";
			}else {
				String result = "'"+element+"'";
				return result;
			}
		}
	//End of BG001
	
	
}
