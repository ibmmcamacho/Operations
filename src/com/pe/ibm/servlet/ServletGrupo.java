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

import com.pe.ibm.bean.BeanGrupo;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanPerfil;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.bean.BeanTeam;
import com.pe.ibm.business.BusinessGrupo;
import com.pe.ibm.business.BusinessOptions;
import com.pe.ibm.business.BusinessTeam;

/**
 * Servlet implementation class ServletWOptions
 */
@WebServlet("/ServletGrupo")
public class ServletGrupo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int team;
	private String accion;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletGrupo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			this.accion = request.getParameter("strAccion").toString();
			
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
			BeanSession objBeanSession = new BeanSession();
			
			HttpSession objSessionLogin = request.getSession(true);
			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
		
			this.team = objBeanSession.getObjBeanPersonal().getiTeam();
			if (this.accion.equals("listar")) {
				listGrupo(request, response,ssf);
			}

		} catch (Exception ex) {
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
		
	public void listGrupo(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf) throws IOException {

		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		
		try {
			List<BeanGrupo> lstBeanGrupo = null;
			BusinessGrupo objBusinessGrupo = new BusinessGrupo();
			BeanGrupo objBeanGrupo = new BeanGrupo();
			
			objBeanGrupo.setiTeam(this.team);
			lstBeanGrupo = objBusinessGrupo.listGrupo(objBeanGrupo, ssf);

			objJson1.append("{\"ListaGrupo\": [");
			
			if (lstBeanGrupo.size() > 0) {
				for (BeanGrupo beanGrupo : lstBeanGrupo) {
					objJson1.append("{" +
							"\"idGrupo\" : \"" + beanGrupo.getiIdGrupo() + "\" ," +
							"\"descripcion\" : \"" + beanGrupo.getStrDescripcion() + "\" " +
							"},"
							);
				}
			}
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			objJson1.append("{\"ListaGrupo\": [");
			objJson1.append("{" +
					"\"idGrupo\" : \"" + "" + "\" ," +
					"\"descripcion\" : \"" + this.team + " No hay informaci�n disponible" + "\" " +
					"},"
					);			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
}
