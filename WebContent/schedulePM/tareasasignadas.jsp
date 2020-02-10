<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<!--      <meta charset="UTF-8">  -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Librerias para Kartik -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/kartik-v-bootstrap-fileinput-d66e684/css/fileinput.css" media="all" />

<!-- Librerias para toggle -->
<link rel="stylesheet" type="text/css" href="http://www.bootstraptoggle.com/css/bootstrap-toggle.css">
<script src="http://www.bootstraptoggle.com/js/bootstrap-toggle.js" type="text/javascript"></script>

<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

<style type="text/css">

tfoot input {
        width: 100%;
        padding: 3px;
        box-sizing: border-box;
    }
    
</style>

</head>
<body>
<input type="hidden" id="hdIdTareaGenerada">
	<!-- Modal  Cargando pagina-->
	<div class="modal js-loading-bar">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<h3>Cargando ...</h3>
					<div class="progress progress-striped active">
						<div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Fin Modal  Cargando pagina-->
	<!-- Content Wrapper. Contains page content -->
	<aside class="right-side "> <!-- Content Header (Page header) -->

	<section class="content-header">
	<h1>
		Tareas Asignadas
	</h1>
	<ol class="breadcrumb">
		<li><a href="index.php"><i class="fa fa-th-large"></i>
				Schedule Gobierno</a></li>
		<li class="active">Tareas Asignadas</li>
	</ol>
	</section> <!-- Main content --> <section id="page"
		title="Schedule Gobierno / Tareas Asignadas" class="content">
	<br>

	<div id="alertaConfirmacion"
		class="alert alert-success alert-dismissable fade in"
		style='display: none;'>
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>¡Éxito!</strong> Su operación se ha realizado
		satisfactoriamente.
	</div>

	<div id="alertaNegativa"
		class="alert alert-danger alert-dismissable fade in"
		style='display: none;'>
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<strong>¡Error!</strong> Su operación no se ha realizado.
	</div>
	
	



	<!--     Inicio      Modal Editar                                                       -->
	<div class="modal fade" id="modalEdit" role="dialog"
		aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #68DFF0">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLongTitle">
						<a style="color: white">Archivo adjunto&nbsp;&nbsp;</a><a
							style="color: red; font-weight: bold;"></a>
					</h4>
				</div>
				<div class="modal-body">

					<input type="hidden" style="width: 100%;" class="form-control"
						id="pIdTareaGenerada"> <input type="hidden"
						style="width: 100%;" class="form-control" id="pIdFile"> <input
						type="hidden" style="width: 100%;" class="form-control"
						id="pPerfil">
					</hr>
					<label>Adjuntar nuevo archivo:</label> <input id="fileEdit"
						class="file" multiple="true" data-show-upload="false"
						data-show-caption="true" type="file" name="fileArchivo"><br>
					<br>
					<small>* Solo se permiten los formatos (xls, xlsx, doc,
						docx, ppt, pptx, jpeg, txt, pdf)</small><br>
					<button id="btnActualizar" type="submit"
						class="btn btn-primary btn-sm">
						<i class="fa fa-floppy-o"></i> Guardar
					</button>
					<p id="pErrorFile" class="text-danger" style='display: none;'></p>
					</hr>
					<br>
					<br>
					<table style="width: 100%;" class="table">
						<thead>
							<tr>
								<th>#</th>
								<th colspan="3">Descripción</th>
								<th colspan="2" align="center"><center>Acción</center></th>
							</tr>
						</thead>
						<tbody id="tablaFileAdjunto">

						</tbody>
					</table>

					</hr>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">
						<i class="fa fa-reply"></i> Cerrar
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Fin Modal Editar -->
	
	<div class="row">
		<div class="col-sm-12 col-md-6 col-lg-3" style="width: auto !important;">
<!-- 			<div class="form-inline"> -->
		  	<div class="form-group" style="display: inline-block;">
			    <label> Estado: </label> <select class="select2" id="cboEstado"></select>
			</div>
<!-- 			<div class="form-group" style="width: 150px"> -->
			    
<!-- 			</div> -->
			<div class="form-group" style="display: inline;">
				<a id="btnBuscar" title="Buscar" href="#" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> Buscar</a>
			</div>
<!-- 			</div> -->
		</div>
		
		<div style="display: inline;" class="col-sm-12 col-md-6 col-lg-3">
		<div id="divOpciones" class="row">
		<div id="divVista"  class="form-group" style='display: none; width: auto;'>
			   <label style="display: block;">Tipo de Vista:</label> <input id="chkVista" data-toggle="toggle"
				data-on="Aprobador" data-off="Owner" type="checkbox"
				data-size="small" data-onstyle="primary" data-offstyle="warning" style="width: auto;">
		</div>		
		</div>
		</div>
	</div>

	<br>
	
	<div class="row"><div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><span id="spanMessage"></span></div></div>
	
	<!-- INICIO TABLA RESULTADOS -->
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Resultados de Busqueda</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive" id="divTabla"></div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
	</div>
	<!-- FIN TABLA RESULTADOS --> </section><!-- /.content -->      

		<div id="modalEstado" class="modal fade" role="dialog">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header label-primary">
		        <h4 class="modal-title">CONFIRMACIÓN DE ESTADO</h4>
		      </div>
		      <div class="modal-body">
		      	
		        	<div class="row">
		        		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		        		<table style="margin: auto;">
			        		<tbody>
				        		<tr style="vertical-align: bottom;">
				        			<td><label style="margin-right: 5px;">Estado: </label></td>
					        		<td>
							    		<div class="input-group">
							    			<input style="width: 130px;" type="text" id="txtEstadoModal" class="form-control disabled input-sm" value="" readonly="readonly">
										<div class="input-group-addon"><i class="fa fa-info-circle text-blue" aria-hidden="true"></i></div>
									</div>
					        		</td>
				        			<td> &nbsp;&nbsp;<label style="margin-right: 5px; margin-left: 5px;"> Vencimiento: </label></td>
				        			<td>
						        		<div class="input-group">
						        			<input style="width: 130px;" type="text" id="txtFechaLimiteModal" class="form-control disabled input-sm" value="" readonly="readonly">
										<div class="input-group-addon"><i class="fa fa-calendar text-blue" aria-hidden="true"></i></div>
									</div>
				        			</td>
				        		</tr>
			        		</tbody>
		        		</table>
		        		<hr>
		        		<table style="margin: auto;" id="tblRegistro">
			        		<tbody>
			        			<tr>
			        			<td colspan="2"><label>Registros</label></td>
			        			</tr>
				        		<tr>
				        			<td colspan="2">
					        			<div class="form-inline">
					        				<span data-toggle='tooltip' data-placement='top' title='EJECUTADO'>
						        				<div id="dvEjecutado" class="input-group">
					        						<input type="text" id="txtEjecutadoModal" class="form-control input-sm" value="" readonly="readonly">
												<div class="input-group-addon"><i class="fa fa-clock-o text-green" aria-hidden="true"></i></div>
											</div>
										</span>
										
										<span data-toggle='tooltip' data-placement='top' title='CANCELADO'>
						        				<div id="dvCancelado" class="input-group">
						        					<input type="text" id="txtCanceladoModal" class="form-control disabled input-sm" value="" readonly="readonly">
												<div class="input-group-addon"><i class="fa fa-ban text-red" aria-hidden="true"></i></div>
											</div>
										</span>
										
										<span data-toggle='tooltip' data-placement='top' title='REPROGRAMADO'>
						        				<div id="dvReprogramado" class="input-group">
					        						<input type="text" id="txtReprogramadoModal" class="form-control disabled input-sm" value="" readonly="readonly">
												<div class="input-group-addon"><i class="fa fa-calendar-o text-yellow" aria-hidden="true"></i></div>
											</div>
										</span>
										
										<span data-toggle='tooltip' data-placement='top' title='APROBADO'>
						        				<div id="dvAprobado" class="input-group">
					        						<input type="text" id="txtAprobadoModal" class="form-control disabled input-sm" value="" readonly="readonly">
												<div class="input-group-addon"><i class="fa fa-check-circle-o text-blue" aria-hidden="true"></i></div>
											</div>
										</span>
					        			</div>
				        			</td>
				        		</tr>
			        		</tbody>
		        		</table>
		        		<br>
						<div id="divChangeState" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		        			<label>Registrar estado:</label>
		        			<div id="divRegistroEstado" class="col-center">
				        			<a id="btnEjecutar" class="btn btn-app bg-green color-palette"><i class="fa fa-clock-o " aria-hidden="true"></i> Ejecutar</a>
				        			<a id="btnCancelar" class="btn btn-app bg-red color-palette"><i class="fa fa-ban" aria-hidden="true"></i> Cancelar</a>
				        			<a id="btnReprogramar1" class="btn btn-app bg-yellow color-palette"><i class="fa fa-calendar-o" aria-hidden="true"></i> Reprogramar</a>
				        			<a id="btnAprobar" class="btn btn-app bg-light-blue color-palette"><i class="fa fa-check-circle-o" aria-hidden="true"></i> Aprobar</a>
				        	</div>
				        	<br>
				        	<div id="divFechaReprogramada" class="col-center hidden">
					        	<div class="form-inline">
					        		<div class="form-group">
					        			<label>Fecha Reprogramada: </label>
					        			<input type="text" id="txtFechaReprogramada" class="form-control input-sm datePicker" value="">
					        			<a id="btnReprogramar2" class="btn btn-warning"><i class="fa fa-calendar-o text-white" aria-hidden="true"></i> Reprogramar</a>
					        			<a id="btnVolver2" class="btn btn-default"><i class="fa fa-undo" aria-hidden="true"></i> volver</a>
					        		</div>
					        	</div>
					        	<br>
				        	</div>
				        	
			        	</div>
			        	<div >
			      			<div class="form-group">
			      				<label>Observaciones:</label>
			      				<textarea id="txtObservaciones" class="form-control" rows="6" cols="10"></textarea>
			      			</div>
			        	</div>	
		        		</div>
		      	</div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
<!-- 		        <button type="button" class="btn btn-primary">Guardar</button> -->
		      </div>
		    </div><!-- /.modal-content -->
		  </div><!-- /.modal-dialog -->
		</div><!-- /.modal -->
	</aside>
	


	<!-- Librerias para Kartik --> 
	<script src="<%=request.getContextPath()%>/resources/kartik-v-bootstrap-fileinput-d66e684/js/fileinput.js" type="text/javascript"></script> 
	<!-- Librerias para feedBack --> 
	<script src="<%=request.getContextPath()%>/resources/feedBack/js/feedback.js" type="text/javascript"></script> 
	
	<script>
	
	var f=new Date();
	var date = f.getFullYear() + '-' + ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f.getMonth() + 1)) + '-' + ((f.getDate()) < 10 ? '0' + f.getDate() : f.getDate());
	$('#txtFechaReprogramada').val(date);
	
	function modalEstado(idTareaGenerada,pestado,pfechalimite, pfechaRealizada, pfechaAprobada, pFechaReprogramada, pFechaCancelada,pObservaciones){
		
		console.log("idTareaGenerada: " + idTareaGenerada + "\n" + "pestado: " + pestado + "\n" + "pfechalimite: " + pfechalimite + "\n" + "pfechaRealizada: " + pfechaRealizada + "\n" + "pfechaAprobada: " + pfechaAprobada + "\n" + "pFechaReprogramada: " + pFechaReprogramada + "\n" + "pFechaCancelada: " + pFechaCancelada);
		
		var perfil = $("#pPerfil").val();
		
		$('#tblRegistro').removeClass('hidden');
 		$('#divChangeState').removeClass('hidden');
		$('#dvEjecutado').removeClass('hidden');
		$('#dvEjecutado').addClass('hidden');
		$('#dvAprobado').removeClass('hidden');
		$('#dvAprobado').addClass('hidden');
		$('#dvCancelado').removeClass('hidden');
		$('#dvCancelado').addClass('hidden');
		$('#dvReprogramado').removeClass('hidden');
		$('#dvReprogramado').addClass('hidden');
		$('#divFechaReprogramada').removeClass('hidden');
		$('#divFechaReprogramada').addClass('hidden');
		
		$('#btnEjecutar').addClass('disabled');
		$('#btnAprobar').addClass('disabled');
		$('#btnCancelar').addClass('disabled');
		$('#btnReprogramar1').addClass('disabled');
		$('#btnReprogramar2').addClass('disabled');
		
		$('#btnEjecutar').removeClass('hidden');
		$('#btnAprobar').removeClass('hidden');
		$('#btnCancelar').removeClass('hidden');
		$('#btnReprogramar1').removeClass('hidden');
		$('#btnReprogramar2').removeClass('hidden');
		
		$('#divRegistroEstado').removeClass('hidden');
		
		$('#hdIdTareaGenerada').text(idTareaGenerada);
		$('#txtEstadoModal').val(pestado);
		$('#txtFechaLimiteModal').val(pfechalimite);
		$('#txtEjecutadoModal').val(pfechaRealizada)
		$('#txtCanceladoModal').val(pFechaCancelada);
		$('#txtReprogramadoModal').val(pFechaReprogramada);
		$('#txtAprobadoModal').val(pfechaAprobada);
		$('#txtObservaciones').val(pObservaciones);
		
		//No esta ejecutado
		if(pfechaRealizada == ''){
			$('#tblRegistro').addClass('hidden');
			$('#btnCancelar').removeClass('disabled');
			$('#btnReprogramar1').removeClass('disabled');
			$('#btnReprogramar2').removeClass('disabled');
			$('#btnEjecutar').removeClass('disabled');
			$('#btnAprobar').addClass('hidden');
		}else{ //Si esta ejecutado
			$('#btnEjecutar').addClass('hidden')
			$('#btnReprogramar1').addClass('hidden');
			$('#btnReprogramar2').addClass('hidden');
			
			$('#dvEjecutado').removeClass('hidden');
			$('#btnAprobar').removeClass('disabled');
			$('#btnCancelar').removeClass('disabled');
			$('#btnReprogramar1').removeClass('disabled');
			$('#btnReprogramar2').removeClass('disabled');	
			if(perfil == 'APROBADOR'){
				$('#btnAprobar').removeClass('disabled');	
			}
		}
		
		//Esta aprobado
		if(pfechaAprobada != ''){
			$('#tblRegistro').removeClass('hidden');
 			$('#divChangeState').addClass('hidden');
			$('#btnEjecutar').addClass('disabled');
			$('#btnAprobar').addClass('disabled');
			$('#btnReprogramar1').addClass('disabled');
			$('#btnReprogramar2').addClass('disabled');
			$('#btnCancelar').addClass('disabled');
			$('#dvAprobado').removeClass('hidden');
		}
		
		//Esta reprogramado
		if(pFechaReprogramada != ''){
			$('#tblRegistro').removeClass('hidden');
			$('#dvReprogramado').removeClass('hidden');
// 			$('#btnReprogramar1').removeClass('disabled');
// 			$('#btnReprogramar1').addClass('disabled');
// 			$('#btnReprogramar2').removeClass('disabled');
// 			$('#btnReprogramar2').addClass('disabled');
		}
		
		//Esta cancelado
		if(pFechaCancelada != ''){
			$('#tblRegistro').removeClass('hidden');
 			$('#divChangeState').addClass('hidden');
			$('#dvCancelado').removeClass('hidden');
			$('#btnCancelar').removeClass('disabled');
			$('#btnCancelar').addClass('disabled');
			$('#btnEjecutar').removeClass('disabled');
			$('#btnEjecutar').addClass('disabled');
			$('#btnReprogramar1').removeClass('disabled');
			$('#btnReprogramar1').addClass('disabled');
			$('#btnReprogramar2').removeClass('disabled');
			$('#btnReprogramar2').addClass('disabled');
			$('#btnAprobar').removeClass('disabled');
			$('#btnAprobar').addClass('disabled');
		}
		
		$('#modalEstado').modal('show');
		}
		
		$('#btnReprogramar1').click(function(){
			$('#divRegistroEstado').removeClass('hidden');
			$('#divRegistroEstado').addClass('hidden');
			$('#divFechaReprogramada').removeClass('hidden');
		});
		
		$('#btnVolver2').click(function(){
			$('#divFechaReprogramada').removeClass('hidden');
			$('#divFechaReprogramada').addClass('hidden');
			$('#divRegistroEstado').removeClass('hidden');
		});
	
		$(document).ready(function() { 
			
			
			opcionesHtml();
			
			
			
			});
		
		$('#btnEjecutar').click(function(){
			//document.getElementById(idbtnEjecutar).style.display = 'none';
			var src = "ServletTarea";
			var pIdTareaGenerada = $('#hdIdTareaGenerada').text();
			var pObservaciones = $('#txtObservaciones').val().split("\n").join(" ").trim();
			$.post(src,{
					strAccion : "6",
					strIdTareaGenerada : pIdTareaGenerada,
					strObservaciones : pObservaciones
				},
				function(pdata) {
					//var obj = JSON.parse(pdata);
					var obj = pdata;
					if(obj == 'ok'){
						$('#modalEstado').modal('hide');
// 						activarAlertaConfirmacion('alertaConfirmacion');
						setMensajeAlert(1,'Se registró correctamente la Ejecución');
					}
					else{
						$('#modalEstado').modal('hide');
						setMensajeAlert(0,'Hubo un problema al registrar, por favor actualiza esta página (F5) y vuelve a intentarlo en unos minutos');
						}
					

				visualizar();
				});
		});
		
		$('#btnAprobar').click(function(){
			var src = "ServletTarea";
			var pIdTareaGenerada = $('#hdIdTareaGenerada').text();
			var pObservaciones = $('#txtObservaciones').val().split("\n").join(" ").trim();

			$.post(src,{
					strAccion : "7",
					strIdTareaGenerada : pIdTareaGenerada,
					strObservaciones : pObservaciones
				},
				function(pdata) {
					//var obj = JSON.parse(pdata);
					var obj = pdata;
					if(obj == 'ok'){
						$('#modalEstado').modal('hide');
						setMensajeAlert(1,'Se registró correctamente la Aprobación');
					}
					else{
						$('#modalEstado').modal('hide');
						setMensajeAlert(0,'Hubo un problema al registrar, por favor actualiza esta página (F5) y vuelve a intentarlo en unos minutos');
						}
				visualizar();
				});
		});
		

		
		$('#btnReprogramar2').click(function(){
			var src = "ServletTarea";
			var pIdTareaGenerada = $('#hdIdTareaGenerada').text();
			var pstrFechaReprogramada = $('#txtFechaReprogramada').val();
			var pObservaciones = $('#txtObservaciones').val().split("\n").join(" ").trim();

			$.post(src,{
					strAccion : "10",
					strIdTareaGenerada : pIdTareaGenerada,
					strFechaReprogramada : pstrFechaReprogramada,
					strObservaciones : pObservaciones
				},
				function(pdata) {
					//var obj = JSON.parse(pdata);
					var obj = pdata;
					if(obj == 'ok'){
						$('#modalEstado').modal('hide');
						setMensajeAlert(1,'Se registró correctamente la Reprogramación');
					}
					else{
						$('#modalEstado').modal('hide');
						setMensajeAlert(0,'Hubo un problema al registrar, por favor actualiza esta página (F5) y vuelve a intentarlo en unos minutos');
						}
					visualizar();
				});
		});
		
		$('#btnCancelar').click(function(){
			var src = "ServletTarea";
			var pIdTareaGenerada = $('#hdIdTareaGenerada').text();
			var pObservaciones = $('#txtObservaciones').val().split("\n").join(" ").trim();
			
			$.post(src,{
					strAccion : "11",
					strIdTareaGenerada : pIdTareaGenerada,
					strObservaciones : pObservaciones
				},
				function(pdata) {
					//var obj = JSON.parse(pdata);
					var obj = pdata;
					if(obj == 'ok'){
						$('#modalEstado').modal('hide');
						setMensajeAlert(1,'Se registró correctamente la Cancelación');
					}
					else{
						$('#modalEstado').modal('hide');
						setMensajeAlert(0,'Hubo un problema al registrar, por favor actualiza esta página (F5) y vuelve a intentarlo en unos minutos');
						}
					visualizar();
				});
		});
		


			//Armar combo Estado según Vista Aprobador o Owner
			$("#chkVista").on('change', function() {
				if ($(this).is(':checked')) {
					// Hacer algo si el checkbox ha sido seleccionado
					comboEstado('APROBADO');
					visualizar();
				} else {
					// Hacer algo si el checkbox ha sido deseleccionado
					comboEstado('EJECUTADO');
					visualizar();
				}
			});

			$('#btnBuscar').click(function() {

				visualizar();

			});

			function visualizar() {
				var icboEstado = $('#cboEstado').val();
				var idVista = validarVista();
				tablaHtml();
				listar(icboEstado, idVista);
			}

			function opcionesHtml() {
				var src = "ServletTarea";
				$.post(src,{strAccion : "0"},
								function(pdata) {

									var obj = JSON.parse(pdata);
									var perfil = obj.Sesion[0].perfil;

									$("#pPerfil").val(perfil);

									if (perfil == 'APROBADOR') {
										document.getElementById('divVista').style.display = 'block';
										$('#chkVista').attr('checked', true);
										comboEstado('APROBADO');
									} else if (perfil == 'OWNER') {
										document.getElementById('divVista').style.display = 'none';
										$('#chkVista').attr('checked', false);
										comboEstado('EJECUTADO');
									} else {
										document.getElementById('divVista').style.display = 'none';
										$('#chkVista').attr('checked', true);
										comboEstado('APROBADO');
									}
									
									$('#cboEstado').val('1').trigger('change');
									console.log('select: ' + $('#cboEstado').val());
									
									visualizar();
								});
				
			}

			function validarVista() {
				var idVista;
				if ($('#chkVista').prop("checked") == true) {
					idVista = "1"; // Vista aprobador
				} else {
					idVista = "0"; // Vista Owner
				}
				return idVista;
			}

			function comboEstado(idTipo) {

				$("#cboEstado option").remove();
				$("#cboEstado").append($('<option>', {
					value : "0",
					text : " TODOS ",
					selected : "selected"
				}));
				$("#cboEstado").append($('<option>', {
					value : "1",
					text : " NO " + idTipo
				}));
				$("#cboEstado").append($('<option>', {
					value : "2",
					text : idTipo
				}));
			}

			function tablaHtml() {

				var perfil = $("#pPerfil").val();
				var idVista = validarVista();

				var tabla = "<table id=\"dtResultados\" class=\"display table table-hover\" "
						+ " style=\"font-size:12px; font-weight:bold; width:100%\"> "
						+ "	<thead class=\"bg-primary\">"
						+ "          <tr>"
						+ "            <th>N</th>"
						+ "            <th>Estado</th>"
						+ "            <th>Tipo</th>"
						+ "            <th>Tarea</th>"
						+ "            <th>Owner</th>"
						+ "            <th>Aprobador</th>"
						+ "            <th>Frecuencia</th>"
						+ "            <th>Programación</th>"
						+ "            <th>Periodo</th>"
						+ "            <th>Fecha Limite</th>"
						+ "            <th>Fecha Ejecutado</th>"
						+ "            <th>Fecha Aprobado</th>"
						+ "            <th>Fecha Reprogramado</th>"
						+ "            <th>Fecha Cancelado</th>"
						+ "			   <th>Acción</th>"
						+ "			   <th>Observaciones</th>"
						+ "			   <th>Adjunto</th>";
						
		

				
				tabla += " </tr> </thead>"
				+ "	<tfoot"
				+ "          <tr>"
				+ "            <th>N</th>"
				+ "            <th>Estado</th>"
				+ "            <th>Tipo</th>"
				+ "            <th>Tarea</th>"
				+ "            <th>Owner</th>"
				+ "            <th>Aprobador</th>"
				+ "            <th>Frecuencia</th>"
				+ "            <th>Programación</th>"
				+ "            <th>Periodo</th>"
				+ "            <th>Fecha Limite</th>"
				+ "            <th>Fecha Ejecutado</th>"
				+ "            <th>Fecha Aprobado</th>"
				+ "            <th>Fecha Reprogramado</th>"
				+ "            <th>Fecha Cancelado</th>"
				+ "			   <th>Acción</th>"
				+ "			   <th>Observaciones</th>"
				+ "			   <th>Adjunto</th>";

				
				tabla += "	      </tr>" + "	     </tfoot>" + "      </table>";

				document.getElementById("divTabla").innerHTML = tabla;
			}

			function modalFile(pidtarea, pNombreFile, pBase64) {
				// Create Base64 Object
				$('#fileEdit').fileinput('reset');

				document.getElementById('pErrorFile').style.display = 'none';

				$('#pIdTareaGenerada').val(pidtarea);
				$('#pIdFile').val(pNombreFile);
				$('#pBase64').text(pBase64);

				var tipoFile = base64MimeType(pBase64);
				var nombreFile = $("#" + pNombreFile).text();
				var cadenaTabla = "";

				if (nombreFile != "") {
					cadenaTabla = "<tr> "
							+ "<td> 1 </td> "
							+ "<td colspan = \"3\">"
							+ nombreFile
							+ "</td>"
							+ "<td align=\"right\">"
							+ "<button title=\"Descargar\" type=\"button\" class=\"btn btn-primary btn-sm\" style='display:block;' onclick=\"descargarFile('"
							+ pBase64
							+ "','"
							+ nombreFile
							+ "','"
							+ tipoFile
							+ "')\"><i class=\"fa fa-download\"></i></button>"
							+ "</td >"
							+ "<td align=\"left\">"
							+ "<button title=\"Eliminar\" type=\"button\" class=\"btn btn-danger btn-sm\" style='display:block;' onclick=\"eliminarFile('"
							+ pidtarea + "','" + pNombreFile
							+ "')\"><i class=\"fa fa-trash\"></i></button>"
							+ "</td>" + "</tr>";

				} else {
					cadenaTabla = "<tr><td colspan = \"4\"> No hay archivo adjunto</td></tr>";
				}

				document.getElementById("tablaFileAdjunto").innerHTML = cadenaTabla;

			}

			function descargarFile(pBase64, nombreFile, TipoFile) {
				download(pBase64, nombreFile, TipoFile);
			}

			function eliminarFile(pIdTareaGenerada, pNombreFile) {
				var src = "ServletTarea";
				$.post(src,{
									strAccion : "8",
									strIdTareaGenerada : pIdTareaGenerada,
									strArchivo : "",
									strArchivoNombre : ""
								},
								function(pdata) {
  
									var obj = JSON.parse(pdata);

									if (obj.BeanTareaAsignada[0].idTareaGenerada != ""
											|| obj.BeanTareaAsignada[0].idTareaGenerada != 0) {
										var nombreFile = obj.BeanTareaAsignada[0].archivoNombre;
										var file = obj.BeanTareaAsignada[0].archivo;
										$("#" + pNombreFile).text("");
										modalFile(pIdTareaGenerada,
												pNombreFile, file);

									} else {

									}
								});
			}

			function base64MimeType(encoded) {
				var result = null;

				if (typeof encoded !== 'string') {
					return result;
				}

				var mime = encoded
						.match(/data:([a-zA-Z0-9]+\/[a-zA-Z0-9-.+]+).*,.*/);

				if (mime && mime.length) {
					result = mime[1];
				}

				return result;
			}

			function limpiarVariable() {

				$('#pIdTareaGenerada').val('');
				$('#pIdFile').val('');

			}

			//Inicio Editar Adjunto
			$('#btnActualizar').click(function() {

								var pidtarea = $('#pIdTareaGenerada').val();
								var pFile = $('#pIdFile').val();

								var files = document.getElementById('fileEdit').files;
								var nameFile;

								function getBase64(file) {

									nameFile = files[0].name;
									var reader = new FileReader();
									reader.readAsDataURL(file);
									reader.onload = function() {
										adjuntar(reader.result, nameFile,
												pidtarea, pFile);
									};
									reader.onerror = function(error) {
										console.log('Error: ', error);
									};
								}

								if (files.length > 0) {
									getBase64(files[0]);
								} else {
									document.getElementById('pErrorFile').style.display = 'block';
									$("#pErrorFile").text(
											"*Debe adjuntar un archivo");
								}

							});
			//Fin Actualizar Tarea

			function validar(e) {
				tecla = (document.all) ? e.keyCode : e.which;
				patron = /[\x5C'"]/;
				te = String.fromCharCode(tecla);
				return !patron.test(te);
			}
			
			function setMensajeAlert(strResultado,strMensaje){
				$(document).ready(function(){
					if(strResultado == 1){
						$('#spanMessage').removeClass('label label-danger');
						$('#spanMessage').removeClass('label label-success');
						$('#spanMessage').addClass('label label-success');
						$('#spanMessage').text(strMensaje);
					}
					else{
						$('#spanMessage').removeClass('label label-danger');
						$('#spanMessage').removeClass('label label-success');
						$('#spanMessage').addClass('label label-danger');
						$('#spanMessage').text(strMensaje);
					}
					
					$('#spanMessage').fadeIn();
					setTimeout(function() { $('#spanMessage').fadeOut(); }, 5000);	
				});
				
			}
			
			

			function activarAlertaConfirmacion(id) {

				document.getElementById(id).style.display = 'block';
				setTimeout(function() {
					desactivarAlertaConfirmacion(id);
					}, 3000)
			}// Fin funcion activarAlertaConfirmacion

			function desactivarAlertaConfirmacion(id) {

				document.getElementById(id).style.display = 'none';

			}// Fin funcion desactivarAlertaConfirmacion

			function ejecutar(idbtnEjecutar, idpEjecutar, idbtnAprobar,
					pIdTareaGenerada) {

				document.getElementById(idbtnEjecutar).style.display = 'none';
				var src = "ServletTarea";
				$.post(src,{
									strAccion : "6",
									strIdTareaGenerada : pIdTareaGenerada
								},
								function(pdata) {

									var obj = JSON.parse(pdata);

									if (obj.BeanTareaAsignada[0].idTareaGenerada != ""
											|| obj.BeanTareaAsignada[0].idTareaGenerada != 0) {
										var fechaRealizada = obj.BeanTareaAsignada[0].fechaRealizada;
										document.getElementById(idpEjecutar).style.display = 'block';
										$("#" + idpEjecutar).text(
												fechaRealizada);
										document.getElementById(idbtnAprobar).style.display = 'block';
									}
								});
			}

			function aprobar(idbtnAprobar, idpAprobar, pIdTareaGenerada) {

				document.getElementById(idbtnAprobar).style.display = 'none';
				var src = "ServletTarea";
				$.post(src,{
									strAccion : "7",
									strIdTareaGenerada : pIdTareaGenerada
								},
								function(pdata) {

									var obj = JSON.parse(pdata);

									if (obj.BeanTareaAsignada[0].idTareaGenerada != ""
											|| obj.BeanTareaAsignada[0].idTareaGenerada != 0) {
										var fechaAprobada = obj.BeanTareaAsignada[0].fechaAprobada;
										document.getElementById(idpAprobar).style.display = 'block';
										$("#" + idpAprobar).text(fechaAprobada);
									}
								});
			}

			function adjuntar(pArchivo, pArchivoNombre, pIdTareaGenerada, pFile) {

				var src = "ServletTarea";
				$.post(src,{
									strAccion : "8",
									strArchivo : pArchivo,
									strArchivoNombre : pArchivoNombre,
									strIdTareaGenerada : pIdTareaGenerada
								},
								function(pdata) {

									var obj = JSON.parse(pdata);

									if (obj.BeanTareaAsignada[0].idTareaGenerada != "" || obj.BeanTareaAsignada[0].idTareaGenerada != 0) {
										var nombreFile = obj.BeanTareaAsignada[0].archivoNombre;
										$("#" + pFile).text(nombreFile);
										modalFile(pIdTareaGenerada, pFile,
												pArchivo);
									} else {

									}
								});
			}

			function listar(pEstado, idVista) {
				
				var $modal = $('.js-loading-bar');
				$modal.modal('show');
				
				limpiarVariable();

				var src = "ServletTarea";
				var accion;

				var perfil = $("#pPerfil").val();

				
			
				if (perfil == 'ADMINISTRADOR' || perfil == 'GESTOR'
						|| perfil == 'DPE' || perfil == 'ADMINISTRACION') {
					accion = "9";
				} else { // perfil APROBADOR o OWNER
					accion = "5";
				}

				//Inicio POST para  listar información en la tabla
				$.post(src,{
									strAccion : accion,
									strEstado : pEstado,
									strIdOperacion : idVista,
									iTeam : vTeam
								},
								function(pdata) {

									var obj = JSON.parse(pdata);

									var datatabla = [];
									var numeracion = 0;

									if (obj.ListaTareasAsignadas[0].idTarea == "") {

										console.log('idtarea = 0');

										
										//Ocultar Modal con barra de progreso
										var $modal = $('.js-loading-bar');
										$modal.modal('hide');

									} else {
										//Ocultar Modal con barra de progreso
										

										if (obj.ListaTareasAsignadas.length < 3) {
											$("#aside").addClass("sizeHeight");
										} else {
											$("#aside").removeClass(
													"sizeHeight");
										}

										for (i = 0; i < obj.ListaTareasAsignadas.length; i++) {

											numeracion = numeracion + 1;
											var arr = [];

											//captura de datos
											
											
// 											modalEstado(idTareaGenerada,pestado,pfechalimite, pfechaRealizada, pfechaAprobada, pFechaReprogramada, pFechaCancelada){
											
											var idTareaGenerada = obj.ListaTareasAsignadas[i].idTareaGenerada;
											var tipoTarea = obj.ListaTareasAsignadas[i].tipoTarea;
											var tarea = obj.ListaTareasAsignadas[i].tarea;
											var owner = obj.ListaTareasAsignadas[i].owner;
											var aprobador = obj.ListaTareasAsignadas[i].aprobador;
											var frecuencia = obj.ListaTareasAsignadas[i].frecuencia;
											var programacion = obj.ListaTareasAsignadas[i].programacion;
											var periodo = obj.ListaTareasAsignadas[i].periodo;
											var avisoIn = obj.ListaTareasAsignadas[i].avisoIn;
											var avisoFin = obj.ListaTareasAsignadas[i].avisoFin;
											var fechaLimite = (obj.ListaTareasAsignadas[i].estadoLimite == "IGUAL" ? "<span data-toggle='tooltip' data-placement='top' title='Alertas entre " + obj.ListaTareasAsignadas[i].avisoIn + " y " + obj.ListaTareasAsignadas[i].avisoFin + "' class='label label-warning'>" + obj.ListaTareasAsignadas[i].fechaLimite + "</span>" : obj.ListaTareasAsignadas[i].estadoLimite == "ANTES" ? "<span data-toggle='tooltip' data-placement='top' title='Alertas entre " + obj.ListaTareasAsignadas[i].avisoIn + " y " + obj.ListaTareasAsignadas[i].avisoFin + "' class='label label-success'>" + obj.ListaTareasAsignadas[i].fechaLimite + "</span>" : obj.ListaTareasAsignadas[i].estadoLimite == "DESPUES" ? "<span data-toggle='tooltip' data-placement='top' title='Alertas entre " + obj.ListaTareasAsignadas[i].avisoIn + " y " + obj.ListaTareasAsignadas[i].avisoFin + "' class='label label-danger'>" + obj.ListaTareasAsignadas[i].fechaLimite + "</span>" : "<span data-toggle='tooltip' data-placement='top' title='Alertas entre " + obj.ListaTareasAsignadas[i].avisoIn + " y " + obj.ListaTareasAsignadas[i].avisoFin + "' class='label label-default'>" + obj.ListaTareasAsignadas[i].fechaLimite + "</span>") ;
											var fechaRealizada = obj.ListaTareasAsignadas[i].fechaRealizada;
											var fechaAprobada = obj.ListaTareasAsignadas[i].fechaAprobada;
											var fechaReprogramado = obj.ListaTareasAsignadas[i].fechaReprogramada;
											var fechaCancelado = obj.ListaTareasAsignadas[i].fechaCancelada;
											var archivo = obj.ListaTareasAsignadas[i].archivo;
											var archivoNombre = obj.ListaTareasAsignadas[i].archivoNombre;
											var estado = obj.ListaTareasAsignadas[i].strEstado;
											var divEstado = (estado == 'PENDIENTE' ? '<span class="label label-info"><i class="fa fa-hourglass-end" aria-hidden="true"></i> PENDIENTE</span>' : estado == 'EJECUTADO' ? '<span class="label label-success"><i class="fa fa-clock-o" aria-hidden="true"></i> EJECUTADO</span>' : estado == 'REPROGRAMADO' ? '<span class="label label-warning"><i class="fa fa-calendar-o" aria-hidden="true"></i> REPROGRAMADO</span>' : estado == 'APROBADO' ? '<span class="label label-primary"><i class="fa fa-check-circle-o" aria-hidden="true"></i> APROBADO</span>' : estado == 'CANCELADO' ? '<span class="label label-danger"><i class="fa fa-ban" aria-hidden="true"></i> CANCELADO</span>' : '')
											var observaciones = obj.ListaTareasAsignadas[i].observaciones.split("\"").join("\\\"");
											var accion = "<center><div style='display:inline-flex;'><a style='padding:8px! important;' onclick='modalEstado(\"" + idTareaGenerada + "\",\"" + estado + "\",\"" + obj.ListaTareasAsignadas[i].fechaLimite + "\",\"" + fechaRealizada + "\",\"" + fechaAprobada + "\",\"" + fechaReprogramado + "\",\"" + fechaCancelado + "\",\"" + observaciones + "\")' class='btn btn-sm bg-purple'><i class='fa fa-external-link' aria-hidden='true'></i></a>" + "<button style='padding:8px!important;margin-left:6px !important;' title=\"Editar file adjunto\" type=\"button\" class=\"btn btn-primary btn-xs\" style='display:block;' data-toggle=\"modal\" data-target=\"#modalEdit\" onclick=\"modalFile('"
											+ idTareaGenerada
											+ "','pFile"
											+ numeracion
											+ "', '"
											+ archivo
											+ "')\"><i class=\"fa fa-paperclip\"></i></button></div> "
											+ "<p style='margin-bottom: 0;margin-top: 2px;' id=\"pFile"+numeracion+"\" style='display:block;'>"
											+ archivoNombre + "</p></center>";
											
											if (fechaRealizada == null || fechaRealizada == "" || fechaRealizada == "null") {
												fechaRealizada = "<button id=\"ejecutar"
														+ numeracion
														+ "\" title=\"Ejecutar Tarea\" type=\"button\" class=\"btn btn-warning btn-xs\" style='display:block;' onclick=\"ejecutar('ejecutar"
														+ numeracion
														+ "','pEjecutar"
														+ numeracion
														+ "','aprobar"
														+ numeracion
														+ "','"
														+ idTareaGenerada
														+ "')\" ><i class=\"fa fa-play\"></i> EJECUTAR </button>"
														+ "<p id=\"pEjecutar"+numeracion+"\" style='display:none;'></p>";
												fechaAprobada = "<button id=\"aprobar"
														+ numeracion
														+ "\" title=\"Ejecutar Tarea\" type=\"button\" class=\"btn btn-success btn-xs\" style='display:none;' onclick=\"aprobar('aprobar"
														+ numeracion
														+ "','pAprobar"
														+ numeracion
														+ "','"
														+ idTareaGenerada
														+ "')\"><i class=\"fa fa-play\"></i> APROBAR </button>"
														+ "<p id=\"pAprobar"+numeracion+"\" style='display:none;'></p>";
											} else if (fechaAprobada == null || fechaAprobada == "" || fechaAprobada == "null") {
												fechaAprobada = "<button id=\"aprobar"
														+ numeracion
														+ "\" title=\"Ejecutar Tarea\" type=\"button\" class=\"btn btn-success btn-xs\" style='display:block;' onclick=\"aprobar('aprobar"
														+ numeracion
														+ "','pAprobar"
														+ numeracion
														+ "','"
														+ idTareaGenerada
														+ "')\"><i class=\"fa fa-play\"></i> APROBAR </button>"
														+ "<p id=\"pAprobar"+numeracion+"\" style='display:none;'></p>";
											}

											//Generación de cadena para tabla  turno
											arr.push(numeracion);
											arr.push(divEstado);
											arr.push(tipoTarea);
											arr.push(tarea);
											arr.push(owner);
											arr.push(aprobador);
											arr.push(frecuencia);
											arr.push(programacion);
											arr.push(periodo);
											arr.push(fechaLimite);
											
											arr.push(fechaRealizada);
											arr.push(fechaAprobada);
											arr.push(fechaReprogramado);
											arr.push(fechaCancelado);
											
											arr.push(accion);
											arr.push(observaciones);
											arr.push(accion);


											datatabla.push(arr);
										}
										
										
									}

									// DataTable


									$('#dtResultados tfoot th').each( function () {
									        var title = $(this).text();
									        $(this).html( '<input type="text" placeholder="'+title+'" />' );
									    } );

									var table =  $('#dtResultados').DataTable({
														fixedHeader: {
												            header: true,
												            footer: true
												        },
												        "columnDefs": [
												            {
												                "targets": [ 10 ],
												                "visible": false,
												                "searchable": false
												            },
												            {
												                "targets": [ 11 ],
												                "visible": false,
												                "searchable": false
												            },
												            {
												                "targets": [ 12 ],
												                "visible": false,
												                "searchable": false
												            },
												            {
												                "targets": [ 13 ],
												                "visible": false,
												                "searchable": false
												            },
												            {
												                "targets": [ 15 ],
												                "visible": false,
												                "searchable": false
												            },
												            {
												                "targets": [ 16 ],
												                "visible": false,
												                "searchable": false
												            }
												        ],
														processing : true,
														language : {
															processing : "Procesando...",
															search : '<i class="fa fa-search fa-lg"></i>',
															searchPlaceholder : "Buscar...",
															emptyTable: "Ningún dato disponible en esta tabla",
															lengthMenu: "Mostrar _MENU_ registros",
						            						zeroRecords: "Sin resultados encontrados",
						            						info: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
						            						infoEmpty: "No hay registros disponibles",
						            						infoFiltered: "(filtrado de un total de _MAX_ registros)",
						            						paginate: {
						            							first: "Primero",
						            							last: "Último",
						            							next: "Siguiente",
						            							previous: "Anterior"
						            						}
														},
														dom : 'Bfrtip',
														lengthMenu : [
																[ 10, 25, 50, -1 ],
																[ '10 Registros', '25 registros' , '50 registros', 'Mostrar todos' ] ],
														data : datatabla,
														buttons : [
															{
																extend : 'pageLength',
																text : '<i class="fa fa-list-ol" aria-hidden="true"></i> Mostrar',
																className: "btn-sm"
															},
															{
															 	extend: "copy",
																exportOptions: {
																	columns: [0,1,2,3,4,5,6,7,8,9,15,16]
																},
																className: "btn-sm",
																text : '<i class="fa fa-clipboard" aria-hidden="true"></i> Copiar'
															},
															{
																extend: "csv",
																exportOptions: {
																	columns: [0,1,2,3,4,5,6,7,8,9,15,16]
																},
																className: "btn-sm",
																text : '<i class="fa fa-file-text-o" aria-hidden="true"></i> CSV'
															},
															{
																extend: "excel",
																exportOptions: {
																	columns: [0,1,2,3,4,5,6,7,8,9,15,16]
																},
																className: "btn-sm",
																text : '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
															},
															{
																extend: "pdfHtml5",
																exportOptions: {
																	columns: [0,1,2,3,4,5,6,7,8,9,15,16]
																},
																className: "btn-sm",
																text : '<i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF'
															},
															{
																extend: "print",
																exportOptions: {
																	columns: [0,1,2,3,4,5,6,7,8,9,15,16]
																},
																className: "btn-sm",
																text : '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'
															}],
															responsive: true
													});
									
									// Apply the search
								    table.columns().every( function () {
								        var that = this;
								 
								        $( 'input', this.footer() ).on( 'keyup change', function () {
								            if ( that.search() !== this.value ) {
								                that
								                    .search( this.value )
								                    .draw();
								            }
								        } );
								    } );
									
								    var $modal = $('.js-loading-bar');
									$modal.modal('hide');

								});

				// Fin del POST listar tabla

			}
	</script> <script type="text/javascript">
		$('.clockpicker').clockpicker({
			donetext : 'OK'
		});
	</script> <script>
		$(function() {
			//Initialize Select2 Elements
			$(".select2").select2();
		});
	</script> <script type="text/javascript">
		//Setup Barra de progreso
		this.$('.js-loading-bar').modal({
			backdrop : 'static',
			show : false
		});

		// Haciendo visible Modal con Barra de progreso 
		var $modal = $('.js-loading-bar');
		$modal.modal('show');
	</script>
</body>
</html>
