<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

<script type="text/javascript">

var f=new Date();
var date = f.getFullYear() + '-' + ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f.getMonth() + 1)) + '-' + ((f.getDate()) < 10 ? '0' + f.getDate() : f.getDate());

document.getElementById("txtInicio").value = date;
document.getElementById("txtFin").value = date;

</script>

	<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>REPORTE HISTÓRICO CONSUMO TELEFÓNICA</title>
    </head>
    
    <body>
    
<!-- Modal  Cargando pagina-->
		<div class="modal js-loading-bar">
		 <div class="modal-dialog">
		   <div class="modal-content">
		   
		     <div class="modal-body">
		     <h3>Cargando ...</h3>
		       <div class="progress progress-striped active">
		  <div class="progress-bar" role="progressbar"
		       aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
		       style="width: 100%">
		  </div>
		</div>
		     </div>
		   </div>
		 </div>
		</div>
		<!-- Fin Modal  Cargando pagina-->
	

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	Reporte <small>Consumos</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-dashboard"></i> Reporte Consumos</a></li>
	<li class="active">Telfónica</li>
</ol>
</section> <!-- Main content --> <section class="content"> <!-- top row -->
<div class="row">
	<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
		<div class="form-inline">
			<div class="form-group">
				<span>Tipo: </span> 
				<select class="form-control select2"  style="width: 180px;" id="cboTipo">
				  <option value="0" SELECTED>-- SELECCIONE --</option>
				  <option value="1"> DISCO </option>
				  <option value="2"> BACKUP </option>
				  <option value="3"> SISTEMA </option>
				</select>
				<span> Fechas</span> 
				<input type="text" class="form-control datePicker" id="txtInicio">
				<input type="text" class="form-control datePicker" id="txtFin">
				
				<a id="btnConsultar" class="btn btn-primary btn-sm">Consultar</a>
			</div>
		</div>
	</div>
</div>
<br />
<div class="row">
	<div class="col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> REPORTE HISTÓRICO</h3>
			</div>
			<div class="box-body">
				
				<div id="divtbDisco" style='display:none;'>
				<h4 class="box-title"> <i class="fa fa-database" aria-hidden="true"></i> DISCO</h4>
				<div id="tbcontainerConsumoDisco" class="table-responsive" >
					Aquí podrás obtener toda la información de los tickets registrado como Alertas Ejecutivas.
				</div>
				</div>
				
				<div id="divtbBackup" style='display:none;'>
				<h4 class="box-title"> <i class="fa fa-database" aria-hidden="true"></i> BACKUP</h4>
				<div id="tbcontainerConsumoBackup" class="table-responsive" >
					Aquí podrás obtener toda la información de los tickets registrado como Alertas Ejecutivas.
				</div>
				</div>
				
				<div id="divtbSistema" style='display:none;'>
				<h4 class="box-title"> <i class="fa fa-desktop" aria-hidden="true"></i> SISTEMA</h4>
				<div id="tbcontainerConsumoSistema" class="table-responsive" >				
					Aquí podrás obtener toda la información de los tickets registrado como Alertas Ejecutivas.
				</div>
				</div>
		</div>
	</div>
</div>
<!-- /.row --> <!-- Main row -->
<div class="row"></div>
<!-- /.row (main row) --> </section><!-- /.content --> </aside>
<!-- /.right-side -->




<script type="text/javascript">

var vTeam = document.getElementById('hdIdTeam').value;


$('#btnConsultar').click(function(){
	
	var vcboTipo = $('#cboTipo').val(); 
	var vtxtInicio = $('#txtInicio').val(); 
	var vtxtFin = $('#txtFin').val();
	
	if(vcboTipo == "0"){
		alert('Debe seleccionar un tipo de reporte');	
	}else if(vcboTipo == "1"){ // Tipo de reporte Disco
		loadProgress(); 
		listReportConsumoDisco(vtxtInicio,vtxtFin);
		document.getElementById('divtbDisco').style.display = 'block';
		document.getElementById('divtbBackup').style.display = 'none';
		document.getElementById('divtbSistema').style.display = 'none';
	}else if(vcboTipo == "2"){ // Tipo de reporte Backup
		loadProgress();
		listReportConsumoBackup(vtxtInicio,vtxtFin);
		document.getElementById('divtbBackup').style.display = 'block';
		document.getElementById('divtbDisco').style.display = 'none';
		document.getElementById('divtbSistema').style.display = 'none';
	}else if(vcboTipo == "3"){ // Tipo de reporte Sistema
		loadProgress();
		listReportConsumoSistema(vtxtInicio,vtxtFin);
		document.getElementById('divtbSistema').style.display = 'block';
		document.getElementById('divtbBackup').style.display = 'none';
		document.getElementById('divtbDisco').style.display = 'none';
		
	}

});
		
		
   function loadProgress(){
	// Haciendo visible Modal con Barra de progreso 
	   var $modal = $('.js-loading-bar');
	   $modal.modal('show');
   }	
	
   function closeLoadProgress(){
	 //Ocultar Modal con barra de progreso
	    var $modal = $('.js-loading-bar');
       $modal.modal('hide');
   }
		
	
	function listReportConsumoDisco(vFechaInicio, vFechaFin) {
		
		$(document).ready(function() {
			
		var src = 'ServletWConsumos';
		$.post(src, {strOperation : "historicoConsumosDisco", strFechaInicio :  vFechaInicio , strFechaFin : vFechaFin},
					function(pdata) {
					  var obj = JSON.parse(pdata);
					  var dataReporte = [];
					  var columnsReport = [];
						  for(i = 0 ; i < obj.reporteConsumoDisco.length ; i++ )
						  	{
						  	
							var arr = [];
							arr.push(obj.reporteConsumoDisco[i].fecha);
							arr.push(obj.reporteConsumoDisco[i].hora);
							arr.push(obj.reporteConsumoDisco[i].lpart);
							arr.push(obj.reporteConsumoDisco[i].sysbase);
							arr.push(obj.reporteConsumoDisco[i].tmoviasp);
							arr.push(obj.reporteConsumoDisco[i].ssd);
							arr.push(obj.reporteConsumoDisco[i].tmoviasp_dispo);
							
							
							dataReporte.push(arr);
							}
						  
						  columnsReport = [ 
							{title : "FECHA"},
							{title : "HORA"},
							{title : "LPAR"},
						    {title : "SYSBASE"},
						    {title : "TMOVIASP"}, 
				            {title : "SSD"}, 
				            {title : "%TMOVIASP"}
				            
				          ];
					setDataConsumoDisco(dataReporte,columnsReport);
					    
			});
			
		});
	}
	
	
	function listReportConsumoBackup(vFechaInicio, vFechaFin) {
		
		$(document).ready(function() {
			
		var src = 'ServletWConsumos';
		$.post(src, {strOperation : "historicoConsumosBackup", strFechaInicio :  vFechaInicio , strFechaFin : vFechaFin},
					function(pdata) {
					  var obj = JSON.parse(pdata);
					  var dataReporte = [];
					  var columnsReport = [];
						  for(i = 0 ; i < obj.reporteConsumoBackup.length ; i++ )
						  	{
						  	
							var arr = [];
							arr.push(obj.reporteConsumoBackup[i].fecha);
							arr.push(obj.reporteConsumoBackup[i].hora);
							arr.push(obj.reporteConsumoBackup[i].fcfull);
							arr.push(obj.reporteConsumoBackup[i].inicio);
							arr.push(obj.reporteConsumoBackup[i].fin);
							arr.push(obj.reporteConsumoBackup[i].descripcionEstado);
							arr.push(obj.reporteConsumoBackup[i].observacion);
							dataReporte.push(arr);
							}
						  
						  columnsReport = [ 
							{title : "FECHA"},
							{title : "HORA"},
							{title : "FCFULL"},
						    {title : "INICIO"},
						    {title : "FINAL"},
						    {title : "ESTADO"},
						    {title : "OBSERVACIONES"}
						    
				          ];
					setDataConsumoBackup(dataReporte,columnsReport);
					    
			});
			
		});
	}
	
	
	function listReportConsumoSistema(vFechaInicio, vFechaFin) {
		
		$(document).ready(function() {
			
		var src = 'ServletWConsumos';
		$.post(src, {strOperation : "historicoConsumosSistema", strFechaInicio :  vFechaInicio , strFechaFin : vFechaFin},
					function(pdata) {
					  var obj = JSON.parse(pdata);
					  var dataReporte = [];
					  var columnsReport = [];
						  for(i = 0 ; i < obj.reporteConsumoSistema.length ; i++ )
						  	{
						  	
							var arr = [];
							arr.push(obj.reporteConsumoSistema[i].fecha);
							arr.push(obj.reporteConsumoSistema[i].hora);
							arr.push(obj.reporteConsumoSistema[i].estado);
							arr.push(obj.reporteConsumoSistema[i].cantidad);
							arr.push(obj.reporteConsumoSistema[i].porcent);
							arr.push(obj.reporteConsumoSistema[i].umbral);
							arr.push(obj.reporteConsumoSistema[i].valmax);
							dataReporte.push(arr);
							}
						  
						  columnsReport = [ 
							{title : "FECHA"},
							{title : "HORA"},
							{title : "PRODUCCION"},
						    {title : "CANTIDAD"},
						    {title : "PORENTAJE"}, 
				            {title : "UMBRAL"}, 
				            {title : "VALOR MAXIMO"} 
				          ];
					setDataConsumoSistema(dataReporte,columnsReport);
					    
			});
			
		});
	}
	
	
	
	
	
	
	
	function setDataConsumoDisco(pdataReporte,pcolumnsReport)
	{
		$(document).ajaxStart(function() { Pace.restart(); });
		var htmlTableConsumoDisco = '<table id=\"tblReportesConsumoDisco\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
		document.getElementById('tbcontainerConsumoDisco').innerHTML = htmlTableConsumoDisco;
	
		if(typeof tableReporte === 'undefined') 
	    {
	    console.log('in if');
	    
		var tableReporte = $('#tblReportesConsumoDisco').DataTable(
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
// 		$('.dataTables_filter input').attr('size',10);
		closeLoadProgress();
	    }
	    else {
	    	closeLoadProgress();
	        console.log('in else');
	    // how to change the data contained inside datatable?
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
	}
	
	
	
	function setDataConsumoBackup(pdataReporte,pcolumnsReport)
	{
		$(document).ajaxStart(function() { Pace.restart(); });
		var htmlTableConsumoBackup = '<table id=\"tblReportesConsumoBackup\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
		document.getElementById('tbcontainerConsumoBackup').innerHTML = htmlTableConsumoBackup;
	
		if(typeof tableReporte === 'undefined') 
	    {
	    console.log('in if');
	    
		var tableReporte = $('#tblReportesConsumoBackup').DataTable(
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
// 		$('.dataTables_filter input').attr('size',10);
		closeLoadProgress();
	    }
	    else {
	    	closeLoadProgress();
	        console.log('in else');
	    // how to change the data contained inside datatable?
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
	}
	
	
	
	function setDataConsumoSistema(pdataReporte,pcolumnsReport)
	{
		$(document).ajaxStart(function() { Pace.restart(); });
		var htmlTableConsumoSistema = '<table id=\"tblReportesConsumoSistema\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
		document.getElementById('tbcontainerConsumoSistema').innerHTML = 	htmlTableConsumoSistema;
	
		if(typeof tableReporte === 'undefined')
	    {
	    console.log('in if');
	    
		var tableReporte = $('#tblReportesConsumoSistema').DataTable(
				{
					processing : false,
					language : {
						processing : "Procesando...",
						search : '<i class="fa fa-search fa-lg"></i>',
						searchPlaceholder : "Buscar..."
					},
					serverSide : false,
					data : pdataReporte,
					columns : pcolumnsReport,
					dom : 'Bfrtip',
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
							},
							{
								extend : 'excelHtml5',
								text : '<i class="fa fa-file-excel-o"></i> Descargar en Excel',
// 								className : 'btn btn-default',
								customize : function(
										xlsx) {
									var sheet = xlsx.xl.worksheets['reporte.xml'];

									// jQuery selector to add a border
									$('row c[r*="10"]',sheet).attr('s','25');
								}
							} ],
					destroy : true
				});
		$('.dataTables_filter input').addClass('form-control-search-datatable');
// 		$('.dataTables_filter input').attr('size',10);
		closeLoadProgress();
	    }
	    else {
	    	closeLoadProgress();
	        console.log('in else');
	    // how to change the data contained inside datatable?
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
	}
	
	 $(function () {
         //Initialize Select2 Elements
         $(".select2").select2();
     });
		//Setup Barra de progreso
		this.$('.js-loading-bar').modal({
		  backdrop: 'static',
		  show: false
		});
</script>
</body>
</html>