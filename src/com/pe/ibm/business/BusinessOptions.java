package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.dao.DaoOptionsImpl;
import com.pe.ibm.interfac.DaoOptions;

public class BusinessOptions {

	public List<BeanOptions> listOptions(BeanParameters pobjBeanParameter, SqlSessionFactory ssf) {
		List<BeanOptions> lstBeanOptions = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoOptions objDaoOptionsImpl = new DaoOptionsImpl();
			lstBeanOptions = objDaoOptionsImpl.listOptions(pobjBeanParameter,session);
		} catch (Exception ex) {
			lstBeanOptions = null;
		}finally {
				session.close();
		}
		
		return lstBeanOptions;
	}
	
	public List<BeanOptions> listOptionsImage(BeanParameters pobjBeanParameter, SqlSessionFactory ssf) {
		List<BeanOptions> lstBeanOptions = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoOptions objDaoOptionsImpl = new DaoOptionsImpl();
			lstBeanOptions = objDaoOptionsImpl.listOptionsImage(pobjBeanParameter,session);
		} catch (Exception ex) {
			lstBeanOptions = null;
		}finally {
				session.close();
		}
		
		return lstBeanOptions;
	}
	
	public List<BeanOptions> listOptions2(BeanParameters pobjBeanParameter, SqlSessionFactory ssf) {
		List<BeanOptions> lstBeanOptions = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoOptions objDaoOptionsImpl = new DaoOptionsImpl();
			lstBeanOptions = objDaoOptionsImpl.listOptions2(pobjBeanParameter,session);
		} catch (Exception ex) {
			lstBeanOptions = null;
		}finally {
				session.close();
		}
		
		return lstBeanOptions;
	}
	
	public List<BeanOptions> listOptions3(BeanParameters pobjBeanParameter, SqlSessionFactory ssf) {
		List<BeanOptions> lstBeanOptions = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoOptions objDaoOptionsImpl = new DaoOptionsImpl();
			lstBeanOptions = objDaoOptionsImpl.listOptions3(pobjBeanParameter,session);
		} catch (Exception ex) {
			lstBeanOptions = null;
		}finally {
				session.close();
		}
		
		return lstBeanOptions;
	}
	
	
	public List<BeanOptions> listOptions3_(BeanParameters pobjBeanParameter, SqlSessionFactory ssf) {
		List<BeanOptions> lstBeanOptions = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoOptions objDaoOptionsImpl = new DaoOptionsImpl();
			lstBeanOptions = objDaoOptionsImpl.listOptions3_(pobjBeanParameter,session);
		} catch (Exception ex) {
			lstBeanOptions = null;
		}finally {
				session.close();
		}
		
		return lstBeanOptions;
	}
	
	public List<BeanOptions> listOptions4(BeanParameters pobjBeanParameter, SqlSessionFactory ssf) {
		List<BeanOptions> lstBeanOptions = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoOptions objDaoOptionsImpl = new DaoOptionsImpl();
			lstBeanOptions = objDaoOptionsImpl.listOptions4(pobjBeanParameter,session);
		} catch (Exception ex) {
			lstBeanOptions = null;
		}finally {
				session.close();
		}
		
		return lstBeanOptions;
	}
	
	public List<BeanOptions> listOptions5(BeanParameters pobjBeanParameter, SqlSessionFactory ssf) {
		List<BeanOptions> lstBeanOptions = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoOptions objDaoOptionsImpl = new DaoOptionsImpl();
			lstBeanOptions = objDaoOptionsImpl.listOptions5(pobjBeanParameter,session);
		} catch (Exception ex) {
			lstBeanOptions = null;
		}finally {
				session.close();
		}
		
		return lstBeanOptions;
	}
	
	public List<BeanOptions> listOptions6(BeanParameters pobjBeanParameter, SqlSessionFactory ssf) {
		List<BeanOptions> lstBeanOptions = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoOptions objDaoOptionsImpl = new DaoOptionsImpl();
			lstBeanOptions = objDaoOptionsImpl.listOptions6(pobjBeanParameter,session);
		} catch (Exception ex) {
			lstBeanOptions = null;
		}finally {
				session.close();
		}
		
		return lstBeanOptions;
	}
	
	public List<BeanOptions> listOptions7(BeanParameters pobjBeanParameter, SqlSessionFactory ssf) {
		List<BeanOptions> lstBeanOptions = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoOptions objDaoOptionsImpl = new DaoOptionsImpl();
			lstBeanOptions = objDaoOptionsImpl.listOptions7(pobjBeanParameter,session);
		} catch (Exception ex) {
			lstBeanOptions = null;
		}finally {
				session.close();
		}
		
		return lstBeanOptions;
	}

	public int saveOptions(BeanOptions pBeanOptions, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoOptions objDaoOptionsImpl = new DaoOptionsImpl();
			icount = objDaoOptionsImpl.saveOptions(pBeanOptions,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}

		return icount;
	}

	public int updateOptions(BeanOptions pBeanOptions, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoOptions objDaoOptionsImpl = new DaoOptionsImpl();
			icount = objDaoOptionsImpl.updateOptions(pBeanOptions,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}

		return icount;
	}

	public int deleteOptions(BeanOptions pBeanOptions, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoOptions objDaoOptionsImpl = new DaoOptionsImpl();
			icount = objDaoOptionsImpl.deleteOptions(pBeanOptions,session);
		} catch (Exception ex) {
			icount = 0;
			System.out.println(ex.getCause().getMessage());
		}finally {
				session.close();
		}
		return icount;
	}
	
	public List<BeanOptions> listType(BeanParameters pobjBeanParameter, SqlSessionFactory ssf)
	{
		List<BeanOptions> lstBeanOptions = null;
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoOptions objDaoOptionsImpl = new DaoOptionsImpl();
			lstBeanOptions = objDaoOptionsImpl.listType(pobjBeanParameter,session);
		} catch (Exception ex) {
			lstBeanOptions = null;
		}finally {
				session.close();
		}
		
		return lstBeanOptions;
	}
	
	public BeanParameters listCalculotiempo(BeanMaximo pobjBeanMaximo, SqlSessionFactory ssf) {
		BeanParameters objBeanParameters = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoOptions objDaoOptionsImpl = new DaoOptionsImpl();
			objBeanParameters = objDaoOptionsImpl.listCalculoTiempo(pobjBeanMaximo,session);
		} catch (Exception ex) {
			objBeanParameters = null;
		}finally {
				session.close();
		}
		
		return objBeanParameters;
	}

	public List<BeanOptions> listOptionsAnioClaim(BeanParameters pobjBeanParameter, SqlSessionFactory ssf) {
		List<BeanOptions> lstBeanOptions = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoOptions objDaoOptionsImpl = new DaoOptionsImpl();
			lstBeanOptions = objDaoOptionsImpl.listOptionsAnioClaim(pobjBeanParameter,session);
		} catch (Exception ex) {
			lstBeanOptions = null;
		}finally {
				session.close();
		}
		
		return lstBeanOptions;
	}
	
	public List<BeanOptions> listOptionsFechaClaim(BeanParameters pobjBeanParameter, SqlSessionFactory ssf) {
		List<BeanOptions> lstBeanOptions = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoOptions objDaoOptionsImpl = new DaoOptionsImpl();
			lstBeanOptions = objDaoOptionsImpl.listOptionsFechaClaim(pobjBeanParameter,session);
		} catch (Exception ex) {
			lstBeanOptions = null;
		}finally {
				session.close();
		}
		
		return lstBeanOptions;
	}
	

	
}
