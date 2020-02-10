package com.pe.ibm.test;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.util.MyBatisUtil;
import com.pe.ibm.ws.WsMaximo;

public class testWSMaximoMobility {

	public static void main(String[] args){
		WsMaximo objws = new WsMaximo();
		
		StringBuilder strJson1 = new StringBuilder();
		
		SqlSessionFactory ssf;
		ssf = new MyBatisUtil().getSqlSessionFactory();
		
		try{
			WsMaximo objWsMaximo = new WsMaximo();
			BeanSession objBeanSession = new BeanSession();
			BeanEmpleado objEmpleado = new BeanEmpleado();
			objEmpleado.setStrIdLogin("mcamacho@pe.ibm.com");
			objEmpleado.setStrClave("");
			objEmpleado.setiTeam(1);
			objBeanSession.setObjBeanPersonal(objEmpleado);
			
//			objBeanSession.getObjBeanPersonal().setStrIdLogin("mcamacho@pe.ibm.com");
//			objBeanSession.getObjBeanPersonal().setStrClave("mcamacho02MC");
			
			List<BeanMaximo> objBeanMaximo = objWsMaximo.wsConsultarUltimo30TicketsCreados(objBeanSession, ssf);
			System.out.println(objBeanMaximo.toString());
		}
		catch(Exception ex){
			System.out.println(ex.toString());
		}
	}
	
	
}
