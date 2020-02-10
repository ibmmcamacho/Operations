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

import com.pe.ibm.bean.BeanSla;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessSla;
import com.pe.ibm.util.AppUtils;

/**
 * Servlet implementation class ServletSla
 */
@WebServlet("/ServletSla")
public class ServletSla extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int strAccion;
//	private int idSla;
	private String userMod;

//	
//	MyBatisUtil objMyBatis = MyBatisUtil.getInstance();
//	SqlSessionFactory ssf= objMyBatis.getSqlSessionFactory();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletSla() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfMaximo");
		//Captura de parametros
				this.strAccion = Integer.parseInt(request.getParameter("strAccion"));
				
				BeanSession objBeanSession = new BeanSession();
				
				HttpSession objSessionLogin = request.getSession(true);
				objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");

				this.userMod = 	objBeanSession.getObjBeanPersonal().getStrNombre().trim() + " " + 
								objBeanSession.getObjBeanPersonal().getStrApPaterno().trim() + " " +
								objBeanSession.getObjBeanPersonal().getStrApMaterno().trim();
				

				switch (this.strAccion){
				case 1: //
					listar(request, response,ssf);
					break;	
				
				}	
		
		
	}

	private void listar(HttpServletRequest request, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		System.out.println("listar");
		try {
			
			String strDesde = request.getParameter("strFechaDesde").toString();
			String strHasta = request.getParameter("strFechaHasta").toString();
			String strtipo = request.getParameter("strtipo");
		//	DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		//	Date dd = formatter.parse(strDesde);
		//	Date hh = formatter.parse(strHasta);
			
			//captura de parametros
			BeanSla bean = new BeanSla();
			bean.setFecha(strDesde);
			bean.setHasta(strHasta);
			bean.setResultado_tar(strtipo);
			
			BusinessSla servicio = new BusinessSla();
			
			List<BeanSla> listaSla = servicio.listar(bean, ssf);
			
			//Generar JSON
			objJson1.append("{\"ListaSla\": [");
			
			for (BeanSla beanSla : listaSla) {
			

				objJson1.append("{" +
						"\"fecha\" : \"" + beanSla.getFecha()+ "\" ," +
						"\"ejecutado_man\" : \"" + beanSla.getEjecutado_man()+ "\" ," +
						"\"tiempo_man\" : \"" + beanSla.getTiempo_man()+ "\" ," +
						"\"total_man\" : \"" + beanSla.getTotal_man()+ "\" ," +
						"\"tickets_man\" : \"" + beanSla.getTickets_man()+ "\" ," +
						"\"porcentaje_man\" : \"" + beanSla.getPorcentaje_man()+ "\" ," +
						"\"ejecutado_tar\" : \"" + beanSla.getEjecutado_tar()+ "\" ," +
						"\"tiempo_tar\" : \"" + beanSla.getTiempo_tar()+ "\" ," +
						"\"total_tar\" : \"" + beanSla.getTotal_tar()+ "\" ," +
						"\"tickets_tar\" : \"" + beanSla.getTickets_tar()+ "\" ," +
						"\"porcentaje_tar\" : \"" + beanSla.getPorcentaje_tar()+ "\" " +				
						"},"
						);
			}
			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaSla\": [");
		
				objJson1.append("{" +
						"\"idSla\" : \"" + ""+ "\" ," +
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
