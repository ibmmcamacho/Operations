package com.pe.ibm.bean;

import java.util.Map;

public class BeanSession {

	private BeanEmpleado objBeanPersonal;
	private String strMessage;
	private boolean resultado;
	private String strIdConversationWatson = "";
	private Map contextConversationWatson = null;
	
	
	public BeanSession(){}

	public BeanSession(BeanEmpleado objBeanPersonal, String strMessage, boolean resultado) {
//		super();
		this.objBeanPersonal = objBeanPersonal;
		this.strMessage = strMessage;
		this.resultado = resultado;
	}

	public BeanEmpleado getObjBeanPersonal() {
		return objBeanPersonal;
	}


	public void setObjBeanPersonal(BeanEmpleado objBeanPersonal) {
		this.objBeanPersonal = objBeanPersonal;
	}


	public String getStrMessage() {
		return strMessage;
	}


	public void setStrMessage(String strMessage) {
		this.strMessage = strMessage;
	}


	public boolean isResultado() {
		return resultado;
	}


	public void setResultado(boolean resultado) {
		this.resultado = resultado;
	}

	public String getStrIdConversationWatson() {
		return strIdConversationWatson;
	}

	public void setStrIdConversationWatson(String strIdConversationWatson) {
		this.strIdConversationWatson = strIdConversationWatson;
	}

	public Map getContextConversationWatson() {
		return contextConversationWatson;
	}

	public void setContextConversationWatson(Map contextConversationWatson) {
		this.contextConversationWatson = contextConversationWatson;
	}
	
}
