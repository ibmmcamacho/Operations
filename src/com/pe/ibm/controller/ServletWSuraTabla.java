package com.pe.ibm.controller;

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

import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.bean.BeanSuraTabla;
import com.pe.ibm.business.BusinessSuraTabla;
import com.pe.ibm.util.AppUtils;

	@WebServlet("/ServletWSuraTabla")
	public class ServletWSuraTabla extends HttpServlet{
		
		private String strAccion;		
		private int team;
		private int user;
		
		  /**
	     * @see HttpServlet#HttpServlet()
	     */	
		
	    public ServletWSuraTabla() {
	        super();
	        // TODO Auto-generated constructor stub
	    }

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			// TODO Auto-generated method stub
				
	    	//Operations
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
			//Maximo
			SqlSessionFactory ssfM = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfMaximo");
			//SmartDesk
			SqlSessionFactory ssfSD = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfCisco");
	    			
	    			//Captura de parametros
	    			this.strAccion = request.getParameter("strAccion");
	    			
	    			BeanSession objBeanSession = new BeanSession();
	    			
	    			HttpSession objSessionLogin = request.getSession(true);
	    			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
	    			
	    			this.team = objBeanSession.getObjBeanPersonal().getiTeam();

	    			
	    			if(this.strAccion.equals("ListTabla1")) {
	    				listTabla1(request, response,ssfM);
	    			}else if(this.strAccion.equals("ListTabla2")) {
	    				listTabla2(request, response,ssfM);
	    			}else if(this.strAccion.equals("ListTabla3")) {
	    				listTabla3(request, response,ssfM);
	    			}else if(this.strAccion.equals("ListReport")) {
	    				listReport(request, response,ssfM);
	    			} else {
	    				System.out.println(strAccion);
	    			}
	    		}
	    
	    
	    
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
		}
	    
	    
	    
	 
	    
	    
	    private void listTabla1(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
			// TODO Auto-generated method stub
			
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			
			try {
				List<BeanSuraTabla> lstBeanSuraTabla = null;
				BusinessSuraTabla objBusinessSuraTabla = new BusinessSuraTabla();
				BeanSuraTabla objBeanSuraTabla = new BeanSuraTabla();

				objBeanSuraTabla.setFechainicio(req.getParameter("FECHAINICIO"));
 				objBeanSuraTabla.setFechafin(req.getParameter("FECHAFIN"));
				
				
				lstBeanSuraTabla = objBusinessSuraTabla.listTabla1(objBeanSuraTabla, ssf);
				
				
				if (lstBeanSuraTabla.size() > 0) {
					strJson1.append("{\"listarTabla1\" : [");
					
					for (BeanSuraTabla item : lstBeanSuraTabla) {
						strJson1.append("{" +
						"\"Prioridad\" : \"" + item.getsValor1() + "\" ,"+
						"\"Indicador\" : \"" + item.getIndicador() + "\" ,"+
						"\"Sla\" : \"" + item.getSla() + "\","+					
						"\"Cumple\" : \"" + item.getCumple() + "\","+
						"\"NoCumple\" : \"" + item.getNocumple() + "\","+
						"\"Total\" : \"" + item.getTotal() + "\","+					
						"\"TasaDePenalidad\" : \"" + item.getTasadepenalidad() + "\""+
									
						"},"
						);
					}
				}else {

					strJson1.append("{\"listarTabla1\": [");
					strJson1.append("{" +
							"\"Indicador\" : \"" + "No hay registros" + "\" " +
							"},"
							);
				} 
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
				
			}catch (Exception e) {
				e.printStackTrace();
				strJson1.append("{\"listarTabla1\": [");
				strJson1.append("{" +
						"\"Indicador\" : \"" + "No hay registros" + "\" " +
						"},"
						);
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			}
			out.print(strJson2);
		}
	    
	    
	    
	    
	    
	    
	    private void listTabla2(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
			// TODO Auto-generated method stub
			
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			
			try {
				List<BeanSuraTabla> lstBeanSuraTabla = null;
				BusinessSuraTabla objBusinessSuraTabla = new BusinessSuraTabla();
				BeanSuraTabla objBeanSuraTabla = new BeanSuraTabla();

				objBeanSuraTabla.setFechainicio(req.getParameter("FECHAINICIO"));
 				objBeanSuraTabla.setFechafin(req.getParameter("FECHAFIN"));
				
				lstBeanSuraTabla = objBusinessSuraTabla.listTabla2(objBeanSuraTabla, ssf);
				
				
				if (lstBeanSuraTabla.size() > 0) {
					strJson1.append("{\"listarTabla2\" : [");
					
					for (BeanSuraTabla item : lstBeanSuraTabla) {
						strJson1.append("{" +
								"\"Prioridad\" : \"" + item.getsValor1() + "\" ,"+
								"\"Indicador\" : \"" + item.getIndicador() + "\" ,"+
								"\"Sla\" : \"" + item.getSla() + "\","+					
								"\"Cumple\" : \"" + item.getCumple() + "\","+
								"\"NoCumple\" : \"" + item.getNocumple() + "\","+
								"\"Total\" : \"" + item.getTotal() + "\","+					
								"\"TasaDePenalidad\" : \"" + item.getTasadepenalidad() + "\""+
									
						"},"
						);
					}
				}else {

					strJson1.append("{\"listarTabla2\": [");
					strJson1.append("{" +
							"\"Indicador\" : \"" + "No hay registros" + "\" " +
							"},"
							);
				} 
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
				
			}catch (Exception e) {
				e.printStackTrace();
				strJson1.append("{\"listarTabla2\": [");
				strJson1.append("{" +
						"\"Indicador\" : \"" + "No hay registros" + "\" " +
						"},"
						);
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			}
			out.print(strJson2);
		}
	    
	    
	    private void listTabla3(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
	 			// TODO Auto-generated method stub
	 			
	 			StringBuilder strJson1 = new StringBuilder();
	 			StringBuilder strJson2 = new StringBuilder();
	 			res.setCharacterEncoding("UTF-8");
	 			PrintWriter out = res.getWriter();
	 			
	 			
	 			try {
	 				List<BeanSuraTabla> lstBeanSuraTabla = null;
	 				BusinessSuraTabla objBusinessSuraTabla = new BusinessSuraTabla();
	 				BeanSuraTabla objBeanSuraTabla = new BeanSuraTabla();

	 				objBeanSuraTabla.setFechainicio(req.getParameter("FECHAINICIO"));
	 				objBeanSuraTabla.setFechafin(req.getParameter("FECHAFIN"));
	 				
	 				lstBeanSuraTabla = objBusinessSuraTabla.listTabla3(objBeanSuraTabla, ssf);
	 				
	 				
	 				if (lstBeanSuraTabla.size() > 0) {
	 					strJson1.append("{\"listarTabla3\" : [");
	 					
	 					for (BeanSuraTabla item : lstBeanSuraTabla) {
	 						strJson1.append("{" +
	 								"\"Prioridad\" : \"" + item.getsValor1() + "\" ,"+
	 								"\"Indicador\" : \"" + item.getIndicador() + "\" ,"+
	 								"\"Sla\" : \"" + item.getSla() + "\","+					
	 								"\"Cumple\" : \"" + item.getCumple() + "\","+
	 								"\"NoCumple\" : \"" + item.getNocumple() + "\","+
	 								"\"Total\" : \"" + item.getTotal() + "\","+					
	 								"\"TasaDePenalidad\" : \"" + item.getTasadepenalidad() + "\""+
	 									
	 						"},"
	 						);
	 					}
	 				}else {

	 					strJson1.append("{\"listarTabla3\": [");
	 					strJson1.append("{" +
	 							"\"Indicador\" : \"" + "No hay registros" + "\" " +
	 							"},"
	 							);
	 				} 
	 				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
	 				
	 			}catch (Exception e) {
	 				e.printStackTrace();
	 				strJson1.append("{\"listarTabla3\": [");
	 				strJson1.append("{" +
	 						"\"Indicador\" : \"" + "No hay registros" + "\" " +
	 						"},"
	 						);
	 				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
	 			}
	 			out.print(strJson2);
	 		}
	    
	    
	    
	    
	    
	    private void listReport(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
 			// TODO Auto-generated method stub
 			
 			StringBuilder strJson1 = new StringBuilder();
 			StringBuilder strJson2 = new StringBuilder();
 			res.setCharacterEncoding("UTF-8");
 			PrintWriter out = res.getWriter();
 			
 			
 			try {
 				
 				
 				List<BeanSuraTabla> lstBeanSuraTabla = null;
 				BusinessSuraTabla objBusinessSuraTabla = new BusinessSuraTabla();
 				BeanSuraTabla objBeanSuraTabla = new BeanSuraTabla();
 				BeanSuraTabla BeanSuraTabla = new BeanSuraTabla();

 				objBeanSuraTabla.setParametro1(req.getParameter("TABLA"));
 				objBeanSuraTabla.setParametro2(req.getParameter("PRIORIDAD"));
 				
 				objBeanSuraTabla.setFechainicio(req.getParameter("FECHAINICIO"));
 				objBeanSuraTabla.setFechafin(req.getParameter("FECHAFIN"));
 				
 				lstBeanSuraTabla = objBusinessSuraTabla.listReport(objBeanSuraTabla, ssf);
 				
 				if (lstBeanSuraTabla.size() > 0) {
 					strJson1.append("{\"listReport\" : [");
 					
 					for (BeanSuraTabla item : lstBeanSuraTabla) {
 						strJson1.append("{" +
 						"\"CodTicket\" : \"" + item.getsValor1() + "\" ,"+
 						"\"Summary\" : \"" + AppUtils.cleanString(item.getsValor2()) + "\","+					
 						"\"Creator\" : \"" + item.getsValor3() + "\","+
 						"\"AffectedPerson\" : \"" + item.getsValor4() + "\","+
 						"\"CreationDate\" : \"" + item.getsValor5() + "\","+		
 						"\"OwnerGroup\" : \"" + item.getsValor6() + "\" ,"+
 						"\"InternalPriority\" : \"" + item.getsValor7() + "\","+					
 						"\"OwnerId\" : \"" + item.getsValor8() + "\","+
 						"\"Owner\" : \"" + item.getsValor9() + "\","+
 						"\"Status\" : \"" + item.getsValor10() + "\","+
 						"\"Worklog\" : \"" +  AppUtils.cleanString(item.getsValor11()) + "\","+
 						"\"TimeToResolve\" : \"" + item.getsValor12() + "\","+ 						
 						"\"Class\" : \"" + item.getsValor13() + "\","+
 						"\"ComplianceSlaDispatch\" : \"" + item.getsValor14() + "\","+
 						"\"ComplianceSlaResolve\" : \"" + item.getsValor15() + "\""+
 						"},"
 						);
 					}
 				}else {

 					strJson1.append(",");
// 					strJson1.append("{\"listReport\": [");
// 					strJson1.append("{" +
// 							"\"Indicador\" : \"" + "No hay registros" + "\" " +
// 							"},"
// 							);
 				}
 				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");

 			}catch (Exception e) {
 				e.printStackTrace();
 				strJson1.append("{\"listReport\": [");
 				strJson1.append("{" +
 						"\"Indicador\" : \"" + "No hay registros" + "\" " +
 						"},"
 						);
 				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
 			}
 			out.print(strJson2);
 		}

}
	
