package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanReporteTWS;
import com.pe.ibm.interfac.DaoReporteTWS;

public class DaoReporteTWSImpl implements DaoReporteTWS{

	@Override
	public List<BeanReporteTWS> getMonitorTWS(SqlSession session, String pstrMalla) {
		List<BeanReporteTWS> lstBeanReporte = null;
		try
		{
			lstBeanReporte = session.selectList("reporteTWS.getMonitorTWS",pstrMalla);
		}
		catch(Exception ex){
			lstBeanReporte = null;
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanReporte;
	}

}
