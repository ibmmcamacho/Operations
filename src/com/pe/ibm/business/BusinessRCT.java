package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanRCT;
import com.pe.ibm.dao.DaoPersonalImpl;
import com.pe.ibm.dao.DaoRCTImpl;
import com.pe.ibm.interfac.DaoPersonal;
import com.pe.ibm.interfac.DaoRCT;


public class BusinessRCT {
	
	
	public List<BeanRCT> listarRCT(BeanRCT bean, SqlSessionFactory ssf){		
		SqlSession sqlSession = ssf.openSession();			
		DaoRCT dao = new DaoRCTImpl();
		List<BeanRCT> lista = new ArrayList<BeanRCT>();
			try {
				lista = dao.listarRCT(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public List<BeanRCT> listarActividades(BeanRCT bean, SqlSessionFactory ssf){		
		SqlSession sqlSession = ssf.openSession();			
		DaoRCT dao = new DaoRCTImpl();
		List<BeanRCT> lista = new ArrayList<BeanRCT>();
			try {
				lista = dao.listarActividades(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	
	
	public List<BeanRCT> listarRCTDETALLE(BeanRCT bean, SqlSessionFactory ssf){		
		SqlSession sqlSession = ssf.openSession();			
		DaoRCT dao = new DaoRCTImpl();
		List<BeanRCT> lista = new ArrayList<BeanRCT>();
			try {
				lista = dao.listarRCTDETALLE(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	
	//LLENA EL COMBO DE LOS SCHEDULE POR USUARIO PARA ASIGNARSE UN RCT
	public List<BeanRCT> listarSchedulePorUsuario(BeanRCT bean, SqlSessionFactory ssf){
		
		SqlSession sqlSession = ssf.openSession();			
		DaoRCT dao = new DaoRCTImpl();
		List<BeanRCT> lista = new ArrayList<BeanRCT>();
			try {
				lista = dao.listarSchedulePorUsuario(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	// GUARDA LA INFO DE LA ACTIVIDAD QUE SE DESEA PASAR A RCT
	public int saveRCT(BeanRCT bean, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoRCT objDaoRCTImpl = new DaoRCTImpl();
			icount = objDaoRCTImpl.saveRCT(bean,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}
	
	//ASIGNA LA ACTIVIDAD A UN NUEVO SCHEDULE (seleccionado por el usuario)
	public int saveActividadSchedule(BeanRCT bean, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoRCT objDaoRCTImpl = new DaoRCTImpl();
			icount = objDaoRCTImpl.saveActividadSchedule(bean,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}
	
	public List<BeanRCT> listarMCliente(BeanRCT bean, SqlSessionFactory ssf){		
		SqlSession sqlSession = ssf.openSession();			
		DaoRCT dao = new DaoRCTImpl();
		List<BeanRCT> lista = new ArrayList<BeanRCT>();
			try {
				lista = dao.listarMCliente(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public List<BeanRCT> listarMServidor(BeanRCT bean, SqlSessionFactory ssf){		
		SqlSession sqlSession = ssf.openSession();			
		DaoRCT dao = new DaoRCTImpl();
		List<BeanRCT> lista = new ArrayList<BeanRCT>();
			try {
				lista = dao.listarMServidor(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	public List<BeanRCT> listarMTurno(BeanRCT bean, SqlSessionFactory ssf){		
		SqlSession sqlSession = ssf.openSession();			
		DaoRCT dao = new DaoRCTImpl();
		List<BeanRCT> lista = new ArrayList<BeanRCT>();
			try {
				lista = dao.listarMTurno(bean, sqlSession);

			}catch(Exception e) {
				e.printStackTrace();	
			}finally{
				sqlSession.close();
			}
		
		return lista;
		
	}
	
	
	public int GuardarModalActividad(BeanRCT bean, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoRCT objDaoRCTImpl = new DaoRCTImpl();
			icount = objDaoRCTImpl.GuardarModalActividad(bean,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}
	
	public int guardarDetalleDesc(BeanRCT bean, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoRCT objDaoRCTImpl = new DaoRCTImpl();
			icount = objDaoRCTImpl.guardarDetalleDesc(bean,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}
	
	
	public int actualizarRCTactividad(BeanRCT bean, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoRCT objDaoRCTImpl = new DaoRCTImpl();
			icount = objDaoRCTImpl.actualizarRCTactividad(bean,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}
	
	public int eliminarRCTDETALLE(BeanRCT bean, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoRCT objDaoRCTImpl = new DaoRCTImpl();
			icount = objDaoRCTImpl.eliminarRCTDETALLE(bean,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}
	
	public int editarDescripcionAnuncio(BeanRCT bean, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoRCT objDaoRCTImpl = new DaoRCTImpl();
			icount = objDaoRCTImpl.editarDescripcionAnuncio(bean,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}
	
	public int finalizarRCT(BeanRCT bean, SqlSessionFactory ssf) {
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoRCT objDaoRCTImpl = new DaoRCTImpl();
			icount = objDaoRCTImpl.finalizarRCT(bean,session);
		} catch (Exception ex) {
			icount = 0;
		}finally {
				session.close();
		}
		return icount;
	}
	
}
