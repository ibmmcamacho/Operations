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
			    <select id="cboProyecto" class="form-control">
				<option value=""> --SELECCIONE CLIENTE-- </option>
				<option value="1">RIMAC</option>
				<option value="2">CENTRIA</option>
				<option value="2">SURA</option>
				</select>
			</div>
			<div class="form-group" style="display: inline-block;">
				<span>Fechas</span> 
				<input type="text" class="form-control datePicker" id="txtInicio">
				<input type="text" class="form-control datePicker" id="txtFin">
			</div>
			<div class="form-group" style="display: inline-block;">	
				<button id="btnConsultar" class="btn btn-primary btn-sm" data-loading-text="Buscando..." autocomplete="off" onclick="listReport()">Consultar</button>
			</div>
		</div>
	</div>
</div>
<br/>
<div class="row">
	<div class="col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> TICKETS SLA</h3>
			</div>
			<div class="box-body">
				<label id="lblMessage" class="label label-info"></label>
					<div id="tbcontainer" class="table-responsive">
					</div>
			</div>
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
	
	
	
	function listReport(){
		
		$('#btnConsultar').button('loading');
		    
		clearInterval(vInterval);
		
		var vcboTipo = $('#cboTipoReporte').val();
		var pstrInicio = $('#txtInicio').val();
		var pstrFin = $('#txtFin').val();
		var pstrProyecto = $('#cboProyecto option:selected').text();
		
		
		$(document).ready(function() {
			
			var src = "ServletWReporteMarcador";
			$.post(src, {strOperation : 'listSLA_Rimac', strFechaInicio : pstrInicio, strFechaFin : pstrFin, strProyecto : pstrProyecto},
					function(pdata) {
// 						alert(pdata);
					  var obj = JSON.parse(pdata);
					  var dataReporte = [];
					  var columnsReport = [];
					  
						  for(i = 0 ; i < obj.reporte.length ; i++ )
						  	{
							var arr = [];
// 							arr.push(i+1);
							arr.push(obj.reporte[i].ticket);
 							arr.push(obj.reporte[i].pais);
							arr.push(obj.reporte[i].prioridad);
							arr.push(obj.reporte[i].fechaCreacion);
							arr.push(obj.reporte[i].grupoPropietario);
							arr.push(obj.reporte[i].propietario);
							arr.push(obj.reporte[i].tiempo);
							arr.push(obj.reporte[i].sla);
							arr.push(obj.reporte[i].slaestado);
							arr.push(obj.reporte[i].estado);
							
							arr.push(obj.reporte[i].emailPropietario);
							arr.push(obj.reporte[i].titulo);
							arr.push(obj.reporte[i].worklog);
							arr.push(obj.reporte[i].idGrupoPropietario);
							
							dataReporte.push(arr);
							}
						  
						  columnsReport = [ 
							{
								"sName": "ticket",
								"title" : "TICKET", 
								"bSearchable": false,
								"sWidth": "70px",
								"bSortable": false,
								"mRender": function ( data, type, columns ) {									
									return '<p data-toggle="tooltip" data-placement="right" data-html="true" title="<em>' + columns[11] + '</em> || <strong> ' + columns[12] + '</strong>">' + columns[0] + '</p>';
								}
							},
						    {title : "PAIS"}, 
				            {title : "PRIORIDAD"},
				            {title : "FECHA CREACION"},
				            {
								"sName": "grupoPropietario",
								"title" : "GRUPO PROPIETARIO", 
								"bSearchable": true,
								"sWidth": "300px",
								"bSortable": true,
								"mRender": function ( data, type, columns ) {									
									return '<p data-toggle="tooltip" data-placement="right" data-html="true" title="<em>' + columns[13] + '</em>">' + columns[4] + '</p>';
								}
							},
				            {
								"sName": "propietario",
								"title" : "PROPIETARIO", 
								"bSearchable": true,
								"sWidth": "300px",
								"bSortable": true,
								"mRender": function ( data, type, columns ) {									
									return '<p data-toggle="tooltip" data-placement="right" data-html="true" title="<em>' + columns[10] + '</em>">' + columns[5] + '</p>';
								}
							},
				            {title : "TIEMPO"},
				            {title : "SLA"},
				            {
								"sName": "estadoSLA",
								"title" : "ESTADO SLA", 
								"bSearchable": true,
								"sWidth": "100px",
								"bSortable": true,
								"mRender": function ( data, type, columns ) {									
									return '<label class="label ' + (columns[8] == 'VENCIDO' ? 'label-danger' : columns[8] == 'POR VENCER' ? 'label-warning' : 'label-success') + '">' + columns[8] + '</label>';
								}
							},
				            {title : "ESTADO"}
				          ];
					  
					    setData(dataReporte,columnsReport);
					    
					    vInterval = setInterval(function(){
							listReport();
						}, 900000);
					    
					    $('#btnConsultar').button('reset')
			});
		});
	}
	
	function acciones(pOperacion)
	{
	$(document).ready(function() {

		var src = "ServletBancoClaves";
		var piIdBancoClaves = $('#hdIdBancoClaves').text() == '' ? 0 : $('#hdIdBancoClaves').text();
		var pstrCliente = $('#txtCliente').val() == '' ? '' : $('#txtCliente').val();
		var pstrServidor = $('#txtServidor').val() == '' ? '' : $('#txtServidor').val();
		var pstrIp = $('#txtIp').val() == '' ? '' : $('#txtIp').val();
		var pstrInstancia = $('#txtInstancia').val() == '' ? '' : $('#txtInstancia').val();
		var pstrMandante = $('#txtMandante').val() == '' ? '' : $('#txtMandante').val();
		var pstrSisSubSis = $('#txtSisSubSis').val() == '' ? '' : $('#txtSisSubSis').val();
		var pstrUsuario = $('#txtUsuario').val() == '' ? '' : $('#txtUsuario').val();
		var pstrContrasena = $('#txtContrasena').val() == '' ? '' : $('#txtContrasena').val();
		var pstrObservaciones = $('#txtObservaciones').val() == '' ? '' : $('#txtObservaciones').val();
// 		var piTeam = document.getElementById('hdIdTeam').value;

// 		alert('Enviando : ' + piIdOptions + ' || ' + pstrDescripcion);
		$.post(src, {strOperation : pOperacion, 
			iIdBancoClaves : piIdBancoClaves, 
			strCliente : pstrCliente,
			strServidor : pstrServidor,
			strIp : pstrIp,
			strInstancia : pstrInstancia,
			strMandante : pstrMandante,
			strSisSubSis : pstrSisSubSis,
			strUsuario : pstrUsuario,
			strContrasena : pstrContrasena,
			strObservaciones : pstrObservaciones,
			iTeam : vTeam},
				function(pdata) {
// 					alert(pdata);
					if(pdata == "ok"){
						listReport();
						$('#mdNuevo').modal('hide');
						$('#mdActualizar').modal('hide');
						$('#mdPregunta').modal('hide');
						
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
						
// 						alert('Estado actual de los controles: HD1: ' + $('#hdIdOptions1').text() + ' || HD2: ' + $('#hdIdOptions2').text() + ' || TXT1: ' + $('#txtNombreOptions1').val() + ' || TXT2: ' + $('#txtNombreOptions2').val());
					}
					else
						$('#lblMessage').text('Hubo un problema al procesar, no se actualizó, por favor vuelva a intentarlo.');
		});
	});
	}
	
	var htmlTable = '<table id=\"tblReportes\" class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
	
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
				            {
				                "targets": [ 0 ],
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
	}
	
	  $(function () {
		  //Initialize Select2 Elements
		   $(".select2").select2();
		  });
	  
</script>

</html>