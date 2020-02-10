package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanNotificacion;
import com.pe.ibm.bean.BeanTimeLine;
import com.pe.ibm.dao.DaoNotificacionImpl;

public class BusinessNotificacion {

	public List<BeanNotificacion> getBuscarNotificaciones(int pIdEmpleado, SqlSessionFactory ssf) {
		List<BeanNotificacion> lstBeanNotificacion = null;
		SqlSession session = null;
		try{
			session = ssf.openSession(true);
			DaoNotificacionImpl objDaoNotificacion = new DaoNotificacionImpl();
			lstBeanNotificacion = objDaoNotificacion.getBuscarNotificaciones(pIdEmpleado, session);
		}
		catch(Exception ex){
			lstBeanNotificacion = null;
			System.out.println(ex.getCause().getMessage());
		}finally {
			session.close();
		}
		return lstBeanNotificacion;
	}

	public List<BeanNotificacion> getBuscarNotificacionesNuevas(int pIdEmpleado, SqlSessionFactory ssf) {
		List<BeanNotificacion> lstBeanNotificacion = null;
		SqlSession session = null;
		try{
			session = ssf.openSession(true);
			DaoNotificacionImpl objDaoNotificacion = new DaoNotificacionImpl();
			lstBeanNotificacion = objDaoNotificacion.getBuscarNotificacionesNuevas(pIdEmpleado, session);
		}
		catch(Exception ex){
			lstBeanNotificacion = null;
			System.out.println(ex.getCause().getMessage());
		}finally {
			session.close();
		}
		return lstBeanNotificacion;
	}

	public int getActualizarNotificaciones(int pIdEmpleado, SqlSessionFactory ssf) {
		int icount = 0;
		SqlSession session = null;
		try{
			session = ssf.openSession(true);
			DaoNotificacionImpl objDaoNotificacion = new DaoNotificacionImpl();
			icount = objDaoNotificacion.getActualizarNotificaciones(pIdEmpleado, session);						
		}
		catch(Exception ex){
			icount = 0;
			System.out.println(ex.getCause().getMessage());
		}finally {
			session.close();
		}
		return icount;
	}
	
	public int getActualizarEnvio(int pIdEmpleado, SqlSessionFactory ssf) {
		int icount = 0;
		SqlSession session = null;
		try{
			session = ssf.openSession(true);
			DaoNotificacionImpl objDaoNotificacion = new DaoNotificacionImpl();
			icount = objDaoNotificacion.getActualizarEnvio(pIdEmpleado, session);						
		}
		catch(Exception ex){
			icount = 0;
			System.out.println(ex.getCause().getMessage());
		}finally {
			session.close();
		}
		return icount;
	}
	
	public List<BeanTimeLine> getListarTimeLine(SqlSessionFactory ssf) {
		List<BeanTimeLine> lstBeanTimeLine = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoNotificacionImpl objDaoTimeLine = new DaoNotificacionImpl();
			lstBeanTimeLine = objDaoTimeLine.getListarTimeLine(session);
		} catch (Exception ex) {
			lstBeanTimeLine = null;
		}finally {
				session.close();
		}
		return lstBeanTimeLine;
	}
	
}
