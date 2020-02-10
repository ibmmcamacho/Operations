package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.interfac.DaoMaximoWH;

public class DaoMaximoWHImpl implements DaoMaximoWH {

	@Override
	public List<BeanMaximo> getTendenciaActual(BeanParameters objBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getTendenciaActual",objBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}
	
	@Override
	public List<BeanMaximo> getPaises(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getPaises",pobjBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());

		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> getClientes(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getClientes",pobjBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> getMensual(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getMensual",pobjBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> getDiario(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getDiario",pobjBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}
	
	@Override
	public List<BeanMaximo> getEstados(BeanParameters objBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getEstados",objBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}
	
	@Override
	public List<BeanMaximo> getTicketsPaises(BeanParameters objBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getTicketsPaises",objBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> getTicketsClientes(BeanParameters objBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getTicketsClientes",objBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> getTicketsMensual(BeanParameters objBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getTicketsMensual",objBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> getTicketsDiario(BeanParameters objBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getTicketsDiario",objBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> getTicketsEstados(BeanParameters objBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getTicketsEstados",objBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> getTicketsTendenciaActual(BeanParameters objBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getTicketsTendenciaActual",objBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<BeanMaximo> getTICKET_INCSRS(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getTICKET_INCSRS",pobjBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> getTICKET_INCSRS_BACKLOG(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getTICKET_INCSRS_BACKLOG",pobjBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> getTICKET_PRO(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getTICKET_PRO",pobjBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> getTICKET_PRO_BACKLOG(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getTICKET_PRO_BACKLOG",pobjBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> getTICKET_WORKORDER_CAN(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getTICKET_WORKORDER_CAN",pobjBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> getWORKORDER_CHAWORACT(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getWORKORDER_CHAWORACT",pobjBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> getWORKORDER_CHAWORACT_BACKLOG(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getWORKORDER_CHAWORACT_BACKLOG",pobjBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> getBacklogGSP(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getBacklogGSP",pobjBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	@Override
	public List<BeanMaximo> getCiscoMesa(BeanParameters pobjBeanParameters, SqlSession session) {
		List<BeanMaximo> lstBeanMaximo = null;
		try{
				lstBeanMaximo =session.selectList("maximoWH.getCiscoMesa",pobjBeanParameters);
		}
		catch(Exception ex){
			System.out.println(ex.getCause().getMessage());
		}
		return lstBeanMaximo;
	}

	



	

	

	
}
