package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanDistribucionTickets;

public interface DaoDistribucionTickets {
	

	public BeanDistribucionTickets obtenerPorProyecto(String proyecto,String mes, String anio, SqlSession session);
	
	public List<BeanDistribucionTickets> obtenerHistoricoPorProyecto(String proyecto,String fechaInicio, String fechaFin, SqlSession session);
	
	
	public List<BeanDistribucionTickets> getLineaBaseSDDHistorico(String idproyecto,String fechaInicio, SqlSession session);
	
	
}
