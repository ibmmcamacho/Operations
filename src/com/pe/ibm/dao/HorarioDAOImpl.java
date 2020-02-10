package com.pe.ibm.dao;

import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.BusquedaTicket;
import com.pe.ibm.bean.Horario;

public class HorarioDAOImpl implements HorarioDAO {

	@Override
	public Horario consultarHorario(String idproyecto, SqlSession session) {
		// TODO Auto-generated method stub
		String cadenaMapperMybatis="horario.consultaHorario";
		String instancia="servicedesk";
		BusquedaTicket busqueda=new BusquedaTicket();
		Horario bean=new Horario();
		try{
		busqueda.setIdproyecto(idproyecto);
		if(session!=null){
			 
			if(session.selectOne(cadenaMapperMybatis,busqueda)!=null){
			bean = (Horario) session.selectOne(cadenaMapperMybatis,busqueda);		
			}
			
		}else{
			System.err.println("No hay conexi�n");
		}
		}catch(Exception e){
			System.err.println(e.getMessage());	
			e.printStackTrace();
		}
		
		
		return bean;
	}

}
