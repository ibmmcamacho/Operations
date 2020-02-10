package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;

public interface DaoOptions {
	
	public List<BeanOptions> listOptions(BeanParameters pobjBeanParameter, SqlSession session);
	public List<BeanOptions> listOptionsImage(BeanParameters pobjBeanParameter, SqlSession session);
	public List<BeanOptions> listOptions2(BeanParameters pobjBeanParameter, SqlSession session);
	public List<BeanOptions> listOptions3(BeanParameters pobjBeanParameter, SqlSession session);
	public List<BeanOptions> listOptions3_(BeanParameters pobjBeanParameter, SqlSession session);
	public List<BeanOptions> listOptions4(BeanParameters pobjBeanParameter, SqlSession session);
	public List<BeanOptions> listOptions5(BeanParameters pobjBeanParameter, SqlSession session);
	public List<BeanOptions> listOptions6(BeanParameters pobjBeanParameter, SqlSession session);
	public List<BeanOptions> listOptions7(BeanParameters pobjBeanParameter, SqlSession session);
	public List<BeanOptions> listOptionsAnioClaim(BeanParameters pobjBeanParameter, SqlSession session);
	public List<BeanOptions> listOptionsFechaClaim(BeanParameters pobjBeanParameter, SqlSession session);
	public BeanParameters listCalculoTiempo(BeanMaximo pobjBeanMaximo, SqlSession session);
	public List<BeanOptions> listType(BeanParameters pobjBeanParameter, SqlSession session);
	public int saveOptions(BeanOptions pBeanOptions, SqlSession session);
	public int updateOptions(BeanOptions pBeanOptions, SqlSession session);
	public int deleteOptions(BeanOptions pBeanOptions, SqlSession session);

}
