package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.dao.DaoPersonalImpl;
import com.pe.ibm.interfac.DaoPersonal;

public class BusinessPersonal {
	
	public List<BeanEmpleado> listPersonal(BeanEmpleado pobjPersonal, SqlSessionFactory ssf) {
		List<BeanEmpleado> lstBeanPersonal = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoPersonal objDaoPersonalImpl = new DaoPersonalImpl();
			lstBeanPersonal = objDaoPersonalImpl.listPersonal(pobjPersonal,session);
		} catch (Exception ex) {
			lstBeanPersonal = null;
		}finally {
				session.close();
		}
		return lstBeanPersonal;
	}
	
	public BeanEmpleado listPersonalIdLogin(BeanEmpleado pobjPersonal, SqlSessionFactory ssf) {
		BeanEmpleado objBeanPersonal = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoPersonal objDaoPersonalImpl = new DaoPersonalImpl();
			objBeanPersonal = objDaoPersonalImpl.listPersonalIdLogin(pobjPersonal,session);
		} catch (Exception ex) {
			objBeanPersonal = null;
		}finally {
				session.close();
		}
		return objBeanPersonal;
	}
	
	public String listImage(BeanEmpleado pobjPersonal, SqlSessionFactory ssf) {
		String strImage;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoPersonal objDaoPersonalImpl = new DaoPersonalImpl();
			strImage = objDaoPersonalImpl.listImage(pobjPersonal,session);
		} catch (Exception ex) {
			strImage = null;
		}finally {
				session.close();
		}
		return strImage;
	}

	public int savePersonal(BeanEmpleado pBeanPersonal, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPersonal objDaoPersonalImpl = new DaoPersonalImpl();
			icount = objDaoPersonalImpl.savePersonal(pBeanPersonal,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}

	public int updatePersonal(BeanEmpleado pBeanPersonal, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPersonal objDaoPersonalImpl = new DaoPersonalImpl();
			icount = objDaoPersonalImpl.updatePersonal(pBeanPersonal,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}
	
	public int updatePersonalPassword(BeanEmpleado pBeanPersonal, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPersonal objDaoPersonalImpl = new DaoPersonalImpl();
			icount = objDaoPersonalImpl.updatePersonalPassword(pBeanPersonal,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}
	
	public int updateImage(BeanEmpleado pBeanPersonal, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPersonal objDaoPersonalImpl = new DaoPersonalImpl();
			icount = objDaoPersonalImpl.updateImage(pBeanPersonal,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}

	public int deletePersonal(BeanEmpleado pBeanPersonal, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPersonal objDaoPersonalImpl = new DaoPersonalImpl();
			icount = objDaoPersonalImpl.deletePersonal(pBeanPersonal,session);
		} catch (Exception ex) {
			icount = 0;
			System.out.println(ex.getCause().getMessage());
		}finally {
				session.close();
		}
		return icount;
	}
	
	public List<BeanOptions> getResponsablesChatbot(BeanParameters pBeanParameters, SqlSessionFactory ssf) {
		List<BeanOptions> lstBeanPersonal = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoPersonal objDaoPersonalImpl = new DaoPersonalImpl();
			lstBeanPersonal = objDaoPersonalImpl.getResponsablesChatbot(pBeanParameters,session);
		} catch (Exception ex) {
			lstBeanPersonal = null;
		}finally {
				session.close();
		}
		return lstBeanPersonal;
	}
	
	public List<BeanOptions> getPersonalHorario(BeanEmpleado pBeanPersonal, SqlSessionFactory ssf) {
		List<BeanOptions> lstBeanPersonal = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoPersonal objDaoPersonalImpl = new DaoPersonalImpl();
			lstBeanPersonal = objDaoPersonalImpl.getPersonal_horario(pBeanPersonal,session);
		} catch (Exception ex) {
			lstBeanPersonal = null;
		}finally {
				session.close();
		}
		return lstBeanPersonal;
	}

	
	public int cambiarestado1(BeanEmpleado pBeanPersonal, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoPersonal objDaoPersonalImpl = new DaoPersonalImpl();
			icount = objDaoPersonalImpl.cambiarestado1(pBeanPersonal,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}
	
	
}
