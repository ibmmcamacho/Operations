package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanReporteTSM;
import com.pe.ibm.interfac.DaoReporteTSM;

public class DaoReporteTSMImple implements DaoReporteTSM {

	@Override
	public List<BeanReporteTSM> getReporteBackup(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanReporteTSM> lstBeanReporte = null;
		try
		{
			if(pobjBeanParameters.getStrType().equals("1"))
				lstBeanReporte = session.selectList("reportsTSM.getBackupFallido", pobjBeanParameters);
			else if(pobjBeanParameters.getStrType().equals("2"))
				lstBeanReporte = session.selectList("reportsTSM.getBackupCompleto", pobjBeanParameters);
			else if(pobjBeanParameters.getStrType().equals("3"))
				lstBeanReporte = session.selectList("reportsTSM.getBackupTotal", pobjBeanParameters);
		}
			catch(Exception ex){
				lstBeanReporte = null;
				System.out.println(ex.getCause().getMessage());
		}	
		return lstBeanReporte;
	}

	@Override
	public List<BeanReporteTSM> getBackupGrafico(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanReporteTSM> lstBeanReporte = null;
		try
		{
				lstBeanReporte = session.selectList("reportsTSM.getBackupGrafico", pobjBeanParameters);
		}
			catch(Exception ex){
				lstBeanReporte = null;
				System.out.println(ex.getCause().getMessage());
		}	
		return lstBeanReporte;
	}

}
