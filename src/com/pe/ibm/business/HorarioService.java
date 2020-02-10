package com.pe.ibm.business;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.Horario;
import com.pe.ibm.dao.HorarioDAO;
import com.pe.ibm.dao.HorarioDAOImpl;

public class HorarioService {
	
	public Horario consultarHorario(String idproyecto, SqlSessionFactory ssf){
		Horario bean=new Horario();
		HorarioDAO dao=new HorarioDAOImpl();
		SqlSession session = null;
		
		try {
			session = ssf.openSession(true);
			if(dao.consultarHorario(idproyecto,session)!=null){
				bean=dao.consultarHorario(idproyecto,session);	
			}	
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
				session.close();
		}
		
		
		return bean;
	}
	

}
