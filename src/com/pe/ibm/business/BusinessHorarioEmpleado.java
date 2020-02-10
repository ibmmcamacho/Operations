package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanHorarioEmpleado;
import com.pe.ibm.dao.DaoHorarioEmpleadoImpl;
import com.pe.ibm.interfac.DaoHorarioEmpleado;

public class BusinessHorarioEmpleado {

	
	public List<BeanHorarioEmpleado> listHorarioEmpleado(BeanHorarioEmpleado pBeanHorarioEmpleado, SqlSessionFactory ssf){
		
		List<BeanHorarioEmpleado> lstBeanHorarioEmpleado = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoHorarioEmpleado objDaoHorarioImpl = new DaoHorarioEmpleadoImpl();
			lstBeanHorarioEmpleado = objDaoHorarioImpl.listHorarioEmpleado(pBeanHorarioEmpleado, session);
		} catch (Exception ex) {
			lstBeanHorarioEmpleado = null;
		}finally {
				session.close();
		}
		return lstBeanHorarioEmpleado;
		
	};
	
	public int saveHorario(BeanHorarioEmpleado pBeanHorarioEmpleado, SqlSessionFactory ssf) {
		
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoHorarioEmpleado objDaoHorarioEmpleadoImpl = new DaoHorarioEmpleadoImpl();
			icount = objDaoHorarioEmpleadoImpl.saveHorario(pBeanHorarioEmpleado, session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
		
	};
	
	public int updateHorario(BeanHorarioEmpleado pBeanHorarioEmpleado, SqlSessionFactory ssf) {
		
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoHorarioEmpleado objDaoHorarioEmpleadoImpl = new DaoHorarioEmpleadoImpl();
			icount = objDaoHorarioEmpleadoImpl.updateHorario(pBeanHorarioEmpleado, session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
		
	};
	
	public int deleteHorario(BeanHorarioEmpleado pBeanHorarioEmpleado, SqlSessionFactory ssf) {
		
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoHorarioEmpleado objDaoHorarioEmpleadoImpl = new DaoHorarioEmpleadoImpl();
			icount = objDaoHorarioEmpleadoImpl.deleteHorario(pBeanHorarioEmpleado, session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
		
	};
	
}
