package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanUAT;
import com.pe.ibm.bean.BeanUATDispositivos;
import com.pe.ibm.bean.BeanUATGrupos;
import com.pe.ibm.bean.BeanUATSharedId;
import com.pe.ibm.bean.BeanUATUsuarios;
import com.pe.ibm.dao.DaoUATImpl;
import com.pe.ibm.interfac.DaoUAT;


public class BusinessUAT {
	
	public List<BeanUAT> getruat(BeanUAT bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoUAT dao = new DaoUATImpl();
		List<BeanUAT> lista = new ArrayList<BeanUAT>();
			try {
				lista = dao.listarUAT(bean,sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		return lista;
	}
	
	public int cuduat(BeanUAT bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoUAT dao = new DaoUATImpl();
		int resultado = 0;
			try {
				resultado = dao.mantenimientoUAT(bean, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}	
		return resultado;
	}
	
	
	public List<BeanUATDispositivos> getruatdisp(BeanUATDispositivos bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoUAT dao = new DaoUATImpl();
		List<BeanUATDispositivos> lista = new ArrayList<BeanUATDispositivos>();
			try {
				lista = dao.listarUATDispositivos(bean,sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		return lista;
	}
	
	public int cuduatdisp(BeanUATDispositivos bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoUAT dao = new DaoUATImpl();
		int resultado = 0;
			try {
				resultado = dao.mantenimientoUATDispositivo(bean, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}	
		return resultado;
	}
	
	
	
	public List<BeanUATGrupos> getruatgrupos(BeanUATGrupos bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoUAT dao = new DaoUATImpl();
		List<BeanUATGrupos> lista = new ArrayList<BeanUATGrupos>();
			try {
				lista = dao.listarUATGrupos(bean,sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		return lista;
	}
	
	public int cuduatgrupos(BeanUATGrupos bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoUAT dao = new DaoUATImpl();
		int resultado = 0;
			try {
				resultado = dao.mantenimientoUATGrupos(bean, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}	
		return resultado;
	}
	
	
	
	
	public List<BeanUATUsuarios> getruatUsuarios(BeanUATUsuarios bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoUAT dao = new DaoUATImpl();
		List<BeanUATUsuarios> lista = new ArrayList<BeanUATUsuarios>();
			try {
				lista = dao.listarUATUsuarios(bean,sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		return lista;
	}
	
	public int cuduatUsuarios(BeanUATUsuarios bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoUAT dao = new DaoUATImpl();
		int resultado = 0;
			try {
				resultado = dao.mantenimientoUATUsuarios(bean, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}	
		return resultado;
	}
	
	
	public List<BeanUATSharedId> getruatSharedId(BeanUATSharedId bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoUAT dao = new DaoUATImpl();
		List<BeanUATSharedId> lista = new ArrayList<BeanUATSharedId>();
			try {
				lista = dao.listarUATSharedId(bean,sqlSession);
			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		return lista;
	}
	
	public int cuduatSharedId(BeanUATSharedId bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoUAT dao = new DaoUATImpl();
		int resultado = 0;
			try {
				resultado = dao.mantenimientoUATSharedId(bean, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}	
		return resultado;
	}
	
	public int ustate(BeanUAT bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoUAT dao = new DaoUATImpl();
		int resultado = 0;
			try {
				resultado = dao.ustate(bean, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}	
		return resultado;
	}
	
	
	public String listimg(BeanUAT bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		DaoUAT dao = new DaoUATImpl();
		String resultado = "";
			try {
				resultado = dao.listimg(bean, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}	
		return resultado;
	}
	
	
	public BeanParameters listmax(BeanParameters bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		BeanParameters bean1 = new BeanParameters();
		DaoUAT dao = new DaoUATImpl();
			try {
				bean1 = dao.listMax(bean, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
		return bean1;
	}
	
	public List<BeanParameters> listmaxattachment(BeanParameters bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		List<BeanParameters> lst = new ArrayList<BeanParameters>();
		DaoUAT dao = new DaoUATImpl();
			try {
				lst = dao.listattachment(bean, sqlSession);	
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
		return lst;
	}
	
	
	public BeanParameters listCodIntermediario(BeanParameters bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		BeanParameters bean1 = new BeanParameters();
		DaoUAT dao = new DaoUATImpl();
			try {
				bean1 = dao.listCodIntermediario(bean, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
		return bean1;
	}
	
	
	public BeanParameters listCodIntermediario2(BeanParameters bean, SqlSessionFactory ssf){
		SqlSession sqlSession = ssf.openSession();
		
		BeanParameters bean1 = new BeanParameters();
		DaoUAT dao = new DaoUATImpl();
			try {
				bean1 = dao.listCodIntermediario2(bean, sqlSession);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
		return bean1;
	}
	
}
