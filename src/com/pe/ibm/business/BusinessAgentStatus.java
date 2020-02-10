package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanAgentStatus;
import com.pe.ibm.bean.BeanUnidadesLogicas;
import com.pe.ibm.dao.DaoAgentStatusImpl;
import com.pe.ibm.dao.DaoUnidadesLogicasImpl;
import com.pe.ibm.interfac.DaoAgentStatus;
import com.pe.ibm.interfac.DaoUnidadesLogicas;

public class BusinessAgentStatus {
	
	public List<BeanAgentStatus> listar(BeanAgentStatus bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoAgentStatus dao = new DaoAgentStatusImpl();
		List<BeanAgentStatus> lista = new ArrayList<BeanAgentStatus>();
			try {
				lista = dao.listar(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;		
	}
	
	public int insertar_auditoria(BeanAgentStatus bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoAgentStatus dao = new DaoAgentStatusImpl();
		int resultado = 0;
			try {
				resultado = dao.insertAudit(bean, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
				
		return resultado;
		
	}
}
