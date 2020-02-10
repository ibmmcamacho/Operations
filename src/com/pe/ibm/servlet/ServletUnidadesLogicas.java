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

import com.pe.ibm.bean.BeanUnidadesLogicas;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.bean.BeanTurno;
import com.pe.ibm.business.BusinessOptions;
import com.pe.ibm.business.BusinessTurno;
import com.pe.ibm.business.BusinessUnidadesLogicas;
import com.pe.ibm.util.AppUtils;

/**
 * Servlet implementation class ServletSla
 */
@WebServlet("/ServletUnidadesLogicas")
public class ServletUnidadesLogicas extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int strAccion;
//	private int idSla;
	private String userMod;
	private int id;
	private String resource;
	private String ip;
	private String tower;
	private String disk;
	private int resultado;
	private String respuesta;
	private String perfil;

//	
//	MyBatisUtil objMyBatis = MyBatisUtil.getInstance();
//	SqlSessionFactory ssf= objMyBatis.getSqlSessionFactory();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletUnidadesLogicas() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfGsmalds");
		//Captura de parametros
				this.strAccion = Integer.parseInt(request.getParameter("strAccion"));
				
				BeanSession objBeanSession = new BeanSession();
				
				HttpSession objSessionLogin = request.getSession(true);
				objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");

				this.userMod = 	objBeanSession.getObjBeanPersonal().getStrNombre().trim() + " " + 
								objBeanSession.getObjBeanPersonal().getStrApPaterno().trim() + " " +
								objBeanSession.getObjBeanPersonal().getStrApMaterno().trim();
				
				this.perfil = objBeanSession.getObjBeanPersonal().getStrPerfil();
				

				switch (this.strAccion){
				
				case 0: //Listar todas las tareas - MANTENIMIENTO
					propiedadesSession(request, response,ssf);
					break;
					
				case 1: //
					listar(request, response,ssf);
					break;
				case 2: //Listar Combo Resource ID
					listarComboResource(request, response,ssf);	
					break;
				case 3: //registrar
					registrarUnidadLogica(request, response,ssf);
					break;
				case 4: //Actualizar
					actualizarUnidadLogica(request, response,ssf);
					break;				
				case 5: //Actualizar
					eliminarUnidadLogica(request, response,ssf);
					break;	
				
				}	
		
		
	}
	
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

	private void listar(HttpServletRequest request, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		System.out.println("listarGSMALDS");
		try {
			
		//	String strDesde = request.getParameter("strFechaDesde").toString();
		//	String strHasta = request.getParameter("strFechaHasta").toString();
		//	String strtipo = request.getParameter("strtipo");
		//	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		//	Date dd = formatter.parse(strDesde);
		//	Date hh = formatter.parse(strHasta);
			
			//captura de parametros
			BeanUnidadesLogicas bean = new BeanUnidadesLogicas();
			//bean.setFecha(strDesde);
			//bean.setHasta(strHasta);
			//bean.setResultado_tar(strtipo);
			
			BusinessUnidadesLogicas servicio = new BusinessUnidadesLogicas();
			
			List<BeanUnidadesLogicas> listaUnidadesLogicas = servicio.listar(bean, ssf);
			
			//Generar JSON
			objJson1.append("{\"ListaUnidadesLogicas\": [");
			
			for (BeanUnidadesLogicas beanUnidadesLogicas : listaUnidadesLogicas) {
			

				objJson1.append("{" +
						"\"id\" : \"" + beanUnidadesLogicas.getId()+ "\" ," +
						"\"resource_id\" : \"" + beanUnidadesLogicas.getResourceid()+ "\" ," +
						"\"ip\" : \"" + beanUnidadesLogicas.getIp()+ "\" ," +
						"\"tower\" : \"" + beanUnidadesLogicas.getTower()+ "\" ," +
						"\"towerdesc\" : \"" + beanUnidadesLogicas.getTowerdesc()+ "\" ," +
						"\"disk\" : \"" + beanUnidadesLogicas.getDisk()+ "\" ," +
						"\"customercode\" : \"" + beanUnidadesLogicas.getCustomercode()+ "\" ," +
						"\"customer\" : \"" + beanUnidadesLogicas.getCustomer()+ "\" " +
						"},"
						);
			}
			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaUnidadesLogicas\": [");
		
				objJson1.append("{" +
						"\"id\" : \"" + ""+ "\" ," +
						"\"state\" : \"" + "No hay informacion disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	
	
	
	
	
	
	
	
	private void listarComboResource(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		try {
			//Instancear metodos 
			BusinessUnidadesLogicas servicio = new BusinessUnidadesLogicas();
			BeanUnidadesLogicas bean = new BeanUnidadesLogicas();
			
			
			List<BeanUnidadesLogicas> listaUnidadesLogicas = servicio.listarcomboresource(bean, ssf);
			
			
			//Generar JSON
			objJson1.append("{\"ListaOption\": [");
			
			for (BeanUnidadesLogicas BeanUnidadesLogicas : listaUnidadesLogicas) {
				objJson1.append("{" +
						"\"idOption\" : \"" + BeanUnidadesLogicas.getResourceid() + "\" ," +
						"\"descripcion\" : \"" + BeanUnidadesLogicas.getResourceid() + "\" " +
						"},"
						);
			}

			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaOption\": [");
		
			objJson1.append("{" +
					"\"idOption\" : \"" + "" + "\" ," +
					"\"descripcion\" : \"" + "No hay informaci�n disponible" + "\" " +
					"},"
					);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		}
		
		out.print(strJson2);
		
	}
	
	
	private void registrarUnidadLogica(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		
		this.resource = req.getParameter("strResource");
		this.ip = req.getParameter("strIp");	
		this.tower = req.getParameter("strTower");	
		this.disk = req.getParameter("strDisk");	
		
		try {			
					
			BeanUnidadesLogicas bean = new BeanUnidadesLogicas();
			bean.setResourceid(this.resource);
			bean.setIp(this.ip);
			bean.setTower(this.tower);
			bean.setDisk(this.disk);
			bean.setUserMod(this.userMod);
			bean.setOperacion("REGISTRAR");
			
			BusinessUnidadesLogicas servicio = new BusinessUnidadesLogicas();
			
			resultado = servicio.insertar_actualizar(bean,ssf);
			
			if(resultado == 1) {
				respuesta = "El registro se realizo satisfactoriamente";	
			}else if(resultado == 0){
				respuesta = "El registro ingresado ya existe";
			}			
			else {
				respuesta = "Hubo un error durante el proceso de registro o actualización";	
			}
					
			//Generar JSON
			objJson1.append("{\"RegistroUnidadLogica\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			this.resultado = 2;
			this.respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"RegistroUnidadLogica\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		
		out.print(strJson2);

	}	
	
	
	
	private void actualizarUnidadLogica(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		this.id =  Integer.parseInt(req.getParameter("strId"));
		this.resource = req.getParameter("strResource");
		this.ip = req.getParameter("strIp");	
		this.tower = req.getParameter("strTower");	
		this.disk = req.getParameter("strDisk");	
		
		try {								
			BeanUnidadesLogicas bean = new BeanUnidadesLogicas();			
			bean.setId(this.id);			
			bean.setResourceid(this.resource);
			bean.setIp(this.ip);
			bean.setTower(this.tower);
			bean.setDisk(this.disk);
			bean.setUserMod(this.userMod);
			bean.setOperacion("ACTUALIZAR");
			
			BusinessUnidadesLogicas servicio = new BusinessUnidadesLogicas();
			
			resultado = servicio.insertar_actualizar(bean,ssf);
			
			if(resultado == 1) {
				respuesta = "El registro se actualizo satisfactoriamente";	
			}else if(resultado == 0){
				respuesta = "El registro ingresado ya existe";
			}			
			else {
				respuesta = "Hubo un error durante el proceso de registro o actualización";	
			}
					
			//Generar JSON
			objJson1.append("{\"RegistroUnidadLogica\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			this.resultado = 2;
			this.respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"RegistroUnidadLogica\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		
		out.print(strJson2);

	}
	
	private void eliminarUnidadLogica(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		this.id =  Integer.parseInt(req.getParameter("strId"));
		this.resource = req.getParameter("strResource");
		this.ip = req.getParameter("strIp");	
		this.tower = req.getParameter("strTower");	
		this.disk = req.getParameter("strDisk");	
		
		try {								
			BeanUnidadesLogicas bean = new BeanUnidadesLogicas();			
			bean.setId(this.id);			
			bean.setResourceid(this.resource);
			bean.setIp(this.ip);
			bean.setTower(this.tower);
			bean.setDisk(this.disk);
			bean.setUserMod(this.userMod);
			bean.setOperacion("ELIMINAR");
			
			BusinessUnidadesLogicas servicio = new BusinessUnidadesLogicas();
			
			resultado = servicio.insertar_actualizar(bean,ssf);
			
			if(resultado == 1) {
				respuesta = "El registro se Elimino satisfactoriamente";	
			}			
			else {
				respuesta = "Hubo un error durante el proceso de Depuración";	
			}
					
			//Generar JSON
			objJson1.append("{\"RegistroUnidadLogica\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			this.resultado = 2;
			this.respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"RegistroUnidadLogica\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
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


	
}
