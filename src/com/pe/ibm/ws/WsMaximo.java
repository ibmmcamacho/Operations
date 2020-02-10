package com.pe.ibm.ws;

import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLStreamHandler;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.xml.soap.MessageFactory;
import javax.xml.soap.MimeHeaders;
import javax.xml.soap.SOAPBody;
import javax.xml.soap.SOAPConnection;
import javax.xml.soap.SOAPConnectionFactory;
import javax.xml.soap.SOAPElement;
import javax.xml.soap.SOAPEnvelope;
import javax.xml.soap.SOAPMessage;
import javax.xml.soap.SOAPPart;

import org.apache.ibatis.session.SqlSessionFactory;
import org.w3c.dom.NodeList;

import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanMaximoWorklog;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessOptions;
import com.pe.ibm.util.AppUtils;

public class WsMaximo {
	
	int iTimeOutConnect = 10000; //10 seg
	int iTimeOutRead = 60000; // 1 min
		
	public List<BeanMaximo> wsConsultaTicketsPrioridad1(BeanSession pobjBeanSession, SqlSessionFactory ssf){
		
		List<BeanMaximo> listBeanMaximo = new ArrayList<BeanMaximo>();
		BeanMaximo objBeanMaximo = new BeanMaximo();
		BusinessOptions objBusinessOptions = new BusinessOptions();
		List<BeanOptions> listOption = null;
		
	try {
        // Create SOAP Connection
        SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
        SOAPConnection soapConnection = soapConnectionFactory.createConnection();
        BusinessOptions objBusinessOption = new BusinessOptions();

        objBeanMaximo.setSysUser(pobjBeanSession.getObjBeanPersonal().getStrIdLogin());
        objBeanMaximo.setSysPwd(pobjBeanSession.getObjBeanPersonal().getStrClave());

        URL url = null;
        SOAPMessage soapResponse = null;
        
        BeanParameters objBeanParameters = new BeanParameters();
    	objBeanParameters.setStrType("WSMAXIMO");
    	objBeanParameters.setiTeam(pobjBeanSession.getObjBeanPersonal().getiTeam());
    	objBeanParameters.setStrValor1("TICKETS");
    	
    	NodeList bodyMessage = null;
    	
        List<BeanOptions> lstBeanOption = objBusinessOption.listOptions3(objBeanParameters, ssf);
        url = new URL(lstBeanOption.get(0).getStrDescripcion());
        soapResponse = soapConnection.call(createSOAPRequestServiciosP1(objBeanMaximo), url);
        	
        bodyMessage = soapResponse.getSOAPBody().getElementsByTagName("TICKET");
        
        
        for(int i = 0 ; i < bodyMessage.getLength() ; i ++){
        	NodeList c = bodyMessage.item(i).getChildNodes();
        	objBeanMaximo = new BeanMaximo();
        	for(int j = 0 ; j < c.getLength() ; j ++){
        		if(c.item(j).getNodeName().equals("TICKETID"))
        			objBeanMaximo.setIdTicket(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("DESCRIPTION"))
        			objBeanMaximo.setTicketTitulo(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("PLUSPCUSTOMER"))
        			objBeanMaximo.setTicketIdCliente(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("CREATIONDATE"))
        			objBeanMaximo.setTicketFechaCreacion(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("STATUS"))
        			objBeanMaximo.setTicketEstado(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("OWNER"))
        			objBeanMaximo.setTicketPropietario(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("OWNERGROUP"))
        			objBeanMaximo.setTicketIdGrupoPropietario(c.item(j).getTextContent());
        		
//        		System.out.println(c.item(j).getNodeName());
//        		System.out.println(c.item(j).getTextContent());
        	}
        	
        	listOption = objBusinessOption.listOptions3(new BeanParameters(objBeanMaximo.getTicketIdCliente(),"CLIENTE_ALERTA",pobjBeanSession.getObjBeanPersonal().getiTeam()),ssf);
    		objBeanMaximo.setTicketCliente(listOption.size() > 0 ? listOption.get(0).getStrDescripcion() : "");
    		
    		listOption = objBusinessOption.listOptions3(new BeanParameters(objBeanMaximo.getTicketIdGrupoPropietario(),"GRUPOPROPIETARIO_ALERTA",pobjBeanSession.getObjBeanPersonal().getiTeam()),ssf);
    		objBeanMaximo.setTicketGrupoPropietario(listOption.size() > 0 ? listOption.get(0).getStrDescripcion() : "");
        	
        	listBeanMaximo.add(objBeanMaximo);
        }
        
        soapConnection.close();
    } catch (Exception e) {
        System.err.println("Error occurred while sending SOAP Request to Server");
        System.out.println(e.getCause().getMessage());
        e.printStackTrace();
    }
    
    return listBeanMaximo;
}
	
	public BeanMaximo wsConsultaTicket(String strTicket, BeanSession pobjBeanSession, SqlSessionFactory ssf){
	
		BeanMaximo objBeanMaximo = new BeanMaximo();
		
	try {
        // Create SOAP Connection
        SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
        SOAPConnection soapConnection = soapConnectionFactory.createConnection();
        BusinessOptions objBusinessOption = new BusinessOptions();
        List<BeanOptions> listOption = null;
        //Asignacion de credenciales
        objBeanMaximo.setSysUser(pobjBeanSession.getObjBeanPersonal().getStrIdLogin());
        objBeanMaximo.setSysPwd(pobjBeanSession.getObjBeanPersonal().getStrClave());
        objBeanMaximo.setIdTicket(strTicket);
        URL url = null;
        SOAPMessage soapResponse = null;
        
        BeanParameters objBeanParameters = new BeanParameters();
	    	objBeanParameters.setStrType("WSMAXIMO");
	    	objBeanParameters.setiTeam(pobjBeanSession.getObjBeanPersonal().getiTeam());

        if(objBeanMaximo.getIdTicket().length() > 2 && objBeanMaximo.getIdTicket().substring(0, 2).equals("SR")){
        	objBeanParameters.setStrValor1("SERVICIO");
        	List<BeanOptions> lstBeanOption = objBusinessOption.listOptions3(objBeanParameters, ssf);
        	url = new URL(lstBeanOption.get(0).getStrDescripcion());
        	soapResponse = soapConnection.call(createSOAPRequestServicios(objBeanMaximo), url);
        	
        	NodeList bodyMessage = soapResponse.getSOAPBody().getElementsByTagName("SR");
            
            for(int i = 0 ; i < bodyMessage.getLength() ; i ++){
            	NodeList c = bodyMessage.item(i).getChildNodes();
            	for(int j = 0 ; j < c.getLength() ; j ++){
            		if(c.item(j).getNodeName().equals("TICKETID"))
            			objBeanMaximo.setIdTicket(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("DESCRIPTION"))
            			objBeanMaximo.setTicketTitulo(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("DESCRIPTION_LONGDESCRIPTION"))
            			objBeanMaximo.setTicketDetalle(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("PLUSPCUSTOMER"))
            			objBeanMaximo.setTicketIdCliente(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("INTERNALPRIORITY"))
            			objBeanMaximo.setTicketPrioridad(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("IMPACT"))
            			objBeanMaximo.setTicketImpact(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("URGENCY"))
            			objBeanMaximo.setTicketUrgencia(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("CREATIONDATE"))
            			objBeanMaximo.setTicketFechaCreacion(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("STATUS"))
            			objBeanMaximo.setTicketIdEstado(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("OWNERGROUP"))
            			objBeanMaximo.setTicketIdGrupoPropietario(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("OWNER"))
            			objBeanMaximo.setTicketPropietario(c.item(j).getTextContent());
            	}
            }
        }
        else if(objBeanMaximo.getIdTicket().length() > 2 && objBeanMaximo.getIdTicket().substring(0, 2).equals("IN")){
        	objBeanParameters.setStrValor1("INCIDENCIA");
        	List<BeanOptions> lstBeanOption = objBusinessOption.listOptions3(objBeanParameters, ssf);
        	url = new URL(lstBeanOption.get(0).getStrDescripcion());
        	soapResponse = soapConnection.call(createSOAPRequestIncidentes(objBeanMaximo), url);
        	
        	NodeList bodyMessage = soapResponse.getSOAPBody().getElementsByTagName("INCIDENT");
            
            for(int i = 0 ; i < bodyMessage.getLength() ; i ++){
            	NodeList c = bodyMessage.item(i).getChildNodes();
            	for(int j = 0 ; j < c.getLength() ; j ++){
            		if(c.item(j).getNodeName().equals("TICKETID"))
            			objBeanMaximo.setIdTicket(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("DESCRIPTION"))
            			objBeanMaximo.setTicketTitulo(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("DESCRIPTION_LONGDESCRIPTION"))
            			objBeanMaximo.setTicketDetalle(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("PLUSPCUSTOMER"))
            			objBeanMaximo.setTicketIdCliente(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("INTERNALPRIORITY"))
            			objBeanMaximo.setTicketPrioridad(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("IMPACT"))
            			objBeanMaximo.setTicketImpact(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("URGENCY"))
            			objBeanMaximo.setTicketUrgencia(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("CREATIONDATE"))
            			objBeanMaximo.setTicketFechaCreacion(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("STATUS"))
            			objBeanMaximo.setTicketIdEstado(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("OWNERGROUP"))
            			objBeanMaximo.setTicketIdGrupoPropietario(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("OWNER"))
            			objBeanMaximo.setTicketPropietario(c.item(j).getTextContent());
            	}
            }
        }
        else if(objBeanMaximo.getIdTicket().length() > 2 && objBeanMaximo.getIdTicket().substring(0, 2).equals("PR")){
        	objBeanParameters.setStrValor1("PROBLEMA");
        	List<BeanOptions> lstBeanOption = objBusinessOption.listOptions3(objBeanParameters, ssf);
        	url = new URL(lstBeanOption.get(0).getStrDescripcion());
        	soapResponse = soapConnection.call(createSOAPRequestProblemas(objBeanMaximo), url);
        	
        	NodeList bodyMessage = soapResponse.getSOAPBody().getElementsByTagName("PROBLEM");
            
            for(int i = 0 ; i < bodyMessage.getLength() ; i ++){
            	NodeList c = bodyMessage.item(i).getChildNodes();
            	for(int j = 0 ; j < c.getLength() ; j ++){
            		if(c.item(j).getNodeName().equals("TICKETID"))
            			objBeanMaximo.setIdTicket(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("DESCRIPTION"))
            			objBeanMaximo.setTicketTitulo(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("DESCRIPTION_LONGDESCRIPTION"))
            			objBeanMaximo.setTicketDetalle(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("PLUSPCUSTOMER"))
            			objBeanMaximo.setTicketIdCliente(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("INTERNALPRIORITY"))
            			objBeanMaximo.setTicketPrioridad(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("IMPACT"))
            			objBeanMaximo.setTicketImpact(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("URGENCY"))
            			objBeanMaximo.setTicketUrgencia(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("CREATIONDATE"))
            			objBeanMaximo.setTicketFechaCreacion(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("STATUS"))
            			objBeanMaximo.setTicketIdEstado(c.item(j).getAttributes().getNamedItem("maxvalue").getNodeValue());
            		else if(c.item(j).getNodeName().equals("OWNERGROUP"))
            			objBeanMaximo.setTicketIdGrupoPropietario(c.item(j).getTextContent());
            		else if(c.item(j).getNodeName().equals("OWNER"))
            			objBeanMaximo.setTicketPropietario(c.item(j).getTextContent());
            			
//            		System.out.println(c.item(j).getNodeName());
//            		System.out.println(c.item(j).getTextContent());
            	}
//            	System.out.println(bodyMessage.item(i).getTextContent());
            	System.out.println("Respuesta esperada OK.");
            }
        }
        else {
        	return objBeanMaximo;
        }
        // Send SOAP Message to SOAP Server
//        String url = "http://ws.cdyne.com/emailverify/Emailvernotestemail.asmx";
//        URL url = new URL("http://129.39.178.96/meaweb/services/DS_SR");
//        URL url = new URL("http://129.39.178.96/meaweb/services/DS_INCIDENT");
        
//        NodeList bodyMessage = soapResponse.getSOAPBody().getElementsByTagName("PROBLEM");
//        
//        for(int i = 0 ; i < bodyMessage.getLength() ; i ++){
//        	NodeList c = bodyMessage.item(i).getChildNodes();
//        	for(int j = 0 ; j < c.getLength() ; j ++){
//        		System.out.println(c.item(j).getNodeName());
//        		System.out.println(c.item(j).getTextContent());
//        	}
//        	System.out.println(bodyMessage.item(i).getTextContent());
//        }
        
        if(objBeanMaximo.getTicketTitulo() != null){
        listOption = objBusinessOption.listOptions3(new BeanParameters(objBeanMaximo.getTicketIdCliente(),"CLIENTE_ALERTA",pobjBeanSession.getObjBeanPersonal().getiTeam()),ssf);
		objBeanMaximo.setTicketCliente((listOption.size() > 0 ? listOption.get(0).getStrDescripcion().toString() : ""));
		
		listOption = objBusinessOption.listOptions3(new BeanParameters(objBeanMaximo.getTicketIdGrupoPropietario(),"GRUPOPROPIETARIO_ALERTA",pobjBeanSession.getObjBeanPersonal().getiTeam()),ssf);
		objBeanMaximo.setTicketGrupoPropietario((listOption.size() > 0 ? listOption.get(0).getStrDescripcion().toString() : ""));
		
		listOption = objBusinessOption.listOptions3(new BeanParameters(objBeanMaximo.getTicketIdEstado(),"ESTADOMAXIMO_ALERTA",pobjBeanSession.getObjBeanPersonal().getiTeam()),ssf);
		objBeanMaximo.setTicketEstado((listOption.size() > 0 ? listOption.get(0).getStrDescripcion().toString() : ""));
        }
        soapConnection.close();
    } catch (Exception e) {
        System.err.println("Error occurred while sending SOAP Request to Server");
        System.out.println(e.getMessage());
        e.printStackTrace();
    }
    
    return objBeanMaximo;
}
	
// #####################
// Servicio Sayri
// #####################

	public List<BeanMaximo> wsConsultarUltimo30TicketsCreados(BeanSession pobjBeanSession, SqlSessionFactory ssf){
		List<BeanMaximo> listBeanMaximo = new ArrayList<BeanMaximo>();
		BeanMaximo objBeanMaximo = new BeanMaximo();
		BusinessOptions objBusinessOptions = new BusinessOptions();
		List<BeanOptions> listOption = null;
		
	try {
        // Create SOAP Connection
        SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
        SOAPConnection soapConnection = soapConnectionFactory.createConnection();
        BusinessOptions objBusinessOption = new BusinessOptions();

        objBeanMaximo.setSysUser(pobjBeanSession.getObjBeanPersonal().getStrIdLogin());
        objBeanMaximo.setSysPwd(pobjBeanSession.getObjBeanPersonal().getStrClave());

        URL url = null;
        SOAPMessage soapResponse = null;
        
        BeanParameters objBeanParameters = new BeanParameters();
	    	objBeanParameters.setStrType("WSMAXIMO");
	    	objBeanParameters.setiTeam(pobjBeanSession.getObjBeanPersonal().getiTeam());
	    
	    	NodeList bodyMessage = null;
    		
        	objBeanParameters.setStrValor1("MOBILITY");
        	List<BeanOptions> lstBeanOption = objBusinessOption.listOptions3(objBeanParameters, ssf);
        	String ws = lstBeanOption.get(0).getStrDescripcion();
        	
        	url = new URL(new URL(ws.substring(0, (ws.indexOf("/", 8) + 1))),
        			ws.substring((ws.indexOf("/", 8)), ws.length()),
        			new URLStreamHandler() {
				@Override
				protected URLConnection openConnection(URL u) throws IOException {
					URL target = new URL(u.toString());
		              URLConnection connection = target.openConnection();
		              // Connection settings
		              connection.setConnectTimeout(iTimeOutConnect);
		              connection.setReadTimeout(iTimeOutRead);
		              return(connection);
				}
			});
//        	soapConnection.
        	soapResponse = soapConnection.call(createSOAPConsultar30UltimosTicketCreados(objBeanMaximo), url);
        	
        	bodyMessage = soapResponse.getSOAPBody().getElementsByTagName("TICKET");
        
        for(int i = 0 ; i < bodyMessage.getLength() ; i ++){
        	NodeList c = bodyMessage.item(i).getChildNodes();
        	objBeanMaximo = new BeanMaximo();
        	for(int j = 0 ; j < c.getLength() ; j ++){
        		if(c.item(j).getNodeName().equals("TICKETID"))
        			objBeanMaximo.setIdTicket(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("DESCRIPTION"))
        			objBeanMaximo.setTicketTitulo(AppUtils.eliminarTagsHTML(c.item(j).getTextContent()));
        		else if(c.item(j).getNodeName().equals("DESCRIPTION_LONGDESCRIPTION"))
        			objBeanMaximo.setTicketDetalle(AppUtils.eliminarTagsHTML(c.item(j).getTextContent()));
        		else if(c.item(j).getNodeName().equals("CREATIONDATE"))
        			objBeanMaximo.setTicketFechaCreacion(c.item(j).getTextContent().replaceAll("T", " ").replaceAll("-05:00", ""));
        		else if(c.item(j).getNodeName().equals("STATUS"))
        			objBeanMaximo.setTicketEstado(AppUtils.ConvertEstado(c.item(j).getTextContent()));
        		else if(c.item(j).getNodeName().equals("OWNER"))
        			objBeanMaximo.setTicketEmailPropietario(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("DISPLAYNAME"))
        			objBeanMaximo.setTicketPropietario(c.item(j).getTextContent());
        		
        	}
        	listBeanMaximo.add(objBeanMaximo);
        }
        
        
        soapConnection.close();
    } catch (Exception e) {

    	System.err.println("Error occurred while sending SOAP Request to Server");
        System.out.println(e.getCause().getMessage());
        e.printStackTrace();
    }
    
    return listBeanMaximo;
	}
	
	public List<BeanMaximo> wsConsultarMesActual(BeanSession pobjBeanSession, SqlSessionFactory ssf){
		List<BeanMaximo> listBeanMaximo = new ArrayList<BeanMaximo>();
		BeanMaximo objBeanMaximo = new BeanMaximo();
		BusinessOptions objBusinessOptions = new BusinessOptions();
		List<BeanOptions> listOption = null;
		
	try {
        // Create SOAP Connection
        SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
        SOAPConnection soapConnection = soapConnectionFactory.createConnection();
        BusinessOptions objBusinessOption = new BusinessOptions();

        objBeanMaximo.setSysUser(pobjBeanSession.getObjBeanPersonal().getStrIdLogin());
        objBeanMaximo.setSysPwd(pobjBeanSession.getObjBeanPersonal().getStrClave());

        URL url = null;
        SOAPMessage soapResponse = null;
        
        BeanParameters objBeanParameters = new BeanParameters();
	    	objBeanParameters.setStrType("WSMAXIMO");
	    	objBeanParameters.setiTeam(pobjBeanSession.getObjBeanPersonal().getiTeam());
	        
	    	NodeList bodyMessage = null;
    		
        	objBeanParameters.setStrValor1("MOBILITY");
        	List<BeanOptions> lstBeanOption = objBusinessOption.listOptions3(objBeanParameters, ssf);
        	String ws = lstBeanOption.get(0).getStrDescripcion();
        	
        	url = new URL(new URL(ws.substring(0, (ws.indexOf("/", 8) + 1))),
        			ws.substring((ws.indexOf("/", 8)), ws.length()),
        			new URLStreamHandler() {
				@Override
				protected URLConnection openConnection(URL u) throws IOException {
					URL target = new URL(u.toString());
		              URLConnection connection = target.openConnection();
		              // Connection settings
		              connection.setConnectTimeout(iTimeOutConnect);
		              connection.setReadTimeout(iTimeOutRead);
		              return(connection);
				}
			});
        	
//        	url = new URL(lstBeanOption.get(0).getStrDescripcion());
        	soapResponse = soapConnection.call(createSOAPConsultarMesActual(objBeanMaximo), url);
        	
        	bodyMessage = soapResponse.getSOAPBody().getElementsByTagName("TICKET");
        
        
        for(int i = 0 ; i < bodyMessage.getLength() ; i ++){
        	NodeList c = bodyMessage.item(i).getChildNodes();
        	objBeanMaximo = new BeanMaximo();
        	for(int j = 0 ; j < c.getLength() ; j ++){
        		if(c.item(j).getNodeName().equals("TICKETID"))
        			objBeanMaximo.setIdTicket(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("DESCRIPTION"))
        			objBeanMaximo.setTicketTitulo(AppUtils.eliminarTagsHTML(c.item(j).getTextContent()));
        		else if(c.item(j).getNodeName().equals("DESCRIPTION_LONGDESCRIPTION"))
        			objBeanMaximo.setTicketDetalle(AppUtils.eliminarTagsHTML(c.item(j).getTextContent()));
        		else if(c.item(j).getNodeName().equals("CREATIONDATE"))
        			objBeanMaximo.setTicketFechaCreacion(c.item(j).getTextContent().replaceAll("T", " ").replaceAll("-05:00", ""));
        		else if(c.item(j).getNodeName().equals("STATUS"))
        			objBeanMaximo.setTicketEstado(AppUtils.ConvertEstado(c.item(j).getTextContent()));
        		else if(c.item(j).getNodeName().equals("OWNER"))
        			objBeanMaximo.setTicketEmailPropietario(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("DISPLAYNAME"))
        			objBeanMaximo.setTicketPropietario(c.item(j).getTextContent());
        		
        		}
        		listBeanMaximo.add(objBeanMaximo);
        }
        
        
        soapConnection.close();
    } catch (Exception e) {

    	System.err.println("Error occurred while sending SOAP Request to Server");
        System.out.println(e.getCause().getMessage());
        e.printStackTrace();
    }
    
    return listBeanMaximo;
	}
	
	public BeanMaximo wsConsultarTicketMobility(String strIdTicket, BeanSession pobjBeanSession, SqlSessionFactory ssf){
		BeanMaximo objBeanMaximo = new BeanMaximo();
		List<BeanMaximoWorklog> listWorklog = new ArrayList<BeanMaximoWorklog>();
		
	try {
        // Create SOAP Connection
        SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
        SOAPConnection soapConnection = soapConnectionFactory.createConnection();
        BusinessOptions objBusinessOption = new BusinessOptions();

        objBeanMaximo.setSysUser(pobjBeanSession.getObjBeanPersonal().getStrIdLogin());
        objBeanMaximo.setSysPwd(pobjBeanSession.getObjBeanPersonal().getStrClave());
        objBeanMaximo.setIdTicket(strIdTicket);

        URL url = null;
        SOAPMessage soapResponse = null;
        
        BeanParameters objBeanParameters = new BeanParameters();
	    	objBeanParameters.setStrType("WSMAXIMO");
	    	objBeanParameters.setiTeam(pobjBeanSession.getObjBeanPersonal().getiTeam());
	        
	    	NodeList bodyMessage = null;

        	objBeanParameters.setStrValor1("MOBILITY");
        	List<BeanOptions> lstBeanOption = objBusinessOption.listOptions3(objBeanParameters, ssf);
        	String ws = lstBeanOption.get(0).getStrDescripcion();
        	
        	url = new URL(new URL(ws.substring(0, (ws.indexOf("/", 8) + 1))),
        			ws.substring((ws.indexOf("/", 8)), ws.length()),
        			new URLStreamHandler() {
				@Override
				protected URLConnection openConnection(URL u) throws IOException {
					URL target = new URL(u.toString());
		              URLConnection connection = target.openConnection();
		              // Connection settings
		              connection.setConnectTimeout(iTimeOutConnect);
		              connection.setReadTimeout(iTimeOutRead);
		              return(connection);
				}
			});
        	
//        	url = new URL(lstBeanOption.get(0).getStrDescripcion());
        	soapResponse = soapConnection.call(createSOAPConsultarTicketDetalle(objBeanMaximo), url);
        	
        	bodyMessage = soapResponse.getSOAPBody().getElementsByTagName("TICKET");
        
        for(int i = 0 ; i < bodyMessage.getLength() ; i ++){
        	NodeList c = bodyMessage.item(i).getChildNodes();
        	objBeanMaximo = new BeanMaximo();
        	for(int j = 0 ; j < c.getLength() ; j ++){
        		if(c.item(j).getNodeName().equals("TICKETID"))
        			objBeanMaximo.setIdTicket(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("AFFECTEDUSERNAME"))
        			objBeanMaximo.setTicketEmailPersonaAfectada(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("AFFECTEDPERSON"))
        			objBeanMaximo.setTicketPersonaAfectada(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("OWNER"))
        			objBeanMaximo.setTicketEmailPropietario(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("CLASSSTRUCTUREID"))
        			objBeanMaximo.setTicketClassStructureId(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("DESCRIPTION"))
        			objBeanMaximo.setTicketTitulo(AppUtils.eliminarTagsHTML(c.item(j).getTextContent()));
        		else if(c.item(j).getNodeName().equals("DESCRIPTION_LONGDESCRIPTION"))
        			objBeanMaximo.setTicketDetalle(AppUtils.eliminarTagsHTML(c.item(j).getTextContent()));
        		else if(c.item(j).getNodeName().equals("PLUSPCUSTOMER"))
        			objBeanMaximo.setTicketIdCliente(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("IMPACT"))
        			objBeanMaximo.setTicketImpact(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("URGENCY"))
        			objBeanMaximo.setTicketUrgencia(c.item(j).getTextContent());
        		else if(c.item(j).getNodeName().equals("CREATIONDATE"))
        			objBeanMaximo.setTicketFechaCreacion(c.item(j).getTextContent().substring(0,10));
        		else if(c.item(j).getNodeName().equals("STATUS"))
        			objBeanMaximo.setTicketEstado(AppUtils.ConvertEstado(c.item(j).getTextContent()));
        	}
        	
        	NodeList bodyMessageWorklog = null;
        	bodyMessageWorklog = soapResponse.getSOAPBody().getElementsByTagName("WORKLOG");
            
        	if(bodyMessageWorklog.getLength() > 0){
        		BeanMaximoWorklog objBeanWorklog;
        		for(int j = 0 ; j < bodyMessageWorklog.getLength() ; j ++){
                	NodeList nd = bodyMessageWorklog.item(j).getChildNodes();
                	objBeanWorklog = new BeanMaximoWorklog();
                	for(int k = 0 ; k < nd.getLength() ; k ++){
                		if(nd.item(k).getNodeName().equals("CLIENTVIEWABLE"))
                			objBeanWorklog.setClientViewable(Integer.parseInt(nd.item(k).getTextContent()));
                		else if(nd.item(k).getNodeName().equals("CREATEBY"))
                			objBeanWorklog.setCreateBy(nd.item(k).getTextContent());
                		else if(nd.item(k).getNodeName().equals("CREATEDATE"))
                			objBeanWorklog.setCreateDate(nd.item(k).getTextContent().replaceAll("T", " ").replaceAll("-05:00", ""));
                		else if(nd.item(k).getNodeName().equals("DESCRIPTION"))
                			objBeanWorklog.setDescription(AppUtils.cleanString(nd.item(k).getTextContent()));
                		else if(nd.item(k).getNodeName().equals("DESCRIPTION_LONGDESCRIPTION"))
                			objBeanWorklog.setDescription_long(AppUtils.cleanString(nd.item(k).getTextContent()));
                		else if(nd.item(k).getNodeName().equals("ITDCREATEDATE"))
                			objBeanWorklog.setItdCreateDate(nd.item(k).getTextContent());
                		else if(nd.item(k).getNodeName().equals("LOGTYPE"))
                			objBeanWorklog.setLogType(nd.item(k).getTextContent());
                		else if(nd.item(k).getNodeName().equals("MODIFYBY"))
                			objBeanWorklog.setModifyBy(nd.item(k).getTextContent());
                		else if(nd.item(k).getNodeName().equals("MODIFYDATE"))
                			objBeanWorklog.setModifyBy(nd.item(k).getTextContent());
                		else if(nd.item(k).getNodeName().equals("ORGID"))
                			objBeanWorklog.setOrgId(nd.item(k).getTextContent());
                		else if(nd.item(k).getNodeName().equals("RECORDKEY"))
                			objBeanWorklog.setRecordKey(nd.item(k).getTextContent());
                		else if(nd.item(k).getNodeName().equals("SITEID"))
                			objBeanWorklog.setSiteId(nd.item(k).getTextContent());
                		else if(nd.item(k).getNodeName().equals("WORKLOGID"))
                			objBeanWorklog.setWorkLogId(nd.item(k).getTextContent());
                	}
                	
                	if(objBeanWorklog.getClientViewable() == 1)
                		listWorklog.add(objBeanWorklog);
                }
        	}
        	objBeanMaximo.setBeanMaximoWorklog(listWorklog);
//        	listBeanMaximo.add(objBeanMaximo);
        }
        
        soapConnection.close();
    } catch (Exception e) {
        System.err.println("Error en la peticion de SOAP wsConsultarTicketsMobility");
        System.out.println(e.getCause().getMessage());
        e.printStackTrace();
    }
    
    return objBeanMaximo;
	}
	
	public String wsRegistrarWorkLog(BeanMaximo pobjBeanMaximo, BeanSession pobjBeanSession, SqlSessionFactory ssf){
//		List<BeanMaximo> listBeanMaximo = new ArrayList<BeanMaximo>();
//		BeanMaximo objBeanMaximo = new BeanMaximo();
//		BusinessOptions objBusinessOptions = new BusinessOptions();
//		List<BeanOptions> listOption = null;
		
	try {
        // Create SOAP Connection
        SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
        SOAPConnection soapConnection = soapConnectionFactory.createConnection();
        BusinessOptions objBusinessOption = new BusinessOptions();

        pobjBeanMaximo.setSysUser(pobjBeanSession.getObjBeanPersonal().getStrIdLogin());
        pobjBeanMaximo.setSysPwd(pobjBeanSession.getObjBeanPersonal().getStrClave());

        URL url = null;
        SOAPMessage soapResponse = null;
        
        BeanParameters objBeanParameters = new BeanParameters();
	    	objBeanParameters.setStrType("WSMAXIMO");
	    	objBeanParameters.setiTeam(pobjBeanSession.getObjBeanPersonal().getiTeam());
	        
	    	NodeList bodyMessage = null;
    		
        	objBeanParameters.setStrValor1("MOBILITY");
        	List<BeanOptions> lstBeanOption = objBusinessOption.listOptions3(objBeanParameters, ssf);
        	String ws = lstBeanOption.get(0).getStrDescripcion();
        	
        	url = new URL(new URL(ws.substring(0, (ws.indexOf("/", 8) + 1))),
        			ws.substring((ws.indexOf("/", 8)), ws.length()),
        			new URLStreamHandler() {
				@Override
				protected URLConnection openConnection(URL u) throws IOException {
					URL target = new URL(u.toString());
		              URLConnection connection = target.openConnection();
		              // Connection settings
		              connection.setConnectTimeout(iTimeOutConnect);
		              connection.setReadTimeout(iTimeOutRead);
		              return(connection);
				}
			});
//        	url = new URL(lstBeanOption.get(0).getStrDescripcion());
        	soapResponse = soapConnection.call(createSOAPRegistrarWorkLogTicket(pobjBeanMaximo), url);
        	soapConnection.close();
    } catch (Exception e) {

    	System.err.println("Error occurred while sending SOAP Request to Server");
        System.out.println(e.getCause().getMessage());
        e.printStackTrace();
    }
    
    return "";
	}
	
	public String wsRegistrarTicket(BeanMaximo pobjBeanMaximo, BeanSession pobjBeanSession, SqlSessionFactory ssf){
		
		String strTicketResultado = "";
		
	try {
        // Create SOAP Connection
        SOAPConnectionFactory soapConnectionFactory = SOAPConnectionFactory.newInstance();
        SOAPConnection soapConnection = soapConnectionFactory.createConnection();
        BusinessOptions objBusinessOption = new BusinessOptions();

        pobjBeanMaximo.setSysUser(pobjBeanSession.getObjBeanPersonal().getStrIdLogin());
        pobjBeanMaximo.setSysPwd(pobjBeanSession.getObjBeanPersonal().getStrClave());

        URL url = null;
        SOAPMessage soapResponse = null;
        
        BeanParameters objBeanParameters = new BeanParameters();
	    	objBeanParameters.setStrType("WSMAXIMO");
	    	objBeanParameters.setiTeam(pobjBeanSession.getObjBeanPersonal().getiTeam());
	        
	    	NodeList bodyMessage = null;
    		
        	objBeanParameters.setStrValor1("CREARTICKET");
        	List<BeanOptions> lstBeanOption = objBusinessOption.listOptions3(objBeanParameters, ssf);
        	String ws = lstBeanOption.get(0).getStrDescripcion();
        	
        	url = new URL(new URL(ws.substring(0, (ws.indexOf("/", 8) + 1))),
        			ws.substring((ws.indexOf("/", 8)), ws.length()),
        			new URLStreamHandler() {
				@Override
				protected URLConnection openConnection(URL u) throws IOException {
					URL target = new URL(u.toString());
		              URLConnection connection = target.openConnection();
		              // Connection settings
		              connection.setConnectTimeout(iTimeOutConnect);
		              connection.setReadTimeout(iTimeOutRead);
		              return(connection);
				}
			});
//        	url = new URL(lstBeanOption.get(0).getStrDescripcion());
        	soapResponse = soapConnection.call(createSOAPRegistrarTicket(pobjBeanMaximo), url);
        	soapConnection.close();
        	
        	bodyMessage = soapResponse.getSOAPBody().getElementsByTagName("INCIDENT");
        
        for(int i = 0 ; i < bodyMessage.getLength() ; i ++){
        	NodeList c = bodyMessage.item(i).getChildNodes();
        	for(int j = 0 ; j < c.getLength() ; j ++){
        		if(c.item(j).getNodeName().equals("TICKETID"))
        			strTicketResultado = c.item(j).getTextContent();
        	}
        }
        
    } catch (Exception e) {

    	System.err.println("Error occurred while sending SOAP Request to Server");
        System.out.println(e.getCause().getMessage());
        e.printStackTrace();
    }
    
    return strTicketResultado;
	}
	
	
	


//#########################################################################################################################
//Construcción de mensajes SOAP
//#########################################################################################################################
	
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
	    soapBodyElem1.setAttribute("transLanguage", "ES");
	    SOAPElement soapBodyElem2 = soapBodyElem1.addChildElement("DS_INCIDENTQuery", "max");
	    SOAPElement soapBodyElem3 = soapBodyElem2.addChildElement("INCIDENT", "max");
	    SOAPElement soapBodySubElem1 = soapBodyElem3.addChildElement("CLASS", "max");
	    soapBodySubElem1.addTextNode("IN");
	    SOAPElement soapBodySubElem2 = soapBodyElem3.addChildElement("TICKETID", "max");
	    soapBodySubElem2.addAttribute(envelope.createName("operator"), "=");
	    soapBodySubElem2.addTextNode(pobjBeanMaximo.getIdTicket());
	      
	    String authorization = new sun.misc.BASE64Encoder().encode((pobjBeanMaximo.getSysUser()+":"+pobjBeanMaximo.getSysPwd()).getBytes());
	    System.out.println(authorization);
	    MimeHeaders hd = soapMessage.getMimeHeaders();
	    hd.addHeader("SOAPAction", "urn:processDocument");
	    hd.addHeader("Authorization", "Basic " + authorization);
	
	    soapMessage.saveChanges();
	
	    soapMessage.writeTo(System.out);
	
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
	    soapBodyElem1.setAttribute("transLanguage", "ES");
	    SOAPElement soapBodyElem2 = soapBodyElem1.addChildElement("DS_PROBLEMQuery", "max");
	    SOAPElement soapBodyElem3 = soapBodyElem2.addChildElement("PROBLEM", "max");
	    SOAPElement soapBodySubElem1 = soapBodyElem3.addChildElement("CLASS", "max");
	    soapBodySubElem1.addTextNode("PR");
	    SOAPElement soapBodySubElem2 = soapBodyElem3.addChildElement("TICKETID", "max");
	    soapBodySubElem2.addAttribute(envelope.createName("operator"), "=");
	    soapBodySubElem2.addTextNode(pobjBeanMaximo.getIdTicket());
	      
	    String authorization = new sun.misc.BASE64Encoder().encode((pobjBeanMaximo.getSysUser()+":"+pobjBeanMaximo.getSysPwd()).getBytes());
	    System.out.println(authorization);
	    MimeHeaders hd = soapMessage.getMimeHeaders();
	    hd.addHeader("SOAPAction", "urn:processDocument");
	    hd.addHeader("Authorization", "Basic " + authorization);
	
	    soapMessage.saveChanges();
	
	    soapMessage.writeTo(System.out);
	
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
	    soapBodyElem1.setAttribute("transLanguage", "ES");
	    SOAPElement soapBodyElem2 = soapBodyElem1.addChildElement("DS_SRQuery", "max");
	    SOAPElement soapBodyElem3 = soapBodyElem2.addChildElement("SR", "max");
	    SOAPElement soapBodySubElem1 = soapBodyElem3.addChildElement("CLASS", "max");
	    soapBodySubElem1.addTextNode("SR");
	    SOAPElement soapBodySubElem2 = soapBodyElem3.addChildElement("TICKETID", "max");
	    soapBodySubElem2.addAttribute(envelope.createName("operator"), "=");
	    soapBodySubElem2.addTextNode(pobjBeanMaximo.getIdTicket());
	      
	    String authorization = new sun.misc.BASE64Encoder().encode((pobjBeanMaximo.getSysUser()+":"+pobjBeanMaximo.getSysPwd()).getBytes());
	    System.out.println(authorization);
	    MimeHeaders hd = soapMessage.getMimeHeaders();
	    hd.addHeader("SOAPAction", "urn:processDocument");
	    hd.addHeader("Authorization", "Basic " + authorization);
	
	    soapMessage.saveChanges();
	
	    soapMessage.writeTo(System.out);
	
	    return soapMessage;
	}
	
	
	//#########################################################################################################################
	//Construcción de mensajes SOAP - Sayri
	//#########################################################################################################################
	
	private static SOAPMessage createSOAPConsultar30UltimosTicketCreados(BeanMaximo pobjBeanMaximo) throws Exception {
	    MessageFactory messageFactory = MessageFactory.newInstance();
	    SOAPMessage soapMessage = messageFactory.createMessage();
	    SOAPPart soapPart = soapMessage.getSOAPPart();
	
	    String serverURI = "http://www.ibm.com/maximo";
	    
	    //Fechas
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String fecha2 = sdf.format(new Date());
	    
	    Calendar fecha1 = Calendar.getInstance();
	    fecha1.add(Calendar.MONTH, -12);
	    System.out.println("12 meses");
	    System.out.println(fecha1.getTime());
	
	    // SOAP Envelope
	    SOAPEnvelope envelope = soapPart.getEnvelope();
	    envelope.addNamespaceDeclaration("max", serverURI);
	
	    // SOAP Body
	    SOAPBody soapBody = envelope.getBody();
	    SOAPElement soapBodyElem1 = soapBody.addChildElement("QueryMOB_TICKETWL", "max");
	    soapBodyElem1.setAttribute("transLanguage", "ES");
	    SOAPElement soapBodyElem2 = soapBodyElem1.addChildElement("MOB_TICKETWLQuery", "max");
	    SOAPElement soapBodySubElem1 = soapBodyElem2.addChildElement("WHERE", "max");
	    
	    String demo1 = "AFFECTEDPERSON = '"+ pobjBeanMaximo.getSysUser().toUpperCase()+"' AND (CREATIONDATE BETWEEN '" + fecha1.get(Calendar.YEAR) + "-" + (String.valueOf(fecha1.get(Calendar.MONTH) + 1).length() > 1 ? (fecha1.get(Calendar.MONTH) + 1) : fecha1.get(Calendar.MONTH) + 1) + "-" + (String.valueOf(fecha1.get(Calendar.DATE)).length() > 1 ? fecha1.get(Calendar.DATE) : "0" + fecha1.get(Calendar.DATE)) + "' AND '" + fecha2 + "') ORDER BY CREATIONDATE DESC FETCH FIRST 30 ROWS ONLY";
	    soapBodySubElem1.addTextNode(demo1);
	//    System.out.println(fecha1.get(Calendar.MONTH) + " ==> " + demo1);
	//    soapBodySubElem1.addTextNode("AFFECTEDPERSON = '"+ pobjBeanMaximo.getSysUser().toUpperCase()+"' AND (CREATIONDATE BETWEEN '" + fecha1.get(Calendar.YEAR) + "-" + (String.valueOf(fecha1.get(Calendar.MONTH)).length() > 1 ? fecha1.get(Calendar.MONTH) : "0" + fecha1.get(Calendar.MONTH) ) + "-" + (String.valueOf(fecha1.get(Calendar.DATE)).length() > 1 ? fecha1.get(Calendar.DATE) : "0" + fecha1.get(Calendar.DATE)) + "' AND '" + fecha2 + "') ORDER BY CREATIONDATE DESC FETCH FIRST 30 ROWS ONLY");
	    
	    String authorization = new sun.misc.BASE64Encoder().encode((pobjBeanMaximo.getSysUser()+":"+pobjBeanMaximo.getSysPwd()).getBytes());
	//    System.out.println(authorization);
	    MimeHeaders hd = soapMessage.getMimeHeaders();
	    hd.addHeader("SOAPAction", "urn:processDocument");
	    hd.addHeader("Authorization", "Basic " + authorization);
	
	    soapMessage.saveChanges();
	
	    soapMessage.writeTo(System.out);
	
	    return soapMessage;
	}
	
	private static SOAPMessage createSOAPConsultarMesActual(BeanMaximo pobjBeanMaximo) throws Exception {
	    MessageFactory messageFactory = MessageFactory.newInstance();
	    SOAPMessage soapMessage = messageFactory.createMessage();
	    SOAPPart soapPart = soapMessage.getSOAPPart();
	
	    String serverURI = "http://www.ibm.com/maximo";
	    
	    //Fechas
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    String fecha2 = sdf.format(new Date());
	    
	    Calendar fecha1 = Calendar.getInstance();
	//    fecha1.add(Calendar.MONTH, -1);
	    System.out.println("Mes actual");
	    System.out.println(fecha1.getTime());
	
	    // SOAP Envelope
	    SOAPEnvelope envelope = soapPart.getEnvelope();
	    envelope.addNamespaceDeclaration("max", serverURI);
	
	    // SOAP Body
	    SOAPBody soapBody = envelope.getBody();
	    SOAPElement soapBodyElem1 = soapBody.addChildElement("QueryMOB_TICKETWL", "max");
	    soapBodyElem1.setAttribute("transLanguage", "ES");
	    SOAPElement soapBodyElem2 = soapBodyElem1.addChildElement("MOB_TICKETWLQuery", "max");
	    SOAPElement soapBodySubElem1 = soapBodyElem2.addChildElement("WHERE", "max");
	    
	    String demo2 = "AFFECTEDPERSON = '"+ pobjBeanMaximo.getSysUser().toUpperCase() + "' AND (CREATIONDATE BETWEEN '" + fecha1.get(Calendar.YEAR) + "-" + (String.valueOf(fecha1.get(Calendar.MONTH) + 1).length() > 1 ? (fecha1.get(Calendar.MONTH) + 1) : fecha1.get(Calendar.MONTH) + 1) + "-01' AND '" + fecha2 + "') ORDER BY CREATIONDATE DESC FETCH FIRST 30 ROWS ONLY";
	    soapBodySubElem1.addTextNode(demo2);
	//    System.out.println(fecha1.get(Calendar.MONTH) + " ==> " + demo2);
	//    soapBodySubElem1.addTextNode("AFFECTEDPERSON = '"+ pobjBeanMaximo.getSysUser().toUpperCase() + "' AND (CREATIONDATE BETWEEN '" + fecha1.get(Calendar.YEAR) + "-" + (String.valueOf(fecha1.get(Calendar.MONTH) + 1).length() > 1 ? (fecha1.get(Calendar.MONTH) + 1) : "0" + fecha1.get(Calendar.MONTH) + 1) + "-01' AND '" + fecha2 + "') ORDER BY CREATIONDATE DESC FETCH FIRST 30 ROWS ONLY");
	    
	    String authorization = new sun.misc.BASE64Encoder().encode((pobjBeanMaximo.getSysUser()+":"+pobjBeanMaximo.getSysPwd()).getBytes());
	//    System.out.println(authorization);
	    MimeHeaders hd = soapMessage.getMimeHeaders();
	    hd.addHeader("SOAPAction", "urn:processDocument");
	    hd.addHeader("Authorization", "Basic " + authorization);
	
	    soapMessage.saveChanges();
	
	    soapMessage.writeTo(System.out);
	
	    return soapMessage;
	}
	
	private static SOAPMessage createSOAPConsultarTicketDetalle(BeanMaximo pobjBeanMaximo) throws Exception {
	    MessageFactory messageFactory = MessageFactory.newInstance();
	    SOAPMessage soapMessage = messageFactory.createMessage();
	    SOAPPart soapPart = soapMessage.getSOAPPart();
	    
	    String serverURI = "http://www.ibm.com/maximo";
	    
	    // SOAP Envelope
	    SOAPEnvelope envelope = soapPart.getEnvelope();
	    envelope.addNamespaceDeclaration("max", serverURI);
	
	    // SOAP Body
	    SOAPBody soapBody = envelope.getBody();
	    SOAPElement soapBodyElem1 = soapBody.addChildElement("QueryMOB_TICKETWL", "max");
	    soapBodyElem1.setAttribute("transLanguage", "ES");
	    SOAPElement soapBodyElem2 = soapBodyElem1.addChildElement("MOB_TICKETWLQuery", "max");
	    SOAPElement soapBodySubElem1 = soapBodyElem2.addChildElement("WHERE", "max");
	    soapBodySubElem1.addTextNode("CLASS = '" + pobjBeanMaximo.getIdTicket().substring(0,2) + "' AND TICKETID = '" + pobjBeanMaximo.getIdTicket() + "'");
	    
	    String authorization = new sun.misc.BASE64Encoder().encode((pobjBeanMaximo.getSysUser()+":"+pobjBeanMaximo.getSysPwd()).getBytes());
	    System.out.println(authorization);
	    MimeHeaders hd = soapMessage.getMimeHeaders();
	    hd.addHeader("SOAPAction", "urn:processDocument");
	    hd.addHeader("Authorization", "Basic " + authorization);
	
	    soapMessage.saveChanges();
	
	    soapMessage.writeTo(System.out);
	
	    return soapMessage;
	}
	
	private static SOAPMessage createSOAPRegistrarWorkLogTicket(BeanMaximo pobjBeanMaximo) throws Exception {
	    MessageFactory messageFactory = MessageFactory.newInstance();
	    SOAPMessage soapMessage = messageFactory.createMessage();
	    SOAPPart soapPart = soapMessage.getSOAPPart();
	
	    String serverURI = "http://www.ibm.com/maximo";
	    
	    // SOAP Envelope
	    SOAPEnvelope envelope = soapPart.getEnvelope();
	    envelope.addNamespaceDeclaration("max", serverURI);
	
	    // SOAP Body
	    SOAPBody soapBody = envelope.getBody();
	    SOAPElement soapBodyElem1 = soapBody.addChildElement("SyncMOB_TICKETWL", "max");
	    soapBodyElem1.addAttribute(envelope.createName("baseLanguage"), "EN");
	    soapBodyElem1.addAttribute(envelope.createName("transLanguage"), "ES");
	    SOAPElement soapBodyElem2 = soapBodyElem1.addChildElement("MOB_TICKETWLSet", "max");
	    SOAPElement soapBodyElem3 = soapBodyElem2.addChildElement("TICKET", "max");
	    soapBodyElem3.addAttribute(envelope.createName("action"), "AddChange");
	    soapBodyElem3.addAttribute(envelope.createName("transLanguage"), "ES");
	    SOAPElement soapBodySubElem3_1 = soapBodyElem3.addChildElement("CLASS", "max");
	    soapBodySubElem3_1.addTextNode(pobjBeanMaximo.getTicketClass());
	//    SOAPElement soapBodySubElem3_2 = soapBodyElem3.addChildElement("SITEID", "max");
	//    soapBodySubElem3_2.addTextNode(pobjBeanMaximo.getTicketSiteId());
	    SOAPElement soapBodySubElem3_3 = soapBodyElem3.addChildElement("TICKETID", "max");
	    soapBodySubElem3_3.addAttribute(envelope.createName("operator"), "=");
	    soapBodySubElem3_3.addTextNode(pobjBeanMaximo.getIdTicket());
	    SOAPElement soapBodyElem4 = soapBodyElem3.addChildElement("WORKLOG", "max");
	    soapBodyElem4.addAttribute(envelope.createName("action"), "Add");
	    SOAPElement soapBodySubElem4_1 = soapBodyElem4.addChildElement("DESCRIPTION", "max");
	    soapBodySubElem4_1.addTextNode(pobjBeanMaximo.getObjBeanMaximoWorkLog().getDescription());
	    SOAPElement soapBodySubElem4_2 = soapBodyElem4.addChildElement("DESCRIPTION_LONGDESCRIPTION", "max");
	    soapBodySubElem4_2.addTextNode(pobjBeanMaximo.getObjBeanMaximoWorkLog().getDescription_long());
	    SOAPElement soapBodySubElem4_3 = soapBodyElem4.addChildElement("LOGTYPE", "max");
	    soapBodySubElem4_3.addTextNode(pobjBeanMaximo.getObjBeanMaximoWorkLog().getLogType());
	    
	    String authorization = new sun.misc.BASE64Encoder().encode((pobjBeanMaximo.getSysUser()+":"+pobjBeanMaximo.getSysPwd()).getBytes());
	    System.out.println(authorization);
	    MimeHeaders hd = soapMessage.getMimeHeaders();
	    hd.addHeader("SOAPAction", "urn:processDocument");
	    hd.addHeader("Authorization", "Basic " + authorization);
	
	    soapMessage.saveChanges();
	
	    soapMessage.writeTo(System.out);
	
	    return soapMessage;
	}
	
	private static SOAPMessage createSOAPRegistrarTicket(BeanMaximo pobjBeanMaximo) throws Exception {
	    MessageFactory messageFactory = MessageFactory.newInstance();
	    SOAPMessage soapMessage = messageFactory.createMessage();
	    SOAPPart soapPart = soapMessage.getSOAPPart();
	
	    String serverURI = "http://www.ibm.com/maximo";
	    
	    //Fechas
//	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//	    String fecha2 = sdf.format(new Date());
	    
	    Calendar fecha1 = Calendar.getInstance();
	//    fecha1.add(Calendar.MONTH, -1);
	    System.out.println("Mes actual");
	    System.out.println(fecha1.getTime());
	
	    // SOAP Envelope
	    SOAPEnvelope envelope = soapPart.getEnvelope();
	    envelope.addNamespaceDeclaration("max", serverURI);
	    
	    // SOAP Body
	    SOAPBody soapBody = envelope.getBody();
	    SOAPElement soapBodyElem1 = soapBody.addChildElement("CreatePOR_IN", "max");
	    SOAPElement soapBodySubElem1 = soapBodyElem1.addChildElement("POR_INSet", "max");
	    SOAPElement soapBodySubElem2 = soapBodySubElem1.addChildElement("INCIDENT", "max");
	    soapBodySubElem2.setAttribute("action", "Add");
	    soapBodySubElem2.setAttribute("transLanguage", "ES");
	    SOAPElement soapBodySubElem3 = soapBodySubElem2.addChildElement("AFFECTEDEMAIL", "max");
	    soapBodySubElem3.addTextNode(pobjBeanMaximo.getTicketEmailPersonaAfectada());
	    SOAPElement soapBodySubElem4 = soapBodySubElem2.addChildElement("CINUM", "max");
	    soapBodySubElem4.addTextNode(pobjBeanMaximo.getTicketNumeroCI());
	    SOAPElement soapBodySubElem5 = soapBodySubElem2.addChildElement("CLASSIFICATIONID", "max");
//	    soapBodySubElem5.addTextNode(pobjBeanMaximo.getTicketIdClasificacion());
	    SOAPElement soapBodySubElem6 = soapBodySubElem2.addChildElement("CREATEDBY", "max");
//	    soapBodySubElem6.addTextNode(pobjBeanMaximo.getTicketEmailPersonaCreadora());
	    SOAPElement soapBodySubElem7 = soapBodySubElem2.addChildElement("DESCRIPTION", "max");
	    soapBodySubElem7.addTextNode(pobjBeanMaximo.getTicketTitulo());
	    SOAPElement soapBodySubElem8 = soapBodySubElem2.addChildElement("EXTERNALSYSTEM", "max");
//	    soapBodySubElem8.addTextNode(pobjBeanMaximo.getTicketExternalSystem());
	    SOAPElement soapBodySubElem9 = soapBodySubElem2.addChildElement("IMPACT", "max");
	    soapBodySubElem9.addTextNode(pobjBeanMaximo.getTicketImpact());
	    SOAPElement soapBodySubElem10 = soapBodySubElem2.addChildElement("URGENCY", "max");
	    soapBodySubElem10.addTextNode(pobjBeanMaximo.getTicketUrgencia());
	    SOAPElement soapBodySubElem11 = soapBodySubElem2.addChildElement("OWNERGROUP", "max");
	    soapBodySubElem11.addTextNode(pobjBeanMaximo.getTicketGrupoPropietario());
	    SOAPElement soapBodySubElem12 = soapBodySubElem2.addChildElement("REPORTEDBY", "max");
//	    soapBodySubElem12.addTextNode(pobjBeanMaximo.getTicketEmailPersonaCreadora());
	    
	    
	    String authorization = new sun.misc.BASE64Encoder().encode((pobjBeanMaximo.getSysUser()+":"+pobjBeanMaximo.getSysPwd()).getBytes());
	//    System.out.println(authorization);
	    MimeHeaders hd = soapMessage.getMimeHeaders();
	    hd.addHeader("SOAPAction", "urn:processDocument");
	    hd.addHeader("Authorization", "Basic " + authorization);
	
	    soapMessage.saveChanges();
	
	    soapMessage.writeTo(System.out);
	
	    return soapMessage;
	}
	
	
	
	private static SOAPMessage createSOAPRequestServiciosv2(BeanMaximo pobjBeanMaximo) throws Exception {
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
	    soapBodyElem1.setAttribute("transLanguage", "ES");
	    SOAPElement soapBodyElem2 = soapBodyElem1.addChildElement("DS_SRQuery", "max");
	    SOAPElement soapBodyElem3 = soapBodyElem2.addChildElement("SR", "max");
	    SOAPElement soapBodySubElem1 = soapBodyElem3.addChildElement("CLASS", "max");
	    soapBodySubElem1.addTextNode("SR");
	    SOAPElement soapBodySubElem2 = soapBodyElem3.addChildElement("TICKETID", "max");
	    soapBodySubElem2.addAttribute(envelope.createName("operator"), "=");
	    soapBodySubElem2.addTextNode(pobjBeanMaximo.getIdTicket());
	      
	    String authorization = new sun.misc.BASE64Encoder().encode((pobjBeanMaximo.getSysUser()+":"+pobjBeanMaximo.getSysPwd()).getBytes());
	    System.out.println(authorization);
	    MimeHeaders hd = soapMessage.getMimeHeaders();
	    hd.addHeader("SOAPAction", "urn:processDocument");
	    hd.addHeader("Authorization", "Basic " + authorization);
	
	    soapMessage.saveChanges();
	
	    soapMessage.writeTo(System.out);
	
	    return soapMessage;
	}
	
	
	private static SOAPMessage createSOAPRequestIncidentesP1(BeanMaximo pobjBeanMaximo) throws Exception {
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
	    soapBodyElem1.setAttribute("transLanguage", "ES");
	    SOAPElement soapBodyElem2 = soapBodyElem1.addChildElement("DS_INCIDENTQuery", "max");
	    SOAPElement soapBodyElem3 = soapBodyElem2.addChildElement("INCIDENT", "max");
	    SOAPElement soapBodySubElem1 = soapBodyElem3.addChildElement("CLASS", "max");
	    soapBodySubElem1.addTextNode("IN");
	    SOAPElement soapBodySubElem2 = soapBodyElem3.addChildElement("REPORTEDPRIORITY", "max");
	    soapBodySubElem2.addTextNode("1");
	      
	    String authorization = new sun.misc.BASE64Encoder().encode((pobjBeanMaximo.getSysUser()+":"+pobjBeanMaximo.getSysPwd()).getBytes());
	    System.out.println(authorization);
	    MimeHeaders hd = soapMessage.getMimeHeaders();
	    hd.addHeader("SOAPAction", "urn:processDocument");
	    hd.addHeader("Authorization", "Basic " + authorization);
	
	    soapMessage.saveChanges();
	
	    soapMessage.writeTo(System.out);
	
	    return soapMessage;
	}
	
	
	private static SOAPMessage createSOAPRequestProblemasP1(BeanMaximo pobjBeanMaximo) throws Exception {
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
	    soapBodyElem1.setAttribute("transLanguage", "ES");
	    SOAPElement soapBodyElem2 = soapBodyElem1.addChildElement("DS_PROBLEMQuery", "max");
	    SOAPElement soapBodyElem3 = soapBodyElem2.addChildElement("PROBLEM", "max");
	    SOAPElement soapBodySubElem1 = soapBodyElem3.addChildElement("CLASS", "max");
	    soapBodySubElem1.addTextNode("PR");
	    SOAPElement soapBodySubElem2 = soapBodyElem3.addChildElement("REPORTEDPRIORITY", "max");
	    soapBodySubElem2.addTextNode("1");
	      
	    String authorization = new sun.misc.BASE64Encoder().encode((pobjBeanMaximo.getSysUser()+":"+pobjBeanMaximo.getSysPwd()).getBytes());
	    System.out.println(authorization);
	    MimeHeaders hd = soapMessage.getMimeHeaders();
	    hd.addHeader("SOAPAction", "urn:processDocument");
	    hd.addHeader("Authorization", "Basic " + authorization);
	
	    soapMessage.saveChanges();
	
	    soapMessage.writeTo(System.out);
	
	    return soapMessage;
	}
	
	
	private static SOAPMessage createSOAPRequestServiciosP1(BeanMaximo pobjBeanMaximo) throws Exception {
	    MessageFactory messageFactory = MessageFactory.newInstance();
	    SOAPMessage soapMessage = messageFactory.createMessage();
	    SOAPPart soapPart = soapMessage.getSOAPPart();
	
	    String serverURI = "http://www.ibm.com/maximo";
	
	    // SOAP Envelope
	    SOAPEnvelope envelope = soapPart.getEnvelope();
	    envelope.addNamespaceDeclaration("max", serverURI);
	
	    // SOAP Body
	    SOAPBody soapBody = envelope.getBody();
	    SOAPElement soapBodyElem1 = soapBody.addChildElement("QueryDREP_TICKET", "max");
	    SOAPElement soapBodyElem2 = soapBodyElem1.addChildElement("DREP_TICKETQuery", "max");
	    SOAPElement soapBodyElem3 = soapBodyElem2.addChildElement("WHERE", "max");
	    soapBodyElem3.addTextNode("INTERNALPRIORITY = 1 AND HISTORYFLAG = 0 AND STATUS NOT IN ('CLOSED','RESOLVCONF','RESOLVED')  AND (OWNERGROUP LIKE '%-PE-%' OR OWNERGROUP LIKE '%-IN-%')  AND OWNERGROUP NOT LIKE '%-SSD-%' AND OWNERGROUP NOT LIKE '%-CLI-%' AND CLASS = 'INCIDENT' ORDER BY REPORTDATE DESC");
	    
	    String authorization = new sun.misc.BASE64Encoder().encode((pobjBeanMaximo.getSysUser()+":"+pobjBeanMaximo.getSysPwd()).getBytes());
	    System.out.println(authorization);
	    MimeHeaders hd = soapMessage.getMimeHeaders();
	    hd.addHeader("SOAPAction", "urn:processDocument");
	    hd.addHeader("Authorization", "Basic " + authorization);
	
	    soapMessage.saveChanges();
	
	    soapMessage.writeTo(System.out);
	
	    return soapMessage;
	}
	}
