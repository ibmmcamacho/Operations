package com.pe.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessLogin;
import com.pe.ibm.util.AppUtils;
import com.pe.ibm.util.Autenticacion;

/**
 * Servlet implementation class ServletWindex
 */

@WebServlet("/ServletWindex")
public class ServletWindex extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String strImbrs = "";
	

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ServletWindex() {
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

		try
		{
			/* Obtener sqlsessionF*/
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
			
			String strOperation = request.getParameter("strOperation");
			
			
			if (strOperation != null){
				if(strOperation.equals("autenticacion"))
					validaUsuario(request,response,ssf);
				else if(strOperation.equals("ingresar"))
					redireccionamiento(request, response, ssf);
				else if(strOperation.equals("cambiarAmbiente"))
					reCambiarAmbiente(request, response, ssf);
			}
			else
				redireccionamiento(request, response, ssf);
		}
		catch(Exception ex){
			response.sendRedirect("whome.jsp");
			System.out.println(ex.getCause().getMessage());
		}
//		response.getWriter().append("Served at: ").append(request.getContextPath());
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
	
	private void validaUsuario(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		try {
			String strIdLogin = req.getParameter("strIdLogin");
			String strPwd = req.getParameter("strPwd");
			/*String*/ strImbrs = req.getParameter("strImbrs");			
			if(strImbrs.equals("SI")){
				String[] resultado;
				if(strIdLogin.contains("ibm.com"))
					resultado = new Autenticacion().ibm(strIdLogin, strPwd, "bluepage",ssf,req.getServerName().toString());
				else
					resultado = new Autenticacion().ibm(strIdLogin, strPwd, "maximo",ssf,req.getServerName().toString());
				
				strJson1.append(resultado[1]);
				strJson2.append(strJson1.toString().replace("Nombre Completo", "NombreCompleto").toString());
			}
			else{
				BusinessLogin objBusinessLogin = new BusinessLogin();
				BeanEmpleado objBeanPersonal = new BeanEmpleado();
				BeanSession objBeanSession = new BeanSession();
				objBeanPersonal.setStrIdLogin(strIdLogin.toUpperCase());
				objBeanPersonal.setStrClave(strPwd);
				objBeanSession = objBusinessLogin.validarLoginCliente(objBeanPersonal,ssf);
				
				strJson2.append("{\"Usuario\" : [{  \"codigo\" : \"0\" ,  \"cuenta\" : \"" + objBeanSession.getObjBeanPersonal().getStrIdLogin() + "\" ,  \"NombreCompleto\" : \"" + (objBeanSession.getObjBeanPersonal().getStrNombre() + objBeanSession.getObjBeanPersonal().getStrApPaterno() + objBeanSession.getObjBeanPersonal().getStrApMaterno()) + "\" ,  \"Id\" : \"Externo\" } ]}");
				
			}
			AppUtils.convertAuditoria(req, "VALIDA USUARIO", strJson2.toString(), 0,"", "VALIDACIÓN DE USUARIO", "strIdLogin: " + strIdLogin + ", strImbrs: " + strImbrs, ssf);
		} catch (Exception e) {
			strJson2.append(strJson1.append("{\"Usuario\":[{\"codigo\" : \"500\"}]}"));
		}
		
//		strJson2 = new StringBuilder();
//		strJson2.append("{\"Usuario\":[{\"NombreCompleto\" : \"Manuel Camacho\", \"cuenta\" : \"mcamacho@pe.ibm.com\", \"codigo\" : \"0\"}]}");

//		strJson2.append(req.getRequestURL() + " - " + req.getRequestURL().indexOf("mybluemix"));
		
		out.print(strJson2.toString());
	}
	
	private void redireccionamiento(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		BeanSession objBeanSession = new BeanSession();
		HttpSession objSessionLogin = req.getSession();
		objSessionLogin.setMaxInactiveInterval(24*60);
		
		res.setCharacterEncoding("UTF-8");
		
		BusinessLogin objBusinessLogin = new BusinessLogin();
		BeanEmpleado objBeanPersonal = new BeanEmpleado();
		try{
			objBeanPersonal.setiTeam(Integer.parseInt(req.getParameter("cboTeam")));
			objBeanPersonal.setStrIdLogin(req.getParameter("hdUser").toString().toUpperCase());
			
			objBeanSession = objBusinessLogin.validarLogin(objBeanPersonal,ssf);
			objBeanSession.getObjBeanPersonal().setStrClave(req.getParameter("password"));
			if(objBeanSession.getObjBeanPersonal() != null)
			{
				AppUtils.convertAuditoria(req, "REDIRECCIONAMIENTO DE USUARIO", "OK", objBeanPersonal.getiIdEmpleado(), objBeanPersonal.getStrNombre() + " " + objBeanPersonal.getStrApPaterno(), "REDIRECCIONAMIENTO", "", ssf);
				objBeanSession.setResultado(objBeanSession.getObjBeanPersonal().getStrNombre().length() > 0 ? true : false);
				if (objBeanSession.isResultado()) 
				{
					    objBeanSession.getObjBeanPersonal().setStrImbrs(strImbrs);
						objSessionLogin.setAttribute("usuarioLogin", objBeanSession);					
						objBeanSession.setStrMessage("");
						res.sendRedirect("whome.jsp");
						return;
				}
				else
	 			{
					objBeanSession.setStrMessage("El usuario o contraseña es incorrecto");
					res.sendRedirect("windex.jsp");
					return;
				}
			}
			else
			{
				AppUtils.convertAuditoria(req, "REDIRECCIONAMIENTO DE USUARIO", "FAILED", objBeanPersonal.getiIdEmpleado(), objBeanPersonal.getStrNombre() + " " + objBeanPersonal.getStrApPaterno(), "REDIRECCIONAMIENTO", "", ssf);
				objBeanSession = new BeanSession();
				objBeanSession.setStrMessage("El usuario o contraseña o el ambiente es incorrecto");
				objSessionLogin.setAttribute("usuarioLogin", objBeanSession);
				res.sendRedirect("windex.jsp");
				return;
			}
 		} catch (Exception e) {
			System.out.println(e.getCause().getMessage());
			objBeanSession.setStrMessage(e.getCause().getMessage());
			objSessionLogin.setAttribute("usuarioLogin", objBeanSession);
			res.sendRedirect("windex.jsp");
			return;
		}
	}
	
	private void reCambiarAmbiente(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		res.setCharacterEncoding("UTF-8");	
		BeanEmpleado objBeanPersonal = new BeanEmpleado();
		
		HttpSession objSessionLogin = req.getSession(false);
		objSessionLogin.setMaxInactiveInterval(14400);
		BeanSession objBeanSession = new BeanSession();
		BusinessLogin objBusinessLogin = new BusinessLogin();
		strImbrs = req.getParameter("strImbrs");		
		
			try {
			objBeanPersonal.setiTeam(Integer.parseInt(req.getParameter("combo")));
			objBeanPersonal.setStrIdLogin(req.getParameter("strEmail").toString().toUpperCase());								
					
			objBeanSession = objBusinessLogin.validarLogin(objBeanPersonal,ssf);			
			  if(objBeanSession.getObjBeanPersonal() != null)
			  {
				AppUtils.convertAuditoria(req, "REDIRECCIONAMIENTO DE USUARIO", "OK", objBeanPersonal.getiIdEmpleado(), objBeanPersonal.getStrNombre() + " " + objBeanPersonal.getStrApPaterno(), "REDIRECCIONAMIENTO", "", ssf);
				objBeanSession.setResultado(objBeanSession.getObjBeanPersonal().getStrNombre().length() > 0 ? true : false);
				  if (objBeanSession.isResultado()) 
				  {
					   objBeanSession.getObjBeanPersonal().setStrImbrs(strImbrs);
						objSessionLogin.setAttribute("usuarioLogin", objBeanSession);
						objBeanSession.setStrMessage("");
						res.sendRedirect("whome.jsp");
						return;
				  }
			  }
			} catch (Exception e) {				
				System.out.println(e.getCause().getMessage());
				objBeanSession.setStrMessage(e.getCause().getMessage());
				objSessionLogin.setAttribute("usuarioLogin", objBeanSession);
				res.sendRedirect("windex.jsp");
				return;
			}	
	}
}
	

