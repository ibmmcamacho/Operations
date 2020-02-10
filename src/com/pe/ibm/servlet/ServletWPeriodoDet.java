package com.pe.ibm.servlet;

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
import com.pe.ibm.bean.BeanPerfil;
import com.pe.ibm.bean.BeanPerfilDet;
import com.pe.ibm.bean.BeanPeriodo;
import com.pe.ibm.bean.BeanPeriodoDet;
import com.pe.ibm.business.BusinessOptions;
import com.pe.ibm.business.BusinessPerfil;
import com.pe.ibm.business.BusinessPerfilDet;
import com.pe.ibm.business.BusinessPeriodo;
import com.pe.ibm.business.BusinessPeriodoDet;

/**
 * Servlet implementation class ServletWPeriodoDet
 */
@WebServlet("/ServletWPeriodoDet")
public class ServletWPeriodoDet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletWPeriodoDet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
				
						
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

	


}
