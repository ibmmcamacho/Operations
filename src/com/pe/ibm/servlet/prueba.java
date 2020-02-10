package com.pe.ibm.servlet;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.scripting.xmltags.ForEachSqlNode;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.business.SLATiempoOnsiteService;
import com.pe.ibm.dao.EstadoTicketDAO;
import com.pe.ibm.dao.EstadoTicketDAOImpl;
import com.pe.ibm.bean.BeanActividad;
import com.pe.ibm.bean.BeanDashboard;
import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanScheduleActividad;
import com.pe.ibm.bean.BeanTareaAsignada;
import com.pe.ibm.bean.BeanTicketSRINC;
import com.pe.ibm.bean.BeanTicketStatus;
import com.pe.ibm.bean.Feriado;
import com.pe.ibm.bean.Horario;
import com.pe.ibm.business.BusinessActividad;
import com.pe.ibm.business.BusinessScheduleActividad;
import com.pe.ibm.business.BusinessTarea;
import com.pe.ibm.business.FeriadoService;
import com.pe.ibm.business.HorarioService;
import com.pe.ibm.util.MyBatisUtil;


public class prueba {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		MyBatisUtil objMyBatis = new MyBatisUtil();
		SqlSessionFactory ssfsdd= objMyBatis.getSqlSessionFactoryCisco();
		
//		BeanTareaAsignada beanTareaAsignada2 = new BeanTareaAsignada();
//		beanTareaAsignada2.setIdTareaGenerada(27);
//		
//		BusinessTarea servicio = new BusinessTarea();
//		BeanTareaAsignada beanTarea = servicio.buscarTareaAsignada(beanTareaAsignada2, ssf);
//		
//		System.out.println("id tarea generada: "+beanTarea.getIdTareaGenerada());
		
//		BeanScheduleActividad bean = new BeanScheduleActividad();
//		
//		bean.setIdScheact(44041);
//		BusinessScheduleActividad servicio = new BusinessScheduleActividad();
//		BeanScheduleActividad beanScheduleActividad = servicio.buscarScheduleActividad(bean, ssf);
//		System.out.println("Resultado: "+beanScheduleActividad.getHoraInicio());
		
		System.out.println("======TIEMPO RESPUESTA ONSITE ======");
//		System.out.println("======TIEMPO SOLUCION ONSITE ======");
		
		//Tickets  'SR2787032','SR2790683'
		List<BeanTicketSRINC> listaTickets = new ArrayList<BeanTicketSRINC>();
		BeanTicketSRINC beanTicket1 = new BeanTicketSRINC();
//		BeanTicketSRINC beanTicket2 = new BeanTicketSRINC();
		BeanMaximo beanTicket = new BeanMaximo();
		beanTicket1.setTicketid("IN1972250");
		listaTickets.add(beanTicket1);
//		beanTicket2.setTicketid("SR2790683");
//		listaTickets.add(beanTicket2);
//		
		String strTicketsQuery = "";
		int cont = 0; 
		for (BeanTicketSRINC beanTicketSRINC : listaTickets) {
			System.out.println(beanTicketSRINC.toString());
			if(cont == 0) {
				strTicketsQuery += "'"+beanTicketSRINC.getTicketid()+"'";	
			}else {
				strTicketsQuery += ",'"+beanTicketSRINC.getTicketid()+"'";	
			}
			cont = cont + 1;
			
		}
//		
//		
		beanTicket.setIdTicket(strTicketsQuery);

		//Consulta Estados de tickets
		EstadoTicketDAOImpl daoestadoTk = new EstadoTicketDAOImpl();
		List<BeanTicketStatus> listaestados = new ArrayList<BeanTicketStatus>();
		SqlSession sqlSession = ssfsdd.openSession();
		try {
		listaestados = daoestadoTk.consultaEstadosTicketBacklogDCS(beanTicket, sqlSession);
		
		}catch(Exception e) {
			e.printStackTrace();	
		}finally{
			sqlSession.close();
		}
		
		//CONSULTA horarios
		HorarioService servicioHorario = new HorarioService();
		Horario beanHorario= servicioHorario.consultarHorario("28", ssfsdd);
		
		//CONSULTA FERIADOS
		FeriadoService servicioFeriado = new FeriadoService();
		List<Feriado> listaFeriados = new ArrayList<Feriado>();
		listaFeriados = servicioFeriado.listaFeriados(ssfsdd);
	
		SLATiempoOnsiteService service = new SLATiempoOnsiteService();
//		
		BeanDashboard beanDash = new  BeanDashboard();
		
//		beanDash = service.backlogContabilizarTiempoRespuesta(listaestados, beanHorario, null, listaFeriados);
		beanDash = service.backlogContabilizarTiempoSolucion(listaestados, beanHorario, null, listaFeriados);
				
//				contabilizarTiempoEfectivoBacklogTiempoRespuesta2(listaestados, beanHorario, null, listaFeriados);
		
		double valor= 0.0;
		valor=beanDash.getValor();
		int hrs= (int)(valor);
		int min= (int)((valor-hrs)* 60);
		int seg= (int)((((valor-hrs)* 60)-min)*60);
		String hhmmss = "";
		hhmmss = String.format("%02d:%02d:%02d", hrs, min, seg);
		System.out.println("Resueltado : "+hhmmss);
		
//		for (int i = 0; i< listaTickets.size(); i++) {
//			valor= 0.0;
//			List<BeanTicketStatus> listaStatus = new ArrayList<BeanTicketStatus>();
//			for(int j = 0; j< listaestados.size(); j++) {
//			if(listaestados.get(j).getTicketid().equals(listaTickets.get(i).getTicketid())) {
//				listaStatus.add(listaestados.get(j));
//			}else {
//				break;
//			}
//			}
//			valor=service.contabilizarTiempoEfectivoBacklogTiempoRespuesta2(listaStatus, beanHorario, null, listaFeriados);
//			listaTickets.get(i).setTiemporespuesta(valor);
//		}
		
		
//		for (BeanTicketSRINC beanTicketSRINC : listaTickets) {
//			System.out.println(beanTicketSRINC.getTiemporespuesta());
//		}
//		System.out.println(valor);
	
		
//		IN1962747
//		System.out.println("Resueltado BEAN: "+((beanResultado == null) ? "Es Null" : beanResultado.toString()));
	
	}

}
