<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Ticket Activos</title>

    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/Charts/vis-4.19.1/js/vis.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/Charts/vis-4.19.1/css/vis.css">

<style type="text/css">

        div.timeline-frame {
            border-color: #103E9C;
        }

        div.timeline-axis {
            border-color: #103E9C;

            background-color: #EEEFF1;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#F9F9F9', endColorstr='#EEEFF1'); /* for IE */
            background: -webkit-gradient(linear, left top, left bottom, from(#F9F9F9), to(#EEEFF1)); /* for webkit browsers */
            background: -moz-linear-gradient(top,  #F9F9F9,  #EEEFF1); /* for firefox 3.6+ */
        }

        div.timeline-axis-text {
            font: bold 12px arial ;
            color: #103E9C;
        }

        div.timeline-event {
            border: none;
            background-color: white;
        }
        div.timeline-event-selected {
            background-color: #C0D8E1;
        }
        div.timeline-event-content {
            margin: 0;
        }

        div.timeline-groups-axis {
            border-color: #103E9C;
        }
        div.timeline-groups-text {
            font: bold 12px arial ;
            color: #103E9C;
        }

        div.order {
            border: 1px solid #FB3738;
            border-radius: 2px;
            -moz-border-radius: 2px;

            font: bold 12px arial ;
            color: #103E9C;

            padding: 2px;
            margin:1px;
            overflow: hidden;
        }
        
        .vis-item{
        background-color: #337ab7;
        }
   </style>
    


<script type="text/javascript">

	listarIncidentesP1Vigentes();
	
	function listarIncidentesP1Vigentes(){
		
		$('#dvLoad').removeClass('overlay');
		$('#dvLoad').addClass('overlay');
		document.getElementById('dvLoad').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
		
		var src = 'ServletAlertaEjecutiva';
		var vstrOperacion = 'ticketTimeLine';
			
		$.post(src, {
			strOperation : vstrOperacion
		}, function(pdata) {
			var container = document.getElementById('visualization');
			var obj = JSON.parse(pdata);

				if (obj.listTicketsTimeLine.length > 0) {
					var items = new vis.DataSet();
					var indexCount = 10;
				}
				
				if (obj.listTicketsTimeLine.length > 0) {
					
					var groups = [];
					for(i = 0 ; i < obj.listTicketsTimeLine.length ; i++){
						var date = new Date(obj.listTicketsTimeLine[i].fecha);
						var pstart = new Date(date);
						date.setMinutes(date.getMinutes() + parseInt(obj.listTicketsTimeLine[i].minutos));
						var pend = new Date(date);
					 	items.add({id: indexCount, className: 'progress progress-bar progress-bar-striped active', content: '<span class="' + 'bg-primary' + '"><i class="fa fa-thumb-tack" aria-hidden="true"></i> ' + obj.listTicketsTimeLine[i].minutos + '</span>', start: pstart, end : pend, group: i});
					 	indexCount ++;

						groups.push({id: i , content: '<a class="fa fa-ticket text-danger" href="#" onclick="listDetalleAlerta(\'' + obj.listTicketsTimeLine[i].ticketId + '\',1)" aria-hidden="true"></a><b> <a href="#" onclick="listDetalleAlerta(\'' + obj.listTicketsTimeLine[i].ticketId + '\',1)">' + obj.listTicketsTimeLine[i].ticketId + '</a></b><br/><i class="fa fa-suitcase text-primary" aria-hidden="true"></i> ' + obj.listTicketsTimeLine[i].cliente + '<br/><i class="fa fa-id-badge text-primary" aria-hidden="true"></i> ' + obj.listTicketsTimeLine[i].supervisor + '<br/><i class="fa fa-calendar-o text-primary" aria-hidden="true"></i> ' + obj.listTicketsTimeLine[i].fecha + '<br/><i class="fa fa-clock-o text-primary" aria-hidden="true"></i> ' + obj.listTicketsTimeLine[i].minutos + ' min'});
					  }
				}
				
				// Configuration for the Timeline
				  var options = {
				  groupOrder: function (a, b) {
				      return a.value - b.value;
				    },
				    groupOrderSwap: function (a, b, groups) {
				    	var v = a.value;
				    	a.value = b.value;
				    	b.value = v;
				    },
				    groupTemplate: function(group){
				      var container = document.createElement('div');
				      var label = document.createElement('span');
				      label.innerHTML = group.content + ' ';
				      container.insertAdjacentElement('afterBegin',label);
				      return container;
				    },
				    orientation: 'both',
				    editable: false,
				    groupEditable: false,
				  autoResize : true
				  };
				
				  // Create a Timeline
				  var timeline = new vis.Timeline(container, items, groups, options);
				  
				  document.getElementById('dvLoad').innerHTML = '';
				  $('#dvLoad').removeClass('overlay');
		});
	}
		
		
	function listDetalleAlerta(p_strTicket, pTipo) {
		$(document).ready( function() {
			
			$('#dvLoadP3').removeClass('overlay');
			$('#dvLoadP3').addClass('overlay');
			document.getElementById('dvLoadP3').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
			
			$('#dvLoadP1').removeClass('overlay');
			$('#dvLoadP1').addClass('overlay');
			document.getElementById('dvLoadP1').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
			
			$('#mdRegistroAlertaEjecutiva').modal('show');
			$('#lblMensajeRegAlerta').text('');
			$('#lblMensajeRegAlerta').removeClass();
			
			buscarTicket(p_strTicket);

							var src = "ServletAlertaEjecutiva";
							$.post(src,{
												strOperation : 'listDetalleAlerta2',
												pstrTicket : p_strTicket
											},
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
														title : "NRO"}, 
														{title : "IDDETALLE"}, 
														{title : "FECHA"}, 
														{title : "DETALLE"}, 
														{title : "SUPERVISOR"} 
														];
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

												setDataDetalle(dataReporte,columnsReport);
											});
						});
	}
	
	function setDataDetalle(pdataReporte, pcolumnsReport) {
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
						destroy : true
					});
			$('.dataTables_filter input').addClass('form-control-search-datatable');
			document.getElementById('dvLoadP3').innerHTML = '';
			$('#dvLoadP3').removeClass('overlay');
			// 		$('.dataTables_filter input').attr('size',10);
		} else {
			// 	        console.log('in else');
			// how to change the data contained inside datatable?
			tableReporte.fnClearTable();
			tableReporte.fnAddData(dataReporte);
			tableReporte.fnAdjustColumnSizing();
		}
	}
	
	
	function buscarTicket(pMaximoTicketId) {
		var src = "ServletAlertaEjecutiva";
		var vMaximoTicketId = (pMaximoTicketId == 0 ? document
				.getElementById('txtMaximoTicketId').value : pMaximoTicketId);
		vMaximoTicketId = vMaximoTicketId.trim();
		if (vMaximoTicketId == '')
			return;

		$.post(src,{strOperation : "buscarTicket",ptxtMaximoTicketId : vMaximoTicketId},
						function(pdata) {

							if (pdata != 'error') {

								var obj = JSON.parse(pdata);
								if (obj.ticketMaximo.length > 0) {

									$('#txtMaximoIdCliente').val(obj.ticketMaximo[0].idCliente);
									$('#txtMaximoCliente').val(obj.ticketMaximo[0].cliente);
									$('#txtMaximoTicketId').val(obj.ticketMaximo[0].idTicket);

									if (pMaximoTicketId == 0) {
										$('#txtMaximoResumen').val(obj.ticketMaximo[0].resumen);
										$('#txtHoraNotificacionIbm').val(obj.ticketMaximo[0].fechaCreacion.substring(0,16));
									}

									$('#txtMaximoDetalle').val(obj.ticketMaximo[0].detalle);
									$('#txtMaximoPrioridad').val(obj.ticketMaximo[0].prioridad);
									$('#txtMaximoFechaCreacion').val(obj.ticketMaximo[0].fechaCreacion);

									$('#txtMaximoIdEstado').val(obj.ticketMaximo[0].idEstado);
									$('#txtMaximoEstado').val(obj.ticketMaximo[0].estado);
									$('#txtMaximoPropietario').val(obj.ticketMaximo[0].usuarioPropietario);
									$('#txtMaximoIdGrupoPropietario').val(obj.ticketMaximo[0].idGrupoPropietario);
									$('#txtMaximoGrupoPropietario').val(obj.ticketMaximo[0].grupoPropietario);
									
									
									
									var vGrupo = $('#txtMaximoIdGrupoPropietario').val();
									
//							 		$('#txtMaximoIdGrupoPropietario').val(vGrupo);
									if (vGrupo.search('-PE-') > 0)
										$('#txtMaximoGrupoPropietarioPais').val('PERÚ');
									else if (vGrupo.search('-IN-') > 0)
										$('#txtMaximoGrupoPropietarioPais').val('INDIA');

								} else {
									if (pMaximoTicketId == 0) {
										$('#txtMaximoIdCliente').val('');
										$('#txtMaximoCliente').val('');
										$('#txtMaximoResumen').val('');
										$('#txtMaximoDetalle').val('');
										$('#txtMaximoPrioridad').val('');
										$('#txtMaximoFechaCreacion').val('');
										$('#txtMaximoIdEstado').val('');
										$('#txtMaximoEstado').val('');
										$('#txtMaximoPropietario').val('');
										$('#txtMaximoIdGrupoPropietario').val('');
										$('#txtMaximoGrupoPropietario').val('');
									}

									// 						$('#txtMaximoIdGrupoPropietario').attr("readonly", false);
									// 						$('#txtMaximoGrupoPropietario').attr("readonly", false);
								}
								
								$('#txtMaximoTicketId').attr("readonly",true);
								$('#txtMaximoIdCliente').attr("readonly",true);
								$('#txtMaximoCliente').attr("readonly",true);
								$('#txtMaximoResumen').attr("readonly",true);
								$('#txtMaximoDetalle').attr("readonly",true);
								$('#txtMaximoPrioridad').attr("readonly",true);
								$('#txtMaximoFechaCreacion').attr("readonly", true);
								$('#txtMaximoFechaCreacion').removeClass("dateTimePicker");
								$('#txtMaximoIdEstado').attr("readonly",true);
								$('#txtMaximoEstado').attr("readonly", true);
								$('#txtMaximoGrupoPropietarioPais').attr("readonly", true);
								$('#txtMaximoIdGrupoPropietario').attr("readonly", true);
								$('#txtMaximoGrupoPropietario').attr("readonly", true);
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
		
		document.getElementById('dvLoadP1').innerHTML = '';
		$('#dvLoadP1').removeClass('overlay');

	}
	
		
		
</script>


</head>
<body>






<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
	<section class="content-header">
	<h1>
		Dashboard <small>Linea de Tiempo de tickets</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-th-large"></i> Dashboard</a></li>
		<li class="active">Aletas Ejecutivas</li>
	</ol>
	</section> <!-- Main content -->
	<section class="content"> <!-- top row -->
	<input id="hdIdAlerta" type="hidden">
	<input id="hdTipo" type="hidden">
	
	
	
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> LINEA DE TIEMPO ALERTAS P1</h3>
			</div>
			<div class="box-body">
				<div id="tbcontainer" class="table-responsive">
					<div id="visualization"></div>
				</div>
			</div>
			<div id="dvLoad"></div>
			</div>
		</div>
	</div>
	
	
	<div class="row">
	<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
		<div id="mytimeline"></div>
		<br/>
	</div>
	</div>
	</section>
</aside>






<div class="modal fade" id="mdRegistroAlertaEjecutiva" role="dialog" aria-labelledby="myModalLabel">
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
																<input id="txtMaximoTicketId" type="text"
																	class="form-control" maxlength="15">
															</div>
														</div>
													</td>

													<td></td>
													<td>Cliente</td>
													<td>
														<div class="form-inline">
															<div class="form-group">
																<input id="txtMaximoIdCliente" type="text"
																	class="form-control" readonly="readonly">
															</div>
														</div>
													</td>
												</tr>
												<tr>
													<td>Resumen</td>
													<td colspan="4"><input id="txtMaximoResumen"
														type="text" class="form-control" size="60"></td>

												</tr>
												<tr>
													<td>Detalle</td>
													<td colspan="4"><textarea id="txtMaximoDetalle"
															rows="3" class="form-control" readonly="readonly"></textarea></td>

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
													<td colspan="2"><input type="text" id="txtMaximoGrupoPropietario"
														class="form-control"></input></td>
													<td><input id="txtMaximoGrupoPropietarioPais"
														type="text" class="form-control" size="20"></td>
													<td></td>
												</tr>
<!-- 												<tr> -->
<!-- 													<td>Team Resolutor</td> -->
<!-- 													<td><input id="txtMaximoIdGrupoResolutor" type="text" -->
<!-- 														class="form-control" size="20"></td> -->
<!-- 													<td colspan="2"><input type="text" id="txtMaximoGrupoResolutor" -->
<!-- 														class="form-control" size="40"></input></td> -->
<!-- 													<td><input id="txtMaximoGrupoResolutorPais" -->
<!-- 														type="text" class="form-control" size="20"></td> -->
<!-- 													<td></td> -->
<!-- 												</tr> -->
												<tr>
													<td>Propietario</td>
													<td><input id="txtMaximoPropietario" type="text"
														class="form-control" size="10" readonly="readonly"></td>
													<td>Estado</td>
													<td><input id="txtMaximoIdEstado" type="text"
														class="form-control" size="10" readonly="readonly"></td>
													<td><input type="text" id="txtMaximoEstado"
														class="form-control" disabled="disabled"></input></td>
												</tr>
											</tbody>
										</table>
									</div>
									<!-- /.box-body -->
									<div id="dvLoadP1"></div>
								</div>
						
						
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
						<div class="box box-info">
							<div class="box-header with-border">
								<i class="fa fa-teal"></i>
								<h3 class="box-title">Detalle de la restauración</h3>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
									<table class="table">
										<tr id="trAlertaDetalle">
											<td colspan="5">
<!-- 												<div class="form-group">Detalle</div> -->
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
											<td colspan="5"><a id="btnCancelarAlerta" href="#" class="btn btn-default" data-dismiss="modal">Volver</a></td>
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
</div>



</body>
</html>