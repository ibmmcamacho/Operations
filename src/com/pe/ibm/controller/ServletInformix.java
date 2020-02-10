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

import com.pe.ibm.bean.BeanAlerta;
import com.pe.ibm.bean.BeanInformix;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessInformix;
import com.pe.ibm.util.AppUtils;

/**
 * Servlet implementation class ServletAlertaEjecutiva
 */
@WebServlet("/ServletInformix")
public class ServletInformix extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletInformix() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/* Obtener sqlsessionF*/
		SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsfInformix");
//		String strOperacion = request.getParameter("strOperation");
//		if(strOperacion.equals("listDetalleAlerta")){
			listInformix(request,response,ssf);
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void listInformix(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException {
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		List<BeanInformix> listBeanInformix = null;
		BeanSession objBeanSession = new BeanSession();
		
		try{
			BusinessInformix objBusinessInformix = new BusinessInformix();
			
//			int iIdDetalleAlerta = Integer.parseInt(req.getParameter("pidAlerta"));
			listBeanInformix = objBusinessInformix.listarInformix(new BeanInformix(), ssf);
			System.out.println("Total de registros: " + listBeanInformix.size());
			
			strJson1.append("{\"objInformix\" : [");
			for(BeanInformix item : listBeanInformix){
				strJson1.append("{");
				strJson1.append("\"sessionId\" : \"" + item.getSessionId() + "\",");
				strJson1.append("\"sessionSeqNum\" : \"" + item.getSessionSeqNum() + "\",");
				strJson1.append("\"nodeID\" : \"" + item.getNodeID() + "\",");
				strJson1.append("\"profileID\" : \"" + item.getProfileID() + "\",");
				strJson1.append("\"applicationname\" : \"" + item.getApplicationname()+ "\",");
				strJson1.append("\"contactType\" : \"" + item.getContactType() + "\",");
				strJson1.append("\"contactDisposition\" : \"" + item.getContactDisposition() + "\",");
				strJson1.append("\"startDateTime\" : \"" + item.getStartDateTime() + "\",");
				strJson1.append("\"endDateTime\" : \"" + item.getEndDateTime() + "\",");
				strJson1.append("\"minute\" : \"" + item.getMinute() + "\",");
				strJson1.append("\"current\" : \"" + item.getCurrent() + "\"");
				
//				System.out.println("#####################################");
//				System.out.println(item.getStrMensaje());
//				System.out.println(item.getStrMensaje().replaceAll("[\n]", "||").replaceAll("\"", "'").trim() + "\",");
				
//				strJson1.append("\"mensaje\" : \"" + AppUtils.cleanString(item.getStrMensaje().replaceAll("[\n]", "||").replaceAll("\"", "'").trim()) + "\",");
//				
//				strJson1.append("\"supervisor\" : \"" + item.getUsuarioCreador() + "\"");
				strJson1.append("},");
			}
			strJson2.append(listBeanInformix.size() > 0 ? strJson1.substring(0, strJson1.length() - 1) + "]}" : strJson1.toString()+ "]}" );
			
//			HttpSession objSessionLogin = req.getSession(true);
//			objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");
//			
//			AppUtils.convertAuditoria(req, "LISTA DETALLE INCIDENTE POR ID", "OK", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", "iIdDetalleAlerta : " + iIdDetalleAlerta, ssf);
		}
		catch(Exception ex){
			System.out.println(ex.toString());
			strJson1 = new StringBuilder();
			strJson1.append("error");
			System.out.println(ex.getMessage());
//			AppUtils.convertAuditoria(req, "LISTA DETALLE INCIDENTE POR ID", "FAIL", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "ALERTAS EJECUTIVAS", ex.toString(), ssf);
		}
		out.print(strJson2);
	}
	
}
