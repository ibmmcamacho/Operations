package com.pe.ibm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanScheduleActividad;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.bean.BeanTarea;
import com.pe.ibm.bean.BeanTareaAsignada;
import com.pe.ibm.bean.BeanTurno;
import com.pe.ibm.business.BusinessTarea;
import com.pe.ibm.business.BusinessTurno;

/**
 * Servlet implementation class ServletTurno
 */
@WebServlet("/ServletSesion")
public class ServletSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int accion;
	private int idTareaGenerada;
	private int idTarea;
	private int idTipoTarea;
	private String tarea;
	private int idOwner;
	private int idAprobador;
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
	private String team;
	private int iteam;

		
		
//	MyBatisUtil objMyBatis = MyBatisUtil.getInstance();
//	SqlSessionFactory ssf= objMyBatis.getSqlSessionFactory();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSesion() {
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
		
		this.team = objBeanSession.getObjBeanPersonal().getStrTeam();
		
		this.iteam = objBeanSession.getObjBeanPersonal().getiTeam();
				
				
		switch (this.accion){
		
		case 0: //Listar todas las tareas - MANTENIMIENTO
			propiedadesSession(request, response,ssf);
//			registrarTurno(request, response,ssf);	
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
	
	
	private void propiedadesSession(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
			
			//Generar JSON
			objJson1.append("{\"Sesion\": [");
			
				objJson1.append("{" +
						"\"perfil\" : \"" + this.perfil + "\" ," +
						"\"team\" : \"" + this.team + "\" ,"  +
						"\"iteam\" : \"" + this.iteam + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		
		out.print(strJson2);

	}
	
	
	
}
