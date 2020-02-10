package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanBusqueda;
import com.pe.ibm.bean.BeanLlamadas;

public interface DaoLlamadasMobility {

	public List<BeanLlamadas> getllamadasPorOpcion(BeanBusqueda objBean, int opcion, SqlSession session);
	
	
//	public List<BeanMaximo> getBackLog(BeanParameters objBeanParameters, SqlSession session);
//	public List<BeanMaximo> getTableBackLog(BeanParameters objBeanParameters, SqlSession session);
//	public List<BeanMaximo> getMaximoTicketBackLog(BeanParameters objBeanParameters, SqlSession session);
//	
//	public List<BeanMaximo> getTableBackLogWO(BeanParameters objBeanParameters, SqlSession session);
//	public List<BeanMaximoWorkOrder> getMaximoTicketBackLogWO(BeanParameters objBeanParameters, SqlSession session);
	
//	public List<BeanMaximo> getTableBackLogWOTareas(BeanParameters objBeanParameters, SqlSession session);
//	public List<BeanMaximoWorkOrder> getMaximoTicketBackLogWOTareas(BeanParameters objBeanParameters, SqlSession session);
//	
//	public List<BeanMaximo> getTicketsResueltos(BeanParameters objBeanParameters, SqlSession session);
//	public List<BeanMaximo> getTicketsResueltosFechas(BeanParameters objBeanParameters, SqlSession session);
//	public List<BeanMaximo> getTicketsResueltosEstados(BeanParameters objBeanParameters, SqlSession session);
//	public List<BeanMaximo> getMaximoTicketsResueltos(BeanParameters objBeanParameters, SqlSession session);
//	
//	public List<BeanMaximo> getTiempoSolucion(BeanParameters objBeanParameters, SqlSession session);	
//	public List<BeanMaximo> getUsuariosTop(BeanParameters objBeanParameters, SqlSession session);
//	public List<BeanMaximo> getSedes(BeanParameters objBeanParameters, SqlSession session);
//	public List<BeanMaximo> getClientMobility(BeanParameters objBeanParameters, SqlSession session);
//	
//	public List<BeanSlaMDA> getSlaDiario(BeanSlaMDA objBeanSla, SqlSession session);
//	public BeanSlaMDA getSlaMensual(BeanSlaMDA objBeanSla, SqlSession session);
//
//	public List<BeanReporteLlamadas> getReporteLlamadasContestadas(BeanReporteLlamadas objBean, SqlSession session);
//	public List<BeanReporteLlamadas> getReporteLlamadasNoContestadas(BeanReporteLlamadas objBean, SqlSession session);
//	
//	public List<BeanTicketSRINC> getTicketSRINC(BeanTicketSRINC objBean, SqlSession session);
//	
//	public int updateCorreos(BeanSlaMDA objBeanSla, SqlSession session);
//	
//	public List<BeanSlaMDA> getTasaResolucionDiario(BeanSlaMDA objBeanSla, SqlSession session);
//	public BeanSlaMDA getTasaResolucionMensual(BeanSlaMDA objBeanSla, SqlSession session);
//	
//	
//	public List<WorkOrder> obtenerListaWorkOrder(int opcionMapper, BeanBusqueda bean, SqlSession session);
	
	
	
}
