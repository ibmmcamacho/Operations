package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanBancoClaves;
import com.pe.ibm.interfac.DaoBancoClaves;

public class DaoBancoClavesImpl implements DaoBancoClaves {

	@Override
	public List<BeanBancoClaves> listBancoClaves(BeanBancoClaves pBeanBancoClaves, SqlSession session) {
		List<BeanBancoClaves> lstBeanBancoClaves = null;
		try{
					lstBeanBancoClaves = session.selectList("bancoClaves.getBancoClaves", pBeanBancoClaves);
			}
			catch(Exception ex){
				lstBeanBancoClaves = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanBancoClaves;
	}

	@Override
	public int saveBancoClaves(BeanBancoClaves pBeanBancoClaves, SqlSession session) {
		int icount = 0;
		try{
						icount = session.insert("bancoClaves.saveBancoClaves", pBeanBancoClaves);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

	@Override
	public int updateBancoClaves(BeanBancoClaves pBeanBancoClaves, SqlSession session) {
		int icount = 0;
		try{
						icount = session.insert("bancoClaves.updateBancoClaves", pBeanBancoClaves);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

	@Override
	public int deleteBancoClaves(BeanBancoClaves pBeanBancoClaves, SqlSession session) {
		int icount = 0;
		try{
						icount = session.update("bancoClaves.deleteBancoClaves", pBeanBancoClaves);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

}
