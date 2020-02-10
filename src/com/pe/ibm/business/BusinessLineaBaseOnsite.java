package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.dao.DaoDistribucionTickets;
import com.pe.ibm.dao.DaoDistribucionTicketsImpl;
import com.pe.ibm.dao.DaoLineaBaseOnsite;
import com.pe.ibm.dao.DaoLineaBaseOnsiteImpl;
import com.pe.ibm.bean.BeanDistribucionTickets;
import com.pe.ibm.bean.LineaBaseOnsiteDistribucion;



public class BusinessLineaBaseOnsite {
	

	public List<LineaBaseOnsiteDistribucion> obtenerDistribucionLineaBaseOnsite (String id_sla,String mes, String anio, SqlSessionFactory ssf)
	{
		SqlSession session = null;
		List<LineaBaseOnsiteDistribucion> listaTickets= new ArrayList<LineaBaseOnsiteDistribucion>();
		DaoLineaBaseOnsite daoTickets=new DaoLineaBaseOnsiteImpl();
		
		try {
			session = ssf.openSession(true);
			listaTickets = daoTickets.obtenerDistribucionLineaBaseOnsite(id_sla, mes, anio, session);
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally{
			session.close();
		}
		
		return listaTickets;
	}

}
