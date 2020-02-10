package com.pe.ibm.test;

import java.io.IOException;
import java.net.URL;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.xml.soap.MessageFactory;
import javax.xml.soap.MimeHeaders;
import javax.xml.soap.SOAPBody;
import javax.xml.soap.SOAPConnection;
import javax.xml.soap.SOAPConnectionFactory;
import javax.xml.soap.SOAPElement;
import javax.xml.soap.SOAPEnvelope;
import javax.xml.soap.SOAPMessage;
import javax.xml.soap.SOAPPart;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.w3c.dom.NodeList;

import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanUAT;
import com.pe.ibm.dao.DaoUATImpl;
import com.pe.ibm.interfac.DaoUAT;
import com.pe.ibm.util.MyBatisUtil;

public class testMain {

	/**
     * Starting point for the SAAJ - SOAP Client Testing
	 * @throws ParseException 
	 * @throws IOException 
     */
    public static void main(String args[]) throws ParseException, IOException {
    	
    	try {
    		
    		
    		SqlSessionFactory ssf;
    		ssf = new MyBatisUtil().getSqlSessionFactory();
    		DaoUAT dao = new DaoUATImpl();
    		BeanUAT bean = new BeanUAT(); 
    		bean.setiTipo(1);
    		bean.setiIdRequerimiento(0);
    		bean.setStrTipoRequerimiento("DEMANDA");
    		bean.setStrIdTicket("CH1000000");
    		bean.setStrIdCar("100000000");
    		bean.setStrHostname("PRDUAT001");
    		bean.setiIdPlataforma(10);
    		bean.setiIdAmbiente(10);
    		bean.setiIdUsuario(10);
    		
    		SqlSession session = null;
    		session = ssf.openSession(true);
    		System.out.println(dao.mantenimientoUAT(bean, session));
    		

    		//Get the jvm heap size.
            long heapSize = Runtime.getRuntime().totalMemory();

            //Print the jvm heap size.
            System.out.println("Heap Size = " + heapSize);
            
            return;
    		
    		
    		
//			Document doc = docBuilder
//					.parse(new File(AppUtils.class.getResource("/").getPath() + File.separator + "operationsProperty.xml"));
    		
//            File archivo = new File("/operationsProperty.xml");
//            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();

            
            
//            DocumentBuilder documentBuilder = dbf.newDocumentBuilder();
//            Document document = documentBuilder.parse(new File(AppUtils.class.getResource("/").getPath() + File.separator + "operationsProperty.xml"));
//            document.getDocumentElement().normalize();
//            System.out.println("Elemento raiz:" + document.getDocumentElement().getNodeName());
//            
//            NodeList listQuerys = document.getElementsByTagName("query");
//			// int totalQueries = listQueries.getLength();
//
//			for (int s = 0; s < listQuerys.getLength(); s++) {
//				Node querys = listQuerys.item(s);
//				if(querys.getAttributes().item(0).getTextContent().equals(""))
//					querys.getTextContent().trim();
//			}
//            
//            System.out.println("RUTA ==> " + new File(AppUtils.class.getResource("/").getPath() + File.separator + "operationsProperty.xml"));
            
            
            
            
            
            
//            NodeList listQuerys = document.getElementsByTagName("querys");
//            for (int temp = 0; temp < listQuerys.getLength(); temp++) {
//                Node nodo = listQuerys.item(temp);
//                System.out.println("Elemento:" + nodo.getNodeName());
//                if (nodo.getNodeType() == Node.ELEMENT_NODE) {
//                    Element element = (Element) nodo;
//                    
//                    NodeList user = elements.getElementsByTagName("query");
//    				Element userElement = (Element) user.item(0);
//    				NodeList textoUserElement = userElement.getChildNodes();
//    				setUserOrig(((Node) textoUserElement.item(0)).getNodeValue().trim());
//                    
//                    
//                    System.out.println("query1: " + element. getAttribute("mxticketP1PendientesTotal"));
//                    System.out.println("query2: " + element.getAttribute("mxticketP1PendientesxFecha"));
//                    System.out.println("query3: " + element.getAttribute("mxticketP1AtendidosxFecha"));
//                    System.out.println("query4: " + element.getAttribute("mxticketP1TodoxFecha"));
                    
//                    System.out.println("Nombre: " + element.getElementsByTagName("nombre").item(0).getTextContent());
//                    System.out.println("username: " + element.getElementsByTagName("username").item(0).getTextContent());
//                    System.out.println("password: " + element.getElementsByTagName("321423").item(0).getTextContent());
//                }
//            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
//    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-ddTHH:mm:ss");
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		
//		sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
		String strdt1 = "2019-02-27T10:28:32-05:00";
		Date firstDate = sdf.parse(strdt1);
//		Date secondDate = sdf.parse("2018-11-10");
		
		
		
		
		long diffInMillies = Math.abs(new Date().getTime() - firstDate.getTime());
		long diff = TimeUnit.MINUTES.convert(diffInMillies, TimeUnit.MILLISECONDS);
		System.out.println(diff);
		System.out.println(sdf2.format(firstDate).substring(1, 7));

    	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		Date fechaInicial=dateFormat.parse("2016-02-14");
//		Date fechaFinal=dateFormat.parse("2016-03-22");
//		int dias=(int) ((fechaFinal.getTime()-fechaInicial.getTime())/86400000);
//		System.out.println("Hay "+dias+" dias de diferencia");
    	
    	
//    	Date fechaInicial=dateFormat.parse("2018-04-25");
//    	Date fechaFinal=sumarDiasAFecha(fechaInicial, 1);
//    	System.out.println(dateFormat.format(fechaFinal));
    	
//    	String a = "bueno días peru";
//    	System.out.println(a.contains("dí"));
    	
    	
    	
    	
//    	String ws = "http://ismdev.ecampus.com.pe/meaweb/services/MOB_TICKETWL";
//    	System.out.println(ws);
//    	System.out.println(ws.indexOf("/", 8));
//    	System.out.println(ws.substring(0, (ws.indexOf("/", 8) + 1)));
//    	System.out.println(ws.substring((ws.indexOf("/", 8)), ws.length()));
    	
//    	String vdemo1 = "Senores,URGENTE, revisar la conexion de los servidores Softlayer con IBM.Cuando estoy en el servidor 10.102.9.40 - Softlayer y hago ping a los servidores 10.52.1.18(IBM) y 10.52.1.19 (IBM)no responde, pero con el servidor 10.52.3.37(IBM) si responde. Adjunto evidencia 10.52.3.37 y 10.52.1.19:body { margin: 0 0 0 0; padding:0 0 0 0 }td,div { font-family:Arial;font-size:10pt;vertical-align:top }/* Copyright IBM Corp. 2016  All Rights Reserved.                    */body { margin: 0 0 0 0; padding:0 0 0 0; overflow:hidden; background-color:#fafafa; }.grayBackground { background-color:#f6f6f6; }.transcript { background-color:#d2d2d2;}.messageBlock {padding-left:10px; padding-right:10px;padding-top:0}.expansion{height:10px;width:100%;overflow:hidden;}.expansionx{height:10px;overflow:hidden;}.line{height:1px;background-color:#cccccc;overflow:hidden;}.message { padding-left:0px; padding-right:65px;margin-left:0px; word-wrap:break-word; white-space:-moz-pre-wrap; _white-space:pre; white-space:pre-wrap; }.messageCont { padding-left:0px; margin-left:95px; word-wrap:break-word; white-space:-moz-pre-wrap; _white-space:pre;white-space:pre-wrap;}.other { font-size:11px;color:#1970b0;vertical-align:top;font-weight:bold;font-style:normal;float:left; width:95px; white-space:nowrap; padding-top:2px; }.myself { font-size:11px;color:#222222;font-style:normal;font-weight:bold;font-style:normal;float:left; width:95px; white-space:nowrap; padding-top:2px; }.otherCont { font-size:8px;text-align:right; color:#1970b0;font-family:Arial,Lucida Grande;font-style:normal;vertical-align:top;font-weight:bold;float:left; width:95px; }.myselfCont { font-size:8px;text-align:right; color:#222222;font-family:Arial,Lucida Grande;font-style:normal;vertical-align:top;font-weight:bold;float:left; width:95px; }.system { font-size:11px; word-wrap:break-word;color:#d13f08;font-style:normal;font-weight:normal; white-space:-moz-pre-wrap; _white-space:pre;white-space:pre-wrap; }.showTimestamp { padding-left:20px;font-size:11px; float:right; color:#999999;font-style:normal;font-weight:normal; }.other1 { font-size:11px; color:#ba006e;vertical-align:top;font-weight:bold;font-style:normal;float:left; width:95px; padding-top:2px; }.otherCont1 { font-size:8px;text-align:right; color:#ba006e;font-family:Arial,Lucida Grande;font-style:normal;vertical-align:top;font-weight:bold;float:left; width:95px; }.other2 { font-size:11px; color:#007670;vertical-align:top;font-weight:bold;font-style:normal;float:left; width:95px; padding-top:2px; }.otherCont2 { font-size:8px;text-align:right; color:#007670;font-family:Arial,Lucida Grande;font-style:normal;vertical-align:top;font-weight:bold;float:left; width:95px; }.other3 { font-size:11px; color:#3b0256;vertical-align:top;font-weight:bold;font-style:normal;float:left; width:95px; padding-top:2px; }.otherCont3 { font-size:8px;text-align:right; color:#3b0256;font-family:Arial,Lucida Grande;font-style:normal;vertical-align:top;font-weight:bold;float:left; width:95px; }.other4 { font-size:11px; color:#00512b;vertical-align:top;font-weight:bold;font-style:normal;float:left; width:95px; padding-top:2px; }.otherCont4 { font-size:8px;text-align:right; color:#00512b;font-family:Arial,Lucida Grande;font-style:normal;vertical-align:top;font-weight:bold;float:left; width:95px; }.other5 { font-size:11px; color:#a91024;vertical-align:top;font-weight:bold;font-style:normal;float:left; width:95px; padding-top:2px;}.otherCont5 { font-size:8px;text-align:right; color:#a91024;font-family:Arial,Lucida Grande;font-style:normal;vertical-align:top;font-weight:bold;float:left; width:95px; }.other6 { font-size:11px; color:#b8471b;vertical-align:top;font-weight:bold;font-style:normal;float:left; width:95px; padding-top:2px;}.otherCont6 { font-size:8px;text-align:right; color:#b8471b;font-family:Arial,Lucida Grande;font-style:normal;vertical-align:top;font-weight:bold;float:left; width:95px; }.other7 { font-size:11px; color:#7f1c7d;vertical-align:top;font-weight:bold;font-style:normal;float:left; width:95px; padding-top:2px;}.otherCont7 { font-size:8px;text-align:right; color:#7f1c7d;font-family:Arial,Lucida Grande;font-style:normal;vertical-align:top;font-weight:bold;float:left; width:95px; }.highlight { background-color:#bed6f8; }.datestamp { padding-right:0px; font-size:11px; cursor:default;padding-top:1px;padding-bottom:1px; background-color:#a7a7a7; width:100%; float:left; text-align:right; color:#333333; font-weight:bold; font-style:italic; }#chatAlert { float:left; border-bottom:1px solid #E8D091; padding:6px; width:100%; color:#A5754C; }#chatAlertImage { float:left; }#chatAlertText { float:left; margin-left:6px; margin-right:10px;}#chatAlertClose { float:right; margin-right:10px; padding-right:6px; margin-top:0px; }#chatAlertText a { color:#A5754C; }#chatAlertText a:hover { color:#A5754C; text-decoration:none; }.tsDisplay { display:block }.dsDisplay { display:none }reiniciar el tunel";
//    		
//    		System.out.println(vdemo1.length());
//    		System.out.println(vdemo1.substring(0, 3999));
    		
    }
    
    public static Date sumarDiasAFecha(Date fecha, int dias){
        if (dias==0) return fecha;
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(fecha); 
        calendar.add(Calendar.DAY_OF_YEAR, dias);  
        return calendar.getTime(); 
  }
    
    
    private static void sendMail() {
    	 try {
             // Create SOAP Connection
             SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
             SOAPConnection soapConnection = soapConnectionFactory.createConnection();
             BeanMaximo pobjBeanMaximo = new BeanMaximo();
             pobjBeanMaximo.setSysUser("mcamacho@pe.ibm.com");
             pobjBeanMaximo.setSysPwd("c2r6in0intranet1");
             pobjBeanMaximo.setIdTicket("PR1173");
             URL url = null;
             SOAPMessage soapResponse = null;
             
             
             if(pobjBeanMaximo.getIdTicket().substring(1, 2).equals("SR")){
             	url = new URL("http://129.39.178.96/meaweb/services/DS_SR");
             	soapResponse = soapConnection.call(createSOAPRequestServicios(pobjBeanMaximo), url);
             }else if(pobjBeanMaximo.getIdTicket().substring(1, 2).equals("IN")){
             	url = new URL("http://129.39.178.96/meaweb/services/DS_INCIDENT");
             	soapResponse = soapConnection.call(createSOAPRequestIncidentes(pobjBeanMaximo), url);
             }else if(pobjBeanMaximo.getIdTicket().substring(1, 2).equals("PR")){
             	url = new URL("http://129.39.178.96/meaweb/services/DS_PROBLEM");
             	soapResponse = soapConnection.call(createSOAPRequestProblemas(pobjBeanMaximo), url);
             }
             // Send SOAP Message to SOAP Server
//             String url = "http://ws.cdyne.com/emailverify/Emailvernotestemail.asmx";
//             URL url = new URL("http://129.39.178.96/meaweb/services/DS_SR");
//             URL url = new URL("http://129.39.178.96/meaweb/services/DS_INCIDENT");
             
             NodeList bodyMessage = soapResponse.getSOAPBody().getElementsByTagName("PROBLEM");
             
             for(int i = 0 ; i < bodyMessage.getLength() ; i ++){
             	NodeList c = bodyMessage.item(i).getChildNodes();
             	for(int j = 0 ; j < c.getLength() ; j ++){
             		System.out.println(c.item(j).getNodeName());
             		System.out.println(c.item(j).getTextContent());
             	}
             	System.out.println(bodyMessage.item(i).getTextContent());
             }
             
             soapConnection.close();
         } catch (Exception e) {
             System.err.println("Error occurred while sending SOAP Request to Server");
             System.out.println(e.getCause().getMessage());
             e.printStackTrace();
         }
    }
    
    private static SOAPMessage createSOAPRequestIncidentes(BeanMaximo pobjBeanMaximo) throws Exception {
        MessageFactory messageFactory = MessageFactory.newInstance();
        SOAPMessage soapMessage = messageFactory.createMessage();
        SOAPPart soapPart = soapMessage.getSOAPPart();

        String serverURI = "http://www.ibm.com/maximo";

        // SOAP Envelope
        SOAPEnvelope envelope = soapPart.getEnvelope();
        envelope.addNamespaceDeclaration("max", serverURI);

        // SOAP Body
        SOAPBody soapBody = envelope.getBody();
        SOAPElement soapBodyElem1 = soapBody.addChildElement("QueryDS_INCIDENT", "max");
	    SOAPElement soapBodyElem2 = soapBodyElem1.addChildElement("DS_INCIDENTQuery", "max");
	    SOAPElement soapBodyElem3 = soapBodyElem2.addChildElement("INCIDENT", "max");
	    SOAPElement soapBodySubElem1 = soapBodyElem3.addChildElement("CLASS", "max");
	    soapBodySubElem1.addTextNode("IN");
	    SOAPElement soapBodySubElem2 = soapBodyElem3.addChildElement("TICKETID", "max");
	    soapBodySubElem2.addTextNode(pobjBeanMaximo.getIdTicket());
	      
	    String authorization = new sun.misc.BASE64Encoder().encode((pobjBeanMaximo.getSysUser()+":"+pobjBeanMaximo.getSysPwd()).getBytes());
	    System.out.println(authorization);
        MimeHeaders hd = soapMessage.getMimeHeaders();
        hd.addHeader("SOAPAction", "urn:processDocument");
        hd.addHeader("Authorization", "Basic " + authorization);

        soapMessage.saveChanges();

        /* Print the request message */
//        System.out.print("Request SOAP Message = ");
//        soapMessage.writeTo(System.out);

        return soapMessage;
    }
    
    
    private static SOAPMessage createSOAPRequestProblemas(BeanMaximo pobjBeanMaximo) throws Exception {
        MessageFactory messageFactory = MessageFactory.newInstance();
        SOAPMessage soapMessage = messageFactory.createMessage();
        SOAPPart soapPart = soapMessage.getSOAPPart();

        String serverURI = "http://www.ibm.com/maximo";

        // SOAP Envelope
        SOAPEnvelope envelope = soapPart.getEnvelope();
        envelope.addNamespaceDeclaration("max", serverURI);

        // SOAP Body
        SOAPBody soapBody = envelope.getBody();
        SOAPElement soapBodyElem1 = soapBody.addChildElement("QueryDS_PROBLEM", "max");
	    SOAPElement soapBodyElem2 = soapBodyElem1.addChildElement("DS_PROBLEMQuery", "max");
	    SOAPElement soapBodyElem3 = soapBodyElem2.addChildElement("PROBLEM", "max");
	    SOAPElement soapBodySubElem1 = soapBodyElem3.addChildElement("CLASS", "max");
	    soapBodySubElem1.addTextNode("PR");
	    SOAPElement soapBodySubElem2 = soapBodyElem3.addChildElement("TICKETID", "max");
	    soapBodySubElem2.addTextNode(pobjBeanMaximo.getIdTicket());
	      
	    String authorization = new sun.misc.BASE64Encoder().encode((pobjBeanMaximo.getSysUser()+":"+pobjBeanMaximo.getSysPwd()).getBytes());
	    System.out.println(authorization);
        MimeHeaders hd = soapMessage.getMimeHeaders();
        hd.addHeader("SOAPAction", "urn:processDocument");
        hd.addHeader("Authorization", "Basic " + authorization);

        soapMessage.saveChanges();

        /* Print the request message */
//        System.out.print("Request SOAP Message = ");
//        soapMessage.writeTo(System.out);

        return soapMessage;
    }
    
    
    private static SOAPMessage createSOAPRequestServicios(BeanMaximo pobjBeanMaximo) throws Exception {
        MessageFactory messageFactory = MessageFactory.newInstance();
        SOAPMessage soapMessage = messageFactory.createMessage();
        SOAPPart soapPart = soapMessage.getSOAPPart();

        String serverURI = "http://www.ibm.com/maximo";

        // SOAP Envelope
        SOAPEnvelope envelope = soapPart.getEnvelope();
        envelope.addNamespaceDeclaration("max", serverURI);

        // SOAP Body
        SOAPBody soapBody = envelope.getBody();
	    SOAPElement soapBodyElem1 = soapBody.addChildElement("QueryDS_SR", "max");
	    SOAPElement soapBodyElem2 = soapBodyElem1.addChildElement("DS_SRQuery", "max");
	    SOAPElement soapBodyElem3 = soapBodyElem2.addChildElement("SR", "max");
	    SOAPElement soapBodySubElem1 = soapBodyElem3.addChildElement("CLASS", "max");
	    soapBodySubElem1.addTextNode("SR");
	    SOAPElement soapBodySubElem2 = soapBodyElem3.addChildElement("TICKETID", "max");
	    soapBodySubElem2.addTextNode(pobjBeanMaximo.getIdTicket());
	      
	    String authorization = new sun.misc.BASE64Encoder().encode((pobjBeanMaximo.getSysUser()+":"+pobjBeanMaximo.getSysPwd()).getBytes());
	    System.out.println(authorization);
        MimeHeaders hd = soapMessage.getMimeHeaders();
        hd.addHeader("SOAPAction", "urn:processDocument");
        hd.addHeader("Authorization", "Basic " + authorization);

        soapMessage.saveChanges();

        /* Print the request message */
//        System.out.print("Request SOAP Message = ");
//        soapMessage.writeTo(System.out);

        return soapMessage;
    }
    
}
