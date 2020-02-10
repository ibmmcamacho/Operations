package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanAlerta;
import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanReporte;

public interface DaoReportes {

	public List<BeanReporte> listTeam(SqlSession session);
	public List<BeanReporte> listReportes(BeanParameters pobjBeanParameters,SqlSession session);
	public List<BeanReporte> listTop(BeanParameters pobjBeanParameters, SqlSession session);
	
	public List<BeanAlerta> listAlertasEjecutivas(BeanParameters pobjBeanParameters, SqlSession session);
	
	public List<BeanMaximo> listSLA_Rimac(BeanParameters pBeanParameters, SqlSession session);
	public List<BeanMaximo> listSLA_RimacPromedio(BeanParameters pBeanParameters, SqlSession session);
	public List<BeanMaximo> listSLA_RimacPromedioTotal(BeanParameters pBeanParameters, SqlSession session);
	public List<BeanMaximo> listSLA_EspecialistasPrioridad(BeanParameters pBeanParameters, SqlSession session);
	public List<BeanMaximo> listReportSLA_RimacPromedioTotal(BeanParameters pBeanParameters, SqlSession session);
	
	public List<BeanMaximo> listgetSLAPasesNoProductivos(BeanParameters pBeanParameters, SqlSession session);
	public List<BeanMaximo> listgetSLAPasesProductivos(BeanParameters pBeanParameters, SqlSession session);

}
