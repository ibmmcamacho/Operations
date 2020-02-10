package com.pe.ibm.test;

public class testSendGrid {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		
		
		
		String a= "";
		String b= "actualizacion||1231||123||123||12dsfg||gfhdfh";
		System.out.println(b.replaceAll("\\|\\|", ""));
		
		
		/*final String username = "apikey";
		final String password = "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";
	
//		final String username = "manuel20027@gmail.com";
//		final String password = "c2r6in0nuevaVida";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.smtp.host", "smtp.gmail.com");
		
		props.put("mail.smtp.host", "smtp.sendgrid.net");
		props.put("mail.smtp.port", "587");
		
//		props.put("mail.smtp.host", "relay.jangosmtp.net");
//		props.put("mail.smtp.port", "25");

		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
*/
		
		
		

//		final String username = "manuel20027@gmail.com";
//		final String password = "c2r6in0nuevaVida";
//
//		Properties props = new Properties();
//		props.put("mail.smtp.auth", "true");
//		props.put("mail.smtp.starttls.enable", "true");
//		props.put("mail.smtp.host", "smtp.gmail.com");
//		props.put("mail.smtp.port", "587");

//		Session session = Session.getInstance(props,
//		  new javax.mail.Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(username, password);
//			}
//		  });
	
	/*	try {

			MimeMessage  message = new MimeMessage(session);
			message.setFrom(new InternetAddress("noreply@pe.ibm.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse("mcamacho@pe.ibm.com"));
			message.setSubject("Testing Subject");
			String strContent = getMessage();
			message.setText(strContent, "utf-8", "html");

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}*/
		
		
		
		
		
		
		
		
		
		
		
		
		
//		try {
//
//			Message message = new MimeMessage(session);
//			message.setFrom(new InternetAddress("mcamacho@pe.ibm.com"));
//			message.setRecipients(Message.RecipientType.TO,
//				InternetAddress.parse("mcamacho@pe.ibm.com"));
//			message.setSubject("Testing Subject");
//			message.setText("Dear Mail Crawler,"
//				+ "\n\n No spam to my email, please!");
//
//			Transport.send(message);
//
//			System.out.println("Done");
//
//		} catch (MessagingException e) {
//			System.out.println(e);
//			throw new RuntimeException(e);
//		}
		

	}
	
	public static String getMessage(){
		StringBuilder strContent = new StringBuilder();
		
		strContent.append("<!DOCTYPE html>");
		strContent.append("<html xmlns='http://www.w3.org/1999/xhtml'><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>");
		strContent.append("<meta name='viewport' content='initial-scale=1.0'>");
		strContent.append("<meta name='format-detection' content='telephone=no'>");
		strContent.append("<title></title>");
		strContent.append("<style type='text/css'>body{width:100%;margin:0;padding:0;-webkit-font-smoothing:antialiased}@media only screen and (max-width: 600px){table[class='table-row']{float:none !important;width:98% !important;padding-left:20px !important;padding-right:20px !important}table[class='table-row-fixed']{float:none !important;width:98% !important}table[class='table-col'],table[class='table-col-border']{float:none !important;width:100% !important;padding-left:0 !important;padding-right:0 !important;table-layout:fixed}td[class='table-col-td']{width:100% !important}table[class='table-col-border'] + table[class='table-col-border']{padding-top:12px;margin-top:12px;border-top:1px solid #E8E8E8}table[class='table-col'] + table[class='table-col']{margin-top:15px}td[class='table-row-td']{padding-left:0 !important;padding-right:0 !important}table[class='navbar-row'],td[class='navbar-row-td']{width:100% !important}img{max-width:100% !important;display:inline !important}img[class='pull-right']{float:right;margin-left:11px;max-width:125px !important;padding-bottom:0 !important}img[class='pull-left']{float:left;margin-right:11px;max-width:125px !important;padding-bottom:0 !important}table[class='table-space'],table[class='header-row']{float:none !important;width:98% !important}td[class='header-row-td']{width:100% !important}}@media only screen and (max-width: 480px){table[class='table-row']{padding-left:16px !important;padding-right:16px !important}}@media only screen and (max-width: 320px){table[class='table-row']{padding-left:12px !important;padding-right:12px !important}}@media only screen and (max-width: 608px){td[class='table-td-wrap']{width:100% !important}}</style>");
		strContent.append(" </head>");
		strContent.append(" <body style='font-family: Arial, sans-serif; font-size:13px; color: #444444; min-height: 200px;' bgcolor='#E4E6E9' leftmargin='0' topmargin='0' marginheight='0' marginwidth='0'>");
		strContent.append("<table width='100%' height='100%' bgcolor='#E4E6E9' cellspacing='0' cellpadding='0' border='0'>");
		strContent.append("<tbody>");
		strContent.append("<tr>");
		strContent.append("<td width='100%' align='center' valign='top' bgcolor='#E4E6E9' style='background-color:#E4E6E9; min-height: 200px;'>");
		strContent.append("<table>");
		strContent.append("<tbody>");
		strContent.append("<tr>");
		strContent.append("<td class='table-td-wrap' align='center' width='608'>");
		strContent.append("<div style='font-family: Arial, sans-serif; line-height: 32px; color: #444444; font-size: 13px;'> No puedes leer este email? visita nuesto sitio web <a href='http://129.39.179.13/WebOperations/' style='color: #478fca; text-decoration: none; font-size: 14px; background-color: transparent;'>");
		strContent.append("     Web Operations");
		strContent.append("  </a> </div>");
		strContent.append("<table class='table-row' style='table-layout: auto; padding-right: 24px; padding-left: 24px; width: 600px; background-color: #ffffff;' bgcolor='#FFFFFF' width='600' cellspacing='0' cellpadding='0' border='0'>");
		strContent.append("<tbody>");
		strContent.append("<tr height='55px' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; height: 55px;'>");
		strContent.append("<td class='table-row-td' style='height: 55px; padding-right: 16px; font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal; vertical-align: middle;' valign='middle' align='left'>");
		strContent.append("<a href='#' style='color: #428bca; text-decoration: none; padding: 0px; font-size: 18px; line-height: 20px; height: 50px; background-color: transparent;'> <img src='https://image.ibb.co/ihniqk/ibmlogo.png' alt='logo ibm'> </a>");
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
		strContent.append("<br> TELEFONICA");
		strContent.append("<br> <img src='https://image.ibb.co/jOcBbQ/ORO.png' alt='oro'>");
		strContent.append("<br> <strong><span id='spMaximoCliente'></span></strong> </span>");
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("</tbody>");
		strContent.append("</table>");
		strContent.append("<table class='table-col-border' align='left' width='181' style='padding-right: 16px; table-layout: fixed;' cellspacing='0' cellpadding='0' border='0'>");
		strContent.append("<tbody>");
		strContent.append("<tr>");
		strContent.append("<td class='table-col-td' width='165' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;' valign='top' align='center'> <span style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px;'>");
		strContent.append("<span style='color: #5b7a91; text-decoration: none; background-color: transparent;'><b>IMPACTO</b></span>");
		strContent.append("<br> <strong><span id='spMaximoImpacto'></span></strong> </span>");
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("</tbody>");
		strContent.append("</table>");
		strContent.append("<table class='table-col-border' align='left' width='165' cellspacing='0' cellpadding='0' border='0' style='table-layout: fixed;'>");
		strContent.append("<tbody>");
		strContent.append("<tr>");
		strContent.append("<td class='table-col-td' width='165' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;' valign='top' align='center'> <span style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px;'>");
		strContent.append("<span style='color: #5b7a91; text-decoration: none; background-color: transparent;'><b>ESTADO</b></span>");
		strContent.append("<br> <strong><span id='spMaximoEstado'></span></strong> </span>");
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
		strContent.append("<div style='text-align: left;'> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Cliente:</span> <span id='spMaximoCliente'></span>");
		strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Clasificacion:</span> <span id='spMaximoClasificacion'></span>");
		strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Tiene SLA:</span> <span id='spMaximoSLA'></span>");
		strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Otros clientes afectados:</span> <span id='spMaximoOtrosClientes'></span>");
		strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Prioridad Inicial:</span> <span id='spMaximoPrioridadInicial'></span>");
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
		strContent.append("<div style='text-align: left;'> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Estado:</span> <span id='spAlertaEstado'></span>");
		strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Prioridad Actual:</span> <span id='spAlertaPrioridad'></span>");
		strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Hora de Ocurrencia:</span> <span id='spAlertaHoraOcurrencia'></span>");
		strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Hora de restauracion:</span> <span id='spAlertaHoraRestauracion'></span>");
		strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Prioridad Inicial:</span> <span id='spAlertaPrioridadInicial'></span>");
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
		strContent.append("<div style='text-align: left;'> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Servicio Impactado:</span> <span id='spAlertaServicioImpactado'></span>");
		strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Declaracion de Impacto:</span> <span id='spAlertaDeclaracionImpacto'></span>");
		strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Crisis de turno:</span> <span id='spAlertaCrisisTurno'></span>");
		strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>PM:</span> <span id='spAlertaPm'></span>");
		strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Supervisor:</span> <span id='spAlertaSupervisor'></span>");
		strContent.append("<br> </div>");
		strContent.append("</td>");
		strContent.append("</tr>");
		strContent.append("</tbody>");
		strContent.append("</table>");
		strContent.append("<table class='table-col' align='left' width='255' cellspacing='0' cellpadding='0' border='0' style='table-layout: fixed;'>");
		strContent.append("<tbody>");
		strContent.append("<tr>");
		strContent.append("<td class='table-col-td' width='255' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;' valign='top' align='left'>");
		strContent.append("<div style='text-align: left;'> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Tipo de error:</span> <span id='spAlertaTipoError'></span>");
		strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Team de apoyo:</span> <span id='spAlertaTeamApoyo'></span>");
		strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Atribución del incidente:</span> <span id='spAlertaAtribucionIncidente'></span>");
		strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>DataCenter:</span> <span id='spAlertaDataCenter'></span>");
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
		strContent.append("<td class='header-row-td' width='255' style='font-family: Arial, sans-serif; font-weight: normal; line-height: 19px; color: #6397bf; margin: 0px; font-size: 17px; padding-bottom: 8px; padding-top: 0px;' valign='top' align='left'>Historial de Eventos</td>");
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
		strContent.append("<tr style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px;'>");
		strContent.append("<td class='table-row-td' style='padding-right: 16px; padding-bottom: 12px; font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;' valign='top' align='left'> <span style='font-family: Arial, sans-serif; line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Wednesday</span>");
		strContent.append("<br> 19/11/2013 </td>");
		strContent.append("<td class='table-row-td' style='padding-bottom: 12px; font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;' valign='top' align='left'> <b>Convallis eget nisi mauris a sagittis dui </b>");
		strContent.append("<br> Fusce sit amet libero sit amet erat venenatis sollicitudin vitae </td>");
		strContent.append("</tr>");
		strContent.append("<tr style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px;'>");
		strContent.append("<td class='table-row-td' style='padding-right: 16px; font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;' valign='top' align='left'> <span style='font-family: Arial, sans-serif; line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Monday</span>");
		strContent.append("<br> 02/02/2014 </td>");
		strContent.append("<td class='table-row-td' style='font-family: Arial, sans-serif; line-height: 19px; color: #444444; font-size: 13px; font-weight: normal;' valign='top' align='left'> <b>Pellentesque sem dolor, fringilla et pharetra vitae</b>");
		strContent.append("<br> Sed iaculis pulvinar ligula, ornare fringilla ante viverra et</td>");
		strContent.append("</tr>");
		strContent.append("</tbody>");
		strContent.append("</table>");
		strContent.append("</div>");
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
		strContent.append("<div style='text-align: left;'> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Ticket de problema:</span> <span id='spAlertaTicketProblema'></span>");
		strContent.append("<br> <span style='font-family: Arial, sans-serif;  line-height: 19px; color: #478fca; font-size: 13px; font-weight: bold;'>Ticket de Cambio:</span> <span id='spAlertaTicketCambio'></span>");
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
		strContent.append("</body></html>");

		
		
		return strContent.toString(); 
	}

}
