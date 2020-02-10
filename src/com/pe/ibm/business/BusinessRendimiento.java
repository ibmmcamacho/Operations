package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanRendimiento;
import com.pe.ibm.bean.BeanRendimientoDashboard;

import com.pe.ibm.dao.DaoRendimientoImpl;
import com.pe.ibm.interfac.DaoRendimiento;

public class BusinessRendimiento {
	
	public List<BeanRendimiento> listar(BeanRendimiento bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoRendimiento dao = new DaoRendimientoImpl();
		List<BeanRendimiento> lista = new ArrayList<BeanRendimiento>();
			try {
				lista = dao.listar(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	public List<BeanRendimientoDashboard> listar_reporte(BeanRendimientoDashboard beanDashboard, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoRendimiento dao = new DaoRendimientoImpl();
		List<BeanRendimientoDashboard> lista = new ArrayList<BeanRendimientoDashboard>();
			try {
				lista = dao.listar_reporte(beanDashboard, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
}
