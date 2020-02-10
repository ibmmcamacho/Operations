package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanBancoClaves;

public interface DaoBancoClaves {

	public List<BeanBancoClaves> listBancoClaves(BeanBancoClaves pBeanBancoClaves, SqlSession session);
	public int saveBancoClaves(BeanBancoClaves pBeanBancoClaves, SqlSession session);
	public int updateBancoClaves(BeanBancoClaves pBeanBancoClaves, SqlSession session);
	public int deleteBancoClaves(BeanBancoClaves pBeanBancoClaves, SqlSession session);

}
