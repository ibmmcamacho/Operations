package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanTeam;

public interface DaoTeam {
	
	public List<BeanTeam> obtenerTeam(SqlSession session);
	public List<BeanTeam> obtenerTeamUsuario(BeanParameters pBeanParameters,SqlSession session);
	public List<BeanTeam> obtenerTeamUsuarioPetro(BeanParameters pBeanParameters,SqlSession session);
	
}
