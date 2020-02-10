
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

import com.pe.ibm.bean.BeanRCT;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.bean.BeanTablero;
import com.pe.ibm.business.BusinessRCT;
import com.pe.ibm.business.BussinesTablero;
import com.pe.ibm.util.AppUtils;

@WebServlet("/ServletTablero")
public class ServletTablero extends HttpServlet{
	
	private String strAccion;

	private String Tribu;
	private String Squad;
	private String Cliente;
	
	private String GrupoOwner;
	private String Owner;
	private String Class;
	private String Status;
	private int team;
	private String Team;
	
	private String FechaInicio;
	private String FechaFin;
	private String Site;
	
	  /**
     * @return 
	 * @see HttpServlet#HttpServlet()
     */	
	
  
	
	  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

	    			
	    			if(this.strAccion.equals("CboSquad")) {
	    				cboSquad(request, response,ssfM);
	    			}else if(this.strAccion.equals("CboTribu")) {
	    				cboTribu(request, response,ssfM);
	    			}else if(this.strAccion.equals("CboTeam")) {
	    				cboTeam(request, response,ssfM);
	    			}else if(this.strAccion.equals("CboGroupOwner")) {
	    				cboGroupOwner(request, response,ssfM);
	    			}else if(this.strAccion.equals("CboOwner")) {
	    				cboOwner(request, response,ssfM);
	    			}else if(this.strAccion.equals("CboClassTicket")) {
	    				cboClassTicket(request, response,ssfM);
	    			}else if(this.strAccion.equals("CboSelectStatus")) {
	    				cboSelectStatus(request, response,ssfM);
	    			}else if(this.strAccion.equals("ListReportT3")) {
	    				listReportT3(request, response,ssfM);
	    			}else if(this.strAccion.equals("ListReportT2")) {
	    				listReportT2(request, response,ssfM);
	    			}else if(this.strAccion.equals("ListReportT1")) {
	    				listReportT1(request, response,ssfM);
	    			}
	    			else {
	    				System.out.println(strAccion);
	    			}
	    		}
	    
	  
	    
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			// TODO Auto-generated method stub
			doGet(request, response);
		}
	    
	    
	  
	    
	    private void cboTribu(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
			// TODO Auto-generated method stub
			
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			
			try {
				List<BeanTablero> lstBeanTablero = null;
				BussinesTablero objBusinessTablero = new BussinesTablero();
				BeanTablero objBeanTablero = new BeanTablero();
		
				
				
				
				lstBeanTablero = objBusinessTablero.cboTribu(objBeanTablero, ssf);
				
				if (lstBeanTablero.size() > 0) {
					strJson1.append("{\"cboTribu\" : [");
					for (BeanTablero item : lstBeanTablero) {
						strJson1.append("{" +
						"\"Tribu\" : \"" + item.getTribu() + "\" "+											
						"},"
						);
					}
				}else {
					strJson1.append("{\"cboTribu\": [");
					strJson1.append("{" +
							"\"Tribu\" : \"" + "No hay registros" + "\" " +
							"},"
							);
				} 
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
				
			}catch (Exception e) {
				e.printStackTrace();
				strJson1.append("{\"cboTribu\": [");
				strJson1.append("{" +
						"\"Tribu\" : \"" + "No hay registros" + "\" " +
						"},"
						);
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			}
			out.print(strJson2);
		}
	    
	    
	    private void cboSquad(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
			// TODO Auto-generated method stub
			
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			
			try {
				List<BeanTablero> lstBeanTablero = null;
				BussinesTablero objBusinessTablero = new BussinesTablero();
				BeanTablero objBeanTablero = new BeanTablero();
				
				BeanSession objBeanSession = new BeanSession();			
				HttpSession objSessionLogin = req.getSession(false);
				objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
				
				this.Tribu = req.getParameter("TRIBU");
				objBeanTablero.setTribu(this.Tribu.equals("0") ? null : splitQueryVariable(this.Tribu));
				
				
				lstBeanTablero = objBusinessTablero.cboSquad(objBeanTablero, ssf);
				
				if (lstBeanTablero.size() > 0) {
					strJson1.append("{\"cboSquad\" : [");
					for (BeanTablero item : lstBeanTablero) {
						strJson1.append("{" +
						"\"Squad\" : \"" + item.getSquad() + "\" "+
											
						"},"
						);
					}
				}else {
					strJson1.append("{\"cboSquad\": [");
					strJson1.append("{" +
							"\"Squad\" : \"" + "No hay registros" + "\" " +
							"},"
							);
				} 
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
				
			}catch (Exception e) {
				e.printStackTrace();
				strJson1.append("{\"cboSquad\": [");
				strJson1.append("{" +
						"\"Squad\" : \"" + "No hay registros" + "\" " +
						"},"
						);
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			}
			out.print(strJson2);
		}
	    
	    
	    

	    
	    
	    private void cboTeam(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
			// TODO Auto-generated method stub
			
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			
			try {
				List<BeanTablero> lstBeanTablero = null;
				BussinesTablero objBusinessTablero = new BussinesTablero();
				BeanTablero objBeanTablero = new BeanTablero();
				
				BeanSession objBeanSession = new BeanSession();			
				HttpSession objSessionLogin = req.getSession(false);
				objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
				
				this.Squad = req.getParameter("SQUAD");
				objBeanTablero.setSquad(this.Squad.equals("0") ? null : splitQueryVariable(this.Squad));
				
				lstBeanTablero = objBusinessTablero.cboTeam(objBeanTablero, ssf);
				
				if (lstBeanTablero.size() > 0) {
					strJson1.append("{\"cboTeam\" : [");
					for (BeanTablero item : lstBeanTablero) {
						strJson1.append("{" +
						"\"Team\" : \"" + item.getTeam() + "\""+
						
						"},"
						);
					}
				}else {
					strJson1.append("{\"cboTeam\": [");
					strJson1.append("{" +
							"\"Team\" : \"" + "No hay registros" + "\" " +
							"},"
							);
				} 
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
				
			}catch (Exception e) {
				e.printStackTrace();
				strJson1.append("{\"cboTeam\": [");
				strJson1.append("{" +
						"\"Team\" : \"" + "No hay registros" + "\" " +
						"},"
						);
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			}
			out.print(strJson2);
		}
	    
	    
	    private void cboGroupOwner(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
			// TODO Auto-generated method stub
			
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			
			try {
				List<BeanTablero> lstBeanTablero = null;
				BussinesTablero objBusinessTablero = new BussinesTablero();
				BeanTablero objBeanTablero = new BeanTablero();
				
				BeanSession objBeanSession = new BeanSession();			
				HttpSession objSessionLogin = req.getSession(false);
				objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
				
				this.Team = req.getParameter("TEAM");
				objBeanTablero.setTeam(this.Team.equals("0") ? null : splitQueryVariable(this.Team));
				
				lstBeanTablero = objBusinessTablero.cboGroupOwner(objBeanTablero, ssf);
				
				if (lstBeanTablero.size() > 0) {
					strJson1.append("{\"cboGroupOwner\" : [");
					for (BeanTablero item : lstBeanTablero) {
						strJson1.append("{" +
						"\"IdGroupOwner\" : \"" + item.getIdGrupoOwner() + "\", "+
						"\"GroupOwner\" : \"" + item.getGrupoOwner() + "\" "+
						"},"
						);
					}
				}else {
					strJson1.append("{\"cboGroupOwner\": [");
					strJson1.append("{" +
							"\"IdGroupOwner\" : \"" + "No hay registros" + "\" " +
							"},"
							);
				} 
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
				
			}catch (Exception e) {
				e.printStackTrace();
				strJson1.append("{\"cboGroupOwner\": [");
				strJson1.append("{" +
						"\"IdGroupOwner\" : \"" + "No hay registros" + "\" " +
						"},"
						);
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			}
			out.print(strJson2);
		}
	    
	    
	    
	    
	    private void cboOwner(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
			// TODO Auto-generated method stub
			
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			
			try {
				List<BeanTablero> lstBeanTablero = null;
				BussinesTablero objBusinessTablero = new BussinesTablero();
				BeanTablero objBeanTablero = new BeanTablero();
				
				BeanSession objBeanSession = new BeanSession();			
				HttpSession objSessionLogin = req.getSession(false);
				objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
				
				this.Team = req.getParameter("TEAM");
				objBeanTablero.setIdGrupoOwner(this.Team.equals("0") ? null : splitQueryVariable(this.Team));
				
				lstBeanTablero = objBusinessTablero.cboOwner(objBeanTablero, ssf);
				
				if (lstBeanTablero.size() > 0) {
					strJson1.append("{\"cboOwner\" : [");
					for (BeanTablero item : lstBeanTablero) {
						strJson1.append("{" +
						"\"IdOwner\" : \"" + item.getIdOwner() + "\", "+
						"\"Owner\" : \"" + item.getOwner() + "\" "+
						"},"
						);
					}
				}else {
					strJson1.append("{\"cboOwner\": [");
					strJson1.append("{" +
							"\"IdOwner\" : \"" + "No hay registros" + "\" " +
							"},"
							);
				} 
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
				
			}catch (Exception e) {
				e.printStackTrace();
				strJson1.append("{\"cboOwner\": [");
				strJson1.append("{" +
						"\"IdOwner\" : \"" + "No hay registros" + "\" " +
						"},"
						);
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			}
			out.print(strJson2);
		}
	    
	    
	    
	    private void cboClassTicket(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
			// TODO Auto-generated method stub
			
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			
			try {
				List<BeanTablero> lstBeanTablero = null;
				BussinesTablero objBusinessTablero = new BussinesTablero();
				BeanTablero objBeanTablero = new BeanTablero();
				
				BeanSession objBeanSession = new BeanSession();			
				HttpSession objSessionLogin = req.getSession(false);
				objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");				
				
				lstBeanTablero = objBusinessTablero.cboClassTicket(objBeanTablero, ssf);
				
				if (lstBeanTablero.size() > 0) {
					strJson1.append("{\"cboClassTicket\" : [");
					for (BeanTablero item : lstBeanTablero) {
						strJson1.append("{" +
						"\"TipoTicket\" : \"" + item.getTipoTicket() + "\" "+
						
						"},"
						);
					}
				}else {
					strJson1.append("{\"cboClassTicket\": [");
					strJson1.append("{" +
							"\"TipoTicket\" : \"" + "No hay registros" + "\" " +
							"},"
							);
				} 
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
				
			}catch (Exception e) {
				e.printStackTrace();
				strJson1.append("{\"cboClassTicket\": [");
				strJson1.append("{" +
						"\"TipoTicket\" : \"" + "No hay registros" + "\" " +
						"},"
						);
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			}
			out.print(strJson2);
		}
	    
	    
	    
	    
	    private void cboSelectStatus(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
			// TODO Auto-generated method stub
			
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			
			try {
				List<BeanTablero> lstBeanTablero = null;
				BussinesTablero objBusinessTablero = new BussinesTablero();
				BeanTablero objBeanTablero = new BeanTablero();
				
				BeanSession objBeanSession = new BeanSession();			
				HttpSession objSessionLogin = req.getSession(false);
				objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");				
				
				lstBeanTablero = objBusinessTablero.cboSelectStatus(objBeanTablero, ssf);
				
				if (lstBeanTablero.size() > 0) {
					strJson1.append("{\"cboSelectStatus\" : [");
					for (BeanTablero item : lstBeanTablero) {
						strJson1.append("{" +
						"\"Status\" : \"" + item.getStatus() + "\" "+
						
						"},"
						);
					}
				}else {
					strJson1.append("{\"cboSelectStatus\": [");
					strJson1.append("{" +
							"\"Status\" : \"" + "No hay registros" + "\" " +
							"},"
							);
				} 
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
				
			}catch (Exception e) {
				e.printStackTrace();
				strJson1.append("{\"cboSelectStatus\": [");
				strJson1.append("{" +
						"\"Status\" : \"" + "No hay registros" + "\" " +
						"},"
						);
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			}
			out.print(strJson2);
		}
	    
	    
	    private void listReportT3(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
			// TODO Auto-generated method stub
			
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			
			try {
				List<BeanTablero> lstBeanTablero = null;
				BussinesTablero objBusinessTablero = new BussinesTablero();
				BeanTablero beanTablero = new BeanTablero();
				
				BeanSession objBeanSession = new BeanSession();			
				HttpSession objSessionLogin = req.getSession(false);
				objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");				
				
				//PAREMETROS 
				this.Class = req.getParameter("CLASS");
				this.Owner = req.getParameter("OWNER");
				this.Status = req.getParameter("STATUS");
				
				this.FechaInicio = req.getParameter("FECHAINICIO");
				this.FechaFin = req.getParameter("FECHAFIN");
				this.Site = req.getParameter("SITE");
				
				beanTablero.setFechainicio(this.FechaInicio.equals("") ? null : splitQueryVariable(this.FechaInicio));
				beanTablero.setFechafin(this.FechaFin.equals("") ? null : splitQueryVariable(this.FechaFin));
				
				beanTablero.setTipoTicket(this.Class.equals("0") ? null : splitQueryVariable(this.Class));
				beanTablero.setIdOwner(this.Owner.equals("0") ? null : splitQueryVariable(this.Owner));
				beanTablero.setStatus(this.Status.equals("0") ? null : splitQueryVariable(this.Status));
				beanTablero.setSite(this.Site.equals("0") ? null : splitQueryVariable(this.Site));
				
				
				lstBeanTablero = objBusinessTablero.listReportT3(beanTablero, ssf);
				
				if (lstBeanTablero.size() > 0) {
					strJson1.append("{\"listReportT3\" : [");
					for (BeanTablero item : lstBeanTablero) {
						strJson1.append("{" +
						"\"Team\" : \"" + item.getTeam() + "\" ,"+
						"\"SquadIntergroup\" : \"" + item.getSquadInterGroup() + "\", "+
						"\"SquadMultiIndustria1\" : \"" + item.getSquadMulti1() + "\" ,"+
						"\"SquadMultiIndustria2\" : \"" + item.getSquadMulti2() + "\" ,"+
						"\"SquadCommercial\" : \"" + item.getSquadCommercial() + "\" ,"+
						"\"IBM\" : \"" + item.getIBM() + "\", "+
						"\"Total\" : \"" + item.getTotal() + "\" "+
						
						"},"
						);
					}
				}else {
					strJson1.append("{\"listReportT3\": [");
					strJson1.append("{" +
							"\"Team\" : \"" + "No hay registros" + "\" " +
							"},"
							);
				} 
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
				
			}catch (Exception e) {
				e.printStackTrace();
				strJson1.append("{\"listReportT3\": [");
				strJson1.append("{" +
						"\"Team\" : \"" + "No hay registros" + "\" " +
						"},"
						);
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			}
			out.print(strJson2);
		}
	    
	    
	    
	    private void listReportT2(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
			// TODO Auto-generated method stub
			
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			
			try {
				List<BeanTablero> lstBeanTablero = null;
				BussinesTablero objBusinessTablero = new BussinesTablero();
				BeanTablero beanTablero = new BeanTablero();
				
				BeanSession objBeanSession = new BeanSession();			
				HttpSession objSessionLogin = req.getSession(false);
				objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");				
				
				//PAREMETROS 
				this.Tribu = req.getParameter("TRIBU");
				this.Squad = req.getParameter("SQUAD");
				this.Team = req.getParameter("TEAM");
				this.Class = req.getParameter("CLASS");
				
				this.FechaInicio = req.getParameter("FECHAINICIO");
				this.FechaFin = req.getParameter("FECHAFIN");
				
				this.Site = req.getParameter("SITE");
				
				beanTablero.setFechainicio(this.FechaInicio.equals("") ? null : splitQueryVariable(this.FechaInicio));
				beanTablero.setFechafin(this.FechaFin.equals("") ? null : splitQueryVariable(this.FechaFin));
				
				beanTablero.setTribu(this.Tribu.equals("0") ? null : splitQueryVariable(this.Tribu));
				beanTablero.setSquad(this.Squad.equals("0") ? null : splitQueryVariable(this.Squad));
				beanTablero.setTeam(this.Team.equals("0") ? null : splitQueryVariable(this.Team));
				beanTablero.setTipoTicket(this.Class.equals("0") ? null : splitQueryVariable(this.Class));
				beanTablero.setSite(this.Site.equals("0") ? null : splitQueryVariable(this.Site));
				
				
				lstBeanTablero = objBusinessTablero.listReportT2(beanTablero, ssf);
				
				if (lstBeanTablero.size() > 0) {
					strJson1.append("{\"listReportT2\" : [");
					for (BeanTablero item : lstBeanTablero) {
						strJson1.append("{" +
						"\"idOwner\" : \"" + item.getIdOwner() + "\" ,"+
						"\"Owner\" : \"" + item.getOwner() + "\", "+
						"\"Team\" : \"" + item.getTeam() + "\", "+
						"\"Queued\" : \"" + item.getQueued() + "\" ,"+
						"\"Planned\" : \"" + item.getPlanned() + "\" ,"+
						"\"InProgress\" : \"" + item.getInProgress() + "\" ,"+
						"\"Pending\" : \"" + item.getPending() + "\" ,"+
						"\"SlaHold\" : \"" + item.getSlaHold() + "\" ,"+
						"\"Done\" : \"" + item.getDone() + "\" ,"+
						"\"Resolved\" : \"" + item.getResolved() + "\", "+
						"\"Total\" : \"" + item.getTotal() + "\" "+
						
						"},"
						);
					}
				}else {
					strJson1.append("{\"listReportT2\": [");
					strJson1.append("{" +
							"\"idOwner\" : \"" + "No hay registros" + "\" " +
							"},"
							);
				} 
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
				
			}catch (Exception e) {
				e.printStackTrace();
				strJson1.append("{\"listReportT2\": [");
				strJson1.append("{" +
						"\"idOwner\" : \"" + "No hay registros" + "\" " +
						"},"
						);
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			}
			out.print(strJson2);
		}
	    
	    
	    private void listReportT1(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
			// TODO Auto-generated method stub
			
			StringBuilder strJson1 = new StringBuilder();
			StringBuilder strJson2 = new StringBuilder();
			res.setCharacterEncoding("UTF-8");
			PrintWriter out = res.getWriter();
			
			
			try {
				List<BeanTablero> lstBeanTablero = null;
				BussinesTablero objBusinessTablero = new BussinesTablero();
				BeanTablero beanTablero = new BeanTablero();
				
				BeanSession objBeanSession = new BeanSession();			
				HttpSession objSessionLogin = req.getSession(false);
				objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");				
				
				//PAREMETROS 			
				this.Squad = req.getParameter("SQUAD");
				this.Owner = req.getParameter("IDOWNER");
				
				this.Team = req.getParameter("TEAM");
				this.FechaInicio = req.getParameter("FECHAINICIO");
				this.FechaFin = req.getParameter("FECHAFIN");			
				this.Site = req.getParameter("SITE");
				this.Class = req.getParameter("CLASS");
				
				beanTablero.setFechainicio(this.FechaInicio.equals("") ? null : splitQueryVariable(this.FechaInicio));
				beanTablero.setFechafin(this.FechaFin.equals("") ? null : splitQueryVariable(this.FechaFin));
				
				beanTablero.setTeam(this.Team.equals("0")  ? null : splitQueryVariable(this.Team));
				beanTablero.setSquad(this.Squad.equals("0") ? null : splitQueryVariable(this.Squad));
				beanTablero.setIdOwner(this.Owner.equals("0") ? null : splitQueryVariable(this.Owner));
				beanTablero.setSite(this.Site.equals("0") ? null : splitQueryVariable(this.Site));
				beanTablero.setTipoTicket(this.Class.equals("0") ? null : splitQueryVariable(this.Class));				
				
				lstBeanTablero = objBusinessTablero.listReportT1(beanTablero, ssf);
				
				if (lstBeanTablero.size() > 0) {
					strJson1.append("{\"listReportT1\" : [");
					for (BeanTablero item : lstBeanTablero) {
						strJson1.append("{" +
						"\"Squad\" : \"" + item.getSquad() + "\" ,"+
						"\"idOwner\" : \"" + item.getIdOwner() + "\", "+
						"\"Team\" : \"" + item.getTeam() + "\" ,"+
						"\"Backlog\" : \"" + item.getBacklog() + "\" ,"+
						"\"InProgress\" : \"" + item.getInProgress() + "\" ,"+
						"\"Pending\" : \"" + item.getPending() + "\" ,"+
						"\"Queued\" : \"" + item.getQueued() + "\" ,"+
						"\"RcaComp\" : \"" + item.getRcacomp() + "\" ,"+
						"\"SlaHold\" : \"" + item.getSlaHold() + "\", "+
						"\"Resolved\" : \"" + item.getResolved() + "\" "+
						
						"},"
						);
					}
				}else {
					strJson1.append("{\"listReportT1\": [");
					strJson1.append("{" +
							"\"Squad\" : \"" + "No hay registros" + "\" " +
							"},"
							);
				} 
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
				
			}catch (Exception e) {
				e.printStackTrace();
				strJson1.append("{\"listReportT1\": [");
				strJson1.append("{" +
						"\"Squad\" : \"" + "No hay registros" + "\" " +
						"},"
						);
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			}
			out.print(strJson2);
		}
	    
	    
	  //Complete -	AUX
		private String splitQueryVariable(String element) {
			String[] aux = element.split(",");
			
			if (aux.length > 1) {
				String result = "";
				for (int i = 0; i < aux.length; i++) {	
					
					if (aux.length-i == 1) {
						result += "'"+aux[i]+"'";
					}else {
						result += "'"+aux[i]+"',";//'lunes','martes'
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
	    
	    

}
