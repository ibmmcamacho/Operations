package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanBlackout;
import com.pe.ibm.interfac.DaoBlackout;

public class DaoBlackoutImpl implements DaoBlackout{


	
	@Override
	public List<BeanBlackout> listar(BeanBlackout bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanBlackout> lista = new ArrayList<BeanBlackout>();
		
			try {
				if(sqlSession!=null){				
					lista = sqlSession.selectList("com.pe.ibm.access.MapperBlackout.listblackout", bean );
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
