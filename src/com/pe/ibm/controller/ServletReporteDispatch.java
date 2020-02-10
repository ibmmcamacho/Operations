package com.pe.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;
import org.bouncycastle.jcajce.provider.symmetric.util.IvAlgorithmParameters;

import com.pe.ibm.bean.BeanReporteDispatch;
import com.pe.ibm.business.BusinessReporteDispatch;

/**
 * Servlet implementation class ServletWPerfil
 */
@WebServlet("/ServletReporteDispatch")
public class ServletReporteDispatch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private int idTipo;
	private String pais;
	private String team;
	private String sq;
	private String cliente;
	private String strOwnerId;
	private String strCargo;
	
	
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletReporteDispatch() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
			
		try {
			/* Obtener sqlsessionF*/
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfMaximo");
			SqlSessionFactory ssfSO = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf2");
			
			String strOperacion = request.getParameter("strOperacion");
			
			if (strOperacion.equals("1")) {
				listTFC(request, response,ssf);
			}
			else if (strOperacion.equals("listTotal")) {
				listReporteDispatch(request, response,ssf);
			}
			else if (strOperacion.equals("listCriteria")) {
				listReporteCriteria(request, response,ssf);
			}
			else if (strOperacion.equals("listParentCliente")) {
				listParentCliente(request, response, ssf);
			}		
			else if (strOperacion.equals("listTeam")) {
				listTeam(request, response, ssf);
			}
			else if (strOperacion.equals("listGrupoResolutor")) {
				listGrupoResolutor(request, response, ssfSO);
			}
			else if (strOperacion.equals("listReporteMesActual")) {
				listReporteMesActual(request, response, ssfSO);
			}
			else if (strOperacion.equals("listReporteMesActualHorario")) {
				listReporteMesActualHorario(request, response, ssfSO);
			}
			else if (strOperacion.equals("listTendenciaResolucion")) {
				listTendenciaResolucion(request, response, ssfSO);
			}
			else if (strOperacion.equals("listReporteEspecialistaClase")) {
				listReporteEspecialistaClase(request, response, ssfSO);
			}
			else if (strOperacion.equals("listReporteEspecialistaHorario")) {
				listReporteEspecialistaHorario(request, response, ssfSO);
			}
//			else if (strOperacion.equals("listReportResolucionSemanal")) {
//				listReporteDispatchSemanal(request, response, ssf);
//			}
//			else if (strOperacion.equals("listReporteMensualSquad")) {
//				listReporteDispatchMensualSquad(request, response, ssf);
//			}else if (strOperacion.equals("listReporteMensualHoras")) {
//				listReporteDispatchMensualHoras(request, response, ssf);
//			}else if (strOperacion.equals("listReporteEspecialista_1")) {
//				listReporteDispatchEspecialista_1(request, response, ssf);
//			}else if (strOperacion.equals("listReporteEspecialista_2")) {
//				listReporteDispatchEspecialista_2(request, response, ssf);
//			}else if(strOperacion.equals("listReporteHorario")) {
//				listReporteHorario(request, response, ssf);
//			}else if(strOperacion.equals("listReporteSquad")) {
//				listReporteSquad(request, response, ssf);
//			}
			else if(strOperacion.equals("listComboTorre")) {
				listComboTorre(request, response, ssf);
			}
//			else if(strOperacion.equals("listReporteHorario_barras")) {
//				listReporteHorario_barras(request, response, ssf);
//			}else if(strOperacion.equals("listReporteSquad_barras")) {
//				listReporteSquad_barras(request, response, ssf);
//			}else if(strOperacion.equals("listReporteEspecialista_2_barras")) {
//				listReporteEspecialista_2_barras(request, response, ssf);
//			}else if(strOperacion.equals("listReporteEspecialista_1_barras")) {
//				listReporteEspecialista_1_barras(request, response, ssf);
//			}
			
			
				
			 /* else {
				BeanPerfil objPerfil = new BeanPerfil();
				objPerfil.setiIdPerfil(Integer.parseInt(request.getParameter("iIdPerfil")));
				objPerfil.setStrDescripcion(request.getParameter("strDescripcion"));
				objPerfil.setiTeam(Integer.parseInt(request.getParameter("iTeam")));
				if (strOperacion.equals("deletePerfil")) {
					deletePerfil(request, response, objPerfil,ssf);
				} else if (strOperacion.equals("updatePerfil")) {
					updatePerfil(request, response, objPerfil,ssf);
				} else if (strOperacion.equals("savePerfil")) {
					savePerfil(request, response, objPerfil,ssf);
				} */
			
		} catch (Exception ex) {
			System.out.println(ex.getCause().getMessage());
		}
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void obtenerParametros(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		//Obtener parametros 
		if (req.getParameter("idTipo") != null) {
			this.idTipo =  Integer.parseInt(req.getParameter("idTipo"));
		}
		this.pais =  req.getParameter("pais");
		this.team =  req.getParameter("team");
		this.sq =  req.getParameter("squad");
		this.cliente =  req.getParameter("cliente");
		this.strOwnerId = req.getParameter("strOwnerId");
		this.strCargo = req.getParameter("strCargo");
		
	}
	
	public void listReporteCriteria(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		try {
			
			obtenerParametros(req, res, ssf);
			
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch();
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
					
			if(strCargo.equals("ESPECIALISTA")){					
				objBeanReporteDispatch.setStrOwnerId("'" + this.strOwnerId.replaceAll(",", "','") + "'");			
				}else{
					objBeanReporteDispatch.setStrOwnerId(null);
			}
			
			//tipo
			if (this.idTipo==2) {
				objBeanReporteDispatch.setStrTipo(null);
			}else {
				objBeanReporteDispatch.setStrTipo("'In criteria'");
			}
			
			//pais
			if (this.pais.equals("0")) {
				this.pais="Peru,India";
			}
			objBeanReporteDispatch.setPais("'" + this.pais.replaceAll(",", "','") + "'");
			
			//team
			if (this.team.equals("0")) {
				objBeanReporteDispatch.setStrCodTeam(null);
			}else {
				objBeanReporteDispatch.setStrCodTeam("'" + this.team.replaceAll(",", "','") + "'");
			}
			
			//Squad
			if(this.sq.equals("0")) {
				this.sq="IBM,Squad Multi Industria 1,Squad Multi Industria 2,Squad Credicorp,Squad Intergroup,Squad Commercial,Squad 4";
			}
			this.sq.replace('+', ' ');
			
			objBeanReporteDispatch.setSquad("'" + this.sq.replaceAll(",", "','") + "'");
			
			//Cliente
			if (this.cliente.equals("0")) {
				objBeanReporteDispatch.setStrParentClientId(null);
			}else {
				objBeanReporteDispatch.setStrParentClientId("'" + this.cliente.replaceAll(",", "','") + "'");
			}						
				
			lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteCriteria(objBeanReporteDispatch, ssf);
			 	
			objJson1.append("{\"ListaReporteDispatch\": [");
			
			String squad;
			
			if (lstBeanReporteDispatch.size() > 0) {
				for (BeanReporteDispatch item : lstBeanReporteDispatch) {
					String detalles;
					
					if (item.getStrDetails()==null || item.getStrDetails().trim()=="") {
						detalles = " ";
					}else {
						detalles=item.getStrDetails().replace("\"","'").replace("\\", "\\\\").replace("\t", " ").replace("\n", " ").replace("\b", " ").replace("\f", " ").replace("\r", " ");
					}
					
					objJson1.append("{" +
							"\"squad\" : \"" + item.getStrSquad() + "\" ," +
							"\"tiempoRestante\" : \"" + item.getStrTiempoRestante() + "\" ," +
							"\"ticket\" : \"" + item.getStrTicket() + "\" ," +
							"\"prioridad\" : \"" + item.getiPrioridad() + "\"," +
							"\"owner\" : \"" + item.getStrOwner() + "\"," +
							"\"status\" : \"" + item.getStrStatus() + "\"," +
							"\"horasVencer\" : \"" + item.getiHorasVencer() + "\"," +
							"\"clase\" : \"" + item.getStrClase()  + "\" ," +
							"\"unique_id\" : \"" + item.getStrUniqueid()  + "\" ," +
							"\"team\" : \"" + item.getStrTeam()  + "\" ," +
							"\"clienteId\" : \"" + item.getStrClienteId()  + "\" ," +
							"\"cliente\" : \"" + item.getStrCliente()  + "\" ," +
							
							"\"Summary\" : \"" + (item.getStrSummary() == null ? "\"," : item.getStrSummary().trim().replace("\"","'").replace("\\", "\\\\").replace("\t", " ").replace("\n", " ") + "\" ,") +
							"\"Details\" : \"" + detalles + "\" ," +
							"\"CreatorId\" : \"" + item.getStrCreatorId()  + "\" ," +
							"\"Creator\" : \"" + item.getStrCreator()  + "\" ," +
							"\"CreatorGroup\" : \"" + item.getStrCreatorGroup()  + "\" ," +
							"\"Reported\" : \"" + item.getStrReported()  + "\" ," +
							"\"AffectedPerson\" : \"" + item.getStrAffectedPerson()  + "\" ," +
							"\"Ci\" : \"" + item.getStrCi()  + "\" ," +
							"\"CiName\" : \"" + item.getStrCiName()  + "\" ," +
							"\"CiEnvironment\" : \"" + item.getStrCiEnvironment()  + "\" ," +
							"\"LocationId\" : \"" + item.getStrLocationId()  + "\" ," +
							"\"Location\" : \"" + item.getStrLocation()  + "\" ," +
							"\"ParentClientId\" : \"" + item.getStrParentClientId()  + "\" ," +
							"\"ParentClient\" : \"" + item.getStrParentClient()  + "\" ," +
							
							"\"fechaCreacion\" : \"" + item.getsCDate() + "\"" +
							"},"
							);
				}
				
			} else {
				objJson1 = new StringBuilder();
				objJson1.append("{\"ListaReporteDispatch\": [");
				objJson1.append("{" +
						"\"squad\" : \"" + "" + "\" ," +
						"\"tiempoRestante\" : \"" + " No hay información disponible" + "\" " +
						"},"
						);
			}
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		} catch (Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			objJson1.append("{\"ListaReporteDispatch\": [");
			objJson1.append("{" +
					"\"squad\" : \"" + "" + "\" ," +
					"\"tiempoRestante\" : \"" + " No hay información disponible" + "\" " +
					"},"
					);			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}

		out.print(strJson2);
	}
	
	public void listReporteDispatch(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try {
			
			obtenerParametros(req, res, ssf);
			
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch();
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
				
			//objBeanReporteDispatch.setIdTipo(this.idTipo);
			
			if(strCargo.equals("ESPECIALISTA")){						
			    objBeanReporteDispatch.setStrOwnerId("'" + this.strOwnerId.replaceAll(",", "','") + "'");			
			}else{
				objBeanReporteDispatch.setStrOwnerId(null);
		    }
			
			if (this.idTipo==1) {
				objBeanReporteDispatch.setStrTipo("'INCIDENT','SR'");
			}else if (this.idTipo==2) {
				objBeanReporteDispatch.setStrTipo("'INCIDENT'");
			}else {
				objBeanReporteDispatch.setStrTipo("'SR'");
			} 
			
			
			//pais
			if (this.pais.equals("0")) {
				this.pais="Peru,India";
			}
			objBeanReporteDispatch.setPais("'" + this.pais.replaceAll(",", "','") + "'");
			
			//team
			if (this.team.equals("0")) {
				objBeanReporteDispatch.setStrCodTeam(null);
			}else {
				objBeanReporteDispatch.setStrCodTeam("'" + this.team.replaceAll(",", "','") + "'");
			}
			
			//Squad
			
			if(this.sq.equals("0")) {
				this.sq="IBM,Squad Multi Industria 1,Squad Multi Industria 2,Squad Credicorp,Squad Intergroup,Squad Commercial,Squad 4";
			}
			this.sq.replace('+', ' ');
			objBeanReporteDispatch.setSquad("'" + this.sq.replaceAll(",", "','") + "'");			
			
			//Cliente
			if (this.cliente.equals("0")) {
				objBeanReporteDispatch.setStrParentClientId(null);
			}else {
				objBeanReporteDispatch.setStrParentClientId("'" + this.cliente.replaceAll(",", "','") + "'");
			}
			

			//String[] tipoA = {"INCIDENT"};
			
			//objBeanReporteDispatch.setTipoA(tipoA);
			    
			    
			
			lstBeanReporteDispatch = objBusinessReporteDispatch.list(objBeanReporteDispatch, ssf);
			
			objJson1.append("{\"ListaReporteDispatch\": [");
			
			String squad;
			
			if (lstBeanReporteDispatch.size() > 0) {
				for (BeanReporteDispatch item : lstBeanReporteDispatch) {
					squad = item.getStrSquad()==null ? "Total" : item.getStrSquad();
					objJson1.append("{" +
							"\"squad\" : \"" +  squad + "\" ," +
							"\"in_criteria\" : \"" + item.getiTicketsIC() + "\" ," +
							"\"out_of_criteria\" : \"" + item.getiTicketsOC() + "\" ," +
							"\"planificado\" : \"" + item.getiTicketsP() + "\" ," +
							"\"total\" : \"" + item.getiTotal()  + "\" " +
							"},"
							);
				}
				
			} else {
				objJson1 = new StringBuilder();
				objJson1.append("{\"ListaReporteDispatch\": [");
				objJson1.append("{" +
						"\"squad\" : \"" + "" + "\" ," +
						"\"in_criteria\" : \"" + " No hay información disponible" + "\" " +
						"},"
						);	
			}
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		} catch (Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			objJson1.append("{\"ListaReporteDispatch\": [");
			objJson1.append("{" +
					"\"squad\" : \"" + "" + "\" ," +
					"\"in_criteria\" : \"" + " No hay información disponible" + "\" " +
					"},"
					);			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");

		}

		out.print(strJson2);
	}
	
	public void listTFC(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try {
			
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch();
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
			
			obtenerParametros(req, res, ssf);		
								
			if(strCargo.equals("ESPECIALISTA")){				
			objBeanReporteDispatch.setStrOwnerId("'" + this.strOwnerId.replaceAll(",", "','") + "'");			
			}else{
				objBeanReporteDispatch.setStrOwnerId(null);
			}
			
			//pais
			if (this.pais.equals("0")) {
				this.pais="Peru,India";
			}
			objBeanReporteDispatch.setPais("'" + this.pais.replaceAll(",", "','") + "'");
			
			//team
			if (this.team.equals("0")) {
				objBeanReporteDispatch.setStrCodTeam(null);
			}else {
				objBeanReporteDispatch.setStrCodTeam("'" + this.team.replaceAll(",", "','") + "'");
			}			
			
			//Squad
			if(this.sq.equals("0")) {
				this.sq="IBM,Squad Multi Industria 1,Squad Multi Industria 2,Squad Credicorp,Squad Intergroup,Squad Commercial,Squad 4";
			}
			this.sq.replace('+', ' ');
			objBeanReporteDispatch.setSquad("'" + this.sq.replaceAll(",", "','") + "'");
			
			//Cliente
			if (this.cliente.equals("0")) {
				objBeanReporteDispatch.setStrParentClientId(null);
			}else {
				objBeanReporteDispatch.setStrParentClientId("'" + this.cliente.replaceAll(",", "','") + "'");
			}			
			
			lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteDispatch(objBeanReporteDispatch, ssf);
	
			objJson1.append("{\"ListaTFC\": [");
			
			//System.
			
			if (lstBeanReporteDispatch.size() > 0) {
				
				for (BeanReporteDispatch item : lstBeanReporteDispatch) {
					
					String detalles;
					
					if (item.getStrDetails()==null || item.getStrDetails().trim()=="") {
						detalles = " ";
					}else {
						detalles=item.getStrDetails().replace("\"","'").replace("\\", "\\\\").replace("\t", " ").replace("\n", " ").replace("\b", " ").replace("\f", " ").replace("\r", " ");
					}					
					
					objJson1.append("{" +
							"\"squad\" : \"" +  item.getStrSquad() + "\" ," +
							"\"clienteId\" : \"" + item.getStrClienteId() + "\" ," +
							"\"cliente\" : \"" + item.getStrCliente() + "\" ," +
							"\"ticket\" : \"" + item.getStrTicket() + "\" ," +
							"\"prioridad\" : \"" + item.getiPrioridad() + "\" ," +
							"\"owner\" : \"" + item.getStrOwner() + "\" ," +
							"\"estado\" : \"" + item.getStrEstado() + "\" ," +
							"\"hrs_vencidas\" : \"" + item.getiHrsVencidas()  + "\" ," +
							"\"clase\" : \"" + item.getStrClase()  + "\" ," +
							"\"unique_id\" : \"" + item.getStrUniqueid()  + "\" ," +
							"\"team\" : \"" + item.getStrTeam()  + "\" ," +
							
							"\"Summary\" : \"" + item.getStrSummary().trim().replace("\"","'").replace("\\", "\\\\").replace("\t", " ").replace("\n", " ") + "\" ," +
							"\"Details\" : \"" + detalles + "\" ," +
							"\"CreatorId\" : \"" + item.getStrCreatorId()  + "\" ," +
							"\"Creator\" : \"" + item.getStrCreator()  + "\" ," +
							"\"CreatorGroup\" : \"" + item.getStrCreatorGroup()  + "\" ," +
							"\"Reported\" : \"" + item.getStrReported()  + "\" ," +
							"\"AffectedPerson\" : \"" + item.getStrAffectedPerson()  + "\" ," +
							"\"Ci\" : \"" + item.getStrCi()  + "\" ," +
							"\"CiName\" : \"" + item.getStrCiName()  + "\" ," +
							"\"CiEnvironment\" : \"" + item.getStrCiEnvironment()  + "\" ," +
							"\"LocationId\" : \"" + item.getStrLocationId()  + "\" ," +
							"\"Location\" : \"" + item.getStrLocation()  + "\" ," +
							"\"ParentClientId\" : \"" + item.getStrParentClientId()  + "\" ," +
							"\"ParentClient\" : \"" + item.getStrParentClient()  + "\" ," +
							
							"\"fechaCreacion\" : \"" + item.getsCDate() + "\"" +
							"},"
							);
				}				
			} else {
				objJson1 = new StringBuilder();
				objJson1.append("{\"ListaTFC\": [");
				objJson1.append("{" +
						"\"squad\" : \"" + "" + "\" ," +
						"\"cliente\" : \"" + " No hay información disponible" + "\" " +
						"},"
						);	
			}
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");			
		} catch (Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			objJson1.append("{\"ListaTFC\": [");
			objJson1.append("{" +
					"\"squad\" : \"" + "" + "\" ," +
					"\"cliente\" : \"" + " No hay información disponible" + "\" " +
					"},"
					);			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	public void listTeam(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		try {
			
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch();
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
			
			
			lstBeanReporteDispatch = objBusinessReporteDispatch.listTeam(objBeanReporteDispatch, ssf);
	
			objJson1.append("{\"ListaTeam\": [");
			
			//System.
			
			if (lstBeanReporteDispatch.size() > 0) {
				
				//System.out.println("tamano: " + lstBeanReporteDispatch.size());
				for (BeanReporteDispatch item : lstBeanReporteDispatch) {
					objJson1.append("{" +
							"\"codTeam\" : \"" +  item.getStrCodTeam() + "\" ," +
							"\"Team\" : \"" + item.getStrTeam() + "\" " +
							"},"
							);
				}
				
			} 
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		} catch (Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			objJson1.append("{\"ListaTeam\": [");
			objJson1.append("{" +
					"\"codTeam\" : \"" + "" + "\" ," +
					"\"Team\" : \"" + " No hay información disponible" + "\" " +
					"},"
					);			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");

		}

		out.print(strJson2);
	}
	
	private void listParentCliente(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf) throws IOException{
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		response.setCharacterEncoding("UTF-8");		
		PrintWriter out = response.getWriter();
		
		strJson1.append("{\"cliente\" : [");
		try {
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch();
			String valor = request.getParameter("strParentClient");
			objBeanReporteDispatch.setSquad(request.getParameter("strParentClient").equals("0") ? null : request.getParameter("strParentClient"));
			lstBeanReporteDispatch = objBusinessReporteDispatch.listCliente(objBeanReporteDispatch, ssf);
		
			if(lstBeanReporteDispatch.size() > 0) {
				for(BeanReporteDispatch item : lstBeanReporteDispatch) {
					strJson1.append("{\"idParentClient\" : \"" + item.getStrParentClientId() + "\",");
					strJson1.append("\"descripcionParentClient\" : \"" + item.getStrParentClient() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
		}catch(Exception e) {
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	
	
	
	
	
	
	
	
	
	private void listGrupoResolutor(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"reporte\": [");				
		try {
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
			
//			objBeanReporteDispatch.setStrFechaActual(req.getParameter("strFechaActual"));
			
			lstBeanReporteDispatch = objBusinessReporteDispatch.listGrupoResolutor(ssf);
			
			if (lstBeanReporteDispatch.size() > 0) {				
				for (BeanReporteDispatch item : lstBeanReporteDispatch) {					
//					squad = item.getStrSquad()==null ? "Total" : item.getStrSquad();
					strJson1.append("{" +
							"\"groupid\" : \"" +  item.getStrResolutorGroupId() + "\" ," +
							"\"group\" : \"" + item.getStrResolutorGroup() + "\"" +
							"},"
							);
				}
			} else {
				strJson1.append("{},");
			}
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			
		}catch(Exception ex) {
			ex.printStackTrace();
			strJson1 = new StringBuilder();
			strJson1.append("{},");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		}		
		out.print(strJson2);
	}
	
	private void listReporteMesActual(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"reporte\": [");				
		try {
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
			
			objBeanReporteDispatch.setPais(req.getParameter("strPais").equals("0") ? null : req.getParameter("strPais"));
			objBeanReporteDispatch.setStrResolutorGroupId(req.getParameter("strTorre").equals("0") ? null : req.getParameter("strTorre"));
			objBeanReporteDispatch.setStrFechaInicio(req.getParameter("strFechaIni"));
			objBeanReporteDispatch.setStrFechaFin(req.getParameter("strFechaFin"));
			
			lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteMesActual(objBeanReporteDispatch, ssf);
			
			if (lstBeanReporteDispatch.size() > 0) {		
				for (BeanReporteDispatch item : lstBeanReporteDispatch) {					
//					squad = item.getStrSquad()==null ? "Total" : item.getStrSquad();
					strJson1.append("{" +
							"\"squad\" : \"" +  (item.getStrSquad() == null ? "Total" : item.getStrSquad()) + "\" ," +
							"\"incriteria\" : \"" + item.getiTicketsIC() + "\" ," +
							"\"outofcriteria\" : \"" + item.getiTicketsOC() + "\" ," +
							"\"planificado\" : \"" + item.getiTicketsP() + "\" ," +
							"\"noaplica\" : \"" + item.getiNoAplica() + "\" ," +
							"\"total\" : \"" + item.getiTotal() + "\" " +							
							"},"
							);
				}
			} else {
				strJson1.append("{},");
			}
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]");
		strJson1 = new StringBuilder();
		strJson1.append(",\"dataChart\": [");
		if (lstBeanReporteDispatch.size() > 0) {
			for (BeanReporteDispatch item : lstBeanReporteDispatch) {					
	//			squad = item.getStrSquad()==null ? "Total" : item.getStrSquad();
				if(!item.getStrSquad().equals("TOTAL")){
					strJson1.append("{" +
						"\"name\" : \"" + item.getStrSquad() + "\" ," +
						"\"data\" : [" + item.getiTicketsIC() + "," + item.getiTicketsOC() + "," + item.getiTicketsP() + "," + item.getiNoAplica() + "]" +
						"},");
				}
			}
		}
		else
			strJson1.append("{},");
		strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		
		}catch(Exception ex) {
			ex.printStackTrace();
			strJson1 = new StringBuilder();
			strJson1.append("{},");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		}		
		out.print(strJson2);
	}
	
	private void listReporteMesActualHorario(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"reporte\": [");				
		try {
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
			
			objBeanReporteDispatch.setPais(req.getParameter("strPais").equals("0") ? null : req.getParameter("strPais"));
			objBeanReporteDispatch.setStrResolutorGroupId(req.getParameter("strTorre").equals("0") ? null : req.getParameter("strTorre"));
			objBeanReporteDispatch.setStrFechaInicio(req.getParameter("strFechaIni"));
			objBeanReporteDispatch.setStrFechaFin(req.getParameter("strFechaFin"));
			
			lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteMesActualHorario(objBeanReporteDispatch, ssf);
			
			if (lstBeanReporteDispatch.size() > 0) {				
				for (BeanReporteDispatch item : lstBeanReporteDispatch) {					
//					squad = item.getStrSquad()==null ? "Total" : item.getStrSquad();
					strJson1.append("{" +
							"\"squad\" : \"" +  (item.getStrSquad() == null ? "Total" : item.getStrSquad()) + "\" ," +
							"\"incriteria\" : \"" + item.getiTicketsIC() + "\" ," +
							"\"outofcriteria\" : \"" + item.getiTicketsOC() + "\" ," +
							"\"planificado\" : \"" + item.getiTicketsP() + "\" ," +
							"\"noaplica\" : \"" + item.getiNoAplica() + "\" ," +
							"\"total\" : \"" + item.getiTotal() + "\" " +							
							"},"
							);
				}
			} else {
				strJson1.append("{},");
			}
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]");
			
			strJson1 = new StringBuilder();
			strJson1.append(",\"dataChart\": [");
			if (lstBeanReporteDispatch.size() > 0) {
			for (BeanReporteDispatch item : lstBeanReporteDispatch) {					
//				squad = item.getStrSquad()==null ? "Total" : item.getStrSquad();
				if(!item.getStrSquad().equals("TOTAL")){
					strJson1.append("{" +
						"\"name\" : \"" + item.getStrSquad() + "\" ," +
						"\"data\" : [" + item.getiTicketsIC() + "," + item.getiTicketsOC() + "," + item.getiTicketsP() + "," + item.getiNoAplica() + "]" +
						"},");
				}
			}
			}
			else
				strJson1.append("{},");
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
			strJson1 = new StringBuilder();
			strJson1.append("{},");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		}		
		out.print(strJson2);
	}
	
	private void listTendenciaResolucion(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"reporte\": [");				
		try {
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			List<BeanReporteDispatch> lstBeanReporteEntrantes = new ArrayList<BeanReporteDispatch>();
			
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
			
			objBeanReporteDispatch.setPais(req.getParameter("strPais").equals("0") ? null : req.getParameter("strPais"));
			objBeanReporteDispatch.setStrResolutorGroupId(req.getParameter("strTorre").equals("0") ? null : req.getParameter("strTorre"));
			objBeanReporteDispatch.setStrFechaInicio(req.getParameter("strFechaIni"));
			objBeanReporteDispatch.setStrFechaFin(req.getParameter("strFechaFin"));
			
			lstBeanReporteDispatch = objBusinessReporteDispatch.listTendenciaResolucion(objBeanReporteDispatch, ssf);
			
			if (lstBeanReporteDispatch != null && lstBeanReporteDispatch.size() > 0) {
				BeanReporteDispatch objReporte = null;
				for(BeanReporteDispatch item : lstBeanReporteDispatch) {
					objReporte = new BeanReporteDispatch();
					if(item.getStrTipo().equals("ENTRANTES")) {
						objReporte.setStrSquad(item.getStrSquad());
						objReporte.setStrFechaClaim(item.getStrFechaClaim());
						objReporte.setiTotal(item.getiTotal());
						lstBeanReporteEntrantes.add(objReporte);
					}
				}
				
				strJson1.append("{\"head\":[");
				strJson1.append("{\"title\" : \"Segmentos\"},");
				for(BeanReporteDispatch item : lstBeanReporteEntrantes) {
					strJson1.append("{\"title\" : \"" + item.getStrFechaClaim() + "\"},");
				}
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
				
				DecimalFormat df = new DecimalFormat("#.00");
				strJson1 = new StringBuilder();
				strJson1.append(",{\"datos\":[");
				int iEvaluacion = 0, iTotalResolucion = 0, iInBus = 0, iOutBus = 0;
				for(BeanReporteDispatch item1 : lstBeanReporteEntrantes) {
					String strFechaClaim = item1.getStrFechaClaim();
					iEvaluacion = 0;
					strJson1.append("{\"dato\":[");
					for(BeanReporteDispatch item2 : lstBeanReporteDispatch) {
						if(strFechaClaim.equals(item2.getStrFechaClaim()) && !item2.getStrSquad().equals("ENTRANTES")) {
								strJson1.append("{\"descripcion\" : \"" + item2.getStrSquad() + "\",");
								strJson1.append("\"total\" : \"" + item2.getiTotal() + "\"},");
								if(item2.getStrSquad().equals("Resolución Total")) {
									strJson1.append("{\"descripcion\" : \"" + "Diferencial Semanal" + "\",");
									strJson1.append("\"total\" : \"" + (iTotalResolucion != 0 ? df.format((((float)item2.getiTotal()/(float)iTotalResolucion)-1)*100.00) : 0) + "\"},");
									iTotalResolucion = item2.getiTotal();
									
									strJson1.append("{\"descripcion\" : \"" + "Tickets entrantes" + "\",");
									strJson1.append("\"total\" : \"" + item1.getiTotal() + "\"},");
									
									strJson1.append("{\"descripcion\" : \"" + "Eficiencia" + "\",");
									strJson1.append("\"total\" : \"" + df.format(((float)item2.getiTotal()/(float)item1.getiTotal())*100.00) + "\"},");
								}
								else if(item2.getStrSquad().equals("In Business Hours")) {
//									iTotalResolucionBusiness = (int)Math.round(((double)item2.getiTotal()/iTotalResolucion)*100);
									iInBus = item2.getiTotal();
								}
								else if(item2.getStrSquad().equals("Out of Business Hours")) {
									iOutBus = item2.getiTotal();;
								}
								else if(item2.getStrSquad().equals("Horas Total")) {
									strJson1.append("{\"descripcion\" : \"" + "Promedio de resolución diaria" + "\",");
									strJson1.append("\"total\" : \"" + ((iInBus + iOutBus)/5) + "\"},");
									strJson1.append("{\"descripcion\" : \"" + "% Resolución en Horario de Oficina" + "\",");
									strJson1.append("\"total\" : \"" + df.format(((float)iInBus/(float)iTotalResolucion)*100.00) + "\"},");
									iEvaluacion = 1;
								}
						}else if(iEvaluacion == 1) {
							strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]},");
							strJson1 = new StringBuilder();
							break;
						}
					}
				}
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}]}]}");
				strJson1 = new StringBuilder();
			}
			else
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "[]}");
		}catch(Exception ex) {
			ex.printStackTrace();
			strJson1 = new StringBuilder();
			strJson1.append("{},");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		}
//		System.out.println(strJson2);
		out.print(strJson2);
	}

	private void listReporteEspecialistaClase(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"reporte\": [");				
		try {
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
			
			objBeanReporteDispatch.setPais(req.getParameter("strPais").equals("0") ? null : req.getParameter("strPais"));
			objBeanReporteDispatch.setStrResolutorGroupId(req.getParameter("strTorre").equals("0") ? null : req.getParameter("strTorre"));
			objBeanReporteDispatch.setStrFechaInicio(req.getParameter("strFechaIni"));
			objBeanReporteDispatch.setStrFechaFin(req.getParameter("strFechaFin"));
			
			lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteEspecialistaClase(objBeanReporteDispatch, ssf);
			
			if (lstBeanReporteDispatch.size() > 0) {				
				for (BeanReporteDispatch item : lstBeanReporteDispatch) {					
//					squad = item.getStrSquad()==null ? "Total" : item.getStrSquad();
					strJson1.append("{" +
							"\"owner\" : \"" +  (item.getStrOwner().equals("ZZTOTAL") ? "TOTAL" : item.getStrOwner()) + "\" ," +
							"\"incident\" : \"" + item.getiIncident() + "\" ," +
							"\"problem\" : \"" + item.getiProblem() + "\" ," +
							"\"sr\" : \"" + item.getiSr() + "\" ," +
							"\"change\" : \"" + item.getiChange() + "\" ," +
							"\"workorder\" : \"" + item.getiWorkOrder() + "\" ," +
							"\"activity\" : \"" + item.getiActivity() + "\" ," +
							"\"total\" : \"" + item.getiTotal() + "\" " +							
							"},"
							);
				}
			} else {
				strJson1.append("{},");
			}
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]");
				
			strJson1 = new StringBuilder();
			strJson1.append(",\"dataChart\": [");
			if (lstBeanReporteDispatch.size() > 0) {
			for (BeanReporteDispatch item : lstBeanReporteDispatch) {					
//				squad = item.getStrSquad()==null ? "Total" : item.getStrSquad();
				if(!item.getStrOwner().equals("ZZTOTAL")){
					strJson1.append("{" +
						"\"name\" : \"" + item.getStrOwner() + "\" ," +
						"\"data\" : [" + item.getiIncident() + "," + item.getiProblem() + "," + item.getiSr() + "," + item.getiChange() + "," + item.getiWorkOrder() + "," + item.getiActivity() + "]" +
						"},");
				}
			}
			}
			else
				strJson1.append("{},");
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		}catch(Exception ex) {
			ex.printStackTrace();
			strJson1 = new StringBuilder();
			strJson1.append("{},");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		}		
		out.print(strJson2);
	}
	
	private void listReporteEspecialistaHorario(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"reporte\": [");		
		try {
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
			
			objBeanReporteDispatch.setPais(req.getParameter("strPais").equals("0") ? null : req.getParameter("strPais"));
			objBeanReporteDispatch.setStrResolutorGroupId(req.getParameter("strTorre").equals("0") ? null : req.getParameter("strTorre"));
			objBeanReporteDispatch.setStrFechaInicio(req.getParameter("strFechaIni"));
			objBeanReporteDispatch.setStrFechaFin(req.getParameter("strFechaFin"));
			
			lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteEspecialistaHorario(objBeanReporteDispatch, ssf);
			
			if (lstBeanReporteDispatch.size() > 0) {
				for (BeanReporteDispatch item : lstBeanReporteDispatch) {					
//					squad = item.getStrSquad()==null ? "Total" : item.getStrSquad();
					strJson1.append("{" +
							"\"owner\" : \"" +  (item.getStrOwner().equals("ZZTOTAL") ? "Total" : item.getStrOwner()) + "\" ," +
							"\"incriteria\" : \"" + item.getiTicketsIC() + "\" ," +
							"\"outofcriteria\" : \"" + item.getiTicketsOC() + "\" ," +
							"\"planificado\" : \"" + item.getiTicketsP() + "\" ," +
							"\"noaplica\" : \"" + item.getiNoAplica() + "\" ," +
							"\"total\" : \"" + item.getiTotal() + "\" " +							
							"},"
							);
				}
			} else {
				strJson1.append("{},");
			}
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]");
			
			strJson1 = new StringBuilder();
			strJson1.append(",\"dataChart\": [");
			if (lstBeanReporteDispatch.size() > 0) {
			for (BeanReporteDispatch item : lstBeanReporteDispatch) {					
//				squad = item.getStrSquad()==null ? "Total" : item.getStrSquad();
				if(!item.getStrOwner().equals("ZZTOTAL")){
					strJson1.append("{" +
						"\"name\" : \"" + item.getStrOwner() + "\" ," +
						"\"data\" : [" + item.getiTicketsIC() + "," + item.getiTicketsOC() + "," + item.getiTicketsP() + "," + item.getiNoAplica() + "]" +
						"},");
				}
			}
			}
			else
				strJson1.append("{},");
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		}catch(Exception ex) {
			ex.printStackTrace();
			strJson1 = new StringBuilder();
			strJson1.append("{},");
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		}		
		out.print(strJson2);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
//	private void listReporteDispatchSemanal(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
//		StringBuilder strJson1 = new StringBuilder();
//		StringBuilder strJson2 = new StringBuilder();
//		res.setCharacterEncoding("UTF-8");
//		PrintWriter out = res.getWriter();
//		
//		strJson1.append("{\"ListaReporteDispatchSemanal\": [");				
//		try {
//			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
//			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
//			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
//			
//			objBeanReporteDispatch.setStrFechaActual(req.getParameter("strFechaActual"));
//			
//			lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteDispatchResolucionSemanal(objBeanReporteDispatch, ssf);
//						
//			String squad;
//			
//			if (lstBeanReporteDispatch.size() > 0) {				
//				for (BeanReporteDispatch item : lstBeanReporteDispatch) {					
//					squad = item.getStrSquad()==null ? "Total" : item.getStrSquad();					
//					strJson1.append("{" +
//							"\"squad\" : \"" +  squad + "\" ," +
//							"\"semana_1\" : \"" + item.getiSemana_1() + "\" ," +
//							"\"semana_2\" : \"" + item.getiSemana_2() + "\" ," +
//							"\"semana_3\" : \"" + item.getiSemana_3() + "\" ," +
//							"\"semana_4\" : \"" + item.getiSemana_4() + "\" ," +
//							"\"semana_5\" : \"" + item.getiSemana_5() + "\" ," +
//							"\"semana_6\" : \"" + item.getiSemana_6() + "\" ," +
//							"\"semana_7\" : \"" + item.getiSemana_7() + "\" ," +
//							"\"semana_8\" : \"" + item.getiSemana_8() + "\" ," +
//							"\"semana_9\" : \"" + item.getiSemana_9() + "\" ," +
//							"\"semana_10\" : \"" + item.getiSemana_10() + "\" ," +
//							"\"total\" : \"" + item.getiSemana_Total()  + "\" " +							
//							"},"
//							);
//				} 
//			
//				BeanReporteDispatch item_Final = lstBeanReporteDispatch.get(lstBeanReporteDispatch.size() -1 );
//				DecimalFormat formatoDecimal = new DecimalFormat("#.##");
//				strJson1.append("{" +
//						"\"squad\" : \"" +  "%Diferencia Semanal" + "\" ," +
//						"\"semana_1\" : \"" + "" + "\" ," +
//						"\"semana_2\" : \"" + formatoDecimal.format(((item_Final.getiSemana_2() * 1.0) /  (item_Final.getiSemana_1() * 1.0)) -1) + "%" + "\" ," +
//						"\"semana_3\" : \"" + formatoDecimal.format(((item_Final.getiSemana_3() * 1.0) /  (item_Final.getiSemana_2() * 1.0)) -1) + "%" + "\" ," +
//						"\"semana_4\" : \"" + formatoDecimal.format(((item_Final.getiSemana_4() * 1.0) /  (item_Final.getiSemana_3() * 1.0)) -1) + "%" + "\" ," +
//						"\"semana_5\" : \"" + formatoDecimal.format(((item_Final.getiSemana_5() * 1.0) /  (item_Final.getiSemana_4() * 1.0)) -1) + "%" + "\" ," +
//						"\"semana_6\" : \"" + formatoDecimal.format(((item_Final.getiSemana_6() * 1.0) /  (item_Final.getiSemana_5() * 1.0)) -1) + "%" + "\" ," +
//						"\"semana_7\" : \"" + formatoDecimal.format(((item_Final.getiSemana_7() * 1.0) /  (item_Final.getiSemana_6() * 1.0)) -1) + "%" + "\" ," +
//						"\"semana_8\" : \"" + formatoDecimal.format(((item_Final.getiSemana_8() * 1.0) /  (item_Final.getiSemana_7() * 1.0)) -1) + "%" + "\" ," +
//						"\"semana_9\" : \"" + formatoDecimal.format(((item_Final.getiSemana_9() * 1.0) /  (item_Final.getiSemana_8() * 1.0)) -1) + "%" + "\" ," +
//						"\"semana_10\" : \"" + formatoDecimal.format(((item_Final.getiSemana_10() * 1.0) /  (item_Final.getiSemana_9() * 1.0)) -1) + "%" + "\" ," +
//						"\"total\" : \"" + ""  + "\" " +							
//						"},"
//						);
//			} else {
//				strJson1 = new StringBuilder();
//				strJson1.append("{\"ListaReporteDispatchSemanal\": [");
//				strJson1.append("{" +
//						"\"squad\" : \"" + "" + "\" ," +
//						"\"semana_1\" : \"" + " No hay información disponible" + "\" " +
//						"},"
//						);	
//			}		
//			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
//			
//		}catch(Exception ex) {
//			ex.printStackTrace();
//			strJson1 = new StringBuilder();
//			strJson1.append("{\"ListaReporteDispatchSemanal\": [");
//			strJson1.append("{" +
//					"\"squad\" : \"" + "" + "\" ," +
//					"\"semana_1\" : \"" + " No hay información disponible" + "\" " +
//					"},"
//					);
//			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
//		}		
//		out.print(strJson2);
//	}
	
	
	private void listReporteDispatchMensualSquad(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		strJson1.append("{\"ListaReporteDispatchMensual\": [");	
		
		try {
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
			
			objBeanReporteDispatch.setStrFechaInicio(request.getParameter("strFechaActualMesDiaInicio"));
			objBeanReporteDispatch.setStrFechaFin(request.getParameter("strFechaActualMesDiaUltimo"));
			
			lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteDispatchMensualSquad(objBeanReporteDispatch, ssf);
			
			String squad;
			
			if (lstBeanReporteDispatch.size() > 0) {
				for (BeanReporteDispatch item : lstBeanReporteDispatch) {
					squad = item.getStrSquad()==null ? "Total" : item.getStrSquad();
					strJson1.append("{" +
							"\"squad\" : \"" + squad + "\" ," +
							"\"in_criteria\" : \"" + item.getiTicketsIC() + "\" ," +
							"\"out_of_criteria\" : \"" + item.getiTicketsOC() + "\" ," +
							"\"planificado\" : \"" + item.getiTicketsP() + "\" ," +
							"\"total\" : \"" + item.getiTotal() + "\" " +
							"},"
							);
				}				
			}else {
						strJson1 = new StringBuilder();
						strJson1.append("{\"ListaReporteDispatchMensual\": [");
						strJson1.append("{" +
						"\"squad\" : \"" + "" + "\" ," +
						"\"in_criteria\" : \"" + " No hay información disponible" + "\" " +
						"},"
						);	
					}			
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		}catch(Exception ex) {
			ex.printStackTrace();
			strJson1 = new StringBuilder();
			strJson1.append("{\"ListaReporteDispatchMensual\": [");
			strJson1.append("{" +
					"\"squad\" : \"" + "" + "\" ," +
					"\"in_criteria\" : \"" + " No hay información disponible" + "\" " +
					"},"
					);
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		}		
		out.print(strJson2);		
	}
	
	
	private void listReporteDispatchMensualHoras(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		strJson1.append("{\"ListaReporteDispatchMensualHoras\": [");	
		
		try {
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
			
			objBeanReporteDispatch.setStrFechaInicio(request.getParameter("strFechaActualMesDiaInicio"));
			objBeanReporteDispatch.setStrFechaFin(request.getParameter("strFechaActualMesDiaUltimo"));
			
			lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteDispatchMensualHoras(objBeanReporteDispatch, ssf);
									
			if (lstBeanReporteDispatch.size() > 0) {
				for (BeanReporteDispatch item : lstBeanReporteDispatch) {
					strJson1.append("{" +
							"\"horario\" : \"" +  item.getStrHorarioOficina() + "\" ," +
							"\"in_criteria\" : \"" + item.getiTicketsIC() + "\" ," +
							"\"out_of_criteria\" : \"" + item.getiTicketsOC() + "\" ," +
							"\"planificado\" : \"" + item.getiTicketsP() + "\" ," +
							"\"total\" : \"" + item.getiTotal() + "\" " +
							"},"
							);
				}				
			}else {
				strJson1 = new StringBuilder();
				strJson1.append("{\"ListaReporteDispatchMensualHoras\": [");
				strJson1.append("{" +
				"\"horario\" : \"" + "" + "\" ," +
				"\"in_criteria\" : \"" + " No hay información disponible" + "\" " +
				"},"
				);	
			}			
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		}catch(Exception ex) {
			ex.printStackTrace();
			strJson1 = new StringBuilder();
			strJson1.append("{\"ListaReporteDispatchMensualHoras\": [");
			strJson1.append("{" +
					"\"horario\" : \"" + "" + "\" ," +
					"\"in_criteria\" : \"" + " No hay información disponible" + "\" " +
					"},"
					);
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		}
		
		out.print(strJson2);		
	}

	

	private void listReporteDispatchEspecialista_1(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf)throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		strJson1.append("{\"ListaReporteDispatchEspecialista_1\": [");	
		
		try {
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
						
			String strchkFechaFin = request.getParameter("strchkFechaFin");	
			String strFechaActual = request.getParameter("strFechaActual");
			String strFechaInicio = request.getParameter("strCboFechaActualFiltroMesDiaInicio");
			String strFechaFin = request.getParameter("strCboFechaActualFiltroMesFinDiaUltimo");
			if(strchkFechaFin.equals("SI")){
				objBeanReporteDispatch.setStrFechaInicio(strFechaInicio);
				objBeanReporteDispatch.setStrFechaFin(strFechaFin);
 			}else {
				objBeanReporteDispatch.setStrFechaActual(strFechaActual);
			}
			objBeanReporteDispatch.setPais(request.getParameter("strCboPais").equals("0") ? "Peru" : request.getParameter("strCboPais"));
			objBeanReporteDispatch.setStrOwnerGroupId(request.getParameter("strCboTorre").equals("0") ? null : request.getParameter("strCboTorre"));			
			
			lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteDispatchEspecialista_1(objBeanReporteDispatch, ssf);
			
			String especialista;
			
			if (lstBeanReporteDispatch.size() > 0) {
				for (BeanReporteDispatch item : lstBeanReporteDispatch) {
					especialista = item.getStrOwner()==null ? "Total" : item.getStrOwner();
					strJson1.append("{" +
							"\"especialista\" : \"" +  especialista + "\" ," +
							"\"incident\" : \"" + item.getiIncident() + "\" ," +
							"\"sr\" : \"" + item.getiSr() + "\" ," +
							"\"change\" : \"" + item.getiChange() + "\" ," +
							"\"total\" : \"" + item.getiTotal()  + "\" " +
							"},"
							);			
				}
			} else {
					strJson1 = new StringBuilder();
					strJson1.append("{\"ListaReporteDispatchEspecialista_1\": [");
					strJson1.append("{" +
					"\"especialista\" : \"" + "" + "\" ," +
					"\"incident\" : \"" + " No hay información disponible" + "\" " +
					"},"
					);	
					}
			
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		}catch(Exception ex) {
			ex.printStackTrace();
			strJson1 = new StringBuilder();
			strJson1.append("{\"ListaReporteDispatchEspecialista_1\": [");
			strJson1.append("{" +
					"\"especialista\" : \"" + "" + "\" ," +
					"\"incident\" : \"" + " No hay información disponible" + "\" " +
					"},"
					);
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		}
		
		out.print(strJson2);
	}
	
	

	private void listReporteDispatchEspecialista_2(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf)throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		strJson1.append("{\"ListaReporteDispatchEspecialista_2\": [");	
		
		try {
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
			
			String strchkFechaFin = request.getParameter("strchkFechaFin");	
			String strFechaActual = request.getParameter("strFechaActual");
			String strFechaInicio = request.getParameter("strCboFechaActualFiltroMesDiaInicio");
			String strFechaFin = request.getParameter("strCboFechaActualFiltroMesFinDiaUltimo");
			if(strchkFechaFin.equals("SI")){
				objBeanReporteDispatch.setStrFechaInicio(strFechaInicio);
				objBeanReporteDispatch.setStrFechaFin(strFechaFin);
			}else {
				objBeanReporteDispatch.setStrFechaActual(strFechaActual);
			}			
			objBeanReporteDispatch.setPais(request.getParameter("strCboPais").equals("0") ? "Peru" : request.getParameter("strCboPais"));
			objBeanReporteDispatch.setStrOwnerGroupId(request.getParameter("strCboTorre").equals("0") ? null : request.getParameter("strCboTorre"));
			
			lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteDispatchEspecialista_2(objBeanReporteDispatch, ssf);
			
			String especialista;
			
			if (lstBeanReporteDispatch.size() > 0) {
				for (BeanReporteDispatch item : lstBeanReporteDispatch) {
					especialista = item.getStrOwner()==null ? "Total" : item.getStrOwner();
					strJson1.append("{" +
							"\"especialista\" : \"" +  especialista + "\" ," +
							"\"in_criteria\" : \"" + item.getiTicketsIC() + "\" ," +
							"\"out_of_criteria\" : \"" + item.getiTicketsOC() + "\" ," +
							"\"planificado\" : \"" + item.getiTicketsP() + "\" ," +
							"\"total\" : \"" + item.getiTotal()  + "\" " +
							"},"
							);
				}				
			} else {
				strJson1 = new StringBuilder();
				strJson1.append("{\"ListaReporteDispatchEspecialista_2\": [");
				strJson1.append("{" +
				"\"especialista\" : \"" + "" + "\" ," +
				"\"in_criteria\" : \"" + " No hay información disponible" + "\" " +
				"},"
				);	
			}
//			
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		}catch(Exception ex) {
			ex.printStackTrace();
			strJson1 = new StringBuilder();
			strJson1.append("{\"ListaReporteDispatchEspecialista_2\": [");
			strJson1.append("{" +
					"\"especialista\" : \"" + "" + "\" ," +
					"\"inCriteria\" : \"" + " No hay información disponible" + "\" " +
					"},"
					);
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		}
		
		out.print(strJson2);				
	}
		

	private void listReporteHorario(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf)throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		strJson1.append("{\"ListaReporteDispatchHorario\": [");	
		
		try {
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
			
			String strchkFechaFin = request.getParameter("strchkFechaFin");	
			String strFechaActual = request.getParameter("strFechaActual");
			String strFechaInicio = request.getParameter("strCboFechaActualFiltroMesDiaInicio");
			String strFechaFin = request.getParameter("strCboFechaActualFiltroMesFinDiaUltimo");
			objBeanReporteDispatch.setStrFechaActual(strFechaActual);
			
			if(strFechaActual == "") {
				if(strchkFechaFin.equals("SI")){
					objBeanReporteDispatch.setStrFechaInicio(strFechaInicio);
					objBeanReporteDispatch.setStrFechaFin(strFechaFin);
				}else {
					objBeanReporteDispatch.setStrFechaUnicaInicio(strFechaInicio);
				}	
			}else {
				objBeanReporteDispatch.setStrFechaActual(strFechaActual);
			}
				
			objBeanReporteDispatch.setPais(request.getParameter("strCboPais").equals("0") ? "Peru" : request.getParameter("strCboPais"));
			objBeanReporteDispatch.setStrOwnerGroupId(request.getParameter("strCboTorre").equals("0") ? null : request.getParameter("strCboTorre"));
			
			lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteDispatchHorarioOficina(objBeanReporteDispatch, ssf);
			
			String horario_Oficina;
			
			if (lstBeanReporteDispatch.size() > 0) {
				for (BeanReporteDispatch item : lstBeanReporteDispatch) {
					horario_Oficina = item.getStrHorarioOficina()==null ? "Total" : item.getStrHorarioOficina();
					strJson1.append("{" +
							"\"horarioOficina\" : \"" +  horario_Oficina + "\" ," +
							"\"inCriteria\" : \"" + item.getiTicketsIC() + "\" ," +
							"\"outOfCriteria\" : \"" + item.getiTicketsOC() + "\" ," +
							"\"planificado\" : \"" + item.getiTicketsP() + "\" ," +
							"\"total\" : \"" + item.getiTotal()  + "\" " +
							"}," 
							);
				}				
			} else {
				strJson1 = new StringBuilder();
				strJson1.append("{\"ListaReporteDispatchHorario\": [");
				strJson1.append("{" +
						"\"horarioOficina\" : \"" + "" + "\" ," +
						"\"inCriteria\" : \"" + " No hay información disponible" + "\" " +
						"},"
						);	
			}
			
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		}catch(Exception ex) {
			ex.printStackTrace();
			strJson1 = new StringBuilder();
			strJson1.append("{\"ListaReporteDispatchHorario\": [");
			strJson1.append("{" +
					"\"horarioOficina\" : \"" + "" + "\" ," +
					"\"inCriteria\" : \"" + " No hay información disponible" + "\" " +
					"},"
					);
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");               
		}
		
		out.print(strJson2);			
	}
	
	
	private void listReporteSquad(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf)throws IOException {
		 StringBuilder strJson1 = new StringBuilder();
		 StringBuilder strJson2 = new StringBuilder();
		 response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			strJson1.append("{\"ListaReporteDispatchSquad\": [");	
			
			try {
				List<BeanReporteDispatch> lstBeanReporteDispatch = null;
				BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
				BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
				
				String strchkFechaFin = request.getParameter("strchkFechaFin");	
				String strFechaActual = request.getParameter("strFechaActual");
				String strFechaInicio = request.getParameter("strCboFechaActualFiltroMesDiaInicio");
				String strFechaFin = request.getParameter("strCboFechaActualFiltroMesFinDiaUltimo");
				if(strchkFechaFin.equals("SI")){
					objBeanReporteDispatch.setStrFechaInicio(strFechaInicio);
					objBeanReporteDispatch.setStrFechaFin(strFechaFin);
				}else {
					objBeanReporteDispatch.setStrFechaActual(strFechaActual);
				}		
				objBeanReporteDispatch.setPais(request.getParameter("strCboPais").equals("0") ? "Peru" : request.getParameter("strCboPais"));
				objBeanReporteDispatch.setStrOwnerGroupId(request.getParameter("strCboTorre").equals("0") ? null : request.getParameter("strCboTorre"));
				
				lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteDispatchSquad(objBeanReporteDispatch, ssf);
				
				String squad;
				
				if (lstBeanReporteDispatch.size() > 0) {
					for (BeanReporteDispatch item : lstBeanReporteDispatch) {
						squad = item.getStrSquad()==null ? "Total" : item.getStrSquad();
						strJson1.append("{" +
								"\"squad\" : \"" +  squad + "\" ," +
								"\"inCriteria\" : \"" + item.getiTicketsIC() + "\" ," +
								"\"outOfCriteria\" : \"" + item.getiTicketsOC() + "\" ," +
								"\"planificado\" : \"" + item.getiTicketsP() + "\" ," +
								"\"total\" : \"" + item.getiTotal()  + "\" " +
								"}," 
								);
					}				
						} else {
						strJson1 = new StringBuilder();
						strJson1.append("{\"ListaReporteDispatchSquad\": [");
						strJson1.append("{" +
						"\"squad\" : \"" + "" + "\" ," +
						"\"inCriteria\" : \"" + " No hay información disponible" + "\" " +
						"},"
						);	
						}
				
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			}catch(Exception ex) {
				ex.printStackTrace();
				strJson1 = new StringBuilder();
				strJson1.append("{\"ListaReporteDispatchSquad\": [");
				strJson1.append("{" +
						"\"squad\" : \"" + "" + "\" ," +
						"\"inCriteria\" : \"" + " No hay información disponible" + "\" " +
						"},"
						);
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
			}
			
			out.print(strJson2);
		
	}
	
	

	private void listComboTorre(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf)throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		try {			
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch();
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();			
			
			objBeanReporteDispatch.setPais(request.getParameter("strCboPais").equals("0") ? null : request.getParameter("strCboPais"));
			
			lstBeanReporteDispatch = objBusinessReporteDispatch.listComboTorre(objBeanReporteDispatch, ssf);
	
			strJson1.append("{\"ListTorre\": [");
									
			if (lstBeanReporteDispatch.size() > 0) {	
				for (BeanReporteDispatch item : lstBeanReporteDispatch) {
					strJson1.append("{" +
							"\"strOwnerGroupId\" : \"" + item.getStrOwnerGroupId() + "\" ," +
							"\"strOwnerGroup\" : \"" + item.getStrOwnerGroup() + "\" " +
							"},"
							);
				}				
			} else {
				strJson1.append(",");
			}
			
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			
		} catch (Exception e) {
			e.printStackTrace();
			strJson1 = new StringBuilder();
			strJson1.append("{\"ListTorre\": [");
			strJson1.append("{" +
					"\"strOwnerGroupId\" : \"" + "" + "\" ," +
					"\"strOwnerGroup\" : \"" + " No hay información disponible" + "\" " +
					"},"
					);			
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");

		}
		out.print(strJson2);		
	}

	
	private void listReporteHorario_barras(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf)throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
						
		try {
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
		
			String strchkFechaFin = request.getParameter("strchkFechaFin");	
			String strFechaActual = request.getParameter("strFechaActual");
			String strFechaInicio = request.getParameter("strCboFechaActualFiltroMesDiaInicio");
			String strFechaFin = request.getParameter("strCboFechaActualFiltroMesFinDiaUltimo");
			if(strchkFechaFin.equals("SI")){
				objBeanReporteDispatch.setStrFechaInicio(strFechaInicio);
				objBeanReporteDispatch.setStrFechaFin(strFechaFin);
			}else {
				objBeanReporteDispatch.setStrFechaActual(strFechaActual);
			}	
		objBeanReporteDispatch.setPais(request.getParameter("strCboPais").equals("0") ? "Peru" : request.getParameter("strCboPais"));
		objBeanReporteDispatch.setStrOwnerGroupId(request.getParameter("strCboTorre").equals("0") ? null : request.getParameter("strCboTorre"));
	
		lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteDispatchHorarioOficina_barras(objBeanReporteDispatch, ssf);
		
		strJson1.append("{\"dataReportHorario_barras\" : [");
		
			strJson1.append("{\"labels\": [");		
			if(lstBeanReporteDispatch.size() > 0){
				for(BeanReporteDispatch item : lstBeanReporteDispatch) {
					strJson1.append("\"" +
							(item.getStrHorarioOficina()) +
							"\",");
				}				
			}else { strJson1.append(","); }			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
		
			strJson1 = new StringBuilder();
			strJson1.append("\"datasets\": [");			
			strJson1.append("{\"label\": \"IN_CRITERIA\",\"backgroundColor\": \"#088A4B\",\"data\": [");			
			if(lstBeanReporteDispatch.size() > 0){
				for(BeanReporteDispatch item : lstBeanReporteDispatch){
					strJson1.append(item.getiTicketsIC() + ",");
				}
			}else { strJson1.append(","); }			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");			
			
			strJson1 = new StringBuilder();
			strJson1.append("{\"label\": \"OUT_OF_CRITERIA\",\"backgroundColor\": \"#FF0000\",\"data\": [");			
			if(lstBeanReporteDispatch.size() > 0){
				for(BeanReporteDispatch item : lstBeanReporteDispatch){
					strJson1.append(item.getiTicketsOC() + ",");
				}
			}else { strJson1.append(","); }			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
			
			strJson1 = new StringBuilder();
			strJson1.append("{\"label\": \"PLANIFICADO\",\"backgroundColor\": \"#BCF5A9\",\"data\": [");			
			if(lstBeanReporteDispatch.size() > 0){
				for(BeanReporteDispatch item : lstBeanReporteDispatch){
					strJson1.append(item.getiTicketsP() + ",");
				}
			}else { strJson1.append(","); }			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}]}");
			
		}catch(Exception ex) {
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		
		out.print(strJson2);
	}	

	
	private void listReporteSquad_barras(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf)throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
						
		try {
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
		
			String strchkFechaFin = request.getParameter("strchkFechaFin");	
			String strFechaActual = request.getParameter("strFechaActual");
			String strFechaInicio = request.getParameter("strCboFechaActualFiltroMesDiaInicio");
			String strFechaFin = request.getParameter("strCboFechaActualFiltroMesFinDiaUltimo");
			if(strchkFechaFin.equals("SI")){
				objBeanReporteDispatch.setStrFechaInicio(strFechaInicio);
				objBeanReporteDispatch.setStrFechaFin(strFechaFin);
			}else {
				objBeanReporteDispatch.setStrFechaActual(strFechaActual);
			}	
		objBeanReporteDispatch.setPais(request.getParameter("strCboPais").equals("0") ? "Peru" : request.getParameter("strCboPais"));
		objBeanReporteDispatch.setStrOwnerGroupId(request.getParameter("strCboTorre").equals("0") ? null : request.getParameter("strCboTorre"));
	
		lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteDispatchSquad_barras(objBeanReporteDispatch, ssf);
		
		strJson1.append("{\"dataReportSquad_barras\" : [");
		
			strJson1.append("{\"labels\": [");		
			if(lstBeanReporteDispatch.size() > 0){
				for(BeanReporteDispatch item : lstBeanReporteDispatch) {
					strJson1.append("\"" +
							(item.getStrSquad()) +
							"\",");
				}				
			}else { strJson1.append(","); }			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
		
			strJson1 = new StringBuilder();
			strJson1.append("\"datasets\": [");			
			strJson1.append("{\"label\": \"IN_CRITERIA\",\"backgroundColor\": \"#088A4B\",\"data\": [");			
			if(lstBeanReporteDispatch.size() > 0){
				for(BeanReporteDispatch item : lstBeanReporteDispatch){
					strJson1.append(item.getiTicketsIC() + ",");
				}
			}
			else { strJson1.append(","); }			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");			
			
			strJson1 = new StringBuilder();
			strJson1.append("{\"label\": \"OUT_OF_CRITERIA\",\"backgroundColor\": \"#FF0000\",\"data\": [");			
			if(lstBeanReporteDispatch.size() > 0){
				for(BeanReporteDispatch item : lstBeanReporteDispatch){
					strJson1.append(item.getiTicketsOC() + ",");
				}
			}else { strJson1.append(","); }			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
			
			strJson1 = new StringBuilder();
			strJson1.append("{\"label\": \"PLANIFICADO\",\"backgroundColor\": \"#BCF5A9\",\"data\": [");			
			if(lstBeanReporteDispatch.size() > 0){
				for(BeanReporteDispatch item : lstBeanReporteDispatch){
					strJson1.append(item.getiTicketsP() + ",");
				}
			}else { strJson1.append(","); }			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}]}");
			
		}catch(Exception ex) {
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		
		out.print(strJson2);		
	}
	
	
	private void listReporteEspecialista_2_barras(HttpServletRequest request, HttpServletResponse response,	SqlSessionFactory ssf)throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
						
		try {
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
		
			String strchkFechaFin = request.getParameter("strchkFechaFin");	
			String strFechaActual = request.getParameter("strFechaActual");
			String strFechaInicio = request.getParameter("strCboFechaActualFiltroMesDiaInicio");
			String strFechaFin = request.getParameter("strCboFechaActualFiltroMesFinDiaUltimo");
			if(strchkFechaFin.equals("SI")){
				objBeanReporteDispatch.setStrFechaInicio(strFechaInicio);
				objBeanReporteDispatch.setStrFechaFin(strFechaFin);
			}else {
				objBeanReporteDispatch.setStrFechaActual(strFechaActual);
			}	
		objBeanReporteDispatch.setPais(request.getParameter("strCboPais").equals("0") ? "Peru" : request.getParameter("strCboPais"));
		objBeanReporteDispatch.setStrOwnerGroupId(request.getParameter("strCboTorre").equals("0") ? null : request.getParameter("strCboTorre"));
	
		lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteDispatchEspecialista_2_barras(objBeanReporteDispatch, ssf);
		
		strJson1.append("{\"dataReportEspecialista_2_barras\" : [");
		
			strJson1.append("{\"labels\": [");		
			if(lstBeanReporteDispatch.size() > 0){
				for(BeanReporteDispatch item : lstBeanReporteDispatch) {
					strJson1.append("\"" +
							(item.getStrOwner()) +
							"\",");
				}				
			}else { strJson1.append(","); }			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
		
			strJson1 = new StringBuilder();
			strJson1.append("\"datasets\": [");			
			strJson1.append("{\"label\": \"IN_CRITERIA\",\"backgroundColor\": \"#088A4B\",\"data\": [");			
			if(lstBeanReporteDispatch.size() > 0){
				for(BeanReporteDispatch item : lstBeanReporteDispatch){
					strJson1.append(item.getiTicketsIC() + ",");
				}
			}else { strJson1.append(","); }			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");			
			
			strJson1 = new StringBuilder();
			strJson1.append("{\"label\": \"OUT_OF_CRITERIA\",\"backgroundColor\": \"#FF0000\",\"data\": [");			
			if(lstBeanReporteDispatch.size() > 0){
				for(BeanReporteDispatch item : lstBeanReporteDispatch){
					strJson1.append(item.getiTicketsOC() + ",");
				}
			}else { strJson1.append(","); }			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
			
			strJson1 = new StringBuilder();
			strJson1.append("{\"label\": \"PLANIFICADO\",\"backgroundColor\": \"#BCF5A9\",\"data\": [");			
			if(lstBeanReporteDispatch.size() > 0){
				for(BeanReporteDispatch item : lstBeanReporteDispatch){
					strJson1.append(item.getiTicketsP() + ",");
				}
			}else { strJson1.append(","); }
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}]}");
			
		}catch(Exception ex) {
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		
		out.print(strJson2);			
	}
	
	

	private void listReporteEspecialista_1_barras(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf)throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
						
		try {
			List<BeanReporteDispatch> lstBeanReporteDispatch = null;
			BusinessReporteDispatch objBusinessReporteDispatch = new BusinessReporteDispatch(); 
			BeanReporteDispatch objBeanReporteDispatch = new BeanReporteDispatch();
		
			String strchkFechaFin = request.getParameter("strchkFechaFin");	
			String strFechaActual = request.getParameter("strFechaActual");
			String strFechaInicio = request.getParameter("strCboFechaActualFiltroMesDiaInicio");
			String strFechaFin = request.getParameter("strCboFechaActualFiltroMesFinDiaUltimo");
			if(strchkFechaFin.equals("SI")){
				objBeanReporteDispatch.setStrFechaInicio(strFechaInicio);
				objBeanReporteDispatch.setStrFechaFin(strFechaFin);
			}else {
				objBeanReporteDispatch.setStrFechaActual(strFechaActual);
			}	
		objBeanReporteDispatch.setPais(request.getParameter("strCboPais").equals("0") ? "Peru" : request.getParameter("strCboPais"));
		objBeanReporteDispatch.setStrOwnerGroupId(request.getParameter("strCboTorre").equals("0") ? null : request.getParameter("strCboTorre"));
	    
		lstBeanReporteDispatch = objBusinessReporteDispatch.listReporteDispatchEspecialista_1_barras(objBeanReporteDispatch, ssf);
		
		strJson1.append("{\"dataReportEspecialista_1_barras\" : [");
		
			strJson1.append("{\"labels\": [");		
			if(lstBeanReporteDispatch.size() > 0){
				for(BeanReporteDispatch item : lstBeanReporteDispatch) {
					strJson1.append("\"" +
							(item.getStrOwner()) +
							"\",");
				}				
			}else { strJson1.append(","); }			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "],");
		
			strJson1 = new StringBuilder();
			strJson1.append("\"datasets\": [");			
			strJson1.append("{\"label\": \"INCIDENT\",\"backgroundColor\": \"#FF8000\",\"data\": [");			
			if(lstBeanReporteDispatch.size() > 0){
				for(BeanReporteDispatch item : lstBeanReporteDispatch){
					strJson1.append(item.getiIncident() + ",");
				}
			}else { strJson1.append(","); }			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");			
			
			strJson1 = new StringBuilder();
			strJson1.append("{\"label\": \"SR\",\"backgroundColor\": \"#5499C7\",\"data\": [");			
			if(lstBeanReporteDispatch.size() > 0){
				for(BeanReporteDispatch item : lstBeanReporteDispatch){
					strJson1.append(item.getiSr() + ",");
				}
			}else { strJson1.append(","); }			
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]},");
			
			strJson1 = new StringBuilder();
			strJson1.append("{\"label\": \"CHANGE\",\"backgroundColor\": \"#2ECC71\",\"data\": [");			
			if(lstBeanReporteDispatch.size() > 0){
				for(BeanReporteDispatch item : lstBeanReporteDispatch){
					strJson1.append(item.getiChange() + ",");
				}
			}else { strJson1.append(","); }
			strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}]}]}");
			
		}catch(Exception ex) {
			System.out.println(ex.getStackTrace());
			strJson2 = new StringBuilder();
			strJson2.append("error");
		}
		
		out.print(strJson2);					
	}
	
	
	
}






