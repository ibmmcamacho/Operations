package com.pe.ibm.bean;

public class BeanUAT {
	
	int iIdRequerimiento = 0;
	String strTipoRequerimiento = "";
	String strIdTicket = "";
	String strIdCar = "";
	String strHostname = "";
	String strAmbiente = "";
	String strPlataforma = "";
	String strUsuarioC = "";
	String strUsuarioM = "";
	String strFechaM = "";
	String strEstado = "";
	String strMensaje = "";
	String strCliente = "";
	String strSystem = "";
	String strSo = "";
	String strFechaVenc = "";
	int iTipoRequerimiento = 0;
	int iIdAmbiente = 0;
	int iIdPlataforma = 0;
	int iIdEstado = 0;
	int iIdUsuario = 0;
	int iTipo = 0;
	int inroDisp = 0;
	int inroGrup = 0;
	int inroUsu = 0;
	int inroSha = 0;
	BeanUATDispositivos objDispositivos;
	BeanUATUsuarios objUsuarios;
	BeanUATGrupos objGrupos;
	BeanUATSharedId objSharedId;
	
	public BeanUAT() {}

	public int getiIdRequerimiento() {
		return iIdRequerimiento;
	}

	public void setiIdRequerimiento(int iIdRequerimiento) {
		this.iIdRequerimiento = iIdRequerimiento;
	}

	public String getStrTipoRequerimiento() {
		return strTipoRequerimiento;
	}

	public void setStrTipoRequerimiento(String strTipoRequerimiento) {
		this.strTipoRequerimiento = strTipoRequerimiento;
	}

	public String getStrIdTicket() {
		return strIdTicket;
	}

	public void setStrIdTicket(String strIdTicket) {
		this.strIdTicket = strIdTicket;
	}

	public String getStrIdCar() {
		return strIdCar;
	}

	public void setStrIdCar(String strIdCar) {
		this.strIdCar = strIdCar;
	}

	public String getStrHostname() {
		return strHostname;
	}

	public void setStrHostname(String strHostname) {
		this.strHostname = strHostname;
	}

	public String getStrAmbiente() {
		return strAmbiente;
	}

	public void setStrAmbiente(String strAmbiente) {
		this.strAmbiente = strAmbiente;
	}

	public String getStrPlataforma() {
		return strPlataforma;
	}

	public void setStrPlataforma(String strPlataforma) {
		this.strPlataforma = strPlataforma;
	}

	public String getStrUsuarioC() {
		return strUsuarioC;
	}

	public void setStrUsuarioC(String strUsuarioC) {
		this.strUsuarioC = strUsuarioC;
	}

	public String getStrUsuarioM() {
		return strUsuarioM;
	}

	public void setStrUsuarioM(String strUsuarioM) {
		this.strUsuarioM = strUsuarioM;
	}

	public String getStrFechaM() {
		return strFechaM;
	}

	public void setStrFechaM(String strFechaM) {
		this.strFechaM = strFechaM;
	}

	public String getStrEstado() {
		return strEstado;
	}

	public void setStrEstado(String strEstado) {
		this.strEstado = strEstado;
	}

	public String getStrMensaje() {
		return strMensaje;
	}

	public void setStrMensaje(String strMensaje) {
		this.strMensaje = strMensaje;
	}

	public String getStrCliente() {
		return strCliente;
	}

	public void setStrCliente(String strCliente) {
		this.strCliente = strCliente;
	}

	public String getStrSystem() {
		return strSystem;
	}

	public void setStrSystem(String strSystem) {
		this.strSystem = strSystem;
	}

	public String getStrSo() {
		return strSo;
	}

	public void setStrSo(String strSo) {
		this.strSo = strSo;
	}

	public String getStrFechaVenc() {
		return strFechaVenc;
	}

	public void setStrFechaVenc(String strFechaVenc) {
		this.strFechaVenc = strFechaVenc;
	}

	public int getiTipoRequerimiento() {
		return iTipoRequerimiento;
	}

	public void setiTipoRequerimiento(int iTipoRequerimiento) {
		this.iTipoRequerimiento = iTipoRequerimiento;
	}

	public int getiIdAmbiente() {
		return iIdAmbiente;
	}

	public void setiIdAmbiente(int iIdAmbiente) {
		this.iIdAmbiente = iIdAmbiente;
	}

	public int getiIdPlataforma() {
		return iIdPlataforma;
	}

	public void setiIdPlataforma(int iIdPlataforma) {
		this.iIdPlataforma = iIdPlataforma;
	}

	public int getiIdEstado() {
		return iIdEstado;
	}

	public void setiIdEstado(int iIdEstado) {
		this.iIdEstado = iIdEstado;
	}

	public int getiIdUsuario() {
		return iIdUsuario;
	}

	public void setiIdUsuario(int iIdUsuario) {
		this.iIdUsuario = iIdUsuario;
	}

	public int getiTipo() {
		return iTipo;
	}

	public void setiTipo(int iTipo) {
		this.iTipo = iTipo;
	}

	public int getInroDisp() {
		return inroDisp;
	}

	public void setInroDisp(int inroDisp) {
		this.inroDisp = inroDisp;
	}

	public int getInroGrup() {
		return inroGrup;
	}

	public void setInroGrup(int inroGrup) {
		this.inroGrup = inroGrup;
	}

	public int getInroUsu() {
		return inroUsu;
	}

	public void setInroUsu(int inroUsu) {
		this.inroUsu = inroUsu;
	}

	public int getInroSha() {
		return inroSha;
	}

	public void setInroSha(int inroSha) {
		this.inroSha = inroSha;
	}

	public BeanUATDispositivos getObjDispositivos() {
		return objDispositivos;
	}

	public void setObjDispositivos(BeanUATDispositivos objDispositivos) {
		this.objDispositivos = objDispositivos;
	}

	public BeanUATUsuarios getObjUsuarios() {
		return objUsuarios;
	}

	public void setObjUsuarios(BeanUATUsuarios objUsuarios) {
		this.objUsuarios = objUsuarios;
	}

	public BeanUATGrupos getObjGrupos() {
		return objGrupos;
	}

	public void setObjGrupos(BeanUATGrupos objGrupos) {
		this.objGrupos = objGrupos;
	}

	public BeanUATSharedId getObjSharedId() {
		return objSharedId;
	}

	public void setObjSharedId(BeanUATSharedId objSharedId) {
		this.objSharedId = objSharedId;
	}

}
