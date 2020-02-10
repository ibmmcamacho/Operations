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

import com.pe.ibm.bean.BeanAgentStatus;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.bean.BeanUnidadesLogicas;
import com.pe.ibm.business.BusinessAgentStatus;
import com.pe.ibm.business.BusinessUnidadesLogicas;
import com.pe.ibm.util.AppUtils;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

/**
 * Servlet implementation class ServletAgentStatus
 */
@WebServlet("/ServletAgentStatus")
public class ServletAgentStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
		
	private int strAccion;
	private String userMod;
	private int id;	
	private String status;
	private String node;
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
	private JSch mJschSSH = null;
	private Session mSSHSession = null;
	private Channel mSSHChannel = null;
	
	private InputStream mSShInput = null;
	private OutputStream mSSHOutput = null;
	
	public boolean openConnection(String strHost, int iPort, String strUserName, String strPassword, int iTimeout) {
		boolean blResult =false;
		
		this.mJschSSH = new JSch();
		
		java.util.Properties config = new java.util.Properties();
		config.put("StrictHostKeyChecking", "no");
		this.mJschSSH.setConfig(config);
		
		try{
		this.mSSHSession = this.mJschSSH.getSession(strUserName,strHost,iPort);
		this.mSSHSession.setPassword(strPassword);
		this.mSSHSession.connect(iTimeout);
		
		this.mSSHChannel = this.mSSHSession.openChannel("shell");
		
		this.mSSHChannel.connect();
		
		this.mSShInput = this.mSSHChannel.getInputStream();
		this.mSSHOutput = this.mSSHChannel.getOutputStream();
		blResult = true;	
		}
		catch(Exception exp) {
			exp.printStackTrace();
		}
		return blResult;
	}
	
	public boolean sendCommand(String strCommand) {
		boolean blResult = false;
		try {
			if(this.mSSHOutput !=null) {
				Thread.sleep(300);
				this.mSSHOutput.write(strCommand.getBytes());
				this.mSSHOutput.flush();
				blResult = true;
			}
		}
		catch(Exception exp) {
			exp.printStackTrace();
		}
		return blResult;
	}
	public String recvData() {
		String strData = "";
		//String strData2[];
		try {
		//	if(this.mSShInput != null && this.mSSHChannel.getInputStream().available() > 0) {
			if(this.mSShInput != null) {
				
				//InputStream in = this.mSSHChannel.getInputStream();
				int iAvailable = this.mSShInput.available();
				
				while(iAvailable > 0) {
					byte[] btBuffer = new byte[iAvailable];
					
					int iByteRead = this.mSShInput.read(btBuffer);
					iAvailable = iAvailable - iByteRead;
					strData += new String(btBuffer);
					
					//btBuffer.getChars(5, 7, buf, 0);
					//strData = strData.replaceAll("","");
				}
			}
		}
		catch(Exception exp) {
			exp.printStackTrace();
		}
		strData = strData.substring(strData.length()-31,strData.length()-30);
		//strData2  = strData.split("\n");
		return strData;
	}
	
	public void close() {
		if(this.mSSHSession != null) {
			this.mSSHSession.disconnect();
		}
		if(this.mSSHChannel !=null) {
			this.mSSHChannel.isClosed();
		}
		if(this.mSShInput != null) {
			try {
				this.mSShInput.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(this.mSSHOutput != null) {
			try {
				this.mSSHOutput.close();
			}catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		this.mJschSSH = null;
	}
	
	

//	
//	MyBatisUtil objMyBatis = MyBatisUtil.getInstance();
//	SqlSessionFactory ssf= objMyBatis.getSqlSessionFactory();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAgentStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfBdreport");
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
					
				case 2: //
					valida_agente(request, response,ssf);
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
		System.out.println("listarBDREPORT");
		try {
			
			BeanAgentStatus bean = new BeanAgentStatus();
			BusinessAgentStatus servicio = new BusinessAgentStatus();
			
			List<BeanAgentStatus> listaAgentStatus = servicio.listar(bean, ssf);
			
			//Generar JSON
			objJson1.append("{\"ListaAgentStatus\": [");
			
			for (BeanAgentStatus beanAgentStatus : listaAgentStatus) {
			

				objJson1.append("{" +
						"\"status\" : \"" + beanAgentStatus.getStatus()+ "\" ," +
						"\"node\" : \"" + beanAgentStatus.getNode()+ "\" ," +
						"\"nodeb\" : \"" + beanAgentStatus.getNode2()+ "\" ," +
						"\"product\" : \"" + beanAgentStatus.getProduct()+ "\" ," +
						"\"ipaddress\" : \"" + beanAgentStatus.getIpaddress()+ "\" ," +
						"\"hostname\" : \"" + beanAgentStatus.getHostname()+ "\" ," +
						"\"version\" : \"" + beanAgentStatus.getVersion()+ "\" ," +
						"\"hostinfo\" : \"" + beanAgentStatus.getHostinfo()+ "\" ," +
						"\"throughnode\" : \"" + beanAgentStatus.getThroughnode()+ "\" ," +
						"\"heartbeat\" : \"" + beanAgentStatus.getHeartbeat()+ "\" " +
						"},"
						);
			}
			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaAgentStatus\": [");
		
				objJson1.append("{" +
						"\"id\" : \"" + ""+ "\" ," +
						"\"state\" : \"" + "No hay informacion disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	private void valida_agente(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();		
		String resfinal2 = "";
		String resfinal = "";
		
		this.status = req.getParameter("strStatus");
		this.node = req.getParameter("strNode");
		this.node2 = req.getParameter("strNode2");
		this.ipaddress = req.getParameter("strIp");	
		this.hostname = req.getParameter("strHost");	
		this.product = req.getParameter("strProduct");
		this.throughnode = req.getParameter("strThought");		
		this.lenghtnode = node.length();		
		
		System.out.println("VALOR DE NODE2:"+node2+"y el nodo es"+node);
		try {			
			
			if(openConnection("129.39.162.241",22,"ii4ipat1","CGAupc33",120000)) {
				System.out.println("Conectado al servidor 129.39.162.241 \r\n");
				
				
				//sendCommand("/opt/IBM/ITM/bin/tacmd listSystems -n "+node+" \n;");
				//sendCommand("/opt/IBM/ITM/bin/tacmd listSystems -n "+node+" \n;");
				if(!node2.equals("NO TIENE")) {
				sendCommand("/opt/IBM/SCRIPTS/validar_ITM.sh "+node2+" "+product+" "+node+" \n;");
				
				Thread.sleep(4000);
				
				resfinal = recvData().trim();
				System.out.println(resfinal);
				}
				close();
				if(openConnection("129.39.162.249",22,"ii4ipat1","CGAupc33",120000)) {
					System.out.println("Conectado al servidor 129.39.162.249 \r\n");
					sendCommand("sudo /opt/IBM/SCRIPTS/FREEZE/Freeze_PORTAL.sh "+throughnode+" "+node+" "+lenghtnode+" \n;");
					Thread.sleep(4000);
					resfinal2 = recvData().trim();
				close();
				System.out.println(resfinal2);
				}else {
					System.out.println("No se puede conectar");
				}
				
				BeanAgentStatus bean = new BeanAgentStatus();
				bean.setStatus(this.status);
				bean.setNode(this.node);
				bean.setNode2(this.node2);
				bean.setProduct(this.product);
				bean.setThroughnode(this.throughnode);
				bean.setLenghtnode(this.lenghtnode);
				bean.setResultado1(resfinal);
				bean.setResultado2(resfinal2);
				bean.setUsermod(this.userMod);
				
				BusinessAgentStatus servicio = new BusinessAgentStatus();
				resultado = servicio.insertar_auditoria(bean,ssf);		
				
				objJson1.append("{\"ValidacionAgente\": [");
				
				objJson1.append("{" +
						"\"resultado\" : \"" + resfinal + "\" ," +
						"\"resultado2\" : \"" + resfinal2 + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
				
				//System.out.println("Result:" + recvData());
				
			}else {
				System.out.println("No se puede conectar");
			}
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			this.resultado = 2;
			this.respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"ValidacionAgente\": [");
			
				objJson1.append("{" +
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
