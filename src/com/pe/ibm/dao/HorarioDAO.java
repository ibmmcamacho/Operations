package com.pe.ibm.dao;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.Horario;

public interface HorarioDAO {
	
	public Horario consultarHorario(String idproyecto, SqlSession session);

}
