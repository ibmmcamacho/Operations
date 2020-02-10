package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanRendimiento;
import com.pe.ibm.bean.BeanRendimientoDashboard;

public interface DaoRendimiento {

	public List<BeanRendimiento> listar(BeanRendimiento bean, SqlSession sqlSession);
	public List<BeanRendimientoDashboard> listar_reporte(BeanRendimientoDashboard beanDashboard, SqlSession sqlSession);
}
