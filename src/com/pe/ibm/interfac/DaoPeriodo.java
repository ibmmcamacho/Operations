package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanPeriodo;
import com.pe.ibm.bean.BeanPeriodoDet;


public interface DaoPeriodo {

	public List<BeanPeriodo> listar(SqlSession sqlSession);
	public List<BeanPeriodo> listReportePeriodo(BeanPeriodo objBeanReporteDispatch, SqlSession session);
	public int mGuardar(BeanPeriodo objPeriodo, SqlSession session);
	public int mGuardar_Det(BeanPeriodoDet objPeriodoDet, SqlSession session);
	public int mUpdate_Det(BeanPeriodoDet objPeriodoDet, SqlSession session);
	public int deletePeriodo(BeanPeriodo objPeriodo, SqlSession session);
	public List<BeanPeriodoDet> mBuscarDatos_PeriodoDet(BeanPeriodoDet objBeanPeriodoDet, SqlSession session);
	public int mActualizar(BeanPeriodo objPeriodo, SqlSession session);
	public int mEliminar(BeanPeriodoDet objPeriodoDet, SqlSession session);
	
	
}
