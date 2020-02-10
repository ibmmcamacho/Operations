package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.BeanActividad;
import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.interfac.DaoActividad;

public class DaoActividadImpl implements DaoActividad{

	@Override
	public int insertUdpate(BeanActividad beanActividad, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		int resultado = 0;
		BeanActividad bean = new BeanActividad();
		bean = beanActividad;
			try {
				if(sqlSession!=null){
					
					sqlSession.selectOne("com.pe.ibm.access.MapperActividad.Insert_Update",bean);
					resultado =  bean.getResultado();	
				}else{
					System.err.println("no hay conexi�n");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}	
		return resultado;
	}

	@Override
	public List<BeanActividad> listar(BeanEmpleado beanEmpleado,SqlSession sqlSession) {
		// TODO Auto-generated method stub

		List<BeanActividad> lista = new ArrayList<BeanActividad>();
		
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperActividad.listar",beanEmpleado);
				}else{
					System.err.println("no hay conexi�n");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	@Override
	public BeanActividad listarPorID(BeanActividad bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub

		BeanActividad beanResultado = new BeanActividad();
		
			try {
				if(sqlSession!=null){
					beanResultado = (BeanActividad) sqlSession.selectOne("com.pe.ibm.access.MapperActividad.listarPorID", bean);
				}else{
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return beanResultado;
	}
	
	@Override
	public List<BeanActividad> listarHistorial(BeanActividad bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanActividad> lista = new ArrayList<BeanActividad>();
		
			try {
				if(sqlSession!=null){
					System.out.println("DAO:"+ bean.getIdActividad());
					lista = sqlSession.selectList("com.pe.ibm.access.MapperActividad.listarHistorial", bean );
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
