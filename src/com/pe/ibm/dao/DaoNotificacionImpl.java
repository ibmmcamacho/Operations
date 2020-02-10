package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanNotificacion;
import com.pe.ibm.bean.BeanTimeLine;
import com.pe.ibm.interfac.DaoNotificacion;

public class DaoNotificacionImpl implements DaoNotificacion {

	@Override
	public List<BeanNotificacion> getBuscarNotificaciones(int pIdEmpleado, SqlSession session) {
		List<BeanNotificacion> lstBeanNotificacion = null;
		try{
			lstBeanNotificacion = session.selectList("notificacion.getBuscarNotificaciones",pIdEmpleado);
		}
		catch(Exception ex){
			lstBeanNotificacion = null;
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanNotificacion;
	}

	@Override
	public List<BeanNotificacion> getBuscarNotificacionesNuevas(int pIdEmpleado, SqlSession session) {
		List<BeanNotificacion> lstBeanNotificacion = null;
		try{
			lstBeanNotificacion = session.selectList("notificacion.getBuscarNotificacionesNuevas",pIdEmpleado);
		}
		catch(Exception ex){
			lstBeanNotificacion = null;
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanNotificacion;
	}

	@Override
	public int getActualizarNotificaciones(int pIdEmpleado, SqlSession session) {
		int icount = 0;
		try{
			icount = session.insert("notificacion.actualizarNotificaciones", pIdEmpleado);						
		}
		catch(Exception ex){
			icount = 0;
			System.out.println(ex.getCause().getMessage());
		}
		return icount;
	}

	@Override
	public int getActualizarEnvio(int pIdEmpleado, SqlSession session) {
		int icount = 0;
		try{
			icount = session.insert("notificacion.actualizarEnvio", pIdEmpleado);						
		}
		catch(Exception ex){
			icount = 0;
			System.out.println(ex.getCause().getMessage());
		}
		return icount;
	}

	@Override
	public List<BeanTimeLine> getListarTimeLine(SqlSession session) {
		List<BeanTimeLine> lstBeanTimeLine = null;
		try{
						lstBeanTimeLine = session.selectList("notificacion.getListarTimeLine");
			}
			catch(Exception ex){
				lstBeanTimeLine = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanTimeLine;
	}

}
