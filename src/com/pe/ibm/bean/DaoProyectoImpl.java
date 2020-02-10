package com.pe.ibm.bean;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanProyecto;
import com.pe.ibm.util.MyBatisUtil;

public class DaoProyectoImpl implements DaoProyecto{

	@Override
	public List<BeanProyecto> obtenerProyectos(String strUsuario, SqlSession session) {
		
		List<BeanProyecto> listResultados=null;
		BeanProyecto bproyecto=new BeanProyecto();
		bproyecto.setUsuario(strUsuario);
		
		if(session!=null){
			try{
			listResultados=session.selectList("com.pe.ibm.access.MapperProyecto.getAllProject", bproyecto);
			
			}catch(Exception e){
				e.printStackTrace();
			}
			finally{
				session.close();
			}
			
		}else{
			System.out.println("no hay conexión");
		}
		
		return listResultados;
	}

	@Override
	public List<BeanProyecto> obtenerProyectosTodos(SqlSession session) {
		
		List<BeanProyecto> listResultados=null;
		
		if(session!=null){
			try{
			listResultados=session.selectList("com.pe.ibm.access.MapperProyecto.getProyectos");
			
			}catch(Exception e){
				e.printStackTrace();
			}
			finally{
				session.close();
			}
			
		}else{
			System.out.println("no hay conexión");
		}
		
		return listResultados;
	}
	@Override
	public int actualizarEstadoProyecto(BeanProyecto bean, SqlSession session) throws SQLException {
		// TODO Auto-generated method stub
		
		int var1, var2, var3, varfinal = 0;
		
		if(session!=null){
			try{
			
			var1 = session.update("com.pe.ibm.access.MapperProyecto.actualizaEstadoProyecto",bean);	
			var2 = session.update("com.pe.ibm.access.MapperProyecto.actualizaEstadoSLA_CLIENTE",bean);	
			var3 = session.update("com.pe.ibm.access.MapperProyecto.actualizaEstadoSLA_HISTORICO",bean);	
			
			if(var1 > 0) {
				varfinal = 1;	
			}
			session.commit();
			
			}catch(Exception e){
				e.printStackTrace();
			}
			finally{
				session.close();
			}
			
		}else{
			System.out.println("no hay conexión");
		}
		
		return varfinal;	
	}
	
	

}
