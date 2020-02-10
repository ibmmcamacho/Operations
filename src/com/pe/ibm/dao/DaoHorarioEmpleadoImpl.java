package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanHorarioEmpleado;
import com.pe.ibm.interfac.DaoHorarioEmpleado;

public class DaoHorarioEmpleadoImpl implements DaoHorarioEmpleado {

	@Override
	public List<BeanHorarioEmpleado> listHorarioEmpleado(BeanHorarioEmpleado pBeanHorarioEmpleado, SqlSession session) {
		List<BeanHorarioEmpleado> lstBeanHorarioEmpleado = null;
		try{
					lstBeanHorarioEmpleado = session.selectList("horarioEmpleado.getHorarioEmpleados", pBeanHorarioEmpleado);
			}
			catch(Exception ex){
				lstBeanHorarioEmpleado = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanHorarioEmpleado;
	}

	@Override
	public int saveHorario(BeanHorarioEmpleado pBeanHorarioEmpleado, SqlSession session) {
		int icount = 0;
		try{
						icount = session.insert("horarioEmpleado.save", pBeanHorarioEmpleado);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

	@Override
	public int updateHorario(BeanHorarioEmpleado pBeanHorarioEmpleado, SqlSession session) {
		int icount = 0;
		try{
						icount = session.update("horarioEmpleado.update", pBeanHorarioEmpleado);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

	@Override
	public int deleteHorario(BeanHorarioEmpleado pBeanHorarioEmpleado, SqlSession session) {
		int icount = 0;
		try{
						icount = session.delete("horarioEmpleado.delete", pBeanHorarioEmpleado);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

}
