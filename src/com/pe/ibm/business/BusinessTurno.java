package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.pe.ibm.bean.BeanTurno;
import com.pe.ibm.dao.DaoTurnoImpl;
import com.pe.ibm.interfac.DaoTurno;


public class BusinessTurno {
	
	public List<BeanTurno> listar(SqlSessionFactory ssf){

		SqlSession sqlSession = ssf.openSession();
		
		DaoTurno dao = new DaoTurnoImpl();
		List<BeanTurno> lista = new ArrayList<BeanTurno>();
			try {
				lista = dao.listar(sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public int insertar_actualizar(BeanTurno beanTurno, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoTurno dao = new DaoTurnoImpl();
		int resultado = 0;
			try {
				resultado = dao.insertUdpate(beanTurno, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
				
		return resultado;
	}
	
	//Begin of BG001
	public List<BeanTurno> listarTurnos(BeanTurno bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		DaoTurno dao = new DaoTurnoImpl();
		List<BeanTurno> lista = new ArrayList<BeanTurno>();
			try {
				lista = dao.listarTurnos(bean, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		return lista;
	}
	
	public int saveTurno(BeanTurno bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		DaoTurno dao = new DaoTurnoImpl();
		int icount = 0;
			try {
				icount = dao.saveTurno(bean, sqlSession);
			}catch(Exception e) {
				icount = 0;
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		return icount;
	}
	
	public int updateTurno(BeanTurno bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		DaoTurno dao = new DaoTurnoImpl();
		int icount = 0;
			try {
				icount = dao.updateTurno(bean, sqlSession);
			}catch(Exception e) {
				icount = 0;
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		return icount;
	}
	
	public int updateTurnoEstado(BeanTurno bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		DaoTurno dao = new DaoTurnoImpl();
		int icount = 0;
			try {
				icount = dao.updateTurnoEstado(bean, sqlSession);
			}catch(Exception e) {
				icount = 0;
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		return icount;
	}
	//End of BG001


}
