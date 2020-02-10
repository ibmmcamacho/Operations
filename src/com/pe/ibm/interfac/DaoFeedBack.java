package com.pe.ibm.interfac;

import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.BeanFeedBack;


public interface DaoFeedBack {
	
	public int insert(BeanFeedBack beanFeedBack, SqlSession sqlSession);

}
