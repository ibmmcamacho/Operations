package com.pe.ibm.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanPerfilDet;
import com.pe.ibm.bean.BeanRCT;
import com.pe.ibm.interfac.DaoRCT;

public class DaoRCTImpl implements DaoRCT{
	
	@Override
	public List<BeanRCT> listarRCT(BeanRCT bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanRCT> lista = new ArrayList<BeanRCT>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperSchedule.listarRCT", bean);
				}else{ 	
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	@Override
	public List<BeanRCT> listarActividades(BeanRCT bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanRCT> lista = new ArrayList<BeanRCT>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperSchedule.listarActividades", bean);
				}else{ 	
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	@Override
	public List<BeanRCT> listarRCTDETALLE(BeanRCT bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanRCT> lista = new ArrayList<BeanRCT>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperSchedule.listRCTDetalleModal", bean);
				}else{ 	
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	@Override
	public List<BeanRCT> listarSchedulePorUsuario(BeanRCT bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanRCT> lista = new ArrayList<BeanRCT>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperSchedule.listarSchedulePorUsuario", bean);
				}else{ 	
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	@Override
	public int saveRCT(BeanRCT bean, SqlSession session) {		
		int icount = 0;
		try{
						icount = session.insert("com.pe.ibm.access.MapperSchedule.saveRCT", bean);
						icount = session.insert("com.pe.ibm.access.MapperSchedule.actividadEstado4", bean);
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}
	
	
	@Override
	public int GuardarModalActividad(BeanRCT bean, SqlSession session) {		
		int icount = 0;
		try{
						icount = session.insert("com.pe.ibm.access.MapperSchedule.guardarmodalactividad", bean);
						icount = session.insert("com.pe.ibm.access.MapperSchedule.guardarmodalactividadNotificacion", bean);
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}
	
	@Override
	public int guardarDetalleDesc(BeanRCT bean, SqlSession session) {		
		int icount = 0;
		try{
						icount = session.insert("com.pe.ibm.access.MapperSchedule.guardarDetalleDesc", bean);
						icount = session.insert("com.pe.ibm.access.MapperSchedule.guardarUltimoUsuarioRCT", bean);
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}
	
	@Override
	public int eliminarRCTDETALLE(BeanRCT bean, SqlSession session) {		
		int icount = 0;
		try{
						icount = session.insert("com.pe.ibm.access.MapperSchedule.eliminarRCTDETALLE", bean);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}
	
	
	@Override
	public int editarDescripcionAnuncio(BeanRCT bean, SqlSession session) {		
		int icount = 0;
		try{
						icount = session.insert("com.pe.ibm.access.MapperSchedule.editarDescripcionAnuncio", bean);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}
	
	@Override
	public int saveActividadSchedule(BeanRCT bean, SqlSession session) {		
		int icount = 0;
		try{
						icount = session.insert("com.pe.ibm.access.MapperSchedule.saveNuevoActividad", bean);
						icount = session.insert("com.pe.ibm.access.MapperSchedule.saveRCTupdate", bean);
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}
	
	@Override
	public int actualizarRCTactividad(BeanRCT bean, SqlSession session) {		
		int icount = 0;
		try{
						icount = session.insert("com.pe.ibm.access.MapperSchedule.actualizarRCTactividad", bean);
						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}
	
	
	@Override
	public List<BeanRCT> listarMCliente(BeanRCT bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanRCT> lista = new ArrayList<BeanRCT>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperSchedule.listarMCliente", bean);
				}else{ 	
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	@Override
	public List<BeanRCT> listarMServidor(BeanRCT bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanRCT> lista = new ArrayList<BeanRCT>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperSchedule.listarMServidor", bean);
				}else{ 	
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	@Override
	public List<BeanRCT> listarMTurno(BeanRCT bean, SqlSession sqlSession) {
		// TODO Auto-generated method stub
		List<BeanRCT> lista = new ArrayList<BeanRCT>();
	
			try {
				if(sqlSession!=null){
					lista = sqlSession.selectList("com.pe.ibm.access.MapperSchedule.listarMTurno", bean);
				}else{ 	
					System.err.println("no hay conexión");
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				sqlSession.rollback();
			}
		
		return lista;
	}
	
	@Override
	public int finalizarRCT(BeanRCT bean, SqlSession session) {		
		int icount = 0;
		try{
						icount = session.insert("com.pe.ibm.access.MapperSchedule.finalizarRCT", bean);
						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}
	
	
	
}
