package com.pe.ibm.bean;

import java.util.Arrays;

public class BeanReporteDispatch {

int iTicketsIC;
	int iTicketsP;
	int iTicketsOC;
	int iIncident;
	int iProblem;
	int iSr;
	int iChange;
	int iWorkOrder;
	int iActivity;
	int iNoAplica;
	int iTotal;
	String strSquad;
	String strHorarioOficina;
	int iPrioridad;
	int iHrsVencidas;
	String strClienteId;
	String strCliente;
	String strTicket;
	String strOwnerId;
	String strOwner;
	String strEstado;
	String strTipo;
	String strTiempoRestante;
	String strStatus;
	String sCDate;
	String strClase;
	String strUniqueid;

	Double iHorasVencer;
	String tipoA[];
	int idTipo;
	String strTeam;
	String strCodTeam;
	String pais;
	String squad;

	String strSummary;
	String strDetails;
	String strCreatorId;
	String strCreator;
	String strCreatorGroup;
	String strReported;
	String strAffectedPerson;
	String strCi;
	String strCiName;
	String strCiEnvironment;
	String strLocationId;
	String strLocation;
	String strParentClientId;
	String strParentClient;
	
	String strOwnerGroupId;
	String strOwnerGroup;
	String strTorre;
	String strFechaClaim;
	String strResolutorGroup;
	String strResolutorGroupId;
	
	String strFechaActual;
	String strFechaInicio;
	String strFechaFin;
	String strFechaUnicaInicio;
	
	public BeanReporteDispatch() {}

	public int getiTicketsIC() {
		return iTicketsIC;
	}

	public void setiTicketsIC(int iTicketsIC) {
		this.iTicketsIC = iTicketsIC;
	}

	public int getiTicketsP() {
		return iTicketsP;
	}

	public void setiTicketsP(int iTicketsP) {
		this.iTicketsP = iTicketsP;
	}

	public int getiTicketsOC() {
		return iTicketsOC;
	}

	public void setiTicketsOC(int iTicketsOC) {
		this.iTicketsOC = iTicketsOC;
	}

	public int getiIncident() {
		return iIncident;
	}

	public void setiIncident(int iIncident) {
		this.iIncident = iIncident;
	}

	public int getiProblem() {
		return iProblem;
	}

	public void setiProblem(int iProblem) {
		this.iProblem = iProblem;
	}

	public int getiSr() {
		return iSr;
	}

	public void setiSr(int iSr) {
		this.iSr = iSr;
	}

	public int getiChange() {
		return iChange;
	}

	public void setiChange(int iChange) {
		this.iChange = iChange;
	}

	public int getiWorkOrder() {
		return iWorkOrder;
	}

	public void setiWorkOrder(int iWorkOrder) {
		this.iWorkOrder = iWorkOrder;
	}

	public int getiActivity() {
		return iActivity;
	}

	public void setiActivity(int iActivity) {
		this.iActivity = iActivity;
	}

	public int getiNoAplica() {
		return iNoAplica;
	}

	public void setiNoAplica(int iNoAplica) {
		this.iNoAplica = iNoAplica;
	}

	public int getiTotal() {
		return iTotal;
	}

	public void setiTotal(int iTotal) {
		this.iTotal = iTotal;
	}

	public String getStrSquad() {
		return strSquad;
	}

	public void setStrSquad(String strSquad) {
		this.strSquad = strSquad;
	}

	public String getStrHorarioOficina() {
		return strHorarioOficina;
	}

	public void setStrHorarioOficina(String strHorarioOficina) {
		this.strHorarioOficina = strHorarioOficina;
	}

	public int getiPrioridad() {
		return iPrioridad;
	}

	public void setiPrioridad(int iPrioridad) {
		this.iPrioridad = iPrioridad;
	}

	public int getiHrsVencidas() {
		return iHrsVencidas;
	}

	public void setiHrsVencidas(int iHrsVencidas) {
		this.iHrsVencidas = iHrsVencidas;
	}

	public String getStrClienteId() {
		return strClienteId;
	}

	public void setStrClienteId(String strClienteId) {
		this.strClienteId = strClienteId;
	}

	public String getStrCliente() {
		return strCliente;
	}

	public void setStrCliente(String strCliente) {
		this.strCliente = strCliente;
	}

	public String getStrTicket() {
		return strTicket;
	}

	public void setStrTicket(String strTicket) {
		this.strTicket = strTicket;
	}

	public String getStrOwnerId() {
		return strOwnerId;
	}

	public void setStrOwnerId(String strOwnerId) {
		this.strOwnerId = strOwnerId;
	}

	public String getStrOwner() {
		return strOwner;
	}

	public void setStrOwner(String strOwner) {
		this.strOwner = strOwner;
	}

	public String getStrEstado() {
		return strEstado;
	}

	public void setStrEstado(String strEstado) {
		this.strEstado = strEstado;
	}

	public String getStrTipo() {
		return strTipo;
	}

	public void setStrTipo(String strTipo) {
		this.strTipo = strTipo;
	}

	public String getStrTiempoRestante() {
		return strTiempoRestante;
	}

	public void setStrTiempoRestante(String strTiempoRestante) {
		this.strTiempoRestante = strTiempoRestante;
	}

	public String getStrStatus() {
		return strStatus;
	}

	public void setStrStatus(String strStatus) {
		this.strStatus = strStatus;
	}

	public String getsCDate() {
		return sCDate;
	}

	public void setsCDate(String sCDate) {
		this.sCDate = sCDate;
	}

	public String getStrClase() {
		return strClase;
	}

	public void setStrClase(String strClase) {
		this.strClase = strClase;
	}

	public String getStrUniqueid() {
		return strUniqueid;
	}

	public void setStrUniqueid(String strUniqueid) {
		this.strUniqueid = strUniqueid;
	}

	public Double getiHorasVencer() {
		return iHorasVencer;
	}

	public void setiHorasVencer(Double iHorasVencer) {
		this.iHorasVencer = iHorasVencer;
	}

	public String[] getTipoA() {
		return tipoA;
	}

	public void setTipoA(String[] tipoA) {
		this.tipoA = tipoA;
	}

	public int getIdTipo() {
		return idTipo;
	}

	public void setIdTipo(int idTipo) {
		this.idTipo = idTipo;
	}

	public String getStrTeam() {
		return strTeam;
	}

	public void setStrTeam(String strTeam) {
		this.strTeam = strTeam;
	}

	public String getStrCodTeam() {
		return strCodTeam;
	}

	public void setStrCodTeam(String strCodTeam) {
		this.strCodTeam = strCodTeam;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getSquad() {
		return squad;
	}

	public void setSquad(String squad) {
		this.squad = squad;
	}

	public String getStrSummary() {
		return strSummary;
	}

	public void setStrSummary(String strSummary) {
		this.strSummary = strSummary;
	}

	public String getStrDetails() {
		return strDetails;
	}

	public void setStrDetails(String strDetails) {
		this.strDetails = strDetails;
	}

	public String getStrCreatorId() {
		return strCreatorId;
	}

	public void setStrCreatorId(String strCreatorId) {
		this.strCreatorId = strCreatorId;
	}

	public String getStrCreator() {
		return strCreator;
	}

	public void setStrCreator(String strCreator) {
		this.strCreator = strCreator;
	}

	public String getStrCreatorGroup() {
		return strCreatorGroup;
	}

	public void setStrCreatorGroup(String strCreatorGroup) {
		this.strCreatorGroup = strCreatorGroup;
	}

	public String getStrReported() {
		return strReported;
	}

	public void setStrReported(String strReported) {
		this.strReported = strReported;
	}

	public String getStrAffectedPerson() {
		return strAffectedPerson;
	}

	public void setStrAffectedPerson(String strAffectedPerson) {
		this.strAffectedPerson = strAffectedPerson;
	}

	public String getStrCi() {
		return strCi;
	}

	public void setStrCi(String strCi) {
		this.strCi = strCi;
	}

	public String getStrCiName() {
		return strCiName;
	}

	public void setStrCiName(String strCiName) {
		this.strCiName = strCiName;
	}

	public String getStrCiEnvironment() {
		return strCiEnvironment;
	}

	public void setStrCiEnvironment(String strCiEnvironment) {
		this.strCiEnvironment = strCiEnvironment;
	}

	public String getStrLocationId() {
		return strLocationId;
	}

	public void setStrLocationId(String strLocationId) {
		this.strLocationId = strLocationId;
	}

	public String getStrLocation() {
		return strLocation;
	}

	public void setStrLocation(String strLocation) {
		this.strLocation = strLocation;
	}

	public String getStrParentClientId() {
		return strParentClientId;
	}

	public void setStrParentClientId(String strParentClientId) {
		this.strParentClientId = strParentClientId;
	}

	public String getStrParentClient() {
		return strParentClient;
	}

	public void setStrParentClient(String strParentClient) {
		this.strParentClient = strParentClient;
	}

	public String getStrOwnerGroupId() {
		return strOwnerGroupId;
	}

	public void setStrOwnerGroupId(String strOwnerGroupId) {
		this.strOwnerGroupId = strOwnerGroupId;
	}

	public String getStrOwnerGroup() {
		return strOwnerGroup;
	}

	public void setStrOwnerGroup(String strOwnerGroup) {
		this.strOwnerGroup = strOwnerGroup;
	}

	public String getStrTorre() {
		return strTorre;
	}

	public void setStrTorre(String strTorre) {
		this.strTorre = strTorre;
	}

	public String getStrFechaClaim() {
		return strFechaClaim;
	}

	public void setStrFechaClaim(String strFechaClaim) {
		this.strFechaClaim = strFechaClaim;
	}

	public String getStrResolutorGroup() {
		return strResolutorGroup;
	}

	public void setStrResolutorGroup(String strResolutorGroup) {
		this.strResolutorGroup = strResolutorGroup;
	}

	public String getStrResolutorGroupId() {
		return strResolutorGroupId;
	}

	public void setStrResolutorGroupId(String strResolutorGroupId) {
		this.strResolutorGroupId = strResolutorGroupId;
	}

	public String getStrFechaActual() {
		return strFechaActual;
	}

	public void setStrFechaActual(String strFechaActual) {
		this.strFechaActual = strFechaActual;
	}

	public String getStrFechaInicio() {
		return strFechaInicio;
	}

	public void setStrFechaInicio(String strFechaInicio) {
		this.strFechaInicio = strFechaInicio;
	}

	public String getStrFechaFin() {
		return strFechaFin;
	}

	public void setStrFechaFin(String strFechaFin) {
		this.strFechaFin = strFechaFin;
	}

	public String getStrFechaUnicaInicio() {
		return strFechaUnicaInicio;
	}

	public void setStrFechaUnicaInicio(String strFechaUnicaInicio) {
		this.strFechaUnicaInicio = strFechaUnicaInicio;
	}
	
}
