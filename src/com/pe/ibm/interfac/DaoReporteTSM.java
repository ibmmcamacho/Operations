package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanReporteTSM;

public interface DaoReporteTSM {
	
	public List<BeanReporteTSM> getReporteBackup(BeanParameters pobjBeanParameters,SqlSession session);
	public List<BeanReporteTSM> getBackupGrafico(BeanParameters pobjBeanParameters,SqlSession session);

}
