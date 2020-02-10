package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.BeanBusqueda;
import com.pe.ibm.bean.BeanLlamadas;
import com.pe.ibm.interfac.DaoLlamadasMobility;

public class DaoLlamadasMobilityImpl implements DaoLlamadasMobility {

	@Override
	public List<BeanLlamadas> getllamadasPorOpcion(BeanBusqueda objBean, int opcion, SqlSession session) {
		// TODO Auto-generated method stub
		List<BeanLlamadas> lstBean= null;
		String strMapper = "";
		
		switch(opcion) {
		case 1 :
			strMapper = "com.pe.ibm.access.MapperLlamadasMobility.getllamadasPorHoras";
			break;
		case 2 :
			strMapper = "com.pe.ibm.access.MapperLlamadasMobility.getllamadasPorSemana";
			break;
		case 3 :
			strMapper = "com.pe.ibm.access.MapperLlamadasMobility.getllamadasPorDiaDeSemana";
			break;
		case 4 :
			strMapper = "com.pe.ibm.access.MapperLlamadasMobility.getllamadasPorDiaDelMes";
			break;
		}
		
		try{
			lstBean  = session.selectList(strMapper,objBean);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBean;
	}


//	@Override
//	public List<BeanMaximo> getTiempoSolucion(BeanParameters objBeanParameters, SqlSession session) {
//		List<BeanMaximo> lstBeanMaximo = null;
//		try{
//				lstBeanMaximo =session.selectList("maximoMobility.getTiempoSolucion",objBeanParameters);
//		}
//		catch(Exception ex){
//			System.out.println(ex.getCause().getMessage());
//		}
//		return lstBeanMaximo;
//	}
//
//	@Override
//	public List<BeanMaximo> getTicketsResueltos(BeanParameters objBeanParameters, SqlSession session) {
//		List<BeanMaximo> lstBeanMaximo = null;
//		try{
//				lstBeanMaximo =session.selectList("maximoMobility.getTicketsResueltos",objBeanParameters);
//		}
//		catch(Exception ex){
//			System.out.println(ex.getCause().getMessage());
//		}
//		return lstBeanMaximo;
//	}
//	
//	@Override
//	public List<BeanMaximo> getTicketsResueltosFechas(BeanParameters objBeanParameters, SqlSession session) {
//		List<BeanMaximo> lstBeanMaximo = null;
//		try{
//				lstBeanMaximo =session.selectList("maximoMobility.getTicketsResueltosFechas",objBeanParameters);
//		}
//		catch(Exception ex){
//			System.out.println(ex.getCause().getMessage());
//		}
//		return lstBeanMaximo;
//	}
//
//	@Override
//	public List<BeanMaximo> getTicketsResueltosEstados(BeanParameters objBeanParameters, SqlSession session) {
//		List<BeanMaximo> lstBeanMaximo = null;
//		try{
//				lstBeanMaximo =session.selectList("maximoMobility.getTicketsResueltosEstados",objBeanParameters);
//		}
//		catch(Exception ex){
//			System.out.println(ex.getCause().getMessage());
//		}
//		return lstBeanMaximo;
//	}
//	
//	
//
//	@Override
//	public List<BeanMaximo> getUsuariosTop(BeanParameters objBeanParameters, SqlSession session) {
//		List<BeanMaximo> lstBeanMaximo = null;
//		try{
//				lstBeanMaximo =session.selectList("maximoMobility.getUsuariosTop",objBeanParameters);
//		}
//		catch(Exception ex){
//			System.out.println(ex.getCause().getMessage());
//		}
//		return lstBeanMaximo;
//	}
//
//	@Override
//	public List<BeanMaximo> getBackLog(BeanParameters objBeanParameters, SqlSession session) {
//		List<BeanMaximo> lstBeanMaximo = null;
//		try{
//				lstBeanMaximo =session.selectList("maximoMobility.getBackLog",objBeanParameters);
//		}
//		catch(Exception ex){
//			System.out.println(ex.getCause().getMessage());
//		}
//		return lstBeanMaximo;
//	}
//	
//	@Override
//	public List<BeanMaximo> getTableBackLog(BeanParameters objBeanParameters, SqlSession session) {
//		List<BeanMaximo> lstBeanMaximo = null;
//		try{
//				lstBeanMaximo =session.selectList("maximoMobility.getTablaBacklog",objBeanParameters);
//		}
//		catch(Exception ex){
//			System.out.println(ex.getCause().getMessage());
//		}
//		return lstBeanMaximo;
//	}
//	
//	@Override
//	public List<BeanMaximo> getMaximoTicketBackLog(BeanParameters objBeanParameters, SqlSession session) {
//		List<BeanMaximo> lstBeanMaximo = null;
//		try{
//				lstBeanMaximo =session.selectList("maximoMobility.getMaximoTicketsBacklog",objBeanParameters);
//		}
//		catch(Exception ex){
//			System.out.println(ex.getCause().getMessage());
//		}
//		return lstBeanMaximo;
//	}
//	
//	@Override
//	public List<BeanMaximo> getMaximoTicketsResueltos(BeanParameters objBeanParameters, SqlSession session) {
//		List<BeanMaximo> lstBeanMaximo = null;
//		try{
//				lstBeanMaximo =session.selectList("maximoMobility.getMaximoTicketsResueltos",objBeanParameters);
//		}
//		catch(Exception ex){
//			System.out.println(ex.getCause().getMessage());
//		}
//		return lstBeanMaximo;
//	}
//
//	@Override
//	public List<BeanMaximo> getSedes(BeanParameters objBeanParameters, SqlSession session) {
//		List<BeanMaximo> lstBeanMaximo = null;
//		try{
//				lstBeanMaximo =session.selectList("maximoMobility.getSedes",objBeanParameters);
//		}
//		catch(Exception ex){
//			System.out.println(ex.getCause().getMessage());
//		}
//		return lstBeanMaximo;
//	}
//
//	@Override
//	public List<BeanMaximo> getClientMobility(BeanParameters objBeanParameters, SqlSession session) {
//		List<BeanMaximo> lstBeanMaximo = null;
//		try{
//				lstBeanMaximo =session.selectList("maximoMobility.getClientMobility", objBeanParameters);
//		}
//		catch(Exception ex){
//			System.out.println(ex.getCause().getMessage());
//		}
//		return lstBeanMaximo;
//	}
//
//	@Override
//	public List<BeanMaximo> getTableBackLogWO(BeanParameters objBeanParameters, SqlSession session) {
//		// TODO Auto-generated method stub
//		List<BeanMaximo> lstBeanMaximo = null;
//		try{
//				lstBeanMaximo =session.selectList("maximoMobility.getTablaBacklogWO",objBeanParameters);
//		}
//		catch(Exception ex){
//			System.out.println(ex.getCause().getMessage());
//		}
//		return lstBeanMaximo;
//	}
//
//	@Override
//	public List<BeanMaximoWorkOrder> getMaximoTicketBackLogWO(BeanParameters objBeanParameters, SqlSession session) {
//		// TODO Auto-generated method stub
//		List<BeanMaximoWorkOrder> lstBeanMaximo = null;
//		try{
//				lstBeanMaximo =session.selectList("maximoMobility.getMaximoTicketsBacklogWO",objBeanParameters);
//		}
//		catch(Exception ex){
//			System.out.println(ex.getCause().getMessage());
//		}
//		return lstBeanMaximo;
//	}	
//	
////	@Override
////	public List<BeanMaximo> getTableBackLogWOTareas(BeanParameters objBeanParameters, SqlSession session) {
////		// TODO Auto-generated method stub
////		List<BeanMaximo> lstBeanMaximo = null;
////		try{
////				lstBeanMaximo =session.selectList("maximoMobility.getTablaBacklogWO",objBeanParameters);
////		}
////		catch(Exception ex){
////			System.out.println(ex.getCause().getMessage());
////		}
////		return lstBeanMaximo;
////	}
//
//	@Override
//	public List<BeanMaximoWorkOrder> getMaximoTicketBackLogWOTareas(BeanParameters objBeanParameters, SqlSession session) {
//		// TODO Auto-generated method stub
//		List<BeanMaximoWorkOrder> lstBeanMaximo = null;
//		try{
//				lstBeanMaximo =session.selectList("maximoMobility.getMaximoTicketsBacklogWOTareas",objBeanParameters);
//		}
//		catch(Exception ex){
//			System.out.println(ex.getCause().getMessage());
//		}
//		return lstBeanMaximo;
//	}
//
//	@Override
//	public List<BeanSlaMDA> getSlaDiario(BeanSlaMDA objBeanSla, SqlSession session) {
//		// TODO Auto-generated method stub
//		List<BeanSlaMDA> lstBeanSla = null;
//		try{
//			System.out.println(objBeanSla.toString());
//			lstBeanSla =session.selectList("maximoMobility.getSlaMDADiario",objBeanSla);
//		}
//		catch(Exception ex){
//			System.out.println(ex.getCause().getMessage());
//		}
//		return lstBeanSla;
//	}
//
//	@Override
//	public BeanSlaMDA getSlaMensual(BeanSlaMDA objBeanSla, SqlSession session) {
//		// TODO Auto-generated method stub
//		BeanSlaMDA beanSla = new BeanSlaMDA();
//		try{
//			beanSla = (BeanSlaMDA) session.selectOne("maximoMobility.getSlaMDAMensual",objBeanSla);
//			if(beanSla == null) {
//			beanSla = new BeanSlaMDA();
//			}
//		}
//		catch(Exception ex){
//			System.out.println("Error");
//			System.out.println(ex.getCause().getMessage());
//		}
//		return beanSla;
//	}
//
//	@Override
//	public List<BeanReporteLlamadas> getReporteLlamadasContestadas(BeanReporteLlamadas objBean, SqlSession session) {
//		List<BeanReporteLlamadas> listLlamadas = null;
//
//		try {
//			System.out.println("BEAN: "+objBean.toString());
//			listLlamadas=session.selectList("maximoMobility.getAnsweredByProjectByMonth",objBean);
//		} catch (Exception e) {
//			System.out.println(e.getCause().getMessage().toString());
//			e.printStackTrace();
//		}
//		
//		return listLlamadas;
//	}
//
//	@Override
//	public List<BeanReporteLlamadas> getReporteLlamadasNoContestadas(BeanReporteLlamadas objBean,
//			SqlSession session) {
//		List<BeanReporteLlamadas> listLlamadas = null;
//
//		try {
//			System.out.println("BEAN: "+objBean.toString());
//			listLlamadas=session.selectList("maximoMobility.getNoAnsweredByProjectbyMonth",objBean);
//		} catch (Exception e) {
//			System.out.println(e.getCause().getMessage().toString());
//			e.printStackTrace();
//		}
//		
//		return listLlamadas;
//	}
//
//	@Override
//	public int updateCorreos(BeanSlaMDA objBeanSla, SqlSession session) {
//		// TODO Auto-generated method stub
//		int resultado = 0;
//		try{
//			resultado = session.update("maximoMobility.actualizarCorreo",objBeanSla);
//		}
//		catch(Exception ex){
//			System.out.println("Error");
//			System.out.println(ex.getCause().getMessage());
//		}
//		return resultado;
//	}
//	
//	@Override
//	public List<WorkOrder> obtenerListaWorkOrder(int opcionMapper, BeanBusqueda bean, SqlSession session) {
//		String cadenaMapperMybatis=null;
//		String instancia = null;
//		switch(opcionMapper){
//		case 1: //"maximoobtenerWorkOrder"
//			cadenaMapperMybatis="com.pe.ibm.access.MapperTicketWO.maximoobtenerWorkOrder";	
//			instancia = "maximo";
//			break;
//		case 2: //"servicedeskobtenerWorkOrder"
//			cadenaMapperMybatis="com.pe.ibm.access.MapperTicketWO.servicedeskobtenerWorkOrder";	
//			instancia = "servicedesk";
//			break;
//		case 3: //"servicedeskWOHabPuestoTrabajoTiempoNull"
//			cadenaMapperMybatis="com.pe.ibm.access.MapperTicketWO.servicedeskWOHabPuestoTrabajoTiempoNull";	
//			instancia = "servicedesk";
//			break;
//		case 4: //"servicedeskWOHabPuestoTrabajo"
//			cadenaMapperMybatis="com.pe.ibm.access.MapperTicketWO.servicedeskWOHabPuestoTrabajo";	
//			instancia = "servicedesk";
//			break;
//		case 5: //"WOOSLIMA"
//			cadenaMapperMybatis="com.pe.ibm.access.MapperTicketWO.WOOSLIMA";	
//			instancia = "servicedesk";
//			break;
//		case 6: //"WOOSPROV"
//			cadenaMapperMybatis="com.pe.ibm.access.MapperTicketWO.WOOSPROV";	
//			instancia = "servicedesk";
//			break;
//		case 7: //"WOIMACOSLIMA"
//			cadenaMapperMybatis="com.pe.ibm.access.MapperTicketWO.WOIMACOSLIMA";	
//			instancia = "servicedesk";
//			break;
//		case 8: //"WOVDIOSLIMA"
//			cadenaMapperMybatis="com.pe.ibm.access.MapperTicketWO.WOVDIOSLIMA";	
//			instancia = "servicedesk";
//			break;
//		case 9: //"WOIMACOSPROV"
//			cadenaMapperMybatis="com.pe.ibm.access.MapperTicketWO.WOIMACOSPROV";	
//			instancia = "servicedesk";
//			break;
//		case 10: //"WOACTOSLIMA"
//			cadenaMapperMybatis="com.pe.ibm.access.MapperTicketWO.WOACTOSLIMA";	
//			instancia = "servicedesk";
//			break;
//		case 11: //"servicedeskEvaluarWOACTA"
//			cadenaMapperMybatis="com.pe.ibm.access.MapperTicketWO.servicedeskEvaluarWOACTA";	
//			instancia = "servicedesk";
//			break;
//		}
//
//		List<WorkOrder> list=null;
//		try{
//			
//			if(session!=null){
//				list = session.selectList(cadenaMapperMybatis,bean);
//			}else{
//				System.err.println("no hay conexión");
//			}
//		}catch(Exception ex){
//			System.err.println(ex.getMessage());	
//		}finally{
//			session.close();
//		}		
//		return list;
//	}
//	
//
//	@Override
//	public List<BeanTicketSRINC> getTicketSRINC(BeanTicketSRINC objBean, SqlSession session) {
//		// TODO Auto-generated method stub
//		List<BeanTicketSRINC> listTickets = null;
//
//		try {
////			System.out.println("BEAN: "+objBean.toString());
//			listTickets=session.selectList("maximoMobility.getTicketsSRINCfull",objBean);
//		} catch (Exception e) {
//			System.out.println(e.getCause().getMessage().toString());
//			e.printStackTrace();
//		}
//		
//		return listTickets;
//	}
//
//	@Override
//	public List<BeanSlaMDA> getTasaResolucionDiario(BeanSlaMDA objBeanSla, SqlSession session) {
//		// TODO Auto-generated method stub
//		List<BeanSlaMDA> lstBeanSla = null;
//		try{
//			System.out.println(objBeanSla.toString());
//			lstBeanSla =session.selectList("maximoMobility.getTasaResolucionDiario",objBeanSla);
//		}
//		catch(Exception ex){
//			System.out.println(ex.getCause().getMessage());
//		}
//		return lstBeanSla;
//	}
//
//	@Override
//	public BeanSlaMDA getTasaResolucionMensual(BeanSlaMDA objBeanSla, SqlSession session) {
//		// TODO Auto-generated method stub
//		BeanSlaMDA beanSla = new BeanSlaMDA();
//		try{
//			beanSla = (BeanSlaMDA) session.selectOne("maximoMobility.getTasaResolucionMensual",objBeanSla);
//			if(beanSla == null) {
//			beanSla = new BeanSlaMDA();
//			}
//		}
//		catch(Exception ex){
//			System.out.println("Error");
//			System.out.println(ex.getCause().getMessage());
//		}
//		return beanSla;
//	}
}
