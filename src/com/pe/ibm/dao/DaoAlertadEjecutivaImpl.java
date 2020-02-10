package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanAlerta;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.interfac.DaoAlertaEjecutiva;

public class DaoAlertadEjecutivaImpl implements DaoAlertaEjecutiva {

	@Override
	public int saveAlertaEjecutiva(BeanAlerta pBeanAlerta, SqlSession session) {
		int icount = 0;
//		try{
						icount = session.insert("alerta.saveAlerta", pBeanAlerta);						
//			}
//			catch(Exception ex){
//				icount = 0;
//				System.out.println(ex.getCause().getMessage());
//			}
		 
		return icount;
	}

	@Override
	public int updateAlertaEjecutiva(BeanAlerta pBeanAlerta, SqlSession session) {
		int icount = 0;
//		try{
						icount = session.insert("alerta.updateAlerta", pBeanAlerta);						
//			}
//			catch(Exception ex){
//				icount = 0;
//				System.out.println(ex.getCause().getMessage());
//			}
		
		return icount;
	}

	@Override
	public List<BeanAlerta> listAlertaEjecutivaP1(String strTeam, SqlSession session) {
		List<BeanAlerta> lstBeanAlerta = null;
		try{
					lstBeanAlerta = session.selectList("alerta.getAlertasEjecutivasP1", strTeam);
			}
			catch(Exception ex){
				lstBeanAlerta = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanAlerta;
	}

	@Override
	public BeanAlerta listAlertaEjecutivaPorId(int iAlertaEjecutiva, SqlSession session) {
		BeanAlerta objBeanAlerta = null;
		try{
					objBeanAlerta = session.selectOne("alerta.getListAlertasEjecutivasPorId", iAlertaEjecutiva);
			}
			catch(Exception ex){
				objBeanAlerta = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return objBeanAlerta;
	}
	
	
	
	@Override
	public int guardarDetalleAlertaEjecutiva(BeanAlerta pBeanAlerta, SqlSession session) {
		int icount = 0;
//		try{
						icount = session.insert("alerta.guardarDetalleIncidencia", pBeanAlerta);						
//			}
//			catch(Exception ex){
//				icount = 0;
//				System.out.println(ex.getCause().getMessage());
//			}
		
		return icount;
	}

	@Override
	public int actualizarDetalleAlertaEjecutiva(BeanAlerta pBeanAlerta, SqlSession session) {
		int icount = 0;
//		try{
						icount = session.insert("alerta.actualizarDetalleIncidencia", pBeanAlerta);						
//			}
//			catch(Exception ex){
//				icount = 0;
//				System.out.println(ex.getCause().getMessage());
//			}
		
		return icount;
	}


	@Override
	public int eliminarDetalleAlertaEjecutiva(BeanAlerta pBeanAlerta, SqlSession session) {
		int icount = 0;
//		try{						
						icount = session.insert("alerta.eliminarDetalleIncidencia", pBeanAlerta);
//			}
//			catch(Exception ex){
//				icount = 0;
//				System.out.println(ex.getCause().getMessage());
//			}
		
		return icount;
	}
	
	
	@Override
	public List<BeanAlerta> listDetalleAlertaEjecutivaPorId(int iDetalleAlertaEjecutiva, SqlSession session) {
		List<BeanAlerta> listBeanAlerta = null;
		try{
					listBeanAlerta = session.selectList("alerta.getDetalleIncidencia", iDetalleAlertaEjecutiva);
			}
			catch(Exception ex){
				listBeanAlerta = null;
				System.out.println(ex.getCause().getMessage());
			}
		return listBeanAlerta;
	}

	@Override
	public List<BeanAlerta> listTicketsAlertaTimeLine(SqlSession session) {
		List<BeanAlerta> listBeanAlerta = null;
		try{
					listBeanAlerta = session.selectList("alerta.getTicketAlertaTimeLine");
			}
			catch(Exception ex){
				listBeanAlerta = null;
				System.out.println(ex.getCause().getMessage());
			}
		return listBeanAlerta;
	}

	@Override
	public BeanAlerta listTicketsNotificacionAlertas(int iAlertaEjecutiva, SqlSession session) {
		BeanAlerta objBeanAlerta = null;
		try{
					objBeanAlerta = session.selectOne("alerta.getTicketsNotificacionAlertas",iAlertaEjecutiva);
			}
			catch(Exception ex){
				objBeanAlerta = null;
				System.out.println(ex.getCause().getMessage());
			}
		return objBeanAlerta;
	}

	@Override
	public List<BeanAlerta> listTicketsNotificacionAlertasDetalle(int iAlertaEjecutiva, SqlSession session) {
		List<BeanAlerta> listBeanAlerta = null;
		try{
					listBeanAlerta = session.selectList("alerta.getTicketsNotificacionAlertasDetalle", iAlertaEjecutiva);
			}
			catch(Exception ex){
				listBeanAlerta = null;
				System.out.println(ex.getCause().getMessage());
			}
		return listBeanAlerta;
	}

	@Override
	public int obtenerIdTicketAlertaIncidencia(String strIdTicket, SqlSession session) {
		BeanAlerta objBeanAlerta = null;
//		try{
					objBeanAlerta = session.selectOne("alerta.getIdTicketAlertaIncidencia", strIdTicket);
//			}
//			catch(Exception ex){
//				objBeanAlerta = null;
//				System.out.println(ex.getCause().getMessage());
//			}
		return objBeanAlerta.getIdAlerta();
	}

	@Override
	public int deleteAlertaEjecutiva(int iIdAlerta, SqlSession session) {
		int icount = 0;
//		try{
						icount = session.insert("alerta.deleteAlerta", iIdAlerta);						
//			}
//			catch(Exception ex){
//				icount = 0;
//				System.out.println(ex.getCause().getMessage());
//			}
		
		return icount;
	}

	@Override
	public List<BeanOptions> getGrupoDistribucion(BeanParameters pobjBeanParameter, SqlSession session) {
		List<BeanOptions> lstBeanOptions = null;
		try{
						lstBeanOptions = session.selectList("alerta.getGrupoDistribucion",pobjBeanParameter);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanOptions;
	}

	@Override
	public List<BeanOptions> getListaDistribucion(BeanParameters pobjBeanParameter, SqlSession session) {
		List<BeanOptions> lstBeanOptions = null;
		try{
						lstBeanOptions = session.selectList("alerta.getListaDistribucion",pobjBeanParameter);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanOptions;
	}

	@Override
	public List<BeanOptions> getListaContactos(BeanParameters pobjBeanParameter, SqlSession session) {
		List<BeanOptions> lstBeanOptions = null;
		try{
						lstBeanOptions = session.selectList("alerta.getListaContactos",pobjBeanParameter);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanOptions;
	}

	@Override
	public List<BeanAlerta> getReporteGeneral(BeanParameters pobjBeanParameter, SqlSession session) {
		List<BeanAlerta> lstBeanAlerta = null;
		try{
						lstBeanAlerta = session.selectList("alerta.getReporteAlertasEjecutivas",pobjBeanParameter);
			}
			catch(Exception ex){
				lstBeanAlerta = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanAlerta;
	}

	@Override
	public List<BeanAlerta> listAlertaEjecutivaP1Closed(String strTeam, SqlSession session) {
		List<BeanAlerta> lstBeanAlerta = null;
		try{
					lstBeanAlerta = session.selectList("alerta.getAlertasEjecutivasP1Closed", strTeam);
			}
			catch(Exception ex){
				lstBeanAlerta = null;
				System.out.println(ex.getCause().getMessage());
			}
		return lstBeanAlerta;
	}

	@Override
	public int actualizarAperturaTicket(BeanAlerta pBeanAlerta, SqlSession session) {
		int icount = 0;
		try{
				icount = session.update("alerta.actualizarAperturaTicket", pBeanAlerta);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

	@Override
	public List<BeanAlerta> listDetalleAlertaEjecutivaPorId2(String strDetalleAlertaEjecutiva, SqlSession session) {
		List<BeanAlerta> listBeanAlerta = null;
		try{
					listBeanAlerta = session.selectList("alerta.getDetalleIncidencia2", strDetalleAlertaEjecutiva);
			}
			catch(Exception ex){
				listBeanAlerta = null;
				System.out.println(ex.getCause().getMessage());
			}
		return listBeanAlerta;
	}
}
