package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanUAT;
import com.pe.ibm.bean.BeanUATDispositivos;
import com.pe.ibm.bean.BeanUATGrupos;
import com.pe.ibm.bean.BeanUATSharedId;
import com.pe.ibm.bean.BeanUATUsuarios;
import com.pe.ibm.interfac.DaoUAT;

public class DaoUATImpl implements DaoUAT {

	@Override
	public int mantenimientoUAT(BeanUAT bean, SqlSession sqlSession) {
		int resultado = 0;
			try {
				if(sqlSession!=null){
					sqlSession.selectOne("uat.cuduat",bean);
					resultado =  bean.getiIdRequerimiento();
				}else{
					System.err.println("no hay conexion");
				}
			}catch (Exception e) {
				e.printStackTrace();
//				sqlSession.rollback();
			}	
		return resultado;
	}

	@Override
	public List<BeanUAT> listarUAT(BeanUAT bean, SqlSession sqlSession) {
		List<BeanUAT> lista = new ArrayList<BeanUAT>();
		try {
			if(sqlSession!=null){
				lista = sqlSession.selectList("uat.ruat",bean);
			}else{
				System.err.println("no hay conexion");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
//			sqlSession.rollback();
		}
	
	return lista;
	}

	@Override
	public int mantenimientoUATDispositivo(BeanUATDispositivos bean, SqlSession sqlSession) {
		int resultado = 0;
		try {
			if(sqlSession!=null){
				sqlSession.selectOne("uat.cuduatdisp",bean);
				resultado =  bean.getiIdDispositivo();
			}else{
				System.err.println("no hay conexion");
			}
		}catch (Exception e) {
			e.printStackTrace();
//			sqlSession.rollback();			
		}	
		return resultado;
	}

	@Override
	public List<BeanUATDispositivos> listarUATDispositivos(BeanUATDispositivos bean, SqlSession sqlSession) {
		List<BeanUATDispositivos> lista = new ArrayList<BeanUATDispositivos>();
		try {
			if(sqlSession!=null){
				lista = sqlSession.selectList("uat.ruatdisp",bean);
			}else{
				System.err.println("no hay conexion");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
//			sqlSession.rollback();
		}
	
		return lista;
	}

	@Override
	public int mantenimientoUATGrupos(BeanUATGrupos bean, SqlSession sqlSession) {
		int resultado = 0;
		try {
			if(sqlSession!=null){
				sqlSession.selectOne("uat.cuduatgrupos",bean);
				resultado =  bean.getiIdGrupo();
			}else{
				System.err.println("no hay conexion");
			}
		}catch (Exception e) {
			e.printStackTrace();
//			sqlSession.rollback();
		}	
		return resultado;
	}

	@Override
	public List<BeanUATGrupos> listarUATGrupos(BeanUATGrupos bean, SqlSession sqlSession) {
		List<BeanUATGrupos> lista = new ArrayList<BeanUATGrupos>();
		try {
			if(sqlSession!=null){
				lista = sqlSession.selectList("uat.ruatgrupos",bean);
			}else{
				System.err.println("no hay conexion");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
//			sqlSession.rollback();
		}
	
		return lista;
	}

	@Override
	public int mantenimientoUATUsuarios(BeanUATUsuarios bean, SqlSession sqlSession) {
		int resultado = 0;
		try {
			if(sqlSession!=null){
				sqlSession.selectOne("uat.cuduatusuarios",bean);
				resultado =  bean.getiIdUsuarios();
			}else{
				System.err.println("no hay conexion");
			}
		}catch (Exception e) {
			e.printStackTrace();
//			sqlSession.rollback();
		}	
		return resultado;
	}

	@Override
	public List<BeanUATUsuarios> listarUATUsuarios(BeanUATUsuarios bean, SqlSession sqlSession) {
		List<BeanUATUsuarios> lista = new ArrayList<BeanUATUsuarios>();
		try {
			if(sqlSession!=null){
				lista = sqlSession.selectList("uat.ruatusuarios",bean);
			}else{
				System.err.println("no hay conexion");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
//				sqlSession.rollback();
		}
	
		return lista;
	}

	@Override
	public int mantenimientoUATSharedId(BeanUATSharedId bean, SqlSession sqlSession) {
		int resultado = 0;
		try {
			if(sqlSession!=null){
				sqlSession.selectOne("uat.cuduatsharedid",bean);
				resultado =  bean.getiIdSharedId();
			}else{
				System.err.println("no hay conexion");
			}
		}catch (Exception e) {
			e.printStackTrace();
//			sqlSession.rollback();
		}	
	return resultado;
	}

	@Override
	public List<BeanUATSharedId> listarUATSharedId(BeanUATSharedId bean, SqlSession sqlSession) {
		List<BeanUATSharedId> lista = new ArrayList<BeanUATSharedId>();
		try {
			if(sqlSession!=null){
				lista = sqlSession.selectList("uat.ruatsharedid",bean);
			}else{
				System.err.println("no hay conexion");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
//			sqlSession.rollback();
		}
	
		return lista;
	}

	@Override
	public int ustate(BeanUAT bean, SqlSession sqlSession) {
		int resultado = 0;
		try {
			if(sqlSession!=null){
				sqlSession.selectOne("uat.ustate",bean);
				resultado =  bean.getiIdEstado();
			}else{
				System.err.println("no hay conexion");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}	
	return resultado;
	}

	@Override
	public String listimg(BeanUAT bean, SqlSession sqlSession) {
//		 String resultado = "";
		 BeanUAT bean1 = new BeanUAT();
		try {
			if(sqlSession!=null){
				bean1 = sqlSession.selectOne("uat.listimg",bean);
			}else{
				System.err.println("no hay conexion");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}	
	return (bean1 == null ? "" : bean1.getStrMensaje());
		
	}

	@Override
	public BeanParameters listMax(BeanParameters bean, SqlSession sqlSession) {
		 BeanParameters bean1 = new BeanParameters();
			try {
				if(sqlSession!=null){
					bean1 = sqlSession.selectOne("uat.rmax",bean);
				}else{
					System.err.println("no hay conexion");
				}
			}catch (Exception e) {
				e.printStackTrace();
			}	
		return bean1;
	}

	@Override
	public List<BeanParameters> listattachment(BeanParameters bean, SqlSession sqlSession) {
		List<BeanParameters> lista = new ArrayList<BeanParameters>(); 
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("uat.rmaxattachment",bean);
				}else{
					System.err.println("no hay conexion");
				}
			}catch (Exception e) {
				e.printStackTrace();
			}	
		return lista;
	}

	@Override
	public BeanParameters listCodIntermediario(BeanParameters bean, SqlSession sqlSession) {
		BeanParameters bean1 = new BeanParameters();
		try {
			if(sqlSession!=null){
				bean1 = sqlSession.selectOne("uat.rcodintermedio",bean);
			}else{
				System.err.println("no hay conexion");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	return bean1;
	}

	@Override
	public BeanParameters listCodIntermediario2(BeanParameters bean, SqlSession sqlSession) {
		BeanParameters bean1 = new BeanParameters();
		try {
			if(sqlSession!=null){
				bean1 = sqlSession.selectOne("uat.rcodintermedio2",bean);
			}else{
				System.err.println("no hay conexion");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	return bean1;
	}

}
