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

import com.pe.ibm.bean.BeanBancoClaves;
import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessBancoClaves;
import com.pe.ibm.util.AppUtils;

/**
 * Servlet implementation class ServletWHorario
 */
@WebServlet("/ServletBancoClaves")
public class ServletBancoClaves extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletBancoClaves() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			BeanBancoClaves objBeanBancoClaves = new BeanBancoClaves();
			BeanEmpleado objBeanPersonal = new BeanEmpleado();
		try {
			
			/* Obtener sqlsessionF*/
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
			
			String strOperacion = request.getParameter("strOperation");
			
			if (strOperacion.equals("list")) {
//				objBeanBancoClaves.setiTeam(Integer.parseInt(request.getParameter("iTeam")));
				list(request, response, objBeanBancoClaves,ssf);
			} else {
				objBeanBancoClaves.setiIdBancoClaves(Integer.parseInt(request.getParameter("iIdBancoClaves")));
				objBeanBancoClaves.setStrCliente(request.getParameter("strCliente"));
				objBeanBancoClaves.setStrServidor(request.getParameter("strServidor"));
				objBeanBancoClaves.setStrIp(request.getParameter("strIp"));
				objBeanBancoClaves.setStrInstancia(request.getParameter("strInstancia"));
				objBeanBancoClaves.setStrMandante(request.getParameter("strMandante"));
				objBeanBancoClaves.setStrSisSubSis(request.getParameter("strSisSubSis"));
				objBeanBancoClaves.setStrUsuario(request.getParameter("strUsuario"));
				objBeanBancoClaves.setStrContrasena(request.getParameter("strContrasena"));
				objBeanBancoClaves.setStrObservaciones(request.getParameter("strObservaciones"));
				
				if (strOperacion.equals("delete")) {
					delete(request, response, objBeanBancoClaves,ssf);
				} else if (strOperacion.equals("update")) {
					update(request, response, objBeanBancoClaves,ssf);
				} else if (strOperacion.equals("save")) {
					save(request, response, objBeanBancoClaves,ssf);
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void list(HttpServletRequest req, HttpServletResponse res, BeanBancoClaves objBeanBancoClaves, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"reporte\" : [");
		try {
			List<BeanBancoClaves> lstBeanBancoClaves = null;
			BusinessBancoClaves objBusinessBancoClaves = new BusinessBancoClaves();
			
			lstBeanBancoClaves = objBusinessBancoClaves.listBancoClaves(objBeanBancoClaves,ssf);
			
			if (lstBeanBancoClaves != null && lstBeanBancoClaves.size() > 0) {
				for (BeanBancoClaves item : lstBeanBancoClaves) {
					strJson1.append("{\"iIdBancoClaves\" : \"" + item.getiIdBancoClaves() + "\",");
					strJson1.append("\"strCliente\" : \"" + item.getStrCliente() + "\",");
					strJson1.append("\"strServidor\" : \"" + item.getStrServidor() + "\",");
					strJson1.append("\"strIp\" : \"" + item.getStrIp() + "\",");
					strJson1.append("\"strInstancia\" : \"" + item.getStrInstancia() + "\",");
					strJson1.append("\"strMandante\" : \"" + item.getStrMandante() + "\",");
					strJson1.append("\"strSisSubSis\" : \"" + item.getStrSisSubSis() + "\",");
					strJson1.append("\"strUsuario\" : \"" + item.getStrUsuario().replace("\\", "\\\\") + "\",");
					strJson1.append("\"strContrasena\" : \"" + item.getStrContrasena() + "\",");
					strJson1.append("\"strObservaciones\" : \"" + item.getStrObservaciones() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
		} catch (Exception e) {
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}

	public void save(HttpServletRequest req, HttpServletResponse res, BeanBancoClaves pobjBeanBancoClaves, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessBancoClaves objBusinessBancoClaves = new BusinessBancoClaves();

			icount = objBusinessBancoClaves.saveBancoClaves(pobjBeanBancoClaves,ssf);
			
			BeanSession objBeanSession = new BeanSession();
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");

			if (icount > 0) {
				resultado = "ok";
			} else {
				resultado = "fail";
			}
			
			AppUtils.convertAuditoria(req, "GUARDAR NUEVA CLAVE", (icount > 0 ? "OK" : icount <= 0 ? "FAIL" : "FAIL"), objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "BANCO DE CLAVES",pobjBeanBancoClaves.toString(), ssf);
			
		} catch (Exception e) {
			resultado = "fail";
			BeanSession objBeanSession = new BeanSession();
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			AppUtils.convertAuditoria(req, "GUARDAR NUEVA CLAVE", "ERROR", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "BANCO DE CLAVES",e.getMessage() + " ==>" + pobjBeanBancoClaves.toString(), ssf);
		}
		out.print(resultado);
	}

	public void update(HttpServletRequest req, HttpServletResponse res, BeanBancoClaves pobjBeanBancoClaves, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessBancoClaves objBusinessBancoClaves = new BusinessBancoClaves();

			icount = objBusinessBancoClaves.updateBancoClaves(pobjBeanBancoClaves,ssf);

			if (icount > 0) {
				resultado = "ok";
			} else {
				resultado = "fail";
			}
			
			BeanSession objBeanSession = new BeanSession();
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			AppUtils.convertAuditoria(req, "ACTUALIZAR NUEVA CLAVE", (icount > 0 ? "OK" : icount <= 0 ? "FAIL" : "FAIL"), objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "BANCO DE CLAVES",pobjBeanBancoClaves.toString(), ssf);
		} catch (Exception e) {
			resultado = "fail";
			BeanSession objBeanSession = new BeanSession();
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			AppUtils.convertAuditoria(req, "ACTUALIZAR NUEVA CLAVE", "ERROR", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "BANCO DE CLAVES",e.getMessage() + " ==>" + pobjBeanBancoClaves.toString(), ssf);
		}
		out.print(resultado);
	}

	public void delete(HttpServletRequest req, HttpServletResponse res, BeanBancoClaves pobjBeanBancoClaves, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessBancoClaves objBusinessBancoClaves = new BusinessBancoClaves();

			icount = objBusinessBancoClaves.deleteBancoClaves(pobjBeanBancoClaves,ssf);

			if (icount > 0) {
				resultado = "ok";
			} else {
				resultado = "fail";
			}
			
			BeanSession objBeanSession = new BeanSession();
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			AppUtils.convertAuditoria(req, "ELIMINAR NUEVA CLAVE", (icount > 0 ? "OK" : icount <= 0 ? "FAIL" : "FAIL"), objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "BANCO DE CLAVES",pobjBeanBancoClaves.toString(), ssf);
		} catch (Exception e) {
			resultado = "fail";
			BeanSession objBeanSession = new BeanSession();
			HttpSession objSessionLogin = req.getSession(false);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			AppUtils.convertAuditoria(req, "ELIMINAR NUEVA CLAVE", "ERROR", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "BANCO DE CLAVES",e.getMessage() + " ==>" + pobjBeanBancoClaves.toString(), ssf);

		}
		out.print(resultado);
	}

}
