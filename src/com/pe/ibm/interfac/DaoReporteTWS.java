package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanReporteTWS;

public interface DaoReporteTWS {
	
	public List<BeanReporteTWS> getMonitorTWS(SqlSession session, String pstrMalla);

}
