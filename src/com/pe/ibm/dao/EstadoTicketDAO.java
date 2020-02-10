package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanTicketSRINC;
import com.pe.ibm.bean.BeanTicketStatus;

public interface EstadoTicketDAO {

	public BeanTicketStatus consultaFechaInicioTiempoEsc(String ticketid, SqlSession session);
	public BeanTicketStatus consultaFechaFinTiempoEsc(String ticketid, SqlSession session);
	public BeanTicketStatus consultaFechaInicioTiempoRpta(String ticketid, SqlSession session);
	public BeanTicketStatus consultaFechaInicioTiempoRptaBacklog(String ticketid, SqlSession session);
	public BeanTicketStatus consultaFechaInicioWorkOrder(String ticketid, SqlSession session);
	public BeanTicketStatus consultaFechaFinTiempoRpta(String ticketid, SqlSession session);
	public List<BeanTicketStatus> consultaEstadosTicket(String ticketid, String fechainicio, String fecha, SqlSession session);

	public List<BeanTicketStatus> consultaEstadosTicketBacklogDCS(BeanMaximo  beanTicket, SqlSession session);

	
	public BeanTicketStatus consultaFechaInicioTiempoSolucion(String ticketid, SqlSession session);
	public BeanTicketStatus consultaFechaInicioTiempoSolucionBacklog(String ticketid, SqlSession session);
	public BeanTicketStatus consultaFechaFinTiempoSolucion( String ticketid, SqlSession session);
}
