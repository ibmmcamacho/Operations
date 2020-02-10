package com.pe.ibm.bean;

public class BeanReporteTSM {
	
	private String nombretsm = "";
	private String datescheduled = "";
	private String timescheduled = "";
	private String datestart = "";
	private String timestart = "";
	private String schedule_name = "";
	private String node_name = "";
	private String status = "";
	private String result = "";
	private String reason = "";
	private String datecompleted = "";
	private String timecompleted = "";
	private String cliente = "";
	private String fecha = "";
	private String cantidad = "";
	
	public BeanReporteTSM() {}

	public String getNombretsm() {
		return nombretsm;
	}

	public void setNombretsm(String nombretsm) {
		this.nombretsm = nombretsm;
	}

	public String getDatescheduled() {
		return datescheduled;
	}

	public void setDatescheduled(String datescheduled) {
		this.datescheduled = datescheduled;
	}

	public String getTimescheduled() {
		return timescheduled;
	}

	public void setTimescheduled(String timescheduled) {
		this.timescheduled = timescheduled;
	}

	public String getDatestart() {
		return datestart;
	}

	public void setDatestart(String datestart) {
		this.datestart = datestart;
	}

	public String getTimestart() {
		return timestart;
	}

	public void setTimestart(String timestart) {
		this.timestart = timestart;
	}

	public String getSchedule_name() {
		return schedule_name;
	}

	public void setSchedule_name(String schedule_name) {
		this.schedule_name = schedule_name;
	}

	public String getNode_name() {
		return node_name;
	}

	public void setNode_name(String node_name) {
		this.node_name = node_name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getDatecompleted() {
		return datecompleted;
	}

	public void setDatecompleted(String datecompleted) {
		this.datecompleted = datecompleted;
	}

	public String getTimecompleted() {
		return timecompleted;
	}

	public void setTimecompleted(String timecompleted) {
		this.timecompleted = timecompleted;
	}

	public String getCliente() {
		return cliente;
	}

	public void setCliente(String cliente) {
		this.cliente = cliente;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getCantidad() {
		return cantidad;
	}

	public void setCantidad(String cantidad) {
		this.cantidad = cantidad;
	}

	@Override
	public String toString() {
		return "BeanReporteTSM [nombretsm=" + nombretsm + ", datescheduled=" + datescheduled + ", timescheduled="
				+ timescheduled + ", datestart=" + datestart + ", timestart=" + timestart + ", schedule_name="
				+ schedule_name + ", node_name=" + node_name + ", status=" + status + ", result=" + result + ", reason="
				+ reason + ", datecompleted=" + datecompleted + ", timecompleted=" + timecompleted + ", cliente="
				+ cliente + ", fecha=" + fecha + ", cantidad=" + cantidad + "]";
	}

}
