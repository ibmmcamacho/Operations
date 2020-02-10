package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanReporteTWS;
import com.pe.ibm.dao.DaoReporteTWSImpl;
import com.pe.ibm.interfac.DaoReporteTWS;

public class BusinessReporteTWS {

	public List<BeanReporteTWS> getMonitorTWS(SqlSessionFactory ssf, String pstrMalla)
	{
		List<BeanReporteTWS> lstBeanReporteTWS;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoReporteTWS objDaoReporteTWSImpl = new DaoReporteTWSImpl();
			lstBeanReporteTWS = objDaoReporteTWSImpl.getMonitorTWS(session, pstrMalla);
		}
		catch(Exception e)
		{
			lstBeanReporteTWS = null;
		}finally {
			session.close();
		}
		return lstBeanReporteTWS;
	}
	
}
