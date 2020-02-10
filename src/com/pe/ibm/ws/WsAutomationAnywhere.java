package com.pe.ibm.ws;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class WsAutomationAnywhere {

	public String execCargaUAT(String ppaso) throws IOException {
		JsonNode response = new ObjectMapper().readTree(rpa());
		String strToken = response.path("token").toString().replace("\"", "");
		String res = execBot(strToken, ppaso);
		return res;
	}
	
	public String rpa() {
		String resultado = "";
		try {
			
			URL url;
			url = new URL("http://129.39.178.68/v1/authentication");
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			
			String input;
			input = "{\"username\": \"ibm_api_user\", \"password\": \"CGAupc33##\"}";
			OutputStream os = conn.getOutputStream();
			os.write(input.getBytes());
			os.flush();
			os.close();
			
			resultado = String.valueOf(conn.getResponseCode());

			if (conn.getResponseCode() == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(
						(conn.getInputStream())));

				String output;
				while ((output = br.readLine()) != null) {
					resultado = output;
				}
			} else {
				resultado = "{\"code\":500}";
			}
			conn.disconnect();
			
		} catch (MalformedURLException e) {
			System.out.println("==> " + e.toString());
		} catch (IOException e) {
			System.out.println("==> " + e.toString());
		}
		
		
		return resultado;
	}
	
	
	public static String execBot(String ptoken, String ppaso) {
		String resultado = "";
		try {
			
			URL url;
			url = new URL("http://129.39.178.68/v1/schedule/automations/deploy");
//			url = new URL("http://129.39.178.68/v2/automations/deploy");
			
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("x-authorization", ptoken);
			
			String input = (ppaso.equals("cargauat") ? 
					"{\"taskRelativePath\":\"My Tasks\\\\MANUEL_BOT\\\\AUTO_UAT.atmx\",\"botRunners\":[{\"client\":\"WIN-CL4GNB6VCHS\",\"user\":\"rpa-robot-uat-1\"}]}" : 
					ppaso.equals("cargacar") ? 
					"{\"taskRelativePath\":\"My Tasks\\\\MANUEL_BOT\\\\INIT2_PCAR.atmx\",\"botRunners\":[{\"client\":\"WIN-8VUGGD2M3LN\",\"user\":\"rpa-robot-uat-2\"}]}" : 
					"");
			
//			input = "{\"taskRelativePath\":\"My Tasks\\MANUEL_BOT\\BOTDEMO.atmx\",\"botRunners\":[{\"client\":\"DESKTOP-792PGQP\",\"user\":\"rpa-robot-uat-1\"}]}";
//			input = "{\"taskRelativePath\":\"My Tasks\\\\MANUEL_BOT\\\\BOTDEMO.atmx\",\"botRunners\":[{\"client\":\"DESKTOP-792PGQP\",\"user\":\"rpa-robot-uat-1\"}]}";
//			input = "{\"taskRelativePath\":\"My Tasks\\\\MANUEL_BOT\\\\BOTDEMO.atmx\",\"botRunners\":[{\"client\":\"DESKTOP-792PGQP\",\"user\":\"rpa-robot-uat-1\"}]}";
//			input = "{\"fileId\": \"MANUEL_BOT\\BOTDEMO.atmx\", \"deviceIds\": [{\"client\":\"DESKTOP-792PGQP\", \"user\":\"rpa-robot-uat-1\"}]}";
//			input = "{\"fields\": [], \"filter\": {\"operator\":\"substring\", \"value\":\"uat\", \"field\":\"name\"}}";
			
			
			
			OutputStream os = conn.getOutputStream();
			os.write(input.getBytes());
//			System.out.println(os.toString());
			os.flush();
			os.close();
			
			resultado = String.valueOf(conn.getResponseCode());
			System.out.println(resultado);

			if (conn.getResponseCode() == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(
						(conn.getInputStream())));

				String output;
				while ((output = br.readLine()) != null) {
					resultado = output;
				}
			} else {
				resultado = "{\"code\":500}";
			}
			conn.disconnect();
			
		} catch (MalformedURLException e) {
			System.out.println("==> " + e.toString());
		} catch (IOException e) {
			System.out.println("==> " + e.toString());
		}
		
		return resultado;
	}
	
	
	
}
