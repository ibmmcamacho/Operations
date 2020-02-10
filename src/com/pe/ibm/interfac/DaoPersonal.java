package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;

public interface DaoPersonal {

	public List<BeanEmpleado> listPersonal(BeanEmpleado pBeanPersonal,SqlSession session);
	public BeanEmpleado listPersonalIdLogin(BeanEmpleado pBeanPersonal,SqlSession session);
	public String listImage(BeanEmpleado pBeanPersonal,SqlSession session);
	public int savePersonal(BeanEmpleado pBeanPersonal,SqlSession session);
	public int updatePersonal(BeanEmpleado pBeanPersonal,SqlSession session);
	public int updateImage(BeanEmpleado pBeanPersonal,SqlSession session);
	public int deletePersonal(BeanEmpleado pBeanPersonal,SqlSession session);
	public int updatePersonalPassword(BeanEmpleado pBeanPersonal,SqlSession session);
	public List<BeanOptions> getResponsablesChatbot(BeanParameters pBeanParameters,SqlSession session);
	public List<BeanOptions> getPersonal_horario(BeanEmpleado pBeanPersonal,SqlSession session);
	public int cambiarestado1(BeanEmpleado pBeanPersonal,SqlSession session);
	
}
