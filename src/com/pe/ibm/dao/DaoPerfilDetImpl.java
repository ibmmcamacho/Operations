package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanPerfil;
import com.pe.ibm.bean.BeanPerfilDet;
import com.pe.ibm.bean.BeanReporteDispatch;
import com.pe.ibm.interfac.DaoPerfilDet;;

public class DaoPerfilDetImpl implements DaoPerfilDet{

	@Override
	public List<BeanPerfilDet> listPerfilDet(BeanPerfilDet pBeanPerfilDet, SqlSession session) {
		List<BeanPerfilDet> lstBeanPerfilDet = null;
		try{
			lstBeanPerfilDet = session.selectList("perfil.getlistPerfilDet", pBeanPerfilDet);
		}
		catch(Exception ex){
			lstBeanPerfilDet = null;
			System.out.println(ex.getCause().getMessage());
		}	
		return lstBeanPerfilDet;
	}	
	
	
	@Override
	public List<BeanPerfilDet> listCboPerfilDet(BeanPerfilDet pBeanPerfilDet, SqlSession session) {
		List<BeanPerfilDet> lstBeanPerfilDet = null;
		try{
			lstBeanPerfilDet = session.selectList("perfil.getCboPerfilDet",pBeanPerfilDet);
			}
			catch(Exception ex){
				lstBeanPerfilDet = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanPerfilDet;
	}
	
	
	@Override
	public int savePerfilDet(BeanPerfilDet pBeanPerfilDet, SqlSession session) {
		
		int icount = 0;
		try{
						icount = session.insert("perfil.savePerfilDet", pBeanPerfilDet);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

	@Override
	public int updatePerfilDet(BeanPerfilDet pBeanPerfilDet, SqlSession session) {
		int icount = 0;
		try{
						icount = session.insert("perfil.updatePerfilDet", pBeanPerfilDet);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		return icount;
	}

	@Override
	public int deletePerfilDet(BeanPerfilDet pBeanPerfilDet, SqlSession session) {
		int icount = 0;
		try{
						icount = session.insert("perfil.deletePerfilDet", pBeanPerfilDet);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}
	
	
}
