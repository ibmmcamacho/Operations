package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanRCT;
import com.pe.ibm.bean.BeanTablero;
import com.pe.ibm.interfac.DaoRCT;
import com.pe.ibm.interfac.DaoTablero;

public class DaoTableroImpl implements DaoTablero{

	
	@Override
	public List<BeanTablero> cboSquad(BeanTablero bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanTablero> lista = new ArrayList<BeanTablero>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTablero.cboSquad", bean);
				}else{ 	
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	
	@Override
	public List<BeanTablero> cboTribu(BeanTablero bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanTablero> lista = new ArrayList<BeanTablero>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTablero.cboTribu", bean);
				}else{ 	
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	
	
	
	@Override
	public List<BeanTablero> cboTeam(BeanTablero bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanTablero> lista = new ArrayList<BeanTablero>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTablero.cboTeam", bean);
				}else{ 	
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	@Override
	public List<BeanTablero> cboGroupOwner(BeanTablero bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanTablero> lista = new ArrayList<BeanTablero>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTablero.cboGroupOwner", bean);
				}else{ 	
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	
	@Override
	public List<BeanTablero> cboOwner(BeanTablero bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanTablero> lista = new ArrayList<BeanTablero>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTablero.cboOwner", bean);
				}else{ 	
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	@Override
	public List<BeanTablero> cboClassTicket(BeanTablero bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanTablero> lista = new ArrayList<BeanTablero>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTablero.cboClassTicket", bean);
				}else{ 	
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	
	@Override
	public List<BeanTablero> cboSelectStatus(BeanTablero bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanTablero> lista = new ArrayList<BeanTablero>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTablero.cboSelectStatus", bean);
				}else{ 	
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	@Override
	public List<BeanTablero> listReportT3(BeanTablero bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanTablero> lista = new ArrayList<BeanTablero>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTablero.listReportT3", bean);
				}else{ 	
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	@Override
	public List<BeanTablero> listReportT2(BeanTablero bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanTablero> lista = new ArrayList<BeanTablero>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTablero.listReportT2", bean);
				}else{ 	
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	
	@Override
	public List<BeanTablero> listReportT1(BeanTablero bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanTablero> lista = new ArrayList<BeanTablero>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperTablero.listReportT1", bean);
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
