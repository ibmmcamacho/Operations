package com.pe.ibm.util;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.Request;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanAlerta;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessAlertaEjecutiva;

public class NotificacionAlertas {

	public int sendEmail(BeanAlerta pBeanAlerta, SqlSessionFactory ssf,HttpServletRequest req, BeanSession objBeanSession){
		
		int resultado = 0;
//		final String username = "apikey";
//		final String password = "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";
		
		final String username = pBeanAlerta.getStrEmail();
		final String password = pBeanAlerta.getStrPwd();

		Properties props = new Properties();
		props.put("mail.smtp.auth", "false");
//		props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.smtp.host", "smtp.gmail.com");
		
//		props.put("mail.smtp.host", "smtp.sendgrid.net");
//		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.host", "129.39.179.42");
		props.put("mail.smtp.port", "25");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
	
		try {

			MimeMessage  message = new MimeMessage(session);
//			message.setFrom(new InternetAddress("noreply@pe.ibm.com"));
			message.setFrom(new InternetAddress(pBeanAlerta.getStrEmail()));
			
			BusinessAlertaEjecutiva objBusinessAlertaEjecutiva = new BusinessAlertaEjecutiva();
			List<BeanOptions> listContactos = null;
			
			String plistDistribucion = "";
			String plistDist[] = pBeanAlerta.getDistribucion().split(",");
			
				for(int i = 0 ; i < plistDist.length ; i++) {
//					if(i==plistDist.length-1) plistDistribucion += ",\"" + plistDist[i]; 
//					else if(i==0) plistDistribucion = plistDist[i] + "\"";
//					else plistDistribucion += ",\"" + plistDist[i] + "\"";
					
					if(i==0) plistDistribucion = "'" + plistDist[i] + "'";
					else plistDistribucion += ",'" + plistDist[i] + "'";
				}
			
			listContactos = objBusinessAlertaEjecutiva.getListaDistribucion(new BeanParameters(plistDistribucion,"DISTRIBUCION_ALERTA",pBeanAlerta.getiTeam()), ssf);
			
			StringBuilder strContactos = new StringBuilder();
//			StringBuilder strContactos2 = new StringBuilder();
//			StringBuilder strContactos3 = new StringBuilder();
			
			for(int i = 0 ; i < listContactos.size() ; i++){
				if(i == 0)
					strContactos.append(listContactos.get(i).getStrValor2());
				else
					strContactos.append("," + listContactos.get(i).getStrValor2());
				
//				if(i < 50)
//					if(i == 0) { strContactos.append(listContactos.get(i).getStrValor2());}
//					else { strContactos.append("," + listContactos.get(i).getStrValor2());}
//				else if(i >= 50 && i < 100)
//					if(i == 50) { strContactos2.append(listContactos.get(i).getStrValor2());}
//					else { strContactos2.append("," + listContactos.get(i).getStrValor2());}
//				else if(i >= 100)
//					if(i == 100) { strContactos3.append(listContactos.get(i).getStrValor2());}
//					else { strContactos3.append("," + listContactos.get(i).getStrValor2());}
			}
			
			message.setSubject("*Confidencial: " + pBeanAlerta.getEstadoAlerta() + " DE PRIORIDAD P1 - TICKET " + pBeanAlerta.getMaximoIdTicket() + " - CLIENTE: " + pBeanAlerta.getMaximoCliente());
			
			String strContent = getMessage(pBeanAlerta, ssf);
			if(strContent == null)
				return 0;
			
			message.setText(strContent, "utf-8", "html");
			
//			for(int i = 0 ; i < 3 ; i++) {
//				if(i == 0) {
//					if(strContactos.length() > 0) {
						message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(strContactos.toString()));
						message.addRecipients(Message.RecipientType.CC , pBeanAlerta.getCopiaDistribucion().toString());
//					}
//				}
//				else if(i == 1) {
//					if(strContactos2.length() > 0)
//						message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(strContactos2.toString()));
//					}
//				else if(i == 2) {
//					if(strContactos3.length() > 0)
//						message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(strContactos3.toString()));
//					}
				
				Transport.send(message);
//			}
			resultado = 1;
			System.out.println("Done!");
			AppUtils.convertAuditoria(req, "SEND EMAIL", "OK", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "NOTIFICACION ALERTAS", (message.toString().length() > 9950 ? message.toString().substring(0, 9950) : message.toString()), ssf);
		} catch (MessagingException e) {
			AppUtils.addErr(e, pBeanAlerta.getMaximoIdTicket() + " - ENVIAR EMAIL | NOTIFICACION", objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno() + " " + objBeanSession.getObjBeanPersonal().getStrApMaterno(), objBeanSession.getObjBeanPersonal().getiIdEmpleado(), ssf);
			System.out.println("INSERT ERR1");
			resultado = 0;
//			System.out.println("ERROR ENVÍO ==> " + e.toString());
			AppUtils.convertAuditoria(req, "SEND EMAIL", "ERROR MAIL", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "NOTIFICACION ALERTAS", e.toString(), ssf);
		} catch (Exception ex) {
			resultado = 0;
			System.out.println("ERROR ENVÍO GENERAL ==> " + ex.toString());
			AppUtils.addErr(ex, pBeanAlerta.getMaximoIdTicket() + " - ENVIAR EMAIL | NOTIFICACION", objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno() + " " + objBeanSession.getObjBeanPersonal().getStrApMaterno(), objBeanSession.getObjBeanPersonal().getiIdEmpleado(), ssf);
			System.out.println("INSERT ERR2");
			resultado = 0;
			AppUtils.convertAuditoria(req, "SEND EMAIL", "ERROR GENERAL", objBeanSession.getObjBeanPersonal().getiIdEmpleado(), objBeanSession.getObjBeanPersonal().getStrNombre() + " " + objBeanSession.getObjBeanPersonal().getStrApPaterno(), "NOTIFICACION ALERTAS", ex.toString(), ssf);
		}
		
		return resultado;
	}
	
	
public static String getMessage(BeanAlerta pBeanAlerta, SqlSessionFactory ssf){
	StringBuilder strContent = new StringBuilder();
	
	BusinessAlertaEjecutiva objBusinessAlertaEjecutiva = new BusinessAlertaEjecutiva();
	BeanAlerta objBeanAlerta = new BeanAlerta();
	
	List<BeanAlerta> listBeanAlerta = null;
	listBeanAlerta = objBusinessAlertaEjecutiva.listTicketsNotificacionAlertasDetalle(pBeanAlerta.getIdAlerta(), ssf);
	objBeanAlerta = objBusinessAlertaEjecutiva.listTicketsNotificacionAlertas(pBeanAlerta.getIdAlerta(), ssf);
	if(objBeanAlerta != null){
		
		strContent.append("<!DOCTYPE html>");
		strContent.append("<html xmlns='http://www.w3.org/1999/xhtml'><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
		strContent.append("<meta name='viewport' content='initial-scale=1.0'>");
		strContent.append("<meta name='format-detection' content='telephone=no'>");
		strContent.append("<title></title>");
		strContent.append("</head>");
		strContent.append("<body style='font-family: Arial, sans-serif; font-size:13px;' leftmargin='0' topmargin='0' marginheight='0' marginwidth='0'>");
		strContent.append("<br/>");
		strContent.append("<div>");
		strContent.append("<table style='margin:0 auto; border-collapse: collapse;' width='95%' height='100%' cellspacing='0' cellpadding='0'>");
		strContent.append("<tbody>");
		strContent.append("<tr style='border: 1px solid black;'>");
		strContent.append("<td style='border: 1px solid black; width:50%;'>");
		strContent.append("<table>");
		strContent.append("<tr>");
		strContent.append("<td rowspan='2'><img src='" + objBeanAlerta.getStrImgLogo() + "' alt='logo ibm' width=60px height=43></td>");
		strContent.append("<td style='font-family: Arial, sans-serif; font-size: 18px; color: rgba(0,0,128,1); padding:10px 0px 0px 0px;'><b>Alerta Ejecutiva</b></td>");
		strContent.append("</tr>");
		strContent.append("<tr>");
		strContent.append("<td style='font-family: Arial, sans-serif; font-size: 13px; color: rgba(248,16,40,1); padding:0px 0px 10px 0px'><b>IBM Confidencial</b></td>");
		strContent.append("</tr>");
		strContent.append("</table>");
		strContent.append("</td>");
		strContent.append("<td style='border: 1px solid black; width:50%;'>");
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("<tr style='color: #fff;background-color: #337ab7; border: 1px solid black;'>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 13px; color: #fff;background-color: rgba(0,0,128,1); border: 1px solid black; width:50%;'>");
		strContent.append("Información del Cliente");
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 13px; color: #fff;background-color: rgba(0,0,128,1); border: 1px solid black; width:50%;'>");
		strContent.append("Aprobación del Proyecto");
		strContent.append("</td>");
		strContent.append("</tr>"); 
		strContent.append("<tr>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 12px; border: 1px solid black;'>");
		strContent.append("<b>CLIENTE</b>");
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 12px; border: 1px solid black;'>");
		strContent.append("<b>DPE/PM</b>");
		strContent.append("</td>");
		strContent.append("</tr>"); 
		strContent.append("<tr>");
		strContent.append("<td style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black;'>");
		strContent.append(objBeanAlerta.getMaximoCliente());
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black;'>");
		strContent.append(objBeanAlerta.getPm());
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("<tr style='color: #fff;background-color: #337ab7; border: 1px solid black;'>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 13px; color: #fff;background-color: rgba(0,0,128,1); border: 1px solid black; width:50%;'>");
		strContent.append("Otros Clientes Afectados");
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 13px; color: #fff;background-color: rgba(0,0,128,1); border: 1px solid black; width:50%;'>");
		strContent.append("Gerente de Crisis");
		strContent.append("</td>");
		strContent.append("</tr>"); 
		strContent.append("<tr>");
		strContent.append("<td style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black;'>");
		strContent.append(objBeanAlerta.getStrOtroCliente());
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black;'>");
		strContent.append(objBeanAlerta.getCrisisTurno());
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("<tr style='color: #fff;background-color: #337ab7; border: 1px solid black;'>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 13px; color: #fff;background-color: rgba(0,0,128,1); border: 1px solid black; width:50%;'>");
		strContent.append("Impacto en el Cliente");
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 13px; color: #fff;background-color: rgba(0,0,128,1); border: 1px solid black; width:50%;'>");
		strContent.append("Incidente");
		strContent.append("</td>");
		strContent.append("</tr>"); 
		strContent.append("<tr>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 12px; border: 1px solid black;'>");
		strContent.append("<b>Servicio/Aplicativo Impactado</b>");
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 12px; border: 1px solid black;'>");
		strContent.append("<b>Nro. Ticket</b>");
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("<tr>");
		strContent.append("<td style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black;'>");
		strContent.append(objBeanAlerta.getServicioImpactado());
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black;'>");
		strContent.append(pBeanAlerta.getMaximoIdTicket());
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("<tr style='color: #fff;background-color: #337ab7; border: 1px solid black;'>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 13px; color: #fff;background-color: rgba(0,0,128,1); border: 1px solid black; width:50%;'>");
		strContent.append("Descripción");
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 13px; color: #fff;background-color: rgba(0,0,128,1); border: 1px solid black; width:50%;'>");
		strContent.append("Estado");
		strContent.append("</td>");
		strContent.append("</tr>"); 
		strContent.append("<tr>");
		strContent.append("<td style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black;'>");
		strContent.append(pBeanAlerta.getMaximoResumen());
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black;'>");
		strContent.append(pBeanAlerta.getMaximoEstado());
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("<tr style='color: #fff;background-color: #337ab7; border: 1px solid black;'>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 13px; color: #fff;background-color: rgba(0,0,128,1); border: 1px solid black; width:50%;'>");
		strContent.append("Impacto en el Negocio y posibles consecuencias");
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 13px; color: #fff;background-color: rgba(0,0,128,1); border: 1px solid black; width:50%;'>");
		strContent.append("Inicio de indisponibilidad");
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("<tr>");
		strContent.append("<td style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black; width:50%;'>");
		strContent.append(objBeanAlerta.getImpactoNegocio());
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black; width:50%;'>");
		strContent.append(pBeanAlerta.getFechaNotificacionIbm().substring(0,16));
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("<tr style='color: #fff;background-color: #337ab7; border: 1px solid black;'>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 13px; color: #fff;background-color: rgba(0,0,128,1); border: 1px solid black; width:50%;'>");
		strContent.append("Pérdida de SLA y/o penalidades");
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 13px; color: #fff;background-color: rgba(0,0,128,1); border: 1px solid black; width:50%;'>");
		strContent.append("Fin de indisponibilidad");
		strContent.append("</td>");
		strContent.append("</tr>"); 
		strContent.append("<tr>");
		strContent.append("<td style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black;'>");
		strContent.append(objBeanAlerta.getSla());
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black;'>");
		strContent.append(pBeanAlerta.getFechaFin() == null ? "" : pBeanAlerta.getFechaFin().substring(0,16));
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("<tr style='color: #fff;background-color: #337ab7; border: 1px solid black;'>");
		strContent.append("<td colspan='2' style='font-family: Arial, sans-serif; line-height: 20px; font-size: 13px; color: #fff;background-color: rgba(0,0,128,1); border: 1px solid black;'>");
		strContent.append("ACCIONES TOMADAS");
		strContent.append("</td>");
		strContent.append("</tr>"); 
		strContent.append("<tr>");
		strContent.append("<td colspan='2' style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black;'>");
		strContent.append("Conference Call details:<br/>");
		strContent.append("Dial.In Number:0800-77-942<br/>");
		strContent.append("Tie Line (8) 6506840<br/>");
		strContent.append("Password Code: 40-70-27-70#<br/><br/>");
						if(listBeanAlerta.size() > 0)
						{
							for(BeanAlerta item : listBeanAlerta){
								strContent.append(item.getStrMensaje().replaceAll("\\|\\|", "<br/>") + "<br/>");
							}
						}
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("<tr style='color: #fff;background-color: #337ab7; border: 1px solid black;'>");
		strContent.append("<td colspan='2' style='font-family: Arial, sans-serif; line-height: 20px; font-size: 13px; color: #fff;background-color: rgba(0,0,128,1); border: 1px solid black;'>");
		strContent.append("INFORMACIÓN ADICIONAL");
		strContent.append("</td>");
		strContent.append("</tr>");
		
		strContent.append("<tr>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 12px; border: 1px solid black;'>");
		strContent.append("<b>Número de Ticket Problema</b>");
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 12px; border: 1px solid black;'>");
		strContent.append("<b>Número de Ticket de Cambio</b>");
		strContent.append("</td>");
		strContent.append("</tr>"); 
		strContent.append("<tr>");
		strContent.append("<td style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black;'>");
		strContent.append(pBeanAlerta.getIdticketProblema() == null ? " " : pBeanAlerta.getIdticketProblema());
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black;'>");
		strContent.append(pBeanAlerta.getIdticketCambio() == null ? " " : pBeanAlerta.getIdticketCambio());
		strContent.append("</td>");
		strContent.append("</tr>");
		
		strContent.append("<tr>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 12px; border: 1px solid black;'>");
		strContent.append("<b>Team Owner</b>");
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; line-height: 20px; font-size: 12px; border: 1px solid black;'>");
		strContent.append("<b>Team Resolutor</b>");
		strContent.append("</td>");
		strContent.append("</tr>"); 
		strContent.append("<tr>");
		strContent.append("<td style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black;'>");
		strContent.append(pBeanAlerta.getMaximoIdGrupoPropietario() == null ? " " : pBeanAlerta.getMaximoIdGrupoPropietario() + (pBeanAlerta.getMaximoIdGrupoPropietario().toUpperCase().contains("-PE-") ? " - PERU" : pBeanAlerta.getMaximoIdGrupoPropietario().toUpperCase().contains("-IN-") ? " - INDIA" : " "));
		strContent.append("</td>");
		strContent.append("<td style='font-family: Arial, sans-serif; padding:7px 0px 7px 0px; font-size: 13px; border: 1px solid black;'>");
		strContent.append(pBeanAlerta.getMaximoIdGrupoResolutor() == null ? " " : pBeanAlerta.getMaximoIdGrupoResolutor() + (pBeanAlerta.getMaximoIdGrupoResolutor().toUpperCase().contains("-PE-") ? " - PERU" : pBeanAlerta.getMaximoIdGrupoResolutor().toUpperCase().contains("-IN-") ? " - INDIA" : " "));
		strContent.append("</td>");
		strContent.append("</tr>");
		
		strContent.append("<tr>");
		strContent.append("<td colspan='2'>");
		strContent.append("<br/><br/>");
		strContent.append("<b><span style='color: rgba(255,0,0,1)'>Nota:</span> Esta información es de uso interno de IBM solamente. No implica que el Cliente haya aprobado el uso externo de esta referencia.  Como tal, no debe ser compartido con nuestros Asociados de Negocios.</b>");
		strContent.append("<br/><br/>");
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("<tr>");
		strContent.append("<td colspan='2'>");
		strContent.append("<br/><br/>");
		strContent.append("<b><span style='color: #000'>Nombre: " + pBeanAlerta.getStrNombreUsuario() + "</span></b></br>");
		strContent.append("<b><span style='color: #000'>Cargo: System Operations Supervisor</span></b></br>");
		strContent.append("<b><span style='color: #000'>teléfono: 6256000 anexo: 3418</span></b></br>");
		strContent.append("<b><span style='color: #000'>RPM: #985716022</span></b></br>");
		strContent.append("<b><span style='color: #000'>Email: " + pBeanAlerta.getStrEmail() + "</span></b>");
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("</tbody>");
		strContent.append("</table>");
		strContent.append("</div>");
		strContent.append("</body></html>");
	
	
	
	
	
	/*
	strContent.append("<body style='font-family: Arial, sans-serif; font-size:13px; color: #444444; min-height: 200px;' bgcolor='#E4E6E9' leftmargin='0' topmargin='0' marginheight='0' marginwidth='0'>");
	strContent.append("<table width='100%' height='100%' bgcolor='#E4E6E9' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td width='100%' align='center' valign='top' bgcolor='#E4E6E9' style='background-color:#E4E6E9; min-height: 200px;'>");
	strContent.append("<table>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-td-wrap' align='center' width='608'>");
	strContent.append("<div style='font-family: Arial, sans-serif; line-height: 32px; color: #444444; font-size: 13px;'> No puedes leer este email? visita nuesto sitio web <a href='http://129.39.179.13/WebOperations/' style='color: #478fca; text-decoration: none; font-size: 14px; background-color: transparent;'>");
	strContent.append("  Web Operations");
	strContent.append("</a> </div>");
	strContent.append("<table class='table-row' style='table-layout: auto; padding-right: 24px; padding-left: 24px; width: 600px; background-color: #ffffff;' bgcolor='#FFFFFF' width='600' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr height='55px' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; height: 55px;'>");
	strContent.append("<td class='table-row-td' style='height: 55px; padding-right: 16px; font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; vertical-align: middle;' valign='middle' align='left'>");
	strContent.append("<a href='#' style='color: #428bca; text-decoration: none; padding: 0px; font-size: 18px; line-height: 20px; height: 50px; background-color: transparent;'> <img src='" + objBeanAlerta.getStrImgLogo() + "' alt='logo ibm'> </a>");
	strContent.append("</td>");
	strContent.append("<td class='table-row-td' style='height: 55px; font-family: Arial, sans-serif; line-height: 19px; color: #1565C0; font-size: 20px; font-weight: normal; text-align: left; vertical-align: middle;' align='left' valign='middle'> ALERTAS EJECUTIVAS PRIORIDAD 1 </td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-space' height='6' style='height: 6px; font-size: 0px; line-height: 0; width: 600px; background-color: #e4e6e9;' width='600' bgcolor='#E4E6E9' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-space-td' valign='middle' height='6' style='height: 6px; width: 600px; background-color: #e4e6e9;' width='600' bgcolor='#E4E6E9' align='left'>&nbsp;</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-space' height='16' style='height: 16px; font-size: 0px; line-height: 0; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-space-td' valign='middle' height='16' style='height: 16px; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' align='left'>&nbsp;</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-row' width='600' bgcolor='#FFFFFF' style='table-layout: fixed; background-color: #ffffff;' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-row-td' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding-left: 36px; padding-right: 36px;' valign='top' align='left'>");
	strContent.append("<table class='table-col' align='left' width='528' cellspacing='0' cellpadding='0' border='0' style='table-layout: fixed;'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-col-td' width='528' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;' valign='top' align='left'>");
	strContent.append("<table class='header-row' width='528' cellspacing='0' cellpadding='0' border='0' style='table-layout: fixed;'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='header-row-td' width='528' style='font-size: 28px; margin: 0px; font-family: Arial, sans-serif; font-weight: normal; line-height: 19px; color: #478fca; padding-bottom: 10px; padding-top: 15px;' valign='top' align='center'>Notificaciones de alertas</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='header-row' width='528' cellspacing='0' cellpadding='0' border='0' style='table-layout: fixed;'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='header-row-td' width='528' style='font-family: Arial, sans-serif; font-weight: normal; line-height: 19px; color: #444444; margin: 0px; font-size: 18px; padding-bottom: 8px; padding-top: 10px;' valign='top' align='left'>El siguiente correo corresponde a una alerta que solicita su atención.</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-space' height='8' style='height: 8px; font-size: 0px; line-height: 0; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-space-td' valign='middle' height='8' style='height: 8px; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' align='left'>&nbsp;</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-space' height='24' style='height: 24px; font-size: 0px; line-height: 0; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-space-td' valign='middle' height='24' style='height: 24px; width: 600px; padding-left: 18px; padding-right: 18px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' align='center'>&nbsp;");
	strContent.append("<table bgcolor='#E8E8E8' height='0' width='100%' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td bgcolor='#E8E8E8' height='1' width='100%' style='height: 1px; font-size:0;' valign='top' align='left'>&nbsp;</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-row' width='600' bgcolor='#FFFFFF' style='table-layout: fixed; background-color: #ffffff;' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-row-td' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding-left: 36px; padding-right: 36px;' valign='top' align='left'>");
	strContent.append("<table class='table-col-border' align='left' width='181' style='padding-right: 16px; table-layout: fixed;' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-col-td' width='165' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;' valign='top' align='center'> <span style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; '>");
	strContent.append("<span style='color: #5b7a91; text-decoration: none; background-color: transparent;'><b>CLIENTE</b></span>");
	strContent.append("<br>" + objBeanAlerta.getMaximoCliente());
	strContent.append("<br> <img src='" + objBeanAlerta.getStrMedalla() + "' alt='clasificacion'>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-col-border' align='left' width='181' style='padding-right: 16px; table-layout: fixed;' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-col-td' width='165' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;' valign='top' align='center'> <span style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px;'>");
	strContent.append("<span style='color: #5b7a91; text-decoration: none; background-color: transparent;'><b>SERVICIO IMPACTO</b></span>");
	strContent.append("<br>" + objBeanAlerta.getServicioImpactado());
	strContent.append("<br>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-col-border' align='left' width='165' cellspacing='0' cellpadding='0' border='0' style='table-layout: fixed;'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-col-td' width='165' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;' valign='top' align='center'> <span style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px;'>");
	strContent.append("<span style='color: #5b7a91; text-decoration: none; background-color: transparent;'><b>TIEMPO</b></span>");
	strContent.append("<br>Creado hace: " + objBeanAlerta.getiMinutos() + " minutos.");
	strContent.append("<br>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-space' height='12' style='height: 12px; font-size: 0px; line-height: 0; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-space-td' valign='middle' height='12' style='height: 12px; width: 600px; padding-left: 18px; padding-right: 18px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' align='center'>&nbsp;");
	strContent.append("<table bgcolor='#E8E8E8' height='0' width='100%' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td bgcolor='#E8E8E8' height='1' width='100%' style='height: 1px; font-size:0;' valign='top' align='left'>&nbsp;</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-space' height='12' style='height: 12px; font-size: 0px; line-height: 0; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-space-td' valign='middle' height='12' style='height: 12px; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' align='left'>&nbsp;</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-row' width='600' bgcolor='#FFFFFF' style='table-layout: fixed; background-color: #ffffff;' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-row-td' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding-left: 36px; padding-right: 36px;' valign='top' align='left'>");
	strContent.append("<table class='table-col' align='left' width='273' style='padding-right: 18px; table-layout: fixed; text-align: left;' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-col-td' width='255' align='center' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; text-align: center;' valign='top'>");
	strContent.append("<table class='header-row' width='255' cellspacing='0' cellpadding='0' border='0' style='table-layout: fixed;'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='header-row-td' width='255' style='font-family: Arial, sans-serif; font-weight: normal; line-height: 19px; color: #6397bf; margin: 0px; font-size: 17px; padding-bottom: 8px; padding-top: 0px;' valign='top' align='left'>Información del Cliente</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<div style='text-align: left;'> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Cliente: </span>" + objBeanAlerta.getMaximoCliente());
	strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Segmento: </span>" + objBeanAlerta.getStrClasificacion());
	strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>SLA afectado: </span>" + objBeanAlerta.getSla());
	strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Otros clientes afectados: </span>" + objBeanAlerta.getStrOtroCliente());
	strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Prioridad Inicial: </span>" + objBeanAlerta.getMaximoPrioridad());
	strContent.append("<br> </div>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-col' align='left' width='255' cellspacing='0' cellpadding='0' border='0' style='table-layout: fixed;'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-col-td' width='255' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;' valign='top' align='left'>");
	strContent.append("<table class='header-row' width='255' cellspacing='0' cellpadding='0' border='0' style='table-layout: fixed;'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='header-row-td' width='255' style='font-family: Arial, sans-serif; font-weight: normal; line-height: 19px; color: #6397bf; margin: 0px; font-size: 17px; padding-bottom: 8px; padding-top: 0px;' valign='top' align='left'>Estado Actual</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<div style='text-align: left;'> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Estado: </span>" + objBeanAlerta.getMaximoEstado());
	strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Prioridad Actual: </span>" + objBeanAlerta.getMaximoPrioridadPost());
	strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Hora de Ocurrencia: </span>" + objBeanAlerta.getMaximoFechaCreacion());
	strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Hora de restauracion: </span>" + objBeanAlerta.getFechaFin());
//	strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Prioridad Inicial: </span>" + objBeanAlerta.getMaximoPrioridad());
	strContent.append("<br> </div>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-space' height='8' style='height: 8px; font-size: 0px; line-height: 0; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-space-td' valign='middle' height='8' style='height: 8px; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' align='left'>&nbsp;</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-space' height='24' style='height: 24px; font-size: 0px; line-height: 0; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-space-td' valign='middle' height='24' style='height: 24px; width: 600px; padding-left: 18px; padding-right: 18px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' align='center'>&nbsp;");
	strContent.append("<table bgcolor='#E8E8E8' height='0' width='100%' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td bgcolor='#E8E8E8' height='1' width='100%' style='height: 1px; font-size:0;' valign='top' align='left'>&nbsp;</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-row' width='600' bgcolor='#FFFFFF' style='table-layout: fixed; background-color: #ffffff;' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-row-td' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding-left: 36px; padding-right: 36px;' valign='top' align='left'>");
	strContent.append("<table class='table-col' align='left' width='273' style='padding-right: 18px; table-layout: fixed; text-align: left;' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-col-td' width='255' align='center' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; text-align: center;' valign='top'>");
	strContent.append("<table class='header-row' width='255' cellspacing='0' cellpadding='0' border='0' style='table-layout: fixed;'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='header-row-td' width='255' style='font-family: Arial, sans-serif; font-weight: normal; line-height: 19px; color: #6397bf; margin: 0px; font-size: 17px; padding-bottom: 8px; padding-top: 0px;' valign='top' align='left'>Impacto en el cliente</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-row' width='600' bgcolor='#FFFFFF' style='table-layout: fixed; background-color: #ffffff;' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-row-td' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding-left: 36px; padding-right: 36px;' valign='top' align='left'>");
	strContent.append("<table class='table-col' align='left' width='273' style='padding-right: 18px; table-layout: fixed; text-align: left;' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-col-td' width='255' align='center' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; text-align: center;' valign='top'>");
	strContent.append("<div style='text-align: left;'> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Servicio Impactado: </span>" + objBeanAlerta.getServicioImpactado());
	strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Declaracion de Impacto: </span>" + objBeanAlerta.getImpactoNegocio());
	strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Crisis de turno: </span>" + objBeanAlerta.getCrisisTurno());
	strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>PM: </span>" + objBeanAlerta.getPm());
	strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Supervisor: </span>" + objBeanAlerta.getUsuarioCreador());
	strContent.append("<br> </div>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-col' align='left' width='255' cellspacing='0' cellpadding='0' border='0' style='table-layout: fixed;'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-col-td' width='255' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;' valign='top' align='left'>");
	strContent.append("<div style='text-align: left;'> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Tipo de error: </span>" + objBeanAlerta.getStrFalla());
	strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Team de apoyo: </span>" + objBeanAlerta.getStrTeamSoporte());
	strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Atribución del incidente: </span>" + objBeanAlerta.getPropietarioIncidencia());
	strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>DataCenter: </span>" + objBeanAlerta.getDataCenter());
	strContent.append("<br> </div>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	
	
	

	
	if(listBeanAlerta.size() > 0){
	
		strContent.append("<table class='table-space' height='8' style='height: 8px; font-size: 0px; line-height: 0; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' cellspacing='0' cellpadding='0' border='0'>");
		strContent.append("<tbody>");
		strContent.append("<tr>");
		strContent.append("<td class='table-space-td' valign='middle' height='8' style='height: 8px; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' align='left'>&nbsp;</td>");
		strContent.append("</tr>");
		strContent.append("</tbody>");
		strContent.append("</table>");
		
		strContent.append("<table class='table-space' height='24' style='height: 24px; font-size: 0px; line-height: 0; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' cellspacing='0' cellpadding='0' border='0'>");
		strContent.append("<tbody>");
		strContent.append("<tr>");
		strContent.append("<td class='table-space-td' valign='middle' height='24' style='height: 24px; width: 600px; padding-left: 18px; padding-right: 18px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' align='center'>&nbsp;");
		strContent.append("<table bgcolor='#E8E8E8' height='0' width='100%' cellspacing='0' cellpadding='0' border='0'>");
		strContent.append("<tbody>");
		strContent.append("<tr>");
		strContent.append("<td bgcolor='#E8E8E8' height='1' width='100%' style='height: 1px; font-size:0;' valign='top' align='left'>&nbsp;</td>");
		strContent.append("</tr>");
		strContent.append("</tbody>");
		strContent.append("</table>");
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("</tbody>");
		strContent.append("</table>");
		
		strContent.append("<table class='table-row' width='600' bgcolor='#FFFFFF' style='table-layout: fixed; background-color: #ffffff;' cellspacing='0' cellpadding='0' border='0'>");
		strContent.append("<tbody>");
		strContent.append("<tr>");
		strContent.append("<td class='table-row-td' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding-left: 36px; padding-right: 36px;' valign='top' align='left'>");
		strContent.append("<table class='table-col' align='left' width='273' style='padding-right: 18px; table-layout: fixed; text-align: left;' cellspacing='0' cellpadding='0' border='0'>");
		strContent.append("<tbody>");
		strContent.append("<tr>");
		strContent.append("<td class='table-col-td' width='255' align='center' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; text-align: center;' valign='top'>");
		strContent.append("<table class='header-row' width='255' cellspacing='0' cellpadding='0' border='0' style='table-layout: fixed;'>");
		strContent.append("<tbody>");
		strContent.append("<tr>");
		strContent.append("<td class='header-row-td' width='255' style='font-family: Arial, sans-serif; font-weight: normal; line-height: 19px; color: #6397bf; margin: 0px; font-size: 17px; padding-bottom: 8px; padding-top: 0px;' valign='top' align='left'>Historial de Alerta</td>");
		strContent.append("</tr>");
		strContent.append("</tbody>");
		strContent.append("</table>");
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("</tbody>");
		strContent.append("</table>");
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("</tbody>");
		strContent.append("</table>");
		
		strContent.append("<div style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px;'>");
		strContent.append("<table class='table-row' style='table-layout: auto; padding-right: 24px; padding-left: 24px; width: 600px; background-color: #ffffff;' bgcolor='#FFFFFF' width='600' cellspacing='0' cellpadding='0' border='0'>");
		strContent.append("<tbody>");
		for(int i = 0 ; i < listBeanAlerta.size(); i++){	
			strContent.append("<tr style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px;'>");
			strContent.append("<td class='table-row-td' style='padding-right: 16px; padding-bottom: 12px; font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;' valign='top' align='left'> <span style='font-family: Arial, sans-serif; line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>" + listBeanAlerta.get(i).getFecha() + "</span>");
			strContent.append("<br>" + listBeanAlerta.get(i).getHora() + "</td>");
			strContent.append("<td class='table-row-td' style='padding-bottom: 12px; font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;' valign='top' align='left'> <b>" + listBeanAlerta.get(i).getStrMensaje() + "</b>");
			strContent.append("</td>");
			strContent.append("</tr>");
		}
		strContent.append("</tbody>");
		strContent.append("</table>");
		strContent.append("</div>");
	
	}
	
	
	
	strContent.append("<table class='table-space' height='12' style='height: 12px; font-size: 0px; line-height: 0; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-space-td' valign='middle' height='12' style='height: 12px; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' align='left'>&nbsp;</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-space' height='24' style='height: 24px; font-size: 0px; line-height: 0; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-space-td' valign='middle' height='24' style='height: 24px; width: 600px; padding-left: 18px; padding-right: 18px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' align='center'>&nbsp;");
	strContent.append("<table bgcolor='#E8E8E8' height='0' width='100%' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td bgcolor='#E8E8E8' height='1' width='100%' style='height: 1px; font-size:0;' valign='top' align='left'>&nbsp;</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-row' width='600' bgcolor='#FFFFFF' style='table-layout: fixed; background-color: #ffffff;' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-row-td' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding-left: 36px; padding-right: 36px;' valign='top' align='left'>");
	strContent.append("<table class='table-col' align='left' width='273' style='padding-right: 18px; table-layout: fixed; text-align: left;' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-col-td' width='255' align='center' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; text-align: center;' valign='top'>");
	strContent.append("<table class='header-row' width='255' cellspacing='0' cellpadding='0' border='0' style='table-layout: fixed;'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='header-row-td' width='255' style='font-family: Arial, sans-serif; font-weight: normal; line-height: 19px; color: #6397bf; margin: 0px; font-size: 17px; padding-bottom: 8px; padding-top: 0px;' valign='top' align='left'>Referencias</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-row' width='600' bgcolor='#FFFFFF' style='table-layout: fixed; background-color: #ffffff;' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-row-td' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding-left: 36px; padding-right: 36px;' valign='top' align='left'>");
	strContent.append("<table class='table-col' align='left' width='273' style='padding-right: 18px; table-layout: fixed; text-align: left;' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-col-td' width='255' align='center' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; text-align: center;' valign='top'>");
	strContent.append("<div style='text-align: left;'> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Ticket de problema: </span>" + objBeanAlerta.getIdticketProblema());
	strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Ticket de Cambio: </span>" + objBeanAlerta.getIdticketCambio());
	strContent.append("<br> </div>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-space' height='12' style='height: 12px; font-size: 0px; line-height: 0; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-space-td' valign='middle' height='12' style='height: 12px; width: 600px; background-color: #ffffff;' width='600' bgcolor='#FFFFFF' align='left'>&nbsp;</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-space' height='6' style='height: 6px; font-size: 0px; line-height: 0; width: 600px; background-color: #e4e6e9;' width='600' bgcolor='#E4E6E9' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-space-td' valign='middle' height='6' style='height: 6px; width: 600px; background-color: #e4e6e9;' width='600' bgcolor='#E4E6E9' align='left'>&nbsp;</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-row' width='600' bgcolor='#FFFFFF' style='table-layout: fixed; background-color: #ffffff;' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-row-td' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; padding-left: 36px; padding-right: 36px;' valign='top' align='left'>");
	strContent.append("<table class='table-col' align='left' width='528' cellspacing='0' cellpadding='0' border='0' style='table-layout: fixed;'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-col-td' width='528' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;' valign='top' align='left'>");
	strContent.append("<table class='table-space' height='16' style='height: 16px; font-size: 0px; line-height: 0; width: 528px; background-color: #ffffff;' width='528' bgcolor='#FFFFFF' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-space-td' valign='middle' height='16' style='height: 16px; width: 528px; background-color: #ffffff;' width='528' bgcolor='#FFFFFF' align='left'>&nbsp;</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<div style='font-family: Arial, sans-serif; line-height: 19px; color: #777777; font-size: 14px; text-align: center;'>2017 SysOps Automation</div>");
	strContent.append("<table class='table-space' height='12' style='height: 12px; font-size: 0px; line-height: 0; width: 528px; background-color: #ffffff;' width='528' bgcolor='#FFFFFF' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-space-td' valign='middle' height='12' style='height: 12px; width: 528px; background-color: #ffffff;' width='528' bgcolor='#FFFFFF' align='left'>&nbsp;</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-space' height='16' style='height: 16px; font-size: 0px; line-height: 0; width: 528px; background-color: #ffffff;' width='528' bgcolor='#FFFFFF' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-space-td' valign='middle' height='16' style='height: 16px; width: 528px; background-color: #ffffff;' width='528' bgcolor='#FFFFFF' align='left'>&nbsp;</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("<table class='table-space' height='8' style='height: 8px; font-size: 0px; line-height: 0; width: 600px; background-color: #e4e6e9;' width='600' bgcolor='#E4E6E9' cellspacing='0' cellpadding='0' border='0'>");
	strContent.append("<tbody>");
	strContent.append("<tr>");
	strContent.append("<td class='table-space-td' valign='middle' height='8' style='height: 8px; width: 600px; background-color: #e4e6e9;' width='600' bgcolor='#E4E6E9' align='left'>&nbsp;</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</td>");
	strContent.append("</tr>");
	strContent.append("</tbody>");
	strContent.append("</table>");
	strContent.append("</body></html>");*/
	}
	else{
		strContent = new StringBuilder();
	}
	return strContent.toString();
}
	
}
