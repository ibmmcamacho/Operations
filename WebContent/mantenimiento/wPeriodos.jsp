<%@page import="com.pe.ibm.bean.BeanSession"%>
<%
	BeanSession objBeanSessionCHeader = new BeanSession();
	objBeanSessionCHeader = (BeanSession) session.getAttribute("usuarioLogin");		
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<input type="hidden" id="idUsuario" value="<%=objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin()%>" />
<input type="hidden" id="idTeam" value="<%=objBeanSessionCHeader.getObjBeanPersonal().getiTeam()%>" /> 
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/custom/css/styleDispatch.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/clockpicker/css/bootstrap-clockpicker.min.css">
</head>

<body>
	<aside class="right-side sizeHeight"> 
		<section class="content-header">
			<h1>
			Mantenimiento <small>Periodo</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-th-large"></i> Mantenimiento</a></li>
				<li class="active">Periodo</li>
			</ol>
		</section> 
				
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
					<div class="form-inline">
						<div class="form-group">
							<a class="btn btn-default btn-sm" data-toggle="modal" onclick="openModalNuevoPerfilDet('save')">
							<i class="fa fa-file-text-o" aria-hidden="true"></i> Nuevo
							</a>
						</div>
						
						<div class="form-group">
							<a class="btn btn-primary btn-sm" data-toggle="modal" onclick="listReportPeriodo()">
							<i class="fa fa-check" aria-hidden="true"></i> Consultar
							</a>
						</div>
						
					</div>
				</div>
			</div>
			<br/>
			<div class="row">
				<div class="col-lg-12 connectedSortable">
					<div class="box box-primary">
						<div class="box-header with-border">
 							<h3 class="box-title"> <i class="fa fa-user" aria-hidden="true"></i> REPORTE PERIODOS DETALLES</h3>
						</div>
						<div class="box-body">
							<div id="tbcontainerPeriodos" class="table-responsive">
								Aquí podrás obtener toda la información que necesitas sobre los Periodos y sus Detalles. 
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
 	</aside>
</body>

<!-- Modal Insertar -->
<div class="modal fade" id="mdNuevoPeriodo" tabindex="-1" role="dialog" >
  <div class="modal-dialog" role="document" style="width:40%">
    <div class="modal-content">      
	    <div class="modal-header">
	      <h4 class="modal-title" align="center" id="h4">Registrar Periodo </h4>
	    </div>      
   		<div class="modal-body">
     		<div class="row" >
     			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"  id="divRbtPrincipal">     				
			     		<form class="form-inline">       
			      		<!-- COMBO ENCABEZADO -->
			      		<div align="center" id="divcombo">   
				       		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 form-group">
									<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="text-align: right" >
									<label >Seleccionar Tipo Periodo :</label>
									</div>
									<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="text-align: center;width: 200px">
									<select id="cboPeriodo" class="select2" onchange="mostrar()">
										<option > Seleccionar </option>
									</select>	
									</div>								
							</div>
			      		 </div>   	        		
			      		 
			     		</form>     		
     					 
     					 <!-- FIN COMBO ENCABEZADO -->   		
     			</div>
     			
				<!-- INICIO PARA CREAR NUEVO -->
				<div class="row"  >
					<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
						<div class="form-group" align="center">	
									
								<div id="divTipo_Periodo" class="col-sm-12 col-sm-12 col-md-12 col-lg-12" style = "display: none;">
								<form data-toggle="validator" role="form">	
									<label id="labeltituloactualizar"></label>
									<input type="hidden" id="labelIDtituloactualizar" value="" /> 
									<br>														
									<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12 form-inline">
					        			<label>Titulo :</label>
					        			<input id="txtTitulo" type="text" class="form-control"  onkeyup="validar();llenartxtdescripcion();descripcionTermina()"  style="width: 70%" required >
				        			</div>
				        			<br>
				        			<div id="divFechaInicio" class="col-sm-6 col-sm-6 col-md-6 col-lg-6 form-inline" style="padding-top: 25px;padding-left: 10%">
					        			<label>Fecha Inicio :</label>
					        			<input id="txtFechaIni" type="date" class="form-control"  onchange="validar();llenartxtdescripcion();descripcionTermina()" style="width:150px" required>
				        			</div>
									<br>
									<div id="divRepetirCada" class="col-sm-6 col-sm-6 col-md-6 col-lg-6 form-inline" style="padding-top: 20px;padding-right: 100px">					        			
					        			<label data-toggle="tooltip" data-placement="top" 
					        			title="Ejemplo: Repetir cada 2 meses -> Marzo-Aceptado, salta 2 meses y el siguiente aceptado será Junio.">
					        				<u>Repetir Cada :</u>
					        			</label>
					        			<input id="txtIntervalo" type="number"  class="form-control" onKeyPress="return validarintervalo(event)"  onchange="validar();llenartxtdescripcion();descripcionTermina()" style="width:70px"  min="0" max="100" required>
					        			<a id="label"></a>
				        			</div>				        			
				        			
<!-- 								BEGIN OF BG001								 	 -->
									<div id="divExclude" class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
										<br>
										<div id="divPeriodoPrincipal" class="form-group" class="col-sm-12 col-sm-12 col-md-6 col-lg-6">
											<label for="cboPeriodoPrincipal">
												Periodo Principal 
												<span data-toggle="tooltip" data-placement="top" 
	 					        					title="Periodo sobre el cual se aplicarán excepciones." class="badge pull-right">?</span>:
											</label>
									       	<select id="cboPeriodoPrincipal" style="width: 70%" class="form-control" onchange = "validar();llenartxtdescripcion()">
									       		<option value="" disabled="true" selected="true"> --SELECCIONE-- </option>
									       	</select>
										</div>
										<div id="divPeriodoExclude" class="form-group" class="col-sm-12 col-sm-12 col-md-6 col-lg-6">
					        				
					        				<fieldset class="scheduler-border" style="padding-top: 0;width: 70%">
				  								<legend class="scheduler-border">
				  									<h4 style="margin-top: 0;">Excluyendo a: 
				  									<span data-toggle="tooltip" data-placement="top" title="Periodos que seran excluidos." class="badge pull-right">?</span>
				  									</h4>
				  								</legend>											
													<select id ="cboPeriodoExclude"class="form-control" onchange = "validar();llenartxtdescripcion()" multiple="multiple">
													 </select>
											</fieldset>
										</div>
										<br>
									</div>
<!-- 								END OF BG001								 	 -->
					        		<div id="divSeleccionarSemana" class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >						        		
						        		<br>
						        		<fieldset class="scheduler-border" style="padding-top: 0;width: 60%">
		  									<legend class="scheduler-border"><h4 style="margin-top: 0;">Seleccionar Dia(s) de la Semana </h4></legend>											
												<select id ="selectDias"class="form-control" onchange = "validar();llenartxtdescripcion();descripcionTermina()" multiple="multiple">
													  <option value="Lunes">Lunes</option>
													  <option value="Martes">Martes</option>
													  <option value="Miercoles">Miercoles</option>
													  <option value="Jueves">Jueves</option>
													  <option value="Viernes">Viernes</option>
													  <option value="Sabado">Sabado</option>
													  <option value="Domingo">Domingo</option>														  
												 </select>
										</fieldset>											
						        	</div>
					        		
					        		<div id="divSeleccionarMes" class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >	
					        			<br>
					        			<fieldset class="scheduler-border" style="padding-top: 0;width: 60%">
			  								<legend class="scheduler-border"><h4 style="margin-top: 0;">Seleccionar Mes(es)</h4></legend>											
												<select id ="selectMes"class="form-control" onchange = "validar();llenartxtdescripcion()" multiple="multiple">
													  <option>Enero</option>
													  <option>Febrero</option>
													  <option>Marzo</option>
													  <option>Abril</option>
													  <option>Mayo</option>
													  <option>Junio</option>
													  <option>Julio</option>
													  <option>Agosto</option>
													  <option>Septiembre</option>
													  <option>Octubre</option>
													  <option>Noviembre</option>
													  <option>Diciembre</option>
												 </select>
										</fieldset>	
									</div>
									<div id="divSeleccionarDiadelMes" class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >	
			        				 <br>
			        				 	<fieldset class="scheduler-border" style="padding-top: 0;width: 100%">
					  						<legend class="scheduler-border"><h4 style="margin-top: 0;">Seleccionar Dia(s) del Mes</h4></legend>
					        				 	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
										        	<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">		    
												    	<div>	        			
													      	<input id="rbtnelegirmes"type="radio" name="elegir" value="5" onchange="mostrarSeleccionDia('divSeleccionarDia');validar();limpiarRBT()">
													        <label>Elegir Dia del Mes:</label>
												        </div>			        			
											        </div>
											        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
												     	<div>	        			
													      	<input id="rbtnelegirpersonalizado"type="radio" name="elegir"  onchange="mostrarSeleccionDia('divSeleccionarDiaPersonalizado');validar();limpiarRBT()">
													        <label>Elegir Dia Personalizado</label>
												        </div>
											        </div>
											    </div>			        				 
						        				<div class="form-inline" id="divSeleccionarDia" style="display:none;" >	
						        					<fieldset class="scheduler-border" >
														<div class="row">
															<div class="span12">
																<table class="table-condensed table-bordered table-striped">
																      <tbody>
																           <tr>
																               <td><button id="btnDia_1" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">1</button></td>
																               <td><button id="btnDia_2" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">2</button></td>
																               <td><button id="btnDia_3" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">3</button></td>
																               <td><button id="btnDia_4" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">4</button></td>
																               <td><button id="btnDia_5" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">5</button></td>
																               <td><button id="btnDia_6" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">6</button></td>
																               <td><button id="btnDia_7" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">7</button></td>
																           </tr>
																           <tr>
																               <td><button id="btnDia_8" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">8</button></td>
																               <td><button id="btnDia_9" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">9</button></td>
																               <td><button id="btnDia_10" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">10</button></td>
																               <td><button id="btnDia_11" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">11</button></td>
																               <td><button id="btnDia_12" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">12</button></td>
																               <td><button id="btnDia_13" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">13</button></td>
																               <td><button id="btnDia_14" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">14</button></td>
																           </tr>
																           <tr>
																               <td><button id="btnDia_15" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">15</button></td>
																               <td><button id="btnDia_16" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">16</button></td>
																               <td><button id="btnDia_17" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">17</button></td>
																               <td><button id="btnDia_18" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">18</button></td>
																               <td><button id="btnDia_19" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">19</button></td>
																               <td><button id="btnDia_20" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">20</button></td>
																               <td><button id="btnDia_21" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">21</button></td>
																           </tr>
																           <tr>
																               <td><button id="btnDia_22" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">22</button></td>
																               <td><button id="btnDia_23" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">23</button></td>
																               <td><button id="btnDia_24" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">24</button></td>
																               <td><button id="btnDia_25" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">25</button></td>
																               <td><button id="btnDia_26" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">26</button></td>
																               <td><button id="btnDia_27" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">27</button></td>
																               <td><button id="btnDia_28" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">28</button></td>
																           </tr>
																           <tr>
																               <td><button id="btnDia_29" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">29</button></td>
																               <td><button id="btnDia_30" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">30</button></td>
																               <td><button id="btnDia_31" type="button" class="btn btn-default" onclick="mBtnSeleccionarDia(this.id);validar();llenartxtdescripcion();descripcionTermina();limpiarRBT()" value="false">31</button></td>
																           </tr>
																      </tbody>
																</table>
															</div>
														</div>
													</fieldset>
												</div>
					        			
					        					<div id="divSeleccionarDiaPersonalizado"  style=" display: none">
						        					<fieldset class="scheduler-border" >
														<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">		    
						        							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >	
																<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 form-inline">
																	<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6"  style="padding-top: 20px">													        		
													        			<input id="rbtDiaAntes"type="radio" name="antesydespues" onclick="mostrarantesydespues()">
													        			<label>Dia Antes</label>
													        			<input id="txtDiaAntes" type="number" min="0" value ="1"  style="width: 60px" onclick="mostrarantesydespues()" onKeyPress="return validarintervalo(event)" >
													        		</div>
													        		<div align="center" class="col-xs-6 col-sm-6 col-md-6 col-lg-6 form-inline">	
													        			<label data-toggle="tooltip" data-placement="top" 
													        			title="Sin el .">
													        				<u>#Ordinales</u>
													        			</label>
													        			<select id="cboOrdinales" class="select2" onchange="limpiaracum()">
																			<option > Seleccionar </option>
																		</select>	
													        		</div>												        		
						        								</div>
										        				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 form-inline" style="padding-top: 0%">
										        					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" >														        			
													        			<input id="rbtDiaDespues"type="radio" name="antesydespues" onclick="mostrarantesydespues()">
													        			<label>Dia Despues</label>
													        			<input id="txtDiaDespues" type="number" min="0" value="1"style="width: 60px" onclick="mostrarantesydespues()" onKeyPress="return validarintervalo(event)" >
													        		</div>
													        		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 form-inline">	
													        		</div>
										        				</div>
															</div>	
														</div>												
														<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"   style="padding-top: 15px">
															<fieldset class="scheduler-border" >	
																<legend class="scheduler-border"><h4 style="margin-top: 0;">
																	<input id="chkSemanal" type="checkbox" onclick="mostrarCheckSem()" value="Sem" onchange="valueSem();llenartxtdescripcion();descripcionTermina()" >
												        			<label>Semana</label></h4></legend>
																<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 form-inline"  >
																</div>
																<div id="divDiasTexto" class="col-xs-5 col-sm-5 col-md-5 col-lg-5 form-inline"  >
																	<fieldset class="scheduler-border" >
																		<legend class="scheduler-border"><h4 style="margin-top: 0;">Dia :</h4></legend>
																			<div class="form-inline">    															        			
							        											<div> <input id="chkLunes" value ="LUNES" class="mostrarChkDiaTexto" onclick="mostrarDivDiaTexto();validar();seleccionardiap(this.id)" onchange="llenartxtdescripcion();descripcionTermina()" type="checkbox"> <label>LUNES</label> </div>
							        											<div> <input id="chkMartes" value ="MARTES" class="mostrarChkDiaTexto" onclick="mostrarDivDiaTexto();validar();seleccionardiap(this.id)" onchange="llenartxtdescripcion();descripcionTermina()" type="checkbox"> <label>MARTES</label> </div>
															        			<div> <input id="chkMiercoles" value="MIERCOLES" class="mostrarChkDiaTexto" onclick="mostrarDivDiaTexto();validar();seleccionardiap(this.id)" onchange="llenartxtdescripcion();descripcionTermina()" type="checkbox"> <label>MIERCOLES</label> </div>
															        			<div> <input id="chkJueves" value="JUEVES" class="mostrarChkDiaTexto" onclick="mostrarDivDiaTexto();validar();seleccionardiap(this.id)" onchange="llenartxtdescripcion();descripcionTermina()" type="checkbox"> <label>JUEVES</label> </div>
															        			<div> <input id="chkViernes" value="VIERNES" class="mostrarChkDiaTexto" onclick="mostrarDivDiaTexto();validar();seleccionardiap(this.id)" onchange="llenartxtdescripcion();descripcionTermina()" type="checkbox"> <label>VIERNES</label> </div>
							        											<div> <input id="chkSabado" value="SABADO" class="mostrarChkDiaTexto" onclick="mostrarDivDiaTexto();validar();seleccionardiap(this.id)" onchange="llenartxtdescripcion();descripcionTermina()" type="checkbox">	<label>SABADO</label> </div>
							        											<div> <input id="chkDomingo" value ="DOMINGO" class="mostrarChkDiaTexto" onclick="mostrarDivDiaTexto();validar();seleccionardiap(this.id)" onchange="llenartxtdescripcion();descripcionTermina()" type="checkbox"> <label>DOMINGO</label> </div>
							        											<div id="hideDia"> <input id="chkDia" value ="DIA" class="mostrarChkDiaTexto" onclick="mostrarDivDiaTexto();validar();seleccionardiap(this.id)" onchange="llenartxtdescripcion();descripcionTermina()" type="checkbox"> <label>DIA</label> </div>
																			</div>
							        								</fieldset>
																</div>			
																<div id="divDiasNum" class="col-xs-5 col-sm-5 col-md-5 col-lg-5 form-inline"  >
																	<fieldset class="scheduler-border">
																		<legend class="scheduler-border"><h4 style="margin-top: 0;">#Dia :</h4></legend>
																			<div class="form-inline">		    
							        											<div> <input id="chk1erDia" value="1" class="mostrarChkDiaNumero" onclick="mostrarDivDiaNumero();validar()" onchange="llenartxtdescripcion();descripcionTermina()"type="checkbox"> <label>1er dia</label> </div>
																				<div> <input id="chk2erDia" value="2" class="mostrarChkDiaNumero" onclick="mostrarDivDiaNumero();validar()" onchange="llenartxtdescripcion();descripcionTermina()"type="checkbox"> <label>2do dia</label> </div>
																				<div> <input id="chk3erDia" value="3" class="mostrarChkDiaNumero" onclick="mostrarDivDiaNumero();validar()" onchange="llenartxtdescripcion();descripcionTermina()"type="checkbox"> <label>3er dia</label> </div>
																				<div> <input id="chk4erDia" value="4" class="mostrarChkDiaNumero" onclick="mostrarDivDiaNumero();validar()" onchange="llenartxtdescripcion();descripcionTermina()"type="checkbox"> <label>4to dia</label> </div>
																				<div> <input id="chk5erDia" value="5" class="mostrarChkDiaNumero" onclick="mostrarDivDiaNumero();validar()" onchange="llenartxtdescripcion();descripcionTermina()"type="checkbox"> <label>5to dia</label> </div>
							        											<div> <input id="chk6erDia" value="6" class="mostrarChkDiaNumero" onclick="mostrarDivDiaNumero();validar()" onchange="llenartxtdescripcion();descripcionTermina()"type="checkbox"> <label>6to dia</label> </div>
																				<div> <input id="chk7erDia" value="7" class="mostrarChkDiaNumero" onclick="mostrarDivDiaNumero();validar()" onchange="llenartxtdescripcion();descripcionTermina()"type="checkbox"> <label>7to dia </label> </div>
																			</div>
							        								</fieldset>
																</div>
																<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 form-inline"  >
																</div>
															</fieldset>
														</div>
													</fieldset>
												</div>										
										</fieldset> 
									</div> 
									
				        			<form>	
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="divTermina_Anual"> 
								       <br>
								        	<fieldset class="scheduler-border" style="padding-top: 0;width: 50%">
					  							<legend class="scheduler-border"><h4 style="margin-top: 0;">Termina</h4></legend>													
													<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12 form-inline" style="padding-right: 70%">	        			
											        	 <input id="rbtFechaFinNunca" onclick="descripcionTermina();validar()" type="radio" name="termina" value="" onchange="mostrarTermina('nunca')" >
											        	 <label>Nunca</label>
										        	</div>
										        	<br>
										        	<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12 form-inline" >	        			
											        	 <input id="rbtFechaFin" onclick="descripcionTermina();validar()" type="radio" name="termina" value="" onchange="mostrarTermina('fecha_Fin')">
											        	 <label>El dia : </label>
											        	 <input id="txtFechaFin"  onchange="validar();descripcionTermina()" type="date" class="form-control" >
											        	 <small>(Fecha Fin )</small>
										        	</div>
										        	<br>
										        	<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12 form-inline"  style="padding-right: 26px;padding-top: 10px">	        			
										        	     <input id="rbtFechaFinRepeticiones"  onclick="descripcionTermina();validar()" type="radio"name="termina" value="" onchange="mostrarTermina('nRepeticiones')">
											        	 <label>Despues de: </label>
											        	 <input id="txtFechaFinRepeticiones" onKeyPress="return validarintervalo(event)" onchange="validar();descripcionTermina()"type="number" class="form-control" style="width:70px" min="1"  >
											        	 <label>repeticion(es) </label>
										        	</div>
					       					</fieldset>  
				       					</div>   							
			       					</form>	
			       					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="divFiltrarDia_Anual">
				        								        		
				        				<fieldset class="scheduler-border" style="padding-top: 0;width: 50%">
				  							<legend class="scheduler-border"><h4 style="margin-top: 0;">Filtrar por</h4></legend>	
							        			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">		    
									        		<div>	        			
										       			<input id="chkDiaHabil" type="checkbox" onclick="descripcionTermina()">
										       			<label>Dia Habil</label>
									        		</div>			        			
								        		</div>
								        		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
									        		<div>	        			
										       			<input id="chkDiaFeriado" type="checkbox" onclick="descripcionTermina()">
										       			<label>Dia Feriado</label>
									        		</div>
								        		</div>	
								        </fieldset>					        									
									</div>
			       					       				
				       				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 form-inline" id="divDescripcion"  >
					        			<div>
				        					<label >Descripcion :</label>
					        			</div>
					        			<div>
			        						<textarea  id="txtDescripcion"  class="form-control"disabled style="height: 150px;text-align: center; width:400px" > </textarea>
					        			</div>					        			
			        				</div>
								    
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 form-inline">
					        			<div class="form-group">
					        			<br>
								    	<br>								    
					        				<a id="btnGuardar" class="btn btn-primary btn-sm" onmousedown="validar()" onclick="mGuardar()" >
		        								<i class="fa fa-save fa-lg" aria-hidden="false"></i> Guardar
		        							</a>
		        							<a id="btnActualizar" class="btn btn-primary btn-sm" onmousedown="validar()" onclick="mActualizar()" >
		        								<i class="fa fa-refresh fa-lg" aria-hidden="true"></i> Actualizar
		        							</a>				        							        				
							        		<a id="btnSalir" role="button" class="btn btn-default btn-sm" data-dismiss="modal">
							        			<i class="fa fa-reply" aria-hidden="true"></i> Salir
							        		</a>
					        			</div>
					        		</div>
								</form>
								</div>	
							<!-- FIN ANUAL -->
<!-- 							BEGIN OF EXCLUSION -->
<!-- 							END OF EXCLUSION -->
		
						</div>    			      	 	 
					</div>
				</div>	    
		   		<br>
				<br>			
 			</div>  
		</div>			
			
    </div>
  </div>	   
</div>
<!-- FIN MODAL INSERTAR  -->



<!-- Modal Pregunta -->
<div class="modal fade" id="mdPreguntaPeriodo" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Mantenimiento de Periodo</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        		<div class="form-group">
        			<label>¿Desea eliminar este registro?</label>
        			<input type="hidden" id="hdIdPeriodo">	
        		</div>
        		<div class="form-inline">
        			<div class="form-group">
        				<a onclick="mEliminar()" class="btn btn-danger btn-sm">
		        			<i class="fa fa-floppy-o" aria-hidden="true"></i> Eliminar
		        		</a>
		        		<a role="button" class="btn btn-default btn-sm" data-dismiss="modal">
		        			<i class="fa fa-reply" aria-hidden="true"></i> Volver
		        		</a>
        			</div>
        		</div>
        	</div>
        </div>
      </div>
    </div>
  </div>
  </div>

<script type="text/javascript">

	listComboOrdinales();
	listPeriodos();

	//Click boton NUEVO 
	function mNuevoPeriodo(){		
		$('#mdNuevoPeriodo').modal('show');//ABRE MODAL NUEVO_PEDIODO		
		document.getElementById("divRbtPrincipal").style.display = 'block'; //MUESTRA EL DIV PRINCIPAL PARA PODER SELECIONAR EL RADIO BUTTON		
	}
	
// 	BEGIN OF BG001
	$("#cboPeriodoExclude").select2();
	 var acum_periodoExclude = "";
	 var acum_excludeName = "";
	 $('#cboPeriodoExclude').change( function () {		
		var selectExclude = document.getElementById('cboPeriodoExclude').value; 
				 
		selectExclude = $(this).val();		
		selectExcludeName = $('#cboPeriodoExclude option:selected').map(function () {
	        return $(this).text();
	    }).get().join(',');
		acum_periodoExclude = "" + selectExclude;
		acum_excludeName = "" + selectExcludeName;
	 });
	
	function listPeriodos() {
		$("#cboPeriodoPrincipal option").remove();
		$("#cboPeriodoPrincipal").append(
    	  			$('<option>',{
    	  				value: "",
    	  				text: " --SELECCIONE-- "
    	  			})		
    	  		);
  		$("#cboPeriodoExclude option").remove();
		$("#cboPeriodoExclude").append(
	  			$('<option>',{
	  				value: "",
	  				text: " --SELECCIONE-- "
	  			})		
	  		);
		
		var src = "ServletPeriodo";
		var exclude = "EXCLUSION";		//####Tipo de Periodo a excluir de los combos
    	$.post(src, {strAccion:"6"},
   				function(pdata) {
   				  var obj = JSON.parse(pdata);
   				  //BG001 - Comprobar el listado de Periodos
   				  for(i = 0; i < obj.ListaReportePeriodo.length; i++){ 
   					if (obj.ListaReportePeriodo[i].tipo_periodo != exclude) {
   						$('#cboPeriodoPrincipal').append(
   	       	    	  			$('<option>',{
   	       	    	  				value: obj.ListaReportePeriodo[i].idPeriodo, 
   	       	    	  				text: obj.ListaReportePeriodo[i].titulo
   	       	    	  			})		
   	       	    	  		);
   						$('#cboPeriodoExclude').append(
   	       	    	  			$('<option>',{
   	       	    	  				value: obj.ListaReportePeriodo[i].idPeriodo, 
   	       	    	  				text: obj.ListaReportePeriodo[i].titulo 
   	       	    	  			})		
   	       	    	  		);
					}
   				  }	
    	});
	}
	function clearAll(){
		document.getElementById("divTipo_Periodo").style.display = "none";
		document.getElementById("divSeleccionarSemana").style.display = 'none';
		document.getElementById("divSeleccionarMes").style.display = 'none';
		document.getElementById("divSeleccionarDiadelMes").style.display = 'none';
		document.getElementById("divTermina_Anual").style.display = 'block';
		$("#label").text('Excluye(s)');
		  
		acum_selectDias = "";
		acum_selectMes = "";
		acum_periodoExclude = "";
		acum_excludeName = "";
		acumuladordiasp = "";
		acumuladordiasp2 = "";
		acumuladorDias = "";
		acumOrdinales = "";
		valuesem = "";
		  
		$('#hdIdPeriodo').text('');
		$('#txtTitulo').val('');
		$('#txtFechaIni').val('');
		$('#txtIntervalo').val(0);
		$('#selectDias').val('0').trigger('change.select2');
		$('#cboPeriodoExclude').val('0').trigger('change.select2');
		$('#cboPeriodoPrincipal').val('').trigger('change');
		$('#selectMes').val('0').trigger('change.select2');
			
		document.getElementById("rbtFechaFinNunca").checked = true;  
		document.getElementById("rbtFechaFin").checked = false;  
		document.getElementById("rbtFechaFinRepeticiones").checked = false; 
		document.getElementById("txtFechaFin").disabled = true;
		document.getElementById("txtFechaFin").disabled = false;
		document.getElementById("txtFechaFin").value = "";
		document.getElementById("txtFechaFin").disabled = true;
		document.getElementById("txtFechaFinRepeticiones").value = "";
		document.getElementById("txtFechaFinRepeticiones").disabled = true;				
		document.getElementById("chkDiaHabil").checked = false;  
		document.getElementById("chkDiaFeriado").checked = false;  
		
		$('#txtDescripcion').addClass('hidden');
		$('#txtDescripcion').removeClass('hidden');
		$('#txtDescripcion').val('');
		
		document.getElementById("divExclude").style.display = 'none';
		document.getElementById("divFiltrarDia_Anual").style.display = 'block';
			
		document.getElementById("divRepetirCada").style.display = 'block';
		document.getElementById("divFechaInicio").style.display = 'block';
		
		document.getElementById("divFechaInicio").className = "";
		document.getElementById("divFechaInicio").className = "col-sm-6 col-sm-6 col-md-6 col-lg-6 form-inline";
	}
// 	END OF BG001
	
	/* AL HACER CLICK EN EL COMBO */
	function mostrar(){			
		var combo = document.getElementById("cboPeriodo");
		var selected = combo.options[combo.selectedIndex].text; 
		var label = document.getElementById("label").text;
		
		  if (selected == "Seleccionar") {
			  document.getElementById("divTipo_Periodo").style.display = "none";	
			  validar();
		  }
	 	//BEGIN OF BG001
			if (selected == "EXCLUSION") {
		  		clearAll(); //Limpia todos los otros
			  	document.getElementById("divTipo_Periodo").style.display = "block";
			  	document.getElementById("divExclude").style.display = 'block';
			  	document.getElementById("divRepetirCada").style.display = 'none';
			  	document.getElementById("divFiltrarDia_Anual").style.display = 'none';

			  	//Caso especial
				document.getElementById("divFechaInicio").className = "";
				document.getElementById("divFechaInicio").className = "col-sm-12 col-sm-12 col-md-12 col-lg-12 form-inline";
				
				//Variables Utilizadas
				
			}
		  //END OF BG001
		  if (selected == "DIA") {
			  clearAll(); //BG Change
			  document.getElementById("divTipo_Periodo").style.display = "block";
			  document.getElementById("divSeleccionarSemana").style.display = 'none';
			  document.getElementById("divSeleccionarMes").style.display = 'none';
			  document.getElementById("divSeleccionarDiadelMes").style.display = 'none';
			  document.getElementById("divTermina_Anual").style.display = 'block';
			  $("#label").text('Dia(s)');
			  
			    acum_selectDias = "";
				acum_selectMes = "";
				acumuladordiasp = "";
				acumuladordiasp2 = "";
				acumuladorDias = "";
				acumOrdinales = "";
				valuesem = "";
			  
			  $('#hdIdPeriodo').text('');
				$('#txtTitulo').val('');
				$('#txtFechaIni').val('');
				$('#txtIntervalo').val(0);
				$('#selectDias').val('0').trigger('change.select2');
				$('#selectMes').val('0').trigger('change.select2');
				
				document.getElementById("rbtFechaFinNunca").checked = true;  
				document.getElementById("rbtFechaFin").checked = false;  
				document.getElementById("rbtFechaFinRepeticiones").checked = false; 
				document.getElementById("txtFechaFin").disabled = true;
				document.getElementById("txtFechaFin").disabled = false;
				document.getElementById("txtFechaFin").value = "";
				document.getElementById("txtFechaFin").disabled = true;
				document.getElementById("txtFechaFinRepeticiones").value = "";
				document.getElementById("txtFechaFinRepeticiones").disabled = true;				
				document.getElementById("chkDiaHabil").checked = false;  
				document.getElementById("chkDiaFeriado").checked = false;  
				
				$('#txtDescripcion').addClass('hidden');
				$('#txtDescripcion').removeClass('hidden');
				$('#txtDescripcion').val('');	
				
				validar();
				
		  }
		  if (selected == "SEMANA") {
			  clearAll(); //BG Change
			  document.getElementById("divTipo_Periodo").style.display = "block";
			  document.getElementById("divSeleccionarSemana").style.display = 'block';
			  document.getElementById("divSeleccionarMes").style.display = 'none';
			  document.getElementById("divSeleccionarDiadelMes").style.display = 'none';
			  $("#label").text('Semana(s)');
			  
			    acum_selectDias = "";
				acum_selectMes = "";
				acumuladordiasp = "";
				acumuladordiasp2 = "";
				acumuladorDias = "";
				acumOrdinales = "";
				valuesem = "";
				
			  $('#hdIdPeriodo').text('');
				$('#txtTitulo').val('');
				$('#txtFechaIni').val('');
				$('#txtIntervalo').val(0);
				$('#selectDias').val('0').trigger('change.select2');
				$('#selectMes').val('0').trigger('change.select2');
				document.getElementById("rbtFechaFinNunca").checked = true;  
				document.getElementById("rbtFechaFin").checked = false;  
				document.getElementById("rbtFechaFinRepeticiones").checked = false;  
				document.getElementById("txtFechaFin").disabled = false;
				document.getElementById("txtFechaFin").value = "";
				document.getElementById("txtFechaFin").disabled = true;
				
				
				document.getElementById("txtFechaFinRepeticiones").value = "";
				document.getElementById("txtFechaFinRepeticiones").disabled = true;
				
				document.getElementById("chkDiaHabil").checked = false;  
				document.getElementById("chkDiaFeriado").checked = false;  
				
				$('#txtDescripcion').addClass('hidden');
				$('#txtDescripcion').removeClass('hidden');
				$('#txtDescripcion').val('');
				validar();
		  }
		  if (selected == "MES") {
			  clearAll(); //BG Change
			  document.getElementById("divTipo_Periodo").style.display = "block";
			  document.getElementById("divSeleccionarSemana").style.display = 'none'; 
			  document.getElementById("divSeleccionarMes").style.display = 'none';
			  document.getElementById("divRbtPrincipal").style.display = 'block';
			  document.getElementById("divSeleccionarDiadelMes").style.display = 'block';
			  $("#label").text('Mes(es)');
			  
			    $('#hdIdPeriodo').text('');
				$('#txtTitulo').val('');
				$('#txtFechaIni').val('');
				$('#txtIntervalo').val(0);
				$('#txtDescripcion').val('');
				$('#selectDias').val('0').trigger('change.select2');
				$('#selectMes').val('0').trigger('change.select2');
				
				acum_selectDias = "";
				acum_selectMes = "";
				acumuladordiasp = "";
				acumuladordiasp2 = "";
				acumuladorDias = "";
				acumOrdinales = "";
				valuesem = "";
				
				document.getElementById("rbtnelegirmes").checked = false;  
				var btnDia_1 =  document.getElementById("btnDia_1");
				btnDia_1.value = false;
				btnDia_1.style.backgroundColor = "initial";
				btnDia_1.style.fontWeight = "bold";
				btnDia_1.style.color  = "black";

				var btnDia_2 =  document.getElementById("btnDia_2");
				btnDia_2.value = false;
				btnDia_2.style.backgroundColor = "initial";
				btnDia_2.style.fontWeight = "bold";
				btnDia_2.style.color  = "black";
				
				var btnDia_3 =  document.getElementById("btnDia_3");
				btnDia_3.value = false;
				btnDia_3.style.backgroundColor = "initial";
				btnDia_3.style.fontWeight = "bold";
				btnDia_3.style.color  = "black";
				
				var btnDia_4 =  document.getElementById("btnDia_4");
				btnDia_4.value = false;
				btnDia_4.style.backgroundColor = "initial";
				btnDia_4.style.fontWeight = "bold";
				btnDia_4.style.color  = "black";
				
				var btnDia_5 =  document.getElementById("btnDia_5");
				btnDia_5.value = false;
				btnDia_5.style.backgroundColor = "initial";
				btnDia_5.style.fontWeight = "bold";
				btnDia_5.style.color  = "black";
				
				var btnDia_6 =  document.getElementById("btnDia_6");
				btnDia_6.value = false;
				btnDia_6.style.backgroundColor = "initial";
				btnDia_6.style.fontWeight = "bold";
				btnDia_6.style.color  = "black";
				
				var btnDia_7 =  document.getElementById("btnDia_7");
				btnDia_7.value = false;
				btnDia_7.style.backgroundColor = "initial";
				btnDia_7.style.fontWeight = "bold";
				btnDia_7.style.color  = "black";
				
				var btnDia_8 =  document.getElementById("btnDia_8");
				btnDia_8.value = false;
				btnDia_8.style.backgroundColor = "initial";
				btnDia_8.style.fontWeight = "bold";
				btnDia_8.style.color  = "black";
				
				var btnDia_9 =  document.getElementById("btnDia_9");
				btnDia_9.value = false;
				btnDia_9.style.backgroundColor = "initial";
				btnDia_9.style.fontWeight = "bold";
				btnDia_9.style.color  = "black";
				
				var btnDia_10 =  document.getElementById("btnDia_10");
				btnDia_10.value = false;
				btnDia_10.style.backgroundColor = "initial";
				btnDia_10.style.fontWeight = "bold";
				btnDia_10.style.color  = "black";
				
				var btnDia_11 =  document.getElementById("btnDia_11");
				btnDia_11.value = false;
				btnDia_11.style.backgroundColor = "initial";
				btnDia_11.style.fontWeight = "bold";
				btnDia_11.style.color  = "black";
				
				var btnDia_12 =  document.getElementById("btnDia_12");
				btnDia_12.value = false;
				btnDia_12.style.backgroundColor = "initial";
				btnDia_12.style.fontWeight = "bold";
				btnDia_12.style.color  = "black";
				
				var btnDia_13 =  document.getElementById("btnDia_13");
				btnDia_13.value = false;
				btnDia_13.style.backgroundColor = "initial";
				btnDia_13.style.fontWeight = "bold";
				btnDia_13.style.color  = "black";
				
				var btnDia_14 =  document.getElementById("btnDia_14");
				btnDia_14.value = false;
				btnDia_14.style.backgroundColor = "initial";
				btnDia_14.style.fontWeight = "bold";
				btnDia_14.style.color  = "black";
				
				var btnDia_15 =  document.getElementById("btnDia_15");
				btnDia_15.value = false;
				btnDia_15.style.backgroundColor = "initial";
				btnDia_15.style.fontWeight = "bold";
				btnDia_15.style.color  = "black";
				
				var btnDia_16 =  document.getElementById("btnDia_16");
				btnDia_16.value = false;
				btnDia_16.style.backgroundColor = "initial";
				btnDia_16.style.fontWeight = "bold";
				btnDia_16.style.color  = "black";
				
				var btnDia_17 =  document.getElementById("btnDia_17");
				btnDia_17.value = false;
				btnDia_17.style.backgroundColor = "initial";
				btnDia_17.style.fontWeight = "bold";
				btnDia_17.style.color  = "black";
				
				var btnDia_18 =  document.getElementById("btnDia_18");
				btnDia_18.value = false;
				btnDia_18.style.backgroundColor = "initial";
				btnDia_18.style.fontWeight = "bold";
				btnDia_18.style.color  = "black";
				
				var btnDia_19 =  document.getElementById("btnDia_19");
				btnDia_19.value = false;
				btnDia_19.style.backgroundColor = "initial";
				btnDia_19.style.fontWeight = "bold";
				btnDia_19.style.color  = "black";
				
				var btnDia_20 =  document.getElementById("btnDia_20");
				btnDia_20.value = false;
				btnDia_20.style.backgroundColor = "initial";
				btnDia_20.style.fontWeight = "bold";
				btnDia_20.style.color  = "black";
				
				var btnDia_21 =  document.getElementById("btnDia_21");
				btnDia_21.value = false;
				btnDia_21.style.backgroundColor = "initial";
				btnDia_21.style.fontWeight = "bold";
				btnDia_21.style.color  = "black";
				
				var btnDia_22 =  document.getElementById("btnDia_22");
				btnDia_22.value = false;
				btnDia_22.style.backgroundColor = "initial";
				btnDia_22.style.fontWeight = "bold";
				btnDia_22.style.color  = "black";
				
				var btnDia_23 =  document.getElementById("btnDia_23");
				btnDia_23.value = false;
				btnDia_23.style.backgroundColor = "initial";
				btnDia_23.style.fontWeight = "bold";
				btnDia_23.style.color  = "black";
				
				var btnDia_24 =  document.getElementById("btnDia_24");
				btnDia_24.value = false;
				btnDia_24.style.backgroundColor = "initial";
				btnDia_24.style.fontWeight = "bold";
				btnDia_24.style.color  = "black";
				
				var btnDia_25 =  document.getElementById("btnDia_25");
				btnDia_25.value = false;
				btnDia_25.style.backgroundColor = "initial";
				btnDia_25.style.fontWeight = "bold";
				btnDia_25.style.color  = "black";
				
				var btnDia_26 =  document.getElementById("btnDia_26");
				btnDia_26.value = false;
				btnDia_26.style.backgroundColor = "initial";
				btnDia_26.style.fontWeight = "bold";
				btnDia_26.style.color  = "black";
				
				var btnDia_27 =  document.getElementById("btnDia_27");
				btnDia_27.value = false;
				btnDia_27.style.backgroundColor = "initial";
				btnDia_27.style.fontWeight = "bold";
				btnDia_27.style.color  = "black";
				
				var btnDia_28 =  document.getElementById("btnDia_28");
				btnDia_28.value = false;
				btnDia_28.style.backgroundColor = "initial";
				btnDia_28.style.fontWeight = "bold";
				btnDia_28.style.color  = "black";
				
				var btnDia_29 =  document.getElementById("btnDia_29");
				btnDia_29.value = false;
				btnDia_29.style.backgroundColor = "initial";
				btnDia_29.style.fontWeight = "bold";
				btnDia_29.style.color  = "black";
				
				var btnDia_30 =  document.getElementById("btnDia_30");
				btnDia_30.value = false;
				btnDia_30.style.backgroundColor = "initial";
				btnDia_30.style.fontWeight = "bold";
				btnDia_30.style.color  = "black";
				
				var btnDia_31 =  document.getElementById("btnDia_31");
				btnDia_31.value = false;
				btnDia_31.style.backgroundColor = "initial";
				btnDia_31.style.fontWeight = "bold";
				btnDia_31.style.color  = "black";
				
				document.getElementById("rbtnelegirpersonalizado").checked = false; 
				
				document.getElementById("rbtDiaAntes").checked = false;
				document.getElementById("rbtDiaDespues").checked = false;
				document.getElementById("txtDiaAntes").disabled = false;
				document.getElementById("txtDiaAntes").value = "0";
				document.getElementById("txtDiaAntes").disabled = true;
				document.getElementById("txtDiaDespues").disabled = false;
				document.getElementById("txtDiaDespues").value = "0";
				document.getElementById("txtDiaDespues").disabled = true;
				$('#cboOrdinales').val('0').trigger('change.select2');
				document.getElementById("chkSemanal").checked = false;				
				document.getElementById("chkDomingo").checked = false;  
				document.getElementById("chkLunes").checked = false;  
				document.getElementById("chkMartes").checked = false;  
				document.getElementById("chkMiercoles").checked = false;  
				document.getElementById("chkJueves").checked = false;  
				document.getElementById("chkViernes").checked = false;  
				document.getElementById("chkSabado").checked = false;  
				document.getElementById("chkDia").checked = false;  
				
				document.getElementById("chk1erDia").checked = false;  
				document.getElementById("chk2erDia").checked = false;  
				document.getElementById("chk3erDia").checked = false;  
				document.getElementById("chk4erDia").checked = false;  
				document.getElementById("chk5erDia").checked = false;  
				document.getElementById("chk6erDia").checked = false;  
				document.getElementById("chk7erDia").checked = false;
				
				document.getElementById("divSeleccionarDia").style.display = 'none'; 
				document.getElementById("divSeleccionarDiaPersonalizado").style.display = 'none'; 
				
				document.getElementById("rbtFechaFinNunca").checked = true	;  
				document.getElementById("rbtFechaFin").checked = false;  
				document.getElementById("rbtFechaFinRepeticiones").checked = false; 				
				
				document.getElementById("txtFechaFin").disabled = false;
				document.getElementById("txtFechaFin").value = "";
				document.getElementById("txtFechaFin").disabled = true;
				
				document.getElementById("txtFechaFinRepeticiones").disabled = false;
				document.getElementById("txtFechaFinRepeticiones").value = "";				
				document.getElementById("txtFechaFinRepeticiones").disabled = true;
				
				document.getElementById("chkDiaHabil").checked = false;  
				document.getElementById("chkDiaFeriado").checked = false;  
				
				$('#txtDescripcion').addClass('hidden');
				$('#txtDescripcion').removeClass('hidden');
				$('#txtDescripcion').val('');
				
				validar();limpiarRBT();mostrarantesydespues();
				
		  }
		  if (selected == "AÑO") {
			  clearAll(); //BG Change
			  document.getElementById("divTipo_Periodo").style.display = "block";
			  document.getElementById("divSeleccionarSemana").style.display = 'none'; 
			  document.getElementById("divSeleccionarMes").style.display = 'block';
			  document.getElementById("divRbtPrincipal").style.display = 'block';
			  document.getElementById("divSeleccionarDiadelMes").style.display = 'block';
			  $("#label").text('Año(s)');
			  
			    $('#hdIdPeriodo').text('');
				$('#txtTitulo').val('');
				$('#txtFechaIni').val('');
				$('#txtIntervalo').val(0);
				$('#txtDescripcion').val('');
				$('#selectDias').val('0').trigger('change.select2');
				$('#selectMes').val('0').trigger('change.select2');
				
				acum_selectDias = "";
				acum_selectMes = "";
				acumuladordiasp = "";
				acumuladordiasp2 = "";
				acumuladorDias = "";
				acumOrdinales = "";
				valuesem = "";
				
				document.getElementById("rbtnelegirmes").checked = false; 
				
				var btnDia_1 =  document.getElementById("btnDia_1");
				btnDia_1.value = false;
				btnDia_1.style.backgroundColor = "initial";
				btnDia_1.style.fontWeight = "bold";
				btnDia_1.style.color  = "black";

				var btnDia_2 =  document.getElementById("btnDia_2");
				btnDia_2.value = false;
				btnDia_2.style.backgroundColor = "initial";
				btnDia_2.style.fontWeight = "bold";
				btnDia_2.style.color  = "black";
				
				var btnDia_3 =  document.getElementById("btnDia_3");
				btnDia_3.value = false;
				btnDia_3.style.backgroundColor = "initial";
				btnDia_3.style.fontWeight = "bold";
				btnDia_3.style.color  = "black";
				
				var btnDia_4 =  document.getElementById("btnDia_4");
				btnDia_4.value = false;
				btnDia_4.style.backgroundColor = "initial";
				btnDia_4.style.fontWeight = "bold";
				btnDia_4.style.color  = "black";
				
				var btnDia_5 =  document.getElementById("btnDia_5");
				btnDia_5.value = false;
				btnDia_5.style.backgroundColor = "initial";
				btnDia_5.style.fontWeight = "bold";
				btnDia_5.style.color  = "black";
				
				var btnDia_6 =  document.getElementById("btnDia_6");
				btnDia_6.value = false;
				btnDia_6.style.backgroundColor = "initial";
				btnDia_6.style.fontWeight = "bold";
				btnDia_6.style.color  = "black";
				
				var btnDia_7 =  document.getElementById("btnDia_7");
				btnDia_7.value = false;
				btnDia_7.style.backgroundColor = "initial";
				btnDia_7.style.fontWeight = "bold";
				btnDia_7.style.color  = "black";
				
				var btnDia_8 =  document.getElementById("btnDia_8");
				btnDia_8.value = false;
				btnDia_8.style.backgroundColor = "initial";
				btnDia_8.style.fontWeight = "bold";
				btnDia_8.style.color  = "black";
				
				var btnDia_9 =  document.getElementById("btnDia_9");
				btnDia_9.value = false;
				btnDia_9.style.backgroundColor = "initial";
				btnDia_9.style.fontWeight = "bold";
				btnDia_9.style.color  = "black";
				
				var btnDia_10 =  document.getElementById("btnDia_10");
				btnDia_10.value = false;
				btnDia_10.style.backgroundColor = "initial";
				btnDia_10.style.fontWeight = "bold";
				btnDia_10.style.color  = "black";
				
				var btnDia_11 =  document.getElementById("btnDia_11");
				btnDia_11.value = false;
				btnDia_11.style.backgroundColor = "initial";
				btnDia_11.style.fontWeight = "bold";
				btnDia_11.style.color  = "black";
				
				var btnDia_12 =  document.getElementById("btnDia_12");
				btnDia_12.value = false;
				btnDia_12.style.backgroundColor = "initial";
				btnDia_12.style.fontWeight = "bold";
				btnDia_12.style.color  = "black";
				
				var btnDia_13 =  document.getElementById("btnDia_13");
				btnDia_13.value = false;
				btnDia_13.style.backgroundColor = "initial";
				btnDia_13.style.fontWeight = "bold";
				btnDia_13.style.color  = "black";
				
				var btnDia_14 =  document.getElementById("btnDia_14");
				btnDia_14.value = false;
				btnDia_14.style.backgroundColor = "initial";
				btnDia_14.style.fontWeight = "bold";
				btnDia_14.style.color  = "black";
				
				var btnDia_15 =  document.getElementById("btnDia_15");
				btnDia_15.value = false;
				btnDia_15.style.backgroundColor = "initial";
				btnDia_15.style.fontWeight = "bold";
				btnDia_15.style.color  = "black";
				
				var btnDia_16 =  document.getElementById("btnDia_16");
				btnDia_16.value = false;
				btnDia_16.style.backgroundColor = "initial";
				btnDia_16.style.fontWeight = "bold";
				btnDia_16.style.color  = "black";
				
				var btnDia_17 =  document.getElementById("btnDia_17");
				btnDia_17.value = false;
				btnDia_17.style.backgroundColor = "initial";
				btnDia_17.style.fontWeight = "bold";
				btnDia_17.style.color  = "black";
				
				var btnDia_18 =  document.getElementById("btnDia_18");
				btnDia_18.value = false;
				btnDia_18.style.backgroundColor = "initial";
				btnDia_18.style.fontWeight = "bold";
				btnDia_18.style.color  = "black";
				
				var btnDia_19 =  document.getElementById("btnDia_19");
				btnDia_19.value = false;
				btnDia_19.style.backgroundColor = "initial";
				btnDia_19.style.fontWeight = "bold";
				btnDia_19.style.color  = "black";
				
				var btnDia_20 =  document.getElementById("btnDia_20");
				btnDia_20.value = false;
				btnDia_20.style.backgroundColor = "initial";
				btnDia_20.style.fontWeight = "bold";
				btnDia_20.style.color  = "black";
				
				var btnDia_21 =  document.getElementById("btnDia_21");
				btnDia_21.value = false;
				btnDia_21.style.backgroundColor = "initial";
				btnDia_21.style.fontWeight = "bold";
				btnDia_21.style.color  = "black";
				
				var btnDia_22 =  document.getElementById("btnDia_22");
				btnDia_22.value = false;
				btnDia_22.style.backgroundColor = "initial";
				btnDia_22.style.fontWeight = "bold";
				btnDia_22.style.color  = "black";
				
				var btnDia_23 =  document.getElementById("btnDia_23");
				btnDia_23.value = false;
				btnDia_23.style.backgroundColor = "initial";
				btnDia_23.style.fontWeight = "bold";
				btnDia_23.style.color  = "black";
				
				var btnDia_24 =  document.getElementById("btnDia_24");
				btnDia_24.value = false;
				btnDia_24.style.backgroundColor = "initial";
				btnDia_24.style.fontWeight = "bold";
				btnDia_24.style.color  = "black";
				
				var btnDia_25 =  document.getElementById("btnDia_25");
				btnDia_25.value = false;
				btnDia_25.style.backgroundColor = "initial";
				btnDia_25.style.fontWeight = "bold";
				btnDia_25.style.color  = "black";
				
				var btnDia_26 =  document.getElementById("btnDia_26");
				btnDia_26.value = false;
				btnDia_26.style.backgroundColor = "initial";
				btnDia_26.style.fontWeight = "bold";
				btnDia_26.style.color  = "black";
				
				var btnDia_27 =  document.getElementById("btnDia_27");
				btnDia_27.value = false;
				btnDia_27.style.backgroundColor = "initial";
				btnDia_27.style.fontWeight = "bold";
				btnDia_27.style.color  = "black";
				
				var btnDia_28 =  document.getElementById("btnDia_28");
				btnDia_28.value = false;
				btnDia_28.style.backgroundColor = "initial";
				btnDia_28.style.fontWeight = "bold";
				btnDia_28.style.color  = "black";
				
				var btnDia_29 =  document.getElementById("btnDia_29");
				btnDia_29.value = false;
				btnDia_29.style.backgroundColor = "initial";
				btnDia_29.style.fontWeight = "bold";
				btnDia_29.style.color  = "black";
				
				var btnDia_30 =  document.getElementById("btnDia_30");
				btnDia_30.value = false;
				btnDia_30.style.backgroundColor = "initial";
				btnDia_30.style.fontWeight = "bold";
				btnDia_30.style.color  = "black";
				
				var btnDia_31 =  document.getElementById("btnDia_31");
				btnDia_31.value = false;
				btnDia_31.style.backgroundColor = "initial";
				btnDia_31.style.fontWeight = "bold";
				btnDia_31.style.color  = "black";
				
				document.getElementById("rbtnelegirpersonalizado").checked = false; 
				
				document.getElementById("rbtDiaAntes").checked = false;
				document.getElementById("rbtDiaDespues").checked = false;
				document.getElementById("txtDiaAntes").disabled = false;
				document.getElementById("txtDiaAntes").value = "0";
				document.getElementById("txtDiaAntes").disabled = true;
				document.getElementById("txtDiaDespues").disabled = false;
				document.getElementById("txtDiaDespues").value = "0";
				document.getElementById("txtDiaDespues").disabled = true;
				$('#cboOrdinales').val('0').trigger('change.select2');
				document.getElementById("chkSemanal").checked = false;				
				
				document.getElementById("chkDomingo").checked = false;  
				document.getElementById("chkLunes").checked = false;  
				document.getElementById("chkMartes").checked = false;  
				document.getElementById("chkMiercoles").checked = false;  
				document.getElementById("chkJueves").checked = false;  
				document.getElementById("chkViernes").checked = false;  
				document.getElementById("chkSabado").checked = false;  
				document.getElementById("chkDia").checked = false;  
				
				document.getElementById("chk1erDia").checked = false;  
				document.getElementById("chk2erDia").checked = false;  
				document.getElementById("chk3erDia").checked = false;  
				document.getElementById("chk4erDia").checked = false;  
				document.getElementById("chk5erDia").checked = false;  
				document.getElementById("chk6erDia").checked = false;  
				document.getElementById("chk7erDia").checked = false;
				
				document.getElementById("divSeleccionarDia").style.display = 'none'; 
				document.getElementById("divSeleccionarDiaPersonalizado").style.display = 'none'; 
				
				document.getElementById("rbtFechaFinNunca").checked = true	;  
				document.getElementById("rbtFechaFin").checked = false;  
				document.getElementById("rbtFechaFinRepeticiones").checked = false; 				
				
				document.getElementById("txtFechaFin").disabled = false;
				document.getElementById("txtFechaFin").value = "";
				document.getElementById("txtFechaFin").disabled = true;
				
				document.getElementById("txtFechaFinRepeticiones").disabled = false;
				document.getElementById("txtFechaFinRepeticiones").value = "";				
				document.getElementById("txtFechaFinRepeticiones").disabled = true;
				
				document.getElementById("chkDiaHabil").checked = false;  
				document.getElementById("chkDiaFeriado").checked = false;  
				
				$('#txtDescripcion').addClass('hidden');
				$('#txtDescripcion').removeClass('hidden');
				$('#txtDescripcion').val('');
				
				validar();limpiarRBT();mostrarantesydespues();
		  }		
		 
	}
	
	/*FINNNNN AL HACER CLICK EN EL COMBO */
	
	
	/* COMBO SELECT2 DIAS Y MESES */
	$("#selectDias").select2();
	var acum_selectDias = "";
	//div seleccionar dias (SEMANAL)		 
	 $('#selectDias').change( function () {		
		 var selectDias = document.getElementById('selectDias').value; 			 

	   if(selectDias == selectDias){
		   selectDias = $(this).val();
	
		   acum_selectDias = "" + selectDias;
	   }
	 });	
	 $("#selectMes").select2();
	 var acum_selectMes = "";
	 //div seleccionar dias (SEMANAL)		 
	 $('#selectMes').change( function () {		
		 var selectMes = document.getElementById('selectMes').value; 
	   if(selectMes == selectMes){
		   selectMes = $(this).val();		
		   acum_selectMes = "" + selectMes;
	   }
	 });
	 /* COMBO SELECT2 DIAS Y MESES */
	 $("#cboPeriodo").select2();
	 $('#cboPeriodo').select2({
			minimumResultsForSearch : -1
	 });
	 
	 
	 $("#cboOrdinales").select2();
	 $('#cboOrdinales').select2({
			minimumResultsForSearch : -1
	 });
	 
	 
	 var acumOrdinales = "";	 	 
	 $('#cboOrdinales').change( function () {	
		 
		 var texto = $(this).find('option:selected').text();
		 acumOrdinales = texto + "-";
  		
		 
	 });
	 
	 var valuesem ="";	 
	 function valueSem(){		 
		 var a = document.getElementById("chkSemanal");		 
		 if(a.checked == true){				 
			 valuesem = a.value + "-";	
		 }
		 else{
			 valuesem ="";
		 }
	 }
	 
	//Seleccion de radio Buton para seleccionar dia o seleccionar dia personalizado (MENSUAL - ANUAL)
	function mostrarSeleccionDia(dato){
		if (dato == "divSeleccionarDia") {
		    document.getElementById("divSeleccionarDia").style.display = "block";		    
		    document.getElementById("divSeleccionarDiaPersonalizado").style.display = "none";
		  }
		  if (dato == "divSeleccionarDiaPersonalizado") {
			    document.getElementById("divSeleccionarDia").style.display = "none";
			    document.getElementById("divSeleccionarDiaPersonalizado").style.display = "block";
		  }
	}
	

	 /* CUADRO PARA ELEGIR NUMEROS DE DIAS */
	var acumuladorDias = "";
	
	function mBtnSeleccionarDia(id){
		var boton = document.getElementById(id);
		var value = document.getElementById(id).value;
		var dia = document.getElementById(id).innerText;
		var valor_dia;			
			if(id == id){		 	
				if (value === String(false)) {
					valor_dia = "dia";
					boton.value = true;	
					boton.style.backgroundColor = "blue";
					boton.style.fontWeight = "bold";
					boton.style.color = "white";
			    } else {
			    	valor_dia = "";
			    	boton.value = false;
			    	boton.style.backgroundColor = "initial";
			    	boton.style.fontWeight = "bold";
			    	boton.style.color  = "black";
			    }
		 	}				
		 	if(valor_dia == "dia"){
		 		acumuladorDias += dia + ",";
		 	}else{
		 		acumuladorDias = acumuladorDias.replace(dia + ",", "");
		 	}		
		 	console.log("Nuevo acumuladorDias:"+acumuladorDias)
	}	
	/*FINNNN CUADRO PARA ELEGIR NUMEROS DE DIAS */

		 var acumuladordiasp = "";
		 
		 $(".mostrarChkDiaTexto").click( function(){			 
			 if($(this).is(':checked')) {			        
			    var value = $(this).attr("value");	
			    if(value == value){					  
					  acumuladordiasp  +=  value +"," ;					  
			    }	
	    	  }
			 
			 else  if(!$(this).is(':checked')) {
						  acumuladordiasp  = "" ;
						  acumuladordiasp2 = "";
						  document.getElementById("chkDomingo").checked = false;
						  document.getElementById("chkLunes").checked = false; 
						  document.getElementById("chkMartes").checked = false; 
						  document.getElementById("chkMiercoles").checked = false; 
						  document.getElementById("chkJueves").checked = false; 
						  document.getElementById("chkViernes").checked = false; 
						  document.getElementById("chkSabado").checked = false;  
						  document.getElementById("chkDia").checked = false;  
		    	  }
		  });
		 
		 
		 
		var acumuladordiasp2 = "";
		 
		 $(".mostrarChkDiaNumero").click( function(){			 
			 if($(this).is(':checked')) {			        
			    var value = $(this).attr("value");	
			    if(value == value){					  
					  acumuladordiasp2  +=  value +"," ;					  
			    }	
	    	  }
			 
			 else  if(!$(this).is(':checked')) {
						  acumuladordiasp  = "" ;	
						  acumuladordiasp2  = "" ;	
						  document.getElementById("chk1erDia").checked = false;
						  document.getElementById("chk2erDia").checked = false; 
						  document.getElementById("chk3erDia").checked = false; 
						  document.getElementById("chk4erDia").checked = false; 
						  document.getElementById("chk5erDia").checked = false; 
						  document.getElementById("chk6erDia").checked = false; 
						  document.getElementById("chk7erDia").checked = false;  
		    	  }
		  });
		 
		
		 /* cboOrdinales Limpia los campos para mostrar en descripcion */
		 function limpiaracum(){
			 
			    valuesem = "";
				acumuladordiasp = "";
				acumuladordiasp2 = "";
				document.getElementById("chkSemanal").checked = false;
				document.getElementById("chkDomingo").checked = false;  
				document.getElementById("chkLunes").checked = false;  
				document.getElementById("chkMartes").checked = false;  
				document.getElementById("chkMiercoles").checked = false;  
				document.getElementById("chkJueves").checked = false;  
				document.getElementById("chkViernes").checked = false;  
				document.getElementById("chkSabado").checked = false;
				document.getElementById("chkDia").checked = false;
				
				document.getElementById("chkDomingo").disabled = false;  
				document.getElementById("chkLunes").disabled = false;  
				document.getElementById("chkMartes").disabled = false;  
				document.getElementById("chkMiercoles").disabled = false;  
				document.getElementById("chkJueves").disabled = false;  
				document.getElementById("chkViernes").disabled = false;  
				document.getElementById("chkSabado").disabled = false;
				
				document.getElementById("chk1erDia").checked = false;  
				document.getElementById("chk2erDia").checked = false;  
				document.getElementById("chk3erDia").checked = false;  
				document.getElementById("chk4erDia").checked = false;  
				document.getElementById("chk5erDia").checked = false;  
				document.getElementById("chk6erDia").checked = false;  
				document.getElementById("chk7erDia").checked = false;				
				document.getElementById('divDiasTexto').style.display = 'block';   
	            document.getElementById('divDiasNum').style.display = 'none';
	            llenartxtdescripcion();
	            descripcionTermina();
		 }
		 
		 /* FIIINNNNN cboOrdinales Limpia los campos para mostrar en descripcion */
		 
		 
		 /* Al SElECCIONAR RBTN ELEGIR MES Y PERSONALIZADO LIMPIA  */
		 function limpiarRBT(){
			 
			 if(document.getElementById('rbtnelegirmes').checked == true){
				 
					acumOrdinales = "";
					acumuladordiasp = "";
					acumuladordiasp2 = "";
					valuesem = "";

				    document.getElementById("rbtnelegirpersonalizado").checked = false; 
				    document.getElementById("rbtDiaAntes").checked = false;			
				    document.getElementById("rbtDiaDespues").checked = false;	
				    document.getElementById("txtDiaAntes").value = "";
				    document.getElementById("txtDiaDespues").value = "";
				    document.getElementById("txtDiaAntes").disabled = true;
					document.getElementById("txtDiaDespues").disabled = true;					
					$('#cboOrdinales').val('0').trigger('change.select2');
					
					document.getElementById("chkSemanal").checked = false;				
					
					document.getElementById("chkDomingo").checked = false;  
					document.getElementById("chkLunes").checked = false;  
					document.getElementById("chkMartes").checked = false;  
					document.getElementById("chkMiercoles").checked = false;  
					document.getElementById("chkJueves").checked = false;  
					document.getElementById("chkViernes").checked = false;  
					document.getElementById("chkSabado").checked = false;  
					document.getElementById("chkDia").checked = false;  
					document.getElementById("hideDia").hidden = false;  
					
					document.getElementById("chk1erDia").checked = false;  
					document.getElementById("chk2erDia").checked = false;  
					document.getElementById("chk3erDia").checked = false;  
					document.getElementById("chk4erDia").checked = false;  
					document.getElementById("chk5erDia").checked = false;  
					document.getElementById("chk6erDia").checked = false;  
					document.getElementById("chk7erDia").checked = false;
				 
			 }
			 
			 	
			 if(document.getElementById('rbtnelegirpersonalizado').checked == true){
				  
				 	
				var btnDia_1 =  document.getElementById("btnDia_1");
				btnDia_1.value = false;
				btnDia_1.style.backgroundColor = "initial";
				btnDia_1.style.fontWeight = "bold";
				btnDia_1.style.color  = "black";

				var btnDia_2 =  document.getElementById("btnDia_2");
				btnDia_2.value = false;
				btnDia_2.style.backgroundColor = "initial";
				btnDia_2.style.fontWeight = "bold";
				btnDia_2.style.color  = "black";
				
				var btnDia_3 =  document.getElementById("btnDia_3");
				btnDia_3.value = false;
				btnDia_3.style.backgroundColor = "initial";
				btnDia_3.style.fontWeight = "bold";
				btnDia_3.style.color  = "black";
				
				var btnDia_4 =  document.getElementById("btnDia_4");
				btnDia_4.value = false;
				btnDia_4.style.backgroundColor = "initial";
				btnDia_4.style.fontWeight = "bold";
				btnDia_4.style.color  = "black";
				
				var btnDia_5 =  document.getElementById("btnDia_5");
				btnDia_5.value = false;
				btnDia_5.style.backgroundColor = "initial";
				btnDia_5.style.fontWeight = "bold";
				btnDia_5.style.color  = "black";
				
				var btnDia_6 =  document.getElementById("btnDia_6");
				btnDia_6.value = false;
				btnDia_6.style.backgroundColor = "initial";
				btnDia_6.style.fontWeight = "bold";
				btnDia_6.style.color  = "black";
				
				var btnDia_7 =  document.getElementById("btnDia_7");
				btnDia_7.value = false;
				btnDia_7.style.backgroundColor = "initial";
				btnDia_7.style.fontWeight = "bold";
				btnDia_7.style.color  = "black";
				
				var btnDia_8 =  document.getElementById("btnDia_8");
				btnDia_8.value = false;
				btnDia_8.style.backgroundColor = "initial";
				btnDia_8.style.fontWeight = "bold";
				btnDia_8.style.color  = "black";
				
				var btnDia_9 =  document.getElementById("btnDia_9");
				btnDia_9.value = false;
				btnDia_9.style.backgroundColor = "initial";
				btnDia_9.style.fontWeight = "bold";
				btnDia_9.style.color  = "black";
				
				var btnDia_10 =  document.getElementById("btnDia_10");
				btnDia_10.value = false;
				btnDia_10.style.backgroundColor = "initial";
				btnDia_10.style.fontWeight = "bold";
				btnDia_10.style.color  = "black";
				
				var btnDia_11 =  document.getElementById("btnDia_11");
				btnDia_11.value = false;
				btnDia_11.style.backgroundColor = "initial";
				btnDia_11.style.fontWeight = "bold";
				btnDia_11.style.color  = "black";
				
				var btnDia_12 =  document.getElementById("btnDia_12");
				btnDia_12.value = false;
				btnDia_12.style.backgroundColor = "initial";
				btnDia_12.style.fontWeight = "bold";
				btnDia_12.style.color  = "black";
				
				var btnDia_13 =  document.getElementById("btnDia_13");
				btnDia_13.value = false;
				btnDia_13.style.backgroundColor = "initial";
				btnDia_13.style.fontWeight = "bold";
				btnDia_13.style.color  = "black";
				
				var btnDia_14 =  document.getElementById("btnDia_14");
				btnDia_14.value = false;
				btnDia_14.style.backgroundColor = "initial";
				btnDia_14.style.fontWeight = "bold";
				btnDia_14.style.color  = "black";
				
				var btnDia_15 =  document.getElementById("btnDia_15");
				btnDia_15.value = false;
				btnDia_15.style.backgroundColor = "initial";
				btnDia_15.style.fontWeight = "bold";
				btnDia_15.style.color  = "black";
				
				var btnDia_16 =  document.getElementById("btnDia_16");
				btnDia_16.value = false;
				btnDia_16.style.backgroundColor = "initial";
				btnDia_16.style.fontWeight = "bold";
				btnDia_16.style.color  = "black";
				
				var btnDia_17 =  document.getElementById("btnDia_17");
				btnDia_17.value = false;
				btnDia_17.style.backgroundColor = "initial";
				btnDia_17.style.fontWeight = "bold";
				btnDia_17.style.color  = "black";
				
				var btnDia_18 =  document.getElementById("btnDia_18");
				btnDia_18.value = false;
				btnDia_18.style.backgroundColor = "initial";
				btnDia_18.style.fontWeight = "bold";
				btnDia_18.style.color  = "black";
				
				var btnDia_19 =  document.getElementById("btnDia_19");
				btnDia_19.value = false;
				btnDia_19.style.backgroundColor = "initial";
				btnDia_19.style.fontWeight = "bold";
				btnDia_19.style.color  = "black";
				
				var btnDia_20 =  document.getElementById("btnDia_20");
				btnDia_20.value = false;
				btnDia_20.style.backgroundColor = "initial";
				btnDia_20.style.fontWeight = "bold";
				btnDia_20.style.color  = "black";
				
				var btnDia_21 =  document.getElementById("btnDia_21");
				btnDia_21.value = false;
				btnDia_21.style.backgroundColor = "initial";
				btnDia_21.style.fontWeight = "bold";
				btnDia_21.style.color  = "black";
				
				var btnDia_22 =  document.getElementById("btnDia_22");
				btnDia_22.value = false;
				btnDia_22.style.backgroundColor = "initial";
				btnDia_22.style.fontWeight = "bold";
				btnDia_22.style.color  = "black";
				
				var btnDia_23 =  document.getElementById("btnDia_23");
				btnDia_23.value = false;
				btnDia_23.style.backgroundColor = "initial";
				btnDia_23.style.fontWeight = "bold";
				btnDia_23.style.color  = "black";
				
				var btnDia_24 =  document.getElementById("btnDia_24");
				btnDia_24.value = false;
				btnDia_24.style.backgroundColor = "initial";
				btnDia_24.style.fontWeight = "bold";
				btnDia_24.style.color  = "black";
				
				var btnDia_25 =  document.getElementById("btnDia_25");
				btnDia_25.value = false;
				btnDia_25.style.backgroundColor = "initial";
				btnDia_25.style.fontWeight = "bold";
				btnDia_25.style.color  = "black";
				
				var btnDia_26 =  document.getElementById("btnDia_26");
				btnDia_26.value = false;
				btnDia_26.style.backgroundColor = "initial";
				btnDia_26.style.fontWeight = "bold";
				btnDia_26.style.color  = "black";
				
				var btnDia_27 =  document.getElementById("btnDia_27");
				btnDia_27.value = false;
				btnDia_27.style.backgroundColor = "initial";
				btnDia_27.style.fontWeight = "bold";
				btnDia_27.style.color  = "black";
				
				var btnDia_28 =  document.getElementById("btnDia_28");
				btnDia_28.value = false;
				btnDia_28.style.backgroundColor = "initial";
				btnDia_28.style.fontWeight = "bold";
				btnDia_28.style.color  = "black";
				
				var btnDia_29 =  document.getElementById("btnDia_29");
				btnDia_29.value = false;
				btnDia_29.style.backgroundColor = "initial";
				btnDia_29.style.fontWeight = "bold";
				btnDia_29.style.color  = "black";
				
				var btnDia_30 =  document.getElementById("btnDia_30");
				btnDia_30.value = false;
				btnDia_30.style.backgroundColor = "initial";
				btnDia_30.style.fontWeight = "bold";
				btnDia_30.style.color  = "black";
				
				var btnDia_31 =  document.getElementById("btnDia_31");
				btnDia_31.value = false;
				btnDia_31.style.backgroundColor = "initial";
				btnDia_31.style.fontWeight = "bold";
				btnDia_31.style.color  = "black";
				
				acumuladorDias = "";
				
				document.getElementById('hideDia').hidden = false;
			 } 	 			
		 }
		 
		 /* FIIIINNN  Al SElECCIONAR RBTN ELEGIR MES Y PERSONALIZADO LIMPIA  */
	
	//CheckedSemana_Anual Semana == false muestra diasTexto y oculta diasNum ó Semana == true muestra diasTexto y diasNum
	function mostrarCheckSem(){
        var chkSemanal = document.getElementById("chkSemanal");
        if(chkSemanal.checked == false){   
            document.getElementById('divDiasTexto').style.display = 'block';   
            document.getElementById('divDiasNum').style.display = 'none';   
            valuesem ="";
            acumuladordiasp = "";
            acumuladordiasp2 = "";
           
            document.getElementById("chkDomingo").checked = false; 
            document.getElementById("chkLunes").checked = false; 
            document.getElementById("chkMartes").checked = false; 
            document.getElementById("chkMiercoles").checked = false; 
            document.getElementById("chkJueves").checked = false; 
            document.getElementById("chkViernes").checked = false; 
            document.getElementById("chkSabado").checked = false; 
            document.getElementById("chkDia").checked = false; 
            document.getElementById("hideDia").hidden = false;
           
            document.getElementById("chk1erDia").checked = false; 
            document.getElementById("chk2erDia").checked = false; 
            document.getElementById("chk3erDia").checked = false; 
            document.getElementById("chk4erDia").checked = false; 
            document.getElementById("chk5erDia").checked = false; 
            document.getElementById("chk6erDia").checked = false; 
            document.getElementById("chk7erDia").checked = false;
           
        }else {
           
            document.getElementById('divDiasTexto').style.display = 'block';
            document.getElementById('divDiasNum').style.display = 'block';
            
            document.getElementById("chkDomingo").disabled = false; 
            document.getElementById("chkLunes").disabled = false; 
            document.getElementById("chkMartes").disabled = false; 
            document.getElementById("chkMiercoles").disabled = false; 
            document.getElementById("chkJueves").disabled = false; 
            document.getElementById("chkViernes").disabled = false; 
            document.getElementById("chkSabado").disabled = false;
           
            document.getElementById("chkDomingo").checked = false; 
            document.getElementById("chkLunes").checked = false; 
            document.getElementById("chkMartes").checked = false; 
            document.getElementById("chkMiercoles").checked = false; 
            document.getElementById("chkJueves").checked = false; 
            document.getElementById("chkViernes").checked = false; 
            document.getElementById("chkSabado").checked = false; 
            document.getElementById("chkDia").checked = false;
            document.getElementById("hideDia").hidden = true;
           
            document.getElementById("chk1erDia").checked = false; 
            document.getElementById("chk2erDia").checked = false; 
            document.getElementById("chk3erDia").checked = false; 
            document.getElementById("chk4erDia").checked = false; 
            document.getElementById("chk5erDia").checked = false; 
            document.getElementById("chk6erDia").checked = false; 
            document.getElementById("chk7erDia").checked = false;
           
            acumuladordiasp = "";
            acumuladordiasp2 = "";
        }
    }
		 
		 
		 
	function mostrarCheckSem2(){
		var chkSemanal = document.getElementById("chkSemanal");
		if(chkSemanal.checked == false){	
			document.getElementById('divDiasTexto').style.display = 'block';	
			document.getElementById('divDiasNum').style.display = 'none';	
		}else {
			document.getElementById('divDiasTexto').style.display = 'block';
			document.getElementById('divDiasNum').style.display = 'block';
		}
	}
	
	//DivDiasNum Inicializa como no visible 
	document.getElementById('divDiasNum').style.display = 'none';
	
	function mostrarDivDiaTexto() {
		var chkSemanal = document.getElementById("chkSemanal").checked;
		var elementos = $('input.mostrarChkDiaTexto');
		var algunoMarcado = elementos.toArray().find(function(elemento){
			return $(elemento).prop('checked');			
		});		
		if(chkSemanal == true){
			if(algunoMarcado){
				document.getElementById('divDiasNum').style.display = 'none';
			}else{	
				document.getElementById('divDiasNum').style.display = 'block';
			}
		}else{
			document.getElementById('divDiasNum').style.display = 'none';
			//BG004 Valida DIA
			var chkDia = document.getElementById('chkDia').checked;
			if(chkDia == true){
				
				valuesem = "";
				acumuladordiasp = "";
				acumuladordiasp2 = "";
				
				document.getElementById("chkDomingo").checked = false; 
	            document.getElementById("chkLunes").checked = false; 
	            document.getElementById("chkMartes").checked = false; 
	            document.getElementById("chkMiercoles").checked = false; 
	            document.getElementById("chkJueves").checked = false; 
	            document.getElementById("chkViernes").checked = false; 
	            document.getElementById("chkSabado").checked = false; 
	            
	            document.getElementById("chkDomingo").disabled = true; 
	            document.getElementById("chkLunes").disabled = true; 
	            document.getElementById("chkMartes").disabled = true;  
	            document.getElementById("chkMiercoles").disabled = true; 
	            document.getElementById("chkJueves").disabled = true; 
	            document.getElementById("chkViernes").disabled = true; 
	            document.getElementById("chkSabado").disabled = true;
	            
	             
			}else{

	            document.getElementById("chkDomingo").disabled = false; 
	            document.getElementById("chkLunes").disabled = false; 
	            document.getElementById("chkMartes").disabled = false;  
	            document.getElementById("chkMiercoles").disabled = false; 
	            document.getElementById("chkJueves").disabled = false; 
	            document.getElementById("chkViernes").disabled = false; 
	            document.getElementById("chkSabado").disabled = false;
			}
			
		}
		
	}
	
	function mostrarDivDiaTexto2() {
		var chkSemanal = document.getElementById("chkSemanal").checked;
		var elementos = $('input.mostrarChkDiaTexto');
		var algunoMarcado = elementos.toArray().find(function(elemento){
			return $(elemento).prop('checked');			
		});		
		if(chkSemanal == true){
			if(algunoMarcado){
				document.getElementById('divDiasNum').style.display = 'none';
			}else{	
				document.getElementById('divDiasNum').style.display = 'block';
			}
		}else{
			document.getElementById('divDiasNum').style.display = 'none';
		}
	}


	function mostrarDivDiaNumero() {
		var chkSemanal = document.getElementById("chkSemanal").checked;
		var elementos = $('input.mostrarChkDiaNumero');
		var algunoMarcado = elementos.toArray().find(function(elemento){
			return $(elemento).prop('checked');			
		});	
		if(chkSemanal == true){
			if(algunoMarcado){
				document.getElementById('divDiasTexto').style.display = 'none';
			}else{	
				document.getElementById('divDiasTexto').style.display = 'block';
			}
		}else{
			document.getElementById('divDiasNum').style.display = 'none';
		}
	}

	function mostrarDivDiaNumero2() {
		var chkSemanal = document.getElementById("chkSemanal").checked;
		var elementos = $('input.mostrarChkDiaNumero');
		var algunoMarcado = elementos.toArray().find(function(elemento){
			return $(elemento).prop('checked');			
		});	
		if(chkSemanal == true){
			if(algunoMarcado){
				document.getElementById('divDiasTexto').style.display = 'none';
			}else{	
				document.getElementById('divDiasTexto').style.display = 'block';
			}
		}else{
			document.getElementById('divDiasNum').style.display = 'none';
		}
	}
	
////////////////////////////////////////////////////////////////////
	function mGuardar(){
		var periodoPrincipal = document.getElementById('cboPeriodoPrincipal').value; //+BG003
		var periodosExcluidos = acum_periodoExclude; //+BG003
		
		var pTitulo = document.getElementById('txtTitulo').value;			//PERIODO
		var pUsuario = document.getElementById('idUsuario').value;			//PERIODO		
		var pEstado = 1;													//PERIODO
		var pidTipo_Periodo = document.getElementById('cboPeriodo').value;  //PERIODO
		var idPeriodo = document.getElementById("cboPeriodo");
		var ptextPeriodo = idPeriodo.options[idPeriodo.selectedIndex].text; 
		var pFechaIni = document.getElementById('txtFechaIni').value;		//PERIODO
		var pFechaFin =  document.getElementById('txtFechaFin').value;		//PERIODO
		var pIntervalo = document.getElementById('txtIntervalo').value;		//PERIODO		
		var dia_tiempo_nombre = "", dia_tiempo_numero = 0;					//DETALLE PERIODO		
	    if (document.getElementById("txtDiaAntes").value == "" && document.getElementById('txtDiaDespues').value == ""){
	    	dia_tiempo_numero = 0;	
		}
	    else{			
			if(document.getElementById('rbtDiaAntes').checked == true){
				dia_tiempo_nombre = "ANTES";	
				dia_tiempo_numero = document.getElementById('txtDiaAntes').value;
			}
			if(document.getElementById('rbtDiaDespues').checked == true){
				dia_tiempo_nombre = "DESPUES";	
				dia_tiempo_numero = document.getElementById('txtDiaDespues').value;
			}				
		}
			
		var cboOrdinales = document.getElementById('cboOrdinales').value;		
		//DIA TEXTO
		var dia_nombre = "";
		if(document.getElementById('chkLunes').checked == true){	dia_nombre += "LUNES,";		}
		if(document.getElementById('chkMartes').checked == true){	dia_nombre += "MARTES,";	}
		if(document.getElementById('chkMiercoles').checked == true){dia_nombre += "MIERCOLES,";	}
		if(document.getElementById('chkJueves').checked == true){	dia_nombre += "JUEVES,";	}
		if(document.getElementById('chkViernes').checked == true){	dia_nombre += "VIERNES,";	}
		if(document.getElementById('chkSabado').checked == true){	dia_nombre += "SABADO,";	}
		if(document.getElementById('chkDomingo').checked == true){	dia_nombre += "DOMINGO,";	}	 
		if(document.getElementById('chkDia').checked == true){	dia_nombre += "DIA,";	}	 
		//DIA NUMERO
		var dia_especial = "";
		if(document.getElementById('chk1erDia').checked == true){	dia_especial += "1,";		}
		if(document.getElementById('chk2erDia').checked == true){	dia_especial += "2,";		}
		if(document.getElementById('chk3erDia').checked == true){	dia_especial += "3,";		}
		if(document.getElementById('chk4erDia').checked == true){	dia_especial += "4,";		}
		if(document.getElementById('chk5erDia').checked == true){	dia_especial += "5,";		}
		if(document.getElementById('chk6erDia').checked == true){	dia_especial += "6,";		}
		if(document.getElementById('chk7erDia').checked == true){	dia_especial += "7,";		}	
		var panio_FechaIni = (new Date(pFechaIni)).getFullYear();			//PERIODO_DETALLE
		var panio_FechaFin = (new Date(pFechaFin)).getFullYear();			//PERIODO_DETALLE
	
 	 	
		$(document).ready(function(){
		var src = "ServletPeriodo";		
		$.post(src, {
					strAccion : '1',
					//+BG003
					strPeriodoPrincipal :  periodoPrincipal, 
					strPeriodoExcluido :  periodosExcluidos, 
					//PERIODO
					strtextPeriodo : ptextPeriodo,
					strTitulo : pTitulo,
					//Fecha de registro por defecto sera la fecha actual;
					strUsuario : pUsuario,
					strEstado : pEstado,
					stridTipo_Periodo : pidTipo_Periodo,
					strFechaIni : pFechaIni,					
					strIntervalo : pIntervalo,					
					strrbtFechaFinNunca : document.getElementById('rbtFechaFinNunca').checked,    				
					strrbtFechaFin : document.getElementById('rbtFechaFin').checked,							
					strrbtFechaFinRepeticiones : document.getElementById('rbtFechaFinRepeticiones').checked,	
					strFechaFin : pFechaFin,																	
					strFechaFinRepeticiones : document.getElementById('txtFechaFinRepeticiones').value,			
					strDiaHabil : document.getElementById('chkDiaHabil').checked,							
					strDiaFeriado : document.getElementById('chkDiaFeriado').checked,
					
					//PERIODO DETALLE
					stracum_selectDias : acum_selectDias,
					strrbtDiaMes : document.getElementById('rbtnelegirmes').checked,
					strrbtDiaPersonalizado : document.getElementById('rbtnelegirpersonalizado').checked,
					stracumuladorDias : acumuladorDias,
					strdia_tiempo_nombre : dia_tiempo_nombre,
					strdia_tiempo_numero : dia_tiempo_numero,
					strcboOrdinales : cboOrdinales,
					strsemana : document.getElementById('chkSemanal').checked,
					strdia_nombre : dia_nombre,
					strdia_especial : dia_especial,
					stracum_selectMes : acum_selectMes,
					stranio_FechaIni : panio_FechaIni,
					stranio_FechaFin : panio_FechaFin
					},
				function(pdata){
						var obj = JSON.parse(pdata);
		 	  			if(obj.RegistrarPeriodo[0].resultadoP != ""){
		 	  				if(obj.RegistrarPeriodo[0].no31 != ""){
		 	  					var no31 = obj.RegistrarPeriodo[0].no31;
		 	  					alert("Los Meses " + no31 + "no registran el dia 31")
		 	  				}
		 	  				if(obj.RegistrarPeriodo[0].febrero != ""){
		 	  					var febrero = obj.RegistrarPeriodo[0].febrero;
		 	  					alert("*Si el año es biciesto solo registrara 29 dias del mes " + febrero + " \n *El mes de " + febrero + " no registra dias mayores a 29");
		 	  				}		 	  				
		 	  				alert("PERIODO:  " + obj.RegistrarPeriodo[0].resultadoP);
		 	  				alert("DETALLE_PERIODO:  " + obj.RegistrarPeriodo[0].resultadoPD);
		 	  				listReportPeriodo();
							$('#mdNuevoPeriodo').modal('hide');	
		 	  			}
						else{
							$('#mdNuevoPeriodo').modal('hide');
							$('#lblMessage').text('Hubo un problema al procesar, no se actualizó, por favor vuelva a intentarlo.');
						}
							
				});
		});        
	 	 
	}
	
	
	function mActualizar(){
		var periodoPrincipal = document.getElementById('cboPeriodoPrincipal').value; //+BG003
		var periodosExcluidos = acum_periodoExclude; //+BG003
		
		var pTitulo = document.getElementById('txtTitulo').value;			//PERIODO
		var pUsuario = document.getElementById('idUsuario').value;			//PERIODO		
		var pEstado = 1;													//PERIODO
		var pidTipo_Periodo = document.getElementById('cboPeriodo').value;  //PERIODO
		var idPeriodo = document.getElementById("cboPeriodo");
		var ptextPeriodo = idPeriodo.options[idPeriodo.selectedIndex].text; 
		var pFechaIni = document.getElementById('txtFechaIni').value;		//PERIODO
		var pFechaFin =  document.getElementById('txtFechaFin').value;		//PERIODO
		var pIntervalo = document.getElementById('txtIntervalo').value;		//PERIODO		
		var dia_tiempo_nombre = "", dia_tiempo_numero = 0;					//DETALLE PERIODO		
	    if (document.getElementById("txtDiaAntes").value == "" && document.getElementById('txtDiaDespues').value == ""){
	    	dia_tiempo_numero = 0;	
		}
	    else{			
			if(document.getElementById('rbtDiaAntes').checked == true){
				dia_tiempo_nombre = "ANTES";	
				dia_tiempo_numero = document.getElementById('txtDiaAntes').value;
			}
			if(document.getElementById('rbtDiaDespues').checked == true){
				dia_tiempo_nombre = "DESPUES";	
				dia_tiempo_numero = document.getElementById('txtDiaDespues').value;
			}				
		}
			
		var cboOrdinales = document.getElementById('cboOrdinales').value;		
		//DIA TEXTO
		var dia_nombre = "";
		if(document.getElementById('chkLunes').checked == true){	dia_nombre += "LUNES,";		}
		if(document.getElementById('chkMartes').checked == true){	dia_nombre += "MARTES,";	}
		if(document.getElementById('chkMiercoles').checked == true){dia_nombre += "MIERCOLES,";	}
		if(document.getElementById('chkJueves').checked == true){	dia_nombre += "JUEVES,";	}
		if(document.getElementById('chkViernes').checked == true){	dia_nombre += "VIERNES,";	}
		if(document.getElementById('chkSabado').checked == true){	dia_nombre += "SABADO,";	}
		if(document.getElementById('chkDomingo').checked == true){	dia_nombre += "DOMINGO,";	}	 
		if(document.getElementById('chkDia').checked == true){	dia_nombre += "DIA,";	}	 
		//DIA NUMERO
		var dia_especial = "";
		if(document.getElementById('chk1erDia').checked == true){	dia_especial += "1,";		}
		if(document.getElementById('chk2erDia').checked == true){	dia_especial += "2,";		}
		if(document.getElementById('chk3erDia').checked == true){	dia_especial += "3,";		}
		if(document.getElementById('chk4erDia').checked == true){	dia_especial += "4,";		}
		if(document.getElementById('chk5erDia').checked == true){	dia_especial += "5,";		}
		if(document.getElementById('chk6erDia').checked == true){	dia_especial += "6,";		}
		if(document.getElementById('chk7erDia').checked == true){	dia_especial += "7,";		}	
		var panio_FechaIni = (new Date(pFechaIni)).getFullYear();			//PERIODO_DETALLE
		var panio_FechaFin = (new Date(pFechaFin)).getFullYear();			//PERIODO_DETALLE
	
 	 	
		$(document).ready(function(){
		var src = "ServletPeriodo";		
		$.post(src, {
					strAccion : '3',
					//+BG003
					strPeriodoPrincipal :  periodoPrincipal, 
					strPeriodoExcluido :  periodosExcluidos,
					//PERIODO
					idPeriodo : document.getElementById('hdIdPeriodo').value,//DIFERENTE A GUARDAR
					strtextPeriodo : document.getElementById('labeltituloactualizar').value,//DIFERENTE A GUARDAR
					strTitulo : pTitulo,
					//Fecha de registro por defecto sera la fecha actual;
					strUsuario : pUsuario,
					strEstado : pEstado,
					stridTipo_Periodo : document.getElementById('labelIDtituloactualizar').value ,
					strFechaIni : pFechaIni,					
					strIntervalo : pIntervalo,					
					strrbtFechaFinNunca : document.getElementById('rbtFechaFinNunca').checked,    				
					strrbtFechaFin : document.getElementById('rbtFechaFin').checked,							
					strrbtFechaFinRepeticiones : document.getElementById('rbtFechaFinRepeticiones').checked,	
					strFechaFin : pFechaFin,																	
					strFechaFinRepeticiones : document.getElementById('txtFechaFinRepeticiones').value,			
					strDiaHabil : document.getElementById('chkDiaHabil').checked,							
					strDiaFeriado : document.getElementById('chkDiaFeriado').checked,
					
					//PERIODO DETALLE
					stracum_selectDias : acum_selectDias,
					strrbtDiaMes : document.getElementById('rbtnelegirmes').checked,
					strrbtDiaPersonalizado : document.getElementById('rbtnelegirpersonalizado').checked,
					stracumuladorDias : acumuladorDias,
					strdia_tiempo_nombre : dia_tiempo_nombre,
					strdia_tiempo_numero : dia_tiempo_numero,
					strcboOrdinales : cboOrdinales,
					strsemana : document.getElementById('chkSemanal').checked,
					strdia_nombre : dia_nombre,
					strdia_especial : dia_especial,
					stracum_selectMes : acum_selectMes,
					stranio_FechaIni : panio_FechaIni,
					stranio_FechaFin : panio_FechaFin
					},
				function(pdata){
						var obj = JSON.parse(pdata);
		 	  			if(obj.RegistrarPeriodo[0].resultadoP != ""){
		 	  				if(obj.RegistrarPeriodo[0].no31 != ""){
		 	  					var no31 = obj.RegistrarPeriodo[0].no31;
		 	  					alert("Los Meses " + no31 + "no registran el dia 31")
		 	  				}
		 	  				if(obj.RegistrarPeriodo[0].febrero != ""){
		 	  					var febrero = obj.RegistrarPeriodo[0].febrero;
		 	  					alert("*Si el año es biciesto solo registrara 29 dias del mes " + febrero + " \n *El mes de " + febrero + " no registra dias mayores a 29");
		 	  				}		 	  				
		 	  				alert("PERIODO:  " + obj.RegistrarPeriodo[0].resultadoP);
		 	  				alert("DETALLE_PERIODO:  " + obj.RegistrarPeriodo[0].resultadoPD);
		 	  				listReportPeriodo();
							$('#mdNuevoPeriodo').modal('hide');	
		 	  			}
						else{
							$('#mdNuevoPeriodo').modal('hide');
							$('#lblMessage').text('Hubo un problema al procesar, no se actualizó, por favor vuelva a intentarlo.');
						}
							
				});
		});         
	 	 
	}
	
	
	function listComboOrdinales(){
		$("#cboOrdinales option").remove();
		$("#cboOrdinales").append($('<option>', { value : '0', text : 'SELECCIONAR' }));
		$("#cboOrdinales").append($('<option>', { value : '1', text : 'PRIMER' }));
		$("#cboOrdinales").append($('<option>', { value : '2', text : 'SEGUNDO' }));
		$("#cboOrdinales").append($('<option>', { value : '3', text : 'TERCER' }));
		$("#cboOrdinales").append($('<option>', { value : '4', text : 'CUARTO' }));
		$("#cboOrdinales").append($('<option>', { value : '5', text : 'QUINTO' }));
		$("#cboOrdinales").append($('<option>', { value : '-3', text : 'ANTEPENULTIMO' }));
		$("#cboOrdinales").append($('<option>', { value : '-2', text : 'PENULTIMO' }));
		$("#cboOrdinales").append($('<option>', { value : '-1', text : 'ULTIMO' }));
	}
	
	
	/* VALIDA LOS RADIO BUTTON EN SECCION TERMINA  */
	function mostrarTermina(dato){		
		if (dato == "nunca") {		
			document.getElementById("txtFechaFin").value = "";
			document.getElementById("txtFechaFinRepeticiones").value = "";
			document.getElementById("txtFechaFin").disabled = true;
			document.getElementById("txtFechaFinRepeticiones").disabled = true;			
		}
		if (dato == "fecha_Fin") {			
			document.getElementById("txtFechaFinRepeticiones").value = "";
			document.getElementById("txtFechaFin").disabled = false;		
			document.getElementById("txtFechaFinRepeticiones").disabled = true;			
		}
		if (dato == "nRepeticiones") {	
			document.getElementById("txtFechaFin").value = "";
			document.getElementById("txtFechaFin").disabled = true;
			document.getElementById("txtFechaFinRepeticiones").disabled = false;
			document.getElementById("txtFechaFinRepeticiones").value = 0;
		}	
	}
	/*FINNNNN VALIDA LOS RADIO BUTTON EN SECCION TERMINA  */
	
	
	function mostrarantesydespues(){
		
		var antes = document.getElementById("rbtDiaAntes").checked;
		var despues = document.getElementById("rbtDiaDespues").checked;
		
		
		if(antes == true){						
			document.getElementById("txtDiaAntes").disabled = false;
			document.getElementById("txtDiaDespues").disabled = true;
			document.getElementById("txtDiaDespues").value = "0";
			
		} 
		if(despues == true){	
			document.getElementById("txtDiaDespues").disabled = false;
			document.getElementById("txtDiaAntes").disabled = true;
			document.getElementById("txtDiaAntes").value = "0";
			
		}if(antes == false && despues == false){
			
			document.getElementById("txtDiaDespues").value = "0";
			document.getElementById("txtDiaDespues").disabled = true;
			document.getElementById("txtDiaAntes").value = "0";
			document.getElementById("txtDiaAntes").disabled = true;
			
		}
		
	}
	
	
	// ----------------------FIN LIMPIAR CAMPOS Y VALIDAR	
	
	
	listOptions('PERIODO_SCHEDULE', document.getElementById("idTeam").value ); 	
	
	function listReportPeriodo(){
		$(document).ready(function(){
			var src = "ServletPeriodo";
			$.post(src, {
				strAccion : '6'
				},
				function(pdata){
					var obj = JSON.parse(pdata);
					var dataReporte = [];
					var columnsReporte = [];
						for(i = 0; i < obj.ListaReportePeriodo.length; i++){
							var arr = [];	
							arr.push(obj.ListaReportePeriodo[i].idPeriodo);
							arr.push(obj.ListaReportePeriodo[i].titulo);
							arr.push(obj.ListaReportePeriodo[i].fecha_ini);
							arr.push(obj.ListaReportePeriodo[i].fecha_fin);
							arr.push(obj.ListaReportePeriodo[i].estado);
							arr.push(obj.ListaReportePeriodo[i].id_tipo_periodo);
							arr.push(obj.ListaReportePeriodo[i].tipo_periodo);
							arr.push(obj.ListaReportePeriodo[i].intervalo);
							arr.push(obj.ListaReportePeriodo[i].dia_habil);
							arr.push(obj.ListaReportePeriodo[i].dia_feriado);
							dataReporte.push(arr);
						}						
						columnsReporte=[	
							{title : "ID_PERIODO"},//0
							{title : "TITULO"},  //1
							{title : "FECHA INICIO"},//2
							{title : "FECHA FIN"}, //3
							{title : "ESTADO"}, //4
							{title : "ID_TIPO_PERIODO"}, //5
							{title : "TIPO FRECUENCIA"}, //6
							{title : "INTERVALO"}, //7
							{title : "DIA HABIL"}, //8
							{title : "DIA FERIADO"},//9
							{
								"sName": "editarbtn",
								"title" : "Acciones", 
								"bSearchable": false,
								"sWidth": "70px",
								"bSortable": false,
								"mRender": function ( data, type, columns ) {									
									return '<a title="Editar" class="btn btn-primary btn-sm" onclick="openModalUpdatePeriodo(\'' + columns[0] + '\',\'' + columns[1] + '\',\'' + columns[2] + '\',\'' + columns[3] + '\',\'' + columns[5] + '\',\'' + columns[6] + '\',\'' + columns[7] + '\',\'' + columns[8] + '\',\'' + columns[9] + '\')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>&nbsp;&nbsp;' + 
										   '<a title="Eliminar" class="btn btn-danger btn-sm" onclick="openModalDeletePeriodo(\'' + columns[0] + '\')"><i class="fa fa-trash-o" aria-hidden="true"></i></a>';
								}
							}
						];
						setDataReportPeriodo(dataReporte, columnsReporte);
				});			
		});
	}
	
	function setDataReportPeriodo(pdataReporte, pcolumnsReporte){
		var htmlTableReportPeriodo = '<table id=\"tblReportePeriodo" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';		
		document.getElementById('tbcontainerPeriodos').innerHTML = htmlTableReportPeriodo;				
		if(typeof tableReporte === 'undefined'){			
		var tableReporte = $('#tblReportePeriodo').DataTable(
			{
				responsive: false, order: [[2, 'asc']], rowGroup: { dataSrc: 2},
				processing: false,
				language: {
					processing: "Procesando...",
					search: '<i class="fa fa-search fa-lg"/>',
					searchPlaceholder: "Buscar..."
				},
				serverSide : false,
				data: pdataReporte,
				columns: pcolumnsReporte,
				columnDefs: [
					{
		                "targets": [ 0 ],
		                "visible": false,
		                "searchable": false
		            },
		            {
		                "targets": [ 4 ],
		                "visible": false,
		                "searchable": false
		            },
		            {
		                "targets": [ 5 ],
		                "visible": false,
		                "searchable": false
		            },
		            {
		                "targets": [ 7 ],
		                "visible": false,
		                "searchable": false
		            },
		            {
		                "targets": [ 8 ],
		                "visible": false,
		                "searchable": false
		            },
		            {
		                "targets": [ 9 ],
		                "visible": false,
		                "searchable": false
		            }
					],
				dom: 'Bfrtip',
				lengthMenu : [
					[10, 25, 50, -1],
					['10 registros',
						'25 registros',
						'50 registros',
						'Mostrar todo']
				],
				buttons : [
					{
						extend : 'pageLength',
						text : '<i class="fa fa-list-ol" aria-hidden="true"></i> Mostrar',
					},
					{
						extend: "excel",
						exportOptions: {
							columns: [0,1,2,3,6]
						},
						className: "btn-sm",
						text : '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
					}
				],
				destroy : true				
			});	
		$('.dataTables_filter input').addClass('form-control-search-datatable');
    	}
    	else {
        	console.log('in else');	   
        	tableReporte.fnClearTable();
        	tableReporte.fnAddData(dataReporte);
        	tableReporte.fnAdjustColumnSizing();
  		  }
	}
	
	
	function listOptions(tipo, team) {
		$(document).ready(function() {
			var src = "ServletWOptions";
			$.post(src, {
				strOperation : "listOptions",
				strType : tipo,
				iTeam : team
			}, function(pdata) {
				var obj = JSON.parse(pdata);
				if (obj.reporte.length > 0) {
					if (tipo == "PERIODO_SCHEDULE") {
						$('#cboPeriodo option').remove();
						$('#cboPeriodo').append($('<option>', {
							value : '0',
							text : 'Seleccionar'
						}));
						$.each(obj.reporte, function(i, item) {
							$('#cboPeriodo').append($('<option>', {
								value : item.idOption,
								text :  item.descripcion
							}));
						});	
					}
				}
			});
		});
	}
	
	
	
   function openModalUpdatePeriodo(id_Periodo, titulo, fechaIni, fechaFin, id_TipoPeriodo, strTipoPeriodo, intervalo, dia_Habil, dia_Feriado)
	{	
		$(document).ready(function(){
			
			clearAll(); //Limpia todos los otros //+BG001
			$('#mdNuevoPeriodo').modal('show');
			document.getElementById('hdIdPeriodo').value = id_Periodo;
			document.getElementById('labelIDtituloactualizar').value = id_TipoPeriodo;
			$('#txtTitulo').val(titulo);
			$('#txtFechaIni').val(fechaIni);
			$('#txtIntervalo').val(intervalo);

			if(fechaFin == ""){
				
				document.getElementById("rbtFechaFinNunca").checked = true;
				document.getElementById("rbtFechaFin").checked = false;
				document.getElementById("rbtFechaFinRepeticiones").checked = false;
				
				document.getElementById("txtFechaFin").disabled = false;
				document.getElementById("txtFechaFin").value = "";
				document.getElementById("txtFechaFin").disabled = true;
				
				document.getElementById("txtFechaFinRepeticiones").disabled = false;
				document.getElementById("txtFechaFinRepeticiones").value = "";
				document.getElementById("txtFechaFinRepeticiones").disabled = true;
				
			}else if(fechaFin.length >= 8){
				
				document.getElementById("rbtFechaFinNunca").checked = false;
				document.getElementById("rbtFechaFin").checked = true;
				document.getElementById("rbtFechaFinRepeticiones").checked = false;
				
				document.getElementById("txtFechaFin").disabled = false;
				$('#txtFechaFin').val(fechaFin);	
				
				document.getElementById("txtFechaFinRepeticiones").disabled = false;
				document.getElementById("txtFechaFinRepeticiones").value = "";
				document.getElementById("txtFechaFinRepeticiones").disabled = true;
				
			}else if (fechaFin > 0){
				document.getElementById("rbtFechaFinNunca").checked = false;
				document.getElementById("rbtFechaFin").checked = false;
				document.getElementById("rbtFechaFinRepeticiones").checked = true;
				
				document.getElementById("txtFechaFin").disabled = false;
				document.getElementById("txtFechaFin").value = "";
				document.getElementById("txtFechaFin").disabled = true;
								
				document.getElementById("txtFechaFinRepeticiones").disabled = false;
				$('#txtFechaFinRepeticiones').val(fechaFin);
			}

			if(dia_Habil == 1){
				document.getElementById("chkDiaHabil").checked = true;
			}else{ document.getElementById("chkDiaHabil").checked = false; }
			if(dia_Feriado == 1){
				document.getElementById("chkDiaFeriado").checked = true;
			}else{ document.getElementById("chkDiaFeriado").checked = false; } 
	

			/* $('#txtDescripcion').removeClass('hidden');
			$('#txtDescripcion').addClass('hidden');  */
			$('#divDescripcion').removeClass('hidden');
			$('#divDescripcion').addClass('hidden'); 
			$('#btnGuardar').removeClass('hidden');
			$('#btnGuardar').addClass('hidden'); 
			$('#btnActualizar').removeClass('hidden');
			//BEGIN OF BG001
			if (strTipoPeriodo == "EXCLUSION") {
			  	document.getElementById("divTipo_Periodo").style.display = "block";
			  	document.getElementById("divExclude").style.display = 'block';
			  	document.getElementById("divRepetirCada").style.display = 'none';
			  	document.getElementById("divFiltrarDia_Anual").style.display = 'none';
			  	document.getElementById("divcombo").style.display = 'none';

			  	//Caso especial
				document.getElementById("divFechaInicio").className = "";
				document.getElementById("divFechaInicio").className = "col-sm-12 col-sm-12 col-md-12 col-lg-12 form-inline";
				//###
				$("#label").text('EXCLUSION(s)');
				$("#labeltituloactualizar").text('EXCLUSION');
				$("#labeltituloactualizar").val('EXCLUSION');
				mBuscarDatos_PeriodoExclusion(id_Periodo)
				validar();
			}
			//END OF BG001
			
			if (strTipoPeriodo == "DIA") {
				  document.getElementById("divcombo").style.display = "none";
				  document.getElementById("divTipo_Periodo").style.display = "block";
				  document.getElementById("divSeleccionarSemana").style.display = 'none';
				  document.getElementById("divSeleccionarMes").style.display = 'none';
				  document.getElementById("divSeleccionarDiadelMes").style.display = 'none';
				  document.getElementById("divTermina_Anual").style.display = 'block';
				  $("#label").text('Dia(s)');
				  $("#labeltituloactualizar").text('DIA');
				  $("#labeltituloactualizar").val('DIA');
				  validar();
				 	
			  }
			  if (strTipoPeriodo == "SEMANA") {
				  document.getElementById("divcombo").style.display = "none";
				  document.getElementById("divTipo_Periodo").style.display = "block";
				  document.getElementById("divSeleccionarSemana").style.display = 'block';
				  document.getElementById("divSeleccionarMes").style.display = 'none';
				  document.getElementById("divSeleccionarDiadelMes").style.display = 'none';
				  $("#label").text('Semana(s)');
				  $("#labeltituloactualizar").text('SEMANA');
				  $("#labeltituloactualizar").val('SEMANA');
				  mBuscarDatos_PeriodoDet_Semana(id_Periodo);
				  validar();
				  				  
			  }
			  if (strTipoPeriodo == "MES") {
				  document.getElementById("divcombo").style.display = "none";
				  document.getElementById("divTipo_Periodo").style.display = "block";
				  document.getElementById("divSeleccionarSemana").style.display = 'none'; 
				  document.getElementById("divSeleccionarMes").style.display = 'none';
				  document.getElementById("divRbtPrincipal").style.display = 'block';
				  document.getElementById("divSeleccionarDiadelMes").style.display = 'block';
				  $("#label").text('Mes(es)');
				  $("#labeltituloactualizar").text('MES');
				  $("#labeltituloactualizar").val('MES');
				  mBuscarDatos_PeriodoDet_MensualAnual(id_Periodo);
				  validar();
				  
			  }
			  if (strTipoPeriodo == "AÑO") {
				  document.getElementById("divcombo").style.display = "none";
				  document.getElementById("divTipo_Periodo").style.display = "block";
				  document.getElementById("divSeleccionarSemana").style.display = 'none'; 
				  document.getElementById("divSeleccionarMes").style.display = 'block';
				  document.getElementById("divRbtPrincipal").style.display = 'block';
				  document.getElementById("divSeleccionarDiadelMes").style.display = 'block';
				  $("#label").text('Año(s)');
				  $("#labeltituloactualizar").text('AÑO');
				  $("#labeltituloactualizar").val('AÑO');
				  mBuscarDatos_PeriodoDet_MensualAnual(id_Periodo);
				  validar();				  
			  }			
			  validar();mostrarantesydespues();
		});
	}
	
	function mBuscarDatos_PeriodoExclusion(id_periodo) {
		$(document).ready(function() {
			var src = "ServletPeriodo";
			$.post(src, {
				strAccion: '5',
				strIdPeriodo: id_periodo
			},
			function(pdata) {
				var obj = JSON.parse(pdata);
				console.log(obj);
				var value = obj.ListaDatosPeriodoDet[0].id_periodo;
				if (value != "" && value != null ) {
					var arr = [];
					var periodoPrincipal = null;
					for (var i = 0; i < obj.ListaDatosPeriodoDet.length; i++) {
						if (obj.ListaDatosPeriodoDet[i].dia_especial == 1) { 	   //Periodo Principal
							periodoPrincipal = obj.ListaDatosPeriodoDet[i].ordinales
						}else if (obj.ListaDatosPeriodoDet[i].dia_especial == 2) { //Periodo Excluido
							arr.push(obj.ListaDatosPeriodoDet[i].ordinales);
						}
					}
  					$('#cboPeriodoPrincipal').val(periodoPrincipal);
  					$('#cboPeriodoPrincipal').trigger('change');
  					
  					$("#cboPeriodoExclude").select2();
  					$('#cboPeriodoExclude').val(arr);
  					$('#cboPeriodoExclude').trigger('change');
				}
			})
		})
	}
	
	function mBuscarDatos_PeriodoDet_Semana(id_Periodo){
		$(document).ready(function(){
			var src = "ServletPeriodo";		
			$.post(src, {
						strAccion : '5',	
						strIdPeriodo : id_Periodo
						},
					function(pdata){
							var obj = JSON.parse(pdata);
			 	  			if(obj.ListaDatosPeriodoDet[0].dia_nombre != ""){	
			 	  				var arr = [];			 	  			    
			 	  				for(i = 0; i < obj.ListaDatosPeriodoDet.length; i++){ 
			 	  					arr.push(obj.ListaDatosPeriodoDet[i].dia_nombre);
			 	  				}
			 	  				$("#selectDias").select2();
		 	  					$('#selectDias').val(arr);
		 	  					$('#selectDias').trigger('change');
			 	  			}
					});
		});       
	}
	
	function mBuscarDatos_PeriodoDet_MensualAnual(id_Periodo){
		$(document).ready(function(){
			var src = "ServletPeriodo";		
			$.post(src, {
						strAccion : '5',	
						strIdPeriodo : id_Periodo
						},
					function(pdata){
							var obj = JSON.parse(pdata);

							if(obj.ListaDatosPeriodoDet[0].mes_nombre != null){
								var arr = [];			 	  			    
			 	  				for(i = 0; i < obj.ListaDatosPeriodoDet.length; i++){ 
			 	  					arr.push(obj.ListaDatosPeriodoDet[i].mes_nombre);
			 	  				}
			 	  				$("#selectMes").select2();
		 	  					$('#selectMes').val(arr);
		 	  					$('#selectMes').trigger('change');
							}

			 	  			if(obj.ListaDatosPeriodoDet[0].dia_numero != 0 ){
 	  							document.getElementById('rbtnelegirmes').checked = true;
 	  							mostrarSeleccionDia('divSeleccionarDia');
			 	  				var arr = [];	
			 	  				acumuladorDias = "";
			 	  				//Limpiamos los anteriormente seleccionados
			 	  				limpiarBtnDias();
			 	  				for(i = 0; i < obj.ListaDatosPeriodoDet.length; i++){ 
			 	  					/* arr.push(obj.ListaDatosPeriodoDet[i].dia_nombre); */	
			 	  				    for(j = 1; j <= 31; j++){
			 	  				    	
			 	  						if(document.getElementById('btnDia_'+ j +'').innerText == obj.ListaDatosPeriodoDet[i].dia_numero){
			 	  							document.getElementById('btnDia_'+ j +'').style.backgroundColor = "blue";
			 	  							document.getElementById('btnDia_'+ j +'').style.fontWeight = "bold";
			 	  							document.getElementById('btnDia_'+ j +'').style.color = "white";
			 	  							document.getElementById('btnDia_'+ j +'').value = true;
			 	  							
			 	  							acumuladorDias += obj.ListaDatosPeriodoDet[i].dia_numero + ",";
			 	  						}
			 	  					} 
			 	  				    console.log("Llena los datos de los dias seleccionados");
			 	  					console.log("acumuladorDias: "+acumuladorDias);
			 	  				}			 	  			
			 	  			}else{
			 	  				
			 	  				document.getElementById('rbtnelegirpersonalizado').checked = true;
			 	  				mostrarSeleccionDia('divSeleccionarDiaPersonalizado');
								//Limpia los campos de Antes y Despues
								document.getElementById('rbtDiaAntes').checked = false;
		 	  					document.getElementById('txtDiaAntes').value = "";
		 	  					document.getElementById('rbtDiaDespues').checked = false;
		 	  					document.getElementById('txtDiaDespues').value = "";
		 	  					mostrarantesydespues();
			 	  				if(obj.ListaDatosPeriodoDet[0].dia_tiempo_nombre == 'ANTES'){
			 	  					document.getElementById('rbtDiaAntes').checked = true;
			 	  					document.getElementById('txtDiaAntes').value = obj.ListaDatosPeriodoDet[0].dia_tiempo_numero;
			 	  					mostrarantesydespues();
			 	  				}else if(obj.ListaDatosPeriodoDet[0].dia_tiempo_nombre == 'DESPUES'){
			 	  					document.getElementById('rbtDiaDespues').checked = true;
			 	  					document.getElementById('txtDiaDespues').value = obj.ListaDatosPeriodoDet[0].dia_tiempo_numero;
			 	  					mostrarantesydespues();
			 	  				}
			 	  				
			 	  				$('#cboOrdinales').val( obj.ListaDatosPeriodoDet[0].ordinales );
			 	  				$('#cboOrdinales').trigger('change'); 

			 	  				
			 	  				if(obj.ListaDatosPeriodoDet[0].semana == 1){
			 	  					document.getElementById('chkSemanal').checked = true;	
			 	  				}else{
			 	  					document.getElementById('chkSemanal').checked = false;
			 	  				}
			 	  				
								
			 	  				if(obj.ListaDatosPeriodoDet[0].dia_nombre != null && obj.ListaDatosPeriodoDet[0].dia_especial == 0){
			 	  					
				 	  				for(i = 0; i < obj.ListaDatosPeriodoDet.length; i++){ 
				 	  					if(document.getElementById('chkLunes').value == obj.ListaDatosPeriodoDet[i].dia_nombre){
				 	  						document.getElementById('chkLunes').checked	= true;
				 	  					}else if(document.getElementById('chkMartes').value == obj.ListaDatosPeriodoDet[i].dia_nombre){
				 	  						document.getElementById('chkMartes').checked = true;
				 	  					}else if(document.getElementById('chkMiercoles').value == obj.ListaDatosPeriodoDet[i].dia_nombre){
				 	  						document.getElementById('chkMiercoles').checked	= true;
				 	  					}else if(document.getElementById('chkJueves').value == obj.ListaDatosPeriodoDet[i].dia_nombre){
				 	  						document.getElementById('chkJueves').checked = true;
				 	  					}else if(document.getElementById('chkViernes').value == obj.ListaDatosPeriodoDet[i].dia_nombre){
				 	  						document.getElementById('chkViernes').checked = true;
				 	  					}else if(document.getElementById('chkSabado').value == obj.ListaDatosPeriodoDet[i].dia_nombre){
				 	  						document.getElementById('chkSabado').checked = true;
				 	  					}else if(document.getElementById('chkDomingo').value == obj.ListaDatosPeriodoDet[i].dia_nombre){
				 	  						document.getElementById('chkDomingo').checked = true;
				 	  					}else if(document.getElementById('chkDia').value == obj.ListaDatosPeriodoDet[i].dia_nombre){
				 	  						document.getElementById('chkDia').checked = true;
				 	  					}				 	  					
				 	  				}
				 	  				
				 	  			    mostrarCheckSem2();
				 	  				mostrarDivDiaTexto2();
				 	  			} 
				 	  			if(obj.ListaDatosPeriodoDet[0].dia_especial > 0){
				 	  				for(i = 0; i < obj.ListaDatosPeriodoDet.length; i++){
				 	  					if(document.getElementById('chk1erDia').value == obj.ListaDatosPeriodoDet[i].dia_especial){
				 	  						document.getElementById('chk1erDia').checked = true;
				 	  					}else if(document.getElementById('chk2erDia').value == obj.ListaDatosPeriodoDet[i].dia_especial){
				 	  						document.getElementById('chk2erDia').checked = true;
				 	  					}else if(document.getElementById('chk3erDia').value == obj.ListaDatosPeriodoDet[i].dia_especial){
				 	  						document.getElementById('chk3erDia').checked	= true;
				 	  					}else if(document.getElementById('chk4erDia').value == obj.ListaDatosPeriodoDet[i].dia_especial){
				 	  						document.getElementById('chk4erDia').checked = true;
				 	  					}else if(document.getElementById('chk5erDia').value == obj.ListaDatosPeriodoDet[i].dia_especial){
				 	  						document.getElementById('chk5erDia').checked = true;
				 	  					}else if(document.getElementById('chk6erDia').value == obj.ListaDatosPeriodoDet[i].dia_especial){
				 	  						document.getElementById('chk6erDia').checked = true;
				 	  					}else if(document.getElementById('chk7erDia').value == obj.ListaDatosPeriodoDet[i].dia_especial){
				 	  						document.getElementById('chk7erDia').checked = true;
				 	  					}				 	  					
				 	  				}
				 	  				mostrarCheckSem2();
				 	  				mostrarDivDiaNumero2();
				 	  			}

			 	  			}
					});
		});       
	}
	
	
	function openModalNuevoPerfilDet(){	
	
		$('#divDescripcion').addClass('hidden'); 
		$('#divDescripcion').removeClass('hidden');
		
		$('#btnActualizar').removeClass('hidden');
		$('#btnActualizar').addClass('hidden');
		$('#btnGuardar').removeClass('hidden');
		document.getElementById("txtFechaFin").value = "";
		
		$('#cboPeriodo').val('0').trigger('change.select2');
		 
		$('#mdNuevoPeriodo').modal('show');	
		$("#h4").text('Registrar Periodo');
		document.getElementById("divcombo").style.display = "block";
		 
		document.getElementById("labeltituloactualizar").style.display = "none"; 	
		document.getElementById("divTipo_Periodo").style.display = "none"; 	
		
		acum_selectDias = "";
		acum_selectMes = "";
		acumuladordiasp = "";
		acumuladordiasp2 = "";
		acumuladorDias = "";
		acumOrdinales = "";
		valuesem="";
		
		limpiartodo();
		validar();
		limpiarRBT();
		mostrarantesydespues();
	}

	
	function openModalDeletePeriodo(idPeriodo){
		$(document).ready(function(){
			$('#mdPreguntaPeriodo').modal('show');
			 document.getElementById('hdIdPeriodo').value = idPeriodo;
		});
	}	
	
	function mEliminar(){
		$(document).ready(function(){
			var src = "ServletPeriodo";		
			$.post(src, {
						strAccion : '4',	
						strIdPeriodo : document.getElementById('hdIdPeriodo').value
						},
					function(pdata){
							if(pdata == "ok" ){
			 	  				listReportPeriodo();
								$('#mdPreguntaPeriodo').modal('hide');	
			 	  			}
							else{
								$('#mdPreguntaPeriodo').modal('hide');
								$('#lblMessage').text('Hubo un problema al procesar, no se elimino el periodo, por favor vuelva a intentarlo.');
							}	
					});
			});       
	}
	
	
	
function customValidText(id){
	var item = document.getElementById(id);
	if (item.value != "") {
		item.style.borderColor = "initial";
		return true;
	}else{
		item.style.borderColor = "red";
		return false;
	}
}

function customValidCombo(id){
	var item = document.getElementById(id);
	if (item.value != "") {
		item.style.borderColor = "initial";
		return true;
	}else{
		item.style.borderColor = "red";
		return false;
	}
}

function customValidCheck(id){
	var item = document.getElementById(id);
	return item.checked;
}
	
function validar(){	
		var combo = document.getElementById("cboPeriodo");
		var selected = combo.options[combo.selectedIndex].text; 
		var label = document.getElementById("label").text;
		
		//BEGIN OF BG002
		if (selected == "EXCLUSION") {
			var valid = false;	//Indica el valor boolean de si el form es válido o no
			//Valores para el texto
			var txtTitulo = document.getElementById("txtTitulo");
			var txtFechaIni = document.getElementById("txtFechaIni");
			//Limpia los valores iniciales
			document.getElementById("txtFechaFin").style.borderColor = "initial";
			document.getElementById("txtFechaFinRepeticiones").style.borderColor = "initial";
		    //Validar colores
		    var bTitulo = customValidText("txtTitulo");
		    var bFechaIni = customValidText("txtFechaIni");
		    var bRBT = false;
		    var bPeriodoExclude = false;
		    var bPeriodoExclude = customValidCombo("cboPeriodoExclude");
		    var bPeriodoPrincipal = customValidCombo("cboPeriodoPrincipal");
		    
		    //Validar los radio button de la fecha fin
		    if (customValidCheck("rbtFechaFinNunca")) {
		    	var bRBT = true;
			}else if (customValidCheck("rbtFechaFin")) {
				var bRBT = customValidText("txtFechaFin");
			}else if (customValidCheck("rbtFechaFinRepeticiones")) {
				var bRBT = customValidText("txtFechaFinRepeticiones");
			}
		    
		    if(bTitulo && bFechaIni && bRBT && bPeriodoPrincipal && bPeriodoExclude){
				$('#btnGuardar').removeClass('disabled');	
				$('#btnActualizar').removeClass('disabled');	
			}else{
				$('#btnGuardar').removeClass('disabled');
				$('#btnGuardar').addClass('disabled');
				$('#btnActualizar').removeClass('disabled');
				$('#btnActualizar').addClass('disabled');
			}
		    
		}
		//END OF BG002
		
		  if (selected == "DIA") {
			  var txtTitulo = document.getElementById("txtTitulo");
			  var txtFechaIni = document.getElementById("txtFechaIni");
			  var txtIntervalo = document.getElementById("txtIntervalo");
			  
			  var rbtFechaFinNunca = document.getElementById("rbtFechaFinNunca").checked;
			  var rbtFechaFin = document.getElementById("rbtFechaFin").checked;
			  var txtFechaFin = document.getElementById("txtFechaFin").value;			  
			  var rbtFechaFinRepeticiones = document.getElementById("rbtFechaFinRepeticiones").checked;
			  var txtFechaFinRepeticiones = document.getElementById("txtFechaFinRepeticiones").value;

			  txtTitulo.style.borderColor = "red";
			  txtFechaIni.style.borderColor = "red";
			  txtIntervalo.style.borderColor = "red";			

			  if(txtTitulo.value != ""){
				  txtTitulo.style.borderColor = "initial";
			  }else{ txtTitulo.style.borderColor = "red"; }
			  if(txtFechaIni.value != ""){
				  txtFechaIni.style.borderColor = "initial";
			  }else{ txtFechaIni.style.borderColor = "red"; }
			  if(txtIntervalo.value != ""){
				  txtIntervalo.style.borderColor = "initial";
			  }else{ txtIntervalo.style.borderColor = "red"; }

			  if(txtTitulo.value != "" && txtFechaIni.value != "" && txtIntervalo.value != "" && (rbtFechaFinNunca == true || rbtFechaFin == true || rbtFechaFinRepeticiones == true) &&(rbtFechaFinNunca == true || txtFechaFin != "" || txtFechaFinRepeticiones > 0)){			  
			      $('#btnGuardar').removeClass('disabled');	
			      $('#btnActualizar').removeClass('disabled');	
			  }else{			  
				  $('#btnGuardar').removeClass('disabled');
				  $('#btnGuardar').addClass('disabled');
				  $('#btnActualizar').removeClass('disabled');
				  $('#btnActualizar').addClass('disabled');
			  }	  
			}	
		  
		  if (selected == "SEMANA") {		  
			  var txtTitulo = document.getElementById("txtTitulo");
			  var txtFechaIni = document.getElementById("txtFechaIni");
			  var txtIntervalo = document.getElementById("txtIntervalo");			  
			  var selectDias = document.getElementById("selectDias");	
			  
			  var rbtFechaFinNunca = document.getElementById("rbtFechaFinNunca").checked;
			  var rbtFechaFin = document.getElementById("rbtFechaFin").checked;
			  var txtFechaFin = document.getElementById("txtFechaFin").value;			  
			  var rbtFechaFinRepeticiones = document.getElementById("rbtFechaFinRepeticiones").checked;
			  var txtFechaFinRepeticiones = document.getElementById("txtFechaFinRepeticiones").value;

			  txtTitulo.style.borderColor = "red";
			  txtFechaIni.style.borderColor = "red";
			  txtIntervalo.style.borderColor = "red";

			  if(txtTitulo.value != ""){
				  txtTitulo.style.borderColor = "initial";
			  }else{ txtTitulo.style.borderColor = "red"; }
			  if(txtFechaIni.value != ""){
				  txtFechaIni.style.borderColor = "initial";
			  }else{ txtFechaIni.style.borderColor = "red"; }
			  if(txtIntervalo.value != ""){
				  txtIntervalo.style.borderColor = "initial";
			  }else{ txtIntervalo.style.borderColor = "red"; }

			  if(txtTitulo.value != "" && txtFechaIni.value != "" && txtIntervalo.value != "" && selectDias.value != "" && (rbtFechaFinNunca == true || rbtFechaFin == true || rbtFechaFinRepeticiones == true) && (rbtFechaFinNunca == true || txtFechaFin != "" || txtFechaFinRepeticiones > 0)){			  
			      $('#btnGuardar').removeClass('disabled');	
			      $('#btnActualizar').removeClass('disabled');	
			  }else{			  
				  $('#btnGuardar').removeClass('disabled');
				  $('#btnGuardar').addClass('disabled');
				  $('#btnActualizar').removeClass('disabled');
				  $('#btnActualizar').addClass('disabled');
			  }	  		  
		  }
		  
		  
		  if (selected == "MES") {		  
			  var txtTitulo = document.getElementById("txtTitulo");
			  var txtFechaIni = document.getElementById("txtFechaIni");
			  var txtIntervalo = document.getElementById("txtIntervalo");			  
			  var selectDias = document.getElementById("selectDias");	
			  var rbtnelegirmes = document.getElementById("rbtnelegirmes").checked;	
			  var rbtnelegirpersonalizado = document.getElementById("rbtnelegirpersonalizado").checked;	
			  var cboOrdinales = document.getElementById("cboOrdinales").value;
			  
			  
			  var rbtFechaFinNunca = document.getElementById("rbtFechaFinNunca").checked;
			  var rbtFechaFin = document.getElementById("rbtFechaFin").checked;
			  var txtFechaFin = document.getElementById("txtFechaFin").value;			  
			  var rbtFechaFinRepeticiones = document.getElementById("rbtFechaFinRepeticiones").checked;
			  var txtFechaFinRepeticiones = document.getElementById("txtFechaFinRepeticiones").value;
			  
			  
			  var chkDomingo = document.getElementById("chkDomingo").checked;
			  var chkLunes = document.getElementById("chkLunes").checked;
			  var chkMartes = document.getElementById("chkMartes").checked;
			  var chkMiercoles = document.getElementById("chkMiercoles").checked;
			  var chkJueves = document.getElementById("chkJueves").checked;
			  var chkViernes = document.getElementById("chkViernes").checked;
			  var chkSabado = document.getElementById("chkSabado").checked;
			  var chkDia = document.getElementById("chkDia").checked;
			  
			  
			  var chk1erDia = document.getElementById("chk1erDia").checked;
			  var chk2erDia = document.getElementById("chk2erDia").checked;
			  var chk3erDia = document.getElementById("chk3erDia").checked;
			  var chk4erDia = document.getElementById("chk4erDia").checked;
			  var chk5erDia = document.getElementById("chk5erDia").checked;
			  var chk6erDia = document.getElementById("chk6erDia").checked;
			  var chk7erDia = document.getElementById("chk7erDia").checked;			  

			  txtTitulo.style.borderColor = "red";
			  txtFechaIni.style.borderColor = "red";
			  txtIntervalo.style.borderColor = "red";

			  if(txtTitulo.value != ""){
				  txtTitulo.style.borderColor = "initial";
			  }else{ txtTitulo.style.borderColor = "red"; }
			  if(txtFechaIni.value != ""){
				  txtFechaIni.style.borderColor = "initial";
			  }else{ txtFechaIni.style.borderColor = "red"; }
			  if(txtIntervalo.value != ""){
				  txtIntervalo.style.borderColor = "initial";
			  }else{ txtIntervalo.style.borderColor = "red"; }

			  
			  if(txtTitulo.value != "" && 
			    txtFechaIni.value != "" &&
			    txtIntervalo.value != "" && 
			    ((rbtnelegirmes == true && acumuladorDias != "") || ( rbtnelegirpersonalizado == true && cboOrdinales != 0 &&    (chkDomingo == true ||
																																  chkLunes == true ||
																																  chkMartes == true ||
																																  chkMiercoles == true ||
																																  chkJueves == true ||
																																  chkViernes == true ||
																																  chkSabado == true ||
																																  chkDia == true ||
																																 
																																  chk1erDia == true ||
																																  chk2erDia == true ||
																																  chk3erDia == true ||
																																  chk4erDia == true ||
																																  chk5erDia == true ||
																																  chk6erDia == true ||
																																  chk7erDia == true ))


				) && 
																		 
				(rbtFechaFinNunca == true || rbtFechaFin == true || rbtFechaFinRepeticiones == true) && 
				(rbtFechaFinNunca == true || txtFechaFin != "" || txtFechaFinRepeticiones > 0)){	
				  
				  
				  
			      $('#btnGuardar').removeClass('disabled');	
			      $('#btnActualizar').removeClass('disabled');	
			  }else{			  
				  $('#btnGuardar').removeClass('disabled');
				  $('#btnGuardar').addClass('disabled');
				  $('#btnActualizar').removeClass('disabled');
				  $('#btnActualizar').addClass('disabled');
			  }	  		  
		  }
		  
		
		  if (selected == "AÑO") {		  
			  var txtTitulo = document.getElementById("txtTitulo");
			  var txtFechaIni = document.getElementById("txtFechaIni");
			  var txtIntervalo = document.getElementById("txtIntervalo");			  
			  var selectMes = document.getElementById("selectMes");	
			  var rbtnelegirmes = document.getElementById("rbtnelegirmes").checked;	
			  var rbtnelegirpersonalizado = document.getElementById("rbtnelegirpersonalizado").checked;	
			  var cboOrdinales = document.getElementById("cboOrdinales").value;
			  
			  
			  var rbtFechaFinNunca = document.getElementById("rbtFechaFinNunca").checked;
			  var rbtFechaFin = document.getElementById("rbtFechaFin").checked;
			  var txtFechaFin = document.getElementById("txtFechaFin").value;			  
			  var rbtFechaFinRepeticiones = document.getElementById("rbtFechaFinRepeticiones").checked;
			  var txtFechaFinRepeticiones = document.getElementById("txtFechaFinRepeticiones").value;
			  
			  
			  
			  var chkDomingo = document.getElementById("chkDomingo").checked;
			  var chkLunes = document.getElementById("chkLunes").checked;
			  var chkMartes = document.getElementById("chkMartes").checked;
			  var chkMiercoles = document.getElementById("chkMiercoles").checked;
			  var chkJueves = document.getElementById("chkJueves").checked;
			  var chkViernes = document.getElementById("chkViernes").checked;
			  var chkSabado = document.getElementById("chkSabado").checked;
			  var chkDia = document.getElementById("chkDia").checked;
			  
			  
			  var chk1erDia = document.getElementById("chk1erDia").checked;
			  var chk2erDia = document.getElementById("chk2erDia").checked;
			  var chk3erDia = document.getElementById("chk3erDia").checked;
			  var chk4erDia = document.getElementById("chk4erDia").checked;
			  var chk5erDia = document.getElementById("chk5erDia").checked;
			  var chk6erDia = document.getElementById("chk6erDia").checked;
			  var chk7erDia = document.getElementById("chk7erDia").checked;
			  
			  
			  

			  txtTitulo.style.borderColor = "red";
			  txtFechaIni.style.borderColor = "red";
			  txtIntervalo.style.borderColor = "red";

			  if(txtTitulo.value != ""){
				  txtTitulo.style.borderColor = "initial";
			  }else{ txtTitulo.style.borderColor = "red"; }
			  if(txtFechaIni.value != ""){
				  txtFechaIni.style.borderColor = "initial";
			  }else{ txtFechaIni.style.borderColor = "red"; }
			  if(txtIntervalo.value != ""){
				  txtIntervalo.style.borderColor = "initial";
			  }else{ txtIntervalo.style.borderColor = "red"; }

			  if(txtTitulo.value != "" &&
					  txtFechaIni.value != "" &&
					  txtIntervalo.value != "" &&
					  selectMes.value != "" &&
					  ((rbtnelegirmes == true && acumuladorDias != "") || ( rbtnelegirpersonalizado == true && cboOrdinales != 0 &&  (chkDomingo == true ||
																				    		  										  chkLunes == true ||
																				    		  										  chkMartes == true ||
																				    		  										  chkMiercoles == true ||
																				    		  										  chkJueves == true ||
																				    		  										  chkViernes == true ||
																				    		  										  chkSabado == true ||
																				    		  										  chkDia == true ||
																				    		  										 
																				    		  										  chk1erDia == true ||
																				    		  										  chk2erDia == true ||
																				    		  										  chk3erDia == true ||
																				    		  										  chk4erDia == true ||
																				    		  										  chk5erDia == true ||
																				    		  										  chk6erDia == true ||
																				    		  										  chk7erDia == true ))
						    		  										 
					  
					  ) && 
			    		  										 
			    		  										 
						    (rbtFechaFinNunca == true || rbtFechaFin == true || rbtFechaFinRepeticiones == true) && 
						    (rbtFechaFinNunca == true || txtFechaFin != "" || txtFechaFinRepeticiones > 0)){			  
			      $('#btnGuardar').removeClass('disabled');	
			      $('#btnActualizar').removeClass('disabled');	
			  }else{			  
				  $('#btnGuardar').removeClass('disabled');
				  $('#btnGuardar').addClass('disabled');
				  $('#btnActualizar').removeClass('disabled');
				  $('#btnActualizar').addClass('disabled');
			  }	  		  
		  }
		  
		  
		  
	/* final */}
		
	
    $(document).ready(function() {
        $("form").keypress(function(e) {
            if (e.which == 13) {
                return false;
            }
        });
    });
	
/* function validarOrden(e) {
  tecla = (document.all) ? e.keyCode : e.which;
  if (tecla==13) return true;   
  patron = /\d/; 
  te = String.fromCharCode(tecla);
  return patron.test(te); 
}  */

function validarintervalo(e) {	   
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla==8) return false; //Tecla de retroceso (para poder borrar)
    if (tecla==44) return false; //Coma ( En este caso para diferenciar los decimales )
    if (tecla==48) return true;
    if (tecla==49) return true;
    if (tecla==50) return true;
    if (tecla==51) return true;
    if (tecla==52) return true;
    if (tecla==53) return true;
    if (tecla==54) return true;
    if (tecla==55) return true;
    if (tecla==56) return true;
    patron = /1/; //ver nota
    te = String.fromCharCode(tecla);
    return patron.test(te);
} 


function llenartxtdescripcion(){
	
	var combo = document.getElementById("cboPeriodo");
	var selected = combo.options[combo.selectedIndex].text; 
	var label = document.getElementById("label").text;
		
		//BEGIN OF BG002
		if (selected == "EXCLUSION") {
			var periodoExclude = acum_periodoExclude;
			var periodoPrincipal = document.getElementById("cboPeriodoPrincipal").text;
			
			var bFechaNunca = document.getElementById("rbtFechaFinNunca").checked;
			var bFechaFin = document.getElementById("rbtFechaFin").checked;
			var bRepeticion = document.getElementById("rbtFechaFinRepeticiones").checked;	
			
			var text = 	'El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
						'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						'Con el periodo principal: '+ $("#cboPeriodoPrincipal option:selected").text() +'\n'+
						'Excluyendo a: '+ acum_excludeName +'\n'+
						'Termina';
						
			if (bFechaNunca) {
				text = text + ": NUNCA";
			}else if (bFechaFin) {
				text = text + 'en: '+document.getElementById("txtFechaFin").value;
			}else if (bRepeticion) {
				text = text + ': Despues de ' + document.getElementById("txtFechaFinRepeticiones").value + 'repeticiones.';
			}
			$('#txtDescripcion').val(text);
			
		}
		//END OF BG002
	
		 if (selected == "DIA") {
			 
			 var text1 = document.getElementById("txtTitulo").value;
			 var text2 = document.getElementById("txtFechaIni").value;
			 var text3 = document.getElementById("txtIntervalo").value;
			 var label = document.getElementById("label").text;
			 
				if(text1 != ""){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										 'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
										 'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
										 'Termina  :');
				}	
		 }

		 if (selected == "SEMANA") {
			 
			 var text1 = document.getElementById("txtTitulo").value;
			 var text2 = document.getElementById("txtFechaIni").value;
			 var text3 = document.getElementById("txtIntervalo").value;
			 var text4 = document.getElementById("selectDias").value;
			 
			 var label = document.getElementById("label").text;
			 
				if(text1 != ""){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										 'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
										 'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
										 'Los Dias :' +acum_selectDias+'\n'+
										 'Termina  :');
				}	 			
		 }
		 
		 if (selected == "MES") {
			 
			 var text1 = document.getElementById("txtTitulo").value;
		 var text2 = document.getElementById("txtFechaIni").value;
		 var text3 = document.getElementById("txtIntervalo").value;
		
		 var label = document.getElementById("label").text;
		 
			if(text1 != ""){
			$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
									 'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
									 'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
									 'El :'+acumOrdinales+valuesem+acumuladorDias+acumuladordiasp+acumuladordiasp2+'\n'+
									 'Termina :');
			}	
			
		 }
		 
		 if (selected == "AÑO") { 			
			 
			 var text1 = document.getElementById("txtTitulo").value;
			 var text2 = document.getElementById("txtFechaIni").value;
			 var text3 = document.getElementById("txtIntervalo").value;
			 var text4 = document.getElementById("selectMes").value;
			 
			 var label = document.getElementById("label").text;
			 
				if(text1 != ""){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										 'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
										 'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
										 'Los Meses :' +acum_selectMes +'\n'+
										 'El :'+acumOrdinales+valuesem+acumuladorDias+acumuladordiasp+acumuladordiasp2+'\n'+
										 'Termina  :');
				}	
		 }
}



function descripcionTermina(){

var combo = document.getElementById("cboPeriodo");
var selected = combo.options[combo.selectedIndex].text; 
var label = document.getElementById("label").text;
	
	 if (selected == "DIA") {

		var label = document.getElementById("label").text;	
		var text4 = document.getElementById("rbtFechaFinNunca").checked;
		var text5 = document.getElementById("rbtFechaFin").checked;
		var text6 = document.getElementById("rbtFechaFinRepeticiones").checked;		
		var text7 = document.getElementById("chkDiaHabil").checked;
		var text8 = document.getElementById("chkDiaFeriado").checked;
		
		
		if(text4 == true && text7 == true && text8 == true){
			$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
									'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
					 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
									'Termina :Nunca'+'\n'+								
									'Todos los dias Habiles y Feriados'+'\n')
		}else if(text5 == true && text7 == true && text8 == true){
		$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
								'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
				 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
				 				'Termina el :'+document.getElementById("txtFechaFin").value+'\n'+								
								'Todos los dias Habiles y Feriados'+'\n')
		}else if(text6 == true && text7 == true && text8 == true){
		$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
								'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
								'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
								'Termina despues de  :'+document.getElementById("txtFechaFinRepeticiones").value+' Repeticiones'+'\n'+								
								'Todos los dias Habiles y Feriados'+'\n')
		}
		
		else if(text4 == true && text7 == true){
			$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
									'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
					 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
									'Termina :Nunca'+'\n'+									
									'Todos los dias Habiles'+'\n')
		}else if(text4 == true && text8 == true){
			$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
									'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
					 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
									'Termina :Nunca'+'\n'+
									'Todos los dias Feriados'+'\n')
		}else if(text5 == true && text7 == true){
			$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
									'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
					 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
					 				'Termina el :'+document.getElementById("txtFechaFin").value+'\n'+									
									'Todos los dias Habiles'+'\n')
		}else if(text5 == true && text8 == true){
			$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
									'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
					 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
					 				'Termina el :'+document.getElementById("txtFechaFin").value+'\n'+
									'Todos los dias Feriados'+'\n')
		}else if(text6 == true && text7 == true){
			$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
									'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
									'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
									'Termina despues de  :'+document.getElementById("txtFechaFinRepeticiones").value+' Repeticiones'+'\n'+									
									'Todos los dias Habiles'+'\n')
		}else if(text6 == true && text8 == true){
			$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
									'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
									'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
									'Termina despues de  :'+document.getElementById("txtFechaFinRepeticiones").value+' Repeticiones'+'\n'+
									'Todos los dias Feriados'+'\n')
		}
		
		else if(text4 == true){		
			$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
				 					'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
					 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
									'Termina :Nunca'+'\n')
		}else if(text5 == true){
			$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
									'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
					 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
								    'Termina el :'+document.getElementById("txtFechaFin").value+'\n')		
		}else if(text6 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
										'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
										'Termina despues de  :'+document.getElementById("txtFechaFinRepeticiones").value+' Repeticiones'+'\n')		
		}
	 }
	 
	 
	 if (selected == "SEMANA") {
		 
			var label = document.getElementById("label").text;	
			var text4 = document.getElementById("rbtFechaFinNunca").checked;
			var text5 = document.getElementById("rbtFechaFin").checked;
			var text6 = document.getElementById("rbtFechaFinRepeticiones").checked;
			
			var text7 = document.getElementById("chkDiaHabil").checked;
			var text8 = document.getElementById("chkDiaFeriado").checked;
			
			
			if(text4 == true && text7 == true && text8 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
						 				'Los Dias :' +acum_selectDias+'\n'+
										'Termina :Nunca'+'\n'+								
										'Todos los dias Habiles y Feriados'+'\n')
			}else if(text5 == true && text7 == true && text8 == true){
			$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
									'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
					 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
					 				'Los Dias :' +acum_selectDias+'\n'+
					 				'Termina el :'+document.getElementById("txtFechaFin").value+'\n'+								
									'Todos los dias Habiles y Feriados'+'\n')
			}else if(text6 == true && text7 == true && text8 == true){
			$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
									'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
									'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
									'Los Dias :' +acum_selectDias+'\n'+
									'Termina despues de  :'+document.getElementById("txtFechaFinRepeticiones").value+' Repeticiones'+'\n'+								
									'Todos los dias Habiles y Feriados'+'\n')
			}
			
			else if(text4 == true && text7 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
						 				'Los Dias :' +acum_selectDias+'\n'+
										'Termina :Nunca'+'\n'+									
										'Todos los dias Habiles'+'\n')
			}else if(text4 == true && text8 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
						 				'Los Dias :' +acum_selectDias+'\n'+
										'Termina :Nunca'+'\n'+
										'Todos los dias Feriados'+'\n')
			}else if(text5 == true && text7 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
						 				'Los Dias :' +acum_selectDias+'\n'+
						 				'Termina el :'+document.getElementById("txtFechaFin").value+'\n'+									
										'Todos los dias Habiles'+'\n')
			}else if(text5 == true && text8 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
						 				'Los Dias :' +acum_selectDias+'\n'+
						 				'Termina el :'+document.getElementById("txtFechaFin").value+'\n'+
										'Todos los dias Feriados'+'\n')
			}else if(text6 == true && text7 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
										'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
										'Los Dias :' +acum_selectDias+'\n'+
										'Termina despues de  :'+document.getElementById("txtFechaFinRepeticiones").value+' Repeticiones'+'\n'+									
										'Todos los dias Habiles'+'\n')
			}else if(text6 == true && text8 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
										'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
										'Los Dias :' +acum_selectDias+'\n'+
										'Termina despues de  :'+document.getElementById("txtFechaFinRepeticiones").value+' Repeticiones'+'\n'+
										'Todos los dias Feriados'+'\n')
			}
			
			else if(text4 == true){		
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
					 					'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
						 				'Los Dias :' +acum_selectDias+'\n'+
										'Termina :Nunca'+'\n')
			}else if(text5 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
						 				'Los Dias :' +acum_selectDias+'\n'+
									    'Termina el :'+document.getElementById("txtFechaFin").value+'\n')		
			}else if(text6 == true){
					$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
											'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
											'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
											'Los Dias :' +acum_selectDias+'\n'+
											'Termina despues de  :'+document.getElementById("txtFechaFinRepeticiones").value+' Repeticiones'+'\n')		
			}
		 
	 }
	 
	 
	 if (selected == "MES") {
		 
		 
			var label = document.getElementById("label").text;	
			var text4 = document.getElementById("rbtFechaFinNunca").checked;
			var text5 = document.getElementById("rbtFechaFin").checked;
			var text6 = document.getElementById("rbtFechaFinRepeticiones").checked;			
			var cboOrdinales = document.getElementById("rbtFechaFinRepeticiones").value;			
			var text7 = document.getElementById("chkDiaHabil").checked;
			var text8 = document.getElementById("chkDiaFeriado").checked;
			
			
			if(text4 == true && text7 == true && text8 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
						 				'Los Dias :' +acumOrdinales+acumuladorDias+''+acumuladordiasp+acumuladordiasp2+'\n'+
										'Termina :Nunca'+'\n'+								
										'Todos los dias Habiles y Feriados'+'\n')
			}else if(text5 == true && text7 == true && text8 == true){
			$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
									'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
					 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
					 				'Los Dias :' +acumOrdinales+valuesem+acumuladorDias+''+acumuladordiasp+acumuladordiasp2+'\n'+
					 				'Termina el :'+document.getElementById("txtFechaFin").value+'\n'+								
									'Todos los dias Habiles y Feriados'+'\n')
			}else if(text6 == true && text7 == true && text8 == true){
			$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
									'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
									'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
									'Los Dias :' +acumOrdinales+valuesem+acumuladorDias+'  '+acumuladordiasp+acumuladordiasp2+'\n'+
									'Termina despues de  :'+document.getElementById("txtFechaFinRepeticiones").value+' Repeticiones'+'\n'+								
									'Todos los dias Habiles y Feriados'+'\n')
			}
			
			else if(text4 == true && text7 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
						 				'Los Dias :' +acumOrdinales+valuesem+acumuladorDias+''+acumuladordiasp+acumuladordiasp2+'\n'+
										'Termina :Nunca'+'\n'+									
										'Todos los dias Habiles'+'\n')
			}else if(text4 == true && text8 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
						 				'Los Dias :' +acumOrdinales+valuesem+acumuladorDias+''+acumuladordiasp+acumuladordiasp2+'\n'+
										'Termina :Nunca'+'\n'+
										'Todos los dias Feriados'+'\n')
			}else if(text5 == true && text7 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
						 				'Los Dias :' +acumOrdinales+valuesem+acumuladorDias+''+acumuladordiasp+acumuladordiasp2+'\n'+
						 				'Termina el :'+document.getElementById("txtFechaFin").value+'\n'+									
										'Todos los dias Habiles'+'\n')
			}else if(text5 == true && text8 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
						 				'Los Dias :' +acumOrdinales+valuesem+acumuladorDias+''+acumuladordiasp+acumuladordiasp2+'\n'+
						 				'Termina el :'+document.getElementById("txtFechaFin").value+'\n'+
										'Todos los dias Feriados'+'\n')
			}else if(text6 == true && text7 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
										'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
										'Los Dias :' +acumOrdinales+valuesem+acumuladorDias+''+acumuladordiasp+acumuladordiasp2+'\n'+
										'Termina despues de  :'+document.getElementById("txtFechaFinRepeticiones").value+' Repeticiones'+'\n'+									
										'Todos los dias Habiles'+'\n')
			}else if(text6 == true && text8 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
										'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
										'Los Dias :' +acumOrdinales+valuesem+acumuladorDias+''+acumuladordiasp+acumuladordiasp2+'\n'+
										'Termina despues de  :'+document.getElementById("txtFechaFinRepeticiones").value+' Repeticiones'+'\n'+
										'Todos los dias Feriados'+'\n')
			}
			
			else if(text4 == true){		
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
					 					'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
						 				'Los Dias :' +acumOrdinales+valuesem+acumuladorDias+''+acumuladordiasp+acumuladordiasp2+'\n'+
										'Termina :Nunca'+'\n')
			}else if(text5 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 				'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
						 				'Los Dias :' +acumOrdinales+valuesem+acumuladorDias+''+acumuladordiasp+acumuladordiasp2+'\n'+
									    'Termina el :'+document.getElementById("txtFechaFin").value+'\n')		
			}else if(text6 == true){
					$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
											'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
											'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
											'Los Dias :' +acumOrdinales+valuesem+acumuladorDias+''+acumuladordiasp+acumuladordiasp2+'\n'+
											'Termina despues de  :'+document.getElementById("txtFechaFinRepeticiones").value+' Repeticiones'+'\n')		
			}
		 
		 
		 
		 
		 
	 }
	 if (selected == "AÑO") {
		 
		 
			var label = document.getElementById("label").text;	
			var text4 = document.getElementById("rbtFechaFinNunca").checked;
			var text5 = document.getElementById("rbtFechaFin").checked;
			var text6 = document.getElementById("rbtFechaFinRepeticiones").checked;				
			
			var text7 = document.getElementById("chkDiaHabil").checked;
			var text8 = document.getElementById("chkDiaFeriado").checked;
			
			
			if(text4 == true && text7 == true && text8 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
										 'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
										 'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
							 			 'Los Meses :' +acum_selectMes +'\n'+
										 'El :'+acumOrdinales+valuesem+acumuladorDias +''+acumuladordiasp+acumuladordiasp2+'\n'+
										 'Termina :Nunca'+'\n'+								
										 'Todos los dias Habiles y Feriados'+'\n')
			}else if(text5 == true && text7 == true && text8 == true){
			$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
					 'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
					 'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
		 			 'Los Meses :' +acum_selectMes +'\n'+
					 'El :'+acumOrdinales+valuesem+acumuladorDias+acumuladordiasp+acumuladordiasp2+'\n'+
					 				'Termina el :'+document.getElementById("txtFechaFin").value+'\n'+								
									'Todos los dias Habiles y Feriados'+'\n')
			}else if(text6 == true && text7 == true && text8 == true){
			$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
					 'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
					 'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
		 			 'Los Meses :' +acum_selectMes +'\n'+
					 'El :'+acumOrdinales+valuesem+acumuladorDias+acumuladordiasp+acumuladordiasp2+'\n'+
									'Termina despues de  :'+document.getElementById("txtFechaFinRepeticiones").value+' Repeticiones'+'\n'+								
									'Todos los dias Habiles y Feriados'+'\n')
			}
			
			else if(text4 == true && text7 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
						 'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
			 			 'Los Meses :' +acum_selectMes +'\n'+
						 'El :'+acumOrdinales+valuesem+acumuladorDias+acumuladordiasp+acumuladordiasp2+'\n'+
										'Termina :Nunca'+'\n'+									
										'Todos los dias Habiles'+'\n')
			}else if(text4 == true && text8 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
						 'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
			 			 'Los Meses :' +acum_selectMes +'\n'+
						 'El :'+acumOrdinales+valuesem+acumuladorDias+acumuladordiasp+acumuladordiasp2+'\n'+
										'Termina :Nunca'+'\n'+
										'Todos los dias Feriados'+'\n')
			}else if(text5 == true && text7 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
						 'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
			 			 'Los Meses :' +acum_selectMes +'\n'+
						 'El :'+acumOrdinales+valuesem+acumuladorDias+acumuladordiasp+acumuladordiasp2+'\n'+
						 				'Termina el :'+document.getElementById("txtFechaFin").value+'\n'+									
										'Todos los dias Habiles'+'\n')
			}else if(text5 == true && text8 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
						 'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
			 			 'Los Meses :' +acum_selectMes +'\n'+
						 'El :'+acumOrdinales+valuesem+acumuladorDias+acumuladordiasp+acumuladordiasp2+'\n'+
						 				'Termina el :'+document.getElementById("txtFechaFin").value+'\n'+
										'Todos los dias Feriados'+'\n')
			}else if(text6 == true && text7 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
						 'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
			 			 'Los Meses :' +acum_selectMes +'\n'+
						 'El :'+acumOrdinales+valuesem+acumuladorDias+acumuladordiasp+acumuladordiasp2+'\n'+
										'Termina despues de  :'+document.getElementById("txtFechaFinRepeticiones").value+' Repeticiones'+'\n'+									
										'Todos los dias Habiles'+'\n')
			}else if(text6 == true && text8 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
						 'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
			 			 'Los Meses :' +acum_selectMes +'\n'+
						 'El :'+acumOrdinales+valuesem+acumuladorDias+acumuladordiasp+acumuladordiasp2+'\n'+
										'Termina despues de  :'+document.getElementById("txtFechaFinRepeticiones").value+' Repeticiones'+'\n'+
										'Todos los dias Feriados'+'\n')
			}
			
			else if(text4 == true){		
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
						 'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
			 			 'Los Meses :' +acum_selectMes +'\n'+
						 'El :'+acumOrdinales+valuesem+acumuladorDias+acumuladordiasp+acumuladordiasp2+'\n'+
										'Termina :Nunca'+'\n')
			}else if(text5 == true){
				$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
						 'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
						 'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
			 			 'Los Meses :' +acum_selectMes +'\n'+
						 'El :'+acumOrdinales+valuesem+acumuladorDias+acumuladordiasp+acumuladordiasp2+'\n'+
									    'Termina el :'+document.getElementById("txtFechaFin").value+'\n')		
			}else if(text6 == true){
					$('#txtDescripcion').val('El Periodo : '+document.getElementById("txtTitulo").value +'\n'+
							 'Iniciara el : ' +document.getElementById("txtFechaIni").value+'\n'+
							 'Se repetira cada : '+document.getElementById("txtIntervalo").value+ label +'\n'+
				 			 'Los Meses :' +acum_selectMes +'\n'+
							 'El :'+acumOrdinales+valuesem+acumuladorDias+acumuladordiasp+acumuladordiasp2+'\n'+
											'Termina despues de  :'+document.getElementById("txtFechaFinRepeticiones").value+' Repeticiones'+'\n')		
			}
	 }
	 
}
function limpiarBtnDias(){
	var btnDia_1 =  document.getElementById("btnDia_1");
	btnDia_1.value = false;
	btnDia_1.style.backgroundColor = "initial";
	btnDia_1.style.fontWeight = "bold";
	btnDia_1.style.color  = "black";

	var btnDia_2 =  document.getElementById("btnDia_2");
	btnDia_2.value = false;
	btnDia_2.style.backgroundColor = "initial";
	btnDia_2.style.fontWeight = "bold";
	btnDia_2.style.color  = "black";
	
	var btnDia_3 =  document.getElementById("btnDia_3");
	btnDia_3.value = false;
	btnDia_3.style.backgroundColor = "initial";
	btnDia_3.style.fontWeight = "bold";
	btnDia_3.style.color  = "black";
	
	var btnDia_4 =  document.getElementById("btnDia_4");
	btnDia_4.value = false;
	btnDia_4.style.backgroundColor = "initial";
	btnDia_4.style.fontWeight = "bold";
	btnDia_4.style.color  = "black";
	
	var btnDia_5 =  document.getElementById("btnDia_5");
	btnDia_5.value = false;
	btnDia_5.style.backgroundColor = "initial";
	btnDia_5.style.fontWeight = "bold";
	btnDia_5.style.color  = "black";
	
	var btnDia_6 =  document.getElementById("btnDia_6");
	btnDia_6.value = false;
	btnDia_6.style.backgroundColor = "initial";
	btnDia_6.style.fontWeight = "bold";
	btnDia_6.style.color  = "black";
	
	var btnDia_7 =  document.getElementById("btnDia_7");
	btnDia_7.value = false;
	btnDia_7.style.backgroundColor = "initial";
	btnDia_7.style.fontWeight = "bold";
	btnDia_7.style.color  = "black";
	
	var btnDia_8 =  document.getElementById("btnDia_8");
	btnDia_8.value = false;
	btnDia_8.style.backgroundColor = "initial";
	btnDia_8.style.fontWeight = "bold";
	btnDia_8.style.color  = "black";
	
	var btnDia_9 =  document.getElementById("btnDia_9");
	btnDia_9.value = false;
	btnDia_9.style.backgroundColor = "initial";
	btnDia_9.style.fontWeight = "bold";
	btnDia_9.style.color  = "black";
	
	var btnDia_10 =  document.getElementById("btnDia_10");
	btnDia_10.value = false;
	btnDia_10.style.backgroundColor = "initial";
	btnDia_10.style.fontWeight = "bold";
	btnDia_10.style.color  = "black";
	
	var btnDia_11 =  document.getElementById("btnDia_11");
	btnDia_11.value = false;
	btnDia_11.style.backgroundColor = "initial";
	btnDia_11.style.fontWeight = "bold";
	btnDia_11.style.color  = "black";
	
	var btnDia_12 =  document.getElementById("btnDia_12");
	btnDia_12.value = false;
	btnDia_12.style.backgroundColor = "initial";
	btnDia_12.style.fontWeight = "bold";
	btnDia_12.style.color  = "black";
	
	var btnDia_13 =  document.getElementById("btnDia_13");
	btnDia_13.value = false;
	btnDia_13.style.backgroundColor = "initial";
	btnDia_13.style.fontWeight = "bold";
	btnDia_13.style.color  = "black";
	
	var btnDia_14 =  document.getElementById("btnDia_14");
	btnDia_14.value = false;
	btnDia_14.style.backgroundColor = "initial";
	btnDia_14.style.fontWeight = "bold";
	btnDia_14.style.color  = "black";
	
	var btnDia_15 =  document.getElementById("btnDia_15");
	btnDia_15.value = false;
	btnDia_15.style.backgroundColor = "initial";
	btnDia_15.style.fontWeight = "bold";
	btnDia_15.style.color  = "black";
	
	var btnDia_16 =  document.getElementById("btnDia_16");
	btnDia_16.value = false;
	btnDia_16.style.backgroundColor = "initial";
	btnDia_16.style.fontWeight = "bold";
	btnDia_16.style.color  = "black";
	
	var btnDia_17 =  document.getElementById("btnDia_17");
	btnDia_17.value = false;
	btnDia_17.style.backgroundColor = "initial";
	btnDia_17.style.fontWeight = "bold";
	btnDia_17.style.color  = "black";
	
	var btnDia_18 =  document.getElementById("btnDia_18");
	btnDia_18.value = false;
	btnDia_18.style.backgroundColor = "initial";
	btnDia_18.style.fontWeight = "bold";
	btnDia_18.style.color  = "black";
	
	var btnDia_19 =  document.getElementById("btnDia_19");
	btnDia_19.value = false;
	btnDia_19.style.backgroundColor = "initial";
	btnDia_19.style.fontWeight = "bold";
	btnDia_19.style.color  = "black";
	
	var btnDia_20 =  document.getElementById("btnDia_20");
	btnDia_20.value = false;
	btnDia_20.style.backgroundColor = "initial";
	btnDia_20.style.fontWeight = "bold";
	btnDia_20.style.color  = "black";
	
	var btnDia_21 =  document.getElementById("btnDia_21");
	btnDia_21.value = false;
	btnDia_21.style.backgroundColor = "initial";
	btnDia_21.style.fontWeight = "bold";
	btnDia_21.style.color  = "black";
	
	var btnDia_22 =  document.getElementById("btnDia_22");
	btnDia_22.value = false;
	btnDia_22.style.backgroundColor = "initial";
	btnDia_22.style.fontWeight = "bold";
	btnDia_22.style.color  = "black";
	
	var btnDia_23 =  document.getElementById("btnDia_23");
	btnDia_23.value = false;
	btnDia_23.style.backgroundColor = "initial";
	btnDia_23.style.fontWeight = "bold";
	btnDia_23.style.color  = "black";
	
	var btnDia_24 =  document.getElementById("btnDia_24");
	btnDia_24.value = false;
	btnDia_24.style.backgroundColor = "initial";
	btnDia_24.style.fontWeight = "bold";
	btnDia_24.style.color  = "black";
	
	var btnDia_25 =  document.getElementById("btnDia_25");
	btnDia_25.value = false;
	btnDia_25.style.backgroundColor = "initial";
	btnDia_25.style.fontWeight = "bold";
	btnDia_25.style.color  = "black";
	
	var btnDia_26 =  document.getElementById("btnDia_26");
	btnDia_26.value = false;
	btnDia_26.style.backgroundColor = "initial";
	btnDia_26.style.fontWeight = "bold";
	btnDia_26.style.color  = "black";
	
	var btnDia_27 =  document.getElementById("btnDia_27");
	btnDia_27.value = false;
	btnDia_27.style.backgroundColor = "initial";
	btnDia_27.style.fontWeight = "bold";
	btnDia_27.style.color  = "black";
	
	var btnDia_28 =  document.getElementById("btnDia_28");
	btnDia_28.value = false;
	btnDia_28.style.backgroundColor = "initial";
	btnDia_28.style.fontWeight = "bold";
	btnDia_28.style.color  = "black";
	
	var btnDia_29 =  document.getElementById("btnDia_29");
	btnDia_29.value = false;
	btnDia_29.style.backgroundColor = "initial";
	btnDia_29.style.fontWeight = "bold";
	btnDia_29.style.color  = "black";
	
	var btnDia_30 =  document.getElementById("btnDia_30");
	btnDia_30.value = false;
	btnDia_30.style.backgroundColor = "initial";
	btnDia_30.style.fontWeight = "bold";
	btnDia_30.style.color  = "black";
	
	var btnDia_31 =  document.getElementById("btnDia_31");
	btnDia_31.value = false;
	btnDia_31.style.backgroundColor = "initial";
	btnDia_31.style.fontWeight = "bold";
	btnDia_31.style.color  = "black";
}

function limpiartodo(){
	limpiarBtnDias();
	acum_selectDias = "";
	acum_selectMes = "";
	acumuladordiasp = "";
	acumuladordiasp2 = "";
	acumuladorDias = "";
	acumOrdinales = "";
	valuesem="";
	
	$('#hdIdPeriodo').text('');
	$('#txtTitulo').val('');
	$('#txtFechaIni').val('');
	$('#txtIntervalo').val(0);		

	$('#selectDias').val('0').trigger('change.select2');
	$('#selectMes').val('0').trigger('change.select2');
	
	
	document.getElementById("rbtnelegirmes").checked = false;  
	
	document.getElementById("rbtelegirdiapersonalizado").checked = false;  
	document.getElementById("rbtDiaAntes").checked = false;
	document.getElementById("txtDiaAntes").checked = false;
	document.getElementById("rbtDiaDespues").checked = false;
	document.getElementById("txtDiaDespues").checked = false;
	
	$('#cboOrdinales').val('0').trigger('change.select2');
	
	document.getElementById("chkSemanal").checked = false;	
	document.getElementById("chkDomingo").checked = false;
	document.getElementById("chkLunes").checked = false;
	document.getElementById("chkMartes").checked = false;
	document.getElementById("chkMiercoles").checked = false;
	document.getElementById("chkJueves").checked = false;
	document.getElementById("chkViernes").checked = false;
	document.getElementById("chkSabado").checked = false;
	document.getElementById("chkDia").checked = false;
	document.getElementById("hideDia").hidden = false;
	
	document.getElementById("chk1erDia").checked = false;
	document.getElementById("chk2erDia").checked = false;
	document.getElementById("chk3erDia").checked = false;
	document.getElementById("chk4erDia").checked = false;
	document.getElementById("chk5erDia").checked = false;
	document.getElementById("chk6erDia").checked = false;
	document.getElementById("chk7erDia").checked = false;
	
	document.getElementById("rbtFechaFinNunca").checked = true;  
	document.getElementById("rbtFechaFin").checked = false;  
	document.getElementById("rbtFechaFinRepeticiones").checked = false; 
	document.getElementById("txtFechaFin").value = "";
	document.getElementById("txtFechaFin").disabled = true;
	
	document.getElementById("txtFechaFinRepeticiones").value = "";
	document.getElementById("txtFechaFinRepeticiones").disabled = true;
	
	$('#txtDescripcion').val('');
	
}
</script>
</html>