package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.interfac.DaoPersonal;

public class DaoPersonalImpl implements DaoPersonal {
	
	@Override
	public List<BeanEmpleado> listPersonal(BeanEmpleado pobjPersonal, SqlSession session) {
		List<BeanEmpleado> lstBeanPersonal = null;
		try{
			lstBeanPersonal = session.selectList("personal.getPersonal",pobjPersonal);
			}
			catch(Exception ex){
				lstBeanPersonal = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanPersonal;
	}
	
	@Override
	public BeanEmpleado listPersonalIdLogin(BeanEmpleado pobjPersonal, SqlSession session) {
		BeanEmpleado objBeanPersonal = null;
		try{
			objBeanPersonal = session.selectOne("personal.getPersonalIdLogin",pobjPersonal);
			}
			catch(Exception ex){
				objBeanPersonal = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return objBeanPersonal;
	}

	@Override
	public int savePersonal(BeanEmpleado pBeanPersonal, SqlSession session) {
		
		int icount = 0;
		try{
			icount = session.insert("personal.savePersonal", pBeanPersonal);
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
		
	}

	@Override
	public int updatePersonal(BeanEmpleado pBeanPersonal, SqlSession session) {
		int icount = 0;
		try{			
			icount = session.update("personal.updatePersonal", pBeanPersonal);
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		return icount;
	}
	
	@Override
	public int updatePersonalPassword(BeanEmpleado pBeanPersonal, SqlSession session) {
		int icount = 0;
		try{			
			icount = session.update("personal.changeClave", pBeanPersonal);
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		return icount;
	}

	@Override
	public int deletePersonal(BeanEmpleado pBeanPersonal, SqlSession session) {
		int icount = 0;
		try{
			icount = session.update("personal.deletePersonal", pBeanPersonal);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

	@Override
	public int updateImage(BeanEmpleado pBeanPersonal, SqlSession session) {
		int icount = 0;
		try{
			icount = session.update("personal.updateImage", pBeanPersonal);
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

	@Override
	public String listImage(BeanEmpleado pBeanPersonal, SqlSession session) {
		BeanEmpleado objPersonal = new BeanEmpleado();
		try{
						objPersonal = session.selectOne("personal.getImage",pBeanPersonal);
			}
			catch(Exception ex){
				objPersonal = null;
				System.out.println(ex.getCause().getMessage());
			}
		return objPersonal.getStrPhoto();
	}

	@Override
	public List<BeanOptions> getResponsablesChatbot(BeanParameters pBeanParameters, SqlSession session) {
		List<BeanOptions> lstBeanOptions = null;
		try{
			lstBeanOptions = session.selectList("personal.getResponsablesChatbot",pBeanParameters);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanOptions;
	}

	@Override
	public List<BeanOptions> getPersonal_horario(BeanEmpleado pBeanPersonal, SqlSession session) {
		List<BeanOptions> lstBeanOptions = null;
		try{
			lstBeanOptions = session.selectList("personal.getPersonal_horario",pBeanPersonal);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanOptions;
	}
	
	@Override
	public int cambiarestado1(BeanEmpleado pBeanPersonal, SqlSession session) {
		int icount = 0;
		try{
			icount = session.update("personal.cambiarestado1", pBeanPersonal);
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

}
