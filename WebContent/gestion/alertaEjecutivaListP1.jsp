<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="Content-Type"
	content="application/json; charset=utf-8">


<!-- Customizer -->
<script
	src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

<title>Alertas Ejecutivas</title>
</head>
<body>

	<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
	<section class="content-header">
	<h1>
		Gestión <small>Alertas Ejecutivas Prioridad 1</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-th-large"></i> Gestión</a></li>
		<li class="active">Alertas Ejecutivas</li>
	</ol>
	</section> <!-- Main content --> <section class="content"> <input
		id="hdIdAlerta" type="hidden"> <input id="hdTipo"
		type="hidden">

	<div class="row">
		<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
			<div class="form-inline">
				<div class="form-group">
					<a id="btnNuevo" onclick="openModalAlerta('','', 1)"
						class="btn btn-default"><i class="fa fa-file-o"></i> Nueva
						Incidencia</a>
				</div>
				<div class="form-group">
					<select id="cboTipoTicket" class="form-control cbo2">
						<option value="0">Tickets activos</option>
						<option value="1">Tickets cerrados</option>
					</select>
				</div>
			</div>
		</div>
	</div>

	<br />

	<div class="row">
		<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">
						<i class="fa fa-table" aria-hidden="true"></i> LISTA DE TICKETS
						PRIORIDAD 1
					</h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<label id="lblMensaje"></label>
						</div>
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<div id="tbcontainer" class="table-responsive">Aquí se
								listará todos los tickets con prioridad 1.</div>
						</div>
					</div>
				</div>
				<div id="dvLoadListAlerta"></div>
			</div>
		</div>
	</div>

	</section> </aside>

</body>


<!-- Modal -->
<div class="modal fade" id="mdEliminar" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Detalle de Incidencia</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						¿Desea eliminar el registro del ticket: <label id="lblTicketId">
						</label>?
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<a id="btnEliminar" class="btn btn-danger"><i
					class="fa fa-trash-o" aria-hidden="true"></i> Si, eliminar</a> <a
					class="btn btn-default" data-dismiss="modal"><i
					class="fa fa-undo" aria-hidden="true"></i> Cancelar</a>
			</div>
		</div>
	</div>
</div>



<!-- Modal -->
<div class="modal fade" id="mdRegistroAlertaEjecutiva" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Detalle de Incidencia</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<label id="lblMensajeRegAlerta"></label>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<!-- 							<a class="btn btn-primary" onclick="prueba()">PRUEBIÑAS</a> -->
						<input id="hdIdAlerta" type="hidden">
						<div class="row">
							<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
								<div class="form-inline">
									<div class="form-group">
										<label>Creador</label> <input id="txtUsuarioCreador"
											type="text" class="form-control" readonly="readonly">
										<!-- 											</div> -->
										<!-- 											<div class="form-group"> -->
										<label>Última Modificacion</label> <input
											id="txtUsuarioModificador" type="text" class="form-control"
											readonly="readonly"> <label>Estado</label>
									</div>
									<div class="form-group">
										<select id="cboEstadoAlerta" class="form-control cbo2">
											<option value="0">Seleccionar</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<br />

						<div class="row">
							<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
								<div class="box box-info">
									<div class="box-header with-border">
										<i class="fa fa-teal"></i>
										<h3 class="box-title">Maximo</h3>
									</div>
									<!-- box-header -->
									<div class="box-body">
										<table class="table">
											<tbody>
												<tr>
													<td>Ticket</td>
													<td>
													<div class="form-inline">
														<div class="form-group">
															<input id="txtMaximoTicketId" type="text" class="form-control" maxlength="15">
														</div>
													</div>
													</td>

													<td>
													<div class="form-group">
														<a id="btnConsultarMaximo" class="btn btn-success" data-loading-text="Consultando..." autocomplete="off" onclick="buscarTicket(0)"> <i class="fa fa-refresh" aria-hidden="true"></i></a>
													</div>
													</td>
													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>Cliente</td>
													<td colspan="4">
														<div class="form-inline">
															<div class="form-group">
																<input id="txtMaximoIdCliente" type="text"
																	class="form-control" readonly="readonly">
																<!-- 																<input id="cboMaximoCliente" type="text" class="form-control" size="40" readonly="readonly"> -->
															</div>
															<div class="form-group">
																<select id="cboMaximoCliente" class="form-control cbo2"
																	disabled="disabled"></select>
															</div>
														</div>
													</td>
													<!-- 													<td></td> -->
													<!-- 													<td></td> -->
													<!-- 													<td></td> -->
												</tr>
												<tr>
													<td>Resumen</td>
													<td colspan="4"><input id="txtMaximoResumen"
														type="text" class="form-control" size="60"></td>

													<!-- 														<td></td> -->
													<!-- 														<td></td> -->
													<!-- 														<td></td> -->
												</tr>
												<tr>
													<td>Detalle</td>
													<td colspan="4"><textarea id="txtMaximoDetalle"
															rows="3" class="form-control" readonly="readonly"></textarea></td>

													<!-- 								<td></td> -->

													<!-- 								<td></td> -->
													<!-- 								<td></td> -->
												</tr>
												<tr>
													<td>Prioridad</td>
													<td><input id="txtMaximoPrioridad" type="text"
														class="form-control" readonly="readonly"></td>
													<td></td>

													<td>Fecha de Creación</td>
													<td><input id="txtMaximoFechaCreacion" type="text"
														class="form-control" readonly="readonly"></td>
												</tr>
												<tr>
													<td>Team Owner</td>
													<td><input id="txtMaximoIdGrupoPropietario"
														type="text" class="form-control" size="20"></td>
													<td colspan="2"><select id="cboMaximoGrupoPropietario"
														class="form-control cbo2" size="40"></select></td>
													<td><input id="txtMaximoGrupoPropietarioPais"
														type="text" class="form-control" size="20"></td>
													<td></td>


													<!-- 														<td colspan="4"> -->
													<!-- 															<div class="form-inline"> -->
													<!-- 																<div class="form-group"> -->
													<!-- 																	<input id="txtMaximoIdGrupoPropietario" type="text" class="form-control" size="20"> -->
													<!-- 																</div><div class="form-group">  -->
													<!-- 																	<select id="cboMaximoGrupoPropietario" class="form-control cbo2" size="20" ></select> -->
													<!-- 																</div><div class="form-group"> -->
													<!-- 																	<input id="txtMaximoGrupoPropietarioPais" type="text" class="form-control" size="20"> -->
													<!-- 																</div> -->
													<!-- 															</div> -->
													<!-- 														</td> -->

													<!-- 														<td></td> -->

													<!-- 														<td></td> -->
													<!-- 														<td></td> -->
												</tr>
												<tr>
													<td>Team Resolutor</td>
													<td><input id="txtMaximoIdGrupoResolutor" type="text"
														class="form-control" size="20"></td>
													<td colspan="2"><select id="cboMaximoGrupoResolutor"
														class="form-control cbo2" size="40"></select></td>
													<td><input id="txtMaximoGrupoResolutorPais"
														type="text" class="form-control" size="20"></td>
													<td></td>


													<!-- 														<td colspan="4"> -->
													<!-- 															<div class="form-inline"> -->
													<!-- 																<div class="form-group"> -->
													<!-- 																	<input id="txtMaximoIdGrupoResolutor" type="text" class="form-control" size="20"> -->
													<!-- 																	<select id="cboMaximoGrupoResolutor" class="form-control cbo2"></select> -->
													<!-- 																	<input id="txtMaximoGrupoResolutorPais" type="text" class="form-control" size="20"> -->
													<!-- 																</div> -->
													<!-- 														</div> -->
													<!-- 														</td> -->
												</tr>
												<tr>
													<td>Estado</td>
													<td><input id="txtMaximoIdEstado" type="text"
														class="form-control" size="10" readonly="readonly"></td>
													<td><select id="cboMaximoEstado"
														class="form-control cbo2" disabled="disabled"></select></td>

													<!-- 														<td colspan="2"> -->
													<!-- 															<div class="form-inline"> -->
													<!-- 																<div class="form-group"> -->
													<!-- 																	<input id="txtMaximoIdEstado" type="text" class="form-control" size="10" readonly="readonly">  -->
													<!-- 																	<select id="cboMaximoEstado" class="form-control cbo2" disabled="disabled"></select> -->
													<!-- 																</div> -->
													<!-- 															</div> -->

													<!-- 														</td> -->

													<td>
														<div class="form-group">PM</div>
													</td>
													<td>
														<div class="form-inline">
															<div class="form-group">
																<!-- 																<select id="txtPm" class="form-control cbo2"> -->
																<!-- 																	<option value="0">Seleccionar</option> -->
																<!-- 																</select> -->
																<input id="txtPm" class="form-control"></input>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- /.box-body -->
									<div id="dvLoadP1"></div>
								</div>

								<div class="box box-info">
									<div class="box-header with-border">
										<i class="fa fa-teal"></i>
										<h3 class="box-title">Información</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<table class="table">
											<tbody>
												<tr>
													<td>Crisis de Turno</td>
													<td>
														<div class="form-inline">
															<div class="form-group">
																<input id="txtCrisisTurno" type="text"
																	class="form-control">

																<!-- 																<select id="txtCrisisTurno" class="form-control cbo2"> -->
																<!-- 																		<option value="0">Seleccionar</option> -->
																<!-- 																</select> -->
															</div>
														</div>
													</td>
													<td></td>

													<td>Fecha de Afectación</td>
													<td><input id="txtHoraNotificacionIbm" type="text"
														class="form-control dateTimePicker2" maxlength="16"></td>
												</tr>
												<tr>
													<td>Data Center</td>
													<td>
														<div class="form-inline">
															<div class="form-group">
																<select id="cboDataCenter" class="form-control cbo2">
																	<option value="0">Seleccionar</option>
																</select>
															</div>
														</div>
													</td>
													<td></td>

													<td>Fecha fin</td>
													<td><input id="txtHoraFin" type="text"
														class="form-control dateTimePicker2" maxlength="16"></td>
												</tr>
												<tr>
													<td>Teams de Soporte</td>
													<td><select multiple="multiple" id="cboTeamSoporte"
														class="form-control" style="width: 100%">
															<option value="xSeries">xSeries</option>
															<option value="pSeries">pSeries</option>
															<option value="iSeries">iSeries</option>
															<option value="DM">DM</option>
															<option value="Networking">NetWorking</option>
															<option value="BAS">BAS</option>
															<option value="WME">WME</option>
													</select></td>
													<td></td>

													<td>Tipo de falla</td>

													<td>
														<div class="form-inline">
															<div class="form-group">
																<select id="cboTipoFalla" class="form-control cbo2">
																	<option value="0">Seleccionar</option>
																</select>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>Incidente</td>
													<td colspan="4">
														<div class="form-inline">
															<div class="form-group">
																<div class="checkbox">
																	<label> <input id="chkIncidenteConcurrente"
																		type="checkbox"> Incidente recurrente
																	</label>
																</div>
																<div class="checkbox">
																	<label> <input id="chkOtrosClientes"
																		type="checkbox"> Otros clientes
																	</label>
																</div>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>Propiedad de INC</td>
													<td>
														<div class="form-inline">
															<div class="form-group">
																<select id="cboPropiedadInc" class="form-control cbo2">
																	<option value="0">Seleccionar</option>
																</select>
															</div>
														</div>
													</td>
													<td></td>

													<td>SLA</td>
													<td>
														<div class="form-inline">
															<div class="form-group">
																<select id="cboSla" class="form-control cbo2">
																	<option value="0">Seleccionar</option>
																</select>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>Servicio Impactado</td>
													<td><input id="txtServicioImpactado" type="text"
														class="form-control" size="5" maxlength="150"></td>

													<td></td>

													<td></td>
													<td></td>
												</tr>

												<tr>
													<td>Impacto en el negocio</td>
													<td colspan="4"><textarea id="txtImpactoNegocio"
															rows="3" class="form-control" maxlength="650"></textarea></td>
												</tr>
										</table>
									</div>
									<!-- /.box-body -->
									<div id="dvLoadP2"></div>
								</div>


								<div class="box box-info">
									<div class="box-header with-border">
										<i class="fa fa-teal"></i>
										<h3 class="box-title">Detalle de la restauración</h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<div class="table-responsive">
											<table class="table">
												<tr id="trAlertaDetalle" class="hidden">
													<td colspan="5">
														<div class="form-group">Detalle</div>
														<div class="form-inline">
															<div class="form-group">
																<textarea id="txtDetalleAlerta" class="form-control"
																	cols="90" rows="6"
																	placeholder="Ingresar un detalle de la solución"
																	maxlength="2500"></textarea>
															</div>
															<div class="form-group">
																<a id="btnAddDetalle" href="#" class="btn btn-primary">
																	<i class="fa fa-plus-circle" aria-hidden="true"></i>
																	Agregar
																</a> <input id="hdtipoDetalle" type="hidden"> <input
																	id="hdIdDetalle" type="hidden">
															</div>
														</div> <br />

														<div class="table-responsive">
															<table id="tblDetalleIncidencia"
																class="table table-hover table-striped table-bordered table-condensed">
																<thead class="bg-primary">
																</thead>
																<tbody>
																</tbody>
															</table>
														</div>
													</td>
												</tr>
												<tr>
													<td style="width: 150px">Ticket Problema</td>
													<td><input id="txtTicketProblema" type="text"
														class="form-control" size="5" maxlength="15"></td>
													<td></td>
													<td>Ticket Cambio</td>
													<td colspan="2"><input id="txtTicketCambio"
														type="text" class="form-control" size="5" maxlength="15"></td>
												</tr>
												<tr>
													<td>PM cambió prioridad</td>
													<td>
														<div class="form-inline">
															<div class="form-group">
																<div class="checkbox">
																	<label> <input id="chkCambioPrioridad"
																		type="checkbox"> Si
																	</label>
																</div>
															</div>
															<div id='dvCambioP' class="form-group hidden">
																<select id="cboCambioPrioridad"
																	class="form-control cbo2">
																	<option value="0">Seleccionar</option>
																</select>
															</div>
														</div>
													</td>
													<!-- 													<td></td> -->

													<!-- 													<td>Se recibió una alerta</td> -->
													<!-- 													<td> -->
													<!-- 														<div class="form-group"> -->
													<!-- 															<div class="checkbox"> -->
													<!-- 																<label> <input id="chkRecibioAlerta" type="checkbox"> -->
													<!-- 																	Si -->
													<!-- 																</label> -->
													<!-- 															</div> -->
													<!-- 														</div> -->
													<!-- 													</td> -->
													<td></td>

													<td>Notificado por</td>
													<td>
														<div class="form-inline">
															<div class="form-group">
																<select id="cboNotificado" class="form-control cbo2">
																	<option value="0">Seleccionar</option>
																</select>
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>Derivó de un cambio</td>
													<td colspan="4"><textarea id="txtDerivoCambio"
															rows="3" class="form-control" maxlength="50"></textarea></td>
												</tr>
												<tr>
													<td>Desviaciones de Incidencia</td>
													<td colspan="4"><select id="cboDesviacionIncidencia"
														class="form-control cbo2" multiple="multiple"
														style="width: 100%">
															<option value="PoliticaUsoTieLine">Politica uso
																tie line</option>
															<option value="PoliticaDeModificacionDePrioridad">Politica
																de modificacion de prioridad (No informado o NO
																documentado)</option>
															<option value="RolCrisisMangerNoLideraElIncidenteP1">Rol
																Crisis Manager no lidera el incidente P1</option>
															<option value="EjecucionDeUnCambioNoAutorizado">Ejecucion 
																de un cambio no autorizado</option>
															<option
																value="CambiosNoinformadosASysOpsComoPuntoDeControl">Cambios
																no informados a SysOps como punto de control
																(informacion de especialista y/o gestor)</option>
															<option
																value="ServiceManagementNoProveaElImpactoAlNegocio">Service
																Management no provea el impacto al negocio</option>
													</select> <!-- 													<textarea id="txtDesviacionIncidencia" rows="3" -->
														<!-- 															class="form-control" maxlength="650"></textarea></td> -->
													</td>
												</tr>
												<tr>
													<td>Evaluacion de Crisis</td>
													<td colspan="4"><textarea id="txtEvaluacionCrisis"
															rows="3" class="form-control" maxlength="650"></textarea></td>
												</tr>
												<tr>
													<td>Observaciones</td>
													<td colspan="4"><textarea id="txtObservaciones"
															rows="3" class="form-control" maxlength="650"></textarea></td>
												</tr>
												<tr>
													<td>¿Desea realizar una notificación?</td>
													<td>
														<div class="form-group">
															<div class="checkbox">
																<label> <input id="chkNotificar" type="checkbox">
																	Si
																</label>
															</div>
														</div>
													</td>
													<td></td>
													<td>Lista de Distribución</td>
													<td>
														<div class="form-inline">
															<div class="form-group">
																<select multiple="multiple" id="cboListaDistribucion"
																	class="form-control cbo2">
																	<option value="0">Seleccionar</option>
																</select>
															</div>
														</div>
													</td>
												</tr>
												<tr style="display: none;">
													<td>Tipo de Notificación</td>
													<td>
														<!-- 														<div class="form-inline"> --> <!-- 															<div class="form-group"> -->
														<select id="cboTipoNotificacion" class="form-control cbo2">
															<option value="0">Seleccionar</option>
													</select> <!-- 															</div> --> <!-- 														</div> -->
													</td>
													<td></td>

													<td></td>
													<td></td>
												</tr>
												<tr>
													<td>Adicionar notificación</td>
													<td colspan="4">
														<!-- 														<div class="form-inline"> --> <!-- 															<div class="form-group"> -->
														<select multiple="multiple" id="cboEmailAlternativo"
														class="form-control">
															<option value="0">Seleccionar</option>
													</select> <!-- 															</div> --> <!-- 														</div> -->
													</td>

													<!-- 													<td colspan="4"><input id="txtAdicionarNotificacion" -->
													<!-- 														type="text" class="form-control" size="5"></td> -->
												</tr>
												<tr>
													<td colspan="5"><a id="btnGuardarAlerta" href="#"
														class="btn btn-primary">Guardar</a> <a
														id="btnCancelarAlerta" href="#" class="btn btn-default"
														data-dismiss="modal">Cancelar</a></td>
												</tr>
												</tbody>
											</table>
										</div>
									</div>
									<!-- /.box-body -->
									<div id="dvLoadP3"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 				<div class="modal-footer"> -->
			<!-- 					<a id="btnGuardarDetalle" class="btn btn-primary">Guardar</a> <a -->
			<!-- 						type="button" class="btn btn-default" data-dismiss="modal">Cancelar</a> -->
			<!-- 				</div> -->
		</div>
	</div>
</div>




<script type="text/javascript">
	var vTeam = document.getElementById('hdIdTeam').value;
	var vIdUsuario = document.getElementById('hdIdEmpleado').value;
	var vIdEmail = document.getElementById('smUsuario').innerHTML;

	listOptions('ESTADO_ALERTA', vTeam);
	listOptions('PM_ALERTA', vTeam);
	listOptions('CRISIS_TURNO_ALERTA', vTeam);
	listOptions('DATACENTER_ALERTA', vTeam);
	listOptions('TIPOFALLA_ALERTA', vTeam);
	listOptions('PROPIEDADINC_ALERTA', vTeam);
	listOptions('SLA_ALERTA', vTeam);
	listOptions('CAMBIO_PRIORIDAD_ALERTA', vTeam);
	listOptions('TIPO_NOTIFICACION_ALERTA', vTeam);
	listOptions('DISTRIBUCION_ALERTA', vTeam);
	listOptions('TIPONOTIFICADO_ALERTAS', vTeam);
	listOptions('CLIENTE_ALERTA', vTeam);
	listOptions('ESTADOMAXIMO_ALERTA', vTeam);
	listOptions('DESVIACION_ESTANDAR', vTeam);
	listOptions('GRUPOPROPIETARIO_ALERTA', vTeam);

	listGrupoDistribucion('DISTRIBUCION_ALERTA', vTeam);

	listReportPendientes();

	function prueba() {
		// 		alert(document.getElementById('smUsuario').innerHTML);
		// 		alert($('#cboTeamSoporte').val());
		//alert($('#cboEstadoAlerta').val());

		// 		console.log(($('#cboTipoFalla').val() == '' ? 'null' : $('#cboTipoFalla').val()));
		// 		console.log('numero : ' + $('#cboTipoFalla').val().length);
		//		console.log('Estado: ' + $('#cboEstadoAlerta option:selected').text());

		// 		console.log('vtxtUsuarioCreador = ' + $('#txtUsuarioCreador').val());
		// 		console.log('vtxtUsuarioModificador = ' + $('#txtUsuarioModificador').val());
		// 		console.log('vhdIdAlerta = ' +  $('#hdIdAlerta').val());

		// 		console.log('vcboEstadoAlerta = ' +  ($('#cboEstadoAlerta').val() == '' ? 'null' : $('#cboEstadoAlerta').val()));
		// 		console.log('vtxtMaximoIdCliente = ' +  $('#txtMaximoIdCliente').val());
		// 		console.log('vcboMaximoCliente = ' +  $('#cboMaximoCliente').val());
		// 		console.log('vtxtMaximoTicketId = ' +  $('#txtMaximoTicketId').val());
		// 		console.log('vtxtMaximoResumen = ' +  $('#txtMaximoResumen').val());
		// 		console.log('vtxtMaximoDetalle = ' +  $('#txtMaximoDetalle').val());
		// 		console.log('vtxtMaximoPrioridad = ' +  $('#txtMaximoPrioridad').val());
		// 		console.log('vtxtMaximoFechaCreacion = ' +  $('#txtMaximoFechaCreacion').val());
		// 		console.log('vtxtMaximoIdEstado = ' +  $('#txtMaximoIdEstado').val());

		// 		console.log('vtxtMaximoIdGrupoPropietario = ' +  $('#txtMaximoIdGrupoPropietario').val());
		// 		console.log('vtxtMaximoGrupoPropietario = ' +  $('#txtMaximoGrupoPropietario').val());
		// 		console.log('vtxtPm = ' +  $('#txtPm option:selected').val());
		// 		console.log('vtxtCrisisTurno = ' +  $('#txtCrisisTurno option:selected').val());
		// 		console.log('vtxtHoraNotificacionIbm = ' +  $('#txtHoraNotificacionIbm').val());
		// 		console.log('vcboDataCenter = ' +  $('#cboDataCenter option:selected').val());
		// 		console.log('vtxtHoraFin = ' +  $('#txtHoraFin').val());

		// 		console.log('vcboTeamSoporte = ' + $('#cboTeamSoporte').val());

		// 		console.log('vcboTipoFalla = ' + $('#cboTipoFalla').val().trim());

		// 		console.log('vchkIncidenteConcurrente = ' + $('#chkIncidenteConcurrente').val() == true ? '1' : '0');
		// 		console.log('vchkIncidenteConcurrente = ' + (document.getElementById('chkIncidenteConcurrente').checked == true ? '1' : '0'));
		// 		console.log('vchkOtrosClientes = ' + $('#chkOtrosClientes').val() == true ? '1' : '0');
		// 		console.log('vcboPropiedadInc = ' + $('#cboPropiedadInc option:selected').val());
		// 		console.log('vtxtServicioImpactado = ' + $('#txtServicioImpactado').val());
		// 		console.log('vcboSla = ' + $('#cboSla option:selected').val());
		// 		console.log('vtxtImpactoNegocio = ' + $('#txtImpactoNegocio').val());
		// 		console.log('vtxtTicketProblema = ' + $('#txtTicketProblema').val());
		// 		console.log('vtxtTicketCambio = ' + $('#txtTicketCambio').val());
		// 		console.log('chkCambioPrioridad = ' + $('#chkCambioPrioridad').val() == true ? '1' : '0');
		// 		console.log('vcboCambioPrioridad = ' + $('#cboCambioPrioridad').val());
		// 		console.log('vchkRecibioAlerta = ' + $('#chkRecibioAlerta').val() == true ? '1' : '0');
		// 		console.log('vtxtDerivoCambio = ' + $('#txtDerivoCambio').val());
		// 		console.log('vtxtDesviacionIncidencia = ' + $('#txtDesviacionIncidencia').val());
		// 		console.log('vtxtEvaluacionCrisis = ' + $('#txtEvaluacionCrisis').val());
		// 		console.log('vcboTipoNotificacion =' + $('#cboTipoNotificacion option:selected').val());
		console.log($('#cboListaDistribucion').val() != null ? $('#cboListaDistribucion').val().toString() : '');
		console.log('vcboEmailAlternativo = ' + $('#cboEmailAlternativo').val());
		// 		console.log('vtipo = ' + $('#hdTipo').val());

	}

	function validar() {
		var strValidacion = '';
		if ($('#txtMaximoPrioridad').val() == '1') {
			strValidacion += ($('#cboEstadoAlerta').val() == '' ? '* Estado Alerta \n'
					: '');
			// 		strValidacion = ($('#txtMaximoIdCliente').val() == '' ? 'Estado Alerta \n' : '');
			// 		strValidacion = ($('#cboMaximoCliente').val() == '' ? 'Estado Alerta \n' : '');

			if ($('#cboEstadoAlerta option:selected').text() == 'FIN'
					|| $('#cboEstadoAlerta option:selected').text() == 'INICIO/FIN') {
				strValidacion += ($('#txtHoraNotificacionIbm').val() == '' ? '* Fecha de Afectación \n'
						: '');
				strValidacion += ($('#txtHoraFin').val() == '' ? '* Fecha Fin \n'
						: '');
			} else
				strValidacion += ($('#txtHoraNotificacionIbm').val() == '' ? '* Fecha de Afectación \n'
						: '');

			strValidacion += ($('#txtMaximoTicketId').val() == '' ? '* Ticket \n'
					: '');
			// 		strValidacion = ($('#txtMaximoResumen').val() == '' ? 'Estado Alerta \n' : '');
			// 		strValidacion = ($('#txtMaximoDetalle').val() == '' ? 'Estado Alerta \n' : '');
			// 		strValidacion = ($('#txtMaximoPrioridad').val() == '' ? 'Estado Alerta \n' : '');
			// 		strValidacion = ($('#txtMaximoFechaCreacion').val() == '' ? 'Estado Alerta \n' : '');
			// 		strValidacion = ($('#txtMaximoIdEstado').val() == '' ? 'Estado Alerta \n' : '');

			// 		strValidacion = ($('#txtMaximoIdGrupoPropietario').val() == '' ? 'Estado Alerta \n' : '');
			// 		strValidacion = ($('#txtMaximoGrupoPropietario').val() == '' ? 'Estado Alerta \n' : '');
			strValidacion += ($('#txtPm').val() == '' ? '* PM \n' : '');
			strValidacion += ($('#txtCrisisTurno').val() == '' ? '* Crisis de turno \n'
					: '');
			// 		strValidacion += ($('#txtHoraNotificacionIbm').val() == '' ? '* Fecha Notificacion \n' : '');
			strValidacion += ($('#cboDataCenter').val() == '' ? '* Data Center \n'
					: '');
			// 		strValidacion = ($('#txtHoraFin').val() == '' ? 'Fecha Fin \n' : '');

			// 		strValidacion += ($('#cboTeamSoporte').val() == '' ? '* Team de Soporte \n' : '');
			// 		console.log('vcboTeamSoporte = ' + $('#cboTeamSoporte').val());

			// 		strValidacion += ($('#cboTipoFalla').val() == '' ? '* Tipo de falla \n' : '');
			// 		console.log('vcboTipoFalla = ' + $('#cboTipoFalla option:selected').val());

			// 		console.log('vchkIncidenteConcurrente = ' + $('#chkIncidenteConcurrente').val() == true ? '1' : '0');
			strValidacion += ($('#cboPropiedadInc').val() == '' ? '* Propiedad de Incidencia \n'
					: '');
			// 		console.log('vcboPropiedadInc = ' + $('#cboPropiedadInc option:selected').val());
			strValidacion += ($('#cboSla').val() == '' ? '* SLA \n' : '');
			strValidacion += ($('#txtServicioImpactado').val() == '' ? '* Servicio Impactado \n'
					: '');
			strValidacion += ($('#txtImpactoNegocio').val() == '' ? '* Impacto Negocio \n'
					: '');
		}

		strValidacion += ($('#cboEstadoAlerta').val() == '' ? '* Estado Alerta \n'
				: '');

		if (document.getElementById('chkNotificar').checked == true) {
			//strValidacion += ($('#cboTipoNotificacion').val() == '' ? '* Tipo Notificacion \n' : '');
			strValidacion += ($('#cboListaDistribucion').val() == '' ? '* Lista de Distribucion \n'
					: '');
		}

		// 		console.log('vtxtServicioImpactado = ' + $('#txtServicioImpactado').val());
		// 		console.log('vcboSla = ' + $('#cboSla option:selected').val());
		// 		console.log('vtxtImpactoNegocio = ' + $('#txtImpactoNegocio').val());
		// 		console.log('vtxtTicketProblema = ' + $('#txtTicketProblema').val());
		// 		console.log('vtxtTicketCambio = ' + $('#txtTicketCambio').val());
		// 		console.log('chkCambioPrioridad = ' + $('#chkCambioPrioridad').val() == true ? '1' : '0');
		// 		console.log('vcboCambioPrioridad = ' + $('#cboCambioPrioridad').val());
		// 		console.log('cboNotificado = ' + $('#cboNotificado').val() == true ? '1' : '0');
		// 		console.log('vtxtDerivoCambio = ' + $('#txtDerivoCambio').val());
		// 		console.log('vtxtDesviacionIncidencia = ' + $('#txtDesviacionIncidencia').val());
		// 		console.log('vtxtEvaluacionCrisis = ' + $('#txtEvaluacionCrisis').val());
		// 		console.log('vcboTipoNotificacion =' + $('#cboTipoNotificacion option:selected').val());
		// 		console.log('vcboListaDistribucion = ' + $('#cboListaDistribucion option:selected').val());
		// 		console.log('vtxtAdicionarNotificacion = ' + $('#txtAdicionarNotificacion').val());
		// 		console.log('vtipo = ' + $('#hdTipo').val());

		return strValidacion;

	}

	$(document).ready(function() {

						$('#cboMaximoCliente').change(function() {document.getElementById('txtMaximoIdCliente').value = $('#cboMaximoCliente').val();});

						$('#cboMaximoEstado').change(function() {document.getElementById('txtMaximoIdEstado').value = $('#cboMaximoEstado').val();});

						$('#cboMaximoGrupoPropietario').change(function() {
											var vGrupo = $('#cboMaximoGrupoPropietario').val();
											$('#txtMaximoIdGrupoPropietario').val(vGrupo);
											console.log('vGrupo ==> ' + vGrupo);
											
											if(vGrupo != null || vGrupo != 'null' || vGrupo != ''){
												if (vGrupo.search('-PE-') > 0)
													$('#txtMaximoGrupoPropietarioPais').val('PERÚ');
												else if (vGrupo.search('-IN-') > 0)
													$('#txtMaximoGrupoPropietarioPais').val('INDIA');
											}
											
										});

						$('#cboMaximoGrupoResolutor').change(function() {
							var vGrupo = $('#cboMaximoGrupoResolutor').val();
							$('#txtMaximoIdGrupoResolutor').val(vGrupo);

							if (vGrupo.search('-PE-') > 0)
								$('#txtMaximoGrupoResolutorPais').val('PERÚ');
							else if (vGrupo.search('-IN-') > 0)
								$('#txtMaximoGrupoResolutorPais').val('INDIA');
						});

						$('#btnGuardarAlerta').click(function() {
							guardarAlerta();
						});

						$('#btnEliminar').click(function() {
							eliminarAlerta();
						});

						$('#cboTipoTicket').change(function() {
							listReportPendientes();
						});

						$('#chkCambioPrioridad').change(function() {
											if (document.getElementById('chkCambioPrioridad').checked == true) {
												$('#dvCambioP').removeClass('hidden');
											} else {
												$('#dvCambioP').removeClass('hidden');
												$('#dvCambioP').addClass('hidden');
											}
										});

						$('#chkNotificar').change(function() {
											if (document.getElementById('chkNotificar').checked != true) {
												$('#cboTipoNotificacion').attr("disabled", true);
												$('#cboListaDistribucion').attr("disabled", true);
											} else {
												$('#cboTipoNotificacion').attr("disabled", false);
												$('#cboListaDistribucion').attr("disabled", false);
											}
										});

						$('#cboListaDistribucion').prop("disabled", true);

						$('#btnAddDetalle').click(function() {
							guardarDetalle();
							$('#hdtipoDetalle').val('');
							$('#hdIdtipoDetalle').val('');
						});

						$('#btnNuevo').click(function() {
							$('#mdRegistroAlertaEjecutiva').modal('show');
							$('#lblMensajeRegAlerta').text('');
							$('#lblMensajeRegAlerta').removeClass();
						});

						$('#cboTeamSoporte').select2({
							placeholder : ' -- Ingresar Teams de soporte -- ',
							tags : true,
							tokenSeparators : [ ',', ' ' ]
						});

						$('#cboEmailAlternativo').select2(
										{
											placeholder : ' -- Ingresar correos adicionales -- ',
											tags : true
										});

					});

	function openModalAlerta(idAlerta, pticketId, itipo) {

		//Iniciar nueva alerta
		if (itipo == 1) {
			limpiar();
			bloquear(0);
			$('#txtMaximoTicketId').attr("disabled", false);
			$('#hdIdAlerta').val(idAlerta);
			$('#hdTipo').val('1');
			$('#mdRegistroAlertaEjecutiva').modal({
				backdrop : 'static',
				keyboard : false
			})
			$('#trAlertaDetalle').removeClass('hidden');
			$('#trAlertaDetalle').addClass('hidden');
			$('#btnConsultarMaximo').removeClass('hidden');
		}
		//Visualizar alerta
		else if (itipo == 2) {
			limpiar();
			bloquear(1);
			$('#hdIdAlerta').val(idAlerta);
			listarAlertaPorId(idAlerta, 1);
			listDetalleAlerta(idAlerta, 1);
			$('#mdRegistroAlertaEjecutiva').modal({
				backdrop : 'static',
				keyboard : false
			})
			$('#trAlertaDetalle').removeClass('hidden');
			$('#hdTipo').val('');
		}
		//Editar alerta
		else if (itipo == 3) {
			limpiar();
			bloquear(0);
			$('#hdIdAlerta').val(idAlerta);
			listarAlertaPorId(idAlerta, 2);
			listDetalleAlerta(idAlerta, 2);
			$('#mdRegistroAlertaEjecutiva').modal({
				backdrop : 'static',
				keyboard : false
			})
			$('#trAlertaDetalle').removeClass('hidden');
			$('#hdTipo').val('2');
			if ($('#cboEstadoAlerta option:selected').text() == 'FIN'
					|| $('#cboEstadoAlerta option:selected').text() == 'INICIO/FIN')
				bloquear(1);
		}
		//Eliminar alerta
		else if (itipo == 4) {
			$('#hdIdAlerta').val(idAlerta);
			$('#lblTicketId').text(pticketId);
			$('#mdEliminar').modal({
				backdrop : 'static',
				keyboard : false
			})
			$('#trAlertaDetalle').removeClass('hidden');
			$('#hdTipo').val('3');
		}
		document.getElementById('chkNotificar').checked = false;
	}

	function openModalAlertaDetalle(idAlertaDetalle, detalle, itipo) {
		// 	console.log(detalle.split("||").join("\n") + '  == ' + idAlertaDetalle + '  == ' + itipo);
		//Iniciar nueva alerta
		if (itipo == 1) {

		}
		//Editar alerta
		else if (itipo == 2) {

			$('#hdtipoDetalle').val(itipo);
			$('#hdIdDetalle').val(idAlertaDetalle);
			$('#txtDetalleAlerta').text('');
			var vtext = detalle.split("||").join("\n").trim()
			//$('#txtDetalleAlerta').text(vtext);
			document.getElementById('txtDetalleAlerta').value = vtext;
		}
		//Eliminar alerta
		else if (itipo == 3) {
			$('#hdtipoDetalle').val(itipo);
			$('#hdIdDetalle').val(idAlertaDetalle);
			guardarDetalle();
		}
		document.getElementById('chkNotificar').checked = false;
	}

	function buscarTicket(pMaximoTicketId) {
		var src = "ServletAlertaEjecutiva";
		var vMaximoTicketId = (pMaximoTicketId == 0 ? document
				.getElementById('txtMaximoTicketId').value : pMaximoTicketId);
		vMaximoTicketId = vMaximoTicketId.trim();
		if (vMaximoTicketId == '')
			return;
		
		$('#btnConsultarMaximo').button('loading');
	    
		$.post(src,{strOperation : "buscarTicket",ptxtMaximoTicketId : vMaximoTicketId},
						function(pdata) {
			
							$('#btnConsultarMaximo').button('reset');
							console.log('Reset');
							if (pdata != 'error') {

								var obj = JSON.parse(pdata);
								if (obj.ticketMaximo.length > 0) {

									$('#txtMaximoIdCliente').val(obj.ticketMaximo[0].idCliente);
									$('#cboMaximoCliente').val(obj.ticketMaximo[0].idCliente).trigger("change");
									$('#txtMaximoTicketId').val(obj.ticketMaximo[0].idTicket);

									if (pMaximoTicketId == 0) {
										$('#txtMaximoResumen').val(obj.ticketMaximo[0].resumen);
										$('#txtHoraNotificacionIbm').val(obj.ticketMaximo[0].fechaCreacion.substring(0,16));
									}

									$('#txtMaximoDetalle').val(obj.ticketMaximo[0].detalle);
									$('#txtMaximoPrioridad').val(obj.ticketMaximo[0].prioridad);
									$('#txtMaximoFechaCreacion').val(obj.ticketMaximo[0].fechaCreacion);

									$('#txtMaximoIdEstado').val(obj.ticketMaximo[0].idEstado);
									$('#cboMaximoEstado').val(obj.ticketMaximo[0].idEstado).trigger("change");
									// 						$('#txtMaximoIdGrupoPropietario').val(obj.ticketMaximo[0].idGrupoPropietario);
									$('#cboMaximoGrupoPropietario').val(obj.ticketMaximo[0].idGrupoPropietario).trigger("change");
									// 						$('#txtMaximoGrupoPropietario').val(obj.ticketMaximo[0].grupoPropietario);
									// 						$('#txtMaximoIdGrupoResolutor').val(obj.ticketMaximo[0].idGrupoPropietario);
									// 						$('#cboMaximoGrupoResolutor').val(obj.ticketMaximo[0].idGrupoPropietario).trigger("change");
									// 						$('#txtMaximoGrupoResolutor').val(obj.ticketMaximo[0].grupoPropietario);

									$('#txtMaximoIdCliente').attr("readonly",true);
									$('#cboMaximoCliente').attr("disabled",true);
									$('#txtMaximoDetalle').attr("readonly",false);
									$('#txtMaximoPrioridad').attr("readonly",true);
									$('#txtMaximoFechaCreacion').attr("readonly", true);
									$('#txtMaximoFechaCreacion').removeClass("dateTimePicker");
									$('#txtMaximoIdEstado').attr("readonly",true);
									$('#cboMaximoEstado').attr("disabled", true);
									// 						$('#txtMaximoIdGrupoPropietario').attr("readonly", true);
									// 						$('#txtMaximoGrupoPropietario').attr("readonly", true);
								} else {
									if (pMaximoTicketId == 0) {
										$('#txtMaximoIdCliente').val('');
										$('#cboMaximoCliente').val('').trigger("change");
										$('#txtMaximoResumen').val('');
										$('#txtMaximoDetalle').val('');
										$('#txtMaximoPrioridad').val('');
										$('#txtMaximoFechaCreacion').val('');
										$('#txtMaximoIdEstado').val('');
										$('#cboMaximoEstado').val('').trigger("change");
										$('#txtMaximoIdGrupoPropietario').val('');
										$('#txtMaximoGrupoPropietario').val('');
									}

									$('#txtMaximoIdCliente').attr("readonly",false);
									$('#cboMaximoCliente').attr("disabled",false);
									$('#txtMaximoResumen').attr("readonly",false);
									$('#txtMaximoDetalle').attr("readonly",false);
									$('#txtMaximoPrioridad').attr("readonly",false);
									$('#txtMaximoFechaCreacion').attr("readonly", false);
									$('#txtMaximoFechaCreacion').removeClass("dateTimePickerAux");
									$('#txtMaximoFechaCreacion').addClass("dateTimePickerAux");

									$('#txtMaximoIdEstado').attr("readonly",false);
									$('#cboMaximoEstado').attr("disabled",false);
									// 						$('#txtMaximoIdGrupoPropietario').attr("readonly", false);
									// 						$('#txtMaximoGrupoPropietario').attr("readonly", false);
								}
							}
							
							

							$('.dateTimePickerAux').datetimepicker({
								format : 'YYYY-MM-DD HH:mm:ss',
								tooltips : {
									today : 'Ir al día de hoy',
									clear : 'Limpiar selección',
									close : 'Cerrar calendario',
									selectMonth : 'Seleccionar Mes',
									prevMonth : 'Mes anterior',
									nextMonth : 'Mes siguiente',
									selectYear : 'Seleccionar año',
									prevYear : 'Año anterior',
									nextYear : 'Año siguiente',
									selectDecade : 'Seleccionar una decada',
									prevDecade : 'Decada anterior',
									nextDecade : 'Decada siguiente',
									prevCentury : 'Siglo anterior',
									nextCentury : 'Siglo siguiente'
								}
							});
							
							
							
						});

	}

	function listGrupoDistribucion(tipo, team) {
		$(document).ready(function() {

			var src = "ServletAlertaEjecutiva";
			$.post(src, {
				strOperation : "listGrupoDistribucion",
				strType : tipo,
				iNivel : "1",
				iTeam : team
			}, function(pdata) {
				// 				console.log(pdata);
				var obj = JSON.parse(pdata);

				if (obj.listGrupoDistribucion.length > 0) {
					$('#cboListaDistribucion option').remove();
// 					$('#cboListaDistribucion').append($('<option>', {
// 						value : '',
// 						text : ''
// 					}));

					$.each(obj.listGrupoDistribucion, function(i, item) {
						$('#cboListaDistribucion').append($('<option>', {
							value : item.descripcion,
							text : item.descripcion
						}));
					});
				}
			});

			$.post(src, {
				strOperation : "listGrupoDistribucion",
				strType : tipo,
				iNivel : "2",
				iTeam : team
			}, function(pdata) {
				// 				console.log(pdata);
				var obj = JSON.parse(pdata);

				if (obj.listGrupoDistribucion.length > 0) {
					$('#cboEmailAlternativo option').remove();
					// 						$('#cboEmailAlternativo').append($('<option>', {
					// 							value : '',
					// 							text : ''
					// 						}));

					$.each(obj.listGrupoDistribucion, function(i, item) {
						$('#cboEmailAlternativo').append($('<option>', {
							value : item.valor2,
							text : item.valor1
						}));
					});
				}
			});

		});
	}

	function listOptions(tipo, team) {
		$(document).ready(function() {

							var src = "ServletWOptions";
							$.post(src,{strOperation : "listOptions",strType : tipo,iTeam : team},
											function(pdata) {
												// 				alert(pdata);
												var obj = JSON.parse(pdata);

												if (obj.reporte.length > 0) {

													if (tipo == "ESTADO_ALERTA") {
														$('#cboEstadoAlerta option').remove();
														$('#cboEstadoAlerta').append($('<option>',{value : '',text : ''}));

														$.each(obj.reporte,function(i,item) {
																			$('#cboEstadoAlerta').append(
																							$('<option>',
																									{
																										value : item.idOption,
																										text : item.descripcion
																									}));
																		});
													} else if (tipo == "CLIENTE_ALERTA") {
														$(
																'#cboMaximoCliente option')
																.remove();
														$('#cboMaximoCliente')
																.append(
																		$(
																				'<option>',
																				{
																					value : '',
																					text : ''
																				}));

														$
																.each(
																		obj.reporte,
																		function(
																				i,
																				item) {
																			$(
																					'#cboMaximoCliente')
																					.append(
																							$(
																									'<option>',
																									{
																										value : item.valor1,
																										text : item.descripcion
																									}));
																		});
													} else if (tipo == "ESTADOMAXIMO_ALERTA") {
														$(
																'#cboMaximoEstado option')
																.remove();
														$('#cboMaximoEstado')
																.append(
																		$(
																				'<option>',
																				{
																					value : '',
																					text : ''
																				}));

														$
																.each(
																		obj.reporte,
																		function(
																				i,
																				item) {
																			$(
																					'#cboMaximoEstado')
																					.append(
																							$(
																									'<option>',
																									{
																										value : item.valor1,
																										text : item.descripcion
																									}));
																		});
													} else if (tipo == "PM_ALERTA") {
														$('#txtPm option')
																.remove();
														$('#txtPm').append(
																$('<option>', {
																	value : '',
																	text : ''
																}));

														$
																.each(
																		obj.reporte,
																		function(
																				i,
																				item) {
																			$(
																					'#txtPm')
																					.append(
																							$(
																									'<option>',
																									{
																										value : item.idOption,
																										text : item.descripcion
																									}));
																		});
														// 					} else if (tipo == "CRISIS_TURNO_ALERTA") {
														// 						$('#txtCrisisTurno option').remove();
														// 						$('#txtCrisisTurno').append($('<option>', {
														// 							value : '',
														// 							text : ''
														// 						}));

														// 						$.each(obj.reporte, function(i, item) {
														// 							$('#txtCrisisTurno').append($('<option>', {
														// 								value : item.idOption,
														// 								text : item.descripcion
														// 							}));
														// 						});
													} else if (tipo == "DATACENTER_ALERTA") {
														$(
																'#cboDataCenter option')
																.remove();
														$('#cboDataCenter')
																.append(
																		$(
																				'<option>',
																				{
																					value : '',
																					text : ''
																				}));

														$
																.each(
																		obj.reporte,
																		function(
																				i,
																				item) {
																			$(
																					'#cboDataCenter')
																					.append(
																							$(
																									'<option>',
																									{
																										value : item.idOption,
																										text : item.descripcion
																									}));
																		});
													} else if (tipo == "TIPOFALLA_ALERTA") {
														$(
																'#cboTipoFalla option')
																.remove();
														$('#cboTipoFalla')
																.append(
																		$(
																				'<option>',
																				{
																					value : '',
																					text : ''
																				}));

														$
																.each(
																		obj.reporte,
																		function(
																				i,
																				item) {
																			$(
																					'#cboTipoFalla')
																					.append(
																							$(
																									'<option>',
																									{
																										value : item.idOption,
																										text : item.descripcion
																									}));
																		});
													} else if (tipo == "PROPIEDADINC_ALERTA") {
														$(
																'#cboPropiedadInc option')
																.remove();
														$('#cboPropiedadInc')
																.append(
																		$(
																				'<option>',
																				{
																					value : '',
																					text : ''
																				}));

														$
																.each(
																		obj.reporte,
																		function(
																				i,
																				item) {
																			$(
																					'#cboPropiedadInc')
																					.append(
																							$(
																									'<option>',
																									{
																										value : item.idOption,
																										text : item.descripcion
																									}));
																		});
													} else if (tipo == "SLA_ALERTA") {
														$('#cboSla option')
																.remove();
														$('#cboSla').append(
																$('<option>', {
																	value : '',
																	text : ''
																}));

														$
																.each(
																		obj.reporte,
																		function(
																				i,
																				item) {
																			$(
																					'#cboSla')
																					.append(
																							$(
																									'<option>',
																									{
																										value : item.idOption,
																										text : item.descripcion
																									}));
																		});
													} else if (tipo == "CAMBIO_PRIORIDAD_ALERTA") {
														$(
																'#cboCambioPrioridad option')
																.remove();
														$('#cboCambioPrioridad')
																.append(
																		$(
																				'<option>',
																				{
																					value : '',
																					text : ''
																				}));

														$
																.each(
																		obj.reporte,
																		function(
																				i,
																				item) {
																			$(
																					'#cboCambioPrioridad')
																					.append(
																							$(
																									'<option>',
																									{
																										value : item.idOption,
																										text : item.descripcion
																									}));
																		});
													} else if (tipo == "TIPO_NOTIFICACION_ALERTA") {
														$(
																'#cboTipoNotificacion option')
																.remove();
														$(
																'#cboTipoNotificacion')
																.append(
																		$(
																				'<option>',
																				{
																					value : '',
																					text : ''
																				}));

														$
																.each(
																		obj.reporte,
																		function(
																				i,
																				item) {
																			$(
																					'#cboTipoNotificacion')
																					.append(
																							$(
																									'<option>',
																									{
																										value : item.idOption,
																										text : item.descripcion
																									}));
																		});
													} else if (tipo == "TIPONOTIFICADO_ALERTAS") {
														$(
																'#cboNotificado option')
																.remove();
														$('#cboNotificado')
																.append(
																		$(
																				'<option>',
																				{
																					value : '',
																					text : ''
																				}));

														$
																.each(
																		obj.reporte,
																		function(
																				i,
																				item) {
																			$(
																					'#cboNotificado')
																					.append(
																							$(
																									'<option>',
																									{
																										value : item.idOption,
																										text : item.descripcion
																									}));
																		});
													} else if (tipo == "DESVIACION_ESTANDAR") {
														$(
																'#cboDesviacionIncidencia option')
																.remove();
														// 						$('#cboDesviacionIncidencia').append($('<option>', {
														// 							value : '',
														// 							text : ''
														// 						}));

														$
																.each(
																		obj.reporte,
																		function(
																				i,
																				item) {
																			$(
																					'#cboDesviacionIncidencia')
																					.append(
																							$(
																									'<option>',
																									{
																										value : item.descripcion,
																										text : item.descripcion
																									}));
																		});
														$(
																'#cboDesviacionIncidencia')
																.select2(
																		{
																			placeholder : ' -- Seleccionar -- ',
																			width : 'resolve'
																		});
														// 						document.getElementById('cboDesviacionIncidencia').style.width = '100%';
													} else if (tipo == "GRUPOPROPIETARIO_ALERTA") {
														$(
																'#cboMaximoGrupoPropietario option')
																.remove();
														$(
																'#cboMaximoGrupoResolutor option')
																.remove();

														$(
																'#cboMaximoGrupoPropietario')
																.append(
																		$(
																				'<option>',
																				{
																					value : '',
																					text : ''
																				}));
														$(
																'#cboMaximoGrupoResolutor')
																.append(
																		$(
																				'<option>',
																				{
																					value : '',
																					text : ''
																				}));

														$
																.each(
																		obj.reporte,
																		function(
																				i,
																				item) {
																			$(
																					'#cboMaximoGrupoPropietario')
																					.append(
																							$(
																									'<option>',
																									{
																										value : item.valor1,
																										text : item.descripcion
																									}));
																			$(
																					'#cboMaximoGrupoResolutor')
																					.append(
																							$(
																									'<option>',
																									{
																										value : item.valor1,
																										text : item.descripcion
																									}));
																		});
														$(
																'#cboMaximoGrupoPropietario')
																.select2(
																		{
																			placeholder : ' -- Seleccionar -- ',
																			width : 'resolve'
																		});
														$(
																'#cboMaximoGrupoResolutor')
																.select2(
																		{
																			placeholder : ' -- Seleccionar -- ',
																			width : 'resolve'
																		});
													}

													// 				$('.cbo2').select2({placeholder: ' -- Seleccionar -- ',width: 'resolve'});

												}
											});
						});
	}

	function limpiar() {

		$('#txtUsuarioCreador').val('');
		$('#txtUsuarioModificador').val('');
		// 		$('#hdIdAlerta').val('');
		$('#hdTipo').val('');

		$('#txtMaximoIdCliente').val('');
		$('#cboMaximoCliente').val('').trigger("change");
		$('#txtMaximoTicketId').val('');
		$('#txtMaximoResumen').val('');
		$('#txtMaximoDetalle').val('');
		$('#txtMaximoPrioridad').val('');
		$('#txtMaximoFechaCreacion').val('');
		$('#txtMaximoIdEstado').val('');
		$('#cboMaximoEstado').val('').trigger("change");

		$('#txtMaximoIdGrupoPropietario').val('');
		$('#cboMaximoGrupoPropietario').val('').trigger("change");
		$('#txtMaximoGrupoPropietarioPais').val('');

		$('#txtMaximoIdGrupoResolutor').val('');
		$('#cboMaximoGrupoResolutor').val('').trigger("change");
		$('#txtMaximoGrupoResolutorPais').val('');

		$('#txtMaximoIdGrupoPropietario').val('');
		$('#txtMaximoGrupoPropietario').val('');
		$('#txtHoraNotificacionIbm').val('');
		$('#txtHoraFin').val('');

		$('#cboEstadoAlerta').val('').trigger("change");
		$('#txtPm').val('').trigger("change");
		// 		$('#txtCrisisTurno').val('').trigger("change");
		$('#txtCrisisTurno').val('');
		$('#cboDataCenter').val('').trigger("change");

		$('#cboTeamSoporte').val('').trigger("change");
		$('#cboTipoFalla').val('').trigger("change");
		$('#cboPropiedadInc').val('').trigger("change");
		$('#cboSla').val('').trigger("change");
		$('#cboTipoNotificacion').val('').trigger("change");
		$('#cboListaDistribucion').val('').trigger("change");
		$('#cboCambioPrioridad').val('').trigger("change");

		document.getElementById('chkIncidenteConcurrente').checked = false;
		document.getElementById('chkOtrosClientes').checked = false;

		$('#txtServicioImpactado').val('');
		$('#txtImpactoNegocio').val('');

		$('#txtDetalleAlerta').val('');

		$('#txtTicketProblema').val('');
		$('#txtTicketCambio').val('');
		document.getElementById('chkCambioPrioridad').checked = false;
		// 		document.getElementById('chkRecibioAlerta').checked = false;
		$('#cboNotificado').val('').trigger("change");
		$('#txtDerivoCambio').val('');
		// 		$('#txtDesviacionIncidencia').val('');
		$('#cboDesviacionIncidencia').val('').trigger("change");
		$('#txtEvaluacionCrisis').val('');
		$('#txtObservaciones').val('');
		$('#cboEmailAlternativo').val('').trigger("change");
	}

	function bloquear(pintModo) {

		(pintModo == 1) ? $('#txtUsuarioCreador').attr("disabled", true) : $(
				'#txtUsuarioCreador').attr("disabled", false);
		(pintModo == 1) ? $('#txtUsuarioModificador').attr("disabled", true)
				: $('#txtUsuarioModificador').attr("disabled", false);
		(pintModo == 1) ? $('#hdIdAlerta').attr("disabled", true) : $(
				'#hdIdAlerta').attr("disabled", false);

		(pintModo == 1) ? $('#cboEstadoAlerta').attr("disabled", true) : $(
				'#cboEstadoAlerta').attr("disabled", false);
		// 		(pintModo == 1 ) ? $('#txtMaximoIdCliente').attr("disabled", true) : $('#txtMaximoIdCliente').attr("disabled", false);
		// 		(pintModo == 1 ) ? $('#cboMaximoCliente').attr("disabled", true) : $('#cboMaximoCliente').attr("disabled", false);
		// 		(pintModo == 1 ) ? $('#txtMaximoTicketId').attr("disabled", true) : $('#txtMaximoTicketId').attr("disabled", false);
		$('#txtMaximoTicketId').attr("disabled", true);
		// 		(pintModo == 1 ) ? $('#txtMaximoResumen').attr("disabled", true) : $('#txtMaximoResumen').attr("disabled", false);
		// 		(pintModo == 1 ) ? $('#txtMaximoDetalle').attr("disabled", true) : $('#txtMaximoDetalle').attr("disabled", false);
		// 		(pintModo == 1 ) ? $('#txtMaximoPrioridad').attr("disabled", true) : $('#txtMaximoPrioridad').attr("disabled", false);
		// 		(pintModo == 1 ) ? $('#txtMaximoFechaCreacion').attr("disabled", true) : $('#txtMaximoFechaCreacion').attr("disabled", false);
		// 		(pintModo == 1 ) ? $('#txtMaximoIdEstado').attr("disabled", true) : $('#txtMaximoIdEstado').attr("disabled", false);
		// 		(pintModo == 1 ) ? $('#cboMaximoEstado').attr("disabled", true) : $('#cboMaximoEstado').attr("disabled", false);

		// 		(pintModo == 1 ) ? $('#txtMaximoIdGrupoPropietario').attr("disabled", true) : $('#txtMaximoIdGrupoPropietario').attr("disabled", false);
		// 		(pintModo == 1 ) ? $('#txtMaximoGrupoPropietario').attr("disabled", true) : $('#txtMaximoGrupoPropietario').attr("disabled", false);
		(pintModo == 1) ? $('#txtPm').attr("disabled", true) : $('#txtPm')
				.attr("disabled", false);
		(pintModo == 1) ? $('#txtCrisisTurno').attr("disabled", true) : $(
				'#txtCrisisTurno').attr("disabled", false);
		(pintModo == 1) ? $('#txtHoraNotificacionIbm').attr("disabled", true)
				: $('#txtHoraNotificacionIbm').attr("disabled", false);
		(pintModo == 1) ? $('#cboDataCenter').attr("disabled", true) : $(
				'#cboDataCenter').attr("disabled", false);
		(pintModo == 1) ? $('#txtHoraFin').attr("disabled", true) : $(
				'#txtHoraFin').attr("disabled", false);
		// var vcboTeamSoporte= $('#cboTeamSoporte').val();

		(pintModo == 1) ? $('#cboTipoFalla').attr("disabled", true) : $(
				'#cboTipoFalla').attr("disabled", false);
		(pintModo == 1) ? $('#chkIncidenteConcurrente').attr("disabled", true)
				: $('#chkIncidenteConcurrente').attr("disabled", false);
		(pintModo == 1) ? $('#chkOtrosClientes').attr("disabled", true) : $(
				'#chkOtrosClientes').attr("disabled", false);
		(pintModo == 1) ? $('#cboPropiedadInc').attr("disabled", true) : $(
				'#cboPropiedadInc').attr("disabled", false);
		(pintModo == 1) ? $('#txtServicioImpactado').attr("disabled", true)
				: $('#txtServicioImpactado').attr("disabled", false);
		(pintModo == 1) ? $('#cboSla').attr("disabled", true) : $('#cboSla')
				.attr("disabled", false);
		(pintModo == 1) ? $('#txtImpactoNegocio').attr("disabled", true) : $(
				'#txtImpactoNegocio').attr("disabled", false);
		(pintModo == 1) ? $('#txtTicketProblema').attr("disabled", true) : $(
				'#txtTicketProblema').attr("disabled", false);
		(pintModo == 1) ? $('#txtTicketCambio').attr("disabled", true) : $(
				'#txtTicketCambio').attr("disabled", false);
		(pintModo == 1) ? $('#chkCambioPrioridad').attr("disabled", true) : $(
				'#chkCambioPrioridad').attr("disabled", false);
		(pintModo == 1) ? $('#cboCambioPrioridad').attr("disabled", true) : $(
				'#cboCambioPrioridad').attr("disabled", false);
		(pintModo == 1) ? $('#cboNotificado').attr("disabled", true) : $(
				'#cboNotificado').attr("disabled", false);
		(pintModo == 1) ? $('#txtDerivoCambio').attr("disabled", true) : $(
				'#txtDerivoCambio').attr("disabled", false);
		// 		(pintModo == 1 ) ? $('#txtDesviacionIncidencia').attr("disabled", true) : $('#txtDesviacionIncidencia').attr("disabled", false);
		(pintModo == 1) ? $('#cboDesviacionIncidencia').attr("disabled", true)
				: $('#cboDesviacionIncidencia').attr("disabled", false);
		(pintModo == 1) ? $('#txtEvaluacionCrisis').attr("disabled", true) : $(
				'#txtEvaluacionCrisis').attr("disabled", false);
		(pintModo == 1) ? $('#txtObservaciones').attr("disabled", true) : $(
				'#txtObservaciones').attr("disabled", false);

		(pintModo == 1) ? $('#cboTipoNotificacion').attr("disabled", true) : $(
				'#cboTipoNotificacion').attr("disabled", false);
		(pintModo == 1) ? $('#cboListaDistribucion').attr("disabled", true)
				: $('#cboListaDistribucion').attr("disabled", false);
		(pintModo == 1) ? $('#cboEmailAlternativo').attr("disabled", true) : $(
				'#cboEmailAlternativo').attr("disabled", false);

		if (pintModo == 1) {
			$('#btnConsultarMaximo').removeClass('disabled');
			$('#btnConsultarMaximo').addClass('disabled');

			$('#btnAddDetalle').removeClass('disabled');
			$('#btnAddDetalle').addClass('disabled');

			$('#btnGuardarAlerta').removeClass('disabled');
			$('#btnGuardarAlerta').addClass('disabled');
		} else {
			$('#btnConsultarMaximo').removeClass('disabled');
			$('#btnAddDetalle').removeClass('disabled');
			$('#btnGuardarAlerta').removeClass('disabled');
		}
		$('#btnConsultarMaximo').removeClass('hidden');
		$('#btnConsultarMaximo').addClass('hidden');
	}

	function listarAlertaPorId(idAlerta, itipo) {

		var src = 'ServletAlertaEjecutiva';
		$
				.post(
						src,
						{
							strOperation : "consultar",
							pidAlerta : idAlerta
						},
						function(pdata) {
							// 			alert(pdata);
							var obj = JSON.parse(pdata);

							$('#hdTipo').val(itipo);

							for (i = 0; i < obj.objAlertaEjecutiva.length; i++) {

								if (itipo == 2)
									buscarTicket(obj.objAlertaEjecutiva[i].ptxtMaximoTicketId);

								$('#txtUsuarioCreador')
										.val(
												obj.objAlertaEjecutiva[i].pusuarioCreador);
								$('#txtUsuarioModificador')
										.val(
												obj.objAlertaEjecutiva[i].pusuarioModificador);
								$('#hdIdAlerta').val(
										obj.objAlertaEjecutiva[i].piAlerta);

								$('#txtMaximoIdCliente')
										.val(
												obj.objAlertaEjecutiva[i].ptxtMaximoIdCliente);
								$('#cboMaximoCliente')
										.val(
												obj.objAlertaEjecutiva[i].ptxtMaximoIdCliente)
										.trigger("change");
								$('#txtMaximoTicketId')
										.val(
												obj.objAlertaEjecutiva[i].ptxtMaximoTicketId);
								$('#txtMaximoResumen')
										.val(
												obj.objAlertaEjecutiva[i].ptxtMaximoResumen);
								$('#txtMaximoDetalle')
										.val(
												obj.objAlertaEjecutiva[i].ptxtMaximoDetalle);
								$('#txtMaximoPrioridad')
										.val(
												obj.objAlertaEjecutiva[i].ptxtMaximoPrioridad);
								$('#txtMaximoFechaCreacion')
										.val(
												obj.objAlertaEjecutiva[i].ptxtMaximoFechaCreacion);
								$('#txtMaximoIdEstado')
										.val(
												obj.objAlertaEjecutiva[i].ptxtMaximoIdEstado);
								$('#cboMaximoEstado')
										.val(
												obj.objAlertaEjecutiva[i].ptxtMaximoIdEstado)
										.trigger("change");

								$('#txtMaximoIdGrupoPropietario')
										.val(
												obj.objAlertaEjecutiva[i].ptxtMaximoIdGrupoPropietario);
								$('#txtMaximoGrupoPropietario')
										.val(
												obj.objAlertaEjecutiva[i].ptxtMaximoGrupoPropietario);

								$('#txtHoraNotificacionIbm')
										.val(
												obj.objAlertaEjecutiva[i].ptxtHoraNotificacionIbm);

								$('#txtHoraFin').val(
										obj.objAlertaEjecutiva[i].ptxtHoraFin);

								document
										.getElementById('chkIncidenteConcurrente').checked = (obj.objAlertaEjecutiva[i].pchkIncidenteConcurrente == '1' ? true
										: false);
								document.getElementById('chkOtrosClientes').checked = (obj.objAlertaEjecutiva[i].pchkOtrosClientes == '1' ? true
										: false);
								// 				$('#chkIncidenteConcurrente').val() == true ? '1': '0';
								// 				$('#chkOtrosClientes').val() == true ? '1': '0';

								$('#txtServicioImpactado')
										.val(
												obj.objAlertaEjecutiva[i].ptxtServicioImpactado);

								$('#txtImpactoNegocio')
										.val(
												obj.objAlertaEjecutiva[i].ptxtImpactoNegocio);
								$('#txtTicketProblema')
										.val(
												obj.objAlertaEjecutiva[i].ptxtTicketProblema);
								$('#txtTicketCambio')
										.val(
												obj.objAlertaEjecutiva[i].ptxtTicketCambio);

								document.getElementById('chkCambioPrioridad').checked = (obj.objAlertaEjecutiva[i].pchkCambioPrioridad == '1' ? true
										: false);
								$('#cboNotificado')
										.val(
												obj.objAlertaEjecutiva[i].pcboNotificado)
										.trigger("change");

								$('#txtDerivoCambio')
										.val(
												obj.objAlertaEjecutiva[i].ptxtDerivoCambio);

								var selectedValues = obj.objAlertaEjecutiva[i].pcboDesviacionIncidencia
										.split(',');
								var select = document
										.getElementById('cboDesviacionIncidencia');
								for (j = 0; j < selectedValues.length; j++) {
									var opt = document.createElement('option');
									opt.value = selectedValues[j];
									opt.innerHTML = selectedValues[j];
									// 				    select.appendChild(opt);
								}

								$('#cboDesviacionIncidencia').val(
										selectedValues).trigger("change");
								$('#txtEvaluacionCrisis')
										.val(
												obj.objAlertaEjecutiva[i].ptxtEvaluacionCrisis);
								$('#txtObservaciones')
										.val(
												obj.objAlertaEjecutiva[i].ptxtObservaciones);

								// 				$('#cboTeamSoporte option').remove();
								// 				$('#cboTeamSoporte').val(null).trigger("change");
								var selectedValues = obj.objAlertaEjecutiva[i].pcboTeamSoporte
										.split(',');
								var select = document
										.getElementById('cboTeamSoporte');
								for (j = 0; j < selectedValues.length; j++) {
									var opt = document.createElement('option');
									opt.value = selectedValues[j];
									opt.innerHTML = selectedValues[j];
									// 				    select.appendChild(opt);
								}

								$('#cboTeamSoporte').val(selectedValues)
										.trigger("change");
								$('#cboEstadoAlerta')
										.val(
												obj.objAlertaEjecutiva[i].pcboEstadoAlerta)
										.trigger("change");
								$('#txtPm').val(
										obj.objAlertaEjecutiva[i].ptxtPm)
										.trigger("change");
								$('#txtCrisisTurno')
										.val(
												obj.objAlertaEjecutiva[i].ptxtCrisisTurno);
								$('#cboDataCenter')
										.val(
												obj.objAlertaEjecutiva[i].pcboDataCenter)
										.trigger("change");
								$('#cboTipoFalla')
										.val(
												obj.objAlertaEjecutiva[i].pcboTipoFalla)
										.trigger("change");
								$('#cboPropiedadInc')
										.val(
												obj.objAlertaEjecutiva[i].pcboPropiedadInc)
										.trigger("change");
								$('#cboSla').val(
										obj.objAlertaEjecutiva[i].pcboSla)
										.trigger("change");

								if (obj.objAlertaEjecutiva[i].chkCambioPrioridad == 1) {
									// 					console.log('Ingresé');
									document
											.getElementById('chkCambioPrioridad').checked = true;
									$('#cboCambioPrioridad')
											.val(
													obj.objAlertaEjecutiva[i].pcboCambioPrioridad)
											.trigger("change");
									$('#dvCambioP').removeClass('hidden');
								} else {
									// 					console.log('Está vacío cambio Prioridad');
									document
											.getElementById('chkCambioPrioridad').checked = false;
									$('#cboCambioPrioridad').val('').trigger(
											"change");
									$('#dvCambioP').removeClass('hidden');
									$('#dvCambioP').addClass('hidden');
								}

								// 				console.log(obj.objAlertaEjecutiva[i]);

								$('#cboTipoNotificacion')
										.val(
												obj.objAlertaEjecutiva[i].pcboTipoNotificacion)
										.trigger("change");
								// 				$('#cboListaDistribucion').val(obj.objAlertaEjecutiva[i].pcboListaDistribucion).trigger("change");

								// 				$('#cboEmailAlternativo').val(obj.objAlertaEjecutiva[i].pcboEmailAlternativo).trigger("change");
								// 				$('#cboEmailAlternativo option').remove();
								var selectedValues = obj.objAlertaEjecutiva[i].pcboEmailAlternativo
										.split(',');
								var select = document
										.getElementById('cboEmailAlternativo');
								for (j = 0; j < selectedValues.length; j++) {
									var opt = document.createElement('option');
									opt.value = selectedValues[j];
									opt.innerHTML = selectedValues[j];
									// 				    select.appendChild(opt);
								}
								$('#cboEmailAlternativo').val(selectedValues)
										.trigger("change");

							}
						});
	}

	function guardarDetalle() {
		// 		alert($('#txtDetalleAlerta').text() + '  |  ' + $('#txtDetalleAlerta').val());
		var ptipo = $('#hdtipoDetalle').val();
		var vidDetAlerta = $('#hdIdDetalle').val();
		var vtxtDetalleAlerta = $('#txtDetalleAlerta').val();
		vtxtDetalleAlerta = vtxtDetalleAlerta.split("\n").join("||");

		var vhdIdAlerta = $('#hdIdAlerta').val();
		ptipo = (ptipo == '' ? '1' : ptipo);
		// 		console.log(vidDetAlerta);
		vidDetAlerta = (vidDetAlerta == '' ? '0' : vidDetAlerta);

		// 		console.log(vidDetAlerta);

		//vIdUsuario
		var src = 'ServletAlertaEjecutiva';
		var vstrOperacion = '';
		if (ptipo == '1')
			vstrOperacion = 'guardarDetalle';
		else if (ptipo == '2')
			vstrOperacion = 'actualizarDetalle';
		else if (ptipo == '3')
			vstrOperacion = 'eliminarDetalle';

		$.post(src, {
			strOperation : vstrOperacion,
			phdIdAlerta : vhdIdAlerta,
			pidDetAlerta : vidDetAlerta,
			ptxtDetalleAlerta : vtxtDetalleAlerta,
			pusuario : vIdUsuario
		}, function(pdata) {
			// 		console.log(pdata);
			if (pdata == "ok") {
				listDetalleAlerta(vhdIdAlerta);
				$('#hdtipoDetalle').val('');
				$('#txtDetalleAlerta').val('');
			}
		});
	}

	function eliminarAlerta() {

		var vhdIdAlerta = $('#hdIdAlerta').val();
		var vtipo = $('#hdTipo').val();
		var vstrOperacion = 'eliminar';
		var src = 'ServletAlertaEjecutiva';

		$
				.post(
						src,
						{
							strOperation : vstrOperacion,
							phdIdAlerta : vhdIdAlerta,
							phdIdTeam : vTeam,
							pusuario : vIdUsuario
						},
						function(pdata) {
							if (pdata == "ok") {
								$('#mdEliminar').modal('hide');
								listReportPendientes();
								$('#lblMensaje').text(
										'Se eliminó correctamente el ticket: '
												+ $('#lblTicketId').text());
								$('#lblMensaje').removeClass();
								$('#lblMensaje')
										.addClass('label label-success');
							} else {
								listReportPendientes();
								$('#lblMensaje')
										.text(
												'No se completó la transacción del ticket: '
														+ $('#lblTicketId')
																.text()
														+ ', por favor vuelva a intentarlo en breves minutos.');
								$('#lblMensaje').removeClass();
								$('#lblMensaje').addClass('label label-danger');
							}
						});
	}

	function guardarAlerta() {

		$('#dvLoadP1').removeClass('overlay');
		$('#dvLoadP1').addClass('overlay');
		document.getElementById('dvLoadP1').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';

		$('#dvLoadP2').removeClass('overlay');
		$('#dvLoadP2').addClass('overlay');
		document.getElementById('dvLoadP2').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';

		$('#dvLoadP3').removeClass('overlay');
		$('#dvLoadP3').addClass('overlay');
		document.getElementById('dvLoadP3').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';

		var validarForm = validar();
		if (validarForm.length > 0) {
			alert('Favor de seleccionar los siguientes campos obligatorios: \n'
					+ validarForm);
			document.getElementById('dvLoadP1').innerHTML = '';
			$('#dvLoadP1').removeClass('overlay');

			document.getElementById('dvLoadP2').innerHTML = '';
			$('#dvLoadP2').removeClass('overlay');

			document.getElementById('dvLoadP3').innerHTML = '';
			$('#dvLoadP3').removeClass('overlay');
			return;
		}

		var vtxtUsuarioCreador = $('#txtUsuarioCreador').val();
		var vtxtUsuarioModificador = $('#txtUsuarioModificador').val();
		var vhdIdAlerta = ($('#hdIdAlerta').val() == '' ? 0 : $('#hdIdAlerta')
				.val());

		var vcboEstadoAlerta = ($('#cboEstadoAlerta').val() == '' ? 'null' : $(
				'#cboEstadoAlerta').val());
		var vcboEstadoAlertaText = ($('#cboEstadoAlerta option:selected')
				.text() == '' ? 'null' : $('#cboEstadoAlerta option:selected')
				.text());
		var vtxtMaximoIdCliente = ($('#txtMaximoIdCliente').val() == '' ? 'null'
				: $('#txtMaximoIdCliente').val());

		var data1 = $('#cboMaximoCliente').select2('data');
		var vcboMaximoCliente = '';
		if (data1)
			vcboMaximoCliente = data1[0].text;
		else
			vcboMaximoCliente = '';

		// 		var vcboMaximoCliente = ($('#cboMaximoCliente').val() == '' ? 'null' : $('#cboMaximoCliente').val());
		var vtxtMaximoTicketId = ($('#txtMaximoTicketId').val() == '' ? 'null'
				: $('#txtMaximoTicketId').val());
		var vtxtMaximoResumen = ($('#txtMaximoResumen').val() == '' ? 'null'
				: $('#txtMaximoResumen').val());
		var vtxtMaximoDetalle = ($('#txtMaximoDetalle').val() == '' ? 'null'
				: $('#txtMaximoDetalle').val());
		var vtxtMaximoPrioridad = ($('#txtMaximoPrioridad').val() == '' ? '0'
				: $('#txtMaximoPrioridad').val());
		var vtxtMaximoFechaCreacion = ($('#txtMaximoFechaCreacion').val() == 'null' ? 'null'
				: $('#txtMaximoFechaCreacion').val());
		var vtxtMaximoIdEstado = ($('#txtMaximoIdEstado').val() == '' ? 'null'
				: $('#txtMaximoIdEstado').val());

		var data2 = $('#cboMaximoEstado').select2('data');
		var vcboMaximoEstado = '';
		if (data2)
			vcboMaximoEstado = data2[0].text;
		else
			vcboMaximoEstado = '';

		// 		var vcboMaximoEstado = ($('#cboMaximoEstado').val() == '' ? 'null' : $('#cboMaximoEstado').val());

		var vtxtMaximoIdGrupoPropietario = ($('#txtMaximoIdGrupoPropietario')
				.val() == '' ? 'null' : $('#txtMaximoIdGrupoPropietario').val());
		var vtxtMaximoGrupoPropietario = ($('#txtMaximoGrupoPropietario').val() == '' ? 'null'
				: $('#txtMaximoGrupoPropietario').val());

		var vtxtMaximoIdGrupoResolutor = ($('#txtMaximoIdGrupoResolutor').val() == '' ? 'null'
				: $('#txtMaximoIdGrupoResolutor').val());
		var vtxtMaximoGrupoResolutor = ($('#txtMaximoGrupoResolutor').val() == '' ? 'null'
				: $('#txtMaximoGrupoResolutor').val());

		var vtxtPm = ($('#txtPm').val() == '' ? 'null' : $('#txtPm').val());
		var vtxtCrisisTurno = ($('#txtCrisisTurno').val() == '' ? 'null' : $(
				'#txtCrisisTurno').val());
		var vtxtHoraNotificacionIbm = ($('#txtHoraNotificacionIbm').val() == '' ? 'null'
				: $('#txtHoraNotificacionIbm').val());
		var vcboDataCenter = ($('#cboDataCenter').val() == '' ? 'null' : $(
				'#cboDataCenter').val());
		var vtxtHoraFin = ($('#txtHoraFin').val() == '' ? 'null' : $(
				'#txtHoraFin').val());

		var vcboTeamSoporte = ($('#cboTeamSoporte').val() == '' ? 'null' : $(
				'#cboTeamSoporte').val());
		var vcboTipoFalla = ($('#cboTipoFalla').val() == '' ? 'null' : $(
				'#cboTipoFalla').val());

		var vchkIncidenteConcurrente = (document
				.getElementById('chkIncidenteConcurrente').checked == true ? '1'
				: '0');
		var vchkOtrosClientes = (document.getElementById('chkOtrosClientes').checked == true ? '1'
				: '0');
		var vcboPropiedadInc = ($('#cboPropiedadInc').val() == '' ? 'null' : $(
				'#cboPropiedadInc').val());
		var vtxtServicioImpactado = ($('#txtServicioImpactado').val() == '' ? 'null'
				: $('#txtServicioImpactado').val());
		var vcboSla = ($('#cboSla').val() == '' ? 'null' : $('#cboSla').val());
		var vtxtImpactoNegocio = ($('#txtImpactoNegocio').val() == '' ? 'null'
				: $('#txtImpactoNegocio').val());
		var vtxtTicketProblema = ($('#txtTicketProblema').val() == '' ? 'null'
				: $('#txtTicketProblema').val());
		var vtxtTicketCambio = ($('#txtTicketCambio').val() == '' ? 'null' : $(
				'#txtTicketCambio').val());

		var vcboCambioPrioridad = (document
				.getElementById('chkCambioPrioridad').checked == true ? $('#cboCambioPrioridad').val() : '');
		var vcboNotificado = ($('#cboNotificado').val() == '' ? 'null' : $('#cboNotificado').val());

		var vtxtDerivoCambio = ($('#txtDerivoCambio').val() == '' ? 'null' : $('#txtDerivoCambio').val());
		// 		var vtxtDesviacionIncidencia = ($('#txtDesviacionIncidencia').val() == '' ? 'null' : $('#txtDesviacionIncidencia').val());
		var vcboDesviacionIncidencia = ($('#cboDesviacionIncidencia').val() == '' ? 'null' : $('#cboDesviacionIncidencia').val());
		var vtxtEvaluacionCrisis = ($('#txtEvaluacionCrisis').val() == '' ? 'null' : $('#txtEvaluacionCrisis').val());
		var vtxtObservaciones = ($('#txtObservaciones').val() == '' ? 'null' : $('#txtObservaciones').val());

		var vchkNotificar = (document.getElementById('chkNotificar').checked == true ? '1' : '0');
		var vcboTipoNotificacion = ($('#cboTipoNotificacion').val() == '' ? 'null' : $('#cboTipoNotificacion').val());
		var vcboListaDistribucion = ($('#cboListaDistribucion').val() != null ? $('#cboListaDistribucion').val().toString() : '');
		var vcboEmailAlternativo = ($('#cboEmailAlternativo').val() != null ? $('#cboEmailAlternativo').val().toString() : '');
		console.log(vcboEmailAlternativo);
		console.log((vcboEmailAlternativo != null ? vcboEmailAlternativo.toString() : ''));

		var vtipo = ($('#hdTipo').val() == '' ? 'null' : $('#hdTipo').val());
		var vstrOperacion = (vtipo == 1 ? 'guardar' : vtipo == 2 ? 'actualizar'
				: vtipo == 3 ? 'eliminar' : '');
		var src = 'ServletAlertaEjecutiva';

		// 		console.log('Envio de Json');
		$.post(src,{
							strOperation : vstrOperacion,
							phdIdAlerta : vhdIdAlerta,
							phdIdTeam : vTeam,
							pcboEstadoAlerta : vcboEstadoAlerta,
							pcboEstadoAlertaText : vcboEstadoAlertaText,
							ptxtMaximoIdCliente : vtxtMaximoIdCliente,
							pcboMaximoCliente : vcboMaximoCliente,
							ptxtMaximoTicketId : vtxtMaximoTicketId,
							ptxtMaximoResumen : vtxtMaximoResumen,
							ptxtMaximoDetalle : vtxtMaximoDetalle,
							ptxtMaximoPrioridad : vtxtMaximoPrioridad,
							ptxtMaximoFechaCreacion : vtxtMaximoFechaCreacion,
							ptxtMaximoIdEstado : vtxtMaximoIdEstado,
							pcboMaximoEstado : vcboMaximoEstado,
							ptxtMaximoIdGrupoPropietario : vtxtMaximoIdGrupoPropietario,
							ptxtMaximoIdGrupoResolutor : vtxtMaximoIdGrupoResolutor,
							ptxtPm : vtxtPm,
							ptxtCrisisTurno : vtxtCrisisTurno,
							ptxtHoraNotificacionIbm : vtxtHoraNotificacionIbm,
							pcboDataCenter : vcboDataCenter,
							ptxtHoraFin : vtxtHoraFin,
							pcboTeamSoporte : String(vcboTeamSoporte),
							pcboTipoFalla : vcboTipoFalla,
							pchkIncidenteConcurrente : vchkIncidenteConcurrente,
							pchkOtrosClientes : vchkOtrosClientes,
							pcboPropiedadInc : vcboPropiedadInc,
							ptxtServicioImpactado : vtxtServicioImpactado,
							pcboSla : vcboSla,
							ptxtImpactoNegocio : vtxtImpactoNegocio,
							ptxtTicketProblema : vtxtTicketProblema,
							ptxtTicketCambio : vtxtTicketCambio,
							pcboCambioPrioridad : vcboCambioPrioridad,
							pcboNotificado : vcboNotificado,
							ptxtDerivoCambio : vtxtDerivoCambio,
							pcboDesviacionIncidencia : String(vcboDesviacionIncidencia),
							ptxtEvaluacionCrisis : vtxtEvaluacionCrisis,
							ptxtObservaciones : vtxtObservaciones,
							pvchkNotificar : vchkNotificar,
							pvcboTipoNotificacion : vcboTipoNotificacion,
							pcboListaDistribucion : (vcboListaDistribucion != null ? vcboListaDistribucion.toString() : ''),
							pcboEmailAlternativo : (vcboEmailAlternativo != null ? vcboEmailAlternativo.toString() : ''),
							pusuario : vIdUsuario,
							pemail : vIdEmail
						},
						function(pdata) {
							// 			console.log(pdata);

							if (pdata == "ok") {
								$('#mdRegistroAlertaEjecutiva').modal('hide');
								listReportPendientes();
								$('#lblMensaje').text(
										'Se registró correctamente el ticket: '
												+ vtxtMaximoTicketId);
								$('#lblMensaje').removeClass();
								$('#lblMensaje')
										.addClass('label label-success');
							} else if (pdata == "failEmail") {
								listReportPendientes();
								$('#lblMensajeRegAlerta')
										.text(
												'Hubo un error al enviar la notificación del ticket: '
														+ vtxtMaximoTicketId
														+ ', por favor vuelva a intentarlo en breves minutos, desde la ventana de edición.');
								$('#lblMensajeRegAlerta').removeClass();
								$('#lblMensajeRegAlerta').addClass(
										'label label-danger');
							} else {
								listReportPendientes();
								$('#lblMensajeRegAlerta')
										.text(
												'No se pudo registrar el ticket: '
														+ vtxtMaximoTicketId
														+ ', por favor vuelva a intentarlo en breves minutos.');
								$('#lblMensajeRegAlerta').removeClass();
								$('#lblMensajeRegAlerta').addClass(
										'label label-danger');
							}
							document.getElementById('dvLoadP1').innerHTML = '';
							$('#dvLoadP1').removeClass('overlay');
							document.getElementById('dvLoadP2').innerHTML = '';
							$('#dvLoadP2').removeClass('overlay');
							document.getElementById('dvLoadP3').innerHTML = '';
							$('#dvLoadP3').removeClass('overlay');
						});
	}

	function openTicket(idAlerta, ticket) {

		$(document)
				.ready(
						function() {
							var src = "ServletAlertaEjecutiva";
							var vTipo = $('#cboTipoTicket').val();
							$
									.post(
											src,
											{
												strOperation : 'openTicket',
												pidAlerta : idAlerta,
												pusuario : vIdUsuario
											},
											function(pdata) {
												if (pdata == 'ok') {
													$('#lblMensaje')
															.text(
																	'Ticket '
																			+ ticket
																			+ ', fue reabierto correctamente.');
													$('#lblMensaje')
															.removeClass();
													$('#lblMensaje')
															.addClass(
																	'label label-success');
													listReportPendientes();
												} else {
													$('#lblMensaje')
															.text(
																	'No se reabrió el ticket: '
																			+ ticket
																			+ ', por favor vuelva a intentarlo en breves minutos.');
													$('#lblMensaje')
															.removeClass();
													$('#lblMensaje')
															.addClass(
																	'label label-danger');
												}

											});
						});
	}

	function listReportPendientes() {

		$('#dvLoadListAlerta').removeClass('overlay');
		$('#dvLoadListAlerta').addClass('overlay');
		document.getElementById('dvLoadListAlerta').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';

		$(document)
				.ready(
						function() {

							var src = "ServletAlertaEjecutiva";
							var vTipo = $('#cboTipoTicket').val();
							$
									.post(
											src,
											{
												strOperation : 'listTicketPrioridad1',
												pTipo : vTipo
											},
											function(pdata) {
												// 						alert(pdata);
												var obj = JSON.parse(pdata);
												var dataReporte = [];
												var columnsReport = [];

												// 						  for(i = 0 ; i < obj.listTicketMaximo.length ; i++ )
												// 						  	{
												// 							var arr = [];
												// 							arr.push(i+1);
												// 							arr.push(obj.listTicketMaximo[i].idAlerta);
												// 							arr.push(obj.listTicketMaximo[i].ticket);
												// 							arr.push(obj.listTicketMaximo[i].estado);
												// 							arr.push(obj.listTicketMaximo[i].cliente);
												// 							arr.push(obj.listTicketMaximo[i].resumen);
												// 							arr.push(obj.listTicketMaximo[i].fechaCreacion);
												// 							arr.push(obj.listTicketMaximo[i].horaCreacion);
												// 							arr.push(obj.listTicketMaximo[i].fechaFin);
												// 							arr.push(obj.listTicketMaximo[i].horaFin);
												// 							arr.push(obj.listTicketMaximo[i].usuarioModificador);
												// 							dataReporte.push(arr);
												// 							}

												var columnsReport;
												// 						  columnsReport = [ {title : "NRO"},
												// 						    {title : "IDALERTA"},
												// 						    {title : "IDTICKET"},
												// 				            {title : "ESTADO"}, 
												// 				            {title : "CLIENTE"}, 
												// 				            {title : "RESUMEN"}, 
												// 				            {title : "FECHA_CREACION"},
												// 				            {title : "HORA_CREACION"},
												// 				            {
												// 								"sName": "editarbtn",
												// 								"title" : "ACCIONES",
												// 								"bSearchable": false,
												// // 								"sWidth": "150px",
												// 								"bSortable": false,
												// 								"mRender": function ( data, type, full ) {									
												// 									return '<a id="lnkVer" class="btn btn-default btn-sm" title="Ver Evidencia" onclick="openModalAlerta(\''+full[1]+'\',\'' + full[2] + '\',2)"><i class="fa fa-external-link" aria-hidden="true"></i></a>&nbsp;&nbsp;' + 
												// 									'<a title="Editar Alerta" class="btn btn-info btn-sm"  onclick="openModalAlerta(\''+full[1]+'\',\'' + full[2] + '\',3)"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;&nbsp;' +
												// 									'<a title="Eliminar" class="btn btn-danger btn-sm" id="lnkEliminar" onclick="openModalAlerta(\''+full[1]+'\',\'' + full[2] + '\',4)"><i class="fa fa-trash" aria-hidden="true"></i></a>&nbsp;&nbsp;';
												// 								}
												// 							}
												// 				          ];

												if (vTipo == '0') {

													for (i = 0; i < obj.listTicketMaximo.length; i++) {
														var arr = [];
														arr.push(i + 1);
														arr
																.push(obj.listTicketMaximo[i].idAlerta);
														arr
																.push(obj.listTicketMaximo[i].ticket);
														arr
																.push(obj.listTicketMaximo[i].estado);
														arr
																.push(obj.listTicketMaximo[i].cliente);
														arr
																.push(obj.listTicketMaximo[i].resumen);
														arr
																.push(obj.listTicketMaximo[i].fechaCreacion);
														arr
																.push(obj.listTicketMaximo[i].horaCreacion);
														// 							arr.push(obj.listTicketMaximo[i].fechaFin);
														// 							arr.push(obj.listTicketMaximo[i].horaFin);
														arr
																.push(obj.listTicketMaximo[i].usuarioModificador);
														dataReporte.push(arr);
													}

													columnsReport = [
															{
																title : "NRO"
															},
															{
																title : "IDALERTA"
															},
															{
																title : "IDTICKET"
															},
															{
																title : "ESTADO"
															},
															{
																title : "CLIENTE"
															},
															{
																title : "RESUMEN"
															},
															{
																title : "FECHA_CREACION"
															},
															{
																title : "HORA_CREACION"
															},
															// 					            {title : "FECHA_FIN"},
															// 					            {title : "HORA_FIN"},
															{
																title : "USUARIO"
															},
															{
																"sName" : "editarbtn",
																"title" : "ACCIONES",
																"bSearchable" : false,
																"sWidth" : "150px",
																"bSortable" : false,
																"mRender" : function(
																		data,
																		type,
																		full) {
																	return '<a id="lnkVer" class="btn btn-default btn-sm" title="Ver Evidencia" onclick="openModalAlerta(\''
																			+ full[1]
																			+ '\',\''
																			+ full[2]
																			+ '\',2)"><i class="fa fa-external-link" aria-hidden="true"></i></a>&nbsp;&nbsp;'
																			+ '<a title="Editar Alerta" class="btn btn-info btn-sm"  onclick="openModalAlerta(\''
																			+ full[1]
																			+ '\',\''
																			+ full[2]
																			+ '\',3)"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;&nbsp;'
																			+ '<a title="Eliminar" class="btn btn-danger btn-sm" id="lnkEliminar" onclick="openModalAlerta(\''
																			+ full[1]
																			+ '\',\''
																			+ full[2]
																			+ '\',4)"><i class="fa fa-trash" aria-hidden="true"></i></a>&nbsp;&nbsp;';
																}
															} ];
												}

												if (vTipo == '1') {

													for (i = 0; i < obj.listTicketMaximo.length; i++) {
														var arr = [];
														arr.push(i + 1);
														arr
																.push(obj.listTicketMaximo[i].idAlerta);
														arr
																.push(obj.listTicketMaximo[i].ticket);
														arr
																.push(obj.listTicketMaximo[i].estado);
														arr
																.push(obj.listTicketMaximo[i].cliente);
														arr
																.push(obj.listTicketMaximo[i].resumen);
														arr
																.push(obj.listTicketMaximo[i].fechaCreacion);
														arr
																.push(obj.listTicketMaximo[i].horaCreacion);
														arr
																.push(obj.listTicketMaximo[i].fechaFin);
														arr
																.push(obj.listTicketMaximo[i].horaFin);
														arr
																.push(obj.listTicketMaximo[i].usuarioModificador);
														dataReporte.push(arr);
													}

													columnsReport = [
															{
																title : "NRO"
															},
															{
																title : "IDALERTA"
															},
															{
																title : "IDTICKET"
															},
															{
																title : "ESTADO"
															},
															{
																title : "CLIENTE"
															},
															{
																title : "RESUMEN"
															},
															{
																title : "FECHA_CREACION"
															},
															{
																title : "HORA_CREACION"
															},
															{
																title : "FECHA_FIN"
															},
															{
																title : "HORA_FIN"
															},
															{
																title : "USUARIO"
															},
															{
																"sName" : "editarbtn",
																"title" : "ACCIONES",
																"bSearchable" : false,
																"sWidth" : "150px",
																"bSortable" : false,
																"mRender" : function(
																		data,
																		type,
																		full) {
																	return '<a id="lnkAperturar" class="btn btn-default btn-sm" title="Ver Evidencia" onclick="openTicket(\''
																			+ full[1]
																			+ '\',\''
																			+ full[2]
																			+ '\')"><i class="fa fa-undo" aria-hidden="true"></i></a>';
																}
															} ];
												}

												setData(dataReporte,
														columnsReport);

											});

						});
	}

	var htmlTable = '<table id=\"tblReportes\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';

	function setData(pdataReporte, pcolumnsReport) {
		$(document).ajaxStart(function() {
			Pace.restart();
		});
		document.getElementById('tbcontainer').innerHTML = htmlTable;

		var buttonCommon = {
			exportOptions : {
				format : {
					body : function(data, row, column, node) {
						// Strip $ from salary column to make it numeric
						return column === 5 ? data.replace(/[$,]/g, '') : data;
					}
				}
			}
		};

		if (typeof tableReporte === 'undefined') {
			// 	    console.log('in if');

			var tableReporte = $('#tblReportes')
					.DataTable(
							{
								processing : false,
								serverSide : false,
								data : pdataReporte,
								columns : pcolumnsReport,
								columnDefs : [ {
									"targets" : [ 1 ],
									"visible" : false,
									"searchable" : false
								} ],
								dom: "<'row'<'col-sm-6'B><'col-sm-6 text-right'f>>" +
								"<'row'<'col-sm-12'tr>>" +
								"<'row'<'col-sm-5'i><'col-sm-7 text-right'p>>",
								language : {
									processing : "Procesando...",
									search : '<i class="fa fa-search fa-lg" aria-hidden="true"></i> ',
									searchPlaceholder : "Buscar...",
									lengthMenu: "Mostrar _MENU_ registros por página",
						            zeroRecords: "No se encontraron registros",
						            info: "Ver página _PAGE_ de _PAGES_ página(s)",
						            infoEmpty: "No hay información disponible",
						            infoFiltered: "(filtro de _MAX_ total de registros)",
						            paginate: {
						                first:      "Inicio",
						                last:       "Atras",
						                next:       "Siguiente",
						                previous:   "Atrás"
						            }
								},
								lengthMenu : [
										[ 10, 25, 50, -1 ],
										[ '10 registros',
										  '25 registros',
										  '50 registros',
										  'Mostrar todo'] ],
										  buttons : [
												{
													extend : 'pageLength',
													text : '<i class="fa fa-list-ol" aria-hidden="true"></i> Mostrar',
													className: "btn-sm"
												},
												{
												 	extend: "copy",
													exportOptions: {
														columns: ':visible(:not(.not-export-col))'
													},
													className: "btn-sm",
													text : '<i class="fa fa-clipboard" aria-hidden="true"></i> Copiar'
												},
												{
													extend: "csv",
													exportOptions: {
														columns: ':visible(:not(.not-export-col))'
													},
													className: "btn-sm",
													text : '<i class="fa fa-file-text-o" aria-hidden="true"></i> CSV'
												},
												{
													extend: "excel",
													exportOptions: {
														columns: ':visible(:not(.not-export-col))'
													},
													className: "btn-sm",
													text : '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
												},
												{
													extend: "pdfHtml5",
													exportOptions: {
														columns: ':visible(:not(.not-export-col))'
													},
													className: "btn-sm",
													text : '<i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF'
												},
												{
													extend: "print",
													exportOptions: {
														columns: ':visible(:not(.not-export-col))'
													},
													className: "btn-sm",
													text : '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'
												}],
								destroy : true
							});
			$('.dataTables_filter input').addClass(
					'form-control-search-datatable');
			// 		$('.dataTables_filter input').attr('size',10);
		} else {
			// 	        console.log('in else');
			// how to change the data contained inside datatable?
			tableReporte.fnClearTable();
			tableReporte.fnAddData(dataReporte);
			tableReporte.fnAdjustColumnSizing();
		}

		document.getElementById('dvLoadListAlerta').innerHTML = '';
		$('#dvLoadListAlerta').removeClass('overlay');
	}

	function listDetalleAlerta(p_idAlerta, pTipo) {
		console.log('Ingreso detalle listar');
		$(document).ready(function() {
							var src = "ServletAlertaEjecutiva";
							$.post(src,{strOperation : 'listDetalleAlerta',pidAlerta : p_idAlerta},
											function(pdata) {
												var obj = JSON.parse(pdata);
												var dataReporte = [];
												var columnsReport = [];

												for (i = 0; i < obj.objDetalleAlertaEjecutiva.length; i++) {
													var arr = [];
													arr.push(i + 1);
													arr.push(obj.objDetalleAlertaEjecutiva[i].idAlertaDet);
													arr.push(obj.objDetalleAlertaEjecutiva[i].fecha);

													var a = obj.objDetalleAlertaEjecutiva[i].mensaje.replace('\\', '/');

													arr.push(a.split("||").join("\n"));
													arr.push(obj.objDetalleAlertaEjecutiva[i].supervisor);
													dataReporte.push(arr);
												}

												if (pTipo == 1) {
													columnsReport = [ {
														title : "NRO"}, {
														title : "IDDETALLE"}, {
														title : "FECHA"}, {
														title : "DETALLE"}, {
														title : "SUPERVISOR"} ];
												} else {
													columnsReport = [
															{title : "NRO"},
															{title : "IDDETALLE"},
															{title : "FECHA"},
															{title : "DETALLE"},
															{title : "SUPERVISOR"},
															{
																"sName" : "editarbtn",
																"title" : "Acciones",
																"bSearchable" : false,
																"sWidth" : "200px",
																"bSortable" : false,
																"mRender" : function(
																		data,
																		type,
																		full) {
																	var a = full[3];
																	for (i = 0; i < 1000; i++) {
																		if (a.includes('\n')) {
																			a = a.replace('\n','||');
																		} else {
																			break;
																		}
																	}
																	return '<a title="Editar DetalleAlerta" class="btn btn-info btn-sm"  onclick="openModalAlertaDetalle(\''
																			+ full[1]
																			+ '\',\''
																			+ a
																			+ '\',\'2\')"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;&nbsp;'
																			+ '<a title="Eliminar" class="btn btn-danger btn-sm" id="lnkEliminar" onclick="openModalAlertaDetalle(\''
																			+ full[1]
																			+ '\',\'\',\'3\')"><i class="fa fa-trash" aria-hidden="true"></i></a>&nbsp;&nbsp;';
																}
															} ];
												}

												setDataDetalle(dataReporte,
														columnsReport);
											});
						});
	}

	function setDataDetalle(pdataReporte, pcolumnsReport) {
		// 		$(document).ajaxStart(function() { Pace.restart(); });
		// 		document.getElementById('tbcontainer').innerHTML = 	htmlTable;

		var buttonCommon = {
			exportOptions : {
				format : {
					body : function(data, row, column, node) {
						// Strip $ from salary column to make it numeric
						// 							return column === 5 ? data.replace(
						// 									/[$,]/g, '') : data;
					}
				}
			}
		};

		if (typeof tableReporte === 'undefined') {
			// 	    console.log('in table Detalle');

			var tableReporte = $('#tblDetalleIncidencia').DataTable(
					{
						processing : false,
						language : {
							processing : "Procesando...",
							search : '<i class="fa fa-search fa-lg"></i>',
							searchPlaceholder : "Buscar..."
						},
						pageLength : "100",
						serverSide : false,
						data : pdataReporte,
						columns : pcolumnsReport,
						columnDefs : [ {
							"targets" : [ 1 ],
							"visible" : false,
							"searchable" : false
						} ],
						dom : 'rti',
						lengthMenu : [
								[ 10, 25, 50, -1 ],
								[ '10 registros', '25 registros',
										'50 registros', 'Mostrar todo' ] ],
						// 					buttons : [
						// 								{
						// 								extend : 'pageLength',
						// 								text : '<i class="fa fa-list-ol" aria-hidden="true"></i> Mostrar',
						// 							},
						// 							{
						// 								extend : 'excelHtml5',
						// 								text : '<i class="fa fa-file-excel-o"></i> Descargar en Excel',
						// // 								className : 'btn btn-default',
						// 								customize : function(
						// 										xlsx) {
						// 									var sheet = xlsx.xl.worksheets['reporte.xml'];

						// 									// jQuery selector to add a border
						// 									$('row c[r*="10"]',sheet).attr('s','25');
						// 								}
						//} 
						// 							],
						destroy : true
					});
			$('.dataTables_filter input').addClass(
					'form-control-search-datatable');
			// 		$('.dataTables_filter input').attr('size',10);
		} else {
			// 	        console.log('in else');
			// how to change the data contained inside datatable?
			tableReporte.fnClearTable();
			tableReporte.fnAddData(dataReporte);
			tableReporte.fnAdjustColumnSizing();
		}
	}
</script>

</html>