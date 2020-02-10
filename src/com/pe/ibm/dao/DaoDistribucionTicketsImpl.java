package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanBusqueda;
import com.pe.ibm.bean.BeanDistribucionTickets;



public class DaoDistribucionTicketsImpl implements DaoDistribucionTickets{

	@Override
	public BeanDistribucionTickets obtenerPorProyecto(String proyecto, String mes, String anio, SqlSession session) {

		BeanDistribucionTickets Resultado=new BeanDistribucionTickets();
		Resultado.setNombre(proyecto);
		Resultado.setMes(mes);
		Resultado.setAnio(anio);
		
		try {
			Resultado= (BeanDistribucionTickets)session.selectOne("com.pe.ibm.access.MapperDistribucionTickets.getTicketsByProject",Resultado);
		} catch (Exception e) {
			System.out.println(e.getCause().getMessage().toString());
			e.printStackTrace();
		}
		
		return Resultado;
	}

	@Override
	public List<BeanDistribucionTickets> obtenerHistoricoPorProyecto(String proyecto, String fechaInicio, String fechaFin, SqlSession session) {
		// TODO Auto-generated method stub

		List<BeanDistribucionTickets> ListResultadoHistoricoTickets=null;
		BeanBusqueda busquedaTickets=new BeanBusqueda();
		busquedaTickets.setNombre(proyecto);
		busquedaTickets.setFechaInicio(fechaInicio);
		busquedaTickets.setFechaFin(fechaFin);
		
		try {
			ListResultadoHistoricoTickets= session.selectList("com.pe.ibm.access.MapperDistribucionTickets.consultarDistribucionTicketsHistorico",busquedaTickets);
		} catch (Exception e) {
			System.out.println(e.getCause().getMessage().toString());
			e.printStackTrace();
		}

		return ListResultadoHistoricoTickets;
	}
	
	@Override
	public List<BeanDistribucionTickets> getLineaBaseSDDHistorico(String idproyecto, String fechaInicio, SqlSession session) {
		// TODO Auto-generated method stub

		List<BeanDistribucionTickets> ListResultadoHistoricoTickets=null;
		BeanBusqueda busquedaTickets=new BeanBusqueda();
		busquedaTickets.setIdproyecto(idproyecto);
		busquedaTickets.setFechaInicio(fechaInicio);
		
		try {
			ListResultadoHistoricoTickets= session.selectList("com.pe.ibm.access.MapperDistribucionTickets.getLineaBaseSDDHistorico",busquedaTickets);
		} catch (Exception e) {
			System.out.println(e.getCause().getMessage().toString());
			e.printStackTrace();
		}

		return ListResultadoHistoricoTickets;
	}

}
