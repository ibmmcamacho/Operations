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

import com.pe.ibm.bean.BeanPerfil;
import com.pe.ibm.bean.BeanRCT;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessPerfil;
import com.pe.ibm.business.BusinessRCT;
import com.pe.ibm.util.AppUtils;

@WebServlet("/ServletRCT")
public class ServletRCT extends HttpServlet{
	
	private String strAccion;
	private int strIdSchedule;
	private int strIdScheduleActividad;
	private String strComentario;
	private int strEstado;
	private int strIdUsuario;
	private int resultado = 0;
	private String respuesta;
	private int team;
	private int user;
	private String horainicio;
	private String horaejecucion;
	private String horavigencia;
	private String idrctdetalle;
	private String estado;
	
	  /**
     * @see HttpServlet#HttpServlet()
     */	
	
    public ServletRCT() {
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

    			
    			if(this.strAccion.equals("ListRCT")) {
    				listRCT(request, response,ssf);
    			}else if(this.strAccion.equals("ListSchedulePorUsuario")) {
    				listarSchedulePorUsuario(request, response,ssf);
    			}else if(this.strAccion.equals("SaveActividadSchedule")) {
    				saveActividadSchedule(request, response,ssf);
    			}else if(this.strAccion.equals("ListarActividades")) {
    				listarActividades(request, response,ssf);
    			}else if(this.strAccion.equals("ListarMCliente")) {
    				listarMCliente(request, response,ssf);
    			}else if(this.strAccion.equals("ListarMServidor")) {
    				listarMServidor(request, response,ssf);
    			}else if(this.strAccion.equals("ListarMTurno")) {
    				listarMTurno(request, response,ssf);
    			}else if(this.strAccion.equals("GuardarModalActividad")) {
    				guardarmodalactividad(request, response,ssf);
    			}else if(this.strAccion.equals("GuardarDetalleDesc")) {
    				guardarDetalleDesc(request, response,ssf);
    			}else if(this.strAccion.equals("ListarRCTDETALLE")) {
    				listarRCTDETALLE(request, response,ssf);
    			}else if(this.strAccion.equals("ActualizarRCTactividad")) {
    				actualizarRCTactividad(request, response,ssf);
    			}else if(this.strAccion.equals("EliminarRCTDETALLE")) {
    				eliminarRCTDETALLE(request, response,ssf);
    			}else if(this.strAccion.equals("EditarDescripcionAnuncio")) {
    				editarDescripcionAnuncio(request, response,ssf);
    			}else if(this.strAccion.equals("FinalizarRCT")) {
    				finalizarRCT(request, response,ssf);
    			}else {
    				System.out.println(strAccion);
    			}
    		}
    
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
    
	private void listRCT(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		
		try {
			List<BeanRCT> lstBeanRCT = null;
			BusinessRCT objBusinessRCT = new BusinessRCT();
			BeanRCT objBeanRCT = new BeanRCT();
			this.estado = (req.getParameter("ESTADO"));
			
			
			BeanSession objBeanSession = new BeanSession();			
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			this.team = objBeanSession.getObjBeanPersonal().getiTeam();
			
			objBeanRCT.setiTeam("'"+this.team+"'");
			objBeanRCT.setESTADO(this.estado.equals("3") ? null : this.estado);
			
			lstBeanRCT = objBusinessRCT.listarRCT(objBeanRCT, ssf);
			
			if (lstBeanRCT.size() > 0) {
				strJson1.append("{\"listarRCT\" : [");
				for (BeanRCT item : lstBeanRCT) {
					strJson1.append("{" +
					"\"IdRct\" : \"" + item.getIDRCT() + "\" ,"+
					"\"Tipo\" : \"" + AppUtils.cleanString(item.getStrValor1()) + "\","+					
					"\"IdScheduleOrigen2\" : \"" + item.getStrValor2() + "\","+
					"\"IdScheduleOrigen\" : \"" + item.getIDSCHEDULEORIGEN() + "\","+
					"\"IdUsuarioOrigen\" : \"" + item.getStrValor3() + "\","+					
					"\"Cliente\" : \"" + item.getIntValor4() + "\","+
					"\"Servidor\" : \"" + item.getIntValor5() + "\","+
					"\"Turno\" : \"" + item.getIntValor6() + "\","+
					"\"IdActividad2\" : \"" + AppUtils.cleanString(item.getStrValor7()) + "\","+
					"\"IdActividad\" : \"" + AppUtils.cleanString(item.getStrValor4()) + "\","+
					"\"FechaInicio\" : \"" + item.getStrValor8() + "\","+					
					"\"FechaVigencia\" : \"" + item.getStrValor10() + "\","+
					
					"\"IdUsuarioAtencion\" : \"" + item.getStrValor11() + "\","+					
					"\"FechaReg\" : \"" + item.getFECHAREG() + "\","+
					"\"FechaAsig\" : \"" + item.getFECHAASIG() + "\" ,"+
					"\"IdScheduleDestino2\" : \"" + item.getStrValor12() + "\" ,"+
					"\"IdScheduleDestino\" : \"" + item.getIDSCHEDULEDESTINO() + "\", "+
					
					"\"HoraInicio\" : \"" + AppUtils.cleanString(item.getStrValor13()) + "\", "+
					"\"Cliente2\" : \"" + item.getStrValor14() + "\", "+
					"\"Servidor2\" : \"" + item.getStrValor15() + "\", "+
					"\"Turno2\" : \"" + item.getStrValor16() + "\", "+
					"\"Estado\" : \"" + item.getESTADO() + "\", "+
					"\"Descripcion\" : \"" + AppUtils.cleanString(item.getDESCRIPCION()) + "\" "+					
					"},"
					);
				}
			}else {

				strJson1.append("{\"listarRCT\": [");
				strJson1.append("{" +
						"\"IdRct\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			} 
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			
		}catch (Exception e) {
			e.printStackTrace();
			strJson1.append("{\"listarRCT\": [");
			strJson1.append("{" +
					"\"IdRct\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	
	private void listarActividades(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		
		try {
			List<BeanRCT> lstBeanRCT = null;
			BusinessRCT objBusinessRCT = new BusinessRCT();
			BeanRCT objBeanRCT = new BeanRCT();
			
			
			lstBeanRCT = objBusinessRCT.listarActividades(objBeanRCT, ssf);
			
			if (lstBeanRCT.size() > 0) {
				strJson1.append("{\"listarActividades\" : [");
				for (BeanRCT item : lstBeanRCT) {
					strJson1.append("{" +
					"\"IdActividad\" : \"" + item.getIDACTIVIDAD() + "\" ,"+
					"\"Descripcion\" : \"" + item.getDESCRIPCION() + "\""+				
					"},"
					);
				}
			}else {

				strJson1.append("{\"listarActividades\": [");
				strJson1.append("{" +
						"\"IdActividad\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			} 
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			
		}catch (Exception e) {
			e.printStackTrace();
			strJson1.append("{\"listarActividades\": [");
			strJson1.append("{" +
					"\"IdActividad\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	
	private void listarSchedulePorUsuario(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		
		try {
			List<BeanRCT> lstBeanRCT = null;
			BusinessRCT objBusinessRCT = new BusinessRCT();
			BeanRCT objBeanRCT = new BeanRCT();
			BeanSession objBeanSession = new BeanSession();			
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			this.user = objBeanSession.getObjBeanPersonal().getiIdEmpleado();
			objBeanRCT.setIDUSUARIOORIGEN(this.user);		
			
			lstBeanRCT = objBusinessRCT.listarSchedulePorUsuario(objBeanRCT, ssf);
			
			if (lstBeanRCT.size() > 0) {
				strJson1.append("{\"listarSchedulePorUsuario\" : [");
				for (BeanRCT item : lstBeanRCT) {
					strJson1.append("{" +
					"\"DescripionIdShedule\" : \"" + item.getStrValor1() + "\","+
					"\"IdShedule\" : \"" + item.getStrValor2() + "\""+
									
					"},"
					);
				}
			}else {

				strJson1.append("{\"listarSchedulePorUsuario\": [");
				strJson1.append("{" +
						"\"IdSchedule\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			} 
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			
		}catch (Exception e) {
			e.printStackTrace();
			strJson1.append("{\"listarRCT\": [");
			strJson1.append("{" +
					"\"IdRct\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	
	public void saveActividadSchedule(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;
			
			BeanSession objBeanSession = new BeanSession();
			
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			this.user = objBeanSession.getObjBeanPersonal().getiIdEmpleado();
			this.horainicio = req.getParameter("HORAINICIO");
			this.team = objBeanSession.getObjBeanPersonal().getiTeam();
			BeanRCT beanRCT = new BeanRCT();
			beanRCT.setiTeam("'"+this.team+"'");
			beanRCT.setIDACTIVIDAD(Integer.parseInt(req.getParameter("IDACTIVIDAD")));
			beanRCT.setIDSCHEDULEORIGEN(Integer.parseInt(req.getParameter("IDSCHEDULEORIGEN")));
			beanRCT.setIDSCHEDULEDESTINO(Integer.parseInt(req.getParameter("IDSCHEDULEDESTINO")));
			beanRCT.setIDRCT(Integer.parseInt(req.getParameter("IDRCT")));
			beanRCT.setStrValor10(this.horainicio.equals("0") || this.horainicio.equals("null") || this.horainicio.equals("NULL") || this.horainicio == null  ? null : this.horainicio);
			beanRCT.setIDUSUARIOORIGEN(this.user);
			beanRCT.setIDUSUARIOATENCION(this.user);

			BusinessRCT objBusinessRCT = new BusinessRCT();
			icount = objBusinessRCT.saveActividadSchedule(beanRCT,ssf);

			if (icount > 0) {
				resultado = "ok";
			} else {
				resultado = "fail";
			}
		} catch (Exception e) {
			resultado = "fail";
		}
		out.print(resultado);
	}
	
	
	private void listarMCliente(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		
		try {
			List<BeanRCT> lstBeanRCT = null;
			BusinessRCT objBusinessRCT = new BusinessRCT();
			BeanRCT objBeanRCT = new BeanRCT();
			
			
			lstBeanRCT = objBusinessRCT.listarMCliente(objBeanRCT, ssf);
			
			if (lstBeanRCT.size() > 0) {
				strJson1.append("{\"listarMCliente\" : [");
				for (BeanRCT item : lstBeanRCT) {
					strJson1.append("{" +
					"\"IdCliente\" : \"" + item.getStrValor1() + "\" ,"+					
					"\"Descripcion\" : \"" + item.getStrValor2() + "\" "+
					"},"
					);
				}
			}else {

				strJson1.append("{\"listarMCliente\": [");
				strJson1.append("{" +
						"\"IdCliente\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			} 
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			
		}catch (Exception e) {
			e.printStackTrace();
			strJson1.append("{\"listarMCliente\": [");
			strJson1.append("{" +
					"\"IdCliente\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	private void listarMServidor(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		
		try {
			List<BeanRCT> lstBeanRCT = null;
			BusinessRCT objBusinessRCT = new BusinessRCT();
			BeanRCT objBeanRCT = new BeanRCT();
			
			
			lstBeanRCT = objBusinessRCT.listarMServidor(objBeanRCT, ssf);
			
			if (lstBeanRCT.size() > 0) {
				strJson1.append("{\"listarMServidor\" : [");
				for (BeanRCT item : lstBeanRCT) {
					strJson1.append("{" +
					"\"IdServidor\" : \"" + item.getStrValor1() + "\" ,"+					
					"\"Descripcion\" : \"" + item.getStrValor2() + "\" "+
					"},"
					);
				}
			}else {

				strJson1.append("{\"listarMServidor\": [");
				strJson1.append("{" +
						"\"IdServidor\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			} 
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			
		}catch (Exception e) {
			e.printStackTrace();
			strJson1.append("{\"listarMServidor\": [");
			strJson1.append("{" +
					"\"IdServidor\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	private void listarMTurno(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		
		try {
			List<BeanRCT> lstBeanRCT = null;
			BusinessRCT objBusinessRCT = new BusinessRCT();
			BeanRCT objBeanRCT = new BeanRCT();
			
			
			lstBeanRCT = objBusinessRCT.listarMTurno(objBeanRCT, ssf);
			
			if (lstBeanRCT.size() > 0) {
				strJson1.append("{\"listarMTurno\" : [");
				for (BeanRCT item : lstBeanRCT) {
					strJson1.append("{" +
					"\"IdTurno\" : \"" + item.getStrValor1() + "\" ,"+					
					"\"Descripcion\" : \"" + item.getStrValor2() + "\" "+
					"},"
					);
				}
			}else {

				strJson1.append("{\"listarMTurno\": [");
				strJson1.append("{" +
						"\"IdTurno\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			} 
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			
		}catch (Exception e) {
			e.printStackTrace();
			strJson1.append("{\"listarMTurno\": [");
			strJson1.append("{" +
					"\"IdTurno\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	
	private void listarRCTDETALLE(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		// TODO Auto-generated method stub
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		
		try {
			List<BeanRCT> lstBeanRCT = null;
			BusinessRCT objBusinessRCT = new BusinessRCT();
			BeanRCT objBeanRCT = new BeanRCT();
			
			objBeanRCT.setIntValor1(Integer.parseInt(req.getParameter("IDRCT")));
			
			lstBeanRCT = objBusinessRCT.listarRCTDETALLE(objBeanRCT, ssf);
			
			if (lstBeanRCT.size() > 0) {
				strJson1.append("{\"listarRCTDETALLE\" : [");
				for (BeanRCT item : lstBeanRCT) {
					strJson1.append("{" +
					"\"FechaReg\" : \"" + item.getStrValor1() + "\" ,"+
					"\"Descripcion\" : \"" + AppUtils.cleanString(item.getStrValor2()) + "\" ,"+
					"\"UsuarioReg\" : \"" + item.getStrValor3() + "\" ,"+
					"\"UsuarioReg2\" : \"" + item.getStrValor4() + "\" ,"+
					"\"IdRctDetalle\" : \"" + item.getStrValor5() + "\" "+
					"},"
					);
				}
			}else {

				strJson1.append("{\"listarRCTDETALLE\": [");
				strJson1.append("{" +
						"\"FechaReg\" : \"" + "No hay registros" + "\" " +
						"},"
						);
			} 
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			
		}catch (Exception e) {
			e.printStackTrace();
			strJson1.append("{\"listarRCTDETALLE\": [");
			strJson1.append("{" +
					"\"FechaReg\" : \"" + "No hay registros" + "\" " +
					"},"
					);
			strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	
	
	public void guardarmodalactividad(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;
			
			BeanSession objBeanSession = new BeanSession();
			
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			this.user = objBeanSession.getObjBeanPersonal().getiIdEmpleado();
			this.team = objBeanSession.getObjBeanPersonal().getiTeam();
			
			
			
			BeanRCT beanRCT = new BeanRCT();
			beanRCT.setiTeam("'"+this.team+"'");
			beanRCT.setIntValor1(Integer.parseInt(req.getParameter("IDCLIENTE")));
			beanRCT.setIntValor2(Integer.parseInt(req.getParameter("IDSERVIDOR")));
			beanRCT.setIntValor3(Integer.parseInt(req.getParameter("IDTURNO")));
			beanRCT.setStrValor4(req.getParameter("DESCRIPCION"));				
			beanRCT.setStrValor5(req.getParameter("FECHAFIN"));
			beanRCT.setStrValor6(req.getParameter("FECHAINICIO"));			
			beanRCT.setIDUSUARIOORIGEN(this.user);

			BusinessRCT objBusinessRCT = new BusinessRCT();
			icount = objBusinessRCT.GuardarModalActividad(beanRCT,ssf);

			if (icount > 0) {
				resultado = "ok";
			} else {
				resultado = "fail";
			}
		} catch (Exception e) {
			resultado = "fail";
		}
		out.print(resultado);
	}
	
	
	public void actualizarRCTactividad (HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;
			
			BeanSession objBeanSession = new BeanSession();
			
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			this.user = objBeanSession.getObjBeanPersonal().getiIdEmpleado();			
			
			BeanRCT beanRCT = new BeanRCT();
			beanRCT.setStrValor1(req.getParameter("FECHAINICIO"));
			beanRCT.setStrValor2(req.getParameter("FECHAVIGENCIA"));			
			beanRCT.setIntValor4(Integer.parseInt(req.getParameter("IDCLIENTE")));			
			beanRCT.setIntValor5(Integer.parseInt(req.getParameter("IDSERVIDOR")));
			beanRCT.setIntValor6(Integer.parseInt(req.getParameter("IDTURNO")));
			beanRCT.setStrValor7(req.getParameter("DESCRIPCION"));			
			beanRCT.setIntValor8(Integer.parseInt(req.getParameter("IDRCT")));

			BusinessRCT objBusinessRCT = new BusinessRCT();
			icount = objBusinessRCT.actualizarRCTactividad(beanRCT,ssf);

			if (icount > 0) {
				resultado = "ok";
			} else {
				resultado = "fail";
			}
		} catch (Exception e) {
			resultado = "fail";
		}
		out.print(resultado);
	}
	
	
	public void guardarDetalleDesc(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;
			
			BeanSession objBeanSession = new BeanSession();
			
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			this.user = objBeanSession.getObjBeanPersonal().getiIdEmpleado();
			this.idrctdetalle = req.getParameter("IDRCTDETALLE");
			
			BeanRCT beanRCT = new BeanRCT();
			beanRCT.setIntValor1(Integer.parseInt(req.getParameter("IDRCT")));
			beanRCT.setStrValor2(req.getParameter("DESCRIPCION"));
			beanRCT.setIntValor3(this.user);
			beanRCT.setStrValor4(this.idrctdetalle.equals("0") || this.idrctdetalle.equals("")  ? null : this.idrctdetalle);
			
			BusinessRCT objBusinessRCT = new BusinessRCT();
			icount = objBusinessRCT.guardarDetalleDesc(beanRCT,ssf);

			if (icount > 0) {
				resultado = "ok";
			} else {
				resultado = "fail";
			}
		} catch (Exception e) {
			resultado = "fail";
		}
		out.print(resultado);
	}
	
	public void eliminarRCTDETALLE(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;
			BeanRCT beanRCT = new BeanRCT();
			beanRCT.setIntValor1(Integer.parseInt(req.getParameter("IDRCTDETALLE")));			
			BusinessRCT objBusinessRCT = new BusinessRCT();
			icount = objBusinessRCT.eliminarRCTDETALLE(beanRCT,ssf);

			if (icount > 0) {
				resultado = "ok";
			} else {
				resultado = "fail";
			}
		} catch (Exception e) {
			resultado = "fail";
		}
		out.print(resultado);
	}
	
	
	
	
	
	
	public void editarDescripcionAnuncio(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;
			BeanRCT beanRCT = new BeanRCT();
			beanRCT.setStrValor1(req.getParameter("DESCRIPCION"));
			beanRCT.setStrValor2(req.getParameter("IDANUNCIO"));
			BusinessRCT objBusinessRCT = new BusinessRCT();
			icount = objBusinessRCT.editarDescripcionAnuncio(beanRCT,ssf);

			if (icount > 0) {
				resultado = "ok";
			} else {
				resultado = "fail";
			}
		} catch (Exception e) {
			resultado = "fail";
		}
		out.print(resultado);
	}
	
	
	
	public void finalizarRCT(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;
			BeanRCT beanRCT = new BeanRCT();
			beanRCT.setIDRCT(Integer.parseInt(req.getParameter("IDRCT")));
			
			BusinessRCT objBusinessRCT = new BusinessRCT();
			icount = objBusinessRCT.finalizarRCT(beanRCT,ssf);

			if (icount > 0) {
				resultado = "ok";
			} else {
				resultado = "fail";
			}
		} catch (Exception e) {
			resultado = "fail";
		}
		out.print(resultado);
	}
	
	
}
