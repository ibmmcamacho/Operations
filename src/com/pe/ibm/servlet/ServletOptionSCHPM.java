package com.pe.ibm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessOptions;

/**
 * Servlet implementation class ServletOption
 */
@WebServlet("/ServletOptionSCHPM")
public class ServletOptionSCHPM extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int accion;
	private String tipo;
	private int team;
	private int iValor1;
	private String valor1 = "";
	private String strTeam = "";
	
//	MyBatisUtil objMyBatis = MyBatisUtil.getInstance();
//	SqlSessionFactory ssf= objMyBatis.getSqlSessionFactory();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletOptionSCHPM() {
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
				this.accion = Integer.parseInt(request.getParameter("strAccion"));
				
				BeanSession objBeanSession = new BeanSession();
				
				HttpSession objSessionLogin = request.getSession(true);
				objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			
				this.team = objBeanSession.getObjBeanPersonal().getiTeam();
				this.strTeam = objBeanSession.getObjBeanPersonal().getStrTeam();

				switch (this.accion){
				
				case 1: //listar Plataforma
					this.tipo = "SCHEDWEB_PLATAFORMA";
					break;
				case 2: //listar Tipo Respaldo
					this.tipo = "SCHEDWEB_TIPORESPALDO";
					break;
				case 3: //listar Cliente
					this.tipo = "SCHEDWEB_CLIENTE";
					break;
				case 4: //Listar Procedimiento
					this.tipo = "SCHEDWEB_PROCED";	
					break;
				case 5: //Listar Sede
					this.tipo = "SCHEDWEB_SEDE";	
					break;
				case 6: //Listar Servidor
					this.tipo = "SCHEDWEB_SERVIDOR";	
					break;
				case 7: //Listar Tipo Actividad
					this.tipo = "SCHEDWEB_TIPOACTIVIDAD";	
					break;
				case 8: //Listar Tipo Tarea
					this.tipo = "TIPO DE TAREA";	
					break;
				case 9: //Listar Owner
					this.tipo = "CARGO";	
					break;
				}
			
				
				listarOption(request,response,ssf);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void listarOption(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		try {
			//Instancear metodos 
			BusinessOptions servicio = new BusinessOptions();
			BeanParameters beanParameter = new BeanParameters();
			beanParameter.setStrTeam(this.strTeam);	
			beanParameter.setStrType(this.tipo);
			
			
			
			List<BeanOptions> listaOption;
			
			if(this.strTeam == "INDIA" ) {
				beanParameter.setStrTeam("SYSOPS");	
			}
		
			listaOption = servicio.listOptions7(beanParameter,ssf);	
			
			//Generar JSON
			objJson1.append("{\"ListaOption\": [");
			
			if(listaOption.size() > 0) {
				for (BeanOptions beanOption : listaOption) {
					objJson1.append("{" +
							"\"idOption\" : \"" + beanOption.getiIdOption() + "\" ," +
							"\"descripcion\" : \"" + beanOption.getStrDescripcion() + "\" " +
							"},"
							);
				}	
			}else {
					objJson1.append("{" +
							"\"idOption\" : \"" + "" + "\" ," +
							"\"descripcion\" : \"" + "No hay información disponible" + "\" " +
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
					"\"descripcion\" : \"" + "No hay información disponible" + "\" " +
					"},"
					);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		}
		
		out.print(strJson2);
		
	}

}
