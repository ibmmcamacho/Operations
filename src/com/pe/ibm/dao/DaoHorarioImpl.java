package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanHorario;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.interfac.DaoHorario;

public class DaoHorarioImpl implements DaoHorario {

	@Override
	public List<BeanHorario> listHorario(BeanHorario pBeanHorario,SqlSession session) {
		List<BeanHorario> lstBeanHorario = null;
		try{
					lstBeanHorario = session.selectList("horario.getHorario", pBeanHorario);
			}
			catch(Exception ex){
				lstBeanHorario = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanHorario;
	}

	@Override
	public int saveHorario(BeanHorario pBeanHorario,SqlSession session) {
		
		int icount = 0;
		try{
						icount = session.insert("horario.saveHorario", pBeanHorario);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
		
	}

	@Override
	public int updateHorario(BeanHorario pBeanHorario,SqlSession session) {
		int icount = 0;
		try{			
						icount = session.insert("horario.updateHorario", pBeanHorario);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

	@Override
	public int deleteHorario(BeanHorario pBeanHorario,SqlSession session) {
		int icount = 0;
		try{
						icount = session.insert("horario.deleteHorario", pBeanHorario);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

	@Override
	public BeanParameters getValidateHorario(BeanParameters pBeanParameters,SqlSession session) {
		BeanParameters objBeanParameters = new BeanParameters();
		try{
						objBeanParameters = session.selectOne("horario.getValidateHorario", pBeanParameters);						
			}
			catch(Exception ex){
				objBeanParameters = null;
				System.out.println(ex.getCause().getMessage());
			}
		
		return objBeanParameters;
	}

	@Override
	public List<BeanParameters> listHorarioAsignacion(BeanParameters pBeanParameters,SqlSession session) {
		List<BeanParameters> lstBeanParameters = null;
		try{
						lstBeanParameters = session.selectList("horario.getHorarioAsignacion", pBeanParameters);
			}
			catch(Exception ex){
				lstBeanParameters = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanParameters;
	}

	@Override
	public int saveHorarioAsignacion(BeanParameters pBeanParameters,SqlSession session) {
		int icount = 0;
		try{
						icount = session.insert("horario.saveHorarioAsignacion", pBeanParameters);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

	@Override
	public int updateHorarioAsignacion(BeanParameters pBeanParameters,SqlSession session) {
		int icount = 0;
		try{
						icount = session.insert("horario.updateHorarioAsignacion", pBeanParameters);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

	@Override
	public int deleteHorarioAsignacion(BeanParameters pBeanParameters,SqlSession session) {
		int icount = 0;
		try{
						icount = session.insert("horario.deleteHorarioAsignacion", pBeanParameters);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

}
