package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanAgentStatus;
import com.pe.ibm.bean.BeanUnidadesLogicas;


public interface DaoAgentStatus {

	public List<BeanAgentStatus> listar(BeanAgentStatus bean, SqlSession sqlSession);
	public int insertAudit(BeanAgentStatus bean, SqlSession sqlSession);
}
