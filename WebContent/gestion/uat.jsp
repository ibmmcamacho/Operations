<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="<%=request.getContextPath()%>/resources/filer/js/download1.js"></script>

<meta charset="UTF-8">
<title>Carga Masiva UAT</title>
</head>
<body>

<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
	<section class="content-header">
	<h1>
		Gestión <small>Automatización UAT</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-th-large"></i> Gestión</a></li>
		<li class="active">Automatización UAT</li>
	</ol>
	</section> <!-- Main content --> <section class="content"> 

	<div class="row">
		<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
			<div class="form-inline">
				<div class="form-group">
					<a id="btnNuevo" onclick="openModal('new')" class="btn btn-default"><i class="fa fa-file-o"></i> Nuevo Requerimiento</a>
					&nbsp;
					<a onclick="r('ruat', 0, 0)" class="btn btn-primary"><i class="fa fa-refresh"></i></a>
					<select id="btnTipoReqFinal" class="form-control">
						<option selected="selected" value="PENDIENTES">PENDIENTES</option>
						<option value="FINALIZADOS">FINALIZADOS</option>
						<option value="TODOS">TODOS</option>
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
						<i class="fa fa-table" aria-hidden="true"></i> LISTA DE REQUERIMIENTOS
					</h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<label id="lblMensaje"></label>
						</div>
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<div id="tbcontainer" class="table-responsive">Aquí se listará todos requerimientos de carga masiva en UAT</div>
						</div>
					</div>
				</div>
				<div id="dvLoadListAlerta"></div>
			</div>
		</div>
	</div>

	</section>
</aside>

</body>


<!-- Modal -->
<div class="modal fade" id="mdEliminar" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Detalle del Requerimiento</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						¿Desea eliminar el requerimiento de la carga masiva<label id="lblTicketId">
						</label>?
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<a id="btnEliminar" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i> Si, eliminar</a>
				<a class="btn btn-default" data-dismiss="modal"><i class="fa fa-undo" aria-hidden="true"></i> Cancelar</a>
			</div>
		</div>
	</div>
</div>



<!-- Modal -->
<div class="modal fade" id="mdCambioEstado" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-sm" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Cambio de Estado</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						Por favor seleccione el cambio <label id="lblTicketId"></label>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<a id="btnEliminar" class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i> Si, eliminar</a>
				<a class="btn btn-default" data-dismiss="modal"><i class="fa fa-undo" aria-hidden="true"></i> Cancelar</a>
			</div>
		</div>
	</div>
</div>



<!-- Modal -->
<div class="modal fade" id="mdRegistro" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">Detalle de Requerimiento</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<label id="lblMensajeModal"></label>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<input id="hdIdRequerimiento" type="hidden">
						<input id="hdIdTipo" type="hidden">
						<div class="row">
							<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
								<div class="form-inline">
								  <div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
								    <label class="sr-only" for="txtRequerimiento">Número de Requerimiento</label>
								    <div class="input-group">
								      <div class="input-group-addon"><i class="fa fa-list-ol" aria-hidden="true"></i></div>
								      <input id="txtRequerimiento" type="text" class="form-control" readonly="readonly" placeholder="Nro Requerimiento">
								    </div>
								  </div>
								  	
								  <div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
								    <label class="sr-only" for="txtUsuarioCreador">Creador</label>
								    <div class="input-group">
								      <div class="input-group-addon"><i class="fa fa-id-badge" aria-hidden="true"></i></div>
								      <input id="txtUsuarioCreador" type="text" class="form-control" readonly="readonly" placeholder="Creador">
								    </div>
								  </div>
								  
								  <div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
								    <label class="sr-only" for="txtRequerimiento">Modificador</label>
								    <div class="input-group">
								      <div class="input-group-addon"><i class="fa fa-id-badge" aria-hidden="true"></i></div>
								      <input id="txtUsuarioModificador" type="text" class="form-control" readonly="readonly" placeholder="Modificador">
								    </div>
								  </div>
								  </div>
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
										<h3 class="box-title">Información Principal</h3>
									</div>
									<!-- box-header -->
									
									<div id="formGeneral">
									
									<div id="formUAT" class="box-body">
									
									<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
								    	<label class="sr-only" for="txtRequerimiento">Tipo de Requerimiento</label>
								    	<div class="input-group">
									      	<div class="input-group-addon"><i class="fa fa-object-group" aria-hidden="true"></i></div>
									      	<select id="cboTipoRequerimiento" from="UAT_TIPOREQUERIMIENTO" to="pTipoRequerimiento" display="Tipo Requerimiento" class="form-control"></select>
								    	</div>
								  	</div>
								  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
								    	<label class="sr-only" for="txtTicketId">Nro Ticket</label>
								    	<div class="input-group">
									      	<div class="input-group-addon"><i class="fa fa-ticket" aria-hidden="true"></i></div>
									      	<input id="txtTicketId" to="pTicket" type="text" class="form-control" maxlength="25" placeholder="Nro Ticket">
									      	<div class="input-group-addon btn bg-purple" onclick="buscarmax()">
												<i class="fa fa-refresh" aria-hidden="true"></i>
											</div>
								    	</div>
								  	</div>
								  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
								    	<label class="sr-only" for="txtHostname">Hostname</label>
								    	<div class="input-group">
									      	<div class="input-group-addon"><i class="fa fa-laptop" aria-hidden="true"></i></div>
									      	<input id="txtHostname" to="pHostname" type="text" class="form-control" maxlength="255" placeholder="Hostname">
								    	</div>
								  	</div>
									
									<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
								    	<label class="sr-only" for="cboAmbiente">Ambiente</label>
								    	<div class="input-group">
									      	<div class="input-group-addon"><i class="fa fa-server" aria-hidden="true"></i></div>
									      	<select id="cboAmbiente" from="UAT_ENVIRONMENT" to="pAmbiente" display="Ambiente" class="form-control"></select>
								    	</div>
								  	</div>
								  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
								    	<label class="sr-only" for="cboPlataforma">Plataforma</label>
								    	<div class="input-group">
									      	<div class="input-group-addon"><i class="fa fa-server" aria-hidden="true"></i></div>
									      	<select id="cboPlataforma" from="UAT_PLATFORM" to="pPlataforma" display="Plataforma" class="form-control"></select>
								    	</div>
								  	</div>
								  	
								  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
								    	<label class="sr-only" for="cboCliente">Cliente</label>
								    	<div class="input-group">
									      	<div class="input-group-addon"><i class="fa fa-server" aria-hidden="true"></i></div>
									      	<select id="cboCliente" from="CLIENTE_ALERTA" to="pCliente" display="Cliente" class="form-control"></select>
								    	</div>
								  	</div>
								  	
								  	
								  	
								  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
								    	<a id="btnpaso1" class="btn btn-primary" onclick="cud('1','cuduat','formUAT')"><i class="fa fa-floppy-o" aria-hidden="true"></i></a>
								    	<a id="btnattachment" class="btn btn-primary" role="button" data-toggle="collapse" href="#clattachment" aria-expanded="false" aria-controls="cclattachment">
										  <i class="fa fa-paperclip" aria-hidden="true"></i>
										</a>
								  	</div>
								  	<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
									  	<div class="collapse" id="clattachment">
										  <div id="dvattachment" class="well">
										  </div>
										</div>
									</div>
									
									<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								    	<label class="sr-only" for="txtRequerimiento">Tipos de Hojas</label>
<!-- 								    	<div class="input-group"> -->
<!-- 									      	<div class="input-group-addon">Seleccione</div> -->
<!-- 									      	<select id="cboPlataforma" from="UAT_PLATFORM" to="pPlataforma" display="Plataforma" class="form-control"></select> -->
<!-- 								    	</div> -->
								    	<div id="dvradioGroup" class="input-group hidden">
								    		<div class="input-group-addon">Seleccione</div>
									    	<div id="idradioGroup" class="btn-group">
												<button type="button" value="tblDispositivo" class="btn btn-default">Dispositivos</button>
												<button type="button" value="tblGrupos" class="btn btn-default">Grupos</button>
												<button type="button" value="tblUsuarios" class="btn btn-default">Usuarios</button>
												<button type="button" value="tblSharedId" class="btn btn-default">SharedId</button>
											</div>
										</div>
								  	</div>
								  	</div>
								  	
								  	<hr style="margin-top: 0px"/>
								  	
								  	<div id="tblDispositivo" class="box-body hidden">
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtDispHostname">HOSTNAME</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-laptop" aria-hidden="true"></i></div>
										      	<input id="txtDispHostname" type="text" to="pDispHostname" class="form-control" maxlength="255" placeholder="Hostname">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtDispIP">IP</label>
										    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-hashtag" aria-hidden="true"></i></div>
										      	<input id="txtDispIP" type="text" to="pDispIP" class="form-control" maxlength="20" placeholder="Nro IP">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboDispEstado">Status</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></div>
										      	<select id="cboDispEstado" from="UAT_DISP_STATUS" to="pDispEstado" class="form-control" display="Status"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-8 col-lg-8">
									    	<label class="sr-only" for="cboDispTeamDelivery">Team Delivery</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-delicious" aria-hidden="true"></i></div>
										      	<select id="cboDispTeamDelivery" from="UAT_DISP_TEAM" to="pDispTeamDelivery" class="form-control" display="Team Delivery"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboDispAutomatizado">Automatizado</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-question" aria-hidden="true"></i></div>
										      	<select id="cboDispAutomatizado" from="UAT_DISP_AUTOMATIZATION" to="pDispAutomatizado" class="form-control" display="Automatizado"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboDispRoles">Rol</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-caret-right" aria-hidden="true"></i></div>
										      	<select id="cboDispRoles" from="UAT_DISP_ROLE" class="form-control" to="pDispRol" display="Rol"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtDispMaestro">Disp. Maestro</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-television" aria-hidden="true"></i></div>
										      	<input id="txtDispMaestro" type="text" to="pDispMaestro" class="form-control" maxlength="255" placeholder="Disp. Maestro">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtDispMaestro2">Disp. Maestro2</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-television" aria-hidden="true"></i></div>
										      	<input id="txtDispMaestro2" type="text" to="pDispMaestro2" class="form-control" maxlength="255" placeholder="Disp. Maestro 2">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtDispUltQEV">Ult. QEV</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></div>
										      	<input id="txtDispUltQEV" type="text" to="pDispUltQEV" class="form-control" maxlength="255" placeholder="Ult. QEV">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtDispCBNAcceso">Ult. CBN Acceso</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></div>
										      	<input id="txtDispCBNAcceso" to="DispUltCBNAcceso" type="text" class="form-control" maxlength="255" placeholder="Ult. CBN Acceso">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtDispCBNPriv">Ult. CBN Priv</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></div>
										      	<input id="txtDispCBNPriv" type="text" to="pDispUltCBNPriv" class="form-control" maxlength="255" placeholder="Ult. CBN Priv">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtDispQEVCli">Ult. QEV Cli</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></div>
										      	<input id="txtDispQEVCli" type="text" to="DispUltQEVCli" class="form-control" maxlength="255" placeholder="Ult. QEV Cli">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtDispCBNAccesoCli">Ult. CBN Acceso Cli</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></div>
										      	<input id="txtDispCBNAccesoCli" type="text" to="DispUltCBNAccesoCli" class="form-control" maxlength="255" placeholder="Ult. CBN Acceso Cli">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtDispCBNPrivCli">Ult. CBN PrivCli</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></div>
										      	<input id="txtDispCBNPrivCli" type="text" to="DispUltCBNPrivCli" class="form-control" maxlength="255" placeholder="Ult. CBN PrivCli">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboDispConexion">Conexion</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-plug" aria-hidden="true"></i></div>
										      	<select id="cboDispConexion" from="UAT_DISP_DIRECT" to="pDispConexion" class="form-control" display="Conexión"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<div class="input-group">
										      	<a id="btnpaso2" class="btn bg-purple" onclick="cud('4','cuduatdisp','tblDispositivo')"><i class="fa fa-floppy-o" aria-hidden="true"></i></a>
										      	<a id="btnrefresh2" class="btn bg-purple"><i class="fa fa-list-alt" aria-hidden="true"></i></a>
									    	</div>
									  	</div>
								  	</div>
									
									
									<div id="tblGrupos" class="box-body hidden">
										<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
									    	<div id="dvradioGrupos" class="input-group">
										    	<div id="idradioGrupos" class="btn-group">
													<button type="button" value="cManualG" class="btn btn-default">Manual</button>
													<button type="button" value="cMasivoG" class="btn btn-default">Masivo</button>
												</div>
											</div>
									  	</div>
									
									<div id="cManualG" class="hidden">
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtGrGrupo">Grupo</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-users" aria-hidden="true"></i></div>
										      	<input id="txtGrGrupo" type="text" to="pGrGrupo" class="form-control" maxlength="255" placeholder="Grupo">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboGrCodIntermedio">Codigo Intermedio</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></div>
										      	<select id="cboGrCodIntermedio" from="UAT_GRP_CINTERMEDIARIO" to="pGrCodIntermedio" class="form-control" display="Codigo Intermedio"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboGrTipo">Tipo</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></div>
										      	<select id="cboGrTipo" from="UAT_GRP_TYPE" to="pGrTipo" class="form-control" display="Tipo"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboGrSistema">Sistema</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-server" aria-hidden="true"></i></div>
										      	<select id="cboGrSistema" from="UAT_GRP_SYSTEM" to="pGrSistema" class="form-control" display="Sistema"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboGrPrimaria">Primaria</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-first-order" aria-hidden="true"></i></div>
										      	<select id="cboGrPrimaria" from="UAT_GRP_PRIMARY" to="pGrPrimaria" class="form-control" display="Primaria"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboGrRestringido">Restringido</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i></div>
										      	<select id="cboGrRestringido" from="UAT_GRP_RESTRICTED" to="pGrRestringido" class="form-control" display="Restringido"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboGrPrivilegio">Privilegio</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-plus" aria-hidden="true"></i></div>
										      	<select id="cboGrPrivilegio" from="UAT_GRP_PRIVILEGED" to="pGrPrivilegio" class="form-control" display="Privilegio"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboGrTipoAcceso">Tipo Acceso</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></div>
										      	<select id="cboGrTipoAcceso" from="UAT_GRP_TYPEACCESS" to="pGrTipoAcceso" class="form-control" display="Tipo Acceso"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtGrSistema2">Sistema2</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></div>
										      	<input id="txtGrSistema2" type="text" to="pGrSistema2" class="form-control" maxlength="255" placeholder="Sistema2"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<div class="input-group">
										      	<a id="btnpaso3" class="btn bg-purple" onclick="cud('4','cuduatgrupos','tblGrupos')"><i class="fa fa-floppy-o" aria-hidden="true"></i></a>
										      	<a id="btnrefresh3" class="btn bg-purple"><i class="fa fa-list-alt" aria-hidden="true"></i></a>
									    	</div>
									  	</div>
									  </div>
									<div id="cMasivoG" class="hidden">
										  	<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
										  	<textarea id="txtMasivoGrp" class="form-control" rows="10" cols="10" placeholder="GRUPO"></textarea>
										  	</div>
										  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
										    	<div class="input-group">
											      	<a id="btnpaso3" class="btn bg-purple" onclick="cudm('4','cuduatgrupos')"><i class="fa fa-floppy-o" aria-hidden="true"></i></a>
											      	<a id="btnrefresh3_" class="btn bg-purple"><i class="fa fa-list-alt" aria-hidden="true"></i></a>
										    	</div>
										  	</div>
									  </div>
									  	
								  	</div>
								  	
								  	<div id="tblUsuarios" class="box-body hidden">
								  	<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
								    	<div id="dvradioUsuarios" class="input-group">
									    	<div id="idradioUsuarios" class="btn-group">
												<button type="button" value="cManual" class="btn btn-default">Manual</button>
												<button type="button" value="cMasivo" class="btn btn-default">Masivo</button>
											</div>
										</div>
								  	</div>
								  	
								  	<div id="cManual" class="hidden">
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtUsuUsuario">Usuario</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></div>
										      	<input id="txtUsuUsuario" type="text" to="pUsuUsuario" class="form-control" maxlength="255" placeholder="Usuario">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtUsuPropietario">Propietario</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-user-o" aria-hidden="true"></i></div>
										      	<input id="txtUsuPropietario" type="text" to="pUsuPropietario" class="form-control" maxlength="255" placeholder="Propietario">
										      	<div class="input-group-addon btn bg-purple" onclick="buscarldap()">
<!-- 										      	<a class="btn bg-purple" onclick="buscarldap()"><i class="fa fa-refresh" aria-hidden="true"></i></a> -->
													<i class="fa fa-refresh" aria-hidden="true"></i>
										      	</div>
									    	</div>
									    	
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-8 col-lg-8">
									    	<label class="sr-only" for="txtUsuEtiqueta">Etiqueta</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-tag" aria-hidden="true"></i></div>
										      	<input id="txtUsuEtiqueta" type="text" to="pUsuEtiqueta" class="form-control" maxlength="255" placeholder="Etiqueta">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboUsuTipo">Tipo</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></div>
										      	<select id="cboUsuTipo" from="UAT_USR_TYPE" to="pUsuTipo" class="form-control" display="Tipo"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboUsuSistema">Sistema</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></div>
										      	<select id="cboUsuSistema" from="UAT_USR_SYSTEM" to="UsuSistema" class="form-control" display="Sistema"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboUsuContraseniaExpira">Contraseña Expira</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-key" aria-hidden="true"></i></div>
										      	<select id="cboUsuContraseniaExpira" from="UAT_USR_PASSWORDEXPIRES" to="UsuContraseniaExpira" class="form-control" display="Contraseña Expira"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtUsuPerfilesAsoc">Perfiles asociados</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-user" aria-hidden="true"></i></div>
										      	<input id="txtUsuPerfilesAsoc" type="text" to="pUsuPerfilesAsoc" class="form-control" maxlength="255" placeholder="Perfiles asociados"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<div class="input-group">
										      	<a id="btnpaso4" class="btn bg-purple" onclick="cud('4','cuduatusuarios','tblUsuarios')"><i class="fa fa-floppy-o" aria-hidden="true"></i></a>
										      	<a id="btnrefresh4" class="btn bg-purple"><i class="fa fa-list-alt" aria-hidden="true"></i></a>
									    	</div>
									  	</div>
									  </div>
									<div id="cMasivo" class="hidden">
									  	<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
									  	<textarea id="txtMasivo" class="form-control" rows="10" cols="10" placeholder="USUARIO;PROPIETARIO;PERFILASOCIADO"></textarea>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<div class="input-group">
										      	<a id="btnpaso41" class="btn bg-purple" onclick="cudm('4','cuduatusuarios')"><i class="fa fa-floppy-o" aria-hidden="true"></i></a>
										      	<a id="btnrefresh4_" class="btn bg-purple"><i class="fa fa-list-alt" aria-hidden="true"></i></a>
									    	</div>
									  	</div>
									  </div>
									  	
								  	</div>
								  	
								  	<div id="tblSharedId" class="box-body hidden">
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtSharedUsuCompartido">Usuario Compartido</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-user-circle-o" aria-hidden="true"></i></div>
										      	<input id="txtSharedUsuCompartido" type="text" to="pSharedUsuCompartido" class="form-control" maxlength="255" placeholder="Usuario Compartido">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboSharedUsuFuncional">Usuario Funcional</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-user-circle-o" aria-hidden="true"></i></div>
										      	<select id="cboSharedUsuFuncional" from="UAT_SHID_USRFUNCTIONAL" to="pSharedUsuFuncional" class="form-control" display="Usuario Funcional"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtSharedEjecutivoAprobador">Ejecutivo Aprobador</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-user-circle-o" aria-hidden="true"></i></div>
										      	<input id="txtSharedEjecutivoAprobador" type="text" to="pSharedEjecutivoAprobador" class="form-control" maxlength="255" placeholder="Ejecutivo Aprobador">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboSharedCambioContrasenia">Cambio Contraseña Auto</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-key" aria-hidden="true"></i></div>
										      	<select id="cboSharedCambioContrasenia" from="UAT_SHID_CAMBCONTAUTO" to="pSharedCambioContrasenia" class="form-control" display="Cambio Contraseña Auto"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboSharedContraseniaCambiable">Contraseña Cambiable</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-key" aria-hidden="true"></i></div>
										      	<select id="cboSharedContraseniaCambiable" from="UAT_SHID_CONTCAMB" to="pSharedContraseniaCambiable" class="form-control" display="Contraseña Cambiable"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtSharedContrasenia">Contraseña</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-key" aria-hidden="true"></i></div>
										      	<input id="txtSharedContrasenia" type="text" to="pSharedContrasenia" class="form-control" maxlength="255" placeholder="Contraseña">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
									    	<label class="sr-only" for="txtSharedJustificacionCambio">Justificación No Cambio</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-comment-o" aria-hidden="true"></i></div>
										      	<input id="txtSharedJustificacionCambio" type="text" to="pSharedJustificacionNoCambio" class="form-control" maxlength="255" placeholder="Justificación No Cambio">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboSharedVisibilidad">Visibilidad</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-eye" aria-hidden="true"></i></div>
										      	<select id="cboSharedVisibilidad" from="UAT_SHID_VISIBILIDAD" to="pSharedVisibilidad" class="form-control" display="Visibilidad"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboSharedTimeApoyo">Time Apoyo</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></div>
										      	<select id="cboSharedTimeApoyo" from="UAT_SHID_TAPOYO" to="pSharedTimeApoyo" class="form-control" display="Time Apoyo"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboSharedContraseniaServ">Cambia Contraseña de Servicios Asociados</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-key" aria-hidden="true"></i></div>
										      	<select id="cboSharedContraseniaServ" from="UAT_SHID_CONTRASENIASERVICIO" to="pSharedContraseniaServ" class="form-control" display="Cambia Contraseña de Servicios Asociados"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtSharedIntCambioContrasenia">Intervalo Cambio Contraseña</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
										      	<input id="txtSharedIntCambioContrasenia" type="number" to="pSharedIntCambioContrasenia" value="90" class="form-control" min="0" max="999" placeholder="Intervalo cambio contraseña">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="txtSharedPeriodoAperLlamada">Periodo Anterior a la Apertura del llamado</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
										      	<input id="txtSharedPeriodoAperLlamada" type="text" to="pSharedPeriodoAperLlamada" value="7" class="form-control" maxlength="255" placeholder="Periodo Anterior a la Apertura del llamado">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
									    	<label class="sr-only" for="txtSharedJustCompartir">Justificación para Compartir</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-comment-o" aria-hidden="true"></i></div>
										      	<input id="txtSharedJustCompartir" type="text" to="pSharedJustCompartir" value="UserID Administrador del Sistema Operativo" class="form-control" maxlength="255" placeholder="Justificación para Compartir">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12">
									    	<label class="sr-only" for="txtSharedCriterioAprobar">Criterio para aprobar uso de contraseña</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-comment-o" aria-hidden="true"></i></div>
										      	<input id="txtSharedCriterioAprobar" type="text" to="pSharedCriterioAprobar" value="Usuario será utilizado en caso de emergencia o indisponibilidad de las demas cuentas" class="form-control" maxlength="255" placeholder="Criterio para aprobar uso de contraseña">
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboSharedCambioPeriodo">Cambio Periódico</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></div>
										      	<select id="cboSharedCambioPeriodo" from="UAT_SHID_CHANGEPERIOD" to="pSharedCambioPeriodo" class="form-control" display="Cambio Periódico"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<label class="sr-only" for="cboSharedTipoAccion">Tipo Acción</label>
									    	<div class="input-group">
										      	<div class="input-group-addon"><i class="fa fa-bars" aria-hidden="true"></i></div>
										      	<select id="cboSharedTipoAccion" from="UAT_SHID_TYPEACTION" to="pSharedTipoAccion" class="form-control" display="Tipo Acción"></select>
									    	</div>
									  	</div>
									  	<div class="form-group col-xs-12 col-sm-6 col-md-4 col-lg-4">
									    	<div class="input-group">
										      	<a id="btnpaso5" class="btn bg-purple" onclick="cud('4','cuduatsharedid','tblSharedId')"><i class="fa fa-floppy-o" aria-hidden="true"></i></a>
										      	<a id="btnrefresh5" class="btn bg-purple"><i class="fa fa-list-alt" aria-hidden="true"></i></a>
									    	</div>
									  	</div>
									</div>
												
									</div>
									<!-- /.box-body -->
									<div id="dvLoadP1"></div>
								</div>
								
								
								<div id="dvDetalleHojas" class="box box-info hidden">
									<div class="box-header with-border">
										<i class="fa fa-teal"></i>
										<h3 class="box-title">Registros de <span id="lblHoja"></span></h3>
									</div>
									<!-- /.box-header -->
									<div class="box-body">
										<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
											<div id="dvContainerHojas" class="table-responsive">
											</div>
										</div>
										
									</div>
									<!-- /.box-body -->
									<div id="dvLoadP2"></div>
								</div>
								
<!-- 								<div class="box"> -->
									<!-- /.box-header -->
									<div class="modal-footer">
<!-- 													<a id="btnGuardarHojas" href="#" class="btn btn-primary" onclick="cud('2')">Guardar</a> -->
										<a id="btnCancelarAlerta" href="#" class="btn btn-default" data-dismiss="modal"><i class="fa fa-arrow-left" aria-hidden="true"></i> Volver</a>
									</div>
									<!-- /.box-body -->
									<div id="dvLoadP3"></div>
<!-- 								</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>


<script type="text/javascript">
	var vTeam = document.getElementById('hdIdTeam').value;
	var vIdUsuario = document.getElementById('hdIdEmpleado').value;
	var vUsuario = document.getElementById('hdEmpleado').value;
	var vIdEmail = document.getElementById('smUsuario').innerHTML;
	
	$(document).ready(function(){
		
		$('#idradioGroup button').click(function(){
			$(this).removeClass('active').addClass('active').removeClass('btn-default').removeClass('btn-primary').addClass('btn-primary')
			.siblings().removeClass('active').removeClass('btn-default').removeClass('btn-primary').addClass('btn-default');
			
			$('#tblDispositivo').removeClass('hidden').addClass('hidden');
			$('#tblGrupos').removeClass('hidden').addClass('hidden');
			$('#tblUsuarios').removeClass('hidden').addClass('hidden');
			$('#tblSharedId').removeClass('hidden').addClass('hidden');
			$('#' + $(this).val()).removeClass('hidden');
			$('#lblHoja').text($(this).text());
			$('#dvDetalleHojas').removeClass('hidden');
		});
		
		$('#idradioGrupos button').click(function(){
			console.log('entré grupo');
			$(this).removeClass('active').addClass('active').removeClass('btn-default').removeClass('btn-primary').addClass('btn-primary')
			.siblings().removeClass('active').removeClass('btn-default').removeClass('btn-primary').addClass('btn-default');
			
			$('#cManualG').removeClass('hidden').addClass('hidden');
			$('#cMasivoG').removeClass('hidden').addClass('hidden');
			$('#' + $(this).val()).removeClass('hidden');
		});
		
		$('#idradioUsuarios button').click(function(){
			console.log('entré usuario');
			$(this).removeClass('active').addClass('active').removeClass('btn-default').removeClass('btn-primary').addClass('btn-primary')
			.siblings().removeClass('active').removeClass('btn-default').removeClass('btn-primary').addClass('btn-default');
			
			$('#cManual').removeClass('hidden').addClass('hidden');
			$('#cMasivo').removeClass('hidden').addClass('hidden');
			$('#' + $(this).val()).removeClass('hidden');
		});

		$('#btnrefresh2').click(function(){ r('ruatdisp', 0, $('#hdIdRequerimiento').val());});
		$('#btnrefresh3').click(function(){ r('ruatgrupos', 0, $('#hdIdRequerimiento').val());});
		$('#btnrefresh3_').click(function(){ r('ruatgrupos', 0, $('#hdIdRequerimiento').val());});
		$('#btnrefresh4').click(function(){ r('ruatusuarios', 0, $('#hdIdRequerimiento').val());});
		$('#btnrefresh4_').click(function(){ r('ruatusuarios', 0, $('#hdIdRequerimiento').val());});
		$('#btnrefresh5').click(function(){ r('ruatsharedid', 0, $('#hdIdRequerimiento').val());});
		
		$("#formGeneral div div div select").each(function(){
		 	listOptions2($(this).attr('id'),$(this).attr('from'),$(this).attr('display'),1)
		});
		
		$("#formGeneral div div div input").each(function(){
		 	$(this).attr('data-toggle','tooltip').attr('data-placement','top').attr('title',$(this).attr('placeholder'));
		});
	});
	
	function listOptions2(id,tipo,placeholder,team) {
		$(document).ready(function() {
			var src = "ServletWOptions";
			$.post(src,{strOperation : "listOptions",strType : tipo,iTeam : team},
			function(pdata) {
			var obj = JSON.parse(pdata);
			if (obj.reporte.length > 0) {
				$('#' + id + ' option').remove();
				$('#' + id).append($('<option>',{value : '',text : ''}));
	
				$.each(obj.reporte,function(i,item) {
					$('#' + id).append(
						$('<option>',{
							value : (id == 'cboCliente' ? item.valor1 : item.idOption),
							text : item.descripcion
						})
					);
				});
				$('#' + id).select2({placeholder : placeholder, width : 'resolve'});
				$('#select2-' + id + '-container').parent().parent().parent().attr('data-toggle','tooltip').attr('data-placement','top').attr('title',$('#'+id).attr('display'));
			}
			if (obj.reporte.length < 3)
				$('#'+id).val($('#' + id + ' option:nth-child(2)').val()).trigger('change.select2');
			});
		});
	}
		
	function cud(nropaso,oper,frm,idtipo) {
	// 	if(nropaso == '1'){
			if(nropaso == '1'){
				$('#btnpaso1').text('');
				$('#btnpaso1').html	('<i class="fa fa-spinner fa-lg fa-spin"></i>');
				$('#btnpaso1').removeClass('disabled').addClass('disabled');
				$('#btnpaso1').attr('disabled',true);
			}
			else{
				$('#btnpaso2').text('');
				$('#btnpaso2').html	('<i class="fa fa-spinner fa-lg fa-spin"></i>');
				$('#btnpaso2').removeClass('disabled').addClass('disabled');
				$('#btnpaso2').attr('disabled',true);
				
				$('#btnpaso3').text('');
				$('#btnpaso3').html	('<i class="fa fa-spinner fa-lg fa-spin"></i>');
				$('#btnpaso3').removeClass('disabled').addClass('disabled');
				$('#btnpaso3').attr('disabled',true);
				
				$('#btnpaso4').text('');
				$('#btnpaso4').html	('<i class="fa fa-spinner fa-lg fa-spin"></i>');
				$('#btnpaso4').removeClass('disabled').addClass('disabled');
				$('#btnpaso4').attr('disabled',true);
				
				$('#btnpaso5').text('');
				$('#btnpaso5').html	('<i class="fa fa-spinner fa-lg fa-spin"></i>');
				$('#btnpaso5').removeClass('disabled').addClass('disabled');
				$('#btnpaso5').attr('disabled',true);
			}
			
			$('#txtGrGrupo').val();
			$('#txtUsuUsuario').val();
			$('#txtUsuPropietario').val();
			$('#txtUsuEtiqueta').val();
			$('#txtSharedUsuCompartido').val();
			
			var vQuery = '{"paso":"' + nropaso + '","pUser":"' + vIdUsuario + '"';
			$('#' + frm + ' div div input').each(function(){
			    vQuery += ', "' + $(this).attr('to') + '":"' + $(this).val() + '"';
			});
			$('#' + frm + ' div div select').each(function(){
			    vQuery += ', "' + $(this).attr('to') + '":"' + $(this).val() + '"';
			});
			if(nropaso == 2)
				vQuery += ', "strOperation":"' + oper + '", "idReq":"' + idtipo + '"';
			else if(nropaso == 4)
				vQuery += ', "strOperation":"' + oper + '", "idTipo":"' + $('#hdIdTipo').val() + '","idReq":"' + $('#hdIdRequerimiento').val() + '"';
			else
				vQuery += ', "strOperation":"' + oper + '", "idTipo":"' + idtipo + '","idReq":"' + $('#hdIdRequerimiento').val() + '"';
			vQuery += '}';
			requestWeb(vQuery,nropaso);
	}
	
	
	function cudm(paso,oper){
		
		if(oper == 'cuduatusuarios'){
			var vmasivo = $('#txtMasivo').val(); 
			var vreg = vmasivo.split("\n");
			for(i = 0 ; i < vreg.length ; i++){
				var vQuery = '{"paso":"' + paso + '","pUser":"' + vIdUsuario + '"';
				var vline = vreg[i].split(";");
				vQuery += ', "pUsuUsuario":"' + vline[0] + '"';
				vQuery += ', "pUsuPropietario":"' + vline[1] + '"';
				vQuery += ', "pUsuEtiqueta":""';
				vQuery += ', "pUsuPerfilesAsoc":"' + vline[2] + '"';
//	 			vQuery += ', "pUsuTipo":"' + $('#cboUsuTipo').val($('#cboUsuTipo option:contains("' + vline[3] + '")').val()).change().val() + '"';
//	 			vQuery += ', "UsuSistema":"' + $('#cboUsuSistema').val($('#cboUsuSistema option:contains("' + vline[4] + '")').val()).change().val() + '"';
//	 			vQuery += ', "UsuContraseniaExpira":"' + $('#cboUsuContraseniaExpira').val($('#cboUsuContraseniaExpira option:contains("' + vline[5] + '")').val()).change().val() + '"';
				vQuery += ', "strOperation":"' + oper + '", "idTipo":"' + $('#hdIdTipo').val() + '","idReq":"' + $('#hdIdRequerimiento').val() + '"';
				vQuery += '}';
				requestWeb(vQuery,'4');
				$('#txtMasivo').val();
			}
		}
		else if(oper == 'cuduatgrupos'){
			var vmasivo = $('#txtMasivoGrp').val(); 
			var vreg = vmasivo.split("\n");
			for(i = 0 ; i < vreg.length ; i++){
				
// 				console.log(vreg[i]);
				
				var vQuery = '{"paso":"' + paso + '","pUser":"' + vIdUsuario + '"';
				vQuery += ', "pGrGrupo":"' + vreg[i] + '"';
				vQuery += ', "pCliente":"' + $('#cboCliente').val() + '"';
				
				vQuery += ', "strOperation":"' + oper + '", "idTipo":"' + $('#hdIdTipo').val() + '","idReq":"' + $('#hdIdRequerimiento').val() + '"';
				vQuery += '}';
				requestWeb(vQuery,'4');
				$('#txtMasivoGrp').val();
			}
		}
		
		r(oper, 0, $('#hdIdRequerimiento').val());
	}
	
	function ustate(pidReq,pstates){
		
		var src = 'ServletUAT';
		var vIdUsuario = document.getElementById('hdIdEmpleado').value;
		
		$.post(src,{strOperation : "cstates", idReq : pidReq, pState : pstates, pUser : vIdUsuario},function(pdata) {
			var obj = JSON.parse(pdata);
			var pid = obj.uat[0].resultado;
			
			if(obj.uat[0].resultado != "0") {
				r('ruat', 0, 0);
			}
		});
	}
	
	function requestWeb(vquery,vnropaso){
				console.log(vquery);
				var vrequest = JSON.parse(vquery);
				var src = 'ServletUAT';
				
				$.post(src,vrequest,function(pdata) {
					var obj = JSON.parse(pdata);
					var pid = obj.uat[0].resultado;
					
					if(obj.uat[0].resultado != "0") {
						if(vnropaso == '1'){
							$('#btnpaso1').text('');
							$('#btnpaso1').html	('<i class="fa fa-floppy-o" aria-hidden="true"></i>');
							$('#btnpaso1').removeClass('hidden').removeClass('disabled');
							$('#btnpaso1').attr('disabled',false);
							$('#dvradioGroup').removeClass('hidden');
							
							$('#lblMensajeModal').text('Se registró el ticket Requerimiento: ' + obj.uat[0].resultado);
							$('#lblMensajeModal').removeClass();
							$('#lblMensajeModal').addClass('label label-success');
							$('#txtRequerimiento').val(pid);
							$('#hdIdRequerimiento').val(pid);
							r(obj.uat[0].oper, 0, 0);
						}
						else if(vnropaso == '2'){
							r(obj.uat[0].oper, 0, 0);
						}
						else{
							$('#hdIdTipo').val('0');
// 							if($('#cMasivo').hasClass("hidden")){
								r(obj.uat[0].oper, 0, $('#hdIdRequerimiento').val());
// 							}
							
							$('#btnpaso2').text('');
							$('#btnpaso2').html	('<i class="fa fa-floppy-o" aria-hidden="true"></i>');
							$('#btnpaso2').removeClass('hidden').removeClass('disabled');
							$('#btnpaso2').attr('disabled',false);
							
							$('#btnpaso3').text('');
							$('#btnpaso3').html	('<i class="fa fa-floppy-o" aria-hidden="true"></i>');
							$('#btnpaso3').removeClass('hidden').removeClass('disabled');
							$('#btnpaso3').attr('disabled',false);
							
							$('#btnpaso4').text('');
							$('#btnpaso4').html	('<i class="fa fa-floppy-o" aria-hidden="true"></i>');
							$('#btnpaso4').removeClass('hidden').removeClass('disabled');
							$('#btnpaso4').attr('disabled',false);
							
							$('#btnpaso5').text('');
							$('#btnpaso5').html	('<i class="fa fa-floppy-o" aria-hidden="true"></i>');
							$('#btnpaso5').removeClass('hidden').removeClass('disabled');
							$('#btnpaso5').attr('disabled',false);
						}
							
						
					} else if (obj.uat[0].resultado == "0" || obj.uat[0].resultado == "-1") {
						if(vnropaso == '1'){
// 							$('#btnpaso1').html	('');
// 							$('#btnpaso1').text('Siguiente');
// 							$('#btnpaso1').removeClass('hidden');
// 							$('#btnpaso1').removeAttr("disabled");
							$('#btnpaso1').text('');
							$('#btnpaso1').html	('<i class="fa fa-floppy-o" aria-hidden="true"></i>');
							$('#btnpaso1').removeClass('hidden').removeClass('disabled');
							$('#btnpaso1').attr('disabled',false);
							
							$('#dvradioGroup').removeClass('hidden').addClass('hidden');
							$('#lblMensajeModal').text('Hubo un problema, por favor vuelve a intentarlo en unos minutos. ');
							$('#lblMensajeModal').removeClass();
							$('#lblMensajeModal').addClass('label label-danger');
							r(obj.uat[0].oper, 0, 0);
						}
						else{
							
							if($('#cMasivo').hasClass("hidden")){
								r(obj.uat[0].oper, 0, $('#hdIdRequerimiento').val());
								console.log('ENTRO PARA LISTAR USUARIOS CUANDO CMASIVO ES INVISIBLE');
							}
							else{
								$('#lblMensajeModal').append('No cargó: ' + obj.uat[0].mensaje + ' | ');
								$('#lblMensajeModal').removeClass();
								$('#lblMensajeModal').addClass('label label-danger');
							}
							
							$('#btnpaso2').text('');
							$('#btnpaso2').html	('<i class="fa fa-floppy-o" aria-hidden="true"></i>');
							$('#btnpaso2').removeClass('hidden').removeClass('disabled');
							$('#btnpaso2').attr('disabled',false);
							
							$('#btnpaso3').text('');
							$('#btnpaso3').html	('<i class="fa fa-floppy-o" aria-hidden="true"></i>');
							$('#btnpaso3').removeClass('hidden').removeClass('disabled');
							$('#btnpaso3').attr('disabled',false);
							
							$('#btnpaso4').text('');
							$('#btnpaso4').html	('<i class="fa fa-floppy-o" aria-hidden="true"></i>');
							$('#btnpaso4').removeClass('hidden').removeClass('disabled');
							$('#btnpaso4').attr('disabled',false);
							
							$('#btnpaso5').text('');
							$('#btnpaso5').html	('<i class="fa fa-floppy-o" aria-hidden="true"></i>');
							$('#btnpaso5').removeClass('hidden').removeClass('disabled');
							$('#btnpaso5').attr('disabled',false);
						}
							
					}
					
// 					document.getElementById('dvLoadP1').innerHTML = '';
// 					$('#dvLoadP1').removeClass('overlay');
// 					document.getElementById('dvLoadP2').innerHTML = '';
// 					$('#dvLoadP2').removeClass('overlay');
// 					document.getElementById('dvLoadP3').innerHTML = '';
// 					$('#dvLoadP3').removeClass('overlay');
				});
				
		}
		
		//Iniciación de la lista de requerimientos
		r('ruat', 0, 0);
		
		function init() {
			
			$("#formGeneral div div div select").each(function(){
				var id = $(this).attr('id');
				if($('#' + id + ' option').length <= 3)
					$('#'+id).val($('#' + id + ' option:nth-child(2)').val()).trigger('change.select2');
				else
					$('#'+id).val('').trigger("change");
			});
			
			$("#formGeneral div div div input").each(function(){
				$(this).val('');
			});
			
			$('#txtSharedIntCambioContrasenia').val('90');
			$('#txtSharedPeriodoAperLlamada').val('7');
			$('#txtSharedJustCompartir').val('UserID Administrador del Sistema Operativo');
			$('#txtSharedCriterioAprobar').val('Usuario será utilizado en caso de emergencia o indisponibilidad de las demas cuentas');
			
			$('#hdIdRequerimiento').val('0');
			$('#hdIdTipo').val('0');
			$('#btnpaso1').removeClass('hidden');
			$('#dvradioGroup').removeClass('hidden').addClass('hidden');
		}

		
	function validar() {
		var strValidacion = '';
		if ($('#txtMaximoPrioridad').val() == '1') {
			strValidacion += ($('#cboEstadoAlerta').val() == '' ? '* Estado Alerta \n': '');

			if ($('#cboEstadoAlerta option:selected').text() == 'FIN' || $('#cboEstadoAlerta option:selected').text() == 'INICIO/FIN') {
				strValidacion += ($('#txtHoraNotificacionIbm').val() == '' ? '* Fecha de Afectación \n': '');
				strValidacion += ($('#txtHoraFin').val() == '' ? '* Fecha Fin \n': '');
			} else
				strValidacion += ($('#txtHoraNotificacionIbm').val() == '' ? '* Fecha de Afectación \n': '');

			strValidacion += ($('#txtMaximoTicketId').val() == '' ? '* Ticket \n': '');
			strValidacion += ($('#txtPm').val() == '' ? '* PM \n' : '');
			strValidacion += ($('#txtCrisisTurno').val() == '' ? '* Crisis de turno \n': '');
			strValidacion += ($('#cboDataCenter').val() == '' ? '* Data Center \n': '');
			strValidacion += ($('#cboPropiedadInc').val() == '' ? '* Propiedad de Incidencia \n': '');
			strValidacion += ($('#cboSla').val() == '' ? '* SLA \n' : '');
			strValidacion += ($('#txtServicioImpactado').val() == '' ? '* Servicio Impactado \n': '');
			strValidacion += ($('#txtImpactoNegocio').val() == '' ? '* Impacto Negocio \n': '');
		}

		strValidacion += ($('#cboEstadoAlerta').val() == '' ? '* Estado Alerta \n': '');
		if (document.getElementById('chkNotificar').checked == true) {
			strValidacion += ($('#cboListaDistribucion').val() == '' ? '* Lista de Distribucion \n'
					: '');
		}
		return strValidacion;
	}
	
	
	function openModal(ptipoForm,pidReq,pusuc,pusum,pidtipreq,pidtk,phostname,pidamb,pidplat,pidcli) {
		//Iniciar nueva alerta
		if (ptipoForm == 'new') {
			init();
// 			bloquear(0);
// 			$('#hdIdRequerimiento').val('0');
			$('#txtUsuarioCreador').val(vUsuario);
			$('#dvDetalleHojas').removeClass('hidden').addClass('hidden');
			
			var dataReporte = [];
			var columnsReport = [];
			columnsReport = [{title : "MENSAJE"}];
			setDataInformation(dataReporte,columnsReport,'#tblHojas');
			
			$('#mdRegistro').modal({ backdrop : 'static', keyboard : false });

		} else if (ptipoForm == 'upd') {
			$('#hdIdRequerimiento').val(pidReq);
			$('#hdIdTipo').val('0');
			$('#btnpaso1').removeClass('hidden');
			$('#dvradioGroup').removeClass('hidden');
			
			$('#txtRequerimiento').val(pidReq);
			$('#txtUsuarioCreador').val(pusuc);
			$('#txtUsuarioModificador').val(pusum);
			$('#cboTipoRequerimiento').val(pidtipreq).trigger("change");
			$('#txtTicketId').val(pidtk);
			$('#txtHostname').val(phostname);
			$('#cboAmbiente').val(pidamb).trigger("change");
			$('#cboPlataforma').val(pidplat).trigger("change");
			$('#cboCliente').val(pidcli).trigger("change");
			
			$('#txtSharedIntCambioContrasenia').val('90');
			$('#txtSharedPeriodoAperLlamada').val('7');
			$('#txtSharedJustCompartir').val('UserID Administrador del Sistema Operativo');
			$('#txtSharedCriterioAprobar').val('Usuario será utilizado en caso de emergencia o indisponibilidad de las demas cuentas');
			
// 			r('ruatdisp', 0, pidReq);
// 			r('ruatgrupos', 0, pidReq);
// 			r('ruatusuarios', 0, pidReq);
// 			r('ruatsharedid', 0, pidReq);
			
			$('#mdRegistro').modal({ backdrop : 'static', keyboard : false });
		}
	}
	
	function setParameters(ptipo,pid,val1,val2,val3,val4,val5,val6,val7,val8,val9,val10,val11,val12,val13,val14,val15,val16){
		
		$('#hdIdTipo').val(pid);
		console.log(
				'ptipo: ' + ptipo + 
				', pid : ' + pid + 
				', parametros: ' + val1 + ';' + val2 + ';' + val3 + ';' + val4 + ';' + val5 + ';' + val6 + ';' + val7 + ';' + val8 + ';' + val9 + ';' + val10 + ';' + val11 + ';' + val12 + ';' + val13 + ';' + val14 + ';' + val15 + ';' + val16
		);
			
		if(ptipo == 'disp'){
			$('#txtDispHostname').val(val1);
			$('#txtDispIP').val(val2);
			$('#cboDispEstado').val(val3).trigger("change");
			$('#cboDispTeamDelivery').val(val4).trigger("change");
			$('#cboDispAutomatizado').val(val5).trigger("change");
			$('#cboDispRoles').val(val6).trigger("change");
			$('#txtDispMaestro').val(val7);
			$('#txtDispMaestro2').val(val8);
			$('#txtDispUltQEV').val(val9);
			$('#txtDispCBNAcceso').val(val10);
			$('#txtDispCBNPriv').val(val11);
			$('#txtDispQEVCli').val(val12);
			$('#txtDispCBNAccesoCli').val(val13);
			$('#txtDispCBNPrivCli').val(val14);
			$('#cboDispConexion').val(val15).trigger("change");
		} else if(ptipo == 'grp'){
			$('#txtGrGrupo').val(val1);
			$('#cboGrCodIntermedio').val(val2).trigger("change");
			$('#cboGrTipo').val(val3).trigger("change");
			$('#cboGrSistema').val(val4).trigger("change");
			$('#cboGrPrimaria').val(val5).trigger("change");
			$('#cboGrRestringido').val(val6).trigger("change");
			$('#cboGrPrivilegio').val(val7).trigger("change");
			$('#cboGrTipoAcceso').val(val8).trigger("change");
			$('#txtGrSistema2').val(val9);
		} else if(ptipo == 'usu'){
			$('#txtUsuUsuario').val(val1);
			$('#txtUsuEtiqueta').val(val2);
			$('#txtUsuPropietario').val(val3);
			$('#cboUsuTipo').val(val4).trigger("change");
			$('#cboUsuSistema').val(val5).trigger("change");
			$('#cboUsuContraseniaExpira').val(val6).trigger("change");
			$('#txtUsuPerfilesAsoc').val(val7);
		} else if(ptipo == 'shr'){
			$('#txtSharedUsuCompartido').val(val1);
			$('#cboSharedUsuFuncional').val(val2).trigger("change");
			$('#txtSharedEjecutivoAprobador').val(val3);
			$('#cboSharedCambioContrasenia').val(val4).trigger("change");
			$('#cboSharedContraseniaCambiable').val(val5).trigger("change");
			$('#txtSharedContrasenia').val(val6);
			$('#txtSharedJustificacionCambio').val(val7);
			$('#cboSharedVisibilidad').val(val8).trigger("change");
			$('#cboSharedTimeApoyo').val(val9).trigger("change");
			$('#cboSharedContraseniaServ').val(val10).trigger("change");
			$('#txtSharedIntCambioContrasenia').val(val11);
			$('#txtSharedPeriodoAperLlamada').val(val12);
			$('#txtSharedJustCompartir').val(val13);
			$('#txtSharedCriterioAprobar').val(val14);
			$('#cboSharedCambioPeriodo').val(val15).trigger("change");
			$('#cboSharedTipoAccion').val(val16).trigger("change");
		}
	}
	
	function downloadimg(pidreq,pidtipo){
		var src = "ServletUAT";
		$.post(src,{strOperation : 'listimg', idTipo : pidtipo, iIdReq : pidreq},
		function(pdata) {
			var obj = JSON.parse(pdata);
			console.log(obj.uat[0]);
			if(obj.uat[0].resultado == "-1" || obj.uat[0].resultado == "")
				alert("No hay evidencia disponible");
			else
				download1('data:image/jpeg;base64,' + obj.uat[0].resultado,'img_' + pidtipo + '_' + pidreq,'image/jpeg');
			});
	}
	
	
	
	function buscarmax(){
		var src = "ServletUAT";
		var petiquetado = "";
		var ticket = $('#txtTicketId').val();
		
		buscarattachment();
		
		$('#txtUsuPropietario').val();
		
		$.post(src,{strOperation : 'buscarmax', pticket : ticket},
		function(pdata) {
			var obj = JSON.parse(pdata);
			if(obj.uat[0].resultado == 'ok'){
// 				$('#txtTicketId').val(obj.uat[0].ticket);
				$('#txtHostname').val(obj.uat[0].hostname);
				$('#txtDispHostname').val(obj.uat[0].hostname);
				$('#txtDispIP').val(obj.uat[0].ip);
				$('#cboCliente').val(obj.uat[0].client).trigger("change");
			}
			else{
				$('#lblMensajeModal').text('Sin registros de hostname e IP');
				$('#txtTicketId').val(obj.uat[0].ticket);
			}
			});
	}
	
	function buscarldap(){
		var src = "ServletUAT";
		var petiquetado = "";
		var pserial = $('#txtUsuPropietario').val();
		
		$('#txtUsuPropietario').val();
		
		if(pserial.substring(0,1) == '*'){
			var vprop = $('#txtUsuPropietario').val();
			petiquetado = ('815/S/' + $('#txtUsuPropietario').val() + '//' + 
					(vprop == '*PEOINT' ? 'PE_OWNER_TRIBU_INTERCORP' : 
					vprop == '*PEOCOM' ? 'PE_OWNER_TRIBU_COMERCIAL' :
					vprop == '*PEOMI1' ? 'PE_OWNER_TRIBU_MULTIINDUSTRIA1' :
					vprop == '*PEOINF' ? 'PE_OWNER_TRIBU_INFRAESTRUCTURA' :
					vprop == '*PEOMI2' ? 'PE_OWNER_TRIBU_MULTIINDUSTRIA2' :
					''));
			$('#txtUsuEtiqueta').val(petiquetado);
		}
		else{
		$.post(src,{strOperation : 'buscarldap', pcodigo : pserial},
		function(pdata) {
			var obj = JSON.parse(pdata);
			if(obj.uat[0].resultado == 'ok')
				petiquetado = (obj.uat[0].codigo + '/'
				+ (obj.uat[0].serial.substring(0,2) == 'LV' ? 'E' : 'I')
				+ '/' + obj.uat[0].serial + '//' + obj.uat[0].nombre);
			else
				petiquetado = '';
			
			$('#txtUsuEtiqueta').val(petiquetado);
			});
		}
	}
	
	function buscarattachment(){
		var src = "ServletUAT";
		var petiquetado = "";
		var vticket = $('#txtTicketId').val();
		
		$.post(src,{strOperation : 'buscarmaxattachment', pticket : vticket},
		function(pdata) {
			var obj = JSON.parse(pdata);
			console.log(obj);
			if(obj.uat[0].resultado == 'ok'){
				
				for (i = 0; i < obj.uat[0].attachment.length; i++) {
					
					if(i>0) petiquetado +="&nbsp;";
					petiquetado += "<a class=\"btn btn-lg btn-success\" style=\"font-size: 12px;\" href=\"https://ism.ecampus.com.pe/attachments/" + obj.uat[0].attachment[i].descripcionEncode + "\" target=\"_blank\"><i class=\"fa fa-paperclip fa-2x pull-left\"></i><strong>"
					+ obj.uat[0].attachment[i].descripcion + "</strong><br>"
					+ obj.uat[0].attachment[i].ultcambio + " | " + obj.uat[0].attachment[i].ultfecha + "  </a>";
				}
				$('#btnattachment').removeClass('hidden');
// 				$('#btnattachment').addClass('hidden');
			}
			else
				petiquetado = '';
			console.log(petiquetado);
			$('#dvattachment').html(petiquetado);
			
			});
	}
	
	
	var vtb1 = '<table id=\"tblReportes\" class=\"display table table-bordered table-hover\"><thead class=\"bg-light-blue\"></thead></table>';
	var vtb2 = '<table id=\"tblHojas\" class=\"display table table-bordered table-hover\"><thead class=\"bg-light-blue\"></thead></table>';
	
	function r(pOperation, pidTipo, pidReq){

		$(document).ready(function() {
			var src = "ServletUAT";	
			var pestadofinal = $('#btnTipoReqFinal').val();
			
			$.post(src,{strOperation : pOperation, idTipo : pidTipo, iIdReq : pidReq, estadofinal : pestadofinal},
			function(pdata) {
				var obj = JSON.parse(pdata);
				
				if(pOperation == 'ruat'){
				
				$('#tbcontainer').html(vtb1);
				var dataReporte = [];
				var columnsReport = [];
				var columnsRest =[];
				
				for (i = 0; i < obj.uat.length; i++) {
					var arr = [];
					arr.push(obj.uat[i].iIdRequerimiento);
					arr.push(obj.uat[i].iIdRequerimiento);
					arr.push(obj.uat[i].strTipoRequerimiento);
					arr.push(obj.uat[i].strEstado);
					arr.push(obj.uat[i].strIdTicket); //4
					arr.push(obj.uat[i].strSystem);
					arr.push(obj.uat[i].strSO);
					arr.push(obj.uat[i].strFechaVenc);
					
					arr.push(obj.uat[i].strHostname);
					arr.push(obj.uat[i].strAmbiente);
					arr.push(obj.uat[i].strPlataforma); //10
					arr.push(obj.uat[i].inroDisp);
					arr.push(obj.uat[i].inroGrup);
					arr.push(obj.uat[i].inroUsu);
					arr.push(obj.uat[i].inroSha);
					arr.push(obj.uat[i].iIdAmbiente); //15
					arr.push(obj.uat[i].iIdPlataforma);
					arr.push(obj.uat[i].iIdTipoReq);
					arr.push(obj.uat[i].strUsuarioC);
					arr.push(obj.uat[i].strUsuarioM);
					arr.push(obj.uat[i].strFechaM); //20
					arr.push(obj.uat[i].strCliente);
					
					dataReporte.push(arr);
				};
				
				columnsReport = [
					{
						"sName" : "btnAccion",
						"title" : "ACCIONES_CENTRAL_PROCESOUAT",
						"bSearchable" : false,
						"bWidth" : "350px",
						"bSortable" : false,
						"mRender" : function(data,type,item) {
							return '<a data-toggle="tooltip" data-placement="top" title="Editar" class="btn bg-teal btn-sm" onclick="openModal(\'upd\','
									+ '\'' + item[0] + '\','
									+ '\'' + item[18] + '\','
									+ '\'' + item[19] + '\','
									+ '\'' + item[17] + '\','
									+ '\'' + item[4] + '\','
									+ '\'' + item[8] + '\','
									+ '\'' + item[15] + '\','
									+ '\'' + item[16] + '\','
									+ '\'' + item[21] + '\''
									+ ')"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;'
									+ '<a data-toggle="tooltip" data-placement="top" title="Cerrar Solicitud" class="btn btn-default btn-sm" onclick="ustate(' + item[0] + ',\'COMPLETE\')"'
									+ '><i class="fa fa-check-circle" aria-hidden="true"></i></a>&nbsp;'
									+ '<a data-toggle="tooltip" data-placement="top" title="Reenviar carga en UAT" class="btn bg-olive btn-sm" onclick="ustate(' + item[0] + ',\'QUEUE\')"'
									+ '><i class="fa fa-refresh" aria-hidden="true"></i></a>&nbsp;'
									+ '<a data-toggle="tooltip" data-placement="top" title="Reenviar carga en CAR" class="btn bg-primary btn-sm" onclick="ustate(' + item[0] + ',\'QUEUE CAR\')"'
									+ '><i class="fa fa-refresh" aria-hidden="true"></i></a>&nbsp;'
									
									+ (item[3] == 'PLANNING' || item[3] == 'PAUSE' || item[3] == 'QUEUE' ? '<a data-toggle="tooltip" data-placement="top" title="Eliminar" class="btn bg-maroon btn-sm" id="lnkEliminar" onclick="cud(\'2\',\'cuduat\',\'formUAT\',\'' + item[0] + '\')"'
									+ '><i class="fa fa-trash" aria-hidden="true"></i></a>&nbsp;' : '')
									
									+ (item[3] == 'PLANNING' || item[3] == 'PAUSE' || item[3] == 'FINISH UAT' ? 
									  '<a data-toggle="tooltip" data-placement="top" title="Ejecutar siguiente paso" class="btn bg-olive btn-sm" id="lnkEstado" onclick="ustate(' + item[0] + ',\'' + (item[3] == 'PLANNING' || item[3] == 'PAUSE' ? 'QUEUE' : item[3] == 'FINISH UAT' ? 'QUEUE CAR' : 'PAUSE') + '\')"'
									+ '><i class="fa ' + (item[3] == 'PLANNING' || item[3] == 'PAUSE' || item[3] == 'FINISH UAT' ? 'fa-play-circle' : 'fa-pause-circle-o') + '" aria-hidden="true"></i></a>' : '')
									+ '&nbsp;' + (item[3] == 'COMPLETE' || item[3] == 'RUN CAR' || item[3] == 'FINISH UAT' || item[3] == 'QUEUE CAR' ?
									'<a class="btn bg-teal btn-sm" data-toggle="tooltip" data-placement="top" title="Evidencia Dispositivos" onclick="downloadimg(\'' + item[0] + '\',\'DISP\')"><i class="fa fa-cloud-download" aria-hidden="true"></i></a>&nbsp;'
									+ '<a class="btn bg-teal btn-sm" data-toggle="tooltip" data-placement="top" title="Evidencia Grupos" onclick="downloadimg(\'' + item[0] + '\',\'GRP\')"><i class="fa fa-cloud-download" aria-hidden="true"></i></a>&nbsp;'
									+ '<a class="btn bg-teal btn-sm" data-toggle="tooltip" data-placement="top" title="Evidencia Usuarios" onclick="downloadimg(\'' + item[0] + '\',\'USU\')"><i class="fa fa-cloud-download" aria-hidden="true"></i></a>&nbsp;'
									+ '<a class="btn bg-teal btn-sm" data-toggle="tooltip" data-placement="top" title="Evidencia SharedId" onclick="downloadimg(\'' + item[0] + '\',\'SHR\')"><i class="fa fa-cloud-download" aria-hidden="true"></i></a>&nbsp;'
									+ '<a class="btn bg-teal btn-sm" data-toggle="tooltip" data-placement="top" title="Evidencia Final1" onclick="downloadimg(\'' + item[0] + '\',\'FINAL1\')"><i class="fa fa-cloud-download" aria-hidden="true"></i></a>&nbsp;'
									+ '<a class="btn bg-teal btn-sm" data-toggle="tooltip" data-placement="top" title="Evidencia Final2" onclick="downloadimg(\'' + item[0] + '\',\'FINAL2\')"><i class="fa fa-cloud-download" aria-hidden="true"></i></a>' : '');
						}
					},
					{title : "REQ"},
					{title : "TIPO_REQ"},
					{
						"sName" : "btnEstado",
						"title" : "ESTADO",
						"bSearchable" : true,
						"bSortable" : true,
						"mRender" : function(data,type,item) {
							console.log(item[3]);
							 return '<a class="btn btn-flat' +
									  (item[3] == 'PLANNING' ? ' btn-default"><i class="fa fa-clock-o" aria-hidden="true"></i> ' + item[3] + '</a>' :
									  item[3] == 'QUEUE' ? ' btn-warning"><i class="fa fa-hourglass-end" aria-hidden="true"></i> ' + item[3] + '</a>' :
									  item[3] == 'QUEUE CAR' ? ' btn-warning"><i class="fa fa-hourglass-end" aria-hidden="true"></i> ' + item[3] + '</a>' :
									  item[3] == 'PAUSE' ? ' btn-warning"><i class="fa fa-pause-circle-o" aria-hidden="true"></i> ' + item[3] + '</a>' :
									  item[3] == 'RUN' ? ' bg-purple"><i class="fa fa-cog fa-spin fa-fw" aria-hidden="true"></i> ' + item[3] + '</a>' :
									  item[3] == 'COMPLETE' ? ' bg-olive"><i class="fa fa-check-circle-o" aria-hidden="true"></i> ' + item[3] + '</a>' :
									  item[3] == 'FINISH UAT' ? ' bg-teal"><i class="fa fa-check-circle-o" aria-hidden="true"></i> ' + item[3] + '</a>' :
									  ' btn-default"><i class="fa fa-clock-o" aria-hidden="true"></i> ' + item[3] + '</a>');
						}
					},
					{title : "TICKET"},
					{title : "SYSTEM"},
					{title : "SO"},
					{title : "FECHA VENC"},
					
					{title : "HOSTNAME"},
					{title : "AMBIENTE"},
					{title : "PLATAFORMA"},
					{title : "NRODISP"},
					{title : "NROGRUPO"},
					{title : "NROUSU"},
					{title : "NROSHA"},
					{title : "IDAMBIENTE"},
					{title : "IDPLATAFORMA"},
					{title : "IDTIPOPLATAFORMA"},
					{title : "USUC"},
					{title : "MODIFICADOR"},
					{title : "FECHA"}
					];
				
				columnsRest = [ 
					{"targets" : [ 15 ],"visible" : false,"searchable" : false},
					{"targets" : [ 16 ],"visible" : false,"searchable" : false},
					{"targets" : [ 17 ],"visible" : false,"searchable" : false},
					{"targets" : [ 18 ],"visible" : false,"searchable" : false}
					];
				
				setDataInformation(dataReporte,columnsReport,columnsRest,'#tblReportes');
				
				} else if(pOperation == 'ruatdisp'){
					
					$('#dvContainerHojas').html(vtb2);
					var dataReporte = [];
					var columnsReport = [];
					var columnsRest = [];
					for (i = 0; i < obj.uat.length; i++) {
						var arr = [];
						arr.push(obj.uat[i].iIdDispositivo); //0
						arr.push(obj.uat[i].strHostname);
						arr.push(obj.uat[i].strIp);
						arr.push(obj.uat[i].strEstadoDisp);
						arr.push(obj.uat[i].strTeamDelivery);
						arr.push(obj.uat[i].strAutomatizado);
						arr.push(obj.uat[i].strRole);
						arr.push(obj.uat[i].strConexion); //8
						
						arr.push(obj.uat[i].strDispositivoMaestro);
						arr.push(obj.uat[i].strDispositivoMaestro2); //10
						arr.push(obj.uat[i].strUltQEV);
						arr.push(obj.uat[i].strUltCbnAcceso);
						arr.push(obj.uat[i].strUltCbnPriv);
						arr.push(obj.uat[i].strUltQEVCli);
						arr.push(obj.uat[i].strUltCbnAccesoCli);
						arr.push(obj.uat[i].strUltCbnPrivCli); //16
						
						arr.push(obj.uat[i].iEstadoDispositivo);
						arr.push(obj.uat[i].iTeamDelivery);
						arr.push(obj.uat[i].iAutomatizado);
						arr.push(obj.uat[i].iRoleDispositivo); //20
						arr.push(obj.uat[i].iConexion);
						arr.push(obj.uat[i].strUsuarioC);
						arr.push(obj.uat[i].strUsuarioM);
						arr.push(obj.uat[i].strFechaM); //24
						dataReporte.push(arr);
					};
					
					columnsReport = [
						{
							"sName" : "btnAccion",
							"title" : "Acciones",
							"bSearchable" : false,
// 							"sWidth" : "200px",
							"bSortable" : false,
							"mRender" : function(data,type,item) {
								var a = item[0];
// 								console.log('disp: ' + a + ' - ' + item[1]);
								return '<a title="Editar" class="btn btn-info btn-sm" onclick="setParameters(\'disp\','
										+ '\'' + item[0] + '\','
										+ '\'' + item[1] + '\','
										+ '\'' + item[2] + '\','
										+ '\'' + item[16] + '\','
										+ '\'' + item[17] + '\','
										+ '\'' + item[18] + '\','
										+ '\'' + item[19] + '\','
										+ '\'' + item[8] + '\','
										+ '\'' + item[9] + '\','
										+ '\'' + item[10] + '\','
										+ '\'' + item[11] + '\','
										+ '\'' + item[12] + '\','
										+ '\'' + item[13] + '\','
										+ '\'' + item[14] + '\','
										+ '\'' + item[15] + '\','
										+ '\'' + item[20] + '\''
										+ ')"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;&nbsp;'
										+ '<a title="Eliminar" class="btn btn-danger btn-sm" id="lnkEliminar" onclick="cud(\'3\',\'cuduatdisp\',\'formUAT\',\'' + item[0] + '\')"'
										+ '><i class="fa fa-trash" aria-hidden="true"></i></a>';
							}
						},
						{title : "HOSTNAME"},
						{title : "IP"},
						{title : "ESTADO"},
						{title : "TEAMDELIVERY"},
						{title : "AUTOMATIZADO"},
						{title : "ROLE"},
						{title : "CONEXION"},
						{title : "DISP. MAESTRO"},
						{title : "DISP. MAESTRO 2"},
						{title : "ULT. QEV"},
						{title : "ULT. CBN ACC"},
						{title : "ULT. CBN PRIV"},
						{title : "ULT. QEV CLI"},
						{title : "ULT. CBN ACC CLI"},
						{title : "ULT. CBN PRIV CLI"},
						{title : "ESTADODISP"},
						{title : "TEAMDELIVERY"},
						{title : "AUTOMATIZADO"},
						{title : "ROLEDISP"},
						{title : "CONEXION"},
						{title : "CREADOR"},
						{title : "MODIFICADOR"},
						{title : "FECHA MOD"}
						];
					
					columnsRest = [ 
						{"targets" : [ 16 ],"visible" : false,"searchable" : false},
						{"targets" : [ 17 ],"visible" : false,"searchable" : false},
						{"targets" : [ 18 ],"visible" : false,"searchable" : false},
						{"targets" : [ 19 ],"visible" : false,"searchable" : false},
						{"targets" : [ 20 ],"visible" : false,"searchable" : false},
						{"targets" : [ 21 ],"visible" : false,"searchable" : false}
						];
					
					setDataInformation(dataReporte,columnsReport,columnsRest,'#tblHojas');
					
					} else if(pOperation == 'ruatgrupos'){
					
						$('#dvContainerHojas').html(vtb2);
						var dataReporte = [];
						var columnsReport = [];
						var columnsRest = [];
						
					for (i = 0; i < obj.uat.length; i++) {
						var arr = [];
						arr.push(obj.uat[i].iIdGrupo);
						arr.push(obj.uat[i].strGrupo);
						arr.push(obj.uat[i].strCodigoIntermedio);
						arr.push(obj.uat[i].strTipo);
						arr.push(obj.uat[i].strSistema);
						arr.push(obj.uat[i].strPrimaria); //5
						arr.push(obj.uat[i].strRestringido);
						arr.push(obj.uat[i].strPrivilegio);
						arr.push(obj.uat[i].strTipoAcceso);
						arr.push(obj.uat[i].strSistema2);
						arr.push(obj.uat[i].iCodigoIntermedio); //10
						arr.push(obj.uat[i].iTipo);
						arr.push(obj.uat[i].iSistema);
						arr.push(obj.uat[i].iPrimaria);
						arr.push(obj.uat[i].iRestringido);
						arr.push(obj.uat[i].iPrivilegio); //15
						arr.push(obj.uat[i].iTipoAcceso);
						arr.push(obj.uat[i].strUsuarioC);
						arr.push(obj.uat[i].strUsuarioM);
						arr.push(obj.uat[i].strFechaM); //19
						dataReporte.push(arr);
					};
					
					columnsReport = [
						{
							"sName" : "btnAccion",
							"title" : "Acciones",
							"bSearchable" : false,
// 							"sWidth" : "200px",
							"bSortable" : false,
							"mRender" : function(data,type,item) {
								var a = item[0];
								return '<a title="Editar" class="btn btn-info btn-sm" onclick="setParameters(\'grp\','
										+ '\'' + item[0] + '\','
										+ '\'' + item[1] + '\','
										+ '\'' + item[10] + '\','
										+ '\'' + item[11] + '\','
										+ '\'' + item[12] + '\','
										+ '\'' + item[13] + '\','
										+ '\'' + item[14] + '\','
										+ '\'' + item[15] + '\','
										+ '\'' + item[16] + '\','
										+ '\'' + item[9] + '\''
										+ ')"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;&nbsp;'
										+ '<a title="Eliminar" class="btn btn-danger btn-sm" id="lnkEliminar" onclick="cud(\'3\',\'cuduatgrupos\',\'formUAT\',\'' + item[0] + '\')"'
										+ '><i class="fa fa-trash" aria-hidden="true"></i></a>';
							}
						},
						{title : "GRUPOS"}, 
						{title : "COD. INTERMEDIO"}, 
						{title : "TIPO"}, 
						{title : "SISTEMA"},
						{title : "PRIMARIA"},
						{title : "RESTRINGIDO"},
						{title : "PRIVILEGIO"},
						{title : "TIPO ACCESO"},
						{title : "SISTEMA2"},
						{title : "ID COD. INTERMEDIO"},
						{title : "IDTIPO"},
						{title : "IDSISTEMA"},
						{title : "IDPRIMARIA"},
						{title : "IDRESTRINGIDO"},
						{title : "IDPRIVILEGIO"},
						{title : "TIPOACCESO"},
						{title : "CREADOR"},
						{title : "MODIFICADOR"},
						{title : "FECHA MOD"}
						];
					
					columnsRest = [ 
						{"targets" : [ 10 ],"visible" : false,"searchable" : false},
						{"targets" : [ 11 ],"visible" : false,"searchable" : false},
						{"targets" : [ 12 ],"visible" : false,"searchable" : false},
						{"targets" : [ 13 ],"visible" : false,"searchable" : false},
						{"targets" : [ 14 ],"visible" : false,"searchable" : false},
						{"targets" : [ 15 ],"visible" : false,"searchable" : false}
						];
					
			setDataInformation(dataReporte,columnsReport,columnsRest,'#tblHojas');
					
					} else if(pOperation == 'ruatusuarios'){
						
						$('#dvContainerHojas').html(vtb2);
						var dataReporte = [];
						var columnsReport = [];
						var columnsRest = [];
						for (i = 0; i < obj.uat.length; i++) {
							var arr = [];
							arr.push(obj.uat[i].iIdUsuarios);
							arr.push(obj.uat[i].strUsuario);
							arr.push(obj.uat[i].strEtiqueta);
							arr.push(obj.uat[i].strPropietario);
							arr.push(obj.uat[i].strTipo);
							arr.push(obj.uat[i].strSistema); //5
							arr.push(obj.uat[i].strContraseniaExpira);
							arr.push(obj.uat[i].iTipo);
							arr.push(obj.uat[i].iSistema);
							arr.push(obj.uat[i].iContraseniaExpira);
							arr.push(obj.uat[i].strPerfilesAsociados); //10
							arr.push(obj.uat[i].strUsuarioC);
							arr.push(obj.uat[i].strUsuarioM);
							arr.push(obj.uat[i].strFechaM); //13
							dataReporte.push(arr);
						};
						
						columnsReport = [
							{
								"sName" : "btnAccion",
								"title" : "Acciones",
								"bSearchable" : false,
// 								"sWidth" : "200px",
								"bSortable" : false,
								"mRender" : function(data,type,item) {
									var a = item[0];
									return '<a title="Editar" class="btn btn-info btn-sm" onclick="setParameters(\'usu\','
											+ '\'' + item[0] + '\','
											+ '\'' + item[1] + '\','
											+ '\'' + item[2] + '\','
											+ '\'' + item[3] + '\','
											+ '\'' + item[7] + '\','
											+ '\'' + item[8] + '\','
											+ '\'' + item[9] + '\','
											+ '\'' + item[10] + '\''
											+ ')"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;&nbsp;'
											+ '<a title="Eliminar" class="btn btn-danger btn-sm" id="lnkEliminar" onclick="cud(\'3\',\'cuduatusuarios\',\'formUAT\',\'' + item[0] + '\')"'
											+ '><i class="fa fa-trash" aria-hidden="true"></i></a>';
								}
							},					
							{title : "USUARIO"}, 
							{title : "ETIQUETA"}, 
							{title : "PROPIETARIO"}, 
							{title : "TIPO"},
							{title : "SISTEMA"},
							{title : "PWD EXPIRA"},
							{title : "IDTIPO"},
							{title : "IDSISTEMA"},
							{title : "IDPWDEXPIRA"},
							{title : "PERFILASOC"},
							{title : "CREADOR"},
							{title : "MODIFICADOR"},
							{title : "FECHA MOD"}
							];
						
						columnsRest = [ 
							{"targets" : [ 7 ],"visible" : false,"searchable" : false},
							{"targets" : [ 8 ],"visible" : false,"searchable" : false},
							{"targets" : [ 9 ],"visible" : false,"searchable" : false},
							{"targets" : [ 10 ],"visible" : false,"searchable" : false},
							{"targets" : [ 11 ],"visible" : false,"searchable" : false}
							];
						
						setDataInformation(dataReporte,columnsReport,columnsRest,'#tblHojas');
						
					} else if(pOperation == 'ruatsharedid'){
						
						$('#dvContainerHojas').html(vtb2);
						var dataReporte = [];
						var columnsReport = [];
						var columnsRest = [];
						for (i = 0; i < obj.uat.length; i++) {
							var arr = [];
							arr.push(obj.uat[i].iIdSharedId);
							arr.push(obj.uat[i].strUsuarioCompartido);
							arr.push(obj.uat[i].strUsuarioFuncional);
							arr.push(obj.uat[i].strCambioContraseniaAuto);
							arr.push(obj.uat[i].strContraseniaCambiable);
							arr.push(obj.uat[i].strVisibilidad); //5
							arr.push(obj.uat[i].strTimeApoyo);
							arr.push(obj.uat[i].strContraseniaServ);
							arr.push(obj.uat[i].strIntervaloCambioContrasenia);
							arr.push(obj.uat[i].strPeriodoAntApertLlamada); //9
							
							arr.push(obj.uat[i].strEjecutivoAprobar); //10
							arr.push(obj.uat[i].strContrasenia);
							arr.push(obj.uat[i].strJustificacionNoCambio);
							arr.push(obj.uat[i].iUsuarioFuncional);
							arr.push(obj.uat[i].iCambioContrasenioAuto); //14
							
							arr.push(obj.uat[i].iContrasenioCambiable); //15
							arr.push(obj.uat[i].iVisibilidad);
							arr.push(obj.uat[i].iTimeApoyo);
							arr.push(obj.uat[i].iContraseniaServ);
							arr.push(obj.uat[i].iIntervaloCambioContrasenia);
							arr.push(obj.uat[i].iPeriodoAntApertLlamada); //20
							arr.push(obj.uat[i].strJustificacionCompartir);
							arr.push(obj.uat[i].strCriterioAprobar);
							arr.push(obj.uat[i].iCambioPeriodo);
							arr.push(obj.uat[i].iTipoAccion);
							arr.push(obj.uat[i].strUsuarioC); //25
							arr.push(obj.uat[i].strUsuarioM);
							arr.push(obj.uat[i].strFechaM); //27
							dataReporte.push(arr);
						};
						
						columnsReport = [
							{
								"sName" : "btnAccion",
								"title" : "Acciones",
								"bSearchable" : false,
	// 								"sWidth" : "200px",
								"bSortable" : false,
								"mRender" : function(data,type,item) {
									var a = item[0];
									return '<a title="Editar" class="btn btn-info btn-sm" onclick="setParameters(\'shr\','
											+ '\'' + item[0] + '\',' 
											+ '\'' + item[1] + '\','  //1
											+ '\'' + item[13] + '\','
											+ '\'' + item[10] + '\','
											+ '\'' + item[14] + '\','
											+ '\'' + item[15] + '\',' //5
											+ '\'' + item[11] + '\','
											+ '\'' + item[12] + '\','
											+ '\'' + item[16] + '\','
											+ '\'' + item[17] + '\','
											+ '\'' + item[18] + '\',' //10
											+ '\'' + item[19] + '\','
											+ '\'' + item[20] + '\','
											+ '\'' + item[21] + '\','
											+ '\'' + item[22] + '\','
											+ '\'' + item[23] + '\',' //15
											+ '\'' + item[24] + '\''
											+ ')"><i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;&nbsp;'
											+ '<a title="Eliminar" class="btn btn-danger btn-sm" id="lnkEliminar" onclick="cud(\'3\',\'cuduatsharedid\',\'formUAT\',\'' + item[0] + '\')"'
											+ '><i class="fa fa-trash" aria-hidden="true"></i></a>';
								}
							},
							{title : "USUCOMPARTIDO"}, 
							{title : "USUFUNCIONAL"}, 
							{title : "CAMBIO PWD AUTO"},
							{title : "PWD CAMBIABLE"},
							{title : "VISIBILIDAD"},
							{title : "TIMEAPOYO"},
							{title : "PWD SERV"},
							{title : "INTERVALO CAMBIO PWD"},
							{title : "PERIODO ANT APERT LLAMADA"},
							
							{title : "EJECUTIVO APROB"},
							{title : "PWD"},
							{title : "JUST. NO CAMBIO"},
							{title : "IDUSUFUNCIONAL"},
							{title : "IDCAMBIOPWDAUTO"},
							{title : "IDPWDCAMBIABLE"},
							{title : "IDVISIBILIDAD"},
							{title : "IDTIMEAPOYO"},
							{title : "IDPWDSERV"},
							{title : "INTCAMBIOPWD"},
							{title : "PERANTAPELLAM"},
							{title : "JUSTCOMPARTIR"},
							{title : "CRITAPROB"},
							{title : "CAMBPER"},
							{title : "IDTPACC"},
							{title : "CREADOR"},
							{title : "MODIFICADOR"},
							{title : "FECHA MOD"}
							];
						
						columnsRest = [ 
							{"targets" : [ 13 ],"visible" : false,"searchable" : false},
							{"targets" : [ 14 ],"visible" : false,"searchable" : false},
							{"targets" : [ 15 ],"visible" : false,"searchable" : false},
							{"targets" : [ 16 ],"visible" : false,"searchable" : false},
							{"targets" : [ 17 ],"visible" : false,"searchable" : false},
							{"targets" : [ 18 ],"visible" : false,"searchable" : false}
							];
						
						setDataInformation(dataReporte,columnsReport,columnsRest,'#tblHojas');
						}
				
			});
		});
	}
		
		
		function setDataInformation(pdataReporte, pcolumnsReport, pcolumnsRest, ptbl) {
			// 		$(document).ajaxStart(function() { Pace.restart(); });
			// 		document.getElementById('tbcontainer').innerHTML = 	htmlTable;
			$(document).ready(function(){
			
			if (typeof tableReporte === 'undefined') {
					    console.log('in table ' + ptbl);

				var tableReporte = $(ptbl).DataTable(
						{
							processing : false,
							language : {
								processing : "Procesando...",
								search : '<i class="fa fa-search fa-lg"></i>',
								searchPlaceholder : "Buscar..."
							},
							bAutoWidth: false,
							pageLength : "15",
							serverSide : false,
							data : pdataReporte,
							columns : pcolumnsReport,
							columnDefs : pcolumnsRest,
							dom: "<'row'<'col-sm-6'B><'col-sm-6 text-right'f>>" +
							"<'row'<'col-sm-12'tr>>" +
							"<'row'<'col-sm-5'i><'col-sm-7 text-right'p>>",
							lengthMenu : [
									[ 10, 25, 50, -1 ],
									[ '10 registros', 
									'25 registros', 
									'50 registros', 
									'Mostrar todo' ]],
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
				$('.dataTables_filter input').addClass('form-control-search-datatable');
				// 		$('.dataTables_filter input').attr('size',10);
			} else {
				// 	        console.log('in else');
				// how to change the data contained inside datatable?
				tableReporte.fnClearTable();
				tableReporte.fnAddData(dataReporte);
				tableReporte.fnAdjustColumnSizing();
			}
			
			});
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
		$('#txtMaximoTicketId').attr("disabled", true);

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


</script>


</html>