package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.BeanResultadoMensualNivelServicio;
import com.pe.ibm.bean.BeanSLATiempoOnsiteResultado;
import com.pe.ibm.bean.BeanBusqueda;
import com.pe.ibm.bean.BeanNivelServicio;
import com.pe.ibm.bean.BeanProyecto;

public class DaoNivelServicioImpl implements DaoNivelServicio {

	@Override
	public List <BeanNivelServicio> obtenerNSProyecto(String proyecto, SqlSession session) {

		List<BeanNivelServicio> ListResultadoNS=null;
		BeanProyecto busquedaNS=new BeanProyecto();
		busquedaNS.setNombreProyecto(proyecto);
		
		try {
			ListResultadoNS= session.selectList("com.pe.ibm.access.MapperNivelServicio.getAllNSByProject",busquedaNS);
		} catch (Exception e) {
			System.out.println(e.getCause().getMessage().toString());
			e.printStackTrace();
		}
		
		return ListResultadoNS;
	}

	@Override
	public BeanResultadoMensualNivelServicio obtenerResultadoMensual(String id_sla, String mes, String anio, SqlSession session) {
		// TODO Auto-generated method stub
		
		BeanResultadoMensualNivelServicio ResultadoNS=new BeanResultadoMensualNivelServicio();
		ResultadoNS.setId_sla(id_sla);
		ResultadoNS.setMes(mes);
		ResultadoNS.setAnio(anio);
		
		try {
			ResultadoNS = (BeanResultadoMensualNivelServicio) session.selectOne("com.pe.ibm.access.MapperNivelServicio.getResultNSByProject",ResultadoNS);
		} catch (Exception e) {
			System.out.println(e.getCause().getMessage().toString());
			e.printStackTrace();
		}
		
		return ResultadoNS;
	}

	@Override
	public List<BeanResultadoMensualNivelServicio> obtenerNSHistoricoProyecto(int opcionMapper, String id_proyecto, String fechaInicio, SqlSession session) {
		
		List<BeanResultadoMensualNivelServicio> ListResultadoHistoricoNS=null;
		BeanBusqueda busquedaNS=new BeanBusqueda();
		busquedaNS.setIdproyecto(id_proyecto);
		busquedaNS.setFechaInicio(fechaInicio);
		String mapper = "";
		switch(opcionMapper) {
		case 1: //Resultado historico por SLA
			mapper = "com.pe.ibm.access.MapperNivelServicio.getListResultHistoricalNSByIdSla";
			break;
		case 2: //Resultado historico Linea Base Soporte Onsite
			mapper = "com.pe.ibm.access.MapperNivelServicio.getListResultHistoricalLineaBaseOnSite";
			break;
		case 3: //Resultado historico Nivel Servicio Soporte Onsite
			mapper = "com.pe.ibm.access.MapperNivelServicio.getListResultHistoricalNSOnSite";
			break;
		}
		
		try {
			ListResultadoHistoricoNS= session.selectList(mapper,busquedaNS);
		} catch (Exception e) {
			System.out.println(e.getCause().getMessage().toString());
			e.printStackTrace();
		}
		
		return ListResultadoHistoricoNS;
	}

	@Override
	public List<BeanResultadoMensualNivelServicio> listarResultadoMensual(String id_proyecto, String pMes, String pAnio, SqlSession session) {
		
		List<BeanResultadoMensualNivelServicio> ListResultadoNS=null;
		BeanResultadoMensualNivelServicio busqueda=new BeanResultadoMensualNivelServicio();
		busqueda.setNombre_proyecto(id_proyecto);
		busqueda.setMes(pMes);
		busqueda.setAnio(pAnio);
		
		try {
			ListResultadoNS = session.selectList("com.pe.ibm.access.MapperNivelServicio.getListResultNSByProject",busqueda);
		} catch (Exception e) {
			System.out.println(e.getCause().getMessage().toString());
			e.printStackTrace();
		}
		
		return ListResultadoNS;

	}
	
	@Override
	public BeanSLATiempoOnsiteResultado obtenerTiempoOnsiteResultado (String id_sla, String pMes, String pAnio, SqlSession session) {
		// TODO Auto-generated method stub
		BeanResultadoMensualNivelServicio busquedaNS=new BeanResultadoMensualNivelServicio();
		busquedaNS.setId_sla(id_sla);
		busquedaNS.setMes(pMes);
		busquedaNS.setAnio(pAnio);
		BeanSLATiempoOnsiteResultado resultado = new BeanSLATiempoOnsiteResultado();

		try {
			resultado = (BeanSLATiempoOnsiteResultado) session.selectOne("com.pe.ibm.access.MapperNivelServicio.obtenerDetalleNivelServicioOnsite",busquedaNS);
		} catch (Exception e) {
			System.out.println(e.getCause().getMessage().toString());
			e.printStackTrace();
		}
		
		return resultado;
	}

	@Override
	public List<BeanSLATiempoOnsiteResultado> obtenerListaTiempoOnsiteResultado(String id_proyecto, String fechaInicio, SqlSession session) {
		// TODO Auto-generated method stub
		BeanBusqueda busquedaNS=new BeanBusqueda();
		busquedaNS.setIdproyecto(id_proyecto);
		busquedaNS.setFechaInicio(fechaInicio);
		List<BeanSLATiempoOnsiteResultado> listresultado = new ArrayList<BeanSLATiempoOnsiteResultado>();

		try {
			listresultado = session.selectList("com.pe.ibm.access.MapperNivelServicio.obtenerListaDetalleNivelServicioOnsite",busquedaNS);
		} catch (Exception e) {
			System.out.println(e.getCause().getMessage().toString());
			e.printStackTrace();
		}
		
		return listresultado;
	}
	
	
	
}
