package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanRCT;
import com.pe.ibm.bean.BeanSuraTabla;

public interface DaoSuraTabla {

	
	
	public List<BeanSuraTabla> listTabla1(BeanSuraTabla bean, SqlSession sqlSession);
	public List<BeanSuraTabla> listTabla2(BeanSuraTabla bean, SqlSession sqlSession);
	public List<BeanSuraTabla> listTabla3(BeanSuraTabla bean, SqlSession sqlSession);
	
	
	
	public List<BeanSuraTabla> listReport(BeanSuraTabla bean, SqlSession sqlSession);
}
