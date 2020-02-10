package com.pe.ibm.dao;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.Feriado;


public interface FeriadoDAO {
	
	public boolean buscarFeriado(Timestamp fecha, SqlSession session);
	public List<Feriado> listaFeriados(SqlSession session);
}
