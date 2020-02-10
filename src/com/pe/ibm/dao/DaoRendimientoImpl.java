package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.BeanRendimiento;
import com.pe.ibm.bean.BeanRendimientoDashboard;
import com.pe.ibm.interfac.DaoRendimiento;
public class DaoRendimientoImpl implements DaoRendimiento{


	
	@Override
	public List<BeanRendimiento> listar(BeanRendimiento bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanRendimiento> lista = new ArrayList<BeanRendimiento>();
		
			try {
				if(sqlSession!=null){
					System.out.println("DAO:"+ bean.getIdRendimiento());
					lista = sqlSession.selectList("com.pe.ibm.access.MapperRendimiento.listar", bean );
				}else{
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	@Override
	public List<BeanRendimientoDashboard> listar_reporte(BeanRendimientoDashboard beanDashboard, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanRendimientoDashboard> lista = new ArrayList<BeanRendimientoDashboard>();
		
			try {
				if(sqlSession!=null){
					System.out.println("DAO:"+ beanDashboard.getDesde());
					lista = sqlSession.selectList("com.pe.ibm.access.MapperRendimiento.listar_reporte", beanDashboard );
				}else{
					System.err.println("no hay conexión");
				}				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
}
