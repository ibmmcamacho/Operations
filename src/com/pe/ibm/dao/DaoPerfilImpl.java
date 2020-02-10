package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanPerfil;
import com.pe.ibm.interfac.DaoPerfil;

public class DaoPerfilImpl implements DaoPerfil {

	@Override
	public List<BeanPerfil> listPerfil(BeanPerfil pBeanPerfil, SqlSession session) {
		List<BeanPerfil> lstBeanPerfil = null;
		try{
						lstBeanPerfil = session.selectList("perfil.getPerfil",pBeanPerfil);
			}
			catch(Exception ex){
				lstBeanPerfil = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanPerfil;
	}
	
	@Override
	public List<BeanPerfil> listPerfilDet(BeanPerfil pBeanPerfil, SqlSession session) {
		List<BeanPerfil> lstBeanPerfil = null;
		try{
						lstBeanPerfil = session.selectList("perfil.getPerfilDet",pBeanPerfil);
			}
			catch(Exception ex){
				lstBeanPerfil = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanPerfil;
	}

	@Override
	public int savePerfil(BeanPerfil pBeanPerfil, SqlSession session) {
		
		int icount = 0;
		try{
						icount = session.insert("perfil.savePerfil", pBeanPerfil);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

	@Override
	public int updatePerfil(BeanPerfil pBeanPerfil, SqlSession session) {
		int icount = 0;
		try{
						icount = session.insert("perfil.updatePerfil", pBeanPerfil);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		return icount;
	}

	@Override
	public int deletePerfil(BeanPerfil pBeanPerfil, SqlSession session) {
		int icount = 0;
		try{
						icount = session.insert("perfil.deletePerfil", pBeanPerfil);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

}
