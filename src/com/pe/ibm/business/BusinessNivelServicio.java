package com.pe.ibm.business;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.dao.*;
import com.pe.ibm.bean.*;

public class BusinessNivelServicio {

	public List<BeanNivelServicio> listNivelServicio (String cliente, SqlSessionFactory ssf)
	{
		SqlSession session = null;
		List<BeanNivelServicio> listNivelServicio =new ArrayList<BeanNivelServicio>();
		DaoNivelServicio daoNS =new DaoNivelServicioImpl();
		 
		try {
			session = ssf.openSession(true);
			listNivelServicio = daoNS.obtenerNSProyecto(cliente, session);
		} catch (Exception ex) {
//			listNivelServicio =new ArrayList<BeanNivelServicio>();
			ex.printStackTrace();
		}finally {
				session.close();
		}
		
		return listNivelServicio;
	}
	
	public BeanResultadoMensualNivelServicio obtenerResultadoMensualSLA (String pId_sla,String pMes, String pAnio, SqlSessionFactory ssf){
		SqlSession session = null;
		BeanResultadoMensualNivelServicio beanResultado = new BeanResultadoMensualNivelServicio();
		DaoNivelServicio daoResultado = new DaoNivelServicioImpl();
		
		try {
			session = ssf.openSession(true);
			beanResultado = daoResultado.obtenerResultadoMensual(pId_sla, pMes, pAnio, session);
		} catch (Exception ex) {
//			beanResultado = new BeanResultadoMensualNivelServicio();
			ex.printStackTrace();
		}finally {
				session.close();
		}
		
		return beanResultado;
	}
	
	public BeanSLATiempoOnsiteResultado obtenerTiempoOnsiteResultado (String pid_sla, String pMes,String pAnio, SqlSessionFactory ssf){
		SqlSession session = null;
		BeanSLATiempoOnsiteResultado beanResultado = new BeanSLATiempoOnsiteResultado();
		DaoNivelServicio daoResultado = new DaoNivelServicioImpl();
		
		try {
			session = ssf.openSession(true);
			beanResultado = daoResultado.obtenerTiempoOnsiteResultado(pid_sla, pMes, pAnio, session);
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
				session.close();
		}
		
		return beanResultado;
	}
	
	public List<BeanSLATiempoOnsiteResultado> obtenerListaTiempoOnsiteResultado (String pid_proyecto, String pfechaInicio,SqlSessionFactory ssf){
		SqlSession session = null;
		List<BeanSLATiempoOnsiteResultado> listResultado = new ArrayList<BeanSLATiempoOnsiteResultado>();
		DaoNivelServicio daoResultado = new DaoNivelServicioImpl();
		
		try {
			session = ssf.openSession(true);
			listResultado = daoResultado.obtenerListaTiempoOnsiteResultado(pid_proyecto, pfechaInicio, session);
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
				session.close();
		}
		
		return listResultado;
	}
	
	
	public List<BeanResultadoMensualNivelServicio> listResultadoMensualNivelServicio(String id_proyecto,String pMes, String pAnio, SqlSessionFactory ssf){
		SqlSession session = null;
		List<BeanResultadoMensualNivelServicio> listResultado = new ArrayList<BeanResultadoMensualNivelServicio>();
		DaoNivelServicio daoResultado = new DaoNivelServicioImpl();
		
		try {
			session = ssf.openSession(true);
			listResultado = daoResultado.listarResultadoMensual(id_proyecto, pMes, pAnio, session);
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
				session.close();
		}
		
		return listResultado;
	}
	
	public List<BeanResultadoMensualNivelServicio> listNivelServicioHistorico (int opcionMapper, String id_proyecto, String fechaInicio, SqlSessionFactory ssf)
	{
		SqlSession session = null;
		 List<BeanResultadoMensualNivelServicio> listNivelServicioHistorico =new ArrayList<BeanResultadoMensualNivelServicio>();
		 DaoNivelServicio dao =new DaoNivelServicioImpl();
		 
		 try {
				session = ssf.openSession(true);
				listNivelServicioHistorico = dao.obtenerNSHistoricoProyecto(opcionMapper,id_proyecto, fechaInicio, session);
			} catch (Exception ex) {
//				listNivelServicioHistorico=new ArrayList<BeanResultadoMensualNivelServicio>();
				ex.printStackTrace();
			}finally {
					session.close();
			}
		 
		 return listNivelServicioHistorico;
	}
	
//	public BeanETL obtenerFechaReciente(String nombreDashboard, SqlSessionFactory ssf){
//		SqlSession session = null;
//		BeanETL betl=new BeanETL();
//		DaoETL dao=new DaoETLImpl();
//		
//		try {
//			session = ssf.openSession(true);
//			betl= dao.obtenerFechaActualizacion(nombreDashboard, session);
//		} catch (Exception ex) {
//			betl=new BeanETL();
//		}finally {
//				session.close();
//		}
//		
//		return betl;
//		
//	}
	
	
}
