package com.pe.ibm.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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

import com.pe.ibm.bean.BeanBlackout;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessBlackout;
import com.pe.ibm.util.AppUtils;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

/**
 * Servlet implementation class ServletAgentStatus
 */
@WebServlet("/ServletBlackout")
public class ServletBlackout extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
	private int strAccion;
	private String userMod;
	private int id;	
	private String desc;
	private String desc2;
	private String node2;
	private String product;
	private String ipaddress;
	private String hostname;
	private String version;
	private String hostinfo;
	private String throughnode;
	private String heartbeat;
	private int resultado;
	private String respuesta;
	private String perfil;
	private int lenghtnode;	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletBlackout() {
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
		System.out.println("listarBlackout");
		try {
			
			BeanBlackout bean = new BeanBlackout();
			BusinessBlackout servicio = new BusinessBlackout();
			
			List<BeanBlackout> listaBlackout = servicio.listar(bean, ssf);
			
			//Generar JSON
			objJson1.append("{\"ListaBlackout\": [");
			
			for (BeanBlackout beanBlackout : listaBlackout) {
				
				
				objJson1.append("{" +
						"\"tipo\" : \"" + beanBlackout.getTipo()+ "\" ," +
						"\"inicio\" : \"" + beanBlackout.getInicio()+ "\" ," +
						"\"suppressend\" : \"" + beanBlackout.getSuppressend()+ "\" ," +
						"\"changenumber\" : \"" +String.valueOf(beanBlackout.getChangenumber()).replaceAll("\\\\", "")+ "\" ," +
						"\"description\" : \"" +String.valueOf(beanBlackout.getDescription()).replaceAll("[  \\\\\\\\]", "")+ "\" ," +
						"\"customercode\" : \"" + beanBlackout.getCustomercode()+ "\" ," +
						"\"duration\" : \"" + beanBlackout.getDuration()+ "\" ," +
						"\"originator\" : \"" + beanBlackout.getOriginator()+ "\" ," +
						"\"resourceid\" : \"" + beanBlackout.getResourceid()+ "\" ," +
						"\"component\" : \"" + beanBlackout.getComponent()+ "\" ," +
						"\"componenttype\" : \"" + beanBlackout.getComponenttype()+ "\" ," +
						"\"applid\" : \"" + beanBlackout.getApplid()+ "\" ," +
						"\"instanceid\" : \"" + beanBlackout.getInstanceid()+ "\" " +						
						"},"
						);
			}
			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaBlackout\": [");
		
				objJson1.append("{" +
						"\"id\" : \"" + ""+ "\" ," +
						"\"state\" : \"" + "No hay informacion disponible"+ "\" " +
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
