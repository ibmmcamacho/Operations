package com.pe.ibm.util;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisUtil {

	public SqlSessionFactory getSqlSessionFactory() {

		SqlSessionFactory sqlSessionFactory = null;
		try {
			Reader reader = Resources.getResourceAsReader("com/pe/ibm/data/SQLMapConfig.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);

			System.out.println("db2 driver load!");
		} catch (Exception e) {
			System.out.println(e);
		}
		return sqlSessionFactory;
	}
	
	public SqlSessionFactory getSqlSessionFactory2() {

		SqlSessionFactory sqlSessionFactory = null;
		try {
			Reader reader = Resources.getResourceAsReader("com/pe/ibm/data/SQLMapConfig2.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);

			System.out.println("db2 driver2 load!");
		} catch (Exception e) {
			System.out.println(e);
		}
		return sqlSessionFactory;
	}
	
	public SqlSessionFactory getSqlSessionFactoryMaximoWH() {

		SqlSessionFactory sqlSessionFactory = null;
		try {
			Reader reader = Resources.getResourceAsReader("com/pe/ibm/data/SQLMapConfigMaximoWH.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);

			System.out.println("db2 driver MaximoWH load!");
		} catch (Exception e) {
			System.out.println(e);
		}
		return sqlSessionFactory;
	}
	
	public SqlSessionFactory getSqlSessionFactoryCisco() {

		SqlSessionFactory sqlSessionFactory = null;
		try {
			Reader reader = Resources.getResourceAsReader("com/pe/ibm/data/SQLMapConfigCisco.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);

			System.out.println("db2 driver Cisco load!");
		} catch (Exception e) {
			System.out.println(e);
		}
		return sqlSessionFactory;
	}
	
	public SqlSessionFactory getSqlSessionFactoryInformix() {

		SqlSessionFactory sqlSessionFactory = null;
		try {
			Reader reader = Resources.getResourceAsReader("com/pe/ibm/data/SQLMapConfigInformix.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);

			System.out.println("db2 driver Informix load!");
		} catch (Exception e) {
			System.out.println(e);
		}
		return sqlSessionFactory;
	}
	
	public SqlSessionFactory getSqlSessionFactoryMaximoPRD() {

		SqlSessionFactory sqlSessionFactory = null;
		try {
			Reader reader = Resources.getResourceAsReader("com/pe/ibm/data/SQLMapConfigMXPRD.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);

			System.out.println("db2 driver MaximoPRD load!");
		} catch (Exception e) {
			System.out.println(e);
		}
		return sqlSessionFactory;
	}
	
}
