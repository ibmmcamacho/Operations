package com.pe.ibm.util;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.ibatis.session.SqlSessionFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

import com.pe.ibm.bean.BeanAuditoria;
import com.pe.ibm.bean.BeanControlErrores;
import com.pe.ibm.bean.BeanMaximo;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.business.BusinessAuditoria;

public class AppUtils {

	public AppUtils() {
		// TODO Auto-generated constructor stub
	}
	public String readXmlMaximoWS(String pQuery) {
		String strQuery = "";
		try {

			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder documentBuilder = dbf.newDocumentBuilder();
            Document document = documentBuilder.parse(new File(AppUtils.class.getResource("/").getPath() + File.separator + "operationsProperty.xml"));
            document.getDocumentElement().normalize();
            System.out.println("Elemento raiz:" + document.getDocumentElement().getNodeName());
            
            NodeList listQuerys = document.getElementsByTagName("query");
			// int totalQueries = listQueries.getLength();

			for (int s = 0; s < listQuerys.getLength(); s++) {
				Node querys = listQuerys.item(s);
				if(querys.getAttributes().item(0).getTextContent().equals(pQuery))
					querys.getTextContent().trim();
			}

		} catch (SAXParseException err) {
			System.err.println("** Parsing error" + ", line " + err.getLineNumber() + ", uri " + err.getSystemId());
			System.err.println(" " + err.getMessage());

		} catch (SAXException e) {
			Exception x = e.getException();
			((x == null) ? e : x).printStackTrace();
		} catch (Throwable t) {
			t.printStackTrace();
		}
		
		return strQuery;
	}

	public static String validate(String cadena) {
		return cadena != null ? "'" + cadena + "'" : "''";
	}
	
	
	private static String getHostName (InetAddress inaHost) throws UnknownHostException
	    {
	       try
	       {
	           Class clazz = Class.forName("java.net.InetAddress");
	           Constructor[] constructors = clazz.getDeclaredConstructors();
	           constructors[0].setAccessible(true);
	           InetAddress ina = (InetAddress) constructors[0].newInstance();

	           Field[] fields = ina.getClass().getDeclaredFields();
	           for (Field field: fields)
	           {
	               if (field.getName().equals("nameService"))
	               {
	                   field.setAccessible(true);
	                   Method[] methods = field.get(null).getClass().getDeclaredMethods();
	                   for (Method method: methods)
	                   {
	                        if (method.getName().equals("getHostByAddr"))
	                        {
	                            method.setAccessible(true);
	                            return (String) method.invoke(field.get (null), inaHost.getAddress());
	                        }
	                   }
	               }
	           }
	       } catch (ClassNotFoundException cnfe) {
	       } catch (IllegalAccessException iae) {
	       } catch (InstantiationException ie) {
	       } catch (InvocationTargetException ite) {
	           throw (UnknownHostException) ite.getCause();
	       }
	       return null;
	    }
	
	public static int addErr(Exception ex, String pstrModulo, String pstrUsuario, int piUsuario,SqlSessionFactory ssf) {
		BeanControlErrores objBeanControl = new BeanControlErrores();
		int iresult = 0;
		try {
			int size = ex.getStackTrace().length - 1;
			BusinessAuditoria objBusinessAuditoria = new BusinessAuditoria();
			
			for(int i = 0 ; i <= size ; i++) {
				objBeanControl.setStrModulo(pstrModulo);
				objBeanControl.setStrUsuario(pstrUsuario);
				objBeanControl.setiIdUsuario(piUsuario);
				objBeanControl.setStrMensaje(ex.getMessage().toString());
				objBeanControl.setStrCausa(ex.getCause().toString().toString());
				objBeanControl.setStrClass(ex.getStackTrace()[i].getClassName().toString());
				objBeanControl.setStrMetodo(ex.getStackTrace()[i].getMethodName().toString());
				objBeanControl.setStrArchivo(ex.getStackTrace()[i].getFileName().toString());
				objBeanControl.setiNumLinea(ex.getStackTrace()[i].getLineNumber());
				objBeanControl.setStrStackTrace(ex.getStackTrace()[i].toString());
				
				iresult = objBusinessAuditoria.saveControlErr(objBeanControl, ssf);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return iresult;
	}
	public static BeanAuditoria convertAuditoria(HttpServletRequest req, String pAccion, String pResultado, int pIdUsuario, String pUsuario, String pModulo, String pBean, SqlSessionFactory ssf) {
		
		BeanAuditoria objBeanAuditoria = new BeanAuditoria();
		try {
			
			String  browserDetails  =   req.getHeader("User-Agent");
	        String  userAgent       =   browserDetails;
	        String  user            =   userAgent.toLowerCase();
	        String	url				= 	req.getServerName().toString() + ":" + req.getServerPort();
	        String	hostname		= 	java.net.InetAddress.getLocalHost().getHostName();
//	        String  hostname2 		= 	getHostName(java.net.InetAddress.getLocalHost());
	        

	        String os = "";
	        String browser = "";
	        
	        //=================OS=======================
	         if (userAgent.toLowerCase().indexOf("windows") >= 0 )
	         {
	             os = "Windows";
	         } else if(userAgent.toLowerCase().indexOf("mac") >= 0)
	         {
	             os = "Mac";
	         } else if(userAgent.toLowerCase().indexOf("x11") >= 0)
	         {
	             os = "Unix";
	         } else if(userAgent.toLowerCase().indexOf("android") >= 0)
	         {
	             os = "Android";
	         } else if(userAgent.toLowerCase().indexOf("iphone") >= 0)
	         {
	             os = "IPhone";
	         }else{
	             os = "UnKnown, More-Info: "+userAgent;
	         }
	         //===============Browser===========================
	        if (user.contains("msie"))
	        {
	            String substring=userAgent.substring(userAgent.indexOf("MSIE")).split(";")[0];
	            browser=substring.split(" ")[0].replace("MSIE", "IE")+"-"+substring.split(" ")[1];
	        } else if (user.contains("safari") && user.contains("version"))
	        {
	            browser=(userAgent.substring(userAgent.indexOf("Safari")).split(" ")[0]).split("/")[0]+"-"+(userAgent.substring(userAgent.indexOf("Version")).split(" ")[0]).split("/")[1];
	        } else if ( user.contains("opr") || user.contains("opera"))
	        {
	            if(user.contains("opera"))
	                browser=(userAgent.substring(userAgent.indexOf("Opera")).split(" ")[0]).split("/")[0]+"-"+(userAgent.substring(userAgent.indexOf("Version")).split(" ")[0]).split("/")[1];
	            else if(user.contains("opr"))
	                browser=((userAgent.substring(userAgent.indexOf("OPR")).split(" ")[0]).replace("/", "-")).replace("OPR", "Opera");
	        } else if (user.contains("chrome"))
	        {
	            browser=(userAgent.substring(userAgent.indexOf("Chrome")).split(" ")[0]).replace("/", "-");
	        } else if ((user.indexOf("mozilla/7.0") > -1) || (user.indexOf("netscape6") != -1)  || (user.indexOf("mozilla/4.7") != -1) || (user.indexOf("mozilla/4.78") != -1) || (user.indexOf("mozilla/4.08") != -1) || (user.indexOf("mozilla/3") != -1) )
	        {
	            browser = "Netscape-?";

	        } else if (user.contains("firefox"))
	        {
	            browser=(userAgent.substring(userAgent.indexOf("Firefox")).split(" ")[0]).replace("/", "-");
	        } else if(user.contains("rv"))
	        {
	            browser="IE-" + user.substring(user.indexOf("rv") + 3, user.indexOf(")"));
	        } else
	        {
	            browser = "UnKnown, More-Info: "+userAgent;
	        }
	        
	        objBeanAuditoria.setSo(os);
	        objBeanAuditoria.setUrl(url);
	        objBeanAuditoria.setBrowser(browser);
	        objBeanAuditoria.setHostname(hostname);
	        objBeanAuditoria.setIp(req.getRemoteAddr());
	        objBeanAuditoria.setAccion(pAccion);
	        objBeanAuditoria.setResultado(pResultado);
	        objBeanAuditoria.setIdUsuario(pIdUsuario);
	        objBeanAuditoria.setUsuario(pUsuario);
	        objBeanAuditoria.setModulo(pModulo);
	        objBeanAuditoria.setBean(pBean);
	        
	        BusinessAuditoria objBusinessAuditoria = new BusinessAuditoria();
	        objBusinessAuditoria.saveAuditoria(objBeanAuditoria, ssf);
	        
		}
		catch(Exception ex) {
			System.out.println(ex);
			objBeanAuditoria = null;
		}
		
		return objBeanAuditoria;
	}

	public static String ConvertEstado(String pEstado) {
		String strEstado = "";
		if (pEstado.equals("NEW"))
			strEstado = "Nuevo";
		else if (pEstado.equals("DRAFT"))
			strEstado = "Borrador";
		else if (pEstado.equals("INPROG"))
			strEstado = "En progreso";
		else if (pEstado.equals("SLAHOLD"))
			strEstado = "En espera";
		else if (pEstado.equals("QUEUED"))
			strEstado = "En cola";
		else if (pEstado.equals("RESOLVCONF"))
			strEstado = "Resuelto";
		else if (pEstado.equals("RESOLVED"))
			strEstado = "Resuelto";
		else if (pEstado.equals("CLOSED"))
			strEstado = "Cerrado";
		else if (pEstado.equals("CANCELED"))
			strEstado = "Cancelado";
		else
			strEstado = pEstado;

		return strEstado;
	}

	public static String eliminarTagsHTML(String cadena) {
		cadena = cadena.replaceAll("<[^>]*(>|$)", "");
		return cadena;
	}

	public static String limpiarCadena(String str) {
		String original = "Ã�Ã‰Ã�Ã“ÃšÃœÃ¼";
		String replacement = "AEIOUUu";
		if (str == null) {
			return null;
		}
		char[] array = str.toCharArray();
		for (int index = 0; index < array.length; index++) {
			int pos = original.indexOf(array[index]);
			if (pos > -1) {
				array[index] = replacement.charAt(pos);
			}
		}
		return new String(array);
	}

	public static String cleanString(String str) {
		if (str == null) {
			return null;
		}
		str = Normalizer.normalize(str, Normalizer.Form.NFD);
		// str = str.replaceAll("[\\p{InCombiningDiacriticalMarks}]", "")
		str = str.replaceAll("\n", "").replaceAll("\r", "").replaceAll("\t", "").replaceAll("<.*?>", "")
				.replaceAll("<", "").replaceAll(">", "").replaceAll("'", "").replaceAll("\"", "")
				.replaceAll("\\\"", "/").replaceAll("\\\\", "/").replaceAll("", "").replaceAll("<img.*", "");
		return str;
	}

	public static String fechaActual() {
		String strfecha = "";

		Calendar fecha = Calendar.getInstance();
		int anio = fecha.get(Calendar.YEAR);
		String aniostring = String.valueOf(anio);
		int mes = fecha.get(Calendar.MONTH) + 1;
		String messtring;
		if (mes < 10) {
			messtring = "0" + String.valueOf(mes);
		} else {
			messtring = String.valueOf(mes);
		}
		int dia = fecha.get(Calendar.DAY_OF_MONTH);
		String diastring;
		if (dia < 10) {
			diastring = "0" + String.valueOf(dia);
		} else {
			diastring = String.valueOf(dia);
		}
		strfecha = messtring + "/" + diastring + "/" + aniostring;

		return strfecha;
	}

	public static String fechaInicio() {
		String strfecha = "";

		Calendar fecha = Calendar.getInstance();
		fecha.add(Calendar.DAY_OF_YEAR, -90);

		int anio = fecha.get(Calendar.YEAR);
		String aniostring = String.valueOf(anio);
		int mes = fecha.get(Calendar.MONTH) + 1;
		String messtring;
		if (mes < 10) {
			messtring = "0" + String.valueOf(mes);
		} else {
			messtring = String.valueOf(mes);
		}
		int dia = fecha.get(Calendar.DAY_OF_MONTH);
		String diastring;
		if (dia < 10) {
			diastring = "0" + String.valueOf(dia);
		} else {
			diastring = String.valueOf(dia);
		}
		strfecha = messtring + "/" + diastring + "/" + aniostring;

		return strfecha;
	}

	public static String emoji(String str) {
		if (str == null) {
			return null;
		}
		str = str.replaceAll("", "");
		return str;
	}

	public static String formatHTMLListTickets(List<BeanMaximo> lista) {
		// Utilitario util = new Utilitario();
		StringBuilder cadenaHTML = new StringBuilder();
		String cadena = "";

		cadenaHTML.append("<br><div class='table-responsive'><table class='table table-bordered'>");
		cadenaHTML.append("<thead>");
		cadenaHTML.append("<tr class='bg-primary'>");
		cadenaHTML.append("<th>Nro</th>");
		cadenaHTML.append("<th>Fecha</th>");
		cadenaHTML.append("<th>Nro Ticket</th>");
		cadenaHTML.append("<th>Estado</th>");
		cadenaHTML.append("<th>Descripción</th>");
		cadenaHTML.append("<th>Propietario</th>");
		cadenaHTML.append("</tr>");
		cadenaHTML.append("</thead>");
		cadenaHTML.append("<tbody>");
		for (int i = 0; i < lista.size(); i++) {
			cadenaHTML.append("<tr>");
			cadenaHTML.append("<td>" + (i + 1) + "</td>");
			cadenaHTML.append("<td>" + lista.get(i).getTicketFechaCreacion() + "</td>");
			cadenaHTML.append("<td>" + lista.get(i).getIdTicket() + "</td>");
			cadenaHTML.append("<td>" + lista.get(i).getTicketEstado() + "</td>");
			cadenaHTML.append("<td>" + lista.get(i).getTicketTitulo() + "</td>");
			cadenaHTML.append("<td>" + lista.get(i).getTicketPropietario() + "</td>");
			cadenaHTML.append("</tr>");
		}
		cadenaHTML.append("</tbody>");
		cadenaHTML.append("</table></div>");

		cadena = cadenaHTML.toString();
		return cadena;

	}

	public static Date sumarDiasAFecha(Date fecha, int dias) {
		if (dias == 0)
			return fecha;
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(fecha);
		calendar.add(Calendar.DAY_OF_YEAR, dias);
		return calendar.getTime();
	}

	public static int difereciaDias(String dateIni, String dateFin) throws ParseException {

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date fechaInicial = dateFormat.parse(dateIni);
		Date fechaFinal = dateFormat.parse(dateFin);

		int dias = (int) ((fechaFinal.getTime() - fechaInicial.getTime()) / 86400000);
		return dias;
	}

	public static String diferenciaHoras(String horaInicio, String horaFinal) {

		long finalduration = 0;
		String strHora = "";

//		 LocalTime hInicio = LocalTime.parse(horaInicio); //formato hh:mm:ss (24 hrs)
//		 LocalTime hTermino = LocalTime.parse(horaFinal); //formato hh:mm:ss (24 hrs)
//
//		 if(hInicio.compareTo(hTermino) == 1) {
//		 long duration1 = Duration.between(hInicio,
//		 LocalTime.parse("23:59:59")).getSeconds();
//		 long duration2 = Duration.between(LocalTime.parse("00:00:00"),
//		 hTermino).getSeconds();
//		 long temp = LocalTime.parse("00:00:01").getSecond();
//		 finalduration = duration1 + duration2 + temp;
//		 }else if(hInicio.compareTo(hTermino) == -1){
//		 finalduration = Duration.between(hInicio, hTermino).getSeconds();
//		 }

//		 strHora = Time.valueOf(LocalTime.ofSecondOfDay(finalduration)).toString();

		return strHora;
	}
	
	public String convierteAformatoHHMMSS(double minutos){
		int hor,min,seg;
		double dminutos= minutos;

		 	hor=(int)(dminutos/3600);
	        min=(int)(dminutos);
	        seg=(int)((dminutos-min)*60);
 
          String shora="",smin="",sseg="";
        
        if(hor<10){shora="0"+String.valueOf(hor);}else{shora=String.valueOf(hor);}
        if(min<10){smin="0"+String.valueOf(min);}else{smin=String.valueOf(min);}
        if(seg<10){sseg="0"+String.valueOf(seg);}else{sseg=String.valueOf(seg);}
        
		String nuevoformato=shora+":"+smin+":"+sseg;

		return nuevoformato;
	}
	
	public static BeanParameters buscarLDAP(String pcodigo) {
		BeanParameters obj = new BeanParameters();
		
			Properties properties = new Properties();
			properties.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
//			properties.put(Context.PROVIDER_URL,"LDAP://bluepages.ibm.com:389");
			properties.put(Context.PROVIDER_URL,"LDAP://9.57.182.78:389");
			
			try {
				
				DirContext context = new InitialDirContext(properties);
				SearchControls searchCtrls = new SearchControls();
				searchCtrls.setSearchScope(SearchControls.SUBTREE_SCOPE);
				String filter = "(uid=" + pcodigo + "*)";
				NamingEnumeration values = context.search("ou=bluepages,o=ibm.com",filter,searchCtrls);
				SearchResult searchResult=null;
				
				while (values.hasMoreElements()) {			
				
					SearchResult result = (SearchResult) values.next();
					Attributes attribs = result.getAttributes();	
						
					if (null != attribs){			
							obj.setStrValor1(attribs.get("cn").get().toString());
							obj.setStrValor2(attribs.get("mail").get().toString());
							obj.setStrValor3(attribs.get("employeeCountryCode").get().toString()); 
							obj.setStrValor4(attribs.get("ibmSerialNumber").get().toString());
						}
				}

				context.close();

			} catch (NamingException e) {
				e.printStackTrace();
				System.out.println("nro: icount");
			}
		
		return obj;
	}
	
	public static String encodeHTML(String pencode) throws UnsupportedEncodingException {
		return java.net.URLEncoder.encode(pencode, StandardCharsets.ISO_8859_1.name());
	}
	
//	public String convierteAformatoHHMMSS(int segundos){
//		int hor,min,seg;
//		int total= segundos;
//
//		 	hor=(int)(segundos/36000);
//	        min=(int)(dminutos/3600);
//	        seg=(int)((dminutos-min));
// 
//          String shora="",smin="",sseg="";
//        
//        if(hor<10){shora="0"+String.valueOf(hor);}else{shora=String.valueOf(hor);}
//        if(min<10){smin="0"+String.valueOf(min);}else{smin=String.valueOf(min);}
//        if(seg<10){sseg="0"+String.valueOf(seg);}else{sseg=String.valueOf(seg);}
//        
//		String nuevoformato=shora+":"+smin+":"+sseg;
//
//		return nuevoformato;
//	}
	
	public static String formatoMes(String Mes) {
		
		String formato = "";
		
		int nmes = Integer.parseInt(Mes);
		
		switch(nmes) {
		
		case 1:
			formato = "ENERO"; break;
		case 2:
			formato = "FEBRERO"; break;
		case 3:
			formato = "MARZO"; break;
		case 4: 
			formato = "ABRIL"; break;
		case 5:
			formato = "MAYO"; break;
		case 6:
			formato = "JUNIO"; break;
		case 7:
			formato = "JULIO"; break;
		case 8:
			formato = "AGOSTO"; break;
		case 9:
			formato = "SETIEMBRE"; break;
		case 10:
			formato = "OCTUBRE"; break;
		case 11:
			formato = "NOVIEMBRE"; break;
		case 12:
			formato = "DICIEMBRE"; break;
		}
		
		
		
		return formato;
	}
}
