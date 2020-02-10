package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.interfac.DaoOptions;

public class DaoOptionsImpl implements DaoOptions {

	@Override
	public List<BeanOptions> listOptions(BeanParameters pobjBeanParameter, SqlSession session) {
		List<BeanOptions> lstBeanOptions = null;
		try{
						lstBeanOptions = session.selectList("options.getOptions",pobjBeanParameter);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}
		return lstBeanOptions;
	}
	
	@Override
	public List<BeanOptions> listOptionsImage(BeanParameters pobjBeanParameter, SqlSession session) {
		List<BeanOptions> lstBeanOptions = null;
		try{
						lstBeanOptions = session.selectList("options.getOptionsImage",pobjBeanParameter);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanOptions;
	}

	@Override
	public int saveOptions(BeanOptions pBeanOptions, SqlSession session) {
		int icount = 0;
		try{
						icount = session.insert("options.saveOption", pBeanOptions);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

	@Override
	public int updateOptions(BeanOptions pBeanOptions, SqlSession session) {
		int icount = 0;
		try{
						icount = session.insert("options.updateOption", pBeanOptions);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

	@Override
	public int deleteOptions(BeanOptions pBeanOptions, SqlSession session) {
		int icount = 0;
		try{
						icount = session.insert("options.deleteOption", pBeanOptions);						
			}
			catch(Exception ex){
				icount = 0;
				System.out.println(ex.getCause().getMessage());
			}
		
		return icount;
	}

	@Override
	public List<BeanOptions> listType(BeanParameters pobjBeanParameter, SqlSession session) {
		List<BeanOptions> lstBeanOptions = null;
		try{
						lstBeanOptions = session.selectList("options.getType",pobjBeanParameter);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanOptions;
	}


	@Override
	public List<BeanOptions> listOptions2(BeanParameters pobjBeanParameter, SqlSession session) {
		List<BeanOptions> lstBeanOptions = null;
		try{
						lstBeanOptions = session.selectList("options.getOptions2",pobjBeanParameter);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}
		return lstBeanOptions;
	}
	
	@Override
	public List<BeanOptions> listOptions3(BeanParameters pobjBeanParameter, SqlSession session) {
		List<BeanOptions> lstBeanOptions = null;
		try{
						lstBeanOptions = session.selectList("options.getOptions3",pobjBeanParameter);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}
		return lstBeanOptions;
	}
	
	@Override
	public List<BeanOptions> listOptions3_(BeanParameters pobjBeanParameter, SqlSession session) {
		List<BeanOptions> lstBeanOptions = null;
		try{
						lstBeanOptions = session.selectList("options.getOptions3_",pobjBeanParameter);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}
		return lstBeanOptions;
	}

	@Override
	public List<BeanOptions> listOptions4(BeanParameters pobjBeanParameter, SqlSession session) {
		List<BeanOptions> lstBeanOptions = null;
		try{
						lstBeanOptions = session.selectList("options.getOptions4",pobjBeanParameter);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}
		return lstBeanOptions;
	}

	@Override
	public List<BeanOptions> listOptions5(BeanParameters pobjBeanParameter, SqlSession session) {
		List<BeanOptions> lstBeanOptions = null;
		try{
						lstBeanOptions = session.selectList("options.getOptions5",pobjBeanParameter);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}
		return lstBeanOptions;
	}
	
	@Override
	public List<BeanOptions> listOptions6(BeanParameters pobjBeanParameter, SqlSession session) {
		// TODO Auto-generated method stub
		List<BeanOptions> lstBeanOptions = null;
		try{
						lstBeanOptions = session.selectList("options.getOptions6",pobjBeanParameter);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}
		return lstBeanOptions;
	}
	
	@Override
	public List<BeanOptions> listOptions7(BeanParameters pobjBeanParameter, SqlSession session) {
		// TODO Auto-generated method stub
		List<BeanOptions> lstBeanOptions = null;
		try{
						lstBeanOptions = session.selectList("options.getOptions7",pobjBeanParameter);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}
		return lstBeanOptions;
	}

	@Override
	public BeanParameters listCalculoTiempo(BeanMaximo pobjBeanMaximo, SqlSession session) {
		BeanParameters objBeanParameters = null;
		try{
			objBeanParameters = session.selectOne("options.getCalculoTiempoSolucion",pobjBeanMaximo);
			}
			catch(Exception ex){
				objBeanParameters = null;
				System.out.println(ex.getCause().getMessage());
			}
		return objBeanParameters;
	}
@Override
	public List<BeanOptions> listOptionsAnioClaim(BeanParameters pobjBeanParameter, SqlSession session) {
		List<BeanOptions> lstBeanOptions = null;
		try{
						lstBeanOptions = session.selectList("options.getOptionsAnioClaim",pobjBeanParameter);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}
		return lstBeanOptions;
	}

	@Override
	public List<BeanOptions> listOptionsFechaClaim(BeanParameters pobjBeanParameter, SqlSession session) {
		List<BeanOptions> lstBeanOptions = null;
		try{
						lstBeanOptions = session.selectList("options.getOptionsFechaClaim",pobjBeanParameter);
			}
			catch(Exception ex){
				lstBeanOptions = null;
				System.out.println(ex.getCause().getMessage());
			}
		return lstBeanOptions;
	}
	
}