package com.pe.ibm.business;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.Feriado;
import com.pe.ibm.dao.FeriadoDAO;
import com.pe.ibm.dao.FeriadoDAOImpl;

public class FeriadoService {
	
	public boolean validaFeriado(Timestamp fecha, SqlSessionFactory ssf){
		SqlSession session = null;
		
		FeriadoDAO feriado=new FeriadoDAOImpl();
		
		boolean estado=false;
		try {
			session = ssf.openSession(true);
			estado = feriado.buscarFeriado(fecha,session);
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
				session.close();
		}
		return estado;
	}

	public List<Feriado> listaFeriados(SqlSessionFactory ssf){
		SqlSession session = null;
		FeriadoDAO feriado=new FeriadoDAOImpl();
		List<Feriado> listaFeriados = new ArrayList<Feriado>();
		try {
			session = ssf.openSession(true);
			listaFeriados = feriado.listaFeriados(session);
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
				session.close();
		}
		return listaFeriados;
	}
	
}
