package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.BeanNivelServicio;
import com.pe.ibm.bean.BeanResultadoMensualNivelServicio;
import com.pe.ibm.bean.BeanSLATiempoOnsiteResultado;

public interface  DaoNivelServicio {

	
	public List<BeanNivelServicio> obtenerNSProyecto(String proyecto, SqlSession session); 

	public BeanResultadoMensualNivelServicio obtenerResultadoMensual(String id_sla, String mes, String dia, SqlSession session);
	
	public List<BeanResultadoMensualNivelServicio> listarResultadoMensual(String id_proyecto, String pMes, String pAnio, SqlSession session);
	
	
	public List<BeanResultadoMensualNivelServicio> obtenerNSHistoricoProyecto(int opcionMapper, String id_proyecto, String fechaInicio,SqlSession session); 

	public BeanSLATiempoOnsiteResultado obtenerTiempoOnsiteResultado(String id_sla, String pMes, String pAnio,SqlSession session);
	
	public List<BeanSLATiempoOnsiteResultado> obtenerListaTiempoOnsiteResultado(String id_proyecto, String fechaInicio, SqlSession session);
	
}
