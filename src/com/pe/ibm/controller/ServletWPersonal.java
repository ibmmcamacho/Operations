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

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanPerfil;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessPerfil;
import com.pe.ibm.business.BusinessPersonal;

/**
 * Servlet implementation class ServletWPersonal
 */
@WebServlet("/ServletWPersonal")
public class ServletWPersonal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletWPersonal() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			/* Obtener sqlsessionF*/
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
			
			String strOperacion = request.getParameter("strOperation");	
			if (strOperacion.equals("list"))
				list(request, response,ssf);
			else if (strOperacion.equals("listPerfil"))
				listPerfil(request, response,ssf);
			else if (strOperacion.equals("CambiarEstado1")) {
				cambiarestado1(request, response,ssf);}
			else if (strOperacion.equals("listImage")){
				BeanEmpleado objPersonal = new BeanEmpleado();
				objPersonal.setiIdEmpleado(Integer.parseInt(request.getParameter("strIdEmpleado")));
				objPersonal.setiTeam(Integer.parseInt(request.getParameter("iTeam")));
				listImage(request, response, objPersonal,ssf);
			}
			else if (strOperacion.equals("image")) {
				BeanEmpleado objPersonal = new BeanEmpleado();
				objPersonal.setStrIdLogin(request.getParameter("strIdLogin"));
				objPersonal.setStrPhoto(request.getParameter("strPhoto"));
				objPersonal.setiTeam(Integer.parseInt(request.getParameter("iTeam")));
				updImage(request, response, objPersonal,ssf);
			}
			else {
				
				BeanEmpleado objPersonal = new BeanEmpleado();
				String a = request.getParameter("strIdEmpleado");
				objPersonal.setiIdEmpleado(Integer.parseInt(request.getParameter("strIdEmpleado")));
				objPersonal.setStrIdLogin(request.getParameter("strIdLogin"));
				objPersonal.setStrNombre(request.getParameter("strNombre"));
				objPersonal.setStrApPaterno(request.getParameter("strApPaterno"));
				objPersonal.setStrApMaterno(request.getParameter("strApMaterno"));
				objPersonal.setStrEmail(request.getParameter("strEmail"));
				objPersonal.setiModalidad(Integer.parseInt(request.getParameter("iModalidad")));
				objPersonal.setiArea(Integer.parseInt(request.getParameter("iArea")));
				objPersonal.setiCargo(Integer.parseInt(request.getParameter("iCargo")));
				objPersonal.setiPerfil(Integer.parseInt(request.getParameter("iPerfil")));
				objPersonal.setStrClave(request.getParameter("strClave"));
				objPersonal.setiTeam(Integer.parseInt(request.getParameter("iTeam")));
				
				if (strOperacion.equals("delete")) {
					delete(request, response, objPersonal,ssf);
				} else if (strOperacion.equals("update")) {
					update(request, response, objPersonal,ssf);
				} else if (strOperacion.equals("save")) {
					save(request, response, objPersonal,ssf);
				} else if (strOperacion.equals("updatePassword")) {
					updatePassword(request, response, objPersonal, ssf);
				}
			}
		} catch (Exception ex) {
			System.out.println(ex.getCause().getMessage());
//			list(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public void listPerfil(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();

		strJson1.append("{\"reporte\" : [");
		try {
			List<BeanPerfil> lstBeanPerfil = null;
			BusinessPerfil objBusinessPerfil = new BusinessPerfil();
			BeanPerfil objBeanPerfil = new BeanPerfil();
			objBeanPerfil.setiTeam(Integer.parseInt(req.getParameter("iTeam")));
			lstBeanPerfil = objBusinessPerfil.listPerfil(objBeanPerfil,ssf);
			
			if (lstBeanPerfil.size() > 0) {
				for (BeanPerfil item : lstBeanPerfil) {
					strJson1.append("{\"idPefil\" : \"" + item.getiIdPerfil() + "\",");
					strJson1.append("\"descripcion\" : \"" + item.getStrDescripcion() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
		} catch (Exception e) {
			strJson1.append(",");
			System.out.println(e.getCause().getMessage());
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	public void list(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		
		strJson1.append("{\"reporte\" : [");
		try {
			List<BeanEmpleado> lstBeanPersonal = null;
			BusinessPersonal objBusinessPersonal = new BusinessPersonal();
			BeanEmpleado objPersonal = new BeanEmpleado();
			objPersonal.setiTeam(Integer.parseInt(req.getParameter("iTeam")));

			lstBeanPersonal = objBusinessPersonal.listPersonal(objPersonal,ssf);

			if (lstBeanPersonal.size() > 0) {
				for (BeanEmpleado item : lstBeanPersonal) {
					strJson1.append("{\"idLogin\" : \"" + item.getStrIdLogin() + "\",");
					strJson1.append("\"nombre\" : \"" + item.getStrNombre() + "\",");
					strJson1.append("\"apPaterno\" : \"" + item.getStrApPaterno() + "\",");
					strJson1.append("\"apMaterno\" : \"" + item.getStrApMaterno() + "\",");
					strJson1.append("\"email\" : \"" + item.getStrEmail() + "\",");
					strJson1.append("\"modalidad\" : \"" + item.getStrModalidad() + "\",");
					strJson1.append("\"area\" : \"" + item.getStrArea() + "\",");
					strJson1.append("\"cargo\" : \"" + item.getStrCargo() + "\",");
					strJson1.append("\"perfil\" : \"" + item.getStrPerfil() + "\",");
					strJson1.append("\"estado\" : \"" + item.getStrEstado() + "\",");
					
					strJson1.append("\"idPersonal\" : \"" + item.getiIdEmpleado() + "\",");
					strJson1.append("\"idModalidad\" : \"" + item.getiModalidad() + "\",");
					strJson1.append("\"idArea\" : \"" + item.getiArea() + "\",");
					strJson1.append("\"idCargo\" : \"" + item.getiCargo() + "\",");
					strJson1.append("\"idPerfil\" : \"" + item.getiPerfil() + "\"");
					
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
	
	public void listImage(HttpServletRequest req, HttpServletResponse res, BeanEmpleado pobjPersonal, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
//		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();

		strJson1.append("{\"image\" : \"");
		try {
			String strPhoto = "";
			BusinessPersonal objBusinessPersonal = new BusinessPersonal();
			strPhoto = objBusinessPersonal.listImage(pobjPersonal,ssf);

			if (strPhoto.length() > 0) {
				strJson1.append(strPhoto + "\"}");
			} else {
				strJson1.append("\"}");
			}
		} catch (Exception e) {
			strJson1.append("\"}");
		}
//		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson1);
	}

	public void save(HttpServletRequest req, HttpServletResponse res, BeanEmpleado pobjBeanPersonal, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessPersonal objBusinessPersonal = new BusinessPersonal();

			icount = objBusinessPersonal.savePersonal(pobjBeanPersonal,ssf);

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

	public void update(HttpServletRequest req, HttpServletResponse res, BeanEmpleado pobjBeanPersonal, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessPersonal objBusinessPersonal = new BusinessPersonal();

			icount = objBusinessPersonal.updatePersonal(pobjBeanPersonal,ssf);

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
	
	public void updImage(HttpServletRequest req, HttpServletResponse res, BeanEmpleado pobjBeanPersonal, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;
			BusinessPersonal objBusinessPersonal = new BusinessPersonal();
			icount = objBusinessPersonal.updateImage(pobjBeanPersonal,ssf);

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
	
	public void delete(HttpServletRequest req, HttpServletResponse res, BeanEmpleado pobjBeanPersonal, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessPersonal objBusinessPersonal = new BusinessPersonal();
			icount = objBusinessPersonal.deletePersonal(pobjBeanPersonal,ssf);

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
	
	public void updatePassword(HttpServletRequest req, HttpServletResponse res, BeanEmpleado pobjBeanPersonal, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessPersonal objBusinessPersonal = new BusinessPersonal();
			icount = objBusinessPersonal.updatePersonalPassword(pobjBeanPersonal,ssf);

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
	
	public void cambiarestado1(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;
			
			BusinessPersonal objBusinessPersonal = new BusinessPersonal();

			BeanEmpleado objPersonal = new BeanEmpleado();			
			objPersonal.setiIdEmpleado(Integer.parseInt(req.getParameter("idempleado")));
			
			icount = objBusinessPersonal.cambiarestado1(objPersonal,ssf);

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
