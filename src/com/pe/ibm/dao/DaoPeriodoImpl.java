package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanPeriodo;
import com.pe.ibm.bean.BeanPeriodoDet;
import com.pe.ibm.bean.BeanTurno;
import com.pe.ibm.interfac.DaoPeriodo;

public class DaoPeriodoImpl implements DaoPeriodo{
	
	@Override
	public List<BeanPeriodo> listar(SqlSession sqlSession) {
		// TODO Auto-generated method stub
		BeanPeriodo bean = new BeanPeriodo();
		List<BeanPeriodo> lista = new ArrayList<BeanPeriodo>();
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperPeriodo.listar");
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
	public List<BeanPeriodo> listReportePeriodo(BeanPeriodo objBeanReporteDispatch, SqlSession session) {
		List<BeanPeriodo> listReportePeriodo = null;
		try {
			listReportePeriodo = session.selectList("com.pe.ibm.access.MapperPeriodo.listReportPeriodo", objBeanReporteDispatch);
		}catch(Exception ex) {
			listReportePeriodo = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReportePeriodo;
	}
	
	
	@Override
	public int mGuardar(BeanPeriodo objPeriodo, SqlSession session) {
		int icount = 0;
		try {
			icount = session.insert("com.pe.ibm.access.MapperPeriodo.savePeriodo", objPeriodo);
			session.commit();
		}catch(Exception ex){
			icount = 0;
			System.out.println(ex.getCause().getMessage());
		}
		return icount;
	}


	@Override
	public int mGuardar_Det(BeanPeriodoDet objPeriodoDet, SqlSession session) {
		int icount_Det = 0;
		try {
			icount_Det = session.insert("com.pe.ibm.access.MapperPeriodo.savePeriodoDetalle", objPeriodoDet);
			session.commit();
		}catch(Exception ex){
			icount_Det = 0;
			System.out.println(ex.getCause().getMessage());
		}
		return icount_Det;
	}
	
	@Override
	public int mUpdate_Det(BeanPeriodoDet objPeriodoDet, SqlSession session) {
		int icount_Det = 0;
		try {
			icount_Det = session.insert("com.pe.ibm.access.MapperPeriodo.updatePeriodoDetalle", objPeriodoDet);
			session.commit();
		}catch(Exception ex){
			icount_Det = 0;
			System.out.println(ex.getCause().getMessage());
		}
		return icount_Det;
	}


	@Override
	public int deletePeriodo(BeanPeriodo objPeriodo, SqlSession session) {
		int icount = 0;
		try{
			icount = session.update("com.pe.ibm.access.MapperPeriodo.deletePeriodo", objPeriodo);						
			session.commit();
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}		
		return icount;
	}


	@Override
	public List<BeanPeriodoDet> mBuscarDatos_PeriodoDet(BeanPeriodoDet objBeanPeriodoDet, SqlSession session) {
		List<BeanPeriodoDet> mBuscarDatos_PeriodoDet = null;
		try {
			mBuscarDatos_PeriodoDet = session.selectList("com.pe.ibm.access.MapperPeriodo.mBuscarDatos_PeriodoDet", objBeanPeriodoDet);
		}catch(Exception ex) {
			mBuscarDatos_PeriodoDet = null;
			System.out.println(ex.getCause().getMessage());
		}
		return mBuscarDatos_PeriodoDet;
	}

	
	@Override
	public int mActualizar(BeanPeriodo objPeriodo, SqlSession session) {
		int icount = 0;
		try {
			icount = session.insert("com.pe.ibm.access.MapperPeriodo.updatePeriodo", objPeriodo);
			session.commit();
		}catch(Exception ex){
			icount = 0;
			System.out.println(ex.getCause().getMessage());
		}
		return icount;
	}


	@Override
	public int mEliminar(BeanPeriodoDet objPeriodoDet, SqlSession session) {
		int icount_Det = 0;
		try {
			icount_Det = session.insert("com.pe.ibm.access.MapperPeriodo.deletePeriodoDet", objPeriodoDet);
			session.commit();
		}catch(Exception ex){
			icount_Det = 0;
			System.out.println(ex.getCause().getMessage());
		}
		return icount_Det;
	}

	
}
