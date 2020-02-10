package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanTablero;
import com.pe.ibm.dao.DaoTableroImpl;
import com.pe.ibm.interfac.DaoTablero;

public class BussinesTablero {

	public List<BeanTablero> cboSquad(BeanTablero bean, SqlSessionFactory ssf){		
		
		SqlSession sqlSession = ssf.openSession();			
		DaoTablero dao = new DaoTableroImpl();
		List<BeanTablero> lista = new ArrayList<BeanTablero>();
			try {
				lista = dao.cboSquad(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	
	public List<BeanTablero> cboTribu(BeanTablero bean, SqlSessionFactory ssf){		
		
		SqlSession sqlSession = ssf.openSession();			
		DaoTablero dao = new DaoTableroImpl();
		List<BeanTablero> lista = new ArrayList<BeanTablero>();
			try {
				lista = dao.cboTribu(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	
public List<BeanTablero> cboTeam(BeanTablero bean, SqlSessionFactory ssf){		
		
		SqlSession sqlSession = ssf.openSession();			
		DaoTablero dao = new DaoTableroImpl();
		List<BeanTablero> lista = new ArrayList<BeanTablero>();
			try {
				lista = dao.cboTeam(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}

public List<BeanTablero> cboGroupOwner(BeanTablero bean, SqlSessionFactory ssf){		
	
	SqlSession sqlSession = ssf.openSession();			
	DaoTablero dao = new DaoTableroImpl();
	List<BeanTablero> lista = new ArrayList<BeanTablero>();
		try {
			lista = dao.cboGroupOwner(bean, sqlSession);

		}catch(Exception e) {
			e.printStackTrace();	
		}finally{
			sqlSession.close();
		}
	
	return lista;
	
}


public List<BeanTablero> cboOwner(BeanTablero bean, SqlSessionFactory ssf){		
	
	SqlSession sqlSession = ssf.openSession();			
	DaoTablero dao = new DaoTableroImpl();
	List<BeanTablero> lista = new ArrayList<BeanTablero>();
		try {
			lista = dao.cboOwner(bean, sqlSession);

		}catch(Exception e) {
			e.printStackTrace();	
		}finally{
			sqlSession.close();
		}
	
	return lista;
	
}


public List<BeanTablero> cboClassTicket(BeanTablero bean, SqlSessionFactory ssf){		
	
	SqlSession sqlSession = ssf.openSession();			
	DaoTablero dao = new DaoTableroImpl();
	List<BeanTablero> lista = new ArrayList<BeanTablero>();
		try {
			lista = dao.cboClassTicket(bean, sqlSession);

		}catch(Exception e) {
			e.printStackTrace();	
		}finally{
			sqlSession.close();
		}
	
	return lista;
	
}


public List<BeanTablero> cboSelectStatus(BeanTablero bean, SqlSessionFactory ssf){		
	
	SqlSession sqlSession = ssf.openSession();			
	DaoTablero dao = new DaoTableroImpl();
	List<BeanTablero> lista = new ArrayList<BeanTablero>();
		try {
			lista = dao.cboSelectStatus(bean, sqlSession);

		}catch(Exception e) {
			e.printStackTrace();	
		}finally{
			sqlSession.close();
		}
	
	return lista;
	
}


	

public List<BeanTablero> listReportT3(BeanTablero bean, SqlSessionFactory ssf){		
	
	SqlSession sqlSession = ssf.openSession();			
	DaoTablero dao = new DaoTableroImpl();
	List<BeanTablero> lista = new ArrayList<BeanTablero>();
		try {
			lista = dao.listReportT3(bean, sqlSession);

		}catch(Exception e) {
			e.printStackTrace();	
		}finally{
			sqlSession.close();
		}
	
	return lista;
	
}


public List<BeanTablero> listReportT2(BeanTablero bean, SqlSessionFactory ssf){		
	
	SqlSession sqlSession = ssf.openSession();			
	DaoTablero dao = new DaoTableroImpl();
	List<BeanTablero> lista = new ArrayList<BeanTablero>();
		try {
			lista = dao.listReportT2(bean, sqlSession);

		}catch(Exception e) {
			e.printStackTrace();	
		}finally{
			sqlSession.close();
		}
	
	return lista;
	
}


public List<BeanTablero> listReportT1(BeanTablero bean, SqlSessionFactory ssf){		
	
	SqlSession sqlSession = ssf.openSession();			
	DaoTablero dao = new DaoTableroImpl();
	List<BeanTablero> lista = new ArrayList<BeanTablero>();
		try {
			lista = dao.listReportT1(bean, sqlSession);

		}catch(Exception e) {
			e.printStackTrace();	
		}finally{
			sqlSession.close();
		}
	
	return lista;
	
}
	
}
