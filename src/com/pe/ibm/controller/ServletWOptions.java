package com.pe.ibm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.business.BusinessOptions;

/**
 * Servlet implementation class ServletWOptions
 */
@WebServlet("/ServletWOptions")
public class ServletWOptions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletWOptions() {
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
			SqlSessionFactory ssf2 = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf2");
			
			String strOperacion = request.getParameter("strOperation");

			if (strOperacion.equals("listOptions")) {
				listOptions(request, response,ssf);
			}else if (strOperacion.equals("listOptionsImage")) {
				listOptionsImage(request, response,ssf);
			}else if (strOperacion.equals("listType")) {
				listType(request, response,ssf);
			}else if (strOperacion.equals("listOpstionsImage")) {
				listOptionsImage(request, response,ssf);
			}else if (strOperacion.equals("listOptionsAnio")) {
				listOptionsAnioClaim(request, response,ssf2);
			}
			else if (strOperacion.equals("listOptionsFechaClaim")) {
				listOptionsFechaClaim(request, response,ssf2);
			}
			else {
				BeanOptions objOptions = new BeanOptions();
				objOptions.setiIdOption(Integer.parseInt(request.getParameter("iIdOptions")));
				objOptions.setStrDescripcion(request.getParameter("strDescripcion"));
				objOptions.setStrValor1(request.getParameter("strValor1"));
				objOptions.setStrValor2(request.getParameter("strValor2"));
				objOptions.setiTeam(Integer.parseInt(request.getParameter("iTeam")));
				objOptions.setStrTipo(request.getParameter("strType"));
				
				if (strOperacion.equals("delete")) {
					deleteOptions(request, response, objOptions,ssf);
				} else if (strOperacion.equals("update")) {
					updateOptions(request, response, objOptions,ssf);
				} else if (strOperacion.equals("save")) {
					saveOptions(request, response, objOptions,ssf);
				}
			}
		}catch (Exception ex) {
			System.out.println(ex.getCause().getMessage());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void listType(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"tipo\" : [");
		try {
			List<BeanOptions> lstBeanOptions = null;
			BeanParameters objBeanParameter = new BeanParameters();
			BusinessOptions objBusinessOptions = new BusinessOptions();

			objBeanParameter.setiTeam(Integer.parseInt(req.getParameter("iTeam")));
			lstBeanOptions = objBusinessOptions.listType(objBeanParameter,ssf);

			if (lstBeanOptions.size() > 0) {
				for (BeanOptions item : lstBeanOptions) {
					strJson1.append("{\"descripcion\" : \"" + item.getStrDescripcion() + "\"},");
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
	
	public void listOptions(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();

		strJson1.append("{\"reporte\" : [");
		try {
			List<BeanOptions> lstBeanOptions = null;
			BeanParameters objBeanParameter = new BeanParameters();
			BusinessOptions objBusinessOptions = new BusinessOptions();

			objBeanParameter.setiTeam(Integer.parseInt(req.getParameter("iTeam")));
			objBeanParameter.setStrType(req.getParameter("strType"));
			lstBeanOptions = objBusinessOptions.listOptions(objBeanParameter,ssf);

			if (lstBeanOptions.size() > 0) {
				for (BeanOptions item : lstBeanOptions) {
					strJson1.append("{\"idOption\" : \"" + item.getiIdOption() + "\",");
					strJson1.append("\"descripcion\" : \"" + item.getStrDescripcion() + "\",");
					strJson1.append("\"valor1\" : \"" + item.getStrValor1() + "\",");
					strJson1.append("\"valor2\" : \"" + item.getStrValor2() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
		} catch (Exception e) {
			System.out.println(e.getCause().getMessage());
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	public void listOptionsImage(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();

		strJson1.append("{\"reporte\" : [");
		try {
			List<BeanOptions> lstBeanOptions = null;
			BeanParameters objBeanParameter = new BeanParameters();
			BusinessOptions objBusinessOptions = new BusinessOptions();

			objBeanParameter.setiTeam(Integer.parseInt(req.getParameter("iTeam")));
			objBeanParameter.setStrType(req.getParameter("strType"));
			lstBeanOptions = objBusinessOptions.listOptionsImage(objBeanParameter,ssf);

			if (lstBeanOptions.size() > 0) {
				for (BeanOptions item : lstBeanOptions) {
					strJson1.append("{\"idOption\" : \"" + item.getiIdOption() + "\",");
					strJson1.append("\"descripcion\" : \"" + item.getStrDescripcion() + "\",");
					strJson1.append("\"valor1\" : \"" + item.getStrValor1() + "\",");
					strJson1.append("\"valor2\" : \"" + item.getStrValor2() + "\",");
					strJson1.append("\"valor3\" : \"" + item.getStrValor3() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
		} catch (Exception e) {
			System.out.println(e.getCause().getMessage());
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}

public void listOptionsAnioClaim(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();

		strJson1.append("{\"reporte\" : [");
		try {
			List<BeanOptions> lstBeanOptions = null;
			BeanParameters objBeanParameter = new BeanParameters();
			BusinessOptions objBusinessOptions = new BusinessOptions();

			lstBeanOptions = objBusinessOptions.listOptionsAnioClaim(objBeanParameter,ssf);

			if (lstBeanOptions.size() > 0) {
				for (BeanOptions item : lstBeanOptions) {
					strJson1.append("{\"descripcion\" : \"" + item.getStrDescripcion() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
		} catch (Exception e) {
			System.out.println(e.getCause().getMessage());
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	
	public void listOptionsFechaClaim(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();

		strJson1.append("{\"reporte\" : [");
		try {
			List<BeanOptions> lstBeanOptions = null;
			BeanParameters objBeanParameter = new BeanParameters();
			BusinessOptions objBusinessOptions = new BusinessOptions();

			objBeanParameter.setiValor1(Integer.parseInt(req.getParameter("iAnio")));
			lstBeanOptions = objBusinessOptions.listOptionsFechaClaim(objBeanParameter,ssf);

			if (lstBeanOptions.size() > 0) {
				for (BeanOptions item : lstBeanOptions) {
					strJson1.append("{\"idOption\" : \"" + item.getiIdOption() + "\",");
					strJson1.append("\"descripcion\" : \"" + item.getStrValor1() + " - " + item.getStrDescripcion() + "\",");
					strJson1.append("\"valor1\" : \"" + item.getStrValor1() + "\",");
					strJson1.append("\"valor2\" : \"" + item.getStrDescripcion() + "\",");
					strJson1.append("\"ivalor1\" : \"" + item.getStrValor2() + "\"");
					strJson1.append("},");
				}
			} else {
				strJson1.append(",");
			}
		} catch (Exception e) {
			System.out.println(e.getCause().getMessage());
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
		out.print(strJson2);
	}
	public void saveOptions(HttpServletRequest req, HttpServletResponse res, BeanOptions pobjBeanOptions, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessOptions objBusinessOptions = new BusinessOptions();

			icount = objBusinessOptions.saveOptions(pobjBeanOptions,ssf);

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

	public void updateOptions(HttpServletRequest req, HttpServletResponse res, BeanOptions pobjBeanOptions, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessOptions objBusinessOptions = new BusinessOptions();

			icount = objBusinessOptions.updateOptions(pobjBeanOptions, ssf);

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

	public void deleteOptions(HttpServletRequest req, HttpServletResponse res, BeanOptions pobjBeanOptions, SqlSessionFactory ssf)
			throws IOException {
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;

			BusinessOptions objBusinessOptions = new BusinessOptions();

			icount = objBusinessOptions.deleteOptions(pobjBeanOptions,ssf);

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
