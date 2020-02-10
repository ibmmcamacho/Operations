package com.pe.ibm.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.pe.ibm.bean.BusquedaTicket;
import com.pe.ibm.bean.BeanBusqueda;
import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanTicketSRINC;
import com.pe.ibm.bean.BeanTicketStatus;

public class EstadoTicketDAOImpl implements EstadoTicketDAO{

	@Override
	public BeanTicketStatus consultaFechaInicioTiempoRpta(String ticketid, SqlSession session) {
		// TODO Auto-generated method stub
		String cadenaMapperMybatis="com.pe.ibm.access.MapperEstadoTicket.consultaFechaInicioTiempoRpta";
		String instancia = "maximo";
		BusquedaTicket busqueda=new BusquedaTicket();
		BeanTicketStatus bean=new BeanTicketStatus();
		try{
			busqueda.setIdticket(ticketid);
		if(session!=null){
			bean =  (BeanTicketStatus) session.selectOne(cadenaMapperMybatis,ticketid);	
			System.out.println(bean.toString());
		}else{
			System.err.println("No hay conexión");
		}
		}catch(Exception e){
			System.err.println(e.getMessage());	
			e.printStackTrace();
		}
		
		return bean;
	}
	
	@Override
	public BeanTicketStatus consultaFechaInicioTiempoRptaBacklog(String ticketid, SqlSession session) {
		// TODO Auto-generated method stub
		String cadenaMapperMybatis="com.pe.ibm.access.MapperEstadoTicket.consultaFechaInicioTiempoRptaBacklog";
		String instancia = "maximo";
		BusquedaTicket busqueda=new BusquedaTicket();
		BeanTicketStatus bean=new BeanTicketStatus();
		try{
			busqueda.setIdticket(ticketid);
		if(session!=null){
			bean =  (BeanTicketStatus) session.selectOne(cadenaMapperMybatis,ticketid);	
		}else{
			System.err.println("No hay conexión");
		}
		}catch(Exception e){
			System.err.println(e.getMessage());	
			e.printStackTrace();
		}
		
		return bean;
	}
	
	@Override
	public BeanTicketStatus consultaFechaInicioWorkOrder(String ticketid, SqlSession session) {
		// TODO Auto-generated method stub
		String cadenaMapperMybatis="com.pe.ibm.access.MapperEstadoTicket.consultaFechaInicioTiempoRpta";
		String instancia = "maximo";
		BusquedaTicket busqueda=new BusquedaTicket();
		BeanTicketStatus bean=new BeanTicketStatus();
		try{
			busqueda.setIdticket(ticketid);
		if(session!=null){
			bean =  (BeanTicketStatus) session.selectOne(cadenaMapperMybatis,ticketid);	
		}else{
			System.err.println("No hay conexión");
		}
		}catch(Exception e){
			System.err.println(e.getMessage());	
			e.printStackTrace();
		}
		
		return bean;
	}

	@Override
	public BeanTicketStatus consultaFechaFinTiempoRpta(String ticketid, SqlSession session) {
		// TODO Auto-generated method stub
		String cadenaMapperMybatis="com.pe.ibm.access.MapperEstadoTicket.consultaFechaFinTiempoRpta";
		String instancia = "maximo";
		
		BusquedaTicket busqueda=new BusquedaTicket();
		BeanTicketStatus bean=new BeanTicketStatus();
		try{
		busqueda.setIdticket(ticketid);
		if(session!=null){
			bean = (BeanTicketStatus) session.selectOne(cadenaMapperMybatis,busqueda);
		}else{
			System.err.println("No hay conexión");
		}
		}catch(Exception e){
			System.err.println(e.getMessage());	
			e.printStackTrace();
			
		}
		return bean;
	}

	@Override
	public List<BeanTicketStatus> consultaEstadosTicket(String ticketid, String fechainicio, String fechafin, SqlSession session) {
		// TODO Auto-generated method stub
		String cadenaMapperMybatis="com.pe.ibm.access.MapperEstadoTicket.consultaEstadosTicket";
		String instancia = "maximo";

		List<BeanTicketStatus> list=null;
		BusquedaTicket busqueda=new BusquedaTicket();
		try{
		
		busqueda.setIdticket(ticketid);
		busqueda.setFechaInicio(fechainicio);
		busqueda.setFechaFin(fechafin);
		
			if(session!=null){
				list = session.selectList(cadenaMapperMybatis,busqueda);	
			}else{
				System.err.println("No hay conexión");
			}
		
		}catch(Exception ex){
			System.err.println(ex.getMessage());	
		}
				
		return list;
	}

	
	@Override
	public List<BeanTicketStatus> consultaEstadosTicketBacklogDCS( BeanMaximo beanTicket, SqlSession session) {
		// TODO Auto-generated method stub
		String cadenaMapperMybatis="com.pe.ibm.access.MapperEstadoTicket.consultaEstadosTicketBacklogDCS";
//		BeanBusqueda busqueda = new BeanBusqueda();
//		busqueda.setIdticket(ticketsQuery);
		List<BeanTicketStatus> list=null;
		try{
		
			if(session!=null){
//				System.out.println(lista.getIdticket());
				list = session.selectList(cadenaMapperMybatis,beanTicket);	
			}else{
				System.err.println("No hay conexión");
			}
		
		}catch(Exception ex){
			System.err.println(ex.getMessage());	
		}
				
		return list;
	}
	
	
	@Override
	public BeanTicketStatus consultaFechaInicioTiempoSolucion(String ticketid, SqlSession session) {
		// TODO Auto-generated method stub
		String cadenaMapperMybatis="com.pe.ibm.access.MapperEstadoTicket.consultaFechaInicioTiempoSol";
		String instancia = "maximo";
		
		BusquedaTicket busqueda=new BusquedaTicket();
		BeanTicketStatus bean=new BeanTicketStatus();
		
		
		try{
		busqueda.setIdticket(ticketid);
		if(session!=null){
			bean = (BeanTicketStatus) session.selectOne(cadenaMapperMybatis,busqueda);
		}else{
			System.err.println("No hay conexión");
		}
		}catch(Exception e){
			System.err.println(e.getMessage());	
			e.printStackTrace();
			
		}
		
		
		return bean;
	}
	
	@Override
	public BeanTicketStatus consultaFechaInicioTiempoSolucionBacklog(String ticketid, SqlSession session) {
		// TODO Auto-generated method stub
		String cadenaMapperMybatis="com.pe.ibm.access.MapperEstadoTicket.consultaFechaInicioTiempoSolBacklog";
		String instancia = "maximo";
		
		BusquedaTicket busqueda=new BusquedaTicket();
		BeanTicketStatus bean=new BeanTicketStatus();
		
		
		try{
		busqueda.setIdticket(ticketid);
		if(session!=null){
			bean = (BeanTicketStatus) session.selectOne(cadenaMapperMybatis,busqueda);
		}else{
			System.err.println("No hay conexión");
		}
		}catch(Exception e){
			System.err.println(e.getMessage());	
			e.printStackTrace();
			
		}
		
		return bean;
	}
	
	@Override
	public BeanTicketStatus consultaFechaFinTiempoSolucion(String ticketid, SqlSession session) {
		// TODO Auto-generated method stub
		String cadenaMapperMybatis="com.pe.ibm.access.MapperEstadoTicket.consultaFechaFinTiempoSolucion";
		String instancia = "maximo";
		
		BusquedaTicket busqueda=new BusquedaTicket();
		BeanTicketStatus bean=new BeanTicketStatus();
		
		
		try{
		busqueda.setIdticket(ticketid);
		if(session!=null){
			bean = (BeanTicketStatus) session.selectOne(cadenaMapperMybatis,busqueda);
		}else{
			System.err.println("No hay conexión");
		}
		}catch(Exception e){
			System.err.println(e.getMessage());	
			e.printStackTrace();
			bean = null;
			
		}
		
		return bean;
	}

	@Override
	public BeanTicketStatus consultaFechaInicioTiempoEsc(String ticketid, SqlSession session) {
		// TODO Auto-generated method stub
		String cadenaMapperMybatis="com.pe.ibm.access.MapperEstadoTicket.consultaFechaInicioTiempoEsc";
		String instancia = "maximo";
		BusquedaTicket busqueda=new BusquedaTicket();
		BeanTicketStatus bean=new BeanTicketStatus();
		try{
			busqueda.setIdticket(ticketid);
		if(session!=null){
			bean =  (BeanTicketStatus) session.selectOne(cadenaMapperMybatis,ticketid);	
		}else{
			System.err.println("No hay conexión");
		}
		}catch(Exception e){
			System.err.println(e.getMessage());	
			e.printStackTrace();
		}
		
		
		return bean;
	}

	@Override
	public BeanTicketStatus consultaFechaFinTiempoEsc(String ticketid, SqlSession session) {
		// TODO Auto-generated method stub
		String cadenaMapperMybatis="com.pe.ibm.access.MapperEstadoTicket.consultaFechaFinTiempoEsc";
		String instancia = "maximo";
		BusquedaTicket busqueda=new BusquedaTicket();
		BeanTicketStatus bean=new BeanTicketStatus();
		try{
			busqueda.setIdticket(ticketid);
		if(session!=null){
			bean =  (BeanTicketStatus) session.selectOne(cadenaMapperMybatis,ticketid);	
		}else{
			System.err.println("No hay conexión");
		}
		}catch(Exception e){
			System.err.println(e.getMessage());	
			e.printStackTrace();
		}
		
		
		return bean;
	}

}
