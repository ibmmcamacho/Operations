package com.pe.ibm.bean;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanProyecto;

public interface DaoProyecto {
	
	public List<BeanProyecto> obtenerProyectos(String idusuario, SqlSession session);
	
	public List<BeanProyecto> obtenerProyectosTodos(SqlSession session);
	
	public int actualizarEstadoProyecto(BeanProyecto bean, SqlSession session) throws SQLException;

}
