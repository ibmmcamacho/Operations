package com.pe.ibm.bean;

import java.sql.Time;
import java.util.Date;

public class BeanRendimientoDashboard {
	
	//private int idRendimiento = 0;
	private String bizagi_percentil = "";
	private String bizagi_threshold = "";
	private String bizagi_total = "";
	private String bizagi_desvios = "";
	private String bizagi_indicador = "";
	private String proveedores_percentil = "";
	private String proveedores_threshold = "";
	private String proveedores_total = "";
	private String proveedores_desvios = "";
	private String proveedores_indicador = "";
	private String cobertura_percentil = "";
	private String cobertura_threshold = "";
	private String cobertura_total = "";
	private String cobertura_desvios = "";
	private String cobertura_indicador ="";
	private String asegurados_percentil = "";
	private String asegurados_threshold = "";
	private String asegurados_total = "";
	private String asegurados_desvios = "";
	private String asegurados_indicador="";
	private String cupones_percentil = "";
	private String cupones_threshold = "";
	private String cupones_total = "";
	private String cupones_desvios = "";
	private String cupones_indicador = "";
	private String certificado_percentil = "";
	private String certificado_threshold = "";
	private String certificado_total = "";
	private String certificado_desvios = "";
	private String certificado_indicador = "";
	private String poliza_percentil = "";
	private String poliza_threshold = "";
	private String poliza_total = "";
	private String poliza_desvios = "";
	private String poliza_indicador = "";
	private String det_sin_percentil = "";
	private String det_sin_threshold = "";
	private String det_sin_total = "";
	private String det_sin_desvios = "";
	private String det_sin_indicador = "";
	private String feb_cob_percentil = "";
	private String feb_cob_threshold = "";
	private String feb_cob_total = "";
	private String feb_cob_desvios = "";
	private String feb_cob_indicador = "";
	private String siniestro_cert_percentil = "";
	private String siniestro_cert_threshold = "";
	private String siniestro_cert_total = "";
	private String siniestro_cert_desvios = "";
	private String siniestro_cert_indicador = "";
	private String financia_percentil = "";
	private String financia_threshold = "";
	private String financia_total = "";
	private String financia_desvios = "";
	private String financia_indicador = "";
	private String trasmision_percentil = "";
	private String trasmision_threshold = "";
	private String trasmision_total = "";
	private String trasmision_desvios = "";
	private String trasmision_indicador = "";
	private String poliza_act_percentil = "";
	private String poliza_act_threshold = "";
	private String poliza_act_total = "";
	private String poliza_act_desvios = "";
	private String poliza_act_indicador = "";
	private String poliza_buscar_percentil = "";
	private String poliza_buscar_threshold = "";
	private String poliza_buscar_total = "";
	private String poliza_buscar_desvios = "";
	private String poliza_buscar_indicador = "";
	private String poliza_preafi_percentil = "";
	private String poliza_preafi_threshold = "";
	private String poliza_preafi_total = "";
	private String poliza_preafi_desvios = "";
	private String poliza_preafi_indicador = "";
	private String endoso_percentil = "";
	private String endoso_threshold = "";
	private String endoso_total = "";
	private String endoso_desvios = "";
	private String endoso_indicador ="";
	private String salud_percentil = "";
	private String salud_threshold = "";
	private String salud_total = "";
	private String salud_desvios = "";
	private String salud_indicador = "";
	private String trama_percentil = "";
	private String trama_threshold = "";
	private String trama_total = "";
	private String trama_desvios = "";
	private String trama_indicador = "";
	private Date fecha_reporte;
	private Date desde;
	private Date hasta;
	@Override
	public String toString() {
		return "BeanRendimientoDashboard [bizagi_percentil=" + bizagi_percentil + ", bizagi_threshold="
				+ bizagi_threshold + ", bizagi_total=" + bizagi_total + ", bizagi_desvios=" + bizagi_desvios
				+ ", bizagi_indicador=" + bizagi_indicador + ", proveedores_percentil=" + proveedores_percentil
				+ ", proveedores_threshold=" + proveedores_threshold + ", proveedores_total=" + proveedores_total
				+ ", proveedores_desvios=" + proveedores_desvios + ", proveedores_indicador=" + proveedores_indicador
				+ ", cobertura_percentil=" + cobertura_percentil + ", cobertura_threshold=" + cobertura_threshold
				+ ", cobertura_total=" + cobertura_total + ", cobertura_desvios=" + cobertura_desvios
				+ ", cobertura_indicador=" + cobertura_indicador + ", asegurados_percentil=" + asegurados_percentil
				+ ", asegurados_threshold=" + asegurados_threshold + ", asegurados_total=" + asegurados_total
				+ ", asegurados_desvios=" + asegurados_desvios + ", asegurados_indicador=" + asegurados_indicador
				+ ", cupones_percentil=" + cupones_percentil + ", cupones_threshold=" + cupones_threshold
				+ ", cupones_total=" + cupones_total + ", cupones_desvios=" + cupones_desvios + ", cupones_indicador="
				+ cupones_indicador + ", certificado_percentil=" + certificado_percentil + ", certificado_threshold="
				+ certificado_threshold + ", certificado_total=" + certificado_total + ", certificado_desvios="
				+ certificado_desvios + ", certificado_indicador=" + certificado_indicador + ", poliza_percentil="
				+ poliza_percentil + ", poliza_threshold=" + poliza_threshold + ", poliza_total=" + poliza_total
				+ ", poliza_desvios=" + poliza_desvios + ", poliza_indicador=" + poliza_indicador
				+ ", det_sin_percentil=" + det_sin_percentil + ", det_sin_threshold=" + det_sin_threshold
				+ ", det_sin_total=" + det_sin_total + ", det_sin_desvios=" + det_sin_desvios + ", det_sin_indicador="
				+ det_sin_indicador + ", feb_cob_percentil=" + feb_cob_percentil + ", feb_cob_threshold="
				+ feb_cob_threshold + ", feb_cob_total=" + feb_cob_total + ", feb_cob_desvios=" + feb_cob_desvios
				+ ", feb_cob_indicador=" + feb_cob_indicador + ", siniestro_cert_percentil=" + siniestro_cert_percentil
				+ ", siniestro_cert_threshold=" + siniestro_cert_threshold + ", siniestro_cert_total="
				+ siniestro_cert_total + ", siniestro_cert_desvios=" + siniestro_cert_desvios
				+ ", siniestro_cert_indicador=" + siniestro_cert_indicador + ", financia_percentil="
				+ financia_percentil + ", financia_threshold=" + financia_threshold + ", financia_total="
				+ financia_total + ", financia_desvios=" + financia_desvios + ", financia_indicador="
				+ financia_indicador + ", trasmision_percentil=" + trasmision_percentil + ", trasmision_threshold="
				+ trasmision_threshold + ", trasmision_total=" + trasmision_total + ", trasmision_desvios="
				+ trasmision_desvios + ", trasmision_indicador=" + trasmision_indicador + ", poliza_act_percentil="
				+ poliza_act_percentil + ", poliza_act_threshold=" + poliza_act_threshold + ", poliza_act_total="
				+ poliza_act_total + ", poliza_act_desvios=" + poliza_act_desvios + ", poliza_act_indicador="
				+ poliza_act_indicador + ", poliza_buscar_percentil=" + poliza_buscar_percentil
				+ ", poliza_buscar_threshold=" + poliza_buscar_threshold + ", poliza_buscar_total="
				+ poliza_buscar_total + ", poliza_buscar_desvios=" + poliza_buscar_desvios
				+ ", poliza_buscar_indicador=" + poliza_buscar_indicador + ", poliza_preafi_percentil="
				+ poliza_preafi_percentil + ", poliza_preafi_threshold=" + poliza_preafi_threshold
				+ ", poliza_preafi_total=" + poliza_preafi_total + ", poliza_preafi_desvios=" + poliza_preafi_desvios
				+ ", poliza_preafi_indicador=" + poliza_preafi_indicador + ", endoso_percentil=" + endoso_percentil
				+ ", endoso_threshold=" + endoso_threshold + ", endoso_total=" + endoso_total + ", endoso_desvios="
				+ endoso_desvios + ", endoso_indicador=" + endoso_indicador + ", salud_percentil=" + salud_percentil
				+ ", salud_threshold=" + salud_threshold + ", salud_total=" + salud_total + ", salud_desvios="
				+ salud_desvios + ", salud_indicador=" + salud_indicador + ", trama_percentil=" + trama_percentil
				+ ", trama_threshold=" + trama_threshold + ", trama_total=" + trama_total + ", trama_desvios="
				+ trama_desvios + ", trama_indicador=" + trama_indicador + ", fecha_reporte=" + fecha_reporte
				+ ", desde=" + desde + ", hasta=" + hasta + "]";
	}
	public String getBizagi_percentil() {
		return bizagi_percentil;
	}
	public void setBizagi_percentil(String bizagi_percentil) {
		this.bizagi_percentil = bizagi_percentil;
	}
	public String getBizagi_threshold() {
		return bizagi_threshold;
	}
	public void setBizagi_threshold(String bizagi_threshold) {
		this.bizagi_threshold = bizagi_threshold;
	}
	public String getBizagi_total() {
		return bizagi_total;
	}
	public void setBizagi_total(String bizagi_total) {
		this.bizagi_total = bizagi_total;
	}
	public String getBizagi_desvios() {
		return bizagi_desvios;
	}
	public void setBizagi_desvios(String bizagi_desvios) {
		this.bizagi_desvios = bizagi_desvios;
	}
	public String getBizagi_indicador() {
		return bizagi_indicador;
	}
	public void setBizagi_indicador(String bizagi_indicador) {
		this.bizagi_indicador = bizagi_indicador;
	}
	public String getProveedores_percentil() {
		return proveedores_percentil;
	}
	public void setProveedores_percentil(String proveedores_percentil) {
		this.proveedores_percentil = proveedores_percentil;
	}
	public String getProveedores_threshold() {
		return proveedores_threshold;
	}
	public void setProveedores_threshold(String proveedores_threshold) {
		this.proveedores_threshold = proveedores_threshold;
	}
	public String getProveedores_total() {
		return proveedores_total;
	}
	public void setProveedores_total(String proveedores_total) {
		this.proveedores_total = proveedores_total;
	}
	public String getProveedores_desvios() {
		return proveedores_desvios;
	}
	public void setProveedores_desvios(String proveedores_desvios) {
		this.proveedores_desvios = proveedores_desvios;
	}
	public String getProveedores_indicador() {
		return proveedores_indicador;
	}
	public void setProveedores_indicador(String proveedores_indicador) {
		this.proveedores_indicador = proveedores_indicador;
	}
	public String getCobertura_percentil() {
		return cobertura_percentil;
	}
	public void setCobertura_percentil(String cobertura_percentil) {
		this.cobertura_percentil = cobertura_percentil;
	}
	public String getCobertura_threshold() {
		return cobertura_threshold;
	}
	public void setCobertura_threshold(String cobertura_threshold) {
		this.cobertura_threshold = cobertura_threshold;
	}
	public String getCobertura_total() {
		return cobertura_total;
	}
	public void setCobertura_total(String cobertura_total) {
		this.cobertura_total = cobertura_total;
	}
	public String getCobertura_desvios() {
		return cobertura_desvios;
	}
	public void setCobertura_desvios(String cobertura_desvios) {
		this.cobertura_desvios = cobertura_desvios;
	}
	public String getCobertura_indicador() {
		return cobertura_indicador;
	}
	public void setCobertura_indicador(String cobertura_indicador) {
		this.cobertura_indicador = cobertura_indicador;
	}
	public String getAsegurados_percentil() {
		return asegurados_percentil;
	}
	public void setAsegurados_percentil(String asegurados_percentil) {
		this.asegurados_percentil = asegurados_percentil;
	}
	public String getAsegurados_threshold() {
		return asegurados_threshold;
	}
	public void setAsegurados_threshold(String asegurados_threshold) {
		this.asegurados_threshold = asegurados_threshold;
	}
	public String getAsegurados_total() {
		return asegurados_total;
	}
	public void setAsegurados_total(String asegurados_total) {
		this.asegurados_total = asegurados_total;
	}
	public String getAsegurados_desvios() {
		return asegurados_desvios;
	}
	public void setAsegurados_desvios(String asegurados_desvios) {
		this.asegurados_desvios = asegurados_desvios;
	}
	public String getAsegurados_indicador() {
		return asegurados_indicador;
	}
	public void setAsegurados_indicador(String asegurados_indicador) {
		this.asegurados_indicador = asegurados_indicador;
	}
	public String getCupones_percentil() {
		return cupones_percentil;
	}
	public void setCupones_percentil(String cupones_percentil) {
		this.cupones_percentil = cupones_percentil;
	}
	public String getCupones_threshold() {
		return cupones_threshold;
	}
	public void setCupones_threshold(String cupones_threshold) {
		this.cupones_threshold = cupones_threshold;
	}
	public String getCupones_total() {
		return cupones_total;
	}
	public void setCupones_total(String cupones_total) {
		this.cupones_total = cupones_total;
	}
	public String getCupones_desvios() {
		return cupones_desvios;
	}
	public void setCupones_desvios(String cupones_desvios) {
		this.cupones_desvios = cupones_desvios;
	}
	public String getCupones_indicador() {
		return cupones_indicador;
	}
	public void setCupones_indicador(String cupones_indicador) {
		this.cupones_indicador = cupones_indicador;
	}
	public String getCertificado_percentil() {
		return certificado_percentil;
	}
	public void setCertificado_percentil(String certificado_percentil) {
		this.certificado_percentil = certificado_percentil;
	}
	public String getCertificado_threshold() {
		return certificado_threshold;
	}
	public void setCertificado_threshold(String certificado_threshold) {
		this.certificado_threshold = certificado_threshold;
	}
	public String getCertificado_total() {
		return certificado_total;
	}
	public void setCertificado_total(String certificado_total) {
		this.certificado_total = certificado_total;
	}
	public String getCertificado_desvios() {
		return certificado_desvios;
	}
	public void setCertificado_desvios(String certificado_desvios) {
		this.certificado_desvios = certificado_desvios;
	}
	public String getCertificado_indicador() {
		return certificado_indicador;
	}
	public void setCertificado_indicador(String certificado_indicador) {
		this.certificado_indicador = certificado_indicador;
	}
	public String getPoliza_percentil() {
		return poliza_percentil;
	}
	public void setPoliza_percentil(String poliza_percentil) {
		this.poliza_percentil = poliza_percentil;
	}
	public String getPoliza_threshold() {
		return poliza_threshold;
	}
	public void setPoliza_threshold(String poliza_threshold) {
		this.poliza_threshold = poliza_threshold;
	}
	public String getPoliza_total() {
		return poliza_total;
	}
	public void setPoliza_total(String poliza_total) {
		this.poliza_total = poliza_total;
	}
	public String getPoliza_desvios() {
		return poliza_desvios;
	}
	public void setPoliza_desvios(String poliza_desvios) {
		this.poliza_desvios = poliza_desvios;
	}
	public String getPoliza_indicador() {
		return poliza_indicador;
	}
	public void setPoliza_indicador(String poliza_indicador) {
		this.poliza_indicador = poliza_indicador;
	}
	public String getDet_sin_percentil() {
		return det_sin_percentil;
	}
	public void setDet_sin_percentil(String det_sin_percentil) {
		this.det_sin_percentil = det_sin_percentil;
	}
	public String getDet_sin_threshold() {
		return det_sin_threshold;
	}
	public void setDet_sin_threshold(String det_sin_threshold) {
		this.det_sin_threshold = det_sin_threshold;
	}
	public String getDet_sin_total() {
		return det_sin_total;
	}
	public void setDet_sin_total(String det_sin_total) {
		this.det_sin_total = det_sin_total;
	}
	public String getDet_sin_desvios() {
		return det_sin_desvios;
	}
	public void setDet_sin_desvios(String det_sin_desvios) {
		this.det_sin_desvios = det_sin_desvios;
	}
	public String getDet_sin_indicador() {
		return det_sin_indicador;
	}
	public void setDet_sin_indicador(String det_sin_indicador) {
		this.det_sin_indicador = det_sin_indicador;
	}
	public String getFeb_cob_percentil() {
		return feb_cob_percentil;
	}
	public void setFeb_cob_percentil(String feb_cob_percentil) {
		this.feb_cob_percentil = feb_cob_percentil;
	}
	public String getFeb_cob_threshold() {
		return feb_cob_threshold;
	}
	public void setFeb_cob_threshold(String feb_cob_threshold) {
		this.feb_cob_threshold = feb_cob_threshold;
	}
	public String getFeb_cob_total() {
		return feb_cob_total;
	}
	public void setFeb_cob_total(String feb_cob_total) {
		this.feb_cob_total = feb_cob_total;
	}
	public String getFeb_cob_desvios() {
		return feb_cob_desvios;
	}
	public void setFeb_cob_desvios(String feb_cob_desvios) {
		this.feb_cob_desvios = feb_cob_desvios;
	}
	public String getFeb_cob_indicador() {
		return feb_cob_indicador;
	}
	public void setFeb_cob_indicador(String feb_cob_indicador) {
		this.feb_cob_indicador = feb_cob_indicador;
	}
	public String getSiniestro_cert_percentil() {
		return siniestro_cert_percentil;
	}
	public void setSiniestro_cert_percentil(String siniestro_cert_percentil) {
		this.siniestro_cert_percentil = siniestro_cert_percentil;
	}
	public String getSiniestro_cert_threshold() {
		return siniestro_cert_threshold;
	}
	public void setSiniestro_cert_threshold(String siniestro_cert_threshold) {
		this.siniestro_cert_threshold = siniestro_cert_threshold;
	}
	public String getSiniestro_cert_total() {
		return siniestro_cert_total;
	}
	public void setSiniestro_cert_total(String siniestro_cert_total) {
		this.siniestro_cert_total = siniestro_cert_total;
	}
	public String getSiniestro_cert_desvios() {
		return siniestro_cert_desvios;
	}
	public void setSiniestro_cert_desvios(String siniestro_cert_desvios) {
		this.siniestro_cert_desvios = siniestro_cert_desvios;
	}
	public String getSiniestro_cert_indicador() {
		return siniestro_cert_indicador;
	}
	public void setSiniestro_cert_indicador(String siniestro_cert_indicador) {
		this.siniestro_cert_indicador = siniestro_cert_indicador;
	}
	public String getFinancia_percentil() {
		return financia_percentil;
	}
	public void setFinancia_percentil(String financia_percentil) {
		this.financia_percentil = financia_percentil;
	}
	public String getFinancia_threshold() {
		return financia_threshold;
	}
	public void setFinancia_threshold(String financia_threshold) {
		this.financia_threshold = financia_threshold;
	}
	public String getFinancia_total() {
		return financia_total;
	}
	public void setFinancia_total(String financia_total) {
		this.financia_total = financia_total;
	}
	public String getFinancia_desvios() {
		return financia_desvios;
	}
	public void setFinancia_desvios(String financia_desvios) {
		this.financia_desvios = financia_desvios;
	}
	public String getFinancia_indicador() {
		return financia_indicador;
	}
	public void setFinancia_indicador(String financia_indicador) {
		this.financia_indicador = financia_indicador;
	}
	public String getTrasmision_percentil() {
		return trasmision_percentil;
	}
	public void setTrasmision_percentil(String trasmision_percentil) {
		this.trasmision_percentil = trasmision_percentil;
	}
	public String getTrasmision_threshold() {
		return trasmision_threshold;
	}
	public void setTrasmision_threshold(String trasmision_threshold) {
		this.trasmision_threshold = trasmision_threshold;
	}
	public String getTrasmision_total() {
		return trasmision_total;
	}
	public void setTrasmision_total(String trasmision_total) {
		this.trasmision_total = trasmision_total;
	}
	public String getTrasmision_desvios() {
		return trasmision_desvios;
	}
	public void setTrasmision_desvios(String trasmision_desvios) {
		this.trasmision_desvios = trasmision_desvios;
	}
	public String getTrasmision_indicador() {
		return trasmision_indicador;
	}
	public void setTrasmision_indicador(String trasmision_indicador) {
		this.trasmision_indicador = trasmision_indicador;
	}
	public String getPoliza_act_percentil() {
		return poliza_act_percentil;
	}
	public void setPoliza_act_percentil(String poliza_act_percentil) {
		this.poliza_act_percentil = poliza_act_percentil;
	}
	public String getPoliza_act_threshold() {
		return poliza_act_threshold;
	}
	public void setPoliza_act_threshold(String poliza_act_threshold) {
		this.poliza_act_threshold = poliza_act_threshold;
	}
	public String getPoliza_act_total() {
		return poliza_act_total;
	}
	public void setPoliza_act_total(String poliza_act_total) {
		this.poliza_act_total = poliza_act_total;
	}
	public String getPoliza_act_desvios() {
		return poliza_act_desvios;
	}
	public void setPoliza_act_desvios(String poliza_act_desvios) {
		this.poliza_act_desvios = poliza_act_desvios;
	}
	public String getPoliza_act_indicador() {
		return poliza_act_indicador;
	}
	public void setPoliza_act_indicador(String poliza_act_indicador) {
		this.poliza_act_indicador = poliza_act_indicador;
	}
	public String getPoliza_buscar_percentil() {
		return poliza_buscar_percentil;
	}
	public void setPoliza_buscar_percentil(String poliza_buscar_percentil) {
		this.poliza_buscar_percentil = poliza_buscar_percentil;
	}
	public String getPoliza_buscar_threshold() {
		return poliza_buscar_threshold;
	}
	public void setPoliza_buscar_threshold(String poliza_buscar_threshold) {
		this.poliza_buscar_threshold = poliza_buscar_threshold;
	}
	public String getPoliza_buscar_total() {
		return poliza_buscar_total;
	}
	public void setPoliza_buscar_total(String poliza_buscar_total) {
		this.poliza_buscar_total = poliza_buscar_total;
	}
	public String getPoliza_buscar_desvios() {
		return poliza_buscar_desvios;
	}
	public void setPoliza_buscar_desvios(String poliza_buscar_desvios) {
		this.poliza_buscar_desvios = poliza_buscar_desvios;
	}
	public String getPoliza_buscar_indicador() {
		return poliza_buscar_indicador;
	}
	public void setPoliza_buscar_indicador(String poliza_buscar_indicador) {
		this.poliza_buscar_indicador = poliza_buscar_indicador;
	}
	public String getPoliza_preafi_percentil() {
		return poliza_preafi_percentil;
	}
	public void setPoliza_preafi_percentil(String poliza_preafi_percentil) {
		this.poliza_preafi_percentil = poliza_preafi_percentil;
	}
	public String getPoliza_preafi_threshold() {
		return poliza_preafi_threshold;
	}
	public void setPoliza_preafi_threshold(String poliza_preafi_threshold) {
		this.poliza_preafi_threshold = poliza_preafi_threshold;
	}
	public String getPoliza_preafi_total() {
		return poliza_preafi_total;
	}
	public void setPoliza_preafi_total(String poliza_preafi_total) {
		this.poliza_preafi_total = poliza_preafi_total;
	}
	public String getPoliza_preafi_desvios() {
		return poliza_preafi_desvios;
	}
	public void setPoliza_preafi_desvios(String poliza_preafi_desvios) {
		this.poliza_preafi_desvios = poliza_preafi_desvios;
	}
	public String getPoliza_preafi_indicador() {
		return poliza_preafi_indicador;
	}
	public void setPoliza_preafi_indicador(String poliza_preafi_indicador) {
		this.poliza_preafi_indicador = poliza_preafi_indicador;
	}
	public String getEndoso_percentil() {
		return endoso_percentil;
	}
	public void setEndoso_percentil(String endoso_percentil) {
		this.endoso_percentil = endoso_percentil;
	}
	public String getEndoso_threshold() {
		return endoso_threshold;
	}
	public void setEndoso_threshold(String endoso_threshold) {
		this.endoso_threshold = endoso_threshold;
	}
	public String getEndoso_total() {
		return endoso_total;
	}
	public void setEndoso_total(String endoso_total) {
		this.endoso_total = endoso_total;
	}
	public String getEndoso_desvios() {
		return endoso_desvios;
	}
	public void setEndoso_desvios(String endoso_desvios) {
		this.endoso_desvios = endoso_desvios;
	}
	public String getEndoso_indicador() {
		return endoso_indicador;
	}
	public void setEndoso_indicador(String endoso_indicador) {
		this.endoso_indicador = endoso_indicador;
	}
	public String getSalud_percentil() {
		return salud_percentil;
	}
	public void setSalud_percentil(String salud_percentil) {
		this.salud_percentil = salud_percentil;
	}
	public String getSalud_threshold() {
		return salud_threshold;
	}
	public void setSalud_threshold(String salud_threshold) {
		this.salud_threshold = salud_threshold;
	}
	public String getSalud_total() {
		return salud_total;
	}
	public void setSalud_total(String salud_total) {
		this.salud_total = salud_total;
	}
	public String getSalud_desvios() {
		return salud_desvios;
	}
	public void setSalud_desvios(String salud_desvios) {
		this.salud_desvios = salud_desvios;
	}
	public String getSalud_indicador() {
		return salud_indicador;
	}
	public void setSalud_indicador(String salud_indicador) {
		this.salud_indicador = salud_indicador;
	}
	public String getTrama_percentil() {
		return trama_percentil;
	}
	public void setTrama_percentil(String trama_percentil) {
		this.trama_percentil = trama_percentil;
	}
	public String getTrama_threshold() {
		return trama_threshold;
	}
	public void setTrama_threshold(String trama_threshold) {
		this.trama_threshold = trama_threshold;
	}
	public String getTrama_total() {
		return trama_total;
	}
	public void setTrama_total(String trama_total) {
		this.trama_total = trama_total;
	}
	public String getTrama_desvios() {
		return trama_desvios;
	}
	public void setTrama_desvios(String trama_desvios) {
		this.trama_desvios = trama_desvios;
	}
	public String getTrama_indicador() {
		return trama_indicador;
	}
	public void setTrama_indicador(String trama_indicador) {
		this.trama_indicador = trama_indicador;
	}
	public Date getFecha_reporte() {
		return fecha_reporte;
	}
	public void setFecha_reporte(Date fecha_reporte) {
		this.fecha_reporte = fecha_reporte;
	}
	public Date getDesde() {
		return desde;
	}
	public void setDesde(Date desde) {
		this.desde = desde;
	}
	public Date getHasta() {
		return hasta;
	}
	public void setHasta(Date hasta) {
		this.hasta = hasta;
	}
}