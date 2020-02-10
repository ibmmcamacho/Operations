package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanTeam;
import com.pe.ibm.dao.DaoTeamImpl;
import com.pe.ibm.interfac.DaoTeam;

public class BusinessTeam {
	
	public List<BeanTeam> obtenerTeam(SqlSessionFactory ssf){
		List<BeanTeam> lstBeanTeam = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoTeam objDaoTeamImpl = new DaoTeamImpl();
			lstBeanTeam = objDaoTeamImpl.obtenerTeam(session);
		}catch(Exception ex){
			lstBeanTeam = null;
			System.out.println(ex.getCause().getMessage());
		}finally {
			session.close();
		}
		return lstBeanTeam;
	};
	
	public List<BeanTeam> obtenerTeamUsuario(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanTeam> lstBeanTeamUsuario = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoTeam objDaoTeamImpl = new DaoTeamImpl();
			lstBeanTeamUsuario = objDaoTeamImpl.obtenerTeamUsuario(pBeanParameters, session);
		}catch(Exception ex){
			lstBeanTeamUsuario = null;
			System.out.println(ex.getCause().getMessage());
		}finally {
			session.close();
		}
		return lstBeanTeamUsuario;
	};
	
	public List<BeanTeam> obtenerTeamUsuarioPetro(BeanParameters pBeanParameters, SqlSessionFactory ssf){
		List<BeanTeam> lstBeanTeamUsuario = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoTeam objDaoTeamImpl = new DaoTeamImpl();
			lstBeanTeamUsuario = objDaoTeamImpl.obtenerTeamUsuarioPetro(pBeanParameters, session);
		}catch(Exception ex){
			lstBeanTeamUsuario = null;
			System.out.println(ex.getCause().getMessage());
		}finally {
			session.close();
		}
		return lstBeanTeamUsuario;
	};
}
