package com.pe.ibm.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanFeedBack;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessActividad;
import com.pe.ibm.business.BusinessFeedBack;

/**
 * Servlet implementation class ServletFeedBack
 */
@WebServlet("/ServletFeedBack")
public class ServletFeedBack extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletFeedBack() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		int resultado = 0;
		String respuesta = "";
		
		try {
			out.print(strJson2);

			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
			
			BeanSession objBeanSession = new BeanSession();
			
			HttpSession objSessionLogin = request.getSession(true);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
			String usuario = 	objBeanSession.getObjBeanPersonal().getStrNombre() + " " + 
					objBeanSession.getObjBeanPersonal().getStrApPaterno() + " " +
					objBeanSession.getObjBeanPersonal().getStrApMaterno();
			String team = objBeanSession.getObjBeanPersonal().getStrTeam();
			String comentario = request.getParameter("strComentario");
			int puntuacion = Integer.parseInt(request.getParameter("strPuntaje"));
			String rutaPagina = request.getParameter("strRutaPagina");
			
			
			BeanFeedBack bean = new BeanFeedBack();
			bean.setTeam(team);
			bean.setRutaPagina(rutaPagina);
			bean.setUsuario(usuario);
			bean.setPuntuacion(puntuacion);
			bean.setComentario(comentario);
			
			if(team.equals("SCHEDULEPM")) {
			bean.setEmailOwner("ajcanale@pe.ibm.com");
			}
			
			BusinessFeedBack servicioFeedback = new BusinessFeedBack();
			resultado = servicioFeedback.insertar(bean, ssf);
			
			
			if(resultado == 1) {
				respuesta = "El registro se realizo satisfactoriamente";	
			}else {
				respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			}
					
			//Generar JSON
			objJson1.append("{\"Resultado\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + resultado + "\" ," +
						"\"resultado\" : \"" + respuesta + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");	
			
		}catch(Exception e) {
			e.printStackTrace();
			resultado = 0;
			respuesta = "*Hubo un error durante el proceso de registro o actualización";	
			//Generar JSON
			objJson1 = new StringBuilder();
			objJson1.append("{\"RegistroTarea\": [");
			
				objJson1.append("{" +
						"\"codigo\" : \"" + resultado + "\" ," +
						"\"resultado\" : \"" + respuesta + "\" " +
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
