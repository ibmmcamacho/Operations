package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanAgentStatus;
import com.pe.ibm.bean.BeanUnidadesLogicas;
import com.pe.ibm.interfac.DaoAgentStatus;

public class DaoAgentStatusImpl implements DaoAgentStatus{


	
	@Override
	public List<BeanAgentStatus> listar(BeanAgentStatus bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanAgentStatus> lista = new ArrayList<BeanAgentStatus>();
		
			try {
				if(sqlSession!=null){				
					lista = sqlSession.selectList("com.pe.ibm.access.MapperAgentStatus.listagentstatus", bean );
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
	public int insertAudit(BeanAgentStatus bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		int resultado = 0;
		BeanAgentStatus bean2 = new BeanAgentStatus();
		bean2 = bean;
			try {
				if(sqlSession!=null){
					sqlSession.selectOne("com.pe.ibm.access.MapperAgentStatus.Insert_Audit",bean2);
					resultado =  bean.getResultado();	
				}else{
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}	
		return resultado;
	}

}
