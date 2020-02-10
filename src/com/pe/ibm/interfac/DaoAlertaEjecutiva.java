package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanAlerta;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;

public interface DaoAlertaEjecutiva {

	public int saveAlertaEjecutiva(BeanAlerta pBeanAlerta, SqlSession session);
	public int updateAlertaEjecutiva(BeanAlerta pBeanAlerta, SqlSession session);
	public int deleteAlertaEjecutiva(int iIdAlerta, SqlSession session);
	public BeanAlerta listAlertaEjecutivaPorId(int iAlertaEjecutiva, SqlSession session);
	public List<BeanAlerta> listAlertaEjecutivaP1(String strTeam, SqlSession session);
	public List<BeanAlerta> listAlertaEjecutivaP1Closed(String strTeam, SqlSession session);
	
	public int guardarDetalleAlertaEjecutiva(BeanAlerta pBeanAlerta, SqlSession session);
	public int actualizarDetalleAlertaEjecutiva(BeanAlerta pBeanAlerta, SqlSession session);
	public int eliminarDetalleAlertaEjecutiva(BeanAlerta pBeanAlerta, SqlSession session);
	public List<BeanAlerta> listDetalleAlertaEjecutivaPorId(int iDetalleAlertaEjecutiva, SqlSession session);
	public List<BeanAlerta> listDetalleAlertaEjecutivaPorId2(String strDetalleAlertaEjecutiva, SqlSession session);
	public int actualizarAperturaTicket(BeanAlerta pBeanAlerta, SqlSession session);
	
	
	public List<BeanAlerta> listTicketsAlertaTimeLine(SqlSession session);
	public BeanAlerta listTicketsNotificacionAlertas(int iAlertaEjecutiva, SqlSession session);
	public List<BeanAlerta> listTicketsNotificacionAlertasDetalle(int iAlertaEjecutiva, SqlSession session);
	
	public int obtenerIdTicketAlertaIncidencia(String strIdTicket, SqlSession session);
	public List<BeanOptions> getGrupoDistribucion(BeanParameters pobjBeanParameter, SqlSession session);
	public List<BeanOptions> getListaDistribucion(BeanParameters pobjBeanParameter, SqlSession session);
	public List<BeanOptions> getListaContactos(BeanParameters pobjBeanParameter, SqlSession session);
	
	public List<BeanAlerta> getReporteGeneral(BeanParameters pobjBeanParameter, SqlSession session);
	
}
