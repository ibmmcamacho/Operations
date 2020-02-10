package com.pe.ibm.business;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanAlerta;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.dao.DaoAlertadEjecutivaImpl;
import com.pe.ibm.interfac.DaoAlertaEjecutiva;
import com.pe.ibm.util.AppUtils;

public class BusinessAlertaEjecutiva {

	public int saveAlertaEjecutiva(BeanAlerta pBeanAlerta, SqlSessionFactory ssf){
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoAlertaEjecutiva objDaoAlertaImpl = new DaoAlertadEjecutivaImpl();
			
			if(pBeanAlerta.getStrTipo().equals("guardar"))
				icount = objDaoAlertaImpl.saveAlertaEjecutiva(pBeanAlerta, session);
			else if(pBeanAlerta.getStrTipo().equals("actualizar"))
				icount = objDaoAlertaImpl.updateAlertaEjecutiva(pBeanAlerta, session);
			else if(pBeanAlerta.getStrTipo().equals("eliminar"))
				icount = objDaoAlertaImpl.deleteAlertaEjecutiva(pBeanAlerta.getIdAlerta(), session);			
		} catch (Exception ex) {
			icount = 0;
			AppUtils.addErr(ex, "GUARDAR | ALERTAS EJECUTIVAS", pBeanAlerta.getStrNombreUsuario(), pBeanAlerta.getIdUsuario(), ssf);
		}finally {
				session.close();
		}
		return icount;
	}

	public List<BeanAlerta> listAlertaEjecutivaP1(String strTeam, SqlSessionFactory ssf) {
		List<BeanAlerta> lstBeanAlerta = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoAlertadEjecutivaImpl objDaoAlertaEjecutivaImpl = new DaoAlertadEjecutivaImpl();
			lstBeanAlerta = objDaoAlertaEjecutivaImpl.listAlertaEjecutivaP1(strTeam, session);
		} catch (Exception ex) {
			lstBeanAlerta = null;
		}finally {
				session.close();
		}
		return lstBeanAlerta;
	}

	public List<BeanAlerta> listAlertaEjecutivaP1Closed(String strTeam, SqlSessionFactory ssf) {
		List<BeanAlerta> lstBeanAlerta = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoAlertadEjecutivaImpl objDaoAlertaEjecutivaImpl = new DaoAlertadEjecutivaImpl();
			lstBeanAlerta = objDaoAlertaEjecutivaImpl.listAlertaEjecutivaP1Closed(strTeam, session);
		} catch (Exception ex) {
			lstBeanAlerta = null;
		}finally {
				session.close();
		}
		return lstBeanAlerta;
	}
	
	public BeanAlerta listAlertaEjecutivaPorId(int iIdAlerta, SqlSessionFactory ssf) {
		BeanAlerta objBeanAlerta = null;
		SqlSession session = null;
		try {	
			session = ssf.openSession(true);
			DaoAlertadEjecutivaImpl objDaoAlertaEjecutivaImpl = new DaoAlertadEjecutivaImpl();
			objBeanAlerta = objDaoAlertaEjecutivaImpl.listAlertaEjecutivaPorId(iIdAlerta, session);
		} catch (Exception ex) {
			objBeanAlerta = null;
		}finally {
				session.close();
		}
		return objBeanAlerta;
	}
	
	public int mantenimientoDetalleAlertaEjecutiva(BeanAlerta pBeanAlerta, SqlSessionFactory ssf){
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoAlertaEjecutiva objDaoAlertaImpl = new DaoAlertadEjecutivaImpl();
			
			if(pBeanAlerta.getStrTipo().equals("guardarDetalle"))
				icount = objDaoAlertaImpl.guardarDetalleAlertaEjecutiva(pBeanAlerta, session);
			else if(pBeanAlerta.getStrTipo().equals("actualizarDetalle"))
				icount = objDaoAlertaImpl.actualizarDetalleAlertaEjecutiva(pBeanAlerta, session);
			else if(pBeanAlerta.getStrTipo().equals("eliminarDetalle"))
				icount = objDaoAlertaImpl.eliminarDetalleAlertaEjecutiva(pBeanAlerta, session);

		} catch (Exception ex) {
			icount = 0;
			AppUtils.addErr(ex, "GUARDAR | ALERTAS EJECUTIVAS", pBeanAlerta.getStrNombreUsuario(), pBeanAlerta.getIdUsuario(), ssf);
		}finally {
				session.close();
		}
		return icount;
	}
	
	public List<BeanAlerta> listDetalleAlertaEjecutivaP1(int iDetalleAlerta, SqlSessionFactory ssf) {
		List<BeanAlerta> lstBeanAlerta = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoAlertadEjecutivaImpl objDaoAlertaEjecutivaImpl = new DaoAlertadEjecutivaImpl();
			lstBeanAlerta = objDaoAlertaEjecutivaImpl.listDetalleAlertaEjecutivaPorId(iDetalleAlerta,session);
		} catch (Exception ex) {
			lstBeanAlerta = null;
		}finally {
				session.close();
		}
		return lstBeanAlerta;
	}
	
	public List<BeanAlerta> listDetalleAlertaEjecutivaP12(String strDetalleAlerta, SqlSessionFactory ssf) {
		List<BeanAlerta> lstBeanAlerta = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoAlertadEjecutivaImpl objDaoAlertaEjecutivaImpl = new DaoAlertadEjecutivaImpl();
			lstBeanAlerta = objDaoAlertaEjecutivaImpl.listDetalleAlertaEjecutivaPorId2(strDetalleAlerta,session);
		} catch (Exception ex) {
			lstBeanAlerta = null;
		}finally {
				session.close();
		}
		return lstBeanAlerta;
	}
	
	public List<BeanAlerta> listTicketsAlertaTimeLine(SqlSessionFactory ssf) {
		List<BeanAlerta> lstBeanAlerta = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoAlertadEjecutivaImpl objDaoAlertaEjecutivaImpl = new DaoAlertadEjecutivaImpl();
			lstBeanAlerta = objDaoAlertaEjecutivaImpl.listTicketsAlertaTimeLine(session);
		} catch (Exception ex) {
			lstBeanAlerta = null;
		}finally {
				session.close();
		}
		return lstBeanAlerta;
	}
	
	

	public BeanAlerta listTicketsNotificacionAlertas(int piAlertaEjecutiva, SqlSessionFactory ssf) {
		BeanAlerta objBeanAlerta = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoAlertadEjecutivaImpl objDaoAlertaEjecutivaImpl = new DaoAlertadEjecutivaImpl();
			objBeanAlerta = objDaoAlertaEjecutivaImpl.listTicketsNotificacionAlertas(piAlertaEjecutiva, session);
		} catch (Exception ex) {
			objBeanAlerta = null;
			AppUtils.addErr(ex, "GUARDAR | ALERTAS EJECUTIVAS", "", 0, ssf);
		}finally {
				session.close();
		}
		return objBeanAlerta;
	}
	
	public List<BeanAlerta> listTicketsNotificacionAlertasDetalle(int pidAlerta, SqlSessionFactory ssf) {
		List<BeanAlerta> objBeanAlerta = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoAlertadEjecutivaImpl objDaoAlertaEjecutivaImpl = new DaoAlertadEjecutivaImpl();
			objBeanAlerta = objDaoAlertaEjecutivaImpl.listTicketsNotificacionAlertasDetalle(pidAlerta, session);
		} catch (Exception ex) {
			objBeanAlerta = null;
		}finally {
				session.close();
		}
		return objBeanAlerta;
	}
	
	public int obtenerIdTicketAlertaIncidencia(String strIdTicket, SqlSessionFactory ssf) {
		int iIdAlerta = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoAlertadEjecutivaImpl objDaoAlertaEjecutivaImpl = new DaoAlertadEjecutivaImpl();
			iIdAlerta = objDaoAlertaEjecutivaImpl.obtenerIdTicketAlertaIncidencia(strIdTicket, session);
		} catch (Exception ex) {
			iIdAlerta = 0;
		}finally {
				session.close();
		}
		return iIdAlerta;
	}
	
	public List<BeanOptions> getGrupoDistribucion(BeanParameters pobjBeanParameter, SqlSessionFactory ssf) {
		List<BeanOptions> lstBeanOptions = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoAlertadEjecutivaImpl objDaoAlertadEjecutivaImpl = new DaoAlertadEjecutivaImpl();
			lstBeanOptions = objDaoAlertadEjecutivaImpl.getGrupoDistribucion(pobjBeanParameter,session);
		} catch (Exception ex) {
			lstBeanOptions = null;
		}finally {
				session.close();
		}
		
		return lstBeanOptions;
	}

	public List<BeanOptions> getListaDistribucion(BeanParameters pobjBeanParameter, SqlSessionFactory ssf) {
		List<BeanOptions> lstBeanOptions = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoAlertadEjecutivaImpl objDaoAlertadEjecutivaImpl = new DaoAlertadEjecutivaImpl();
			lstBeanOptions = objDaoAlertadEjecutivaImpl.getListaDistribucion(pobjBeanParameter,session);
		} catch (Exception ex) {
			lstBeanOptions = null;
		}finally {
				session.close();
		}
		
		return lstBeanOptions;
	}

	public List<BeanOptions> getListaContactos(BeanParameters pobjBeanParameter, SqlSessionFactory ssf) {
		List<BeanOptions> lstBeanOptions = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoAlertadEjecutivaImpl objDaoAlertadEjecutivaImpl = new DaoAlertadEjecutivaImpl();
			lstBeanOptions = objDaoAlertadEjecutivaImpl.getListaContactos(pobjBeanParameter,session);
		} catch (Exception ex) {
			lstBeanOptions = null;
		}finally {
				session.close();
		}
		
		return lstBeanOptions;
	}
	
	public List<BeanAlerta> getReporteGeneral(BeanParameters pobjBeanParameter, SqlSessionFactory ssf) {
		List<BeanAlerta> lstBeanAlerta = null;
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			DaoAlertadEjecutivaImpl objDaoAlertadEjecutivaImpl = new DaoAlertadEjecutivaImpl();
			lstBeanAlerta = objDaoAlertadEjecutivaImpl.getReporteGeneral(pobjBeanParameter,session);
		} catch (Exception ex) {
			lstBeanAlerta = null;
		}finally {
				session.close();
		}
		
		return lstBeanAlerta;
	}
	
	public int actualizarAperturaTicket(BeanAlerta pBeanAlerta, SqlSessionFactory ssf){
		SqlSession session = null;
		int icount = 0;
		try {
			session = ssf.openSession(true);
			DaoAlertaEjecutiva objDaoAlertaImpl = new DaoAlertadEjecutivaImpl();
			
			icount = objDaoAlertaImpl.actualizarAperturaTicket(pBeanAlerta, session);

		} catch (Exception ex) {
			icount = 0;
			AppUtils.addErr(ex, "ACTUALIZAR | ALERTAS EJECUTIVAS", pBeanAlerta.getStrNombreUsuario(), pBeanAlerta.getIdUsuario(), ssf);
		}finally {
				session.close();
		}
		return icount;
	}
	
}
