package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanParameters;

public interface DaoMaximoWH {

	public List<BeanMaximo> getTICKET_INCSRS(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getTICKET_INCSRS_BACKLOG(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getTICKET_PRO(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getTICKET_PRO_BACKLOG(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getTICKET_WORKORDER_CAN(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getWORKORDER_CHAWORACT(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getWORKORDER_CHAWORACT_BACKLOG(BeanParameters objBeanParameters, SqlSession session);
	
	public List<BeanMaximo> getPaises(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getClientes(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getMensual(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getDiario(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getEstados(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getTendenciaActual(BeanParameters objBeanParameters, SqlSession session);
	
	public List<BeanMaximo> getBacklogGSP(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getCiscoMesa(BeanParameters objBeanParameters, SqlSession session);
	
	
	public List<BeanMaximo> getTicketsPaises(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getTicketsClientes(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getTicketsMensual(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getTicketsDiario(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getTicketsEstados(BeanParameters objBeanParameters, SqlSession session);
	public List<BeanMaximo> getTicketsTendenciaActual(BeanParameters objBeanParameters, SqlSession session);
	
}
