package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanPerfil;
import com.pe.ibm.bean.BeanPerfilDet;
import com.pe.ibm.bean.BeanRCT;


public interface DaoRCT {

	public List<BeanRCT> listarRCT(BeanRCT bean, SqlSession sqlSession);
	public List<BeanRCT> listarActividades(BeanRCT bean, SqlSession sqlSession);
	public List<BeanRCT> listarSchedulePorUsuario(BeanRCT bean, SqlSession sqlSession);
	public List<BeanRCT> listarRCTDETALLE(BeanRCT bean, SqlSession sqlSession);
	public int saveRCT(BeanRCT bean, SqlSession ssf);
	public int GuardarModalActividad(BeanRCT bean, SqlSession ssf);
	public int saveActividadSchedule(BeanRCT bean, SqlSession ssf);
	
	public int actualizarRCTactividad(BeanRCT bean, SqlSession ssf);
	public int guardarDetalleDesc(BeanRCT bean, SqlSession ssf);
	
	public int eliminarRCTDETALLE(BeanRCT bean, SqlSession ssf);
	public int editarDescripcionAnuncio(BeanRCT bean, SqlSession ssf);
	public int finalizarRCT(BeanRCT bean, SqlSession ssf);
//	MODAL
	public List<BeanRCT> listarMCliente(BeanRCT bean, SqlSession sqlSession);
	public List<BeanRCT> listarMServidor(BeanRCT bean, SqlSession sqlSession);
	public List<BeanRCT> listarMTurno(BeanRCT bean, SqlSession sqlSession);
	
}
