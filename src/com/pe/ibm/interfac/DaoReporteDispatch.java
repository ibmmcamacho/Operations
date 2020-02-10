package com.pe.ibm.interfac;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanReporteDispatch;

public interface DaoReporteDispatch {
	
	public List<BeanReporteDispatch> listReporteDispatch(BeanReporteDispatch pBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listReporteCriteria(BeanReporteDispatch pBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> list(BeanReporteDispatch pBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listTeam(BeanReporteDispatch pBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listCliente(BeanReporteDispatch pBeanReporteDispatch, SqlSession session);
	
	public List<BeanReporteDispatch> listGrupoResolutor(SqlSession session);
	public List<BeanReporteDispatch> listReporteMesActual(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listReporteMesActualHorario(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listTendenciaResolucion(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
	
	public List<BeanReporteDispatch> listReporteEspecialistaClase(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listReporteEspecialistaHorario(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
	
	
	public List<BeanReporteDispatch> listReporteDispatchEspecialista_1(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listReporteDispatchEspecialista_2(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listReporteDispatchHorarioOficina(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listReporteDispatchSquad(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listComboTorre(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listReporteDispatchHorarioOficina_barras(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listReporteDispatchSquad_barras(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listReporteDispatchEspecialista_2_barras(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listReporteDispatchEspecialista_1_barras(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listReporteDispatchResolucionSemanal(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listReporteDispatchMensualSquad(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
	public List<BeanReporteDispatch> listReporteDispatchMensualHoras(BeanReporteDispatch objBeanReporteDispatch, SqlSession session);
}
