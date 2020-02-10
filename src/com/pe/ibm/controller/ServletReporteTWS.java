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

import com.pe.ibm.bean.BeanReporteTWS;
import com.pe.ibm.business.BusinessReporteTWS;

/**
 * Servlet implementation class ServletReporteTWS
 */
@WebServlet("/ServletReporteTWS")
public class ServletReporteTWS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletReporteTWS() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			/* Obtener sqlsessionF*/
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
			
			String operation = request.getParameter("strOperation");
			String strMalla = request.getParameter("strMalla");
			if(operation.equals("getMonitorTWS"))
				getMonitorTWS(request, response, ssf, strMalla);
		}
		catch(Exception ex){
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
	
	private void getMonitorTWS(HttpServletRequest req, HttpServletResponse res, SqlSessionFactory ssf, String pstrMalla) throws IOException
	{
		
		StringBuilder strJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		strJson1.append("{\"reporte\": [");
		try
		{
		
		List<BeanReporteTWS> lstBeanReportsTWS;
		BusinessReporteTWS objBusinessReportsTWS = new BusinessReporteTWS();
		
		lstBeanReportsTWS = objBusinessReportsTWS.getMonitorTWS(ssf, pstrMalla);
		
			if(lstBeanReportsTWS.size() > 0)
			{
				for(BeanReporteTWS item : lstBeanReportsTWS)
				{
					strJson1.append("{\"malla\" : \"" + item.getStrMalla() + "\",");
					strJson1.append("\"job\" : \"" + item.getStrJob() + "\",");
					strJson1.append("\"fechaProgramada\" : \"" + item.getStrFechaProgramada() + "\",");
					strJson1.append("\"horaProgramada\" : \"" + item.getStrHoraProgramada() + "\",");
					strJson1.append("\"fechaEjecutada\" : \"" + item.getStrFechaEjecutada() + "\",");
					strJson1.append("\"horaEjecutada\" : \"" + item.getStrHoraEjecutada() + "\",");
					strJson1.append("\"resultado\" : \"" + item.getStrResultado() + "\",");
					strJson1.append("\"duracion\" : \"" + item.getStrDuracion() + "\",");
					strJson1.append("\"duracionEjecutada\" : \"" + item.getStrDuracionEjecutada() + "\",");
					strJson1.append("\"tentativo\" : \"" + item.getStrTendencia() + "\"");
					strJson1.append("},");
				}
			}
			else
			{
//				strJson1.append("{\"reporte\" : \"null\"},");
				strJson1.append(",");
			}
		}
		catch(Exception e)
		{
			strJson1.append(",");
		}
		strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
		out.print(strJson2);
	}
}
