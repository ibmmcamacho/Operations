package com.pe.ibm.data;

import java.security.Security;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.ibatis.session.SqlSessionFactory;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import com.pe.ibm.util.MyBatisUtil;

/**
 * Application Lifecycle Listener implementation class MainServletContexListener
 *
 */
public final class MainServletContexListener implements ServletContextListener{

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
		Security.insertProviderAt(new BouncyCastleProvider(), 1);
		
		SqlSessionFactory ssf;
		ssf = new MyBatisUtil().getSqlSessionFactory();
		sce.getServletContext().setAttribute("sqlsf", ssf);
		
		SqlSessionFactory ssf2;
		ssf2 = new MyBatisUtil().getSqlSessionFactory2();
		sce.getServletContext().setAttribute("sqlsf2", ssf2);
		
		SqlSessionFactory ssfMaximo;
		ssfMaximo = new MyBatisUtil().getSqlSessionFactoryMaximoWH();
		sce.getServletContext().setAttribute("sqlsfMaximo", ssfMaximo);
		
		SqlSessionFactory ssfCisco;
		ssfCisco = new MyBatisUtil().getSqlSessionFactoryCisco();
		sce.getServletContext().setAttribute("sqlsfCisco", ssfCisco);
		
		SqlSessionFactory ssfMaxPRD;
		ssfMaxPRD = new MyBatisUtil().getSqlSessionFactoryMaximoPRD();
		sce.getServletContext().setAttribute("sqlsfMXPRD", ssfMaxPRD);
		
//		SqlSessionFactory ssfInformix;
//		ssfInformix = new MyBatisUtil().getSqlSessionFactoryInformix();
//		sce.getServletContext().setAttribute("sqlsfInformix", ssfInformix);
		
	}
}
