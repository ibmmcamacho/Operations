<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

	<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>CONSUMO TELEFÓNICA</title>
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
	Estatus Consumos<small> Telefónica</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-dashboard"></i> Estatus Consumos</a></li>
	<li class="active">TelefÛnica</li>
</ol>
</section> <!-- Main content --> <section class="content"> <!-- top row -->

<br />
<div class="row">
	<div class="col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> ESTATUS</h3>
			</div>
			<div class="box-body">
			
				<h4 class="box-title"> <i class="fa fa-database" aria-hidden="true"></i> DISCO</h4>
				<div id="tbcontainerConsumoDisco" class="table-responsive">
					Aquí podrás obtener toda la información de los tickets registrado como Alertas Ejecutivas.
				</div>
				<br/>
				<h4 class="box-title"> <i class="fa fa-database" aria-hidden="true"></i> BACKUP</h4>
					<div id="alertaConfirmacionBackup" class="alert alert-success fade in" style='display:none;'>
				    <strong>¡Éxito!</strong>  Su operación se ha realizado satisfactoriamente.
				  	</div>
				  	<div id="alertaErrorBackup" class="alert alert-danger alert-dismissable fade in" style='display:none;'>
				    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				    <strong>¡Error!</strong>  No se pudo completar el proceso de actualización.
				  	</div>
				<div id="tbcontainerConsumoBackup" class="table-responsive">
					Aquí podrás obtener toda la información de los tickets registrado como Alertas Ejecutivas.
				</div>
				<br/>
				<h4 class="box-title"> <i class="fa fa-desktop" aria-hidden="true"></i> SISTEMA</h4>
				<div id="tbcontainerConsumoSistema" class="table-responsive">
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
		
		
		generaOpcionesEstadoBackup();
		listReportConsumoSistema();
		listReportConsumoDisco();
		
		
   function activarAlerta(idAlerta) { 

   		 $('#'+idAlerta).fadeIn(1000).delay(2000).fadeOut(2000);

   		}// Fin funcion activarAlertaConfirmacion
   	

	function listReportConsumoDisco() {
	
		$(document).ready(function() {
	
		var src = 'ServletWConsumos';
		$.post(src, {strOperation : "consumosDisco"},
					function(pdata) {
					  var obj = JSON.parse(pdata);
					  var dataReporte = [];
					  var columnsReport = [];
						  for(i = 0 ; i < obj.reporteConsumoDisco.length ; i++ )
						  	{
						  	
							var arr = [];
							arr.push(obj.reporteConsumoDisco[i].lpart);
							arr.push(obj.reporteConsumoDisco[i].sysbase);
							arr.push(obj.reporteConsumoDisco[i].tmoviasp);
							arr.push(obj.reporteConsumoDisco[i].ssd);
							arr.push(obj.reporteConsumoDisco[i].tmoviasp_dispo);
							dataReporte.push(arr);
							}
						  
						  columnsReport = [ 
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
	
	function generaOpcionesEstadoBackup(){
		var idOption = [];
		var descriptionOption = [];
		var src = "ServletWOptions";
		
		$.post(src, {strOperation : "listOptions", iTeam : "1", strType : "ESTADO_BACKUP"},
			function(pdata) {
		
			var obj = JSON.parse(pdata);
			
				for(i = 0 ; i < obj.reporte.length ; i++ ){	
				
					idOption.push(obj.reporte[i].idOption);
					descriptionOption.push(obj.reporte[i].descripcion);
				}
				
				listReportConsumoBackup(idOption,descriptionOption);	
		});
		
	}
	
	
	function updateBackup(idBackup, idCboEstado, idTxtObservacion, opcion){
		
		var src = "ServletWConsumos";
		var estado = 0 ;
		var observacion = "";
			
		if(opcion == "UPDATE_ESTADO"){
			estado = $("#"+idCboEstado).val();	
		}
		if(opcion == "UPDATE_OBSERVACION"){
			observacion = $("#"+idTxtObservacion).val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
		}

    	$.post(src, {strOperation:"registrarBackup", strOpcion: opcion, strIdBackup: idBackup, strEstado: estado, strObservacion: observacion}, 
   				function(pdata) {
    			
    			var obj = JSON.parse(pdata);
    			
    			if(obj.resultado[0].codigo > 0){
    				activarAlerta('alertaConfirmacionBackup');	
    			}else{
    				activarAlerta('alertaErrorBackup');
    			}
    			
    	});
	}
	
	function listReportConsumoBackup(id , descripcion ) {
		
		$(document).ready(function() {

		var src = 'ServletWConsumos';
		$.post(src, {strOperation : "consumosBackup"},
					function(pdata) {
					  var obj = JSON.parse(pdata);
					  var dataReporte = [];
					  var columnsReport = [];
						  for(i = 0 ; i < obj.reporteConsumoBackup.length ; i++ ){
							var arr = [];
						
							var htmlCboEstadoBackup = "<select  id=\"cbo"+i+"\" class=\"form-control select2\" style=\"width:100%\" onChange=\"updateBackup('"+obj.reporteConsumoBackup[i].id+"','cbo"+i+"','txt"+i+"','UPDATE_ESTADO')\">"
							 						+ "<option value=-1 disabled selected>--Seleccione--</option>";
							
							for(j = 0 ; j < id.length; j++){
								if(id[j] == obj.reporteConsumoBackup[i].estado){
									htmlCboEstadoBackup += "<option value="+id[j]+" selected> "+descripcion[j]+" </option>";	
								}else{
									htmlCboEstadoBackup += "<option value="+id[j]+">"+descripcion[j]+"</option>";
								}
								
							}
							htmlCboEstadoBackup += "</select>";
							
							var htmlTextAreaObservaciones = "<textarea  id=\"txt"+i+"\" class=\"form-control\" rows=\"2\" onChange=\"updateBackup('"+obj.reporteConsumoBackup[i].id+"','cbo"+i+"','txt"+i+"','UPDATE_OBSERVACION')\">"
														  + obj.reporteConsumoBackup[i].observacion
					            						  + "</textarea>";
					          
// 					            						  
							arr.push(obj.reporteConsumoBackup[i].fcfull);
							arr.push(obj.reporteConsumoBackup[i].inicio);
							arr.push(obj.reporteConsumoBackup[i].fin);
							arr.push(htmlCboEstadoBackup);
							arr.push(htmlTextAreaObservaciones);
							dataReporte.push(arr);

							}
						  
						  columnsReport = [ 
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
	
	
	function listReportConsumoSistema() {
		
		$(document).ready(function() {
			
		var src = 'ServletWConsumos';
		$.post(src, {strOperation : "consumosSistema"},
					function(pdata) {
					  var obj = JSON.parse(pdata);
					  var dataReporte = [];
					  var columnsReport = [];
						  for(i = 0 ; i < obj.reporteConsumoSistema.length ; i++ )
						  	{
						  	
							var arr = [];
							arr.push(obj.reporteConsumoSistema[i].estado);
							arr.push(obj.reporteConsumoSistema[i].cantidad);
							arr.push(obj.reporteConsumoSistema[i].porcent);
							arr.push(obj.reporteConsumoSistema[i].umbral);
							arr.push(obj.reporteConsumoSistema[i].valmax);
							dataReporte.push(arr);
							}
						  
						  columnsReport = [ 
							{title : "PRODUCCION"},
						    {title : "CANTIDAD"},
						    {title : "PORCENTAJE"}, 
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
	    }
	    else {
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
		//Ocultar Modal con barra de progreso
	    var $modal = $('.js-loading-bar');
	    $modal.modal('hide');
	    }
	    else {
	    	//Ocultar Modal con barra de progreso
	        var $modal = $('.js-loading-bar');
	        $modal.modal('hide');
	        console.log('in else');
	    // how to change the data contained inside datatable?
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
	}
	
	
	
	function setDataConsumoSistema(pdataReporte,pcolumnsReport){
		
		$(document).ajaxStart(function() { Pace.restart(); });
		var htmlTableConsumoSistema = '<table id=\"tblReportesConsumoSistema\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
		document.getElementById('tbcontainerConsumoSistema').innerHTML = 	htmlTableConsumoSistema;
	
		if(typeof tableReporte === 'undefined') 
	    {
	    console.log('in if');
	    
		var tableReporte = $('#tblReportesConsumoSistema').DataTable(
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
	    }
	    
	}
	
	
	
</script>
<script>
	$(function () {
	    //Initialize Select2 Elements
	    $(".select2").select2();
	});
	//Setup Barra de progreso
	this.$('.js-loading-bar').modal({
	  backdrop: 'static',
	  show: false
	});
	
	// Haciendo visible Modal con Barra de progreso 
	  var $modal = $('.js-loading-bar');
	  $modal.modal('show');
	
</script>
</body>
</html>