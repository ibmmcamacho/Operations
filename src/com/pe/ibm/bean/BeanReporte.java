package com.pe.ibm.bean;

public class BeanReporte {
	
	String strArea;
	String strModalidad;
	String strCargo;
	String strIdEmpleado;
	String strEmpleado;
	String strIdLogin;
	String strHorario;
	String strDia;
	String strSemana;
	String strMes;
	String strFechaEntrada;
	String strHoraEntrada;
	String strFechaSalida;
	String strHoraSalida;
	String strMinutos;
	String strFechaInicio;
	String strFechaFin;
	String strTeam;
	int iIdEmpleado;
	int iDia;
	int iMinutos;
	String strObs;
	String strIp;
	String strSo;
	String strBrowser;
	String strEmail;
	String strAsistencia;
	
	String strEnero = "";
	String strFebrero = "";
	String strMarzo = "";
	String strAbril = "";
	String strMayo = "";
	String strJunio = "";
	String strJulio = "";
	String strAgosto = "";
	String strSeptiembre = "";
	String strOctubre = "";
	String strNoviembre = "";
	String strDiciembre = "";
	
	public BeanReporte(){}

	public BeanReporte(String strArea, String strModalidad, String strCargo, String strIdEmpleado, String strEmpleado,
			String strIdLogin, String strHorario, String strMes, String strFechaEntrada, String strHoraEntrada,
			String strFechaSalida, String strHoraSalida, String strMinutos, String strFechaInicio, String strFechaFin,
			String strTeam, int iIdEmpleado, int iDia, int iMinutos, String strObs, String strIp, String strSo,
			String strBrowser, String strEnero, String strFebrero, String strMarzo, String strAbril, String strMayo,
			String strJunio, String strJulio, String strAgosto, String strSeptiembre, String strOctubre,
			String strNoviembre, String strDiciembre) {
		super();
		this.strArea = strArea;
		this.strModalidad = strModalidad;
		this.strCargo = strCargo;
		this.strIdEmpleado = strIdEmpleado;
		this.strEmpleado = strEmpleado;
		this.strIdLogin = strIdLogin;
		this.strHorario = strHorario;
		this.strMes = strMes;
		this.strFechaEntrada = strFechaEntrada;
		this.strHoraEntrada = strHoraEntrada;
		this.strFechaSalida = strFechaSalida;
		this.strHoraSalida = strHoraSalida;
		this.strMinutos = strMinutos;
		this.strFechaInicio = strFechaInicio;
		this.strFechaFin = strFechaFin;
		this.strTeam = strTeam;
		this.iIdEmpleado = iIdEmpleado;
		this.iDia = iDia;
		this.iMinutos = iMinutos;
		this.strObs = strObs;
		this.strIp = strIp;
		this.strSo = strSo;
		this.strBrowser = strBrowser;
		this.strEnero = strEnero;
		this.strFebrero = strFebrero;
		this.strMarzo = strMarzo;
		this.strAbril = strAbril;
		this.strMayo = strMayo;
		this.strJunio = strJunio;
		this.strJulio = strJulio;
		this.strAgosto = strAgosto;
		this.strSeptiembre = strSeptiembre;
		this.strOctubre = strOctubre;
		this.strNoviembre = strNoviembre;
		this.strDiciembre = strDiciembre;
	}

	public String getStrArea() {
		return strArea;
	}

	public void setStrArea(String strArea) {
		this.strArea = strArea;
	}

	public String getStrModalidad() {
		return strModalidad;
	}

	public void setStrModalidad(String strModalidad) {
		this.strModalidad = strModalidad;
	}

	public String getStrCargo() {
		return strCargo;
	}

	public void setStrCargo(String strCargo) {
		this.strCargo = strCargo;
	}

	public String getStrIdEmpleado() {
		return strIdEmpleado;
	}

	public void setStrIdEmpleado(String strIdEmpleado) {
		this.strIdEmpleado = strIdEmpleado;
	}

	public String getStrEmpleado() {
		return strEmpleado;
	}

	public void setStrEmpleado(String strEmpleado) {
		this.strEmpleado = strEmpleado;
	}

	public String getStrIdLogin() {
		return strIdLogin;
	}

	public void setStrIdLogin(String strIdLogin) {
		this.strIdLogin = strIdLogin;
	}

	public String getStrHorario() {
		return strHorario;
	}

	public void setStrHorario(String strHorario) {
		this.strHorario = strHorario;
	}

	public String getStrMes() {
		return strMes;
	}

	public void setStrMes(String strMes) {
		this.strMes = strMes;
	}

	public String getStrFechaEntrada() {
		return strFechaEntrada;
	}

	public void setStrFechaEntrada(String strFechaEntrada) {
		this.strFechaEntrada = strFechaEntrada;
	}

	public String getStrHoraEntrada() {
		return strHoraEntrada;
	}

	public void setStrHoraEntrada(String strHoraEntrada) {
		this.strHoraEntrada = strHoraEntrada;
	}

	public String getStrFechaSalida() {
		return strFechaSalida;
	}

	public void setStrFechaSalida(String strFechaSalida) {
		this.strFechaSalida = strFechaSalida;
	}

	public String getStrHoraSalida() {
		return strHoraSalida;
	}

	public void setStrHoraSalida(String strHoraSalida) {
		this.strHoraSalida = strHoraSalida;
	}

	public String getStrMinutos() {
		return strMinutos;
	}

	public void setStrMinutos(String strMinutos) {
		this.strMinutos = strMinutos;
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

	public String getStrTeam() {
		return strTeam;
	}

	public void setStrTeam(String strTeam) {
		this.strTeam = strTeam;
	}

	public int getiIdEmpleado() {
		return iIdEmpleado;
	}

	public void setiIdEmpleado(int iIdEmpleado) {
		this.iIdEmpleado = iIdEmpleado;
	}

	public int getiDia() {
		return iDia;
	}

	public void setiDia(int iDia) {
		this.iDia = iDia;
	}

	public int getiMinutos() {
		return iMinutos;
	}

	public void setiMinutos(int iMinutos) {
		this.iMinutos = iMinutos;
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

	public String getStrEnero() {
		return strEnero;
	}

	public void setStrEnero(String strEnero) {
		this.strEnero = strEnero;
	}

	public String getStrFebrero() {
		return strFebrero;
	}

	public void setStrFebrero(String strFebrero) {
		this.strFebrero = strFebrero;
	}

	public String getStrMarzo() {
		return strMarzo;
	}

	public void setStrMarzo(String strMarzo) {
		this.strMarzo = strMarzo;
	}

	public String getStrAbril() {
		return strAbril;
	}

	public void setStrAbril(String strAbril) {
		this.strAbril = strAbril;
	}

	public String getStrMayo() {
		return strMayo;
	}

	public void setStrMayo(String strMayo) {
		this.strMayo = strMayo;
	}

	public String getStrJunio() {
		return strJunio;
	}

	public void setStrJunio(String strJunio) {
		this.strJunio = strJunio;
	}

	public String getStrJulio() {
		return strJulio;
	}

	public void setStrJulio(String strJulio) {
		this.strJulio = strJulio;
	}

	public String getStrAgosto() {
		return strAgosto;
	}

	public void setStrAgosto(String strAgosto) {
		this.strAgosto = strAgosto;
	}

	public String getStrSeptiembre() {
		return strSeptiembre;
	}

	public void setStrSeptiembre(String strSeptiembre) {
		this.strSeptiembre = strSeptiembre;
	}

	public String getStrOctubre() {
		return strOctubre;
	}

	public void setStrOctubre(String strOctubre) {
		this.strOctubre = strOctubre;
	}

	public String getStrNoviembre() {
		return strNoviembre;
	}

	public void setStrNoviembre(String strNoviembre) {
		this.strNoviembre = strNoviembre;
	}

	public String getStrDiciembre() {
		return strDiciembre;
	}

	public void setStrDiciembre(String strDiciembre) {
		this.strDiciembre = strDiciembre;
	}

	public String getStrSemana() {
		return strSemana;
	}

	public void setStrSemana(String strSemana) {
		this.strSemana = strSemana;
	}

	public String getStrEmail() {
		return strEmail;
	}

	public void setStrEmail(String strEmail) {
		this.strEmail = strEmail;
	}

	public String getStrAsistencia() {
		return strAsistencia;
	}

	public void setStrAsistencia(String strAsistencia) {
		this.strAsistencia = strAsistencia;
	}

	public String getStrDia() {
		return strDia;
	}

	public void setStrDia(String strDia) {
		this.strDia = strDia;
	}
}