package com.pe.ibm.bean;

//import java.sql.Time;
//import java.util.Date;

public class BeanAgentStatus {
	
	private int id = 0;
	private int lenghtnode = 0;
	private String status;
	private String node = "";
	private String node2 = "";
	private String product = "";
	private String ipaddress = "";
	private String hostname = "";
	private String version = "";
	private String hostinfo = "";
	private String throughnode = "";
	private String heartbeat = "";
	private String operacion = "";
	private String usermod = "";
	private String resultado1 ="";
	private String resultado2 = "";
	private int resultado;
	@Override
	public String toString() {
		return "BeanAgentStatus [id=" + id + ", lenghtnode=" + lenghtnode + ", status=" + status + ", node=" + node
				+ ", node2=" + node2 + ", product=" + product + ", ipaddress=" + ipaddress + ", hostname=" + hostname
				+ ", version=" + version + ", hostinfo=" + hostinfo + ", throughnode=" + throughnode + ", heartbeat="
				+ heartbeat + ", operacion=" + operacion + ", usermod=" + usermod + ", resultado1=" + resultado1
				+ ", resultado2=" + resultado2 + ", resultado=" + resultado + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getLenghtnode() {
		return lenghtnode;
	}
	public void setLenghtnode(int lenghtnode) {
		this.lenghtnode = lenghtnode;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getNode() {
		return node;
	}
	public void setNode(String node) {
		this.node = node;
	}
	public String getNode2() {
		return node2;
	}
	public void setNode2(String node2) {
		this.node2 = node2;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getIpaddress() {
		return ipaddress;
	}
	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}
	public String getHostname() {
		return hostname;
	}
	public void setHostname(String hostname) {
		this.hostname = hostname;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getHostinfo() {
		return hostinfo;
	}
	public void setHostinfo(String hostinfo) {
		this.hostinfo = hostinfo;
	}
	public String getThroughnode() {
		return throughnode;
	}
	public void setThroughnode(String throughnode) {
		this.throughnode = throughnode;
	}
	public String getHeartbeat() {
		return heartbeat;
	}
	public void setHeartbeat(String heartbeat) {
		this.heartbeat = heartbeat;
	}
	public String getOperacion() {
		return operacion;
	}
	public void setOperacion(String operacion) {
		this.operacion = operacion;
	}
	public String getUsermod() {
		return usermod;
	}
	public void setUsermod(String usermod) {
		this.usermod = usermod;
	}
	public String getResultado1() {
		return resultado1;
	}
	public void setResultado1(String resultado1) {
		this.resultado1 = resultado1;
	}
	public String getResultado2() {
		return resultado2;
	}
	public void setResultado2(String resultado2) {
		this.resultado2 = resultado2;
	}
	public int getResultado() {
		return resultado;
	}
	public void setResultado(int resultado) {
		this.resultado = resultado;
	}	
	
}

