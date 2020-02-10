package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanUAT;
import com.pe.ibm.bean.BeanUATDispositivos;
import com.pe.ibm.bean.BeanUATGrupos;
import com.pe.ibm.bean.BeanUATSharedId;
import com.pe.ibm.bean.BeanUATUsuarios;

public interface DaoUAT {
	
	public int mantenimientoUAT(BeanUAT bean, SqlSession sqlSession);
	public List<BeanUAT> listarUAT(BeanUAT bean,SqlSession sqlSession);
	
	public int mantenimientoUATDispositivo(BeanUATDispositivos bean, SqlSession sqlSession);
	public List<BeanUATDispositivos> listarUATDispositivos(BeanUATDispositivos bean,SqlSession sqlSession);
	
	public int mantenimientoUATGrupos(BeanUATGrupos bean, SqlSession sqlSession);
	public List<BeanUATGrupos> listarUATGrupos(BeanUATGrupos bean,SqlSession sqlSession);
	
	public int mantenimientoUATUsuarios(BeanUATUsuarios bean, SqlSession sqlSession);
	public List<BeanUATUsuarios> listarUATUsuarios(BeanUATUsuarios bean,SqlSession sqlSession);
	
	public int mantenimientoUATSharedId(BeanUATSharedId bean, SqlSession sqlSession);
	public List<BeanUATSharedId> listarUATSharedId(BeanUATSharedId bean,SqlSession sqlSession);
	
	public int ustate(BeanUAT bean, SqlSession sqlSession);
	public String listimg(BeanUAT bean, SqlSession sqlSession);
	public BeanParameters listMax(BeanParameters bean, SqlSession sqlSession);
	public BeanParameters listCodIntermediario(BeanParameters bean, SqlSession sqlSession);
	public BeanParameters listCodIntermediario2(BeanParameters bean, SqlSession sqlSession);
	public List<BeanParameters> listattachment(BeanParameters bean, SqlSession sqlSession);
	
	
}
