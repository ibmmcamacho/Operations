package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanReporteTSM;
import com.pe.ibm.dao.DaoReporteTSMImple;
import com.pe.ibm.interfac.DaoReporteTSM;

public class BusinessReportesTSM {

	public List<BeanReporteTSM> listReportesTSM(BeanParameters pobjeBeanParameters, SqlSessionFactory ssf)
	{
		List<BeanReporteTSM> lstBeanReporte;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteTSM objDaoReporteImpl = new DaoReporteTSMImple();
			lstBeanReporte = objDaoReporteImpl.getReporteBackup(pobjeBeanParameters,session);
		}
		catch(Exception e)
		{
			lstBeanReporte = null;
		}finally {
			session.close();
		}
		return lstBeanReporte;
	}
	
	public List<BeanReporteTSM> listGraficoTSM(BeanParameters pobjeBeanParameters, SqlSessionFactory ssf)
	{
		List<BeanReporteTSM> lstBeanReporte;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteTSM objDaoReporteImpl = new DaoReporteTSMImple();
			lstBeanReporte = objDaoReporteImpl.getBackupGrafico(pobjeBeanParameters,session);
		}
		catch(Exception e)
		{
			lstBeanReporte = null;
		}finally {
			session.close();
		}
		return lstBeanReporte;
	}
}
