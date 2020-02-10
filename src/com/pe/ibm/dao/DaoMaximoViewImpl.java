package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.interfac.DaoMaximoView;

public class DaoMaximoViewImpl implements DaoMaximoView {
//	R E T U R  N S
	@Override
	public BeanMaximo ticketsCount(BeanMaximo beanMaximo, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		BeanMaximo bean = new BeanMaximo();
		
		try {
			if(sqlSession!=null){
				bean = sqlSession.selectOne("com.pe.ibm.access.MapperMaximoView.ticketsCount",beanMaximo);
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
	
		return bean;
	}
	
	
	@Override
	public List<BeanMaximo> clientTicketsSLA(BeanMaximo beanMaximo, SqlSession sqlSession) {
		// Return strValor1 & strValor2
		List<BeanMaximo> list = new ArrayList<BeanMaximo>();
		
		try {
			if(sqlSession!=null){
				list = sqlSession.selectList("com.pe.ibm.access.MapperMaximoSLA.clientTicketsSLA",beanMaximo);
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
	
		return list;
	}

	@Override
	public List<BeanMaximo> ownersTicketsAssistance(BeanMaximo beanMaximo, SqlSession sqlSession) {
				List<BeanMaximo> list = new ArrayList<BeanMaximo>();
				
				try {
					if(sqlSession!=null){
						list = sqlSession.selectList("com.pe.ibm.access.MapperMaximoOPER.ownersTicketsAssistance",beanMaximo);//Asistencia en el Portal
					}else{
						System.err.println("no hay conexión");
					}
					
				}catch (Exception e) {
					e.printStackTrace();
					//sqlSession.rollback();
				}
				return list;
	}

	@Override
	public List<BeanMaximo> ownersTicketsView(BeanMaximo beanMaximo, SqlSession sqlSession) {
		List<BeanMaximo> list = new ArrayList<BeanMaximo>();
		
		try {
			if(sqlSession!=null){
				list = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.ownersTicketsView",beanMaximo);// Te muestra los propietarios de los Tickets
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
		return list;
	}	

//	S	E	L	E	C	T	-	O	P	T	I	O	N	S
	
	@Override
	public List<BeanMaximo> selectSquad(BeanMaximo beanMaximo, SqlSession sqlSession) {
		List<BeanMaximo> list = new ArrayList<BeanMaximo>();
		
		try {
			if(sqlSession!=null){
				list = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.selectSquad",beanMaximo);
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
		return list;
	}
	
	@Override
	public List<BeanMaximo> selectClient(BeanMaximo beanMaximo, SqlSession sqlSession) {
		List<BeanMaximo> list = new ArrayList<BeanMaximo>();
		
		try {
			if(sqlSession!=null){
				list = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.selectClient",beanMaximo);
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
		return list;
	}
	
	@Override
	public List<BeanMaximo> selectGroupOwner(BeanMaximo beanMaximo, SqlSession sqlSession) {
		List<BeanMaximo> list = new ArrayList<BeanMaximo>();
		
		try {
			if(sqlSession!=null){
				list = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.selectGroupOwner",beanMaximo);
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
		return list;
	}
	
	@Override
	public List<BeanMaximo> selectOwner(BeanMaximo beanMaximo, SqlSession sqlSession) {
		List<BeanMaximo> list = new ArrayList<BeanMaximo>();
		
		try {
			if(sqlSession!=null){
				list = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.selectOwner",beanMaximo);
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
		return list;
	}	
	
	@Override
	public List<BeanMaximo> UserGrade(BeanMaximo beanMaximo, SqlSession sqlSession) {
		List<BeanMaximo> list = new ArrayList<BeanMaximo>();
		
		try {
			if(sqlSession!=null){
				list = sqlSession.selectList("perfil.usergrade",beanMaximo);
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
		return list;
	}
	

	@Override
	public List<BeanParameters> listEyS(BeanParameters beanParameters, SqlSession sqlSession) {
		
		List<BeanParameters> list = new ArrayList<BeanParameters>();
		try {			
			if(sqlSession!=null){
				list = sqlSession.selectList("etime.obtenerFec",beanParameters);
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
		return list;
	}	
	
	@Override
	public List<BeanMaximo> modalticketacum(BeanMaximo beanMaximo, SqlSession sqlSession) {
		List<BeanMaximo> list = new ArrayList<BeanMaximo>();
		
		try {
			if(sqlSession!=null){
				list = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.selectMAT",beanMaximo);
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
		return list;
	}
	
	@Override
	public List<BeanMaximo> modalticketsinasig(BeanMaximo beanMaximo, SqlSession sqlSession) {
		List<BeanMaximo> list = new ArrayList<BeanMaximo>();
		
		try {
			if(sqlSession!=null){
				list = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.selectMST",beanMaximo);
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
		return list;
	}
	
	
	@Override
	public List<BeanMaximo> modalticketprioridad(BeanMaximo beanMaximo, SqlSession sqlSession) {
		List<BeanMaximo> list = new ArrayList<BeanMaximo>();
		
		try {
			if(sqlSession!=null){
				list = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.selectMPT",beanMaximo);
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
		return list;
	}
	
	@Override
	public List<BeanMaximo> modalVigentesDao(BeanMaximo beanMaximo, SqlSession sqlSession) {
		List<BeanMaximo> list = new ArrayList<BeanMaximo>();
		
		try {
			if(sqlSession!=null){
				list = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.modalvigentes",beanMaximo);
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
		return list;
	}
	
	@Override
	public List<BeanMaximo> modalVencidosDao(BeanMaximo beanMaximo, SqlSession sqlSession) {
		List<BeanMaximo> list = new ArrayList<BeanMaximo>();
		
		try {
			if(sqlSession!=null){
				list = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.modalvencidos",beanMaximo);
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
		return list;
	}
	
	@Override
	public List<BeanMaximo> Tabla1(BeanMaximo beanMaximo, SqlSession sqlSession) {
		List<BeanMaximo> list = new ArrayList<BeanMaximo>();
		System.out.print(beanMaximo.toString());
		try {
			if(sqlSession!=null){
				list = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.tabla1",beanMaximo);
				System.out.println("list "+list.size());
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
		return list;
	}
	
	@Override
	public List<BeanMaximo> Tabla2(BeanMaximo beanMaximo, SqlSession sqlSession) {
		List<BeanMaximo> list = new ArrayList<BeanMaximo>();
		
		try {
			if(sqlSession!=null){
				list = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.tabla2",beanMaximo);
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
		return list;
	}
	
	@Override
	public List<BeanMaximo> Tabla3(BeanMaximo beanMaximo, SqlSession sqlSession) {
		List<BeanMaximo> list = new ArrayList<BeanMaximo>();
		
		try {
			if(sqlSession!=null){
				list = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.tabla3",beanMaximo);
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
		return list;
	}
	
	
	@Override
	public List<BeanMaximo> ListarGrupoWO(BeanMaximo beanMaximo, SqlSession sqlSession) {
		List<BeanMaximo> list = new ArrayList<BeanMaximo>();
		
		try {
			if(sqlSession!=null){
				list = sqlSession.selectList("com.pe.ibm.access.MapperMaximoView.listWOGroup",beanMaximo);
			}else{
				System.err.println("no hay conexión");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			//sqlSession.rollback();
		}
		return list;
	}
	
	
}
