<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

<script type="text/javascript">

var f=new Date();
var date = f.getFullYear() + '-' + ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f.getMonth() + 1)) + '-' + ((f.getDate() + 1) < 10 ? '0' + f.getDate() : f.getDate());

document.getElementById("txtInicio").value = date;
document.getElementById("txtFin").value = date;

</script>

<body>

<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	Reporte <small>Control de SLA Rimac</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-th-large"></i> Reporte</a></li>
	<li class="active">Control SLA Rimac</li>
</ol>
</section> <!-- Main content --> <section class="content"> <!-- top row -->
<div class="row">
	<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
		<div class="form-inline">
			<div class="form-group" style="display: inline-block;">	
			    <select id="cboSLA" class="form-control">
				<option value=""> -- SELECCIONE TIPO SLA -- </option>
				<option value="PASENOPRODUCTIVO">PASES NO PRODUCTIVOS</option>
				<option value="PASEPRODUCTIVO">PASES PRODUCTIVOS</option>
				</select>
			</div>
			<div class="form-group" style="display: inline-block;">	
			    <select id="cboTipo" class="form-control">
				<option value=""> -- SELECCIONE ORIGEN DE DATOS -- </option>
				<option value="BACKLOG">BACKLOG</option>
				<option value="RESUELTOS">RESUELTOS</option>
				</select>
			</div>
			<div class="form-group">
				<span>Fechas</span> 
				<input type="text" class="form-control datePicker" id="txtInicio">
				<input type="text" class="form-control datePicker" id="txtFin">
<!-- 				<select id="cboTipoReporte" class="form-control"> -->
<!-- 					<option value="0">-- Seleccionar --</option> -->
<!-- 					<option value="1">Promedios</option> -->
<!-- 					<option value="2">Ticket P3 y P4</option> -->
<!-- 				</select> -->
				<button id="btnConsultar" class="btn btn-primary btn-sm" data-loading-text="Buscando..." autocomplete="off" onclick="listTablas();">Consultar</button>
				<button id="btnVerTicket" class="btn btn-primary btn-sm" onclick="openModalTicket();">Ver ticket</button>
			</div>
		</div>
	</div>
</div>
<br/>

<div class="row" id="dvRow1">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> TICKETS SLA GENERAL</h3>
			</div>
			<div class="box-body">
				<label id="lblMessage" class="label label-info"></label>
					<div id="tbcontainer" class="table-responsive">
					</div>
			</div>
		</div>
	</div>
	
<!-- 	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 connectedSortable"> -->
<!-- 		<div class="box box-primary"> -->
<!-- 			<div class="box-header with-border"> -->
<!-- 				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> TICKETS SLA POR DIAS</h3> -->
<!-- 			</div> -->
<!-- 			<div class="box-body"> -->
<!-- 				<label id="lblMessage" class="label label-info"></label> -->
<!-- 					<div id="tbcontainerDiario" class="table-responsive"> -->
<!-- 					</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
</div>


<!-- <div class="row hidden" id="dvRow2"> -->
<!-- 	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 connectedSortable"> -->
<!-- 		<div class="box box-primary"> -->
<!-- 			<div class="box-header with-border"> -->
<!-- 				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> PRIORIDAD 3</h3> -->
<!-- 			</div> -->
<!-- 			<div class="box-body"> -->
<!-- 				<label id="lblMessage" class="label label-info"></label> -->
<!-- 					<div id="tbcontainerp3" class="table-responsive"> -->
<!-- 					</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 connectedSortable"> -->
<!-- 		<div class="box box-primary"> -->
<!-- 			<div class="box-header with-border"> -->
<!-- 				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> PRIORIDAD 4</h3> -->
<!-- 			</div> -->
<!-- 			<div class="box-body"> -->
<!-- 				<label id="lblMessage" class="label label-info"></label> -->
<!-- 					<div id="tbcontainerp4" class="table-responsive"> -->
<!-- 					</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->



<div class="modal fade" id="mdReportTicket" tabindex="-1" role="dialog">
<div class="modal-dialog modal-lg" role="document">
  <div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">
						<i class="fa fa-table" aria-hidden="true"></i> LISTA DE TICKET
					</h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<label id="lblMensaje"></label>
						</div>
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<div id="tbcontainerticket" class="table-responsive">Aquí se
								listará todos los tickets.</div>
						</div>
						<br/>
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<a role="button" class="btn btn-default btn-sm" data-dismiss="modal">
								<i class="fa fa-reply" aria-hidden="true"></i> Volver
							</a>
						</div>
					</div>
				</div>
				<div id="dvLoadTicket"></div>
			</div>
  </div>

</div>


<!-- /.row --> <!-- Main row -->
<div class="row"></div>
<!-- /.row (main row) --> </section><!-- /.content --> </aside>

</body>


<script type="text/javascript">
	
	var vTeam = document.getElementById('hdIdTeam').value;
	var vInterval;
	
// 	listReport();
	
// 	$('#btnConsultar').button('loaging');
	
	
	
	
	function listTablas(){
// 		var vcboTipo = $('#cboTipoReporte').val();
		
// 		if(vcboTipo == 1){
// 			$('#dvRow1').removeClass('hidden');
// 			$('#dvRow2').removeClass('hidden');
// 			$('#dvRow2').addClass('hidden');
			
// 			listReportDiario();
// 			listReportTotal();
// 		} else if(vcboTipo == 2){
// 			$('#dvRow1').removeClass('hidden');
// 			$('#dvRow2').removeClass('hidden');
// 			$('#dvRow1').addClass('hidden');
			
// 			listSLA_EspecialistasPrioridad(3);
// 			listSLA_EspecialistasPrioridad(4);
// 		}
		listSLA();
	};
	
	
	function listSLA(){
		
		$('#btnConsultar').button('loading');
		
		var pstrSla = $	('#cboSLA option:selected').val();
		var pstrTipo = $('#cboTipo option:selected').val();
		var pstrInicio = $('#txtInicio').val();
		var pstrFin = $('#txtFin').val();
		
		$(document).ready(function() {
			
			var src = "ServletWReporteMarcador";
			$.post(src, {strOperation : 'listSLA',
				strFechaInicio : pstrInicio,
				strFechaFin : pstrFin,
				strSla : pstrSla,
				strTipo : pstrTipo},
					function(pdata) {
					
				  var obj = JSON.parse(pdata);
				  var dataReporte = [];
				  var columnsReport = [];
					  for(i = 0 ; i < obj.reporte.length ; i++ )
					  	{
						var arr = [];
						arr.push(obj.reporte[i].idTicket);
						arr.push(obj.reporte[i].estado);
						arr.push(obj.reporte[i].creador);
						arr.push(obj.reporte[i].grupoCreador);
						arr.push(obj.reporte[i].propietario);
						arr.push(obj.reporte[i].titulo);
						arr.push(obj.reporte[i].lastWorklog);
						arr.push(obj.reporte[i].fechaCreacion);
						arr.push(obj.reporte[i].fechaFin);
						arr.push(obj.reporte[i].horarioCreacion);
						arr.push(obj.reporte[i].fechaLimite);
						arr.push(obj.reporte[i].estadoSLA);
						arr.push(obj.reporte[i].tiempoRestante + ' min');
						arr.push(obj.reporte[i].tiempoTranscurrido);
						dataReporte.push(arr);
						}
					  
					  columnsReport = [
						  {title : "TICKET"},
						  {title : "ESTADO"},
						  {title : "CREADOR"},
						  {title : "GRUPO PROPIETARIO"},
						  {title : "PROPIETARIO"},
						  {title : "SUMMARY"},
						  {title : "WORKLOG"},
						  {title : "FECHA CREACION"},
						  {title : "FECHA FIN"},
						  {title : "HORARIO"},
						  {title : "FECHA LÍMITE"},
// 						  {title : "ESTADO SLA"},
						  
						  {
							"sName": "estadoSLA",
							"title" : "ESTADO SLA",
							"bSearchable": true,
							"bSortable": true,
							"mRender": function ( data, type, columns ) {									
								return '<label class="label label-' + (columns[11] == 'VENCIDO' ? 'danger' : columns[11] == 'EN ESPERA' ? 'warning' : 'success') + '">' + columns[11] + '</label>';
							}
						  },
						  
						  {title : "TIEMPO RESTANTE"},
						  {title : "TIEMPO TRANSCURRIDO"}
// 						  {
// 								"sName": "propietario",
// 								"title" : "PROPIETARIO",
// 								"bSearchable": true,
// 								"sWidth": "300px",
// 								"bSortable": true,
// 								"mRender": function ( data, type, columns ) {
// 									return '<p data-toggle="tooltip" data-placement="right" data-html="true" title="<em>' + columns[0] + '</em>">' + columns[1] + '</p>';
// 								}
// 							},
			          ];
					  $('#btnConsultar').button('reset');
					  setData(dataReporte,columnsReport);
					
			});
		});
	}
	
	
	function listReportTotal(){
		
		$('#btnConsultar').button('loading');
		    
		clearInterval(vInterval);
		
		var pstrInicio = $('#txtInicio').val();
		var pstrFin = $('#txtFin').val();
		var pstrProyecto = $('#cboProyecto option:selected').text();
	
		$(document).ready(function() {
			
			var src = "ServletWReporteMarcador";
			$.post(src, {strOperation : 'listSLA_RimacPromTotal', strFechaInicio : pstrInicio, strFechaFin : pstrFin, strProyecto : pstrProyecto},
					function(pdata) {
					
				 var obj = JSON.parse(pdata);
				  var dataReporte = [];
				  var columnsReport = [];
					  for(i = 0 ; i < obj.reporte.length ; i++ )
					  	{
						var arr = [];
						arr.push(obj.reporte[i].prioridad);
						arr.push(obj.reporte[i].sla);
						arr.push(obj.reporte[i].estado);
						arr.push(obj.reporte[i].total);
						arr.push(obj.reporte[i].promedio);
						dataReporte.push(arr);
						}
					  
					  columnsReport = [ 
					  	{title : "PRIORIDAD"},
					  	{title : "SLA"},
					  	{title : "ESTADO"},
					  	{title : "TOTAL"},
					  	{
							"sName": "promedio",
							"title" : "PROMEDIO", 
							"bSearchable": true,
// 							"sWidth": "300px",
							"bSortable": true,
							"mRender": function ( data, type, columns ) {									
								return '<label class="label label-' + (columns[2] == 'VENCIDO' ? 'danger' : 'success') + '">' + columns[4] + '</label>';
							}
						}
			          ];
					$('#btnConsultar').button('reset');
					setData(dataReporte,columnsReport);
			});
		});
	}
	
	
	
	
	
	
	
	
	function listReportDiario(){
		
		$('#btnConsultar').button('loading');
		    
		clearInterval(vInterval);
		
		var pstrInicio = $('#txtInicio').val();
		var pstrFin = $('#txtFin').val();
		var pstrProyecto = $('#cboProyecto option:selected').text();
		
		$(document).ready(function() {
			
			var src = "ServletWReporteMarcador";
			$.post(src, {strOperation : 'listSLA_RimacPromedio', strFechaInicio : pstrInicio, strFechaFin : pstrFin, strProyecto : pstrProyecto},
					function(pdata) {
// 						alert(pdata);
					  var obj = JSON.parse(pdata);
					  var dataReporte = [];
					  var columnsReport = [];
					  var iCount = 0;
					  
					  	console.log('total de registros promedio ' + obj.dataFechas.length);
						  for(i = 0 ; i < obj.dataFechas.length ; i++ ){
							  var arr = [];
							  arr.push(i + 1);
								for(j = 0 ; j < obj.dataFechas[i].prio.length ; j++ ){
									arr.push(obj.dataFechas[i].prio[j]);
								}
							dataReporte.push(arr);
						  }
						  
						  var arr1 = [];
						  arr1.push({ title : "Prioridad"});
						  for(i = 0 ; i < obj.fechas.length ; i++ ){
						  	arr1.push({ title : obj.fechas[i].fecha});
							}
						  
						  columnsReport = arr1;
						  
						setDataDiario(dataReporte,columnsReport);
					    $('#btnConsultar').button('reset');
			});
		});
	}
	
	
	
function listReportPromedioTotal(){
	
		$('#dvLoadTicket').removeClass('overlay');
		$('#dvLoadTicket').addClass('overlay');
		document.getElementById('dvLoadTicket').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
	
		var pstrInicio = $('#txtInicio').val();
		var pstrFin = $('#txtFin').val();
		var pstrProyecto = $('#cboProyecto option:selected').text();
		
		$(document).ready(function() {
			
			var src = "ServletWReporteMarcador";
			$.post(src, {strOperation : 'listReportSLA_RimacPromTotal', strFechaInicio : pstrInicio, strFechaFin : pstrFin, strProyecto : pstrProyecto},
					function(pdata) {
					  var obj = JSON.parse(pdata);
					  var dataReporte = [];
					  var columnsReport = [];
					  var iCount = 0;
					  
						  for(i = 0 ; i < obj.reporte.length ; i++ ){
							var arr = [];
							arr.push(obj.reporte[i].idticket);
							arr.push(obj.reporte[i].class);
							arr.push(obj.reporte[i].status);
							arr.push(obj.reporte[i].prioridad);
							arr.push(obj.reporte[i].fechacreacion);
							arr.push(obj.reporte[i].fechafin);
							arr.push(obj.reporte[i].summary);
							arr.push(obj.reporte[i].creador);
							arr.push(obj.reporte[i].correocreador);
							arr.push(obj.reporte[i].propietario);
							arr.push(obj.reporte[i].correopropietario);
							arr.push(obj.reporte[i].worklog);
							arr.push(obj.reporte[i].grupopropietario);
							arr.push(obj.reporte[i].timeresolve);
							arr.push(obj.reporte[i].tiempo);
							arr.push(obj.reporte[i].sla);
							arr.push(obj.reporte[i].statussla);
							dataReporte.push(arr);
						  }
						  
						  columnsReport = [ 
							  	{title : "TICKETID"},
							  	{title : "CLASE"},
							  	{title : "ESTADO"},
							  	{title : "PRIORIDAD"},
							  	{title : "FECHA CREACION"},
							  	{title : "FECHA FIN O ASIGNACIÓN"},
							  	{title : "SUMMARY"},
							  	{title : "CREADOR"},
							  	{title : "CORREO CREADOR"},
							  	{title : "PROPIETARIO"},
							  	{title : "CORREO PROPIETARIO"},
							  	{title : "WORKLOG"},
							  	{title : "GRUPO PROPIETARIO"},
							  	{title : "TIEMPO INVERTIDO"},
							  	{title : "TIEMPO"},
							  	{title : "SLA"},
							  	{title : "ESTADO SLA"}
					          ];
						  
						  setDataTicket(dataReporte,columnsReport);
			});
		});
	}
	
	
	var htmlTable = '<table id=\"tblReportes\" class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
	var htmlTableTicket = '<table id=\"tblReportesTicket\" class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
	var htmlTableDiario = '<table id=\"tblReportesDiario\" class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
	var htmlTablep3 = '<table id=\"tblReportesp3\" class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
	var htmlTablep4 = '<table id=\"tblReportesp4\" class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
	
	function openModalTicket(){
		listReportPromedioTotal();
		$('#mdReportTicket').modal('show');
	}
	
	function openModalNuevo(){
		
		$('#btnActualizar').removeClass('hidden');
		$('#btnActualizar').addClass('hidden');
		$('#btnGuardar').removeClass('hidden');
		
		$('#hdIdBancoClaves').text('0');
		$('#txtCliente').val('');
		$('#txtServidor').val('');
		$('#txtIp').val('');
		$('#txtInstancia').val('');
		$('#txtMandante').val('');
		$('#txtSisSubSis').val('');
		$('#txtUsuario').val('');
		$('#txtContrasena').val('');
		$('#txtObservaciones').val('');
		$('#mdNuevo').modal('show');
	}
	
	function openModalUpdate(idBancoClaves,cliente,servidor,ip,instancia,mandante,sissubsis,usuario,contrasena,observaciones)
	{
		$(document).ready(function(){
// 			alert(idOptions + ' || ' + Descripcion);
			$('#btnActualizar').removeClass('hidden');
			$('#btnGuardar').removeClass('hidden');
			$('#btnGuardar').addClass('hidden');

			$('#mdNuevo').modal('show');
			$('#hdIdBancoClaves').text(idBancoClaves);
			$('#txtCliente').val(cliente);
			$('#txtServidor').val(servidor);
			$('#txtIp').val(ip);
			$('#txtInstancia').val(instancia);
			$('#txtMandante').val(mandante);
			$('#txtSisSubSis').val(sissubsis);
			$('#txtUsuario').val(usuario); 
			$('#txtContrasena').val(contrasena);
			$('#txtObservaciones').val(observaciones);
		});
	}
	
	function openModalDelete(idOptions)
	{
		$(document).ready(function(){
			$('#mdPregunta').modal('show');
			$('#hdIdBancoClaves').text(idOptions);
		});
	}
	
	function setData(pdataReporte,pcolumnsReport)
	{
		document.getElementById('tbcontainer').innerHTML = htmlTable;

		if(typeof tableReporte === 'undefined') 
	    {
	    
		var tableReporte = $('#tblReportes').DataTable(
				{
					processing : false,
					serverSide : false,
					data : pdataReporte,
					columns : pcolumnsReport,
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
					columnDefs: [
						{"className": "text-center", "targets": "_all"},
				            {
				                "targets": [ 10 ],
				                "visible": false,
				                "searchable": false
				            }
				    ],
				    pageLength: 25,
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
		$('.dataTables_filter input').addClass('form-control-search-datatable');
	    }
	    else {
	        console.log('in else');
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
	}
	
	
	
	
	function setDataDiario(pdataReporte,pcolumnsReport)
	{
		document.getElementById('tbcontainerDiario').innerHTML = htmlTableDiario;
	
		var buttonCommon = {
				exportOptions : {
					format : {
						body : function(data, row, column, node) {
							return column === 5 ? data.replace(
									/[$,]/g, '') : data;
						}
					}
				}
			};
		
		if(typeof tableReporte === 'undefined') 
	    {
	    
		var tableReporte = $('#tblReportesDiario').DataTable(
				{
					processing : false,
					serverSide : false,
					data : pdataReporte,
					columns : pcolumnsReport,
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
					columnDefs: [
						{"className": "text-center", "targets": "_all"}
// 				            {
// 				                "targets": [ 0 ],
// 				                "visible": true,
// 				                "searchable": true
// 				            }
				    ],
				    pageLength: 25,
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
		$('.dataTables_filter input').addClass('form-control-search-datatable');
	    }
	    else {
	        console.log('in else');
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
	}
	
	
	
	
	function setDataTicket(pdataReporte,pcolumnsReport)
	{
		document.getElementById('tbcontainerticket').innerHTML = htmlTableTicket;
		
		if(typeof tableReporte === 'undefined') 
	    {
	    
		var tableReporte = $('#tblReportesTicket').DataTable(
				{
					processing : false,
					serverSide : false,
					data : pdataReporte,
					columns : pcolumnsReport,
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
					columnDefs: [
						{"className": "text-center", "targets": "_all"},
				            {
				                "targets": [ 2 ],
				                "visible": true,
				                "searchable": true
				            }
				    ],
				    pageLength: 25,
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
		$('.dataTables_filter input').addClass('form-control-search-datatable');
	    }
	    else {
	        console.log('in else');
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
		
		document.getElementById('dvLoadTicket').innerHTML = '';
		$('#dvLoadTicket').removeClass('overlay');
	}
	
	
	function setData(pdataReporte,pcolumnsReport)
	{
		document.getElementById('tbcontainer').innerHTML = 	htmlTable;
	
		var buttonCommon = {
				exportOptions : {
					format : {
						body : function(data, row, column, node) {
							return column === 5 ? data.replace(
									/[$,]/g, '') : data;
						}
					}
				}
			};
		
		if(typeof tableReporte === 'undefined') 
	    {
	    
		var tableReporte = $('#tblReportes').DataTable(
				{
					processing : false,
					serverSide : false,
					data : pdataReporte,
					columns : pcolumnsReport,
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
					columnDefs: [
						{"className": "text-center", "targets": "_all"},
				            {
				                "targets": [ 2 ],
				                "visible": false,
				                "searchable": true
				            }
				    ],
				    pageLength: 25,
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
		$('.dataTables_filter input').addClass('form-control-search-datatable');
	    }
	    else {
	        console.log('in else');
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
	}
	
	
	
	
	
	
	function setDataPriority(pdataReporte,pcolumnsReport,pPriority)
	{
		if(pPriority == 3)
			document.getElementById('tbcontainerp3').innerHTML = 	htmlTablep3;
		else if(pPriority == 4)
			document.getElementById('tbcontainerp4').innerHTML = 	htmlTablep4;

		if(typeof tableReporte === 'undefined')
	    {
	    
		var tbl = (pPriority == 3 ? "#tblReportesp3" : "#tblReportesp4");
		
		var tableReporte = $(tbl).DataTable(
				{
					processing : false,
					serverSide : false,
					data : pdataReporte,
					columns : pcolumnsReport,
					dom: "<'row'<'col-sm-6'B><'col-sm-6 text-right'f>>" +
					"<'row'<'col-sm-12'tr>>" +
					"<'row'<'col-sm-5'i><'col-sm-7 text-right'p>>",
					bSort: false,
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
					columnDefs: [
				            {
				                "targets": [ 0 ],
				                "visible": false,
				                "searchable": false
				            }
				    ],
				    pageLength: 10,
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
		$('.dataTables_filter input').addClass('form-control-search-datatable');
	    }
	    else {
	        console.log('in else');
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
	}
	
</script>

</html>