package com.pe.ibm.bean;

import java.sql.Timestamp;

//import java.sql.Timestamp;

public class BeanTicketSRINC {
	
	private String ticketid=null;
	private String woch=null;
	private String strclass=null;
	private String status=null;
	private String internalpriority=null;
	private String externalsystem=null;
	private String idcallmng=null;
	private String service=null;
	private String serviceline=null;
	private String proyectoid=null;
	private String pluscustomer=null;
	private String namecliente=null;
	private String location=null;
	private String descriptionlocation=null;
	private Timestamp creationdate=null;
	private String itdchcreatedbygroup=null;
	private String emailcreatedby=null;
	private String namecreatedby=null;
	private String emailreportedby=null;
	private String namereportedby=null;
	private String emailaffectedperson=null;
	private String nameaffectedperson=null;
	private String ownergroup=null;
	private String itdresolvergroup=null;
	private String emailowner=null;
	private String nameowner=null;
	private Timestamp finishdate=null;
	private String classificationid=null;
	private String classification=null;
	private String classstructureid=null;
	private String abiresult=null;
	private String classificationlevel1=null;
	private String classificationlevel2=null;
	private String classificationlevel3=null;
	private String classificationlevel4=null;
	private String cinum=null;
	private String cinumdesc=null;
	private String fcr=null;
	private String isglobal=null;
	private String globalticketclass=null;
	private String globalticketid=null;
	private String itdclosurecode=null;
	private String itdmajorincident=null;
	private String origrecordclass=null;
	private String origrecordid=null;
	private String relatedtoglobal=null;
	private String description=null;
	private String detail=null;
	private String sintoma = null;
	private String causa = null;
	private String solucion = null;
	private String changeby_tkweb = "";
	private Timestamp changedate_tkweb = null;
	private double tiempoescalamiento=0.0;
	private double tiemporespuesta=0.0;
	private double tiemposolucion=0.0;
	private String strtiempoescalamiento=null;
	private String strtiemporespuesta=null;
	private String strtiemposolucion=null;
	private int idProyectoCisco = 0;
	private String fechaPeriodo = "";
	private String tkreabierto = "";
	private String gestionweb = "";
	private Timestamp fecha_encuesta = null;
	private String pregunta_encuesta = "";
	private String respuesta_encuesta = "";
	private String comentario_encuesta = "";
	private int atencion_masiva = 0;
	
	
	
	public String getStrtiempoescalamiento() {
		return strtiempoescalamiento;
	}
	public void setStrtiempoescalamiento(String strtiempoescalamiento) {
		this.strtiempoescalamiento = strtiempoescalamiento;
	}
	public String getStrtiemporespuesta() {
		return strtiemporespuesta;
	}
	public void setStrtiemporespuesta(String strtiemporespuesta) {
		this.strtiemporespuesta = strtiemporespuesta;
	}
	public String getStrtiemposolucion() {
		return strtiemposolucion;
	}
	public void setStrtiemposolucion(String strtiemposolucion) {
		this.strtiemposolucion = strtiemposolucion;
	}
	public String getTicketid() {
		return ticketid;
	}
	public void setTicketid(String ticketid) {
		this.ticketid = ticketid;
	}
	public String getWoch() {
		return woch;
	}
	public void setWoch(String woch) {
		this.woch = woch;
	}
	public String getStrclass() {
		return strclass;
	}
	public void setStrclass(String strclass) {
		this.strclass = strclass;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getInternalpriority() {
		return internalpriority;
	}
	public void setInternalpriority(String internalpriority) {
		this.internalpriority = internalpriority;
	}
	public String getExternalsystem() {
		return externalsystem;
	}
	public void setExternalsystem(String externalsystem) {
		this.externalsystem = externalsystem;
	}
	public String getIdcallmng() {
		return idcallmng;
	}
	public void setIdcallmng(String idcallmng) {
		this.idcallmng = idcallmng;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public String getServiceline() {
		return serviceline;
	}
	public void setServiceline(String serviceline) {
		this.serviceline = serviceline;
	}
	public String getProyectoid() {
		return proyectoid;
	}
	public void setProyectoid(String proyectoid) {
		this.proyectoid = proyectoid;
	}
	public String getPluscustomer() {
		return pluscustomer;
	}
	public void setPluscustomer(String pluscustomer) {
		this.pluscustomer = pluscustomer;
	}
	public String getNamecliente() {
		return namecliente;
	}
	public void setNamecliente(String namecliente) {
		this.namecliente = namecliente;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescriptionlocation() {
		return descriptionlocation;
	}
	public void setDescriptionlocation(String descriptionlocation) {
		this.descriptionlocation = descriptionlocation;
	}
	public Timestamp getCreationdate() {
		return creationdate;
	}
	public void setCreationdate(Timestamp creationdate) {
		this.creationdate = creationdate;
	}
	public String getItdchcreatedbygroup() {
		return itdchcreatedbygroup;
	}
	public void setItdchcreatedbygroup(String itdchcreatedbygroup) {
		this.itdchcreatedbygroup = itdchcreatedbygroup;
	}
	public String getEmailcreatedby() {
		return emailcreatedby;
	}
	public void setEmailcreatedby(String emailcreatedby) {
		this.emailcreatedby = emailcreatedby;
	}
	public String getNamecreatedby() {
		return namecreatedby;
	}
	public void setNamecreatedby(String namecreatedby) {
		this.namecreatedby = namecreatedby;
	}
	public String getEmailreportedby() {
		return emailreportedby;
	}
	public void setEmailreportedby(String emailreportedby) {
		this.emailreportedby = emailreportedby;
	}
	public String getNamereportedby() {
		return namereportedby;
	}
	public void setNamereportedby(String namereportedby) {
		this.namereportedby = namereportedby;
	}
	public String getEmailaffectedperson() {
		return emailaffectedperson;
	}
	public void setEmailaffectedperson(String emailaffectedperson) {
		this.emailaffectedperson = emailaffectedperson;
	}
	public String getNameaffectedperson() {
		return nameaffectedperson;
	}
	public void setNameaffectedperson(String nameaffectedperson) {
		this.nameaffectedperson = nameaffectedperson;
	}
	public String getOwnergroup() {
		return ownergroup;
	}
	public void setOwnergroup(String ownergroup) {
		this.ownergroup = ownergroup;
	}
	public String getItdresolvergroup() {
		return itdresolvergroup;
	}
	public void setItdresolvergroup(String itdresolvergroup) {
		this.itdresolvergroup = itdresolvergroup;
	}
	public String getEmailowner() {
		return emailowner;
	}
	public void setEmailowner(String emailowner) {
		this.emailowner = emailowner;
	}
	public String getNameowner() {
		return nameowner;
	}
	public void setNameowner(String nameowner) {
		this.nameowner = nameowner;
	}
	public Timestamp getFinishdate() {
		return finishdate;
	}
	public void setFinishdate(Timestamp finishdate) {
		this.finishdate = finishdate;
	}
	public String getClassificationid() {
		return classificationid;
	}
	public void setClassificationid(String classificationid) {
		this.classificationid = classificationid;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public String getClassstructureid() {
		return classstructureid;
	}
	public void setClassstructureid(String classstructureid) {
		this.classstructureid = classstructureid;
	}
	public String getAbiresult() {
		return abiresult;
	}
	public void setAbiresult(String abiresult) {
		this.abiresult = abiresult;
	}
	public String getClassificationlevel1() {
		return classificationlevel1;
	}
	public void setClassificationlevel1(String classificationlevel1) {
		this.classificationlevel1 = classificationlevel1;
	}
	public String getClassificationlevel2() {
		return classificationlevel2;
	}
	public void setClassificationlevel2(String classificationlevel2) {
		this.classificationlevel2 = classificationlevel2;
	}
	public String getClassificationlevel3() {
		return classificationlevel3;
	}
	public void setClassificationlevel3(String classificationlevel3) {
		this.classificationlevel3 = classificationlevel3;
	}
	public String getClassificationlevel4() {
		return classificationlevel4;
	}
	public void setClassificationlevel4(String classificationlevel4) {
		this.classificationlevel4 = classificationlevel4;
	}
	public String getCinum() {
		return cinum;
	}
	public void setCinum(String cinum) {
		this.cinum = cinum;
	}
	public String getCinumdesc() {
		return cinumdesc;
	}
	public void setCinumdesc(String cinumdesc) {
		this.cinumdesc = cinumdesc;
	}
	public String getFcr() {
		return fcr;
	}
	public void setFcr(String fcr) {
		this.fcr = fcr;
	}
	public String getIsglobal() {
		return isglobal;
	}
	public void setIsglobal(String isglobal) {
		this.isglobal = isglobal;
	}
	public String getGlobalticketclass() {
		return globalticketclass;
	}
	public void setGlobalticketclass(String globalticketclass) {
		this.globalticketclass = globalticketclass;
	}
	public String getGlobalticketid() {
		return globalticketid;
	}
	public void setGlobalticketid(String globalticketid) {
		this.globalticketid = globalticketid;
	}
	public String getItdclosurecode() {
		return itdclosurecode;
	}
	public void setItdclosurecode(String itdclosurecode) {
		this.itdclosurecode = itdclosurecode;
	}
	public String getItdmajorincident() {
		return itdmajorincident;
	}
	public void setItdmajorincident(String itdmajorincident) {
		this.itdmajorincident = itdmajorincident;
	}
	public String getOrigrecordclass() {
		return origrecordclass;
	}
	public void setOrigrecordclass(String origrecordclass) {
		this.origrecordclass = origrecordclass;
	}
	public String getOrigrecordid() {
		return origrecordid;
	}
	public void setOrigrecordid(String origrecordid) {
		this.origrecordid = origrecordid;
	}
	public String getRelatedtoglobal() {
		return relatedtoglobal;
	}
	public void setRelatedtoglobal(String relatedtoglobal) {
		this.relatedtoglobal = relatedtoglobal;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getSintoma() {
		return sintoma;
	}
	public void setSintoma(String sintoma) {
		this.sintoma = sintoma;
	}
	public String getCausa() {
		return causa;
	}
	public void setCausa(String causa) {
		this.causa = causa;
	}
	public String getSolucion() {
		return solucion;
	}
	public void setSolucion(String solucion) {
		this.solucion = solucion;
	}
	public String getChangeby_tkweb() {
		return changeby_tkweb;
	}
	public void setChangeby_tkweb(String changeby_tkweb) {
		this.changeby_tkweb = changeby_tkweb;
	}
	public Timestamp getChangedate_tkweb() {
		return changedate_tkweb;
	}
	public void setChangedate_tkweb(Timestamp changedate_tkweb) {
		this.changedate_tkweb = changedate_tkweb;
	}
	public double getTiempoescalamiento() {
		return tiempoescalamiento;
	}
	public void setTiempoescalamiento(double tiempoescalamiento) {
		this.tiempoescalamiento = tiempoescalamiento;
	}
	public double getTiemporespuesta() {
		return tiemporespuesta;
	}
	public void setTiemporespuesta(double tiemporespuesta) {
		this.tiemporespuesta = tiemporespuesta;
	}
	public double getTiemposolucion() {
		return tiemposolucion;
	}
	public void setTiemposolucion(double tiemposolucion) {
		this.tiemposolucion = tiemposolucion;
	}
	public int getIdProyectoCisco() {
		return idProyectoCisco;
	}
	public void setIdProyectoCisco(int idProyectoCisco) {
		this.idProyectoCisco = idProyectoCisco;
	}
	public String getFechaPeriodo() {
		return fechaPeriodo;
	}
	public void setFechaPeriodo(String fechaPeriodo) {
		this.fechaPeriodo = fechaPeriodo;
	}
	public String getTkreabierto() {
		return tkreabierto;
	}
	public void setTkreabierto(String tkreabierto) {
		this.tkreabierto = tkreabierto;
	}
	public String getGestionweb() {
		return gestionweb;
	}
	public void setGestionweb(String gestionweb) {
		this.gestionweb = gestionweb;
	}
	public Timestamp getFecha_encuesta() {
		return fecha_encuesta;
	}
	public void setFecha_encuesta(Timestamp fecha_encuesta) {
		this.fecha_encuesta = fecha_encuesta;
	}
	public String getPregunta_encuesta() {
		return pregunta_encuesta;
	}
	public void setPregunta_encuesta(String pregunta_encuesta) {
		this.pregunta_encuesta = pregunta_encuesta;
	}
	public String getRespuesta_encuesta() {
		return respuesta_encuesta;
	}
	public void setRespuesta_encuesta(String respuesta_encuesta) {
		this.respuesta_encuesta = respuesta_encuesta;
	}
	public String getComentario_encuesta() {
		return comentario_encuesta;
	}
	public void setComentario_encuesta(String comentario_encuesta) {
		this.comentario_encuesta = comentario_encuesta;
	}
	public int getAtencion_masiva() {
		return atencion_masiva;
	}
	public void setAtencion_masiva(int atencion_masiva) {
		this.atencion_masiva = atencion_masiva;
	}
	@Override
	public String toString() {
		return "BeanTicketSRINC [ticketid=" + ticketid + ", woch=" + woch + ", strclass=" + strclass + ", status="
				+ status + ", internalpriority=" + internalpriority + ", externalsystem=" + externalsystem
				+ ", idcallmng=" + idcallmng + ", service=" + service + ", serviceline=" + serviceline + ", proyectoid="
				+ proyectoid + ", pluscustomer=" + pluscustomer + ", namecliente=" + namecliente + ", location="
				+ location + ", descriptionlocation=" + descriptionlocation + ", creationdate=" + creationdate
				+ ", itdchcreatedbygroup=" + itdchcreatedbygroup + ", emailcreatedby=" + emailcreatedby
				+ ", namecreatedby=" + namecreatedby + ", emailreportedby=" + emailreportedby + ", namereportedby="
				+ namereportedby + ", emailaffectedperson=" + emailaffectedperson + ", nameaffectedperson="
				+ nameaffectedperson + ", ownergroup=" + ownergroup + ", itdresolvergroup=" + itdresolvergroup
				+ ", emailowner=" + emailowner + ", nameowner=" + nameowner + ", finishdate=" + finishdate
				+ ", classificationid=" + classificationid + ", classification=" + classification
				+ ", classstructureid=" + classstructureid + ", abiresult=" + abiresult + ", classificationlevel1="
				+ classificationlevel1 + ", classificationlevel2=" + classificationlevel2 + ", classificationlevel3="
				+ classificationlevel3 + ", classificationlevel4=" + classificationlevel4 + ", cinum=" + cinum
				+ ", cinumdesc=" + cinumdesc + ", fcr=" + fcr + ", isglobal=" + isglobal + ", globalticketclass="
				+ globalticketclass + ", globalticketid=" + globalticketid + ", itdclosurecode=" + itdclosurecode
				+ ", itdmajorincident=" + itdmajorincident + ", origrecordclass=" + origrecordclass + ", origrecordid="
				+ origrecordid + ", relatedtoglobal=" + relatedtoglobal + ", description=" + description + ", detail="
				+ detail + ", sintoma=" + sintoma + ", causa=" + causa + ", solucion=" + solucion + ", changeby_tkweb="
				+ changeby_tkweb + ", changedate_tkweb=" + changedate_tkweb + ", tiempoescalamiento="
				+ tiempoescalamiento + ", tiemporespuesta=" + tiemporespuesta + ", tiemposolucion=" + tiemposolucion
				+ ", idProyectoCisco=" + idProyectoCisco + ", fechaPeriodo=" + fechaPeriodo + ", tkreabierto="
				+ tkreabierto + ", gestionweb=" + gestionweb + ", fecha_encuesta=" + fecha_encuesta
				+ ", pregunta_encuesta=" + pregunta_encuesta + ", respuesta_encuesta=" + respuesta_encuesta
				+ ", comentario_encuesta=" + comentario_encuesta + ", atencion_masiva=" + atencion_masiva + "]";
	}
	
	
	

}
