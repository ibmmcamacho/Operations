package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanTeam;
import com.pe.ibm.interfac.DaoTeam;

public class DaoTeamImpl implements DaoTeam {

	@Override
	public List<BeanTeam> obtenerTeam(SqlSession session) {
		List<BeanTeam> lstTeam = null;
		try{
				lstTeam =session.selectList("team.getTeam");
		}catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstTeam;
	}

	@Override
	public List<BeanTeam> obtenerTeamUsuario(BeanParameters pBeanParameters, SqlSession session) {
		List<BeanTeam> lstTeamUsuario = null;
		try{
				lstTeamUsuario =session.selectList("team.getTeamUsuario",pBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstTeamUsuario;
	}

	@Override
	public List<BeanTeam> obtenerTeamUsuarioPetro(BeanParameters pBeanParameters, SqlSession session) {
		List<BeanTeam> lstTeamUsuario = null;
		try{
				lstTeamUsuario =session.selectList("team.getTeamPetro",pBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstTeamUsuario;
	}
}
