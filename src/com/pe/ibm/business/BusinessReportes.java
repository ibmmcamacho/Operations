package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanAlerta;
import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanReporte;
import com.pe.ibm.dao.DaoReportesImpl;
import com.pe.ibm.interfac.DaoReportes;

public class BusinessReportes {

	public List<BeanReporte> listTeams(SqlSessionFactory ssf)
	{
		List<BeanReporte> lstBeanReporte;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReportes objDaoReporteImpl = new DaoReportesImpl();
			lstBeanReporte = objDaoReporteImpl.listTeam(session);
		}
		catch(Exception e)
		{
			lstBeanReporte = null;
		}finally {
			session.close();
		}
		return lstBeanReporte;
	}
	
	public List<BeanReporte> listReportes(BeanParameters pobjeBeanParameters, SqlSessionFactory ssf)
	{
		List<BeanReporte> lstBeanReporte;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReportes objDaoReporteImpl = new DaoReportesImpl();
			lstBeanReporte = objDaoReporteImpl.listReportes(pobjeBeanParameters,session);
		}
		catch(Exception e)
		{
			lstBeanReporte = null;
		}finally {
			session.close();
		}
		return lstBeanReporte;
	}
	
	public List<BeanReporte> listTop(BeanParameters pobjeBeanParameters, SqlSessionFactory ssf)
	{
		List<BeanReporte> lstBeanReporte;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReportes objDaoReporteImpl = new DaoReportesImpl();
			lstBeanReporte = objDaoReporteImpl.listTop(pobjeBeanParameters,session);
		}
		catch(Exception e)
		{
			lstBeanReporte = null;
		}finally {
			session.close();
		}
		return lstBeanReporte;
	}
	
	public List<BeanAlerta> listAlertasEjecutivas(BeanParameters pobjeBeanParameters, SqlSessionFactory ssf)
	{
		List<BeanAlerta> lstBeanReporte;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReportes objDaoReporteImpl = new DaoReportesImpl();
			lstBeanReporte = objDaoReporteImpl.listAlertasEjecutivas(pobjeBeanParameters,session);
		}
		catch(Exception e)
		{
			lstBeanReporte = null;
		}finally {
			session.close();
		}
		return lstBeanReporte;
	}
	
	public List<BeanMaximo> listSLA_Rimac(BeanParameters pBeanParameters, SqlSessionFactory ssf)
	{
		List<BeanMaximo> lstBeanMaximo;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReportes objDaoReporteImpl = new DaoReportesImpl();
			lstBeanMaximo = objDaoReporteImpl.listSLA_Rimac(pBeanParameters,session);
		}
		catch(Exception e)
		{
			lstBeanMaximo = null;
		}finally {
			session.close();
		}
		return lstBeanMaximo;
	}
	
	public List<BeanMaximo> listSLA_Promedio(BeanParameters pBeanParameters, SqlSessionFactory ssf)
	{
		List<BeanMaximo> lstBeanMaximo;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReportes objDaoReporteImpl = new DaoReportesImpl();
			lstBeanMaximo = objDaoReporteImpl.listSLA_RimacPromedio(pBeanParameters,session);
		}
		catch(Exception e)
		{
			lstBeanMaximo = null;
		}finally {
			session.close();
		}
		return lstBeanMaximo;
	}
	
	
	public List<BeanMaximo> listSLA_PromedioTotal(BeanParameters pBeanParameters, SqlSessionFactory ssf)
	{
		List<BeanMaximo> lstBeanMaximo;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReportes objDaoReporteImpl = new DaoReportesImpl();
			lstBeanMaximo = objDaoReporteImpl.listSLA_RimacPromedioTotal(pBeanParameters,session);
		}
		catch(Exception e)
		{
			lstBeanMaximo = null;
		}finally {
			session.close();
		}
		return lstBeanMaximo;
	}
	
	
	public List<BeanMaximo> listSLA_EspecialistasPrioridad(BeanParameters pBeanParameters, SqlSessionFactory ssf)
	{
		List<BeanMaximo> lstBeanMaximo;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReportes objDaoReporteImpl = new DaoReportesImpl();
			lstBeanMaximo = objDaoReporteImpl.listSLA_EspecialistasPrioridad(pBeanParameters,session);
		}
		catch(Exception e)
		{
			lstBeanMaximo = null;
		}finally {
			session.close();
		}
		return lstBeanMaximo;
	}
	
	
	public List<BeanMaximo> listReportSLA_PromedioTotal(BeanParameters pBeanParameters, SqlSessionFactory ssf)
	{
		List<BeanMaximo> lstBeanMaximo;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReportes objDaoReporteImpl = new DaoReportesImpl();
			lstBeanMaximo = objDaoReporteImpl.listReportSLA_RimacPromedioTotal(pBeanParameters,session);
		}
		catch(Exception e)
		{
			lstBeanMaximo = null;
		}finally {
			session.close();
		}
		return lstBeanMaximo;
	}
	
	
	public List<BeanMaximo> listPasesNoProductivos(BeanParameters pBeanParameters, SqlSessionFactory ssf)
	{
		List<BeanMaximo> lstBeanMaximo;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReportes objDaoReporteImpl = new DaoReportesImpl();
			lstBeanMaximo = objDaoReporteImpl.listgetSLAPasesNoProductivos(pBeanParameters,session);
		}
		catch(Exception e)
		{
			lstBeanMaximo = null;
		}finally {
			session.close();
		}
		return lstBeanMaximo;
	}

	public List<BeanMaximo> listPasesProductivos(BeanParameters pBeanParameters, SqlSessionFactory ssf)
	{
		List<BeanMaximo> lstBeanMaximo;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReportes objDaoReporteImpl = new DaoReportesImpl();
			lstBeanMaximo = objDaoReporteImpl.listgetSLAPasesProductivos(pBeanParameters,session);
		}
		catch(Exception e)
		{
			lstBeanMaximo = null;
		}finally {
			session.close();
		}
		return lstBeanMaximo;
	}
}
