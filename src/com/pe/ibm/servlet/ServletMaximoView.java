package com.pe.ibm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanDashboard;
import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.bean.BeanTicketStatus;
import com.pe.ibm.bean.Feriado;
import com.pe.ibm.bean.Horario;
import com.pe.ibm.business.BusinessMaximoView;
import com.pe.ibm.business.FeriadoService;
import com.pe.ibm.business.HorarioService;
import com.pe.ibm.business.SLATiempoOnsiteService;
import com.pe.ibm.dao.EstadoTicketDAOImpl;
import com.pe.ibm.util.AppUtils;


/**
 * Servlet implementation class ServletMaximoView
 */
@WebServlet("/ServletMaximoView")
public class ServletMaximoView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//Primary Options
	private String strAccion;
	private int team;
	
	//SelectOptions
	private String Tribu;
	private String ticketIdCliente;
	private String ticketIdGrupoPropietario;
	private String ticketEmailPropietario;
	private String check;
	
	private String check1;
	private String check2;
	private String check3;
	private String check4;
	private String check5;
	private String check6;
	
	
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMaximoView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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

		
		if(this.strAccion.equals("SelectClient")) {//selectClient 	(PARENT_CLIENT_ID)
			selectClient(request, response,ssfM, this.strAccion);
		}else if(this.strAccion.equals("SelectGroupOwner")) {//selectGroupOwner	(OWNER_GROUP_ID)
			selectGroupOwner(request, response, ssfM, this.strAccion);
		}else if(this.strAccion.equals("SelectSquad")) {
			selectSquad(request, response, ssfM, this.strAccion);
		}else if(this.strAccion.equals("SelectOwner")) {//selectOwner	(OWNER_ID)
			selectOwner(request, response, ssfM, this.strAccion);
		}else if(this.strAccion.equals("ListPersonal")) {
			UserGrade(request, response, ssf, this.strAccion);
		}else if(this.strAccion.equals("OwnerGrade")) {
			ownergrade(request, response, ssf,ssfM, this.strAccion);
		}else if(this.strAccion.equals("TicketsCount")) {
			ticketsCount(request, response,ssfM, this.strAccion);
		}else if(this.strAccion.equals("OwnersTicketsView")) {
			ownersTicketsView(request, response,ssfM, this.strAccion);
		}else if(this.strAccion.equals("ClientTicketsSLA")) {
			clientTicketsSLA(request, response,ssfSD, this.strAccion);
		}else if(this.strAccion.equals("OwnersTicketsAssistance")) {
			ownersTicketsAssistance(request, response,ssf, this.strAccion);
		}else if(this.strAccion.equals("MatchActiveUsers")) {
			matchActiveUsers(request, response,ssf, ssfM, this.strAccion);
		}else if(this.strAccion.equals("NoMatchActiveUsers")) {
			nomatchActiveUsers(request, response,ssf, ssfM, this.strAccion);
		}else if(this.strAccion.equals("ListEyS")) {
			listEyS(request, response,ssf,this.strAccion);
		}else if(this.strAccion.equals("ModalAcumuladosTicket")) {
			modalacumuladosticket(request, response,ssfM,this.strAccion);
		}else if(this.strAccion.equals("ModalSinAsignarTicket")) {
			modalsinasignarticket(request, response,ssfM,this.strAccion);
		}else if(this.strAccion.equals("ModalPrioridadTicket")) {
			modalprioridadticket(request, response,ssfM,this.strAccion);
		}else if(this.strAccion.equals("ModalVigentes")) {
			modalvigentesticket(request, response,ssfM,this.strAccion);
		}else if(this.strAccion.equals("ModalVencidos")) {
			modalvencidosticket(request, response,ssfM,this.strAccion);
		}else if(this.strAccion.equals("Tabla1")) {
			tabla1(request, response,ssfM,this.strAccion,ssfSD);
		}else if(this.strAccion.equals("Tabla2")) {
			tabla2(request, response,ssfM,this.strAccion);
		}else if(this.strAccion.equals("Tabla3")) {
			tabla3(request, response,ssfM,this.strAccion);
		}else if(this.strAccion.equals("ListarGrupoWO")) {
			listarGrupoWO(request, response,ssfM,this.strAccion);
		}
		
		else {
			System.out.println(strAccion);
		}
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
//	S	E	L	E	C	T	-	O	P	T	I	O	N	S
	
	//Complete
	
	private void selectSquad(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssfM, String vSchema) throws IOException {
		//J	S	O	N
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		StringBuilder pJson = new StringBuilder();
		StringBuilder sJson = new StringBuilder();
		
		// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
		BusinessMaximoView businessMaximoView = new BusinessMaximoView();
		BeanMaximo beanMaximo = new BeanMaximo();
		
		try {
			// P	A	R	A	M	S

			// Prepare BEAN
			
			// Result
			List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>(); 
			
			// Execute
			beanResult = businessMaximoView.selectSquad(beanMaximo, ssfM);
			
			if (beanResult.size() > 0) {
				//SET JSON
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"selectSquad\": [");
				for (BeanMaximo bean : beanResult) {
					
						pJson.append("{" +
								"\"ticketIdSquad\" : \"" + bean.getStrValor1()+ "\" ," +
								"\"ticketSquad\" : \"" + bean.getStrValor1()+ "\"" +
								"},"
								);
					}
				
			}else {
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"selectSquad\": [");
				pJson.append("{" +
						"\"ticketIdSquad\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			}
			//SET Second Json
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
			
		} catch (Exception e) {
			e.printStackTrace();
			
//			pJson.append("{\""+vSchema+"\": [");
			pJson.append("{\"selectSquad\": [");
			pJson.append("{" +
					"\"ticketIdSquad\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
		}
		out.print(sJson);
	}
	
	
	private void selectClient(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssfM, String vSchema) throws IOException {
		//J	S	O	N
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		StringBuilder pJson = new StringBuilder();
		StringBuilder sJson = new StringBuilder();
		
		// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
		BusinessMaximoView businessMaximoView = new BusinessMaximoView();
		BeanMaximo beanMaximo = new BeanMaximo();
		
		try {
			// P	A	R	A	M	S

			// Prepare BEAN
			beanMaximo.setStrValor1(request.getParameter("SQUAD"));
			// Result
			List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>(); 
			
			// Execute
			beanResult = businessMaximoView.selectClient(beanMaximo, ssfM);
			
			
			if (beanResult.size() > 0) {
				//SET JSON
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"CboClient\": [");
				for (BeanMaximo bean : beanResult) {
					if (bean.getTicketIdCliente() != null && bean.getTicketCliente() != null) {
						pJson.append("{" +
								"\"ticketIdCliente\" : \"" + bean.getTicketIdCliente()+ "\" ," +
								"\"ticketCliente\" : \"" + bean.getTicketCliente()+ "\"" +
								"},"
								);
					}
				}
			}else {
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"CboClient\": [");
				pJson.append("{" +
						"\"Message\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			}
			//SET Second Json
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
			
		} catch (Exception e) {
			e.printStackTrace();
			
//			pJson.append("{\""+vSchema+"\": [");
			pJson.append("{\"CboClient\": [");
			pJson.append("{" +
					"\"Message\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
		}
		out.print(sJson);
	}
	
	//Complete
	private void selectGroupOwner(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssfM, String vSchema) throws IOException {
		//J	S	O	N
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		StringBuilder pJson = new StringBuilder();
		StringBuilder sJson = new StringBuilder();
		
		// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
		BusinessMaximoView businessMaximoView = new BusinessMaximoView();
		BeanMaximo beanMaximo = new BeanMaximo();
			
		try {
			// P	A	R	A	M	S
			this.ticketIdCliente = request.getParameter("ticketIdCliente");

			// Prepare BEAN
			beanMaximo.setTicketIdCliente(this.ticketIdCliente == null || this.ticketIdCliente.equals("null") || this.ticketIdCliente.equals("0") || this.ticketIdCliente.equals("TODOS") ? null : splitQueryVariable(this.ticketIdCliente));
			
			// Result	
			List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>(); 
			
			// Execute
			beanResult = businessMaximoView.selectGroupOwner(beanMaximo, ssfM);
			
			if (beanResult.size() > 0) {
				//SET JSON
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"CboGroupOwner\": [");
				
				for (BeanMaximo bean : beanResult) {
					pJson.append("{" +
							"\"ticketIdGrupoPropietario\" : \"" + bean.getTicketIdGrupoPropietario()+ "\" ," +
							"\"ticketGrupoPropietario\" : \"" + bean.getTicketGrupoPropietario()+ "\"" +
							"},"
							);
				}
				
			}else {
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"CboGroupOwner\": [");
				pJson.append("{[{" +
						"\"Message\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			}
			//SET Second Json
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
			
		} catch (Exception e) {
			e.printStackTrace();
			
//			pJson.append("{\""+vSchema+"\": [");
			pJson.append("{\"CboGroupOwner\": [");
			pJson.append("{" +
					"\"Message\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
		}
		out.print(sJson);
	}
	
	//Complete
	private void selectOwner(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssfM, String vSchema) throws IOException {
		//J	S	O	N
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		StringBuilder pJson = new StringBuilder();
		StringBuilder sJson = new StringBuilder();
		
		// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
		BusinessMaximoView businessMaximoView = new BusinessMaximoView();
		BeanMaximo beanMaximo = new BeanMaximo();
		
		try {
			// P	A	R	A	M	S
			this.Tribu = request.getParameter("tribu");
			this.ticketIdCliente = request.getParameter("ticketIdCliente");
			this.ticketIdGrupoPropietario = request.getParameter("ticketIdGrupoPropietario");
			this.ticketEmailPropietario = request.getParameter("ticketEmailPropietario");
			this.check = request.getParameter("checkbox");//SR2
			this.check1 = request.getParameter("checkbox1");//SR
			this.check2 = request.getParameter("checkbox2");//INCIDENTES
			this.check3 = request.getParameter("checkbox3");//PROBLEMAS
			this.check4 = request.getParameter("checkbox4");//WORKORDER
			this.check5 = request.getParameter("checkbox5");//Activity
			this.check6 = request.getParameter("checkbox6");//CHANGE

			// Prepare BEAN
			beanMaximo.setTribu("'"+this.Tribu+"'");
			beanMaximo.setTicketIdCliente(this.ticketIdCliente == null || this.ticketIdCliente.equals("null") || this.ticketIdCliente.equals("0") || this.ticketIdCliente.equals("TODOS") ? null : splitQueryVariable(this.ticketIdCliente));
			//Custom OwnerGroup Multiple Options
			beanMaximo.setTicketIdGrupoPropietario(this.ticketIdGrupoPropietario == null || this.ticketIdGrupoPropietario.equals("null") || this.ticketIdGrupoPropietario.equals("0") || this.ticketIdGrupoPropietario.equals("TODOS") ? null : splitQueryVariable(this.ticketIdGrupoPropietario));
			beanMaximo.setTicketEmailPropietario(this.ticketEmailPropietario == null || this.ticketEmailPropietario.equals("null") || this.ticketEmailPropietario.equals("0") || this.ticketEmailPropietario.equals("TODOS") ? null : splitQueryVariable(this.ticketEmailPropietario));
			beanMaximo.setStrValor4(this.check.equals("0") ? null : "1");//SR2 SOLO PARA MESA DE SERVICIO
			beanMaximo.setStrValor5(this.check1.equals("0") ? null : "1");//SR
			beanMaximo.setStrValor6(this.check2.equals("0") ? null : "1");//INCIDENTES
			beanMaximo.setStrValor7(this.check3.equals("0") ? null : "1");//PROBLEMAS
			beanMaximo.setStrValor8(this.check4.equals("0") ? null : "1");//WorkOrder
			beanMaximo.setStrValor9(this.check5.equals("0") ? null : "1");//Activity
			beanMaximo.setStrValor10(this.check6.equals("0") ? null : "1");//Change
			
			// Result
			List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>(); 
			
			// Execute
			beanResult = businessMaximoView.selectOwner(beanMaximo, ssfM);
			
			if (beanResult.size() > 0) {
				//SET JSON
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"CboOwner\": [");
				
				for (BeanMaximo bean : beanResult) {
					pJson.append("{" +
							"\"OwnerId\" : \"" + bean.getTicketEmailPropietario()+ "\" ," +
							"\"Owner\" : \"" + bean.getTicketPropietario()+ "\" ," +
							"\"Dia\" : \"" + bean.getStrValor1()+ "\" ," +
							"\"Horas\" : \"" + bean.getStrValor2()+ "\" ," +
							"\"Minutos\" : \"" + bean.getStrValor3()+ "\" ," +
							"\"Totales\" : \"" + bean.getStrValor4()+ "\" ," +
							"\"Vigentes\" : \"" + bean.getStrValor5()+ "\" ," +								
							"\"Vencidos\" : \"" + bean.getStrValor6()+ "\"" +
							
							"},"
							);
				}
			}else {
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"CboOwner\": [");
				pJson.append("{" +
						"\"OwnerId\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			}
			//SET Second Json
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
			
		} catch (Exception e) {
			e.printStackTrace();
			
//			pJson.append("{\""+vSchema+"\": [");
			pJson.append("{\"CboOwner\": [");
			pJson.append("{" +
					"\"OwnerId\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
		}
		out.print(sJson);
	}
	
//	L	O	G	I	C
	
	//Complete
	private void ticketsCount(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssfM, String vSchema) throws IOException {
		//J		S	O	N
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		StringBuilder pJson = new StringBuilder();
		StringBuilder sJson = new StringBuilder();
		
		// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
		BusinessMaximoView businessMaximoView = new BusinessMaximoView();
		BeanMaximo beanMaximo = new BeanMaximo();
		
		try {
			// P	A	R	A	M	S
			this.Tribu = request.getParameter("tribu");
			this.ticketIdCliente = request.getParameter("ticketIdCliente");
			this.ticketIdGrupoPropietario = request.getParameter("ticketIdGrupoPropietario");
			this.ticketEmailPropietario = request.getParameter("ticketEmailPropietario");
			this.check = request.getParameter("checkbox");//SR2
			this.check1 = request.getParameter("checkbox1");//SR
			this.check2 = request.getParameter("checkbox2");//INCIDENTES
			this.check3 = request.getParameter("checkbox3");//PROBLEMAS
			this.check4 = request.getParameter("checkbox4");//WORKORDER
			this.check5 = request.getParameter("checkbox5");//Activity
			this.check6 = request.getParameter("checkbox6");//CHANGE

			// Prepare BEAN
			beanMaximo.setTribu("'"+this.Tribu+"'");
			beanMaximo.setTicketIdCliente(this.ticketIdCliente == null || this.ticketIdCliente.equals("null") || this.ticketIdCliente.equals("0") || this.ticketIdCliente.equals("TODOS") ? null : splitQueryVariable(this.ticketIdCliente));
			beanMaximo.setTicketIdGrupoPropietario(this.ticketIdGrupoPropietario == null || this.ticketIdGrupoPropietario.equals("null") || this.ticketIdGrupoPropietario.equals("0") || this.ticketIdGrupoPropietario.equals("TODOS") ? null : splitQueryVariable(this.ticketIdGrupoPropietario));		
			beanMaximo.setTicketEmailPropietario(this.ticketEmailPropietario == null || this.ticketEmailPropietario.equals("null") || this.ticketEmailPropietario.equals("0") || this.ticketEmailPropietario.equals("TODOS") ? null : splitQueryVariable(this.ticketEmailPropietario));
			beanMaximo.setStrValor4(this.check.equals("0") ? null : "1");//SR2
			beanMaximo.setStrValor5(this.check1.equals("0") ? null : "1");//SR
			beanMaximo.setStrValor6(this.check2.equals("0") ? null : "1");//INCIDENTES
			beanMaximo.setStrValor7(this.check3.equals("0") ? null : "1");//PROBLEMAS
			beanMaximo.setStrValor8(this.check4.equals("0") ? null : "1");//WorkOrder
			beanMaximo.setStrValor9(this.check5.equals("0") ? null : "1");//Activity
			beanMaximo.setStrValor10(this.check6.equals("0") ? null : "1");//Change
			// Result
			BeanMaximo beanResult = new BeanMaximo(); 
			
			// Execute
			beanResult = businessMaximoView.ticketsCount(beanMaximo, ssfM);
			
			if (beanResult != null) {
				//SET JSON
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"ticketsCount\": [");
				
				pJson.append("{" +
						"\"ticketsAcu\" : \"" + beanResult.getStrValor1()+ "\" ," +
						"\"ticketsPri\" : \"" + beanResult.getStrValor2()+ "\" ," +
						"\"ticketsSAS\" : \"" + beanResult.getStrValor3()+ "\"" +
						"},"
						);
			}else {
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"ticketsCount\": [");
				pJson.append("{" +
						"\"ticketsAcu\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			}
			//SET Second Json
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
			
		} catch (Exception e) {
			e.printStackTrace();
			
//			pJson.append("{\""+vSchema+"\": [");
			pJson.append("{\"ticketsCount\": [");
			pJson.append("{" +
					"\"ticketsAcu\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
		}
		
		out.print(sJson);
	}	
	
	
	//Complete -	Used By MatchActiveUsers
	private void ownersTicketsView(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssfM, String vSchema) throws IOException {
		//J	S	O	N
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		StringBuilder pJson = new StringBuilder();
		StringBuilder sJson = new StringBuilder();
		
		// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
		BusinessMaximoView businessMaximoView = new BusinessMaximoView();
		BeanMaximo beanMaximo = new BeanMaximo();
		
		try {
			// P	A	R	A	M	S
			this.ticketIdCliente = request.getParameter("ticketIdCliente");
			this.ticketIdGrupoPropietario = request.getParameter("ticketIdGrupoPropietario");
			// Prepare BEAN
			beanMaximo.setTicketIdCliente(this.ticketIdCliente == null || this.ticketIdCliente.equals("null") || this.ticketIdCliente.equals("0") || this.ticketIdCliente.equals("TODOS") ? null : splitQueryVariable(this.ticketIdCliente));
			beanMaximo.setTicketIdGrupoPropietario(splitQueryVariable(this.ticketIdGrupoPropietario));	
			// Result
			List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>(); 
			
			// Execute
			beanResult = businessMaximoView.ownersTicketsView(beanMaximo, ssfM);
			
			if (beanResult.size() > 0) {
				//SET JSON
				pJson.append("{\""+vSchema+"\": [");
				
				for(BeanMaximo bean : beanResult) {
					pJson.append("{" +
							"\"ticketEmailPropietario\" : \"" + bean.getTicketEmailPropietario().toLowerCase()+ "\" ," +
							"\"ticketPropietario\" : \"" + bean.getTicketPropietario()+ "\"" +
							"},"
							);
				}
			}else {
				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{" +
						"\"Message\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			}
			//SET Second Json
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
			
		} catch (Exception e) {
			e.printStackTrace();
			
			pJson.append("{\""+vSchema+"\": [");
			pJson.append("{" +
					"\"Message\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
		}
		
		out.print(sJson);
	}

	
	//Complete
	private void clientTicketsSLA(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssfM, String vSchema) throws IOException {
		//J	S	O	N
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		StringBuilder pJson = new StringBuilder();
		StringBuilder sJson = new StringBuilder();
		
		// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
		BusinessMaximoView businessMaximoView = new BusinessMaximoView();
		BeanMaximo beanMaximo = new BeanMaximo();
		
		try {
			// P	A	R	A	M	S
			this.ticketIdCliente = request.getParameter("ticketIdCliente");

			// Prepare BEAN
			beanMaximo.setTicketIdCliente(this.ticketIdCliente == null || this.ticketIdCliente.equals("null") || this.ticketIdCliente.equals("0") || this.ticketIdCliente.equals("TODOS") ? null : splitQueryVariable(this.ticketIdCliente));
			
			// Result
			List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>(); 
			
			// Execute
			beanResult = businessMaximoView.clientTicketsSLA(beanMaximo, ssfM);
			
			if (beanResult.size() > 0) {
				//SET JSON
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"Sla\" : [");
				for(BeanMaximo bean : beanResult) {
					pJson.append("{" +
							"\"slaTitulo\" : \"" + bean.getStrValor1()+ "\" ," +
							"\"slaNumerico\" : \"" + bean.getStrValor2()+ "\"" +
							"},"
							);
				}
			}else {
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"Sla\" : [");
				pJson.append("{" +
						"\"slaTitulo\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			}
			//SET Second Json
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
			
		} catch (Exception e) {
			e.printStackTrace();
			
//			pJson.append("{\""+vSchema+"\": [");
			pJson.append("{\"Sla\" : [");
			pJson.append("{" +
					"\"slaTitulo\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
		}
		
		out.print(sJson);
	}
	
	//Complete	-	Used By MatchActiveUsers
	private void ownersTicketsAssistance(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssfM, String vSchema) throws IOException {
		//J	S	O	N
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		StringBuilder pJson = new StringBuilder();
		StringBuilder sJson = new StringBuilder();
		
		// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
		BusinessMaximoView businessMaximoView = new BusinessMaximoView();
		BeanMaximo beanMaximo = new BeanMaximo();
		
		try {
			// P	A	R	A	M	S
			//TODO: Unused variable
			this.team = Integer.parseInt(request.getParameter("idTeam"));

			// Prepare BEAN
			beanMaximo.setStrValor1(splitQueryVariable(request.getParameter("idTeam")));
			
			// Result
			List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>(); 
			
			// Execute
			beanResult = businessMaximoView.ownersTicketsAssistance(beanMaximo, ssfM);
			
			if (beanResult.size() > 0) {
				//SET JSON
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"ownersTicketsAssistance\" : [");
				
				for(BeanMaximo bean : beanResult) {
					pJson.append("{" +
							"\"idEmpleado\" : \"" + bean.getStrValor1()+ "\" ," +
							"\"nombre\" : \"" + bean.getStrValor2()+ "\" ," +
							"\"apPaterno\" : \"" + bean.getStrValor3()+ "\" ," +
							"\"idTeam\" : \"" + bean.getStrValor4()+ "\" ," +
							"\"ticketEmailPropietario\" : \"" + bean.getTicketEmailPropietario()+ "\"" +
							"},"
							);
				}
			}else {
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"ownersTicketsAssistance\" : [");
				pJson.append("{" +
						"\"Message\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			}
			//SET Second Json
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
			
		} catch (Exception e) {
			e.printStackTrace();
			
			pJson.append("{\""+vSchema+"\": [");
			pJson.append("{" +
					"\"Message\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
		}
		
		out.print(sJson);
	}
	
	//Complete
	//Requires: ticketIdCliente,ticketIdGrupoPropietario, strValor1 as IDTEAM
	private void matchActiveUsers(HttpServletRequest request, HttpServletResponse response,SqlSessionFactory ssf, SqlSessionFactory ssfM, String vSchema) throws IOException {
		//J	S	O	N
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		StringBuilder pJson = new StringBuilder();
		StringBuilder sJson = new StringBuilder();
		
		// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
		BusinessMaximoView businessMaximoView = new BusinessMaximoView();
		BeanMaximo beanMaximo = new BeanMaximo();
		
		try {
			// P	A	R	A	M	S
			//TODO: team is not being used
			this.team = Integer.parseInt(request.getParameter("idTeam"));
			this.ticketIdCliente = request.getParameter("ticketIdCliente");
			this.ticketIdGrupoPropietario = request.getParameter("ticketIdGrupoPropietario");	
			
			// Prepare BEAN
			beanMaximo.setStrValor1(splitQueryVariable(request.getParameter("idTeam")));
			beanMaximo.setTicketIdCliente(this.ticketIdCliente == null || this.ticketIdCliente.equals("null") || this.ticketIdCliente.equals("0") || this.ticketIdCliente.equals("TODOS") ? null : splitQueryVariable(this.ticketIdCliente));
			beanMaximo.setTicketIdGrupoPropietario(this.ticketIdGrupoPropietario == null || this.ticketIdGrupoPropietario.equals("null") || this.ticketIdGrupoPropietario.equals("0") || this.ticketIdGrupoPropietario.equals("TODOS") ? null : splitQueryVariable(this.ticketIdGrupoPropietario));
			
			// Result
			List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>(); 
			
			// Execute
			beanResult = businessMaximoView.matchActiveUsers(beanMaximo,ssf, ssfM);
			
			if (beanResult.size() > 0) {
				//SET JSON
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"matchActiveUsers\" : [");
				
				
				for(BeanMaximo bean : beanResult) {
					pJson.append("{" +
							"\"idEmpleado\" : \"" + bean.getStrValor1()+ "\" ," +
							"\"nombre\" : \"" + bean.getStrValor2()+ "\" ," +
							"\"apPaterno\" : \"" + bean.getStrValor3()+ "\" ," +
							"\"idTeam\" : \"" + bean.getStrValor4()+ "\" ," +
							"\"ticketPropietario\" : \"" + bean.getTicketPropietario()+ "\" ," +
							"\"ticketEmailPropietario\" : \"" + bean.getTicketEmailPropietario()+ "\"" +
							"},"
							);
				}
			}else {
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"matchActiveUsers\" : [");
				pJson.append("{" +
						"\"idEmpleado\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			}
			//SET Second Json
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
			
		} catch (Exception e) {
			e.printStackTrace();
			
//			pJson.append("{\""+vSchema+"\": [");
			pJson.append("{\"matchActiveUsers\" : [");
			pJson.append("{" +
					"\"idEmpleado\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
		}
		
		out.print(sJson);
	}
	
	
	private void nomatchActiveUsers(HttpServletRequest request, HttpServletResponse response,SqlSessionFactory ssf, SqlSessionFactory ssfM, String vSchema) throws IOException {
		//J	S	O	N
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		StringBuilder pJson = new StringBuilder();
		StringBuilder sJson = new StringBuilder();
		
		// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
		BusinessMaximoView businessMaximoView = new BusinessMaximoView();
		BeanMaximo beanMaximo = new BeanMaximo();
		
		try {
			// P	A	R	A	M	S
			//TODO: team is not being used
			this.team = Integer.parseInt(request.getParameter("idTeam"));
			this.ticketIdCliente = request.getParameter("ticketIdCliente");
			this.ticketIdGrupoPropietario = request.getParameter("ticketIdGrupoPropietario");	
			
			// Prepare BEAN
			beanMaximo.setStrValor1(splitQueryVariable(request.getParameter("idTeam")));
			beanMaximo.setTicketIdCliente(this.ticketIdCliente == null || this.ticketIdCliente.equals("null") || this.ticketIdCliente.equals("0") || this.ticketIdCliente.equals("TODOS") ? null : splitQueryVariable(this.ticketIdCliente));
			beanMaximo.setTicketIdGrupoPropietario(this.ticketIdGrupoPropietario == null || this.ticketIdGrupoPropietario.equals("null") || this.ticketIdGrupoPropietario.equals("0") || this.ticketIdGrupoPropietario.equals("TODOS") ? null : splitQueryVariable(this.ticketIdGrupoPropietario));
						
			// Result
			List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>(); 
			
			// Execute
			beanResult = businessMaximoView.nomatchActiveUsers(beanMaximo,ssf, ssfM);
			
			if (beanResult.size() > 0) {
				//SET JSON
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"nomatchActiveUsers\" : [");
				
				for(BeanMaximo bean : beanResult) {
					pJson.append("{" +							
							"\"ticketPropietario\" : \"" + bean.getTicketPropietario()+ "\" ," +
							"\"ticketEmailPropietario\" : \"" + bean.getTicketEmailPropietario().toLowerCase()+ "\"" +
							"},"
							);
				}
			}else {
//				pJson.append("{\""+vSchema+"\": [");
				pJson.append("{\"nomatchActiveUsers\" : [");
				pJson.append("{" +
						"\"ticketPropietario\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			}
			//SET Second Json
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
			
		} catch (Exception e) {
			e.printStackTrace();
			
//			pJson.append("{\""+vSchema+"\": [");
			pJson.append("{\"nomatchActiveUsers\" : [");
			pJson.append("{" +
					"\"ticketPropietario\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
		}
		
		out.print(sJson);
	}
	
	
	private void listEyS(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf,String strAccion) throws IOException {
		
		//J	S	O	N
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			StringBuilder pJson = new StringBuilder();
			StringBuilder sJson = new StringBuilder();
			// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
			BusinessMaximoView businessMaximoView = new BusinessMaximoView();
			BeanParameters beanParameters = new BeanParameters();
			
			try {
				
				// Prepare BEAN	
				beanParameters.setStrValor1(splitQueryVariable(request.getParameter("idTeam")));
				beanParameters.setStrValor2(splitQueryVariable(request.getParameter("idEmpleado")));
				// Result
				List<BeanParameters> beanResult = new ArrayList<BeanParameters>();
				// Execute
				beanResult = businessMaximoView.listEyS(beanParameters, ssf);
				
				if (beanResult.size() > 0) {
					//SET JSON
					pJson.append("{\"listEyS\" : [");
					for(BeanParameters bean : beanResult) {
						pJson.append("{" +
								"\"iIdEmpleado\" : \"" + bean.getiValor1()+ "\" ," +
								"\"Email\" : \"" + bean.getStrValor2()+ "\" ," +
								"\"strDateE\" : \"" + bean.getStrdateE()+ "\"" +
								"},"
								);
					}
				}else {
					pJson.append("{\"listEyS\" : [");
					pJson.append("{" +
							"\"Message\" : \"" + "No hay registros" + "\" " +
							"},"
							);
				}
				//SET Second Json
				sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
				
			} catch (Exception e) {
				e.printStackTrace();
				
				pJson.append("{\"listEyS\" : [");
				pJson.append("{" +
						"\"Message\" : \"" + "No hay registros" + "\" " +
						"},"
						);
				sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
			}
			
			out.print(sJson);
		}
	
	
		private void modalacumuladosticket(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf,String strAccion) throws IOException {
		
		//J	S	O	N			
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			StringBuilder pJson = new StringBuilder();
			StringBuilder sJson = new StringBuilder();
			// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
			BusinessMaximoView businessMaximoView = new BusinessMaximoView();
			BeanMaximo beanMaximo = new BeanMaximo();
			
			try {
				this.Tribu = request.getParameter("tribu");
				this.ticketIdCliente = request.getParameter("idcliente");
				this.ticketIdGrupoPropietario = request.getParameter("idgrupo");
				this.ticketEmailPropietario = request.getParameter("email");
				this.check = request.getParameter("checkbox");//SR2
				this.check1 = request.getParameter("checkbox1");//SR
				this.check2 = request.getParameter("checkbox2");//INCIDENTES
				this.check3 = request.getParameter("checkbox3");//PROBLEMAS
				this.check4 = request.getParameter("checkbox4");//WORKORDER
				this.check5 = request.getParameter("checkbox5");//Activity
				this.check6 = request.getParameter("checkbox6");//CHANGE
				
				// Prepare BEAN	
				beanMaximo.setTribu("'"+this.Tribu+"'");
				beanMaximo.setStrValor1(this.ticketIdCliente == null || this.ticketIdCliente.equals("null") || this.ticketIdCliente.equals("0") || this.ticketIdCliente.equals("TODOS") ? null :splitQueryVariable(this.ticketIdCliente));
				beanMaximo.setStrValor2(this.ticketIdGrupoPropietario == null || this.ticketIdGrupoPropietario.equals("null") || this.ticketIdGrupoPropietario.equals("0") || this.ticketIdGrupoPropietario.equals("TODOS") ? null :splitQueryVariable(this.ticketIdGrupoPropietario));
				beanMaximo.setStrValor3(this.ticketEmailPropietario == null || this.ticketEmailPropietario.equals("null") || this.ticketEmailPropietario.equals("0") || this.ticketEmailPropietario.equals("TODOS") ? null :splitQueryVariable(this.ticketEmailPropietario));				
				beanMaximo.setStrValor4(this.check.equals("0") ? null : "1");//SR2 SOLO PARA MESA DE SERVICIO
				beanMaximo.setStrValor5(this.check1.equals("0") ? null : "1");//SR
				beanMaximo.setStrValor6(this.check2.equals("0") ? null : "1");//INCIDENTES
				beanMaximo.setStrValor7(this.check3.equals("0") ? null : "1");//PROBLEMAS
				beanMaximo.setStrValor8(this.check4.equals("0") ? null : "1");//WorkOrder
				beanMaximo.setStrValor9(this.check5.equals("0") ? null : "1");//Activity
				beanMaximo.setStrValor10(this.check6.equals("0") ? null : "1");//Change
				// Result
				List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>();
				// Execute
				beanResult = businessMaximoView.modalticketacum(beanMaximo, ssf);
				
				if (beanResult.size() > 0) {
					//SET JSON
					pJson.append("{\"modalacumuladosticket\" : [");
					for(BeanMaximo bean : beanResult) {
						pJson.append("{" +					
								"\"CodigoTicket\" : \"" + bean.getIdTicket()+ "\" ," +
//								"\"TicketPadre\" : \"" + bean.getTicketParent()+ "\" ," +
								"\"PrioridadInterna\" : \"" + bean.getTicketTitulo()+ "\" ," +
								"\"Status\" : \"" + bean.getTicketDetalle()+ "\" ," +
								"\"Source\" : \"" + bean.getTicketIdCliente()+ "\"," +
								"\"PersonaAfectada\" : \"" + bean.getTicketCliente()+ "\" ," +
								"\"IdGrupo\" : \"" + bean.getTicketPrioridad()+ "\" ," +
								"\"Grupo\" : \"" + bean.getTicketImpact()+ "\" ," +
								"\"IdPropietario\" : \"" + bean.getTicketUrgencia()+ "\"," +
								"\"Propietario\" : \"" + bean.getTicketFechaCreacion()+ "\" ," +
								"\"ParentClient\" : \"" + bean.getTicketFechaFin()+ "\" ," +
								"\"Summary\" : \"" + AppUtils.cleanString(bean.getTicketIdEstado()) + "\" ," +
								"\"CI\" : \"" + AppUtils.cleanString(bean.getTicketUsuarioVip())+ "\"," +
								"\"CI_Nombre\" : \"" + bean.getTicketEstado()+ "\"," +
								"\"IdClasificacion\" : \"" + bean.getTicketIdGrupoPropietario()+ "\"," +
								"\"Clasificacion\" : \"" + AppUtils.cleanString(bean.getTicketGrupoPropietario())+ "\" ," +
								"\"FechaDeCreacion\" : \"" + bean.getTicketIdLugar()+ "\" ," +
								"\"FechaReporte\" : \"" + bean.getTicketLugar()+ "\" ," +
								"\"InicioActual\" : \"" + bean.getTicketITGrupoResolutor()+ "\"," +
								"\"COPR\" : \"" + bean.getTicketIdGrupoResolutor()+ "\" ," +
								"\"Backlog\" : \"" + bean.getTicketGrupoResolutor()+ "\" ," +
								"\"TimeToResolve\" : \"" + bean.getTicketPropietario()+ "\"," +
								"\"AC\" : \"" + bean.getTicketEmailPropietario()+ "\"," + 
								"\"ParentTicket\" : \"" + bean.getStrParentTicket()+ "\"," +
								
								"\"WORKLOG\" : \"" + AppUtils.cleanString(bean.getTicketPersonaReportado())+ "\"," +
								"\"WO_Group\" : \"" + bean.getStrValor11()+ "\"" +
								"},"
								);
					}
				}else {
					pJson.append("{\"modalacumuladosticket\" : [");
					pJson.append("{" +
							"\"CodigoTicket\" : \"" + "No hay registros" + "\" " +
							"},"
							);
				}
				//SET Second Json
				sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
				
			} catch (Exception e) {
				e.printStackTrace();
				
				pJson.append("{\"modalacumuladosticket\" : [");
				pJson.append("{" +
						"\"CodigoTicket\" : \"" + "No hay registros" + "\" " +
						"},"
						);
				sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
			}
			
			out.print(sJson);
		}
		
		
		private void modalsinasignarticket(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf,String strAccion) throws IOException {
			
			//J	S	O	N
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				StringBuilder pJson = new StringBuilder();
				StringBuilder sJson = new StringBuilder();
				// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
				BusinessMaximoView businessMaximoView = new BusinessMaximoView();
				BeanMaximo beanMaximo = new BeanMaximo();
				
				try {
					this.Tribu = request.getParameter("tribu");
					this.ticketIdCliente = request.getParameter("idcliente");
					this.ticketIdGrupoPropietario = request.getParameter("idgrupo");
					
					this.check = request.getParameter("checkbox");//SR2
					this.check1 = request.getParameter("checkbox1");//SR
					this.check2 = request.getParameter("checkbox2");//INCIDENTES
					this.check3 = request.getParameter("checkbox3");//PROBLEMAS
					this.check4 = request.getParameter("checkbox4");//WORKORDER
					this.check5 = request.getParameter("checkbox5");//Activity
					this.check6 = request.getParameter("checkbox6");//CHANGE
					
					// Prepare BEAN	
					beanMaximo.setTribu("'"+this.Tribu+"'");
					beanMaximo.setStrValor1(this.ticketIdCliente == null || this.ticketIdCliente.equals("null") || this.ticketIdCliente.equals("0") || this.ticketIdCliente.equals("TODOS") ? null :splitQueryVariable(this.ticketIdCliente));
					beanMaximo.setStrValor2(this.ticketIdGrupoPropietario == null || this.ticketIdGrupoPropietario.equals("null") || this.ticketIdGrupoPropietario.equals("0") || this.ticketIdGrupoPropietario.equals("TODOS") ? null :splitQueryVariable(this.ticketIdGrupoPropietario));
									
					beanMaximo.setStrValor4(this.check.equals("0") ? null : "1");//SR2
					beanMaximo.setStrValor5(this.check1.equals("0") ? null : "1");//SR
					beanMaximo.setStrValor6(this.check2.equals("0") ? null : "1");//INCIDENTES
					beanMaximo.setStrValor7(this.check3.equals("0") ? null : "1");//PROBLEMAS
					beanMaximo.setStrValor8(this.check4.equals("0") ? null : "1");//WorkOrder
					beanMaximo.setStrValor9(this.check5.equals("0") ? null : "1");//Activity
					beanMaximo.setStrValor10(this.check6.equals("0") ? null : "1");//Change
					
					// Result
					List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>();
					// Execute
					beanResult = businessMaximoView.modalticketsinasig(beanMaximo, ssf);
					
					if (beanResult.size() > 0) {
						//SET JSON
						pJson.append("{\"modalsinasignarticket\" : [");
						for(BeanMaximo bean : beanResult) {
							pJson.append("{" +					
									"\"CodigoTicket\" : \"" + bean.getIdTicket()+ "\" ," +
//									"\"TicketPadre\" : \"" + bean.getTicketParent()+ "\" ," +
									"\"PrioridadInterna\" : \"" + bean.getTicketTitulo()+ "\" ," +
									"\"Status\" : \"" + bean.getTicketDetalle()+ "\" ," +
									"\"Source\" : \"" + bean.getTicketIdCliente()+ "\"," +
									"\"PersonaAfectada\" : \"" + bean.getTicketCliente()+ "\" ," +
									"\"IdGrupo\" : \"" + bean.getTicketPrioridad()+ "\" ," +
									"\"Grupo\" : \"" + bean.getTicketImpact()+ "\" ," +
									"\"IdPropietario\" : \"" + bean.getTicketUrgencia()+ "\"," +
									"\"Propietario\" : \"" + bean.getTicketFechaCreacion()+ "\" ," +
									"\"ParentClient\" : \"" + bean.getTicketFechaFin()+ "\" ," +
									"\"Summary\" : \"" + AppUtils.cleanString(bean.getTicketIdEstado()) + "\" ," +
									"\"CI\" : \"" + AppUtils.cleanString(bean.getTicketUsuarioVip())+ "\"," +
									"\"CI_Nombre\" : \"" + bean.getTicketEstado()+ "\"," +
									"\"IdClasificacion\" : \"" + bean.getTicketIdGrupoPropietario()+ "\"," +
									"\"Clasificacion\" : \"" + AppUtils.cleanString(bean.getTicketGrupoPropietario())+ "\" ," +
									"\"FechaDeCreacion\" : \"" + bean.getTicketIdLugar()+ "\" ," +
									"\"FechaReporte\" : \"" + bean.getTicketLugar()+ "\" ," +
									"\"InicioActual\" : \"" + bean.getTicketITGrupoResolutor()+ "\"," +
									"\"COPR\" : \"" + bean.getTicketIdGrupoResolutor()+ "\" ," +
									"\"Backlog\" : \"" + bean.getTicketGrupoResolutor()+ "\" ," +
									"\"TimeToResolve\" : \"" + bean.getTicketPropietario()+ "\"," +
									"\"AC\" : \"" + bean.getTicketEmailPropietario()+ "\"," +
									"\"ParentTicket\" : \"" + bean.getStrParentTicket()+ "\"," +
									"\"WORKLOG\" : \"" + AppUtils.cleanString(bean.getTicketPersonaReportado())+ "\"" +	
									"},"
									);
						}
					}else {
						pJson.append("{\"modalsinasignarticket\" : [");
						pJson.append("{" +
								"\"CodigoTicket\" : \"" + "No hay registros" + "\" " +
								"},"
								);
					}
					//SET Second Json
					sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
					
				} catch (Exception e) {
					e.printStackTrace();
					
					pJson.append("{\"modalsinasignarticket\" : [");
					pJson.append("{" +
							"\"CodigoTicket\" : \"" + "No hay registros" + "\" " +
							"},"
							);
					sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
				}
				
				out.print(sJson);
			}
	
	
		private void modalprioridadticket(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf,String strAccion) throws IOException {
			
			//J	S	O	N
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				StringBuilder pJson = new StringBuilder();
				StringBuilder sJson = new StringBuilder();
				// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
				BusinessMaximoView businessMaximoView = new BusinessMaximoView();
				BeanMaximo beanMaximo = new BeanMaximo();
				
				try {
					this.Tribu = request.getParameter("tribu");
					this.ticketIdCliente = request.getParameter("idcliente");
					this.ticketIdGrupoPropietario = request.getParameter("idgrupo");
					
					this.check = request.getParameter("checkbox");//SR2
					this.check1 = request.getParameter("checkbox1");//SR
					this.check2 = request.getParameter("checkbox2");//INCIDENTES
					this.check3 = request.getParameter("checkbox3");//PROBLEMAS
					this.check4 = request.getParameter("checkbox4");//WORKORDER
					this.check5 = request.getParameter("checkbox5");//Activity
					this.check6 = request.getParameter("checkbox6");//CHANGE
					
					// Prepare BEAN	
					beanMaximo.setTribu("'"+this.Tribu+"'");
					beanMaximo.setStrValor1(this.ticketIdCliente == null || this.ticketIdCliente.equals("null") || this.ticketIdCliente.equals("0") || this.ticketIdCliente.equals("TODOS") ? null :splitQueryVariable(this.ticketIdCliente));
					beanMaximo.setStrValor2(this.ticketIdGrupoPropietario == null || this.ticketIdGrupoPropietario.equals("null") || this.ticketIdGrupoPropietario.equals("0") || this.ticketIdGrupoPropietario.equals("TODOS") ? null :splitQueryVariable(this.ticketIdGrupoPropietario));
					beanMaximo.setStrValor4(this.check.equals("0") ? null : "1");//SR2
					beanMaximo.setStrValor5(this.check1.equals("0") ? null : "1");//SR
					beanMaximo.setStrValor6(this.check2.equals("0") ? null : "1");//INCIDENTES
					beanMaximo.setStrValor7(this.check3.equals("0") ? null : "1");//PROBLEMAS
					beanMaximo.setStrValor8(this.check4.equals("0") ? null : "1");//WorkOrder
					beanMaximo.setStrValor9(this.check5.equals("0") ? null : "1");//Activity
					beanMaximo.setStrValor10(this.check6.equals("0") ? null : "1");//Change	
					
					
					// Result
					List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>();
					// Execute
					beanResult = businessMaximoView.modalticketprioridad(beanMaximo, ssf);
					
					if (beanResult.size() > 0) {
						//SET JSON
						pJson.append("{\"modalprioridadticket\" : [");
						for(BeanMaximo bean : beanResult) {
							pJson.append("{" +					
									"\"CodigoTicket\" : \"" + bean.getIdTicket()+ "\" ," +
//									"\"TicketPadre\" : \"" + bean.getTicketParent()+ "\" ," +
									"\"PrioridadInterna\" : \"" + bean.getTicketTitulo()+ "\" ," +
									"\"Status\" : \"" + bean.getTicketDetalle()+ "\" ," +
									"\"Source\" : \"" + bean.getTicketIdCliente()+ "\"," +
									"\"PersonaAfectada\" : \"" + bean.getTicketCliente()+ "\" ," +
									"\"IdGrupo\" : \"" + bean.getTicketPrioridad()+ "\" ," +
									"\"Grupo\" : \"" + bean.getTicketImpact()+ "\" ," +
									"\"IdPropietario\" : \"" + bean.getTicketUrgencia()+ "\"," +
									"\"Propietario\" : \"" + bean.getTicketFechaCreacion()+ "\" ," +
									"\"ParentClient\" : \"" + bean.getTicketFechaFin()+ "\" ," +
									"\"Summary\" : \"" + AppUtils.cleanString(bean.getTicketIdEstado()) + "\" ," +
									"\"CI\" : \"" + AppUtils.cleanString(bean.getTicketUsuarioVip())+ "\"," +
									"\"CI_Nombre\" : \"" + bean.getTicketEstado()+ "\"," +
									"\"IdClasificacion\" : \"" + bean.getTicketIdGrupoPropietario()+ "\"," +
									"\"Clasificacion\" : \"" + AppUtils.cleanString(bean.getTicketGrupoPropietario())+ "\" ," +
									"\"FechaDeCreacion\" : \"" + bean.getTicketIdLugar()+ "\" ," +
									"\"FechaReporte\" : \"" + bean.getTicketLugar()+ "\" ," +
									"\"InicioActual\" : \"" + bean.getTicketITGrupoResolutor()+ "\"," +
									"\"COPR\" : \"" + bean.getTicketIdGrupoResolutor()+ "\" ," +
									"\"Backlog\" : \"" + bean.getTicketGrupoResolutor()+ "\" ," +
									"\"TimeToResolve\" : \"" + bean.getTicketPropietario()+ "\"," +
									"\"AC\" : \"" + bean.getTicketEmailPropietario()+ "\"," +
									"\"ParentTicket\" : \"" + bean.getStrParentTicket()+ "\"," +
									"\"WORKLOG\" : \"" + AppUtils.cleanString(bean.getTicketPersonaReportado())+ "\"" +
									"},"
									);
						}
					}else {
						pJson.append("{\"modalprioridadticket\" : [");
						pJson.append("{" +
								"\"CodigoTicket\" : \"" + "No hay registros" + "\" " +
								"},"
								);
					}
					//SET Second Json
					sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
					
				} catch (Exception e) {
					e.printStackTrace();
					
					pJson.append("{\"modalprioridadticket\" : [");
					pJson.append("{" +
							"\"CodigoTicket\" : \"" + "No hay registros" + "\" " +
							"},"
							);
					sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
				}
				
				out.print(sJson);
			}
	
		
		private void modalvigentesticket(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf,String strAccion) throws IOException {
			
			//J	S	O	N
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				StringBuilder pJson = new StringBuilder();
				StringBuilder sJson = new StringBuilder();
				// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
				BusinessMaximoView businessMaximoView = new BusinessMaximoView();
				BeanMaximo beanMaximo = new BeanMaximo();
				
				try {
					this.Tribu = request.getParameter("tribu");
					this.ticketIdCliente = request.getParameter("idcliente");
					this.ticketIdGrupoPropietario = request.getParameter("idgrupo");
					this.ticketEmailPropietario = request.getParameter("email");
					this.check = request.getParameter("checkbox");//SR2
					this.check1 = request.getParameter("checkbox1");//SR
					this.check2 = request.getParameter("checkbox2");//INCIDENTES
					this.check3 = request.getParameter("checkbox3");//PROBLEMAS
					this.check4 = request.getParameter("checkbox4");//WORKORDER
					this.check5 = request.getParameter("checkbox5");//Activity
					this.check6 = request.getParameter("checkbox6");//CHANGE
					
					
					// Prepare BEAN	
					beanMaximo.setTribu("'"+this.Tribu+"'");
					beanMaximo.setStrValor1(this.ticketIdCliente == null || this.ticketIdCliente.equals("null") || this.ticketIdCliente.equals("0") || this.ticketIdCliente.equals("TODOS") ? null :splitQueryVariable(this.ticketIdCliente));
					beanMaximo.setStrValor2(this.ticketIdGrupoPropietario == null || this.ticketIdGrupoPropietario.equals("null") || this.ticketIdGrupoPropietario.equals("0") || this.ticketIdGrupoPropietario.equals("TODOS") ? null :splitQueryVariable(this.ticketIdGrupoPropietario));
					beanMaximo.setStrValor3(this.ticketEmailPropietario == null || this.ticketEmailPropietario.equals("null") || this.ticketEmailPropietario.equals("0") || this.ticketEmailPropietario.equals("TODOS") ? null :splitQueryVariable(this.ticketEmailPropietario));	
					beanMaximo.setStrValor4(this.check.equals("0") ? null : "1");//SR2
					beanMaximo.setStrValor5(this.check1.equals("0") ? null : "1");//SR
					beanMaximo.setStrValor6(this.check2.equals("0") ? null : "1");//INCIDENTES
					beanMaximo.setStrValor7(this.check3.equals("0") ? null : "1");//PROBLEMAS
					beanMaximo.setStrValor8(this.check4.equals("0") ? null : "1");//WorkOrder
					beanMaximo.setStrValor9(this.check5.equals("0") ? null : "1");//Activity
					beanMaximo.setStrValor10(this.check6.equals("0") ? null : "1");//Change	
					
					// Result
					List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>();
					// Execute
					beanResult = businessMaximoView.ModalVigentesB(beanMaximo, ssf);
					
					if (beanResult.size() > 0) {
						//SET JSON
						pJson.append("{\"modalvigentesticket\" : [");
						for(BeanMaximo bean : beanResult) {
							pJson.append("{" +					
									"\"CodigoTicket\" : \"" + bean.getIdTicket()+ "\" ," +
//									"\"TicketPadre\" : \"" + bean.getTicketParent()+ "\" ," +
									"\"PrioridadInterna\" : \"" + bean.getTicketTitulo()+ "\" ," +
									"\"Status\" : \"" + bean.getTicketDetalle()+ "\" ," +
									"\"Source\" : \"" + bean.getTicketIdCliente()+ "\"," +
									"\"PersonaAfectada\" : \"" + bean.getTicketCliente()+ "\" ," +
									"\"IdGrupo\" : \"" + bean.getTicketPrioridad()+ "\" ," +
									"\"Grupo\" : \"" + bean.getTicketImpact()+ "\" ," +
									"\"IdPropietario\" : \"" + bean.getTicketUrgencia()+ "\"," +
									"\"Propietario\" : \"" + bean.getTicketFechaCreacion()+ "\" ," +
									"\"ParentClient\" : \"" + bean.getTicketFechaFin()+ "\" ," +
									"\"Summary\" : \"" + AppUtils.cleanString(bean.getTicketIdEstado()) + "\" ," +
									"\"CI\" : \"" + AppUtils.cleanString(bean.getTicketUsuarioVip())+ "\"," +
									"\"CI_Nombre\" : \"" + bean.getTicketEstado()+ "\"," +
									"\"IdClasificacion\" : \"" + bean.getTicketIdGrupoPropietario()+ "\"," +
									"\"Clasificacion\" : \"" + AppUtils.cleanString(bean.getTicketGrupoPropietario())+ "\" ," +
									"\"FechaDeCreacion\" : \"" + bean.getTicketIdLugar()+ "\" ," +
									"\"FechaReporte\" : \"" + bean.getTicketLugar()+ "\" ," +
									"\"InicioActual\" : \"" + bean.getTicketITGrupoResolutor()+ "\"," +
									"\"COPR\" : \"" + bean.getTicketIdGrupoResolutor()+ "\" ," +
									"\"Backlog\" : \"" + bean.getTicketGrupoResolutor()+ "\" ," +
									"\"TimeToResolve\" : \"" + bean.getTicketPropietario()+ "\"," +
									"\"AC\" : \"" + bean.getTicketEmailPropietario()+ "\"," +
									"\"ParentTicket\" : \"" + bean.getStrParentTicket()+ "\"," +
									"\"WORKLOG\" : \"" + AppUtils.cleanString(bean.getTicketPersonaReportado())+ "\"" +	
									"},"
									);
						}
					}else {
						pJson.append("{\"modalvigentesticket\" : [");
						pJson.append("{" +
								"\"CodigoTicket\" : \"" + "No hay registros" + "\" " +
								"},"
								);
					}
					//SET Second Json
					sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
					
				} catch (Exception e) {
					e.printStackTrace();
					
					pJson.append("{\"modalvigentesticket\" : [");
					pJson.append("{" +
							"\"CodigoTicket\" : \"" + "No hay registros" + "\" " +
							"},"
							);
					sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
				}
				
				out.print(sJson);
			}
		
		
		
			private void modalvencidosticket(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf,String strAccion) throws IOException {
			
			//J	S	O	N
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				StringBuilder pJson = new StringBuilder();
				StringBuilder sJson = new StringBuilder();
				// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
				BusinessMaximoView businessMaximoView = new BusinessMaximoView();
				BeanMaximo beanMaximo = new BeanMaximo();
				
				try {
					
					this.Tribu = request.getParameter("tribu");
					this.ticketIdCliente = request.getParameter("idcliente");
					this.ticketIdGrupoPropietario = request.getParameter("idgrupo");
					this.ticketEmailPropietario = request.getParameter("email");
					
					
					// Prepare BEAN	
					beanMaximo.setTribu("'"+this.Tribu+"'");
					beanMaximo.setStrValor1(this.ticketIdCliente == null || this.ticketIdCliente.equals("null") || this.ticketIdCliente.equals("0") || this.ticketIdCliente.equals("TODOS") ? null :splitQueryVariable(this.ticketIdCliente));
					beanMaximo.setStrValor2(this.ticketIdGrupoPropietario == null || this.ticketIdGrupoPropietario.equals("null") || this.ticketIdGrupoPropietario.equals("0") || this.ticketIdGrupoPropietario.equals("TODOS") ? null :splitQueryVariable(this.ticketIdGrupoPropietario));
					beanMaximo.setStrValor3(this.ticketEmailPropietario == null || this.ticketEmailPropietario.equals("null") || this.ticketEmailPropietario.equals("0") || this.ticketEmailPropietario.equals("TODOS") ? null :splitQueryVariable(this.ticketEmailPropietario));	
					beanMaximo.setStrValor4(this.check.equals("0") ? null : "1");//SR2
					beanMaximo.setStrValor5(this.check1.equals("0") ? null : "1");//SR
					beanMaximo.setStrValor6(this.check2.equals("0") ? null : "1");//INCIDENTES
					beanMaximo.setStrValor7(this.check3.equals("0") ? null : "1");//PROBLEMAS
					beanMaximo.setStrValor8(this.check4.equals("0") ? null : "1");//WorkOrder
					beanMaximo.setStrValor9(this.check5.equals("0") ? null : "1");//Activity
					beanMaximo.setStrValor10(this.check6.equals("0") ? null : "1");//Change
					
					// Result
					List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>();
					// Execute
					beanResult = businessMaximoView.ModalVencidosB(beanMaximo, ssf);
					
					if (beanResult.size() > 0) {
						//SET JSON
						pJson.append("{\"modalvencidosticket\" : [");
						for(BeanMaximo bean : beanResult) {
							pJson.append("{" +					
									"\"CodigoTicket\" : \"" + bean.getIdTicket()+ "\" ," +
//									"\"TicketPadre\" : \"" + bean.getTicketParent()+ "\" ," +
									"\"PrioridadInterna\" : \"" + bean.getTicketTitulo()+ "\" ," +
									"\"Status\" : \"" + bean.getTicketDetalle()+ "\" ," +
									"\"Source\" : \"" + bean.getTicketIdCliente()+ "\"," +
									"\"PersonaAfectada\" : \"" + bean.getTicketCliente()+ "\" ," +
									"\"IdGrupo\" : \"" + bean.getTicketPrioridad()+ "\" ," +
									"\"Grupo\" : \"" + bean.getTicketImpact()+ "\" ," +
									"\"IdPropietario\" : \"" + bean.getTicketUrgencia()+ "\"," +
									"\"Propietario\" : \"" + bean.getTicketFechaCreacion()+ "\" ," +
									"\"ParentClient\" : \"" + bean.getTicketFechaFin()+ "\" ," +
									"\"Summary\" : \"" + AppUtils.cleanString(bean.getTicketIdEstado()) + "\" ," +
									"\"CI\" : \"" + AppUtils.cleanString(bean.getTicketUsuarioVip())+ "\"," +
									"\"CI_Nombre\" : \"" + bean.getTicketEstado()+ "\"," +
									"\"IdClasificacion\" : \"" + bean.getTicketIdGrupoPropietario()+ "\"," +
									"\"Clasificacion\" : \"" + AppUtils.cleanString(bean.getTicketGrupoPropietario())+ "\" ," +
									"\"FechaDeCreacion\" : \"" + bean.getTicketIdLugar()+ "\" ," +
									"\"FechaReporte\" : \"" + bean.getTicketLugar()+ "\" ," +
									"\"InicioActual\" : \"" + bean.getTicketITGrupoResolutor()+ "\"," +
									"\"COPR\" : \"" + bean.getTicketIdGrupoResolutor()+ "\" ," +
									"\"Backlog\" : \"" + bean.getTicketGrupoResolutor()+ "\" ," +
									"\"TimeToResolve\" : \"" + bean.getTicketPropietario()+ "\"," +
									"\"AC\" : \"" + bean.getTicketEmailPropietario()+ "\"," +
									"\"ParentTicket\" : \"" + bean.getStrParentTicket()+ "\"," +
									"\"WORKLOG\" : \"" + AppUtils.cleanString(bean.getTicketPersonaReportado())+ "\"" +	
									"},"
									);
						}
					}else {
						pJson.append("{\"modalvencidosticket\" : [");
						pJson.append("{" +
								"\"CodigoTicket\" : \"" + "No hay registros" + "\" " +
								"},"
								);
					}
					//SET Second Json
					sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
					
				} catch (Exception e) {
					e.printStackTrace();
					
					pJson.append("{\"modalvencidosticket\" : [");
					pJson.append("{" +
							"\"CodigoTicket\" : \"" + "No hay registros" + "\" " +
							"},"
							);
					sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
				}
				
				out.print(sJson);
			}
			
			
			
			private void tabla1(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf,String strAccion, SqlSessionFactory ssfSmartDesk) throws IOException {
				
				//J	S	O	N
					response.setCharacterEncoding("UTF-8");
					PrintWriter out = response.getWriter();
					StringBuilder pJson = new StringBuilder();
					StringBuilder sJson = new StringBuilder();
					// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
					BusinessMaximoView businessMaximoView = new BusinessMaximoView();
					BeanMaximo beanMaximo = new BeanMaximo();
					
					try {
						this.check = request.getParameter("checkbox");//SR2
						this.check1 = request.getParameter("checkbox1");//SR
						this.check2 = request.getParameter("checkbox2");//INCIDENTES
						this.check3 = request.getParameter("checkbox3");//PROBLEMAS
						this.check4 = request.getParameter("checkbox4");//WORKORDER
						this.check5 = request.getParameter("checkbox5");//Activity
						this.check6 = request.getParameter("checkbox6");//CHANGE
						this.ticketIdCliente = request.getParameter("idcliente");						
						
						// Prepare BEAN			
						beanMaximo.setStrValor1(this.check.equals("0") ? null : "1");//SR2
						beanMaximo.setStrValor2(this.check1.equals("0") ? null : "1");//SR
						beanMaximo.setStrValor3(this.check2.equals("0") ? null : "1");//INCIDENTES
						beanMaximo.setStrValor4(this.check3.equals("0") ? null : "1");//PROBLEMAS
						beanMaximo.setStrValor5(this.check4.equals("0") ? null : "1");//WorkOrder
						beanMaximo.setStrValor6(this.check5.equals("0") ? null : "1");//Activity
						beanMaximo.setStrValor7(this.check6.equals("0") ? null : "1");//Change
						beanMaximo.setTicketIdCliente(splitQueryVariable(this.ticketIdCliente));
						
						// Result
						List<BeanMaximo> listResult = new ArrayList<BeanMaximo>();
						// Execute
						listResult = businessMaximoView.Tabla1(beanMaximo, ssf);
//						BeanMaximo beantempTicket = new BeanMaximo();
//						beantempTicket.setStrValor1("IN1932252");
//						listResult.add(beantempTicket);
						
						
						String strTicketsQuery = "";
						int cont = 0; 
						for (BeanMaximo beanTicketSRINC : listResult) {
							if(cont == 0) {
								strTicketsQuery += "'"+beanTicketSRINC.getStrValor1()+"'";	
							}else {
								strTicketsQuery += ",'"+beanTicketSRINC.getStrValor1()+"'";	
							}
							cont = cont + 1;
							
						}
						
//						System.out.println("strTicketsQuery "+strTicketsQuery);
						beanMaximo.setIdTicket(strTicketsQuery);
						
						//Consulta Estados de tickets
						EstadoTicketDAOImpl daoestadoTk = new EstadoTicketDAOImpl();
						List<BeanTicketStatus> listaestados = new ArrayList<BeanTicketStatus>();
						SqlSession sqlSession = ssfSmartDesk.openSession(true);
						try {
						listaestados = daoestadoTk.consultaEstadosTicketBacklogDCS(beanMaximo, sqlSession);
						
						}catch(Exception e) {
							e.printStackTrace();	
						}finally{
							sqlSession.close();
						}
						
	
						//CONSULTA horarios
						HorarioService servicioHorario = new HorarioService();
						Horario beanHorario= servicioHorario.consultarHorario("28", ssfSmartDesk);
						
						//CONSULTA FERIADOS
						FeriadoService servicioFeriado = new FeriadoService();
						List<Feriado> listaFeriados = new ArrayList<Feriado>();
						listaFeriados = servicioFeriado.listaFeriados(ssfSmartDesk);

						SLATiempoOnsiteService service = new SLATiempoOnsiteService();
						BeanDashboard beandashboardTRespuesta = new BeanDashboard();
						BeanDashboard beandashboardTSolucion = new BeanDashboard();
						double valorTRespuesta= 0.0;
						double valorTSolucion= 0.0;
						
						if (listResult.size() > 0) {
							//SET JSON
							pJson.append("{\"tabla1\" : [");
						
							for(int i = 0; i<listResult.size(); i++) {
								valorTRespuesta= 0.0;
								valorTSolucion= 0.0;
								List<BeanTicketStatus> listaStatus1 = new ArrayList<BeanTicketStatus>();
								List<BeanTicketStatus> listaStatus2 = new ArrayList<BeanTicketStatus>();
								System.out.println("tamaño listaestados "+listaestados.size());
								for(int j = 0; j< listaestados.size(); j++) {
									if(listResult.get(i).getStrValor1().equals(listaestados.get(j).getTicketid())) {
									listaStatus1.add(listaestados.get(j));
									listaStatus2.add(listaestados.get(j));
								}
								}
								
								
								//Calculo Tiempo Respuesta
								System.out.println("listaStatus1 tamaño : "+listaStatus1.size());
								beandashboardTRespuesta = new BeanDashboard();
								beandashboardTRespuesta = service.backlogContabilizarTiempoRespuesta(listaStatus1, beanHorario, null, listaFeriados);
								
								valorTRespuesta = beandashboardTRespuesta.getValor();
								String hhmmss1 = "";
								if(valorTRespuesta>=0) {
									int hrs= (int)(valorTRespuesta);
									int min= (int)((valorTRespuesta-hrs)* 60);
									int seg= (int)((((valorTRespuesta-hrs)* 60)-min)*60);
									
									hhmmss1 = String.format("%02d:%02d:%02d", hrs, min, seg);
	
								}
								
								//Calculo Tiempo Solucion
								System.out.println("listaStatus2 tamaño : "+listaStatus2.size());
								beandashboardTSolucion= new BeanDashboard();
								beandashboardTSolucion = service.backlogContabilizarTiempoSolucion(listaStatus2, beanHorario, null, listaFeriados);
								
								valorTSolucion= beandashboardTSolucion.getValor();
								String hhmmss2 = "";
								if(valorTSolucion>=0.0) {
//								valorTSolucion=beanDash.getValor();
									int hrs= (int)(valorTSolucion);
									int min= (int)((valorTSolucion-hrs)* 60);
									int seg= (int)((((valorTSolucion-hrs)* 60)-min)*60);
									hhmmss2 = String.format("%02d:%02d:%02d", hrs, min, seg);
									System.out.println("Resultado : "+hhmmss2);
	
								}
								
								pJson.append("{" +					
										"\"CodigoTicket\" : \"" + listResult.get(i).getStrValor1()+ "\" ," +
										"\"Summary\" : \"" + AppUtils.cleanString(listResult.get(i).getStrValor2())+ "\" ," +
										"\"Creator\" : \"" + listResult.get(i).getStrValor3()+ "\" ," +
										"\"AffectedPerson\" : \"" + listResult.get(i).getStrValor4()+ "\"," +
										"\"CreationDate\" : \"" + listResult.get(i).getStrValor5()+ "\" ," +
										"\"OwnerGroup\" : \"" + listResult.get(i).getStrValor6()+ "\" ," +
										"\"InternalPriority\" : \"" + listResult.get(i).getStrValor7()+ "\" ," +
										"\"OwnerId\" : \"" + listResult.get(i).getStrValor8()+ "\"," +
										"\"Owner\" : \"" + listResult.get(i).getStrValor9()+ "\" ," +
										"\"Status\" : \"" + listResult.get(i).getStrValor10()+ "\" ," +
										"\"ResultadoTiempoRespuesta\" : \"" + (beandashboardTRespuesta.getValor() < 0 ? -1: beandashboardTRespuesta.getValor() ) + "\" ," +
										"\"strTiempoRespuesta\" : \"" + hhmmss1 + "\" ," +
										"\"ProcesamientoTRespuesta\" : \"" + (beandashboardTRespuesta.getEstado()) + "\" ," +
										"\"ResultadoTiempoSolucion\" : \"" + (beandashboardTSolucion.getValor() < 0 ? -1: beandashboardTSolucion.getValor() ) + "\" ," +
										"\"strTiempoSolucion\" : \"" + hhmmss2 + "\" ," +
										"\"ProcesamientoTSolucion\" : \"" + (beandashboardTSolucion.getEstado()) + "\" ," +
										"\"Worklog\" : \"" + AppUtils.cleanString(listResult.get(i).getSysPwd())+ "\"," +										
										"\"TimeToResolve\" : \"" + AppUtils.cleanString(listResult.get(i).getSysUser())+ "\"" +	
										"},"
										);
								
//								String.format("%02d:%02d:%02d", beandashboard.getValor() / 3600, (beandashboard.getValor() % 3600) / 60, beandashboard.getValor() % 60)
							}
						}else {
							pJson.append("{\"tabla1\" : [");
							pJson.append("{" +
									"\"CodigoTicket\" : \"" + "No hay registros" + "\" " +
									"},"
									);
						}
						//SET Second Json
						sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
						
					} catch (Exception e) {
						e.printStackTrace();
						
						pJson.append("{\"tabla1\" : [");
						pJson.append("{" +
								"\"CodigoTicket\" : \"" + "No hay registros" + "\" " +
								"},"
								);
						sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
					}
					
					out.print(sJson);
				}

			
			private void tabla2(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf,String strAccion) throws IOException {
				
				//J	S	O	N
					response.setCharacterEncoding("UTF-8");
					PrintWriter out = response.getWriter();
					StringBuilder pJson = new StringBuilder();
					StringBuilder sJson = new StringBuilder();
					// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
					BusinessMaximoView businessMaximoView = new BusinessMaximoView();
					BeanMaximo beanMaximo = new BeanMaximo();
					
					try {
						this.ticketIdGrupoPropietario = request.getParameter("idgrupo");
						
						// Prepare BEAN	
						
						beanMaximo.setTicketIdGrupoPropietario(splitQueryVariable(this.ticketIdGrupoPropietario));
						
						// Result
						List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>();
						// Execute
						beanResult = businessMaximoView.Tabla2(beanMaximo, ssf);
						
						if (beanResult.size() > 0) {
							//SET JSON
							pJson.append("{\"tabla2\" : [");
							for(BeanMaximo bean : beanResult) {
								pJson.append("{" +					
										"\"CodigoTicket\" : \"" + bean.getStrValor1()+ "\" ," +
										"\"Summary\" : \"" + AppUtils.cleanString(bean.getStrValor2())+ "\" ," +
										"\"Creator\" : \"" + bean.getStrValor3()+ "\" ," +
										"\"AffectedPerson\" : \"" + bean.getStrValor4()+ "\"," +
										"\"CreationDate\" : \"" + bean.getStrValor5()+ "\" ," +
										"\"OwnerGroup\" : \"" + bean.getStrValor6()+ "\" ," +
										"\"InternalPriority\" : \"" + bean.getStrValor7()+ "\" ," +
										"\"OwnerId\" : \"" + bean.getStrValor8()+ "\"," +
										"\"Owner\" : \"" + bean.getStrValor9()+ "\" ," +
										"\"Status\" : \"" + bean.getStrValor10()+ "\" ," +
										"\"Worklog\" : \"" + AppUtils.cleanString(bean.getSysPwd())+ "\"," +										
										"\"TimeToResolve\" : \"" + AppUtils.cleanString(bean.getSysUser())+ "\"" +	
										"},"
										);
							}
						}else {
							pJson.append("{\"tabla2\" : [");
							pJson.append("{" +
									"\"CodigoTicket\" : \"" + "No hay registros" + "\" " +
									"},"
									);
						}
						//SET Second Json
						sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
						
					} catch (Exception e) {
						e.printStackTrace();
						
						pJson.append("{\"tabla2\" : [");
						pJson.append("{" +
								"\"CodigoTicket\" : \"" + "No hay registros" + "\" " +
								"},"
								);
						sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
					}
					
					out.print(sJson);
				}

			
			private void tabla3(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf,String strAccion) throws IOException {
				
				//J	S	O	N
					response.setCharacterEncoding("UTF-8");
					PrintWriter out = response.getWriter();
					StringBuilder pJson = new StringBuilder();
					StringBuilder sJson = new StringBuilder();
					// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
					BusinessMaximoView businessMaximoView = new BusinessMaximoView();
					BeanMaximo beanMaximo = new BeanMaximo();
					
					try {
						this.ticketIdGrupoPropietario = request.getParameter("idgrupo");
						
						// Prepare BEAN	
						
						beanMaximo.setTicketIdGrupoPropietario(splitQueryVariable(this.ticketIdGrupoPropietario));
						
						// Result
						List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>();
						// Execute
						beanResult = businessMaximoView.Tabla3(beanMaximo, ssf);
						
						if (beanResult.size() > 0) {
							//SET JSON
							pJson.append("{\"tabla3\" : [");
							for(BeanMaximo bean : beanResult) {
								pJson.append("{" +					
										"\"CodigoTicket\" : \"" + bean.getStrValor1()+ "\" ," +
										"\"Summary\" : \"" + AppUtils.cleanString(bean.getStrValor2())+ "\" ," +
										"\"Creator\" : \"" + bean.getStrValor3()+ "\" ," +
										"\"AffectedPerson\" : \"" + bean.getStrValor4()+ "\"," +
										"\"CreationDate\" : \"" + bean.getStrValor5()+ "\" ," +
										"\"OwnerGroup\" : \"" + bean.getStrValor6()+ "\" ," +
										"\"InternalPriority\" : \"" + bean.getStrValor7()+ "\" ," +
										"\"OwnerId\" : \"" + bean.getStrValor8()+ "\"," +
										"\"Owner\" : \"" + bean.getStrValor9()+ "\" ," +
										"\"Status\" : \"" + bean.getStrValor10()+ "\" ," +
										"\"Worklog\" : \"" + AppUtils.cleanString(bean.getSysPwd())+ "\"," +										
										"\"TimeToResolve\" : \"" + AppUtils.cleanString(bean.getSysUser())+ "\"" +	
										"},"
										);
							}
						}else {
							pJson.append("{\"tabla3\" : [");
							pJson.append("{" +
									"\"CodigoTicket\" : \"" + "No hay registros" + "\" " +
									"},"
									);
						}
						//SET Second Json
						sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
						
					} catch (Exception e) {
						e.printStackTrace();
						
						pJson.append("{\"tabla3\" : [");
						pJson.append("{" +
								"\"CodigoTicket\" : \"" + "No hay registros" + "\" " +
								"},"
								);
						sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
					}
					
					out.print(sJson);
				}

			private void UserGrade(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf, String vSchema) throws IOException {
				//J	S	O	N
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				StringBuilder pJson = new StringBuilder();
				StringBuilder sJson = new StringBuilder();
				
				// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
				BusinessMaximoView businessMaximoView = new BusinessMaximoView();
				BeanMaximo beanMaximo = new BeanMaximo();
				
				try {
//					// P	A	R	A	M	S
//					//TODO: Unused variable
//					this.team = Integer.parseInt(request.getParameter("idTeam"));

//					// Prepare BEAN
//					beanMaximo.setStrValor1(splitQueryVariable(request.getParameter("idTeam")));
//					
					// Result
					List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>(); 
					
					// Execute
					beanResult = businessMaximoView.UserGrade(beanMaximo, ssf);
					
					if (beanResult.size() > 0) {
						//SET JSON
//						pJson.append("{\""+vSchema+"\": [");
						pJson.append("{\"userGrade\" : [");
						
						for(BeanMaximo bean : beanResult) {
							pJson.append("{" +
									"\"Nombre\" : \"" + bean.getStrValor1()+ "\" ," +
									"\"Email\" : \"" + bean.getStrValor2()+ "\" ," +
									"\"Grado\" : \"" + bean.getStrValor3()+ "\" " +
									
									"},"
									);
						}
					}else {
//						pJson.append("{\""+vSchema+"\": [");
						pJson.append("{\"userGrade\" : [");
						pJson.append("{" +
								"\"Message\" : \"" + "No hay registros" + "\" " +
								"},"
								);
					}
					//SET Second Json
					sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
					
				} catch (Exception e) {
					e.printStackTrace();
					
//					pJson.append("{\""+vSchema+"\": [");
					pJson.append("{\"userGrade\" : [");
					pJson.append("{" +
							"\"Message\" : \"" + "No hay registros" + "\" " +
							"},"
							);
					sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
				}
				
				out.print(sJson);
			}
			
			
			
			//Complete
			private void ownergrade(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf,SqlSessionFactory ssfM, String vSchema) throws IOException {
				//J	S	O	N
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				StringBuilder pJson = new StringBuilder();
				StringBuilder sJson = new StringBuilder();
				
				// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
				BusinessMaximoView businessMaximoView = new BusinessMaximoView();
				BeanMaximo beanMaximo = new BeanMaximo();
				
				try {
					// P	A	R	A	M	S
					this.ticketIdCliente = request.getParameter("ticketIdCliente");
					this.ticketIdGrupoPropietario = request.getParameter("ticketIdGrupoPropietario");
					this.ticketEmailPropietario = request.getParameter("ticketEmailPropietario");
					this.check = request.getParameter("checkbox");//SR2
					this.check1 = request.getParameter("checkbox1");//SR
					this.check2 = request.getParameter("checkbox2");//INCIDENTES
					this.check3 = request.getParameter("checkbox3");//PROBLEMAS
					this.check4 = request.getParameter("checkbox4");//WORKORDER
					this.check5 = request.getParameter("checkbox5");//Activity
					this.check6 = request.getParameter("checkbox6");//CHANGE

					// Prepare BEAN
					beanMaximo.setTicketIdCliente(this.ticketIdCliente == null || this.ticketIdCliente.equals("null") || this.ticketIdCliente.equals("0") || this.ticketIdCliente.equals("TODOS") ? null : splitQueryVariable(this.ticketIdCliente));
					//Custom OwnerGroup Multiple Options
					beanMaximo.setTicketIdGrupoPropietario(this.ticketIdGrupoPropietario == null || this.ticketIdGrupoPropietario.equals("null") || this.ticketIdGrupoPropietario.equals("0") || this.ticketIdGrupoPropietario.equals("TODOS") ? null : splitQueryVariable(this.ticketIdGrupoPropietario));
					beanMaximo.setTicketEmailPropietario(this.ticketEmailPropietario == null || this.ticketEmailPropietario.equals("null") || this.ticketEmailPropietario.equals("0") || this.ticketEmailPropietario.equals("TODOS") ? null : splitQueryVariable(this.ticketEmailPropietario));
					beanMaximo.setStrValor4(this.check.equals("0") ? null : "1");//SR2 SOLO PARA MESA DE SERVICIO
					beanMaximo.setStrValor5(this.check1.equals("0") ? null : "1");//SR
					beanMaximo.setStrValor6(this.check2.equals("0") ? null : "1");//INCIDENTES
					beanMaximo.setStrValor7(this.check3.equals("0") ? null : "1");//PROBLEMAS
					beanMaximo.setStrValor8(this.check4.equals("0") ? null : "1");//WorkOrder
					beanMaximo.setStrValor9(this.check5.equals("0") ? null : "1");//Activity
					beanMaximo.setStrValor10(this.check6.equals("0") ? null : "1");//Change
					
					// Result
					List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>(); 
					
					// Execute
					beanResult = businessMaximoView.OwnerGrade(beanMaximo, ssf, ssfM);
					
					if (beanResult.size() > 0) {
						//SET JSON
//						pJson.append("{\""+vSchema+"\": [");
						pJson.append("{\"OwnerGrade\": [");
						
						for (BeanMaximo bean : beanResult) {
							pJson.append("{" +
									"\"OwnerId\" : \"" + bean.getTicketEmailPropietario()+ "\" ," +
									"\"Owner\" : \"" + bean.getTicketPropietario()+ "\" ," +
									"\"Dia\" : \"" + bean.getStrValor1()+ "\" ," +
									"\"Horas\" : \"" + bean.getStrValor2()+ "\" ," +
									"\"Minutos\" : \"" + bean.getStrValor3()+ "\" ," +
									"\"Totales\" : \"" + bean.getStrValor4()+ "\" ," +
									"\"Vigentes\" : \"" + bean.getStrValor5()+ "\" ," +								
									"\"Vencidos\" : \"" + bean.getStrValor6()+ "\"," +									
									"\"Grado\" : \"" + bean.getStrValor7()+ "\"" +	
									"},"
									);
						}
					}else {
//						pJson.append("{\""+vSchema+"\": [");
						pJson.append("{\"OwnerGrade\": [");
						pJson.append("{" +
								"\"OwnerId\" : \"" + "No hay registros" + "\" " +
								"},"
								);
					}
					//SET Second Json
					sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
					
				} catch (Exception e) {
					e.printStackTrace();
					
//					pJson.append("{\""+vSchema+"\": [");
					pJson.append("{\"OwnerGrade\": [");
					pJson.append("{" +
							"\"OwnerId\" : \"" + "No hay registros" + "\" " +
							"},"
							);
					sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
				}
				out.print(sJson);
			}
			
			
	private void listarGrupoWO(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssfM, String vSchema) throws IOException {
				//J	S	O	N
				response.setCharacterEncoding("UTF-8");
				PrintWriter out = response.getWriter();
				StringBuilder pJson = new StringBuilder();
				StringBuilder sJson = new StringBuilder();
				
				// I	N	S	T	A	N	C	E	-	O	B	J	E	C	T	S
				BusinessMaximoView businessMaximoView = new BusinessMaximoView();
				BeanMaximo beanMaximo = new BeanMaximo();
				
				try {
					
					this.Tribu = request.getParameter("tribu");
					this.ticketIdCliente = request.getParameter("idcliente");
					this.ticketIdGrupoPropietario = request.getParameter("idgrupo");
					
					// Prepare BEAN
					beanMaximo.setTribu("'"+this.Tribu+"'");					
					beanMaximo.setStrValor1(this.ticketIdCliente == null || this.ticketIdCliente.equals("null") || this.ticketIdCliente.equals("0") || this.ticketIdCliente.equals("TODOS") ? null :splitQueryVariable(this.ticketIdCliente));
					beanMaximo.setStrValor2(this.ticketIdGrupoPropietario == null || this.ticketIdGrupoPropietario.equals("null") || this.ticketIdGrupoPropietario.equals("0") || this.ticketIdGrupoPropietario.equals("TODOS") ? null :splitQueryVariable(this.ticketIdGrupoPropietario));
					
					
					// Result
					List<BeanMaximo> beanResult = new ArrayList<BeanMaximo>(); 
					
					// Execute
					
					beanResult = businessMaximoView.ListarGrupoWO(beanMaximo, ssfM);
					
					if (beanResult.size() > 0) {
						//SET JSON
//						pJson.append("{\""+vSchema+"\": [");
						pJson.append("{\"ListarWOGrupo\": [");
						
						for(BeanMaximo bean : beanResult) {
							pJson.append("{" +					
									"\"CodigoTicket\" : \"" + bean.getIdTicket()+ "\" ," +
									"\"PrioridadInterna\" : \"" + bean.getTicketTitulo()+ "\" ," +
									"\"Status\" : \"" + bean.getTicketDetalle()+ "\" ," +
									"\"Source\" : \"" + bean.getTicketIdCliente()+ "\"," +
									"\"PersonaAfectada\" : \"" + bean.getTicketCliente()+ "\" ," +
									"\"IdGrupo\" : \"" + bean.getTicketPrioridad()+ "\" ," +
									"\"Grupo\" : \"" + bean.getTicketImpact()+ "\" ," +
									"\"IdPropietario\" : \"" + bean.getTicketUrgencia()+ "\"," +
									"\"Propietario\" : \"" + bean.getTicketFechaCreacion()+ "\" ," +
									"\"ParentClient\" : \"" + bean.getTicketFechaFin()+ "\" ," +
									"\"Summary\" : \"" + AppUtils.cleanString(bean.getTicketIdEstado()) + "\" ," +
									"\"CI\" : \"" + AppUtils.cleanString(bean.getTicketUsuarioVip())+ "\"," +
									"\"CI_Nombre\" : \"" + bean.getTicketEstado()+ "\"," +
									"\"IdClasificacion\" : \"" + bean.getTicketIdGrupoPropietario()+ "\"," +
									"\"Clasificacion\" : \"" + AppUtils.cleanString(bean.getTicketGrupoPropietario())+ "\" ," +
									"\"FechaDeCreacion\" : \"" + bean.getTicketIdLugar()+ "\" ," +
									"\"FechaReporte\" : \"" + bean.getTicketLugar()+ "\" ," +
									"\"InicioActual\" : \"" + bean.getTicketITGrupoResolutor()+ "\"," +
									"\"COPR\" : \"" + bean.getTicketIdGrupoResolutor()+ "\" ," +
									"\"Backlog\" : \"" + bean.getTicketGrupoResolutor()+ "\" ," +
									"\"TimeToResolve\" : \"" + bean.getTicketPropietario()+ "\"," +
									"\"AC\" : \"" + bean.getTicketEmailPropietario()+ "\"," + 
									"\"ParentTicket\" : \"" + bean.getStrParentTicket()+ "\"," +
									
									"\"WORKLOG\" : \"" + AppUtils.cleanString(bean.getTicketPersonaReportado())+ "\"," +
									"\"WO_Group\" : \"" + bean.getStrValor11()+ "\"" +
									"},"
									);
						}
					}else {
//						pJson.append("{\""+vSchema+"\": [");
						pJson.append("{\"ListarWOGrupo\": [");
						pJson.append("{" +
								"\"ListarWOGrupo\" : \"" + "No hay registros" + "\" " +
								"},"
								);
					}
					//SET Second Json
					sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
					
				} catch (Exception e) {
					e.printStackTrace();
					
//					pJson.append("{\""+vSchema+"\": [");
					pJson.append("{\"ListarWOGrupo\": [");
					pJson.append("{" +
							"\"ListarWOGrupo\" : \"" + "No hay registros" + "\" " +
							"},"
							);
					sJson.append(pJson.substring(0,pJson.length() -1) + "]}");
				}
				out.print(sJson);
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
