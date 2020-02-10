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

import com.pe.ibm.bean.BeanBackups;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessBackups;
import com.pe.ibm.util.AppUtils;

/**
 * Servlet implementation class ServletSla
 */
@WebServlet("/ServletBackups")
public class ServletBackups extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int strAccion;
//	private int idSla;
	private String userMod;
	private int id;	
	private String schedulername;
	private String ipaddress;
	private String resource;
	private String severidad;
	private String tipo;
	private int severity;
	private int resultado;
	private String respuesta;
	private String perfil;

//	
//	MyBatisUtil objMyBatis = MyBatisUtil.getInstance();
//	SqlSessionFactory ssf= objMyBatis.getSqlSessionFactory();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletBackups() {
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
				
				case 0: //
					propiedadesSession(request, response,ssf);
					break;
				case 1: //
					listar(request, response,ssf);
					break;
				case 2: //Listar Combo Resource ID
					listarComboResource(request, response,ssf);	
					break;
				case 3: //registrar
					registrarBackup(request, response,ssf);
					break;
				case 4: //Actualizar
					actualizarBackup(request, response,ssf);
					break;
				case 5: //Eliminar
					eliminarBackup(request, response,ssf);
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
		//System.out.println("listarGSMALDS");
		try {
			
			BeanBackups bean = new BeanBackups();
			BusinessBackups servicio = new BusinessBackups();
			
			List<BeanBackups> listaBackups = servicio.listar(bean, ssf);
			
			//Generar JSON
			objJson1.append("{\"ListaBackups\": [");
			
			for (BeanBackups beanBackups : listaBackups) {
			

				objJson1.append("{" +
						"\"id\" : \"" + beanBackups.getId()+ "\" ," +
						"\"schedulername\" : \"" + beanBackups.getSchedulername()+ "\" ," +
						"\"ipaddress\" : \"" + beanBackups.getIpaddress().trim()+ "\" ," +
						"\"resource\" : \"" + beanBackups.getResource()+ "\" ," +
						"\"severity\" : \"" + beanBackups.getSeverity()+ "\" ," +
						"\"tipo\" : \"" + beanBackups.getTipo()+ "\" ," +
						"\"severidad\" : \"" + beanBackups.getSeveridad()+ "\" ," +	
						"\"customercode\" : \"" + beanBackups.getCustomercode()+ "\" ," +
						"\"customer\" : \"" + beanBackups.getCustomer()+ "\" " +
						"},"
						);
			}
			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaBackups\": [");
		
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
			BusinessBackups servicio = new BusinessBackups();
			BeanBackups bean = new BeanBackups();
			
			
			List<BeanBackups> listaBackups = servicio.listarcomboresource(bean, ssf);
			
			
			//Generar JSON
			objJson1.append("{\"ListaOption\": [");
			
			for (BeanBackups BeanBackups : listaBackups) {
				objJson1.append("{" +
						"\"idOption\" : \"" + BeanBackups.getResource() + "\" ," +
						"\"descripcion\" : \"" + BeanBackups.getResource() + "\" " +
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
	
	
	private void registrarBackup(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		
		this.schedulername = req.getParameter("strSchedulername");
		this.tipo = req.getParameter("strTipo");
		this.ipaddress = req.getParameter("strIpaddress");	
		this.resource = req.getParameter("strResource");
		this.severity = Integer.parseInt(req.getParameter("strSeverity"));
		
		try {			
					
			BeanBackups bean = new BeanBackups();
			bean.setSchedulername(this.schedulername);
			bean.setIpaddress(this.ipaddress);
			bean.setResource(this.resource);
			bean.setSeverity(this.severity);
			bean.setTipo(this.tipo);
			bean.setUserMod(this.userMod);
			bean.setOperacion("REGISTRAR");
			
			BusinessBackups servicio = new BusinessBackups();
			
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
			objJson1.append("{\"RegistroBackup\": [");
			
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
			objJson1.append("{\"RegistroBackup\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		
		out.print(strJson2);

	}	
	
	
	
	private void actualizarBackup(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		this.id =  Integer.parseInt(req.getParameter("strId"));
		this.schedulername = req.getParameter("strSchedulername");
		this.tipo = req.getParameter("strTipo");
		this.ipaddress = req.getParameter("strIpaddress");	
		this.resource = req.getParameter("strResource");
		this.severity = Integer.parseInt(req.getParameter("strSeverity"));	
		
		try {								
			BeanBackups bean = new BeanBackups();			
			bean.setId(this.id);			
			bean.setSchedulername(this.schedulername);
			bean.setIpaddress(this.ipaddress);
			bean.setResource(this.resource);
			bean.setSeverity(this.severity);
			bean.setTipo(this.tipo);
			bean.setUserMod(this.userMod);
			bean.setOperacion("ACTUALIZAR");
			
			BusinessBackups servicio = new BusinessBackups();
			
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
			objJson1.append("{\"RegistroBackup\": [");
			
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
			objJson1.append("{\"RegistroBackup\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		
		out.print(strJson2);

	}	

	private void eliminarBackup(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		this.id =  Integer.parseInt(req.getParameter("strId"));
		this.schedulername = req.getParameter("strSchedulername");
		this.tipo = req.getParameter("strTipo");
		this.ipaddress = req.getParameter("strIpaddress");	
		this.resource = req.getParameter("strResource");
		this.severity = Integer.parseInt(req.getParameter("strSeverity"));	
		
		try {								
			BeanBackups bean = new BeanBackups();			
			bean.setId(this.id);			
			bean.setSchedulername(this.schedulername);
			bean.setIpaddress(this.ipaddress);
			bean.setResource(this.resource);
			bean.setSeverity(this.severity);
			bean.setTipo(this.tipo);
			bean.setUserMod(this.userMod);
			bean.setOperacion("ELIMINAR");
			
			BusinessBackups servicio = new BusinessBackups();
			
			resultado = servicio.insertar_actualizar(bean,ssf);
			
			if(resultado == 1) {
				respuesta = "El registro se eliminó satisfactoriamente";	
			}			
			else {
				respuesta = "Hubo un error durante el proceso de depuración";	
			}
					
			//Generar JSON
			objJson1.append("{\"RegistroBackup\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + this.resultado + "\" ," +
						"\"resultado\" : \"" + this.respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
			
		}catch(Exception e) {
			e.printStackTrace();
			this.resultado = 2;
			this.respuesta = "*Hubo un error durante el proceso de Depuración";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"RegistroBackup\": [");
			
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
