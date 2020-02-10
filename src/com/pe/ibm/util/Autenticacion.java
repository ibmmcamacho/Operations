package com.pe.ibm.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanParameters;
import com.pe.ibm.business.BusinessOptions;

public class Autenticacion {

	public String[] ibm(String pUsuario, String pClave, String pAmbiente,SqlSessionFactory ssf, String purl) {
		String[] resultado = new String[2];
		try {
			BeanParameters objBeanParameters = new BeanParameters();
			
			objBeanParameters.setStrType("AUTENTICACION_DIR_TOKEN");
			objBeanParameters.setStrTeam("ADMINISTRACION");
			List<BeanOptions> listBeanOptions = new BusinessOptions().listOptions2(objBeanParameters, ssf);
//			System.out.println(purl);
//			System.out.println("Contiene la palarba 'mybluemix':" + purl.contains("mybluemix"));
			URL url;
//			System.out.println("Cantidad total de lista: " + listBeanOptions.size());
			
			if(listBeanOptions.size() > 0){					
 
				url = new URL("https://cap-sg-prd-4.integration.ibmcloud.com:16632/SecurityServices/api/securityServices/autenticacion");
				if(purl.contains("mybluemix"))
					url = new URL("https://cap-sg-prd-3.integration.ibmcloud.com:16825/SecurityServices/api/securityServices/autenticacion");
				else
					url = new URL(listBeanOptions.get(0).getStrDescripcion());
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			
			String input;
			if(purl.contains("mybluemix"))
				input = "{\"usuario\": \"" + pUsuario + "\",  \"password\": \"" + pClave + "\", \"cliente\": \"IBMPE\", \"token\": \"8&kc?DoOQaTrDJBl?mnpmh{tugCpGFtW=pzBIuy2u5drCil50e\", \"destino\": \"" + pAmbiente + "\"}";
			else
				input = "{\"token\":\"" + listBeanOptions.get(0).getStrValor1() + "\",\"usuario\" : \"" + pUsuario + "\", \"password\" :\"" + pClave + "\", \"cliente\" : \"IBMPE\" , \"destino\" : \"" + pAmbiente + "\"}";
			
//			String input = "{\"token\":\"" + listBeanOptions.get(0).getStrValor1() + "\",\"usuario\" : \"" + pUsuario + "\", \"password\" :\"" + pClave + "\", \"cliente\" : \"IBMPE\" , \"destino\" : \"" + pAmbiente + "\"}";
//			String input = "{\"usuario\": \"" + pUsuario + "\",  \"password\": \"" + pClave + "\", \"cliente\": \"IBMPE\", \"token\": \"8&kc?DoOQaTrDJBl?mnpmh{tugCpGFtW=pzBIuy2u5drCil50e\", \"destino\": \"" + pAmbiente + "\"}";
			
			OutputStream os = conn.getOutputStream();
			os.write(input.getBytes());
			os.flush();
			
			resultado[0] = String.valueOf(conn.getResponseCode());

			if (conn.getResponseCode() == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(
						(conn.getInputStream())));

				String output;
				while ((output = br.readLine()) != null) {
					resultado[1] = output;
				}
			} else {
				resultado[1] = "{\"code\":" + conn.getResponseCode() + "}";
			}
			conn.disconnect();
			}
			else
			{
				resultado[1] = "{\"Usuario\":[{\"codigo\" : \"500\",\"Nombre Completo \" : \"Desconocido\"}]}";
			}
		} catch (MalformedURLException e) {
			System.out.println("ERROR AUTENTICACIÓN ==> " + e.toString());
		} catch (IOException e) {
			System.out.println("ERROR AUTENTICACIÓN ==> " + e.toString());
		}

		return resultado;
	}
}


//URL url = new URL("http://129.39.179.13/SecurityServices/api/securityServices/autenticacion");			
//String input = "{\"token\":\"Q&U[CKSRGb?JBMD&=WXuDxMKDZm}A<+lQ6,hg7xLs[hHbaH>IM\",\"usuario\" : \"" + pUsuario + "\", \"password\" :\"" + pClave + "\", \"cliente\" : \"IBMPE\" , \"destino\" : \"" + pAmbiente + "\"}";