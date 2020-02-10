<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

	<!-- Ejecuciones personalizadas -->
	<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

	<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js'></script>

	<!-- fullCalendar -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/fullCanlendar/css/fullcalendar.min.css" rel='stylesheet' />
	<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/fullCanlendar/css/fullcalendar.print.css"> --%>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/fullCanlendar/css/fullcalendar.print.min.css" rel='stylesheet' media='print' />

	<!-- FullCalendar -->
	<script src="<%=request.getContextPath()%>/resources/fullCanlendar/js/fullcalendar.min.js"></script>

	<!-- Locale JS -->
	<script src="<%=request.getContextPath()%>/resources/locale/locale-all.js"></script>	

	<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
	<section class="content-header">
	<h1>
		Gestión <small>Asignación de Horarios</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-th-large"></i> Mantenimiento</a></li>
		<li class="active">Asignación de Horarios</li>
	</ol>
	</section> <!-- Main content --> 
	<section class="content"> <!-- top row -->
	<div class="row">
		<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
			<div class="form-inline">
				<div class="form-group">
<!-- 					<a class="btn btn-default btn-sm" href="#" onclick="openModalInsert()"> <i class="fa fa-file-text-o" id="aNuevo" aria-hidden="true"></i> Nuevo </a>  -->
<!-- 					<a class="btn btn-default btn-sm" onlick="listReport()"> <i class="fa fa-refresh fa-lg" aria-hidden="true"></i> </a> -->
				</div>
			</div>
		</div>
	</div>
	<br />
	<div class="row">
		<div class="col-lg-12 connectedSortable">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">
						<i class="fa fa-table" aria-hidden="true"></i> LISTA DE HORARIOS
					</h3>
				</div>
				<div class="box-body">
					<label id="lblMessage" class="label label-info"></label>

					<!-- add calander in this div -->
					<div class="container-fluid">
						<div class="row">
							<div id="calendar"></div>
						</div>
					</div>
				</div>
				<div id="dvLoadP1"></div>
			</div>
		</div>
	</div>
	</section>
	</aside>


					<!-- Modal  to Add Event -->
					<div id="createEventModal" class="modal fade" role="dialog">
						<div class="modal-dialog">

							<!-- Modal content-->
							<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">×</button>
								<h4 class="modal-title">Asignación de Horarios</h4>
							</div>
							<div class="box box-widget widget-user" style="margin-bottom: 0px;">
						       	<div class="widget-user-header bg-blue-gradient text-center">
						       		<h3 class="widget-user-username">USUARIO</h3>
						        </div>
							    <div class="widget-user-image img-responsive">
							    	<canvas id="imgFoto1" class="img-circle img-lg"></canvas>
							    </div>
						   	</div>
						   	<br/>
						   	<br/>
							<div class="modal-body">
								<table>
									<tbody>
										<tr>
											<td>Usuario</td>
											<td><select id="cboEmpleados" class="form-control cbo2">
													<option value="0">Seleccionar</option>
											</select></td>
										</tr>
										<tr>
										<td colspan="2"><br/></td>
										</tr>
										<tr>
											<td>Observaciones: </td>
											<td><input id="txtObservaciones" class="form-control input-sm"></td>
										</tr>
										<tr>
										<td colspan="2"><br/></td>
										</tr>
										<tr>
											<td>Inicio: </td>
											<td>
												<div class="form-inline">
													<div class="form-group">
														
														<div class="input-group">
											        			<input type="text" class="form-control input-sm datePicker" id="txtInicio">
											        			<span class="input-group-addon">
											        				<span class="fa fa-calendar-o"></span>
											        			</span>
											        		</div> 
														<div class="input-group timePicker2">
											        			<input id="txtHorarioInicio" type="text" class="form-control input-sm">
											        			<span class="input-group-addon">
											        				<span class="fa fa-clock-o"></span>
											        			</span>
											        		</div>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td>Fin: </td>
											<td>
												<div class="form-inline">
													<div class="form-group">
														
														<div class="input-group">
											        			<input type="text" class="form-control input-sm datePicker" id="txtFin">
											        			<span class="input-group-addon">
											        				<span class="fa fa-calendar-o"></span>
											        			</span>
											        		</div>
														<div class="input-group timePicker2">
											        			<input id="txtHorarioFin" type="text" class="form-control input-sm">
											        			<span class="input-group-addon">
											        				<span class="fa fa-clock-o"></span>
											        			</span>
											        		</div>
													</div>
												</div>
											</td>
										</tr>
										<tr id="trDuplicar">
										<td>Duplicar: <input type="checkbox" id="chkDuplicar"></td>
										<td>
										<div class="form-inline hidden" id="dvDuplicar">
											<div class="form-group">
												
												<div class="input-group">
										    		<input type="text" class="form-control input-sm datePicker" id="txtDuplicar">
										    		<span class="input-group-addon">
										    			<span class="fa fa-calendar-o"></span>
										    		</span>
										    	</div>
											</div>
										</div>
										</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="modal-footer">
								
								<a id="btnGuardar" onclick="accionesHorario('update')" class="btn btn-primary btn-sm"><i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar</a>
								<a id="btnEliminar" onclick="accionesHorario('delete')" class="btn btn-danger btn-sm"><i class="fa fa-trash-o" aria-hidden="true"></i> Eliminar</a>
								<a data-dismiss="modal" aria-hidden="true" class="btn btn-default btn-sm"><i class="fa fa-undo" aria-hidden="true"></i> Cancelar</a>
							</div>
						</div>
					</div>
				</div>
			</div>

					<!-- Modal to Event Details -->
					<div id="calendarModal" class="modal fade">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">×</button>
									<h4 class="modal-title">Detalles</h4>
								</div>
								<div id="modalBody" class="modal-body">
									<h4 id="modalTitle" class="modal-title"></h4>
									<div id="modalWhen" style="margin-top: 5px;"></div>
								</div>
								<input type="hidden" id="eventID" />
								<div class="modal-footer">
									<button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
									<a id="btnEliminar1" onclick="accionesHorario('delete')" class="btn btn-danger btn-sm"><i class="fa fa-floppy-o" aria-hidden="true"></i> Eliminar</a>
								</div>
							</div>
						</div>
					</div>
	<input type="hidden" id="hdIdHorarioEmpleado" value="0">
	<!--Modal-->

<style>
body {
	/*     margin: 40px 10px; */
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
/*  	max-width: 100%; */
	margin: 0 auto;
}

</style>

<script type="text/javascript">
	var vTeam = document.getElementById('hdIdTeam').value;
	var vIdEmpleado = document.getElementById('hdIdEmpleado').value;
	
	$(document).ready(function() {
		
		$('#chkDuplicar').change(function(){
			if($('#chkDuplicar').is(':checked'))
				$('#dvDuplicar').removeClass('hidden');
			else{
				$('#dvDuplicar').removeClass('hidden');
				$('#dvDuplicar').addClass('hidden');
			}
		});
		
		$('#cboEmpleados').change(function(){
			var serial = $('#cboEmpleados option:selected').text();
// 			showImage('http://w3.ibm.com/bluepages/photo/Photo.jsp?cnum=' + serial.substring(0,6) + '815');
			showImage('http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?cnum=' + serial.substring(0,6) + '815');
// 			console.log(serial.substring(0,6));
		});
	
		listPersonal();
		listarCalendario();
	});
	
	function showImage(pimg)
	{
		var canvas = document.getElementById("imgFoto1");
		var ctx = canvas.getContext("2d");
		
		var img = new Image();
		img.src = pimg;
	 	ctx.drawImage(img, 0, 0, 300,150);
// 		alert('showImage  ==> ' + pimg);
		img.onload = function(){
			ctx.drawImage(img, 0, 0, 300,150);
			}
	};
	
	function refreshCalendario(){
		var src = "ServletHorarioEmpleado";
		$.post(src, {strOperation : 'list', iTeam : vTeam, iIdPersonal : vIdEmpleado},
				function(pdata) {
				  var obj = JSON.parse(pdata);
				  var events_ = obj;
			
// 		console.log(events_.reporte);
		
		$("#calendar").fullCalendar('removeEvents'); 
		$("#calendar").fullCalendar('addEventSource', events_.reporte);
		
		document.getElementById('dvLoadP1').innerHTML = '';
		$('#dvLoadP1').removeClass('overlay');
		});
	}
	
	
	function listarCalendario(){
		
		$('#dvLoadP1').removeClass('overlay');
		$('#dvLoadP1').addClass('overlay');
		document.getElementById('dvLoadP1').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
		
		var initialLocaleCode = 'es-do';
		
		var src = "ServletHorarioEmpleado";
		$.post(src, {strOperation : 'list', iTeam : vTeam, iIdPersonal : vIdEmpleado},
				function(pdata) {
				  var obj = JSON.parse(pdata);
				  var events_ = obj;
			
// 		console.log(events_.reporte);
		var calendar = '';
		var calendar = $('#calendar').fullCalendar({ // assign calendar
						header : {
								left : 'prev,next today',
								center : 'title',
								right : 'month,agendaWeek,agendaDay,listMonth'
								},
						locale : initialLocaleCode,
						defaultView : 'agendaWeek',
						editable : true,
						selectable : true,
						allDaySlot : false,
						events : events_.reporte,
								eventClick : function(event,jsEvent, view) { // when some one click on any event
										endtime = $.fullCalendar.moment(event.end).format('h:mm');
										starttime = $.fullCalendar.moment(event.start).format('dddd, MMMM Do YYYY, h:mm');
										var mywhen = starttime + ' - ' + endtime;
										$('#modalTitle').html(event.title);
										$('#modalWhen').text(mywhen);
										
										showImage('resources/image/personal/default_avatar.jpg');
										$('#hdIdHorarioEmpleado').val(event.id);
										startdate = $.fullCalendar.moment(event.start).format('YYYY-MM-DD');
										enddate = $.fullCalendar.moment(event.end).format('YYYY-MM-DD');
										starttime = $.fullCalendar.moment(event.start).format('HH:mm:ss');
										endtime = $.fullCalendar.moment(event.end).format('HH:mm:ss');
										$('#createEventModal #txtInicio').val(startdate);
										$('#createEventModal #txtHorarioInicio').val(starttime);
										$('#createEventModal #txtFin').val(enddate);
										$('#createEventModal #txtHorarioFin').val(endtime);
										$('#createEventModal #txtDuplicar').val(startdate);
										$('#hdIdHorarioEmpleado').val(event.id);
										$('#cboEmpleados').val(event.idEmpleado).trigger("change");
										$('#txtObservaciones').val(event.observaciones);
										
// 										$('#trDuplicar').removeClass('hidden');
// 										$('#trDuplicar').addClass('hidden');
										
										$('#btnEliminar').removeClass('hiden');
										
										$('#createEventModal').modal('toggle');
										},
								select : function(start, end, jsEvent) { // click on empty time slot
// 										console.log($.fullCalendar.moment(start).format('YYYY-MM-DD HH:mm:ss') + ' || ' + $.fullCalendar.moment(end).format('YYYY-MM-DD HH:mm:ss')+ ' || '+ jsEvent);
										
										$('#hdIdHorarioEmpleado').val('0');
										startdate = $.fullCalendar.moment(start).format('YYYY-MM-DD');
										enddate = $.fullCalendar.moment(end).format('YYYY-MM-DD');
										starttime = $.fullCalendar.moment(start).format('HH:mm:ss');
										endtime = $.fullCalendar.moment(end).format('HH:mm:ss');
										
										$('#cboEmpleados').val('').trigger("change");
										$('#txtObservaciones').val('');

										$('#createEventModal #txtInicio').val(startdate);
										$('#createEventModal #txtHorarioInicio').val(starttime);
										$('#createEventModal #txtFin').val(enddate);
										$('#createEventModal #txtHorarioFin').val(endtime);
										$('#createEventModal #txtDuplicar').val(startdate);
										
										$('#trDuplicar').removeClass('hidden');
										$('#dvDuplicar').removeClass('hidden');
										$('#dvDuplicar').addClass('hidden');
										$('#chkDuplicar').prop('checked', false);
										showImage('resources/image/personal/default_avatar.jpg');
										
										$('#btnEliminar').removeClass('hiden');
										$('#btnEliminar').addClass('hiden');
										$('#createEventModal').modal('toggle');
										},
								eventDrop : function(event, delta) { // event drag and drop
// 										console.log($.fullCalendar.moment(event.start).format('YYYY-MM-DD HH:mm:ss') + ' || ' + $.fullCalendar.moment(event.end).format('YYYY-MM-DD HH:mm:ss') + ' || ' + event.id);
										
										showImage('resources/image/personal/default_avatar.jpg');
										$('#hdIdHorarioEmpleado').val(event.id);
										startdate = $.fullCalendar.moment(event.start).format('YYYY-MM-DD');
										enddate = $.fullCalendar.moment(event.end).format('YYYY-MM-DD');
										starttime = $.fullCalendar.moment(event.start).format('HH:mm:ss');
										endtime = $.fullCalendar.moment(event.end).format('HH:mm:ss');
										$('#txtObservaciones').val(event.observaciones);
										$('#createEventModal #txtInicio').val(startdate);
										$('#createEventModal #txtHorarioInicio').val(starttime);
										$('#createEventModal #txtFin').val(enddate);
										$('#createEventModal #txtHorarioFin').val(endtime);
										$('#cboEmpleados').val(event.idEmpleado).trigger("change");
										$('#dvDuplicar').removeClass('hidden');
										$('#dvDuplicar').addClass('hidden');
										$('#chkDuplicar').removeClass('hidden');
										$('#chkDuplicar').prop('checked', false);
										accionesHorario('update');
// 										alert('eventDrop');
										},
								eventResize : function(event) { // resize to increase or decrease time of event
								
										showImage('resources/image/personal/default_avatar.jpg');
										$('#hdIdHorarioEmpleado').val(event.id);
										startdate = $.fullCalendar.moment(event.start).format('YYYY-MM-DD');
										enddate = $.fullCalendar.moment(event.end).format('YYYY-MM-DD');
										starttime = $.fullCalendar.moment(event.start).format('HH:mm:ss');
										endtime = $.fullCalendar.moment(event.end).format('HH:mm:ss');
										$('#txtObservaciones').val(event.observaciones);
										$('#createEventModal #txtInicio').val(startdate);
										$('#createEventModal #txtHorarioInicio').val(starttime);
										$('#createEventModal #txtFin').val(enddate);
										$('#createEventModal #txtHorarioFin').val(endtime);
										$('#cboEmpleados').val(event.idEmpleado).trigger("change");
										$('#dvDuplicar').removeClass('hidden');
										$('#chkDuplicar').removeClass('hidden');
										$('#chkDuplicar').prop('checked', false);
										accionesHorario('update');
// 										alert('eventResize');
											}
										});
		
		document.getElementById('dvLoadP1').innerHTML = '';
		$('#dvLoadP1').removeClass('overlay');
		});
		
	}
	
	function validar(){
		var strValidar = '';
		
		var strEmpleado = $('#cboEmpleados option:selected').val();
		var strFechaInicio = $('#txtInicio').val();
		var strHorarioInicio = $('#txtHorarioInicio').val();
		var strFechaFin = $('#txtFin').val();
		var strHorarioFin = $('#txtHorarioFin').val();
		var pstrDuplicar = ($('#chkDuplicar').is(':checked') ? '1' : '0');
		var pstrFechaDuplicar = $('#txtDuplicar').val();
		
// 		console.log(strEmpleado);
// 		console.log(strFechaInicio);
// 		console.log(strHorarioInicio);
// 		console.log(strFechaFin);
// 		console.log(strHorarioFin);
// 		console.log(pstrDuplicar);
// 		console.log(pstrFechaDuplicar);
		
		if(strEmpleado == '')
			strValidar = '* Seleccione empleado';
		if(strFechaInicio == '')
			strValidar +=(strValidar == '' ? '* Seleccione una fecha inicio' : '\n * Seleccione una fecha inicio'); 
		if(strHorarioInicio == '')
			strValidar +=(strValidar == '' ? '* Seleccione una Hora inicio' : '\n * Seleccione una Hora inicio');
		if(strFechaFin == '')
			strValidar +=(strValidar == '' ? '* Seleccione una fecha fin' : '\n * Seleccione una fecha fin');
		if(strHorarioFin == '')
			strValidar +=(strValidar == '' ? '* Seleccione una Hora fin' : '\n * Seleccione una Hora fin');
		if(pstrDuplicar == '1')																																																																										
			if(pstrFechaDuplicar == '')
				strValidar +=(strValidar == '' ? '* Seleccione hasta que fecha será duplicado el horario.' : '\n * Seleccione hasta que fecha será duplicado el horario.');
		
		return strValidar;
	}

	function accionesHorario(pOperacion){
		
		var strValidacion = validar();
		if(strValidacion != ''){
			alert(strValidacion);
			return;
		}
		
		$(document).ready(function() {
			
			$('#dvLoadP1').removeClass('overlay');
			$('#dvLoadP1').addClass('overlay');
			document.getElementById('dvLoadP1').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
			
			var src = "ServletHorarioEmpleado";
			var piIdHorarioEmpleado = $('#hdIdHorarioEmpleado').val() == '' ? '0' : $('#hdIdHorarioEmpleado').val();
			var pIdEmpleado = $('#cboEmpleados option:selected').val() == '' ? '0' : $('#cboEmpleados option:selected').val();
			var pstrFechaInicio = $('#txtInicio').val();
			var pstrHorarioInicio = $('#txtHorarioInicio').val();
			var pstrFechaFin = $('#txtFin').val();
			var pstrHorarioFin = $('#txtHorarioFin').val();
			var pstrObservaciones = $('#txtObservaciones').val();
			var pstrDuplicar = ($('#chkDuplicar').is(':checked') ? '1' : '0');
			var pstrFechaDuplicar = $('#txtDuplicar').val();
			
			$.post(src, {
				strOperation : pOperacion, 
				iIdHorarioEmpleado : piIdHorarioEmpleado, 
				iIdEmpleado : pIdEmpleado,
				iIdPersonal : vIdEmpleado,
				iTeam : vTeam,
				strFechaInicio : pstrFechaInicio,
				strHorarioInicio : pstrHorarioInicio,
				strFechaFin : pstrFechaFin,	
				strHorarioFin : pstrHorarioFin,
				strObservaciones : pstrObservaciones,
				strDuplicar : pstrDuplicar,
				strFechaDuplicar : pstrFechaDuplicar
				},
					function(pdata) {
						if(pdata == "ok"){
							
							$('#createEventModal').modal('hide');
							$('#calendarModal').modal('hide');
							
							$('#hdIdHorarioEmpleado').val('0');
							$('#cboEmpleados').val('').trigger("change");
							$('#txtInicio').val('');
							$('#txtHorarioInicio').val('');
							$('#txtFin').val('');
							$('#txtHorarioFin').val('');
							$('#txtObservaciones').val('');
							$('#chkDuplicar').prop('checked', false);
							refreshCalendario();
						}
						else{
							$('#lblMessage').text('Uno o mas registros no pudieron procesar, por favor valide los datos y vuelva a intentar.');
							document.getElementById('dvLoadP1').innerHTML = '';
							$('#dvLoadP1').removeClass('overlay');
						}
							
			});
		});
		}
		
	

	function listPersonal() {
		$(document).ready(function() {

			var src = "ServletHorarioEmpleado";
			$.post(src, {
				strOperation : "listPersonal",
				iIdPersonal : vIdEmpleado
			}, function(pdata) {
				// 				alert(pdata);
				var obj = JSON.parse(pdata);

				if (obj.personal.length > 0) {

						$('#cboEmpleados option').remove();
						$('#cboEmpleados').append($('<option>', {
							value : '',
							text : ''
						}));

						$.each(obj.personal, function(i, item) {
							$('#cboEmpleados').append($('<option>', {
								value : item.idOption,
								text : item.descripcion
							}));
						});
						
						$('#cboEmpleados').select2({placeholder: ' -- Seleccionar -- ',width: '100%'});
				}
			});
		});
	}

	</script>
	
	</body>
</html>