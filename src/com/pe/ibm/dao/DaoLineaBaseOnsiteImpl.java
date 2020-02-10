package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.BeanResultadoMensualNivelServicio;
import com.pe.ibm.bean.LineaBaseOnsiteDistribucion;



public class DaoLineaBaseOnsiteImpl implements DaoLineaBaseOnsite{


	@Override
	public List<LineaBaseOnsiteDistribucion> obtenerDistribucionLineaBaseOnsite(String idsla,String mes, String anio, SqlSession session) {
		// TODO Auto-generated method stub

		List<LineaBaseOnsiteDistribucion> listaResultado = new ArrayList<LineaBaseOnsiteDistribucion>();
		BeanResultadoMensualNivelServicio busquedaTickets=new BeanResultadoMensualNivelServicio();
		busquedaTickets.setId_sla(idsla);
		busquedaTickets.setMes(mes);
		busquedaTickets.setAnio(anio);
		System.out.println(busquedaTickets.toString());
		try {
			listaResultado= session.selectList("com.pe.ibm.access.MapperLineaBase.buscarResultadoLineaBaseOnsiteDistribucion",busquedaTickets);
			System.out.println("listaResultado "+ listaResultado.size());
		} catch (Exception e) {
			System.out.println(e.getCause().getMessage().toString());
			e.printStackTrace();
		}

		return listaResultado;
	}

}
