package com.pe.ibm.dao;
import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.BeanUsuario;
import com.pe.ibm.interfac.DaoUsuario;


public class DaoUsuarioImpl implements DaoUsuario{

	
	@Override
	public List<BeanUsuario> listar(SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanUsuario> lista = new ArrayList<BeanUsuario>();
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperUsuario.listar");
					
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
