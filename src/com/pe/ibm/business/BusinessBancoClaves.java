package com.pe.ibm.business;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanBancoClaves;
import com.pe.ibm.dao.DaoBancoClavesImpl;
import com.pe.ibm.interfac.DaoBancoClaves;

public class BusinessBancoClaves {
	
	public List<BeanBancoClaves> listBancoClaves(BeanBancoClaves pBeanBancoClaves, SqlSessionFactory ssf) {
		List<BeanBancoClaves> lstBeanBancoClaves = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoBancoClaves objDaoBancoClavesImpl = new DaoBancoClavesImpl();
			lstBeanBancoClaves = objDaoBancoClavesImpl.listBancoClaves(pBeanBancoClaves, session);
		} catch (Exception ex) {
			lstBeanBancoClaves = null;
		}finally {
				session.close();
		}
		return lstBeanBancoClaves;
	}

	public int saveBancoClaves(BeanBancoClaves pBeanBancoClaves, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoBancoClaves objDaoBancoClavesImpl = new DaoBancoClavesImpl();
			icount = objDaoBancoClavesImpl.saveBancoClaves(pBeanBancoClaves, session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}

	public int updateBancoClaves(BeanBancoClaves pBeanBancoClaves, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoBancoClaves objDaoBancoClavesImpl = new DaoBancoClavesImpl();
			icount = objDaoBancoClavesImpl.updateBancoClaves(pBeanBancoClaves, session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}

	public int deleteBancoClaves(BeanBancoClaves pBeanBancoClaves, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoBancoClaves objDaoBancoClavesImpl = new DaoBancoClavesImpl();
			icount = objDaoBancoClavesImpl.deleteBancoClaves(pBeanBancoClaves, session);
		} catch (Exception ex) {
			icount = 0;
			System.out.println(ex.getCause().getMessage());
		}finally {
				session.close();
		}
		return icount;
	}
	
}
