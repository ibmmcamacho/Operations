package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanReporteDispatch;
import com.pe.ibm.interfac.DaoReporteDispatch;

public class DaoReporteDispatchImpl implements DaoReporteDispatch {

	@Override
	public List<BeanReporteDispatch> listReporteDispatch(BeanReporteDispatch pBeanReporteDispatch, SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try{
			listReporteDispatch = session.selectList("reporteDispatch.getTFC", pBeanReporteDispatch);
		}
		catch(Exception ex){
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}	
		return listReporteDispatch;
	}
	
	@Override
	public List<BeanReporteDispatch> list(BeanReporteDispatch pBeanReporteDispatch, SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try{
			listReporteDispatch = session.selectList("reporteDispatch.getReporteDispatch", pBeanReporteDispatch);
			
		}
		catch(Exception ex){
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}	
		return listReporteDispatch;
	}
	
	@Override
	public List<BeanReporteDispatch> listTeam(BeanReporteDispatch pBeanReporteDispatch, SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try{
			listReporteDispatch = session.selectList("reporteDispatch.getTeam", pBeanReporteDispatch);
			
		}
		catch(Exception ex){
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}	
		return listReporteDispatch;
	}
/*
	@Override
	public List<BeanReporteDispatch> listTFC(BeanReporteDispatch pBeanReporteDispatch, SqlSession session) {
		List<BeanReporteDispatch> listTFC = null;
		try{
			listTFC = session.selectList("reporteDispatch.getTFC");
			System.out.println(listTFC.size());
		}
		catch(Exception ex){
			listTFC = null;
			System.out.println(ex.getCause().getMessage());
		}	
		return listTFC;
	}
	*/

	@Override
	public List<BeanReporteDispatch> listReporteCriteria(BeanReporteDispatch pBeanReporteDispatch, SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try{
			listReporteDispatch = session.selectList("reporteDispatch.getReporteCriteria", pBeanReporteDispatch);
			
		}
		catch(Exception ex){
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}	
		return listReporteDispatch;
	}
	
	
	@Override
	public List<BeanReporteDispatch> listCliente(BeanReporteDispatch pBeanReporteDispatch, SqlSession session){
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getCliente", pBeanReporteDispatch);
		}catch(Exception ex) {
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}
	
	
	@Override
	public List<BeanReporteDispatch> listReporteDispatchEspecialista_1(BeanReporteDispatch objBeanReporteDispatch, SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getReporteEspecialista_1", objBeanReporteDispatch);
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}
	

	@Override
	public List<BeanReporteDispatch> listReporteDispatchEspecialista_2(BeanReporteDispatch objBeanReporteDispatch, SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getReporteEspecialista_2", objBeanReporteDispatch);
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}
	

	@Override
	public List<BeanReporteDispatch> listReporteDispatchHorarioOficina(BeanReporteDispatch objBeanReporteDispatch,	SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getReporteHorarioOficina", objBeanReporteDispatch);
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}

	@Override
	public List<BeanReporteDispatch> listReporteDispatchSquad(BeanReporteDispatch objBeanReporteDispatch, SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getReporteSquad", objBeanReporteDispatch);
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}

	@Override
	public List<BeanReporteDispatch> listComboTorre(BeanReporteDispatch objBeanReporteDispatch, SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getComboTorre", objBeanReporteDispatch);
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}

	@Override
	public List<BeanReporteDispatch> listReporteDispatchHorarioOficina_barras(BeanReporteDispatch objBeanReporteDispatch, SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getReporteHorarioOficina_barras", objBeanReporteDispatch);
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}

	@Override
	public List<BeanReporteDispatch> listReporteDispatchSquad_barras(BeanReporteDispatch objBeanReporteDispatch, SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getReporteSquad_barras", objBeanReporteDispatch);
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}

	@Override
	public List<BeanReporteDispatch> listReporteDispatchEspecialista_2_barras(BeanReporteDispatch objBeanReporteDispatch, SqlSession session) {
	    List<BeanReporteDispatch> listReporteDispatch = null;
	    try {
	    	listReporteDispatch = session.selectList("reporteDispatch.getReporteEspecialista_2_barras", objBeanReporteDispatch);
	    }catch(Exception ex) {
	    	listReporteDispatch = null;
	    	System.out.println(ex.getCause().getMessage());
	    }
		return listReporteDispatch;
	}

	@Override
	public List<BeanReporteDispatch> listReporteDispatchEspecialista_1_barras(BeanReporteDispatch objBeanReporteDispatch, SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getReporteEspecialista_1_barras", objBeanReporteDispatch);
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}

	@Override
	public List<BeanReporteDispatch> listReporteDispatchResolucionSemanal(BeanReporteDispatch objBeanReporteDispatch, SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getReporteResolucionSemanal", objBeanReporteDispatch);
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}

	@Override
	public List<BeanReporteDispatch> listReporteDispatchMensualSquad(BeanReporteDispatch objBeanReporteDispatch, SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getReporteMensualSquad", objBeanReporteDispatch);
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}

	@Override
	public List<BeanReporteDispatch> listReporteDispatchMensualHoras(BeanReporteDispatch objBeanReporteDispatch, SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getReporteMensualHorarioOficina", objBeanReporteDispatch);
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}
@Override
	public List<BeanReporteDispatch> listReporteMesActual(BeanReporteDispatch objBeanReporteDispatch,
			SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getReporteMesActual", objBeanReporteDispatch);
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}

	@Override
	public List<BeanReporteDispatch> listReporteMesActualHorario(BeanReporteDispatch objBeanReporteDispatch,
			SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getReporteMesActualHorario", objBeanReporteDispatch);
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}

	@Override
	public List<BeanReporteDispatch> listTendenciaResolucion(BeanReporteDispatch objBeanReporteDispatch,
			SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getTendenciaResolucion", objBeanReporteDispatch);
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}

	@Override
	public List<BeanReporteDispatch> listGrupoResolutor(SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getGrupoResolutor");
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}

	@Override
	public List<BeanReporteDispatch> listReporteEspecialistaClase(BeanReporteDispatch objBeanReporteDispatch,
			SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getReporteEspecialistaClase",objBeanReporteDispatch);
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}

	@Override
	public List<BeanReporteDispatch> listReporteEspecialistaHorario(BeanReporteDispatch objBeanReporteDispatch,
			SqlSession session) {
		List<BeanReporteDispatch> listReporteDispatch = null;
		try {
			listReporteDispatch = session.selectList("reporteDispatch.getReporteEspecialistaHorario",objBeanReporteDispatch);
		}catch(Exception ex) {
			listReporteDispatch = null;
			System.out.println(ex.getCause().getMessage());
		}
		return listReporteDispatch;
	}
	
}
