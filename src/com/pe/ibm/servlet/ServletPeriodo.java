package com.pe.ibm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pe.ibm.bean.BeanEmpleado;
import com.pe.ibm.bean.BeanOptions;
import com.pe.ibm.bean.BeanPeriodo;
import com.pe.ibm.bean.BeanPeriodoDet;
import com.pe.ibm.bean.BeanReporteDispatch;
import com.pe.ibm.business.BusinessOptions;
import com.pe.ibm.business.BusinessPeriodo;
import com.pe.ibm.business.BusinessPersonal;
import com.pe.ibm.business.BusinessReporteDispatch;

/**
 * Servlet implementation class ServletPeriodo
 */
@WebServlet("/ServletPeriodo")
public class ServletPeriodo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int accion ;
	
	
//	MyBatisUtil objMyBatis = MyBatisUtil.getInstance();
//	SqlSessionFactory ssf= objMyBatis.getSqlSessionFactory();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletPeriodo() {
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
				
				this.accion = Integer.parseInt(request.getParameter("strAccion"));				

				switch (this.accion){
				
				case 1: //Insertar
					mGuardar(request, response, ssf);
					break;
				case 2: //listar
					listarPeriodo(request, response,ssf);					
					break;
				case 3: //actualizar
					mActualizar(request, response, ssf);
					break;
				case 4: //actualizar_estado
					mEliminar(request, response, ssf);
					break;				
				case 5: //buscar_paraActualizar
					mBuscarDatos_PeriodoDet(request, response, ssf);
					break;
				case 6: //listarREPORTE
					listReportePeriodo(request, response,ssf);					
					break;
				}
				
				
				//Nueva Implementación
			
//				String strOperation = request.getParameter("strOperation");	
//								
//				if (strOperation.equals("listarPeriodo")) {
//					listarPeriodo(request, response,ssf);		//	JSP Administrar Actividad	
//				}else if (strOperation.equals("listReportePeriodo")) {
//					listReportePeriodo(request, response,ssf);			
//				}else if (strOperation.equals("mGuardar")) {
//					mGuardar(request, response, ssf);
//				}else if (strOperation.equals("mEliminar")) {
//					mEliminar(request, response, ssf);
//				}else if(strOperation.equals("mBuscarDatos_PeriodoDet")) {
//					mBuscarDatos_PeriodoDet(request, response, ssf);
//				}
		
		
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private void listarPeriodo(HttpServletRequest req, HttpServletResponse res,SqlSessionFactory ssf) throws IOException{
		res.setCharacterEncoding("UTF-8");
		StringBuilder strJson2 = new StringBuilder();
		PrintWriter out = res.getWriter();
		StringBuilder objJson1 = new StringBuilder();
		try {
			//Instancear metodos 
			BusinessPeriodo servicio = new BusinessPeriodo();		
			List<BeanPeriodo> listaPeriodo = servicio.listar(ssf);
			//Generar JSON
			objJson1.append("{\"ListaPeriodo\": [");			
			for (BeanPeriodo beanPeriodo : listaPeriodo) {
//				System.out.println(beanTurno2.toString());
				objJson1.append("{" +
						"\"idPeriodo\" : \"" + beanPeriodo.getIdPeriodo() + "\" ," +
						"\"descripcion\" : \"" + beanPeriodo.getDescripcion() + "\" " +
						"},"
						);
			}
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			//Generar JSON
			objJson1.append("{\"ListaPeriodo\": [");		
				objJson1.append("{" +
						"\"idPeriodo\" : \"" + ""+ "\" ," +
						"\"descripcion\" : \"" + "No hay informaciï¿½n disponible"+ "\" " +
						"},"
						);						
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");			
		}		
		out.print(strJson2);		
	}
	
	private void listReportePeriodo(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf)throws IOException {
		 StringBuilder strJson1 = new StringBuilder();
		 StringBuilder strJson2 = new StringBuilder();
		 response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			strJson1.append("{\"ListaReportePeriodo\": [");	
			
			try {
				List<BeanPeriodo> lstBeanPeriodo = null;
				BusinessPeriodo objBusinessPeriodo = new BusinessPeriodo(); 
				BeanPeriodo objBeanPeriodo = new BeanPeriodo();
				
				lstBeanPeriodo = objBusinessPeriodo.listReportePeriodo(objBeanPeriodo, ssf);
							
				if (lstBeanPeriodo.size() > 0) {
					for (BeanPeriodo item : lstBeanPeriodo) {
						strJson1.append("{" +
								"\"idPeriodo\" : \"" +  item.getIdPeriodo() + "\" ," +
								"\"titulo\" : \"" +  item.getTitulo() + "\" ," +
								"\"fecha_ini\" : \"" + item.getFecha_Ini() + "\" ," +
								"\"fecha_fin\" : \"" + item.getFecha_Fin() + "\" ," +
								"\"estado\" : \"" + item.getEstado()+ "\" ," +
								"\"id_tipo_periodo\" : \"" + item.getId_tipo_periodo() + "\" ," +
								"\"tipo_periodo\" : \"" + item.getTipo_periodo() + "\" ," +
								"\"intervalo\" : \"" + item.getIntervalo() + "\" ," +
								"\"dia_habil\" : \"" + item.getDia_habil() + "\" ," +
								"\"dia_feriado\" : \"" + item.getDia_feriado() + "\" " +
								"}," 
								);
					}				
						} else {
						strJson1 = new StringBuilder();
						strJson1.append("{\"ListaReportePeriodo\": [");
						strJson1.append("{" +
						"\"titulo\" : \"" + "" + "\" ," +
						"\"fecha_ini\" : \"" + " No hay información disponible" + "\" " +
						"},"
						);	
						}
				
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			}catch(Exception ex) {
				ex.printStackTrace();
				strJson1 = new StringBuilder();
				strJson1.append("{\"ListaReportePeriodo\": [");
				strJson1.append("{" +
						"\"titulo\" : \"" + "" + "\" ," +
						"\"fecha_ini\" : \"" + " No hay información disponible" + "\" " +
						"},"
						);
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
			}			
			out.print(strJson2);		
	}
	

	
	//Nueva Implementación
	public void mGuardar(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf)throws IOException {
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();	
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String resultadoP = "fail";
		String resultadoPD = "fail";
		try {
			int icount = 0;
			int icount_Det = 0;
			BeanPeriodo objPeriodo = new BeanPeriodo();
			BeanPeriodoDet objPeriodoDet = new BeanPeriodoDet();
			BusinessPeriodo objBusinessPeriodo = new BusinessPeriodo();	
			
			String textoPeriodo = request.getParameter("strtextPeriodo");							//DIA, SEMANA, MES, ANIO
			//PERIODO///////////////////////////////////////////////////////////////////////////////
			String strTitulo = request.getParameter("strTitulo").equals("") ? null : request.getParameter("strTitulo");								//PERIODO
			String strUsuario = request.getParameter("strUsuario");									//PERIODO
			int strEstado = Integer.parseInt(request.getParameter("strEstado"));					//PERIODO
			int stridTipo_Periodo = Integer.parseInt(request.getParameter("stridTipo_Periodo"));	//PERIODO	
			String fechaIni = request.getParameter("strFechaIni").equals("") ? null : request.getParameter("strFechaIni");  						//PERIODO
			int strIntervalo = Integer.parseInt(request.getParameter("strIntervalo"));				//PERIODO	
			//VALIDAR CUAL DE LOS RADIO BUTTON FUE SELECCIONADO FECHA FIN
			String strFechaFin = "";		
			if(Boolean.parseBoolean(request.getParameter("strrbtFechaFinNunca")) == true) {
				strFechaFin = "";																	//PERIODO
			}else if(Boolean.parseBoolean(request.getParameter("strrbtFechaFin")) == true) {
				strFechaFin = request.getParameter("strFechaFin").equals("") ? null : request.getParameter("strFechaFin");							//PERIODO
			}else if(Boolean.parseBoolean(request.getParameter("strrbtFechaFinRepeticiones")) == true) {
				strFechaFin = request.getParameter("strFechaFinRepeticiones").equals("") ? null : request.getParameter("strFechaFinRepeticiones");	//PERIODO
			}		
			//VALIDAR SI LOS DIA HABIL Y DIA FERIADO FUERON SELECIONADOS
			int dia_habil, dia_feriado;
			if(Boolean.parseBoolean(request.getParameter("strDiaHabil")) == true) {
				dia_habil = 1;																		//PERIODO
			}else { dia_habil = 0; }																//PERIODO
			if(Boolean.parseBoolean(request.getParameter("strDiaFeriado")) == true) {
				dia_feriado = 1;																	//PERIODO
			}else { dia_feriado = 0; }																//PERIODO
			
			objPeriodo.setTitulo(strTitulo);														//PERIODO
			objPeriodo.setUsuario_reg(strUsuario);													//PERIODO
			objPeriodo.setEstado(strEstado);														//PERIODO
			objPeriodo.setId_tipo_periodo(stridTipo_Periodo);										//PERIODO
			objPeriodo.setFecha_Ini(fechaIni);														//PERIODO
			objPeriodo.setIntervalo(strIntervalo);													//PERIODO
			objPeriodo.setFecha_Fin(strFechaFin);													//PERIODO
			objPeriodo.setDia_habil(dia_habil);														//PERIODO
			objPeriodo.setDia_feriado(dia_feriado);													//PERIODO
			//PERIODO_DETALLE///////////////////////////////////////////////////////////////////////
			String dia_tiempo_nombre = request.getParameter("strdia_tiempo_nombre").equals("") ? null : request.getParameter("strdia_tiempo_nombre");//PERIODO_DETALLE
			int dia_tiempo_numero = Integer.parseInt(request.getParameter("strdia_tiempo_numero")); 				//PERIODO_DETALLE
			int strcboOrdinales = Integer.parseInt(request.getParameter("strcboOrdinales"));						//PERIODO_DETALLE
			int semana = 0;
			if(Boolean.parseBoolean(request.getParameter("strsemana")) == true) {
				semana = 1;																							//PERIODO_DETALLE
			}else {	semana= 0;	}
			objPeriodoDet.setDia_tiempo_nombre(dia_tiempo_nombre);													//PERIODO_DETALLE
			objPeriodoDet.setDia_tiempo_numero(dia_tiempo_numero);													//PERIODO_DETALLE
			objPeriodoDet.setOrdinales(strcboOrdinales);															//PERIODO_DETALLE
			objPeriodoDet.setSemana(semana);
			String mesNoGuardado = "";
			String mesFebNoGuardado = "";
			//PERIODO_DETALLE
			
//			request.getParameter("strCboTorre").equals("0") ? null : request.getParameter("strCboTorre")
			//VALIDAR TIPO DE PERIODO SELECCIONADO
			if(textoPeriodo.equals("DIA")) {
				icount = objBusinessPeriodo.mGuardar(objPeriodo, ssf);												//PERIODO_GUARDAR
			}else if(textoPeriodo.equals("EXCLUSION")) {				
				icount = objBusinessPeriodo.mGuardar(objPeriodo, ssf);												//PERIODO_GUARDAR
				//Guarda el primer registro de detalle periodo
				String pPrincipal = request.getParameter("strPeriodoPrincipal");
				objPeriodoDet.setOrdinales(Integer.parseInt(pPrincipal));
				objPeriodoDet.setDia_especial(1);													//PERIODO_DETALLE
				icount_Det = objBusinessPeriodo.mGuardar_Det(objPeriodoDet,ssf);
				
				String pExcludes = request.getParameter("strPeriodoExcluido");
				//PERIODO_DETALLE EXCLUIDOS
				if(pExcludes.isEmpty() == false) {
					String[] listExclude = pExcludes.split(",");
					for(int i = 0; i < listExclude.length; i++) {					
						int exclude = Integer.parseInt(listExclude[i]);
						objPeriodoDet.setOrdinales(exclude);
						objPeriodoDet.setDia_especial(2);													//PERIODO_DETALLE
						icount_Det = objBusinessPeriodo.mGuardar_Det(objPeriodoDet,ssf);							//PERIODO_DETALLE_GUARDAR 
					}
				}
			}else if(textoPeriodo.equals("SEMANA")) {				
				icount = objBusinessPeriodo.mGuardar(objPeriodo, ssf);												//PERIODO_GUARDAR
				
				String stracum_selectDias = request.getParameter("stracum_selectDias");								//PERIODO_DETALLE
				if(stracum_selectDias.isEmpty() == false) {
					String[] dia_arr = stracum_selectDias.split(",");
					String dia_nombre = "";
					for(int i = 0; i < dia_arr.length; i++) {					
						dia_nombre = dia_arr[i].toString();					
						objPeriodoDet.setDia_nombre(dia_nombre);													//PERIODO_DETALLE
						icount_Det = objBusinessPeriodo.mGuardar_Det(objPeriodoDet,ssf);							//PERIODO_DETALLE_GUARDAR 
					}
				}
			}else if(textoPeriodo.equals("MES")) {
				icount = objBusinessPeriodo.mGuardar(objPeriodo, ssf);												//PERIODO_GUARDAR
				
				if(Boolean.parseBoolean(request.getParameter("strrbtDiaMes")) == true) {
					String stracumuladorDias = request.getParameter("stracumuladorDias");							//PERIODO_DETALLE
					if(stracumuladorDias.isEmpty() == false) {
						String dia_numero = "";
						String[] dia_arr = stracumuladorDias.split(",");
						for(int i = 0; i < dia_arr.length; i++) {
							dia_numero = dia_arr[i].toString();
							objPeriodoDet.setDia_numero(Integer.parseInt(dia_numero));								//PERIODO_DETALLE
							icount_Det = objBusinessPeriodo.mGuardar_Det(objPeriodoDet,ssf);						//PERIODO_DETALLE_GUARDAR
						}
					}
				}else if(Boolean.parseBoolean(request.getParameter("strrbtDiaPersonalizado")) == true) {
					String strdia_nombre = request.getParameter("strdia_nombre");									//PERIODO_DETALLE
					String strdia_especial = request.getParameter("strdia_especial");								//PERIODO_DETALLE
					if(strdia_nombre.isEmpty() == false) {
						String dia_nombre = "";
						String[] dia_nombre_arr = strdia_nombre.split(",");
						for(int i = 0; i < dia_nombre_arr.length; i++) {
							dia_nombre = dia_nombre_arr[i].toString();							
							objPeriodoDet.setDia_nombre(dia_nombre);												//PERIODO_DETALLE
							objPeriodoDet.setDia_especial((Integer) (strdia_especial.equals("") ? 0 : strdia_especial));		//PERIODO_DETALLE
							icount_Det = objBusinessPeriodo.mGuardar_Det(objPeriodoDet, ssf);						//PERIODO_DETALLE_GUARDAR
						}
					}else if (strdia_especial.isEmpty() == false) {
						String dia_especial = "";
						String[] dia_especial_arr = strdia_especial.split(",");
						for(int i = 0; i < dia_especial_arr.length; i++) {
							dia_especial = dia_especial_arr[i].toString();
							objPeriodoDet.setDia_nombre(strdia_nombre.equals("") ? null : strdia_nombre);			//PERIODO_DETALLE
							objPeriodoDet.setDia_especial(Integer.parseInt(dia_especial));											//PERIODO_DETALLE
							icount_Det = objBusinessPeriodo.mGuardar_Det(objPeriodoDet, ssf);						//PERIODO_DETALLE_GUARDAR
						}
					}
				}
			}else if(textoPeriodo.equals("AÑO")) {
				icount = objBusinessPeriodo.mGuardar(objPeriodo, ssf);
				
				String stracum_selectMes = request.getParameter("stracum_selectMes");
				String[] mes_arr = stracum_selectMes.split(",");
				String mes_nombre = "";
				String stracumuladorDias = request.getParameter("stracumuladorDias");
				int dia_numero = 0;
				String[] dia_arr = stracumuladorDias.split(",");
				if(Boolean.parseBoolean(request.getParameter("strrbtDiaMes")) == false && Boolean.parseBoolean(request.getParameter("strrbtDiaPersonalizado")) == false && stracum_selectMes.isEmpty() == false ) {
					if (stracum_selectMes.isEmpty() == false) {
						for(int i = 0; i < mes_arr.length; i++) {					
							mes_nombre = mes_arr[i].toString();					
							objPeriodoDet.setMes_nombre(mes_nombre);					
							icount_Det = objBusinessPeriodo.mGuardar_Det(objPeriodoDet,ssf);
						}
					}
				}
				
				if(Boolean.parseBoolean(request.getParameter("strrbtDiaMes")) == true && stracum_selectMes.isEmpty() == false) {
  					for(int i = 0; i < mes_arr.length; i++) {	
						mes_nombre = mes_arr[i].toString();	
						objPeriodoDet.setMes_nombre(mes_nombre);						
						for(int j = 0; j < dia_arr.length; j++) {							
							dia_numero = Integer.parseInt(dia_arr[j].toString());
							if(mes_nombre.equals("Abril") || mes_nombre.equals("Junio") || mes_nombre.equals("Setiembre") || mes_nombre.equals("Noviembre") ) {
								if(dia_numero <= 30) {
									objPeriodoDet.setDia_numero(dia_numero);
									icount_Det = objBusinessPeriodo.mGuardar_Det(objPeriodoDet,ssf);
								}else {
									mesNoGuardado += mes_nombre + ",";
									}
							}
							else if(mes_nombre.equals("Febrero")) {
								 if(dia_numero <= 29) {
									objPeriodoDet.setDia_numero(dia_numero);
									icount_Det = objBusinessPeriodo.mGuardar_Det(objPeriodoDet,ssf);
								 }else  if(dia_numero >= 29){
										mesFebNoGuardado = mes_nombre;
									}
							}else {//MESES CON TODOS LOS DIAS
								objPeriodoDet.setDia_numero(dia_numero);
								icount_Det = objBusinessPeriodo.mGuardar_Det(objPeriodoDet,ssf);
							}
						}
					}
				}
				
				
				if(Boolean.parseBoolean(request.getParameter("strrbtDiaPersonalizado")) == true && stracum_selectMes.isEmpty() == false) {	
						String strdia_nombre = request.getParameter("strdia_nombre");
						String strdia_especial = request.getParameter("strdia_especial");
						for(int i = 0; i < mes_arr.length; i++) {					
						mes_nombre = mes_arr[i].toString();					
							objPeriodoDet.setMes_nombre(mes_nombre);
							if(strdia_nombre.isEmpty() == false) {
								String dia_nombre = "";
								String[] dia_nombre_arr = strdia_nombre.split(",");
								for(int j = 0; j < dia_nombre_arr.length; j++) {
									dia_nombre = dia_nombre_arr[j].toString();									
									objPeriodoDet.setDia_nombre(dia_nombre);												//PERIODO_DETALLE
									objPeriodoDet.setDia_especial((Integer) (strdia_especial.equals("") ? 0 : strdia_especial));		//PERIODO_DETALLE
									icount_Det = objBusinessPeriodo.mGuardar_Det(objPeriodoDet, ssf);
								}
							}else if (strdia_especial.isEmpty() == false) {
								String dia_especial = "";
								String[] dia_especial_arr = strdia_especial.split(",");
								for(int j = 0; j < dia_especial_arr.length; j++) {
									dia_especial = dia_especial_arr[j].toString();									
									objPeriodoDet.setDia_nombre(strdia_nombre.equals("") ? null : strdia_nombre);			//PERIODO_DETALLE
									objPeriodoDet.setDia_especial(Integer.parseInt(dia_especial));											//PERIODO_DETALLE
									icount_Det = objBusinessPeriodo.mGuardar_Det(objPeriodoDet, ssf);
								}
							}
						}
				}
				
			}
			
			if(icount > 0) {
				resultadoP = "El registro Periodo se realizo satisfactoriamente";	
			}else {
				resultadoP = "*Hubo un error durante el proceso de registro Periodo";	
			}
			if(icount_Det > 0) {
				resultadoPD = "El registro Periodo Detalle se realizo satisfactoriamente";	
			}else {
				resultadoPD = "*Hubo un error durante el proceso de registro Periodo Detalle";	
			}	
			//Generar JSON
			objJson1.append("{\"RegistrarPeriodo\": [");			
				objJson1.append("{" +
						"\"resultadoP\" : \"" + resultadoP + "\" ," +
						"\"resultadoPD\" : \"" + resultadoPD + "\" ," +
						"\"no31\" : \"" + mesNoGuardado + "\" ," +
						"\"febrero\" : \"" + mesFebNoGuardado + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");	
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			objJson1.append("{\"RegistrarPeriodo\": [");			
				objJson1.append("{" +
						"\"resultadoP\" : \"" + resultadoP + "\" ," +
						"\"resultadoPD\" : \"" + resultadoPD + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	
	private void mEliminar(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf)throws IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String resultado = "fail";
		try {
			int icount = 0;
			BeanPeriodo objPeriodo = new BeanPeriodo();
			BusinessPeriodo objBusinessPeriodo = new BusinessPeriodo();
			
			int strIdPeriodo = Integer.parseInt( request.getParameter("strIdPeriodo") );	
			objPeriodo.setIdPeriodo(strIdPeriodo);
			icount = objBusinessPeriodo.deletePeriodo(objPeriodo,ssf);

			if (icount > 0) {
				resultado = "ok";
			} else {
				resultado = "fail";
			}
		} catch (Exception e) {
			resultado = "fail";
		}
		out.print(resultado);		
	}
	
	
	private void mBuscarDatos_PeriodoDet(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf)throws IOException  {
		    StringBuilder strJson1 = new StringBuilder();
		    StringBuilder strJson2 = new StringBuilder();
		    response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			strJson1.append("{\"ListaDatosPeriodoDet\": [");	
			
			try {
				List<BeanPeriodoDet> lstBeanPeriodoDet = null;
				BusinessPeriodo objBusinessPeriodo = new BusinessPeriodo(); 
				BeanPeriodoDet objBeanPeriodoDet = new BeanPeriodoDet();
				
				objBeanPeriodoDet.setId_periodo(Integer.parseInt(request.getParameter("strIdPeriodo")));
				lstBeanPeriodoDet = objBusinessPeriodo.mBuscarDatos_PeriodoDet(objBeanPeriodoDet, ssf);
							
				if (lstBeanPeriodoDet.size() > 0) {
					for (BeanPeriodoDet item : lstBeanPeriodoDet) {
						strJson1.append("{" +
								"\"iIdPeriodoDetalle\" : \"" +  item.getiIdPeriodo_Detalle() + "\" ," +
//								"\"anio\" : \"" +  item.getAnio() + "\" ," +
								"\"mes_nombre\" : \"" + item.getMes_nombre() + "\" ," +
//								"\"mes_nombre\" : \"" + item.getMes_numero() + "\" ," +
								"\"dia_nombre\" : \"" + item.getDia_nombre()+ "\" ," +
								"\"dia_numero\" : \"" + item.getDia_numero() + "\" ," +
								"\"dia_tiempo_nombre\" : \"" + item.getDia_tiempo_nombre() + "\" ," +
								"\"dia_tiempo_numero\" : \"" + item.getDia_tiempo_numero() + "\" ," +
								"\"id_periodo\" : \"" + item.getId_periodo() + "\" ," +
								"\"ordinales\" : \"" + item.getOrdinales() + "\" ," +
								"\"semana\" : \"" + item.getSemana() + "\" ," +
								"\"dia_especial\" : \"" + item.getDia_especial() + "\" " +
								"}," 
								);
					}				
						} else {
						strJson1 = new StringBuilder();
						strJson1.append("{\"ListaDatosPeriodoDet\": [");
						strJson1.append("{" +
						"\"iIdPeriodoDetalle\" : \"" + "" + "\" ," +
						"\"mes_nombre\" : \"" + " No hay información disponible" + "\" " +
						"},"
						);	
						}
				
				strJson2.append(strJson1.substring(0,strJson1.length() -1) + "]}");
			}catch(Exception ex) {
				ex.printStackTrace();
				strJson1 = new StringBuilder();
				strJson1.append("{\"ListaDatosPeriodoDet\": [");
				strJson1.append("{" +
						"\"iIdPeriodoDetalle\" : \"" + "" + "\" ," +
						"\"mes_nombre\" : \"" + " No hay información disponible" + "\" " +
						"},"
						);
				strJson2.append(strJson1.substring(0, strJson1.length() - 1) + "]}");
			}			
			out.print(strJson2);		
		
	}
	
	
	public void mActualizar(HttpServletRequest request, HttpServletResponse response, SqlSessionFactory ssf)throws IOException {
		StringBuilder objJson1 = new StringBuilder();
		StringBuilder strJson2 = new StringBuilder();	
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String resultadoP = "fail";
		String resultadoPD = "fail";
		try {
			int icount = 0;
			int icount_Det = 0;
			int icount_eliminar_det = 0;
			BeanPeriodo objPeriodo = new BeanPeriodo();
			BeanPeriodoDet objPeriodoDet = new BeanPeriodoDet();
			BusinessPeriodo objBusinessPeriodo = new BusinessPeriodo();	
			
			String textoPeriodo = request.getParameter("strtextPeriodo");							//DIA, SEMANA, MES, ANIO
			//PERIODO///////////////////////////////////////////////////////////////////////////////
			String strTitulo = request.getParameter("strTitulo").equals("") ? null : request.getParameter("strTitulo");								//PERIODO
			String strUsuario = request.getParameter("strUsuario");									//PERIODO
			int strEstado = Integer.parseInt(request.getParameter("strEstado"));					//PERIODO
			int stridTipo_Periodo = Integer.parseInt(request.getParameter("stridTipo_Periodo"));	//PERIODO	
			String fechaIni = request.getParameter("strFechaIni").equals("") ? null : request.getParameter("strFechaIni");  						//PERIODO
			int strIntervalo = Integer.parseInt(request.getParameter("strIntervalo"));				//PERIODO	
			//VALIDAR CUAL DE LOS RADIO BUTTON FUE SELECCIONADO FECHA FIN
			String strFechaFin = "";		
			if(Boolean.parseBoolean(request.getParameter("strrbtFechaFinNunca")) == true) {
				strFechaFin = "";																	//PERIODO
			}else if(Boolean.parseBoolean(request.getParameter("strrbtFechaFin")) == true) {
				strFechaFin = request.getParameter("strFechaFin").equals("") ? null : request.getParameter("strFechaFin");							//PERIODO
			}else if(Boolean.parseBoolean(request.getParameter("strrbtFechaFinRepeticiones")) == true) {
				strFechaFin = request.getParameter("strFechaFinRepeticiones").equals("") ? null : request.getParameter("strFechaFinRepeticiones");	//PERIODO
			}		
			//VALIDAR SI LOS DIA HABIL Y DIA FERIADO FUERON SELECIONADOS
			int dia_habil, dia_feriado;
			if(Boolean.parseBoolean(request.getParameter("strDiaHabil")) == true) {
				dia_habil = 1;																		//PERIODO
			}else { dia_habil = 0; }																//PERIODO
			if(Boolean.parseBoolean(request.getParameter("strDiaFeriado")) == true) {
				dia_feriado = 1;																	//PERIODO
			}else { dia_feriado = 0; }																//PERIODO
			
			objPeriodo.setIdPeriodo(Integer.parseInt(request.getParameter("idPeriodo")));
			objPeriodo.setTitulo(strTitulo);														//PERIODO
			objPeriodo.setUsu_update(strUsuario);													//PERIODO
			objPeriodo.setEstado(strEstado);														//PERIODO
			objPeriodo.setId_tipo_periodo(stridTipo_Periodo);										//PERIODO
			objPeriodo.setFecha_Ini(fechaIni);														//PERIODO
			objPeriodo.setIntervalo(strIntervalo);													//PERIODO
			objPeriodo.setFecha_Fin(strFechaFin);													//PERIODO
			objPeriodo.setDia_habil(dia_habil);														//PERIODO
			objPeriodo.setDia_feriado(dia_feriado);													//PERIODO
			//PERIODO_DETALLE///////////////////////////////////////////////////////////////////////
			objPeriodoDet.setId_periodo(Integer.parseInt(request.getParameter("idPeriodo")));						//PERIODO_DETALLE
			String dia_tiempo_nombre = request.getParameter("strdia_tiempo_nombre").equals("") ? null : request.getParameter("strdia_tiempo_nombre");//PERIODO_DETALLE
			int dia_tiempo_numero = Integer.parseInt(request.getParameter("strdia_tiempo_numero")); 				//PERIODO_DETALLE
			int strcboOrdinales = Integer.parseInt(request.getParameter("strcboOrdinales"));						//PERIODO_DETALLE
			int semana = 0;
			if(Boolean.parseBoolean(request.getParameter("strsemana")) == true) {
				semana = 1;																							//PERIODO_DETALLE
			}else {	semana= 0;	}
			objPeriodoDet.setDia_tiempo_nombre(dia_tiempo_nombre);													//PERIODO_DETALLE
			objPeriodoDet.setDia_tiempo_numero(dia_tiempo_numero);													//PERIODO_DETALLE
			objPeriodoDet.setOrdinales(strcboOrdinales);															//PERIODO_DETALLE
			objPeriodoDet.setSemana(semana);
			String mesNoGuardado = "";
			String mesFebNoGuardado = "";
			//PERIODO_DETALLE
			
//			request.getParameter("strCboTorre").equals("0") ? null : request.getParameter("strCboTorre")
			//VALIDAR TIPO DE PERIODO SELECCIONADO
			if(textoPeriodo.equals("DIA")) {
				icount = objBusinessPeriodo.mActualizar(objPeriodo, ssf);												//PERIODO_GUARDAR
			}else if(textoPeriodo.equals("EXCLUSION")) {				
				icount = objBusinessPeriodo.mActualizar(objPeriodo, ssf);	
				
				icount_eliminar_det = objBusinessPeriodo.mEliminarDet(objPeriodoDet, ssf);
				//Guarda el primer registro de detalle periodo
				String pPrincipal = request.getParameter("strPeriodoPrincipal");
				objPeriodoDet.setOrdinales(Integer.parseInt(pPrincipal));
				objPeriodoDet.setDia_especial(1);													//PERIODO_DETALLE
				icount_Det = objBusinessPeriodo.mUpdate_Det(objPeriodoDet,ssf);
				
				String pExcludes = request.getParameter("strPeriodoExcluido");
				//PERIODO_DETALLE EXCLUIDOS
				if(pExcludes.isEmpty() == false) {
					String[] listExclude = pExcludes.split(",");
					for(int i = 0; i < listExclude.length; i++) {					
						int exclude = Integer.parseInt(listExclude[i]);
						objPeriodoDet.setOrdinales(exclude);
						objPeriodoDet.setDia_especial(2);													//PERIODO_DETALLE
						icount_Det = objBusinessPeriodo.mUpdate_Det(objPeriodoDet,ssf);							//PERIODO_DETALLE_GUARDAR 
					}
				}
			}else if(textoPeriodo.equals("SEMANA")) {				
				icount = objBusinessPeriodo.mActualizar(objPeriodo, ssf);												//PERIODO_GUARDAR
				
				icount_eliminar_det = objBusinessPeriodo.mEliminarDet(objPeriodoDet, ssf);
				String stracum_selectDias = request.getParameter("stracum_selectDias");								//PERIODO_DETALLE
				if(stracum_selectDias.isEmpty() == false) {
					String[] dia_arr = stracum_selectDias.split(",");
					String dia_nombre = "";
					for(int i = 0; i < dia_arr.length; i++) {					
						dia_nombre = dia_arr[i].toString();					
						objPeriodoDet.setDia_nombre(dia_nombre);													//PERIODO_DETALLE
						icount_Det = objBusinessPeriodo.mUpdate_Det(objPeriodoDet,ssf);							//PERIODO_DETALLE_GUARDAR 
					}
				}
			}else if(textoPeriodo.equals("MES")) {
				icount = objBusinessPeriodo.mActualizar(objPeriodo, ssf);												//PERIODO_GUARDAR
				
				icount_eliminar_det = objBusinessPeriodo.mEliminarDet(objPeriodoDet, ssf);
				if(Boolean.parseBoolean(request.getParameter("strrbtDiaMes")) == true) {
					String stracumuladorDias = request.getParameter("stracumuladorDias");							//PERIODO_DETALLE
					if(stracumuladorDias.isEmpty() == false) {
						String dia_numero = "";
						String[] dia_arr = stracumuladorDias.split(",");
						for(int i = 0; i < dia_arr.length; i++) {
							dia_numero = dia_arr[i].toString();
							objPeriodoDet.setDia_numero(Integer.parseInt(dia_numero));								//PERIODO_DETALLE
							icount_Det = objBusinessPeriodo.mUpdate_Det(objPeriodoDet,ssf);						//PERIODO_DETALLE_GUARDAR
						}
					}
				}else if(Boolean.parseBoolean(request.getParameter("strrbtDiaPersonalizado")) == true) {
					String strdia_nombre = request.getParameter("strdia_nombre");									//PERIODO_DETALLE
					String strdia_especial = request.getParameter("strdia_especial");								//PERIODO_DETALLE
					if(strdia_nombre.isEmpty() == false) {
						String dia_nombre = "";
						String[] dia_nombre_arr = strdia_nombre.split(",");
						for(int i = 0; i < dia_nombre_arr.length; i++) {
							dia_nombre = dia_nombre_arr[i].toString();							
							objPeriodoDet.setDia_nombre(dia_nombre);												//PERIODO_DETALLE
							objPeriodoDet.setDia_especial((Integer) (strdia_especial.equals("") ? 0 : strdia_especial));		//PERIODO_DETALLE
							icount_Det = objBusinessPeriodo.mUpdate_Det(objPeriodoDet, ssf);						//PERIODO_DETALLE_GUARDAR
						}
					}else if (strdia_especial.isEmpty() == false) {
						String dia_especial = "";
						String[] dia_especial_arr = strdia_especial.split(",");
						for(int i = 0; i < dia_especial_arr.length; i++) {
							dia_especial = dia_especial_arr[i].toString();
							objPeriodoDet.setDia_nombre(strdia_nombre.equals("") ? null : strdia_nombre);			//PERIODO_DETALLE
							objPeriodoDet.setDia_especial(Integer.parseInt(dia_especial));							//PERIODO_DETALLE
							icount_Det = objBusinessPeriodo.mUpdate_Det(objPeriodoDet, ssf);						//PERIODO_DETALLE_GUARDAR
						}
					}
				}
			}else if(textoPeriodo.equals("AÑO")) {
				icount = objBusinessPeriodo.mActualizar(objPeriodo, ssf);
				
				icount_eliminar_det = objBusinessPeriodo.mEliminarDet(objPeriodoDet, ssf);
				String stracum_selectMes = request.getParameter("stracum_selectMes");
				String[] mes_arr = stracum_selectMes.split(",");
				String mes_nombre = "";
				String stracumuladorDias = request.getParameter("stracumuladorDias");
				int dia_numero = 0;
				String[] dia_arr = stracumuladorDias.split(",");
				if(Boolean.parseBoolean(request.getParameter("strrbtDiaMes")) == false && Boolean.parseBoolean(request.getParameter("strrbtDiaPersonalizado")) == false && stracum_selectMes.isEmpty() == false ) {
					if (stracum_selectMes.isEmpty() == false) {
						for(int i = 0; i < mes_arr.length; i++) {					
							mes_nombre = mes_arr[i].toString();					
							objPeriodoDet.setMes_nombre(mes_nombre);					
							icount_Det = objBusinessPeriodo.mUpdate_Det(objPeriodoDet,ssf);
						}
					}
				}
				
				if(Boolean.parseBoolean(request.getParameter("strrbtDiaMes")) == true && stracum_selectMes.isEmpty() == false) {
  					for(int i = 0; i < mes_arr.length; i++) {	
						mes_nombre = mes_arr[i].toString();	
						objPeriodoDet.setMes_nombre(mes_nombre);						
						for(int j = 0; j < dia_arr.length; j++) {							
							dia_numero = Integer.parseInt(dia_arr[j].toString());
							if(mes_nombre.equals("Abril") || mes_nombre.equals("Junio") || mes_nombre.equals("Setiembre") || mes_nombre.equals("Noviembre") ) {
								if(dia_numero <= 30) {
									objPeriodoDet.setDia_numero(dia_numero);
									icount_Det = objBusinessPeriodo.mUpdate_Det(objPeriodoDet,ssf);
								}else {
									mesNoGuardado += mes_nombre + ",";
									}
							}
							else if(mes_nombre.equals("Febrero")) {
								 if(dia_numero <= 29) {
									objPeriodoDet.setDia_numero(dia_numero);
									icount_Det = objBusinessPeriodo.mUpdate_Det(objPeriodoDet,ssf);
								 }else  if(dia_numero >= 29){
										mesFebNoGuardado = mes_nombre;
									}
							}else {//MESES CON TODOS LOS DIAS
								objPeriodoDet.setDia_numero(dia_numero);
								icount_Det = objBusinessPeriodo.mUpdate_Det(objPeriodoDet,ssf);
							}
						}
					}
				}
				
				
				if(Boolean.parseBoolean(request.getParameter("strrbtDiaPersonalizado")) == true && stracum_selectMes.isEmpty() == false) {	
						String strdia_nombre = request.getParameter("strdia_nombre");
						String strdia_especial = request.getParameter("strdia_especial");
						for(int i = 0; i < mes_arr.length; i++) {					
						mes_nombre = mes_arr[i].toString();					
							objPeriodoDet.setMes_nombre(mes_nombre);
							if(strdia_nombre.isEmpty() == false) {
								String dia_nombre = "";
								String[] dia_nombre_arr = strdia_nombre.split(",");
								for(int j = 0; j < dia_nombre_arr.length; j++) {
									dia_nombre = dia_nombre_arr[j].toString();									
									objPeriodoDet.setDia_nombre(dia_nombre);												//PERIODO_DETALLE
									objPeriodoDet.setDia_especial((Integer) (strdia_especial.equals("") ? 0 : strdia_especial));		//PERIODO_DETALLE
									icount_Det = objBusinessPeriodo.mUpdate_Det(objPeriodoDet, ssf);
								}
							}else if (strdia_especial.isEmpty() == false) {
								String dia_especial = "";
								String[] dia_especial_arr = strdia_especial.split(",");
								for(int j = 0; j < dia_especial_arr.length; j++) {
									dia_especial = dia_especial_arr[j].toString();									
									objPeriodoDet.setDia_nombre(strdia_nombre.equals("") ? null : strdia_nombre);			//PERIODO_DETALLE
									objPeriodoDet.setDia_especial(Integer.parseInt(dia_especial));											//PERIODO_DETALLE
									icount_Det = objBusinessPeriodo.mUpdate_Det(objPeriodoDet, ssf);
								}
							}
						}
				}
				
			}
			
			if(icount > 0) {
				resultadoP = "El registro Periodo se realizo satisfactoriamente";	
			}else {
				resultadoP = "*Hubo un error durante el proceso de registro Periodo";	
			}
			if(icount_Det > 0) {
				resultadoPD = "El registro Periodo Detalle se realizo satisfactoriamente";	
			}else {
				resultadoPD = "*Hubo un error durante el proceso de registro Periodo Detalle";	
			}	
			//Generar JSON
			objJson1.append("{\"RegistrarPeriodo\": [");			
				objJson1.append("{" +
						"\"resultadoP\" : \"" + resultadoP + "\" ," +
						"\"resultadoPD\" : \"" + resultadoPD + "\" ," +
						"\"no31\" : \"" + mesNoGuardado + "\" ," +
						"\"febrero\" : \"" + mesFebNoGuardado + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");	
		}catch(Exception e) {
			e.printStackTrace();
			objJson1 = new StringBuilder();
			objJson1.append("{\"RegistrarPeriodo\": [");			
				objJson1.append("{" +
						"\"resultadoP\" : \"" + resultadoP + "\" ," +
						"\"resultadoPD\" : \"" + resultadoPD + "\" " +
						"},"
						);
			strJson2.append(objJson1.substring(0,objJson1.length() -1) + "]}");
		}
		out.print(strJson2);
	}
	
	
}

