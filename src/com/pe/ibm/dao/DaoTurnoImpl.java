package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.BeanTurno;
import com.pe.ibm.interfac.DaoTurno;

public class DaoTurnoImpl implements DaoTurno{

	@Override
	public int insertUdpate(BeanTurno beanTurno, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		int resultado = 0;
		BeanTurno bean = new BeanTurno();
		bean = beanTurno;
			try {
				if(sqlSession!=null){
					sqlSession.selectOne("com.pe.ibm.access.MapperTurno.Insert_Update",bean);
					resultado =  bean.getResultado();	
				}else{
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				//sqlSession.rollback(); comentado por BG001
			}	
		return resultado;
	}

	@Override
	public List<BeanTurno> listar(SqlSession sqlSession) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unused")
		BeanTurno bean = new BeanTurno();
		List<BeanTurno> lista = new ArrayList<BeanTurno>();
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTurno.listar");
				}else{
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
//				sqlSession.rollback(); comentado por BG001
			}
		
		return lista;
	}

	@Override
	public List<BeanTurno> listarTurnos(BeanTurno bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanTurno> lista = new ArrayList<BeanTurno>();
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTurno.listTurnosByTeam", bean);
				}else{
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		
		return lista;
	}

	@Override
	public int saveTurno(BeanTurno bean, SqlSession sqlSession) {
		int icount = 0;
		try {
			icount = sqlSession.insert("com.pe.ibm.access.MapperTurno.saveTurno", bean);
			sqlSession.commit();
		} catch (Exception e) {
			icount = 0;
			System.out.println(e.getCause().getMessage());
		}
		return icount;
	}

	@Override
	public int updateTurno(BeanTurno bean, SqlSession sqlSession) {
		int icount = 0;
		try {
			icount = sqlSession.update("com.pe.ibm.access.MapperTurno.updateTurno", bean);
			sqlSession.commit();
		} catch (Exception e) {
			icount = 0;
			System.out.println(e.getCause().getMessage());
		}
		return icount;
	}

	@Override
	public int updateTurnoEstado(BeanTurno bean, SqlSession sqlSession) {
		int icount = 0;
		try {
			icount = sqlSession.update("com.pe.ibm.access.MapperTurno.updateTurnoEstado", bean);
			sqlSession.commit();
		} catch (Exception e) {
			icount = 0;
			System.out.println(e.getCause().getMessage());
		}
		return icount;
	}
	
	

}
