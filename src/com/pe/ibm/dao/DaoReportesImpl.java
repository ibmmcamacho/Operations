
package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanAlerta;
import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanReporte;
import com.pe.ibm.interfac.DaoReportes;

public class DaoReportesImpl implements DaoReportes {

	@Override
	public List<BeanReporte> listTeam(SqlSession session) {
		List<BeanReporte> lstBeanReporte = null;
		try
		{
						lstBeanReporte = session.selectList("reports.getTeams","");
			}
			catch(Exception ex){
				lstBeanReporte = null;
				System.out.println(ex.getCause().getMessage());
			}
		return lstBeanReporte;
	}

	@Override
	public List<BeanReporte> listReportes(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanReporte> lstBeanReporte = null;
		try
		{
						if(pobjBeanParameters.getStrType().equals("1"))
							lstBeanReporte = session.selectList("reports.getTardanzaDetalle", pobjBeanParameters);
						else if(pobjBeanParameters.getStrType().equals("2"))
							lstBeanReporte = session.selectList("reports.getTardanzaAnual", pobjBeanParameters);
						else if(pobjBeanParameters.getStrType().equals("3"))
							lstBeanReporte = session.selectList("reports.getAsistenciaConsolidado", pobjBeanParameters);
						else if(pobjBeanParameters.getStrType().equals("4"))
							lstBeanReporte = session.selectList("reports.getTardanzaConsolidadoSemanal", pobjBeanParameters);
						else if(pobjBeanParameters.getStrType().equals("5"))
							lstBeanReporte = session.selectList("reports.getAsistencia", pobjBeanParameters);
			}
			catch(Exception ex){
				lstBeanReporte = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanReporte;
	}

	@Override
	public List<BeanReporte> listTop(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanReporte> lstBeanReporte = null;
		try
		{
						if(pobjBeanParameters.getStrType().equals("1"))
							lstBeanReporte = session.selectList("reports.getTopTardanza", pobjBeanParameters);
						else if(pobjBeanParameters.getStrType().equals("2"))
							lstBeanReporte = session.selectList("reports.getTopAsistencia", pobjBeanParameters);
			}
			catch(Exception ex){
				lstBeanReporte = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanReporte;
	}

	@Override
	public List<BeanAlerta> listAlertasEjecutivas(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanAlerta> lstBeanReporte = null;
		try
		{
//						if(pobjBeanParameters.getStrType().equals("1"))
							lstBeanReporte = session.selectList("alerta.getReporteAlertasEjecutivas", pobjBeanParameters);
			}
			catch(Exception ex){
				lstBeanReporte = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanReporte;
	}

	@Override
	public List<BeanMaximo> listSLA_Rimac(BeanParameters pBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try
		{
			lstBeanMaximo = session.selectList("reports.getSLA_Rimac", pBeanParameters);
		}
		catch(Exception ex){
			lstBeanMaximo = null;
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> listSLA_RimacPromedio(BeanParameters pBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try
		{
			lstBeanMaximo = session.selectList("reports.getSLA_Promedio", pBeanParameters);
		}
		catch(Exception ex){
			lstBeanMaximo = null;
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> listSLA_RimacPromedioTotal(BeanParameters pBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try
		{
			lstBeanMaximo = session.selectList("reports.getSLA_PromedioTotal", pBeanParameters);
		}
		catch(Exception ex){
			lstBeanMaximo = null;
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> listSLA_EspecialistasPrioridad(BeanParameters pBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try
		{
			lstBeanMaximo = session.selectList("reports.getSLA_EspecialistasPrioridad", pBeanParameters);
		}
		catch(Exception ex){
			lstBeanMaximo = null;
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> listReportSLA_RimacPromedioTotal(BeanParameters pBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try
		{
			lstBeanMaximo = session.selectList("reports.getReportSLA_PromedioTotal", pBeanParameters);
		}
		catch(Exception ex){
			lstBeanMaximo = null;
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> listgetSLAPasesNoProductivos(BeanParameters pBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try
		{
			lstBeanMaximo = session.selectList("reports.getPasesNoProductivos", pBeanParameters);
		}
		catch(Exception ex){
			lstBeanMaximo = null;
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> listgetSLAPasesProductivos(BeanParameters pBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try
		{
			lstBeanMaximo = session.selectList("reports.getPasesProductivos", pBeanParameters);
		}
		catch(Exception ex){
			lstBeanMaximo = null;
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}


}
