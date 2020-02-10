package com.pe.ibm.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.Feriado;

public class FeriadoDAOImpl implements FeriadoDAO{

	@Override
	public boolean buscarFeriado(Timestamp fecha, SqlSession session) {
		// TODO Auto-generated method stub
		boolean flag=false;
		String cadenaMapperMybatis="com.pe.ibm.access.MapperFeriado.consultaFeriado";
		String instancia = "servicedesk";
		Feriado busqueda=new Feriado();
		Feriado resultado=new Feriado();
		try{
		busqueda.setFecha(fecha);

		if(session!=null){

			resultado = (Feriado) session.selectOne(cadenaMapperMybatis,busqueda);	
			
			if(resultado!=null){
			flag=true;	
			}

		}else{
			System.err.println("No hay conexi�n");
		}
		}catch(Exception e){
			System.err.println(e.getMessage());	
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<Feriado> listaFeriados(SqlSession session) {
		// TODO Auto-generated method stub
		String cadenaMapperMybatis="com.pe.ibm.access.MapperFeriado.consultaTodosFeriado";
		List<Feriado> listaresultado=new ArrayList<Feriado>();
		try{
		if(session!=null){
			listaresultado =  session.selectList(cadenaMapperMybatis);	
		}else{
			System.err.println("No hay conexi�n");
		}
		}catch(Exception e){
			System.err.println(e.getMessage());	
			e.printStackTrace();
		}
		return listaresultado;
	}
}
