package com.pe.ibm.bean;

import java.util.Date;

public class BeanParameters {

	String strIdLogin;
	String strNombre1;
	String strNombre2;
	String ruta1;
	String strdateE;
	String strdateS;
	String strdate1;
	String strdate2;
	String strdate3;
	String strValor1 = null;
	String strValor2 = null;
	String strValor3 = null;
	String strValor4 = null;
	String strValor5;
	String strType;
	String strTeam;
	String strObs;
	String strIp;
	String strSo;
	String strBrowser;
	String strHostname;
	String strBackLog = null;
	String strResueltos = null;
	
	int iIdEmpleado = 0;
	int iTeam;
	int iValor1;
	int iValor2;
	int iValor3;
	Date objDate = new Date();
	
	public BeanParameters(){}
	
	public BeanParameters(String strValor1, String strType, int iTeam) {
		super();
		this.strValor1 = strValor1;
		this.strType = strType;
		this.iTeam = iTeam;
	}
	
	public BeanParameters(String strIdLogin, String strNombre1, String strNombre2, String ruta1, String strdateE,
			String strdateS, String strdate1, String strdate2, String strValor1, String strValor2, String strValor3,
			String strValor4, String strValor5, String strType, String strTeam, String strObs, String strIp,
			String strSo, String strBrowser, int iIdEmpleado, int iTeam, int iValor1, int iValor2, int iValor3) {
		super();
		this.strIdLogin = strIdLogin;
		this.strNombre1 = strNombre1;
		this.strNombre2 = strNombre2;
		this.ruta1 = ruta1;
		this.strdateE = strdateE;
		this.strdateS = strdateS;
		this.strdate1 = strdate1;
		this.strdate2 = strdate2;
		this.strValor1 = strValor1;
		this.strValor2 = strValor2;
		this.strValor3 = strValor3;
		this.strValor4 = strValor4;
		this.strValor5 = strValor5;
		this.strType = strType;
		this.strTeam = strTeam;
		this.strObs = strObs;
		this.strIp = strIp;
		this.strSo = strSo;
		this.strBrowser = strBrowser;
		this.iIdEmpleado = iIdEmpleado;
		this.iTeam = iTeam;
		this.iValor1 = iValor1;
		this.iValor2 = iValor2;
		this.iValor3 = iValor3;
	}

	public String getStrIdLogin() {
		return strIdLogin;
	}

	public void setStrIdLogin(String strIdLogin) {
		this.strIdLogin = strIdLogin;
	}

	public String getStrNombre1() {
		return strNombre1;
	}

	public void setStrNombre1(String strNombre1) {
		this.strNombre1 = strNombre1;
	}

	public String getStrNombre2() {
		return strNombre2;
	}

	public void setStrNombre2(String strNombre2) {
		this.strNombre2 = strNombre2;
	}

	public String getRuta1() {
		return ruta1;
	}

	public void setRuta1(String ruta1) {
		this.ruta1 = ruta1;
	}

	public String getStrdateE() {
		return strdateE;
	}

	public void setStrdateE(String strdateE) {
		this.strdateE = strdateE;
	}

	public String getStrdateS() {
		return strdateS;
	}

	public void setStrdateS(String strdateS) {
		this.strdateS = strdateS;
	}

	public String getStrdate1() {
		return strdate1;
	}

	public void setStrdate1(String strdate1) {
		this.strdate1 = strdate1;
	}

	public String getStrdate2() {
		return strdate2;
	}

	public void setStrdate2(String strdate2) {
		this.strdate2 = strdate2;
	}

	public String getStrdate3() {
		return strdate3;
	}

	public void setStrdate3(String strdate3) {
		this.strdate3 = strdate3;
	}

	public String getStrValor1() {
		return strValor1;
	}

	public void setStrValor1(String strValor1) {
		this.strValor1 = strValor1;
	}

	public String getStrValor2() {
		return strValor2;
	}

	public void setStrValor2(String strValor2) {
		this.strValor2 = strValor2;
	}

	public String getStrValor3() {
		return strValor3;
	}

	public void setStrValor3(String strValor3) {
		this.strValor3 = strValor3;
	}

	public String getStrValor4() {
		return strValor4;
	}

	public void setStrValor4(String strValor4) {
		this.strValor4 = strValor4;
	}

	public String getStrValor5() {
		return strValor5;
	}

	public void setStrValor5(String strValor5) {
		this.strValor5 = strValor5;
	}

	public String getStrType() {
		return strType;
	}

	public void setStrType(String strType) {
		this.strType = strType;
	}

	public String getStrTeam() {
		return strTeam;
	}

	public void setStrTeam(String strTeam) {
		this.strTeam = strTeam;
	}

	public String getStrObs() {
		return strObs;
	}

	public void setStrObs(String strObs) {
		this.strObs = strObs;
	}

	public String getStrIp() {
		return strIp;
	}

	public void setStrIp(String strIp) {
		this.strIp = strIp;
	}

	public String getStrSo() {
		return strSo;
	}

	public void setStrSo(String strSo) {
		this.strSo = strSo;
	}

	public String getStrBrowser() {
		return strBrowser;
	}

	public void setStrBrowser(String strBrowser) {
		this.strBrowser = strBrowser;
	}

	public String getStrBackLog() {
		return strBackLog;
	}

	public void setStrBackLog(String strBackLog) {
		this.strBackLog = strBackLog;
	}

	public String getStrResueltos() {
		return strResueltos;
	}

	public void setStrResueltos(String strResueltos) {
		this.strResueltos = strResueltos;
	}

	public int getiIdEmpleado() {
		return iIdEmpleado;
	}

	public void setiIdEmpleado(int iIdEmpleado) {
		this.iIdEmpleado = iIdEmpleado;
	}

	public int getiTeam() {
		return iTeam;
	}

	public void setiTeam(int iTeam) {
		this.iTeam = iTeam;
	}

	public int getiValor1() {
		return iValor1;
	}

	public void setiValor1(int iValor1) {
		this.iValor1 = iValor1;
	}

	public int getiValor2() {
		return iValor2;
	}

	public void setiValor2(int iValor2) {
		this.iValor2 = iValor2;
	}

	public int getiValor3() {
		return iValor3;
	}

	public void setiValor3(int iValor3) {
		this.iValor3 = iValor3;
	}

	public Date getObjDate() {
		return objDate;
	}

	public void setObjDate(Date objDate) {
		this.objDate = objDate;
	}

	public String getStrHostname() {
		return strHostname;
	}

	public void setStrHostname(String strHostname) {
		this.strHostname = strHostname;
	}

	@Override
	public String toString() {
		return "BeanParameters [strIdLogin=" + strIdLogin + ", strNombre1=" + strNombre1 + ", strNombre2=" + strNombre2
				+ ", ruta1=" + ruta1 + ", strdateE=" + strdateE + ", strdateS=" + strdateS + ", strdate1=" + strdate1
				+ ", strdate2=" + strdate2 + ", strdate3=" + strdate3 + ", strValor1=" + strValor1 + ", strValor2="
				+ strValor2 + ", strValor3=" + strValor3 + ", strValor4=" + strValor4 + ", strValor5=" + strValor5
				+ ", strType=" + strType + ", strTeam=" + strTeam + ", strObs=" + strObs + ", strIp=" + strIp
				+ ", strSo=" + strSo + ", strBrowser=" + strBrowser + ", strHostname=" + strHostname + ", strBackLog="
				+ strBackLog + ", strResueltos=" + strResueltos + ", iIdEmpleado=" + iIdEmpleado + ", iTeam=" + iTeam
				+ ", iValor1=" + iValor1 + ", iValor2=" + iValor2 + ", iValor3=" + iValor3 + ", objDate=" + objDate
				+ "]";
	}
	
	
	
}