package com.pe.ibm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.interfac.DaoReg;

public class DaoRegImpl implements DaoReg {

	@Override
	public BeanSession reg(BeanParameters pobjBeanParameters, SqlSession session) {
		
		BeanEmpleado objBeanPersonal = null;
		BeanSession objBeanSession = null;
		try{
 			BeanParameters objBeanParameters = pobjBeanParameters;
					if(objBeanParameters.getStrType().equals("in"))
						objBeanPersonal = session.selectOne("etime.getUsuarioConectado",objBeanParameters);
					
					if(objBeanPersonal == null )
					{
						int val = 0;
						if(objBeanParameters.getStrType().equals("in"))
							if(objBeanParameters.getiValor1() > 0)
								val = session.insert("etime.saveRegIn", objBeanParameters);
							else
								val = session.insert("etime.saveRegIn2", objBeanParameters);
						else if(objBeanParameters.getStrType().equals("out"))
							val = session.update("etime.updateRegOut",objBeanParameters);
						
						System.out.println("valor: " + val);
						if(val > 0){
							objBeanPersonal = session.selectOne("etime.getUsuario",objBeanParameters);
							objBeanSession = new BeanSession(objBeanPersonal, "ok",true);
						}
						else
							objBeanSession = new BeanSession(objBeanPersonal, "fail",true);
					}
					else
						objBeanSession = new BeanSession(objBeanPersonal, "fail",true);
			}
			catch(Exception ex){
				objBeanSession = new BeanSession(objBeanPersonal,ex.getCause().toString(),false);
				System.out.println(ex.getCause().getMessage());
				System.out.println(ex);
				
				System.out.println("strIdLogin " + pobjBeanParameters.getStrIdLogin() + " | " +
				"iTeam: " + pobjBeanParameters.getiTeam() + " | " + 
				"strdate1: " + pobjBeanParameters.getStrdate1() + " | " + 
				"strObs: " + pobjBeanParameters.getStrObs() + " | " + 
				"strIp: " + pobjBeanParameters.getStrIp() + " | " + 
				"strSo: " + pobjBeanParameters.getStrSo() + " | " + 
				"strBrowser: " + pobjBeanParameters.getStrBrowser() + " | " + 
				"strHostname: " + pobjBeanParameters.getStrHostname() + " | " + 
				"iIdEmpleado: " + pobjBeanParameters.getiIdEmpleado());
				
			}
//		finally {
//			session.close();
//		}
		return objBeanSession;
	}

	@Override
	public List<BeanParameters> listHours(BeanParameters objParameters, SqlSession session) {
		List<BeanParameters> lstBeanParameters = null;
		try{
						lstBeanParameters = session.selectList("etime.getHours", objParameters);
			}
			catch(Exception ex){
				lstBeanParameters = null;
				System.out.println(ex.getCause().getMessage());
			}	
		return lstBeanParameters;
	}

	@Override
	public List<BeanParameters> listUsuariosConectados(BeanParameters objParameters, SqlSession session) {
		List<BeanParameters> lstBeanParameters = null;
			try{
						lstBeanParameters = session.selectList("etime.getUsuariosConectados", objParameters);
			}
			catch(Exception ex){
				lstBeanParameters = null;
				System.out.println(ex.getCause().getMessage());
			}finally {
				session.close();
			}
		return lstBeanParameters;
	}

	@Override
	public BeanParameters getHorarioEmpleado(BeanParameters objParameters, SqlSession session) {
		BeanParameters objBeanParameters = null;
		try{
					objBeanParameters = session.selectOne("etime.getHorarioEmpleado", objParameters);
		}
		catch(Exception ex){
			objBeanParameters = null;
			System.out.println(ex.getCause().getMessage());
		}finally {
			session.close();
		}
	return objBeanParameters;
	}
	
}