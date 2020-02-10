package com.pe.ibm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanRendimiento;
import com.pe.ibm.bean.BeanRendimientoDashboard;
import com.pe.ibm.bean.BeanSession;
import com.pe.ibm.business.BusinessRendimiento;
import com.pe.ibm.util.AppUtils;

/**
 * Servlet implementation class ServletActividad
 */
@WebServlet("/ServletRendimiento")
public class ServletRendimiento extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int strAccion;
	private int idRendimiento;
	private String userMod;

//	
//	MyBatisUtil objMyBatis = MyBatisUtil.getInstance();
//	SqlSessionFactory ssf= objMyBatis.getSqlSessionFactory();
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletRendimiento() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		SqlSessionFactory ssf = (SqlSessionFactory) request.getServletContext().getAttribute("sqlsf");
		//Captura de parametros
				this.strAccion = Integer.parseInt(request.getParameter("strAccion"));
				
				BeanSession objBeanSession = new BeanSession();
				
				HttpSession objSessionLogin = request.getSession(true);
				objBeanSession = (BeanSession) objSessionLogin.getAttribute("usuarioLogin");

				this.userMod = 	objBeanSession.getObjBeanPersonal().getStrNombre().trim() + " " + 
								objBeanSession.getObjBeanPersonal().getStrApPaterno().trim() + " " +
								objBeanSession.getObjBeanPersonal().getStrApMaterno().trim();
				

				switch (this.strAccion){
				case 1: //
					listar(request, response,ssf);
					break;	
				case 2: //
					listar_reporte(request, response,ssf);
					break;
				}	
		
		
	}

	private void listar(HttpServletRequest request, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		System.out.println("listar");
		try {
			
			String strFecha = request.getParameter("strFechaRendimiento").toString();
			String strTipo = request.getParameter("strTipo").toString();
			
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date tt = formatter.parse(strFecha);
			
			//captura de parametros
			BeanRendimiento bean = new BeanRendimiento();
			bean.setTipo(strTipo);
			bean.setFecha(tt);
			
			BusinessRendimiento servicio = new BusinessRendimiento();
			
			List<BeanRendimiento> listaRendimiento = servicio.listar(bean, ssf);
			
			//Generar JSON
			objJson1.append("{\"ListaRendimiento\": [");
			
			for (BeanRendimiento beanActividad2 : listaRendimiento) {
			

				objJson1.append("{" +				
						"\"idRendimiento\" : \"" + beanActividad2.getIdRendimiento()+ "\" ," +
						"\"state\" : \"" + beanActividad2.getState()+ "\" ," +
						"\"name\" : \"" + beanActividad2.getName()+ "\" ," +
						"\"agent\" : \"" + beanActividad2.getAgent()+ "\" ," +
						"\"node\" : \"" + beanActividad2.getNode()+ "\" ," +
						"\"exec\" : \"" + beanActividad2.getExec()+ "\" ," +
						"\"start\" : \"" + beanActividad2.getStart()+ "\" ," +
						"\"aplication\" : \"" + beanActividad2.getAplication()+ "\" ," +
						"\"breakdown\" : \"" + beanActividad2.getBreakdown()+ "\" ," +
						"\"response\" : \"" + beanActividad2.getResponse()+ "\" ," +
						"\"detected\" : \"" + beanActividad2.getDetected()+ "\" " +						
						"},"
						);
			}
			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaRendimiento\": [");
		
				objJson1.append("{" +
						"\"idRendimiento\" : \"" + ""+ "\" ," +
						"\"state\" : \"" + "No hay informacion disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	
	
	private void listar_reporte(HttpServletRequest request, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		System.out.println("listar_reporte");
		try {
			
			String strDesde = request.getParameter("strDesde").toString();
			String strHasta = request.getParameter("strHasta").toString();
			
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date desde = formatter.parse(strDesde);
			Date hasta = formatter.parse(strHasta);
			
			//captura de parametros
			BeanRendimientoDashboard bean2 = new BeanRendimientoDashboard();
			bean2.setDesde(desde);
			bean2.setHasta(hasta);
			
			BusinessRendimiento servicio = new BusinessRendimiento();
			
			List<BeanRendimientoDashboard> listaRendimientoReporte = servicio.listar_reporte(bean2, ssf);
			
			//Generar JSON
			objJson1.append("{\"ListaRendimientoReporte\": [");
			
			for (BeanRendimientoDashboard beanReporte : listaRendimientoReporte) {
			

				objJson1.append("{" +	
						"\"bizagi_percentil\" : \"" + beanReporte.getBizagi_percentil()+ "\" ," +
						"\"bizagi_threshold\" : \"" + beanReporte.getBizagi_threshold()+ "\" ," +
						"\"bizagi_total\" : \"" + beanReporte.getBizagi_total()+ "\" ," +
						"\"bizagi_desvios\" : \"" + beanReporte.getBizagi_desvios()+ "\" ," +
						"\"bizagi_indicador\" : \"" + beanReporte.getBizagi_indicador()+ "\" ," +
						"\"proveedores_percentil\" : \"" + beanReporte.getProveedores_percentil()+ "\" ," +
						"\"proveedores_threshold\" : \"" + beanReporte.getProveedores_threshold()+ "\" ," +
						"\"proveedores_total\" : \"" + beanReporte.getProveedores_total()+ "\" ," +
						"\"proveedores_desvios\" : \"" + beanReporte.getProveedores_desvios()+ "\" ," +
						"\"proveedores_indicador\" : \"" + beanReporte.getProveedores_indicador()+ "\" ," +
						"\"cobertura_percentil\" : \"" + beanReporte.getCobertura_percentil()+ "\" ," +
						"\"cobertura_threshold\" : \"" + beanReporte.getCobertura_threshold()+ "\" ," +
						"\"cobertura_total\" : \"" + beanReporte.getCobertura_total()+ "\" ," +
						"\"cobertura_desvios\" : \"" + beanReporte.getCobertura_desvios()+ "\" ," +
						"\"cobertura_indicador\" : \"" + beanReporte.getCobertura_indicador()+ "\" ," +
						"\"asegurados_percentil\" : \"" + beanReporte.getAsegurados_percentil()+ "\" ," +
						"\"asegurados_threshold\" : \"" + beanReporte.getAsegurados_threshold()+ "\" ," +
						"\"asegurados_total\" : \"" + beanReporte.getAsegurados_total()+ "\" ," +
						"\"asegurados_desvios\" : \"" + beanReporte.getAsegurados_desvios()+ "\" ," +
						"\"asegurados_indicador\" : \"" + beanReporte.getAsegurados_indicador()+ "\" ," +
						"\"cupones_percentil\" : \"" + beanReporte.getCupones_percentil()+ "\" ," +
						"\"cupones_threshold\" : \"" + beanReporte.getCupones_threshold()+ "\" ," +
						"\"cupones_total\" : \"" + beanReporte.getCupones_total()+ "\" ," +
						"\"cupones_desvios\" : \"" + beanReporte.getCupones_desvios()+ "\" ," +
						"\"cupones_indicador\" : \"" + beanReporte.getCupones_indicador()+ "\" ," +
						"\"certificado_percentil\" : \"" + beanReporte.getCertificado_percentil()+ "\" ," +
						"\"certificado_threshold\" : \"" + beanReporte.getCertificado_threshold()+ "\" ," +
						"\"certificado_total\" : \"" + beanReporte.getCertificado_total()+ "\" ," +
						"\"certificado_desvios\" : \"" + beanReporte.getCertificado_desvios()+ "\" ," +
						"\"certificado_indicador\" : \"" + beanReporte.getCertificado_indicador()+ "\" ," +
						"\"poliza_percentil\" : \"" + beanReporte.getPoliza_percentil()+ "\" ," +
						"\"poliza_threshold\" : \"" + beanReporte.getPoliza_threshold()+ "\" ," +
						"\"poliza_total\" : \"" + beanReporte.getPoliza_total()+ "\" ," +
						"\"poliza_desvios\" : \"" + beanReporte.getPoliza_desvios()+ "\" ," +
						"\"poliza_indicador\" : \"" + beanReporte.getPoliza_indicador()+ "\" ," +
						"\"det_sin_percentil\" : \"" + beanReporte.getDet_sin_percentil()+ "\" ," +
						"\"det_sin_threshold\" : \"" + beanReporte.getDet_sin_threshold()+ "\" ," +
						"\"det_sin_total\" : \"" + beanReporte.getDet_sin_total()+ "\" ," +
						"\"det_sin_desvios\" : \"" + beanReporte.getDet_sin_desvios()+ "\" ," +
						"\"det_sin_indicador\" : \"" + beanReporte.getDet_sin_indicador()+ "\" ," +
						"\"feb_cob_percentil\" : \"" + beanReporte.getFeb_cob_percentil()+ "\" ," +
						"\"feb_cob_threshold\" : \"" + beanReporte.getFeb_cob_threshold()+ "\" ," +
						"\"feb_cob_total\" : \"" + beanReporte.getFeb_cob_total()+ "\" ," +
						"\"feb_cob_desvios\" : \"" + beanReporte.getFeb_cob_desvios()+ "\" ," +
						"\"feb_cob_indicador\" : \"" + beanReporte.getFeb_cob_indicador()+ "\" ," +
						"\"siniestro_cert_percentil\" : \"" + beanReporte.getSiniestro_cert_percentil()+ "\" ," +
						"\"siniestro_cert_threshold\" : \"" + beanReporte.getSiniestro_cert_threshold()+ "\" ," +
						"\"siniestro_cert_total\" : \"" + beanReporte.getSiniestro_cert_total()+ "\" ," +
						"\"siniestro_cert_desvios\" : \"" + beanReporte.getSiniestro_cert_desvios()+ "\" ," +
						"\"siniestro_cert_indicador\" : \"" + beanReporte.getSiniestro_cert_indicador()+ "\" ," +
						"\"financia_percentil\" : \"" + beanReporte.getFinancia_percentil()+ "\" ," +
						"\"financia_threshold\" : \"" + beanReporte.getFinancia_threshold()+ "\" ," +
						"\"financia_total\" : \"" + beanReporte.getFinancia_total()+ "\" ," +
						"\"financia_desvios\" : \"" + beanReporte.getFinancia_desvios()+ "\" ," +
						"\"financia_indicador\" : \"" + beanReporte.getFinancia_indicador()+ "\" ," +
						"\"trasmision_percentil\" : \"" + beanReporte.getTrasmision_percentil()+ "\" ," +
						"\"trasmision_threshold\" : \"" + beanReporte.getTrasmision_threshold()+ "\" ," +
						"\"trasmision_total\" : \"" + beanReporte.getTrasmision_total()+ "\" ," +
						"\"trasmision_desvios\" : \"" + beanReporte.getTrasmision_desvios()+ "\" ," +
						"\"trasmision_indicador\" : \"" + beanReporte.getTrasmision_indicador()+ "\" ," +
						"\"poliza_act_percentil\" : \"" + beanReporte.getPoliza_act_percentil()+ "\" ," +
						"\"poliza_act_threshold\" : \"" + beanReporte.getPoliza_act_threshold()+ "\" ," +
						"\"poliza_act_total\" : \"" + beanReporte.getPoliza_act_total()+ "\" ," +
						"\"poliza_act_desvios\" : \"" + beanReporte.getPoliza_act_desvios()+ "\" ," +
						"\"poliza_act_indicador\" : \"" + beanReporte.getPoliza_act_indicador()+ "\" ," +
						"\"poliza_buscar_percentil\" : \"" + beanReporte.getPoliza_buscar_percentil()+ "\" ," +
						"\"poliza_buscar_threshold\" : \"" + beanReporte.getPoliza_buscar_threshold()+ "\" ," +
						"\"poliza_buscar_total\" : \"" + beanReporte.getPoliza_buscar_total()+ "\" ," +
						"\"poliza_buscar_desvios\" : \"" + beanReporte.getPoliza_buscar_desvios()+ "\" ," +
						"\"poliza_buscar_indicador\" : \"" + beanReporte.getPoliza_buscar_indicador()+ "\" ," +
						"\"poliza_preafi_percentil\" : \"" + beanReporte.getPoliza_preafi_percentil()+ "\" ," +
						"\"poliza_preafi_threshold\" : \"" + beanReporte.getPoliza_preafi_threshold()+ "\" ," +
						"\"poliza_preafi_total\" : \"" + beanReporte.getPoliza_preafi_total()+ "\" ," +
						"\"poliza_preafi_desvios\" : \"" + beanReporte.getPoliza_preafi_desvios()+ "\" ," +
						"\"poliza_preafi_indicador\" : \"" + beanReporte.getPoliza_preafi_indicador()+ "\" ," +
						"\"endoso_percentil\" : \"" + beanReporte.getEndoso_percentil()+ "\" ," +
						"\"endoso_threshold\" : \"" + beanReporte.getEndoso_threshold()+ "\" ," +
						"\"endoso_total\" : \"" + beanReporte.getEndoso_total()+ "\" ," +
						"\"endoso_desvios\" : \"" + beanReporte.getEndoso_desvios()+ "\" ," +
						"\"endoso_indicador\" : \"" + beanReporte.getEndoso_indicador()+ "\" ," +
						"\"salud_percentil\" : \"" + beanReporte.getSalud_percentil()+ "\" ," +
						"\"salud_threshold\" : \"" + beanReporte.getSalud_threshold()+ "\" ," +
						"\"salud_total\" : \"" + beanReporte.getSalud_total()+ "\" ," +
						"\"salud_desvios\" : \"" + beanReporte.getSalud_desvios()+ "\" ," +
						"\"salud_indicador\" : \"" + beanReporte.getSalud_indicador()+ "\" ," +
						"\"trama_percentil\" : \"" + beanReporte.getTrama_percentil()+ "\" ," +
						"\"trama_threshold\" : \"" + beanReporte.getTrama_threshold()+ "\" ," +
						"\"trama_total\" : \"" + beanReporte.getTrama_total()+ "\" ," +
						"\"trama_desvios\" : \"" + beanReporte.getTrama_desvios()+ "\" ," +
						"\"trama_indicador\" : \"" + beanReporte.getTrama_indicador()+ "\" " +				
						"},"
						);
			}
			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
			
		
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaRendimientoReporte\": [");
		
				objJson1.append("{" +
						"\"fecha_reporte\" : \"" + ""+ "\" ," +
						"\"state\" : \"" + "No hay informacion disponible"+ "\" " +
						"},"
						);			
			
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


	
}
