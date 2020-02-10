package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanNotificacion;
import com.pe.ibm.bean.BeanTimeLine;

public interface DaoNotificacion {

	public List<BeanNotificacion> getBuscarNotificaciones(int pIdEmpleado, SqlSession session);
	public List<BeanNotificacion> getBuscarNotificacionesNuevas(int pIdEmpleado, SqlSession session);
	public List<BeanTimeLine> getListarTimeLine(SqlSession session);
	public int getActualizarNotificaciones(int pIdEmpleado, SqlSession session);
	public int getActualizarEnvio(int pIdEmpleado, SqlSession session);
	
}
