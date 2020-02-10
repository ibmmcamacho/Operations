package com.pe.ibm.interfac;

import com.pe.ibm.bean.BeanBusqueda;
import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.WorkOrder;
import com.pe.ibm.bean.BeanParameters;

import java.util.List;

import org.apache.ibatis.session.SqlSession;


public interface DaoMaximoView {
	/*R E T U R N S*/
	public BeanMaximo ticketsCount(BeanMaximo beanMaximo, SqlSession sqlSession);	
	
	public List<BeanMaximo> clientTicketsSLA(BeanMaximo beanMaximo, SqlSession sqlSession);
	
	public List<BeanMaximo> ownersTicketsAssistance(BeanMaximo beanMaximo, SqlSession sqlSession);
	
	public List<BeanMaximo> ownersTicketsView(BeanMaximo beanMaximo, SqlSession sqlSession);
	
	public List<BeanParameters> listEyS(BeanParameters beanParameters, SqlSession sqlSession);	
	
	public List<BeanMaximo> modalticketacum(BeanMaximo beanMaximo, SqlSession sqlSession);

	public List<BeanMaximo> modalticketsinasig(BeanMaximo beanMaximo, SqlSession sqlSession);
	
	public List<BeanMaximo> modalticketprioridad(BeanMaximo beanMaximo, SqlSession sqlSession);
	
	public List<BeanMaximo> Tabla1(BeanMaximo beanMaximo, SqlSession sqlSession);
	
	public List<BeanMaximo> Tabla2(BeanMaximo beanMaximo, SqlSession sqlSession);
	
	public List<BeanMaximo> Tabla3(BeanMaximo beanMaximo, SqlSession sqlSession);
	
	public List<BeanMaximo> ListarGrupoWO(BeanMaximo beanMaximo, SqlSession sqlSession);
	
	
	
//	C	O	M	B	O	S
	public List<BeanMaximo> selectSquad(BeanMaximo beanMaximo, SqlSession sqlSession);
	
	public List<BeanMaximo> selectClient(BeanMaximo beanMaximo, SqlSession sqlSession);
	
	public List<BeanMaximo> selectGroupOwner(BeanMaximo beanMaximo, SqlSession sqlSession);
	
	public List<BeanMaximo> selectOwner(BeanMaximo beanMaximo, SqlSession sqlSession);
	
	

	public List<BeanMaximo> modalVigentesDao(BeanMaximo beanMaximo, SqlSession sqlSession);
	
	public List<BeanMaximo> modalVencidosDao(BeanMaximo beanMaximo, SqlSession sqlSession);

	public List<BeanMaximo> UserGrade(BeanMaximo beanMaximo, SqlSession sqlSession);
}
