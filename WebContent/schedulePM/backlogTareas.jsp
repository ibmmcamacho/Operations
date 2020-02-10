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
	<!-- Content Wrapper. Contains page content -->
	<aside class="right-side "> <!-- Content Header (Page header) -->

	<section class="content-header">
	<h1>
		Backlog Tareas
	</h1>
	<ol class="breadcrumb">
		<li><a href="index.php"><i class="fa fa-th-large"></i>
				Schedule Gobierno</a></li>
		<li class="active">BACKLOG</li>
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
	

	<br>
	
	<div class="row"><div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><span id="spanMessage"></span></div></div>
	
	<!-- INICIO TABLA RESULTADOS -->
<!-- 	<div class="row"> -->
		<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> REPORTE BACKLOG</h3>
					</div>
					<div class="box-body">
						<div class="row">
							<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
								<div id="tbcontainerBacklog" class="table-responsive">
								</div>
							</div>
						</div>
				</div>
                <div id="dvLoadBacklog"></div>
			</div>
<!-- 		</div> -->
	<!-- FIN TABLA RESULTADOS --> </section><!-- /.content -->      


	</aside>
	


	<!-- Librerias para Kartik --> 
	<script src="<%=request.getContextPath()%>/resources/kartik-v-bootstrap-fileinput-d66e684/js/fileinput.js" type="text/javascript"></script> 
	<!-- Librerias para feedBack --> 
	<script src="<%=request.getContextPath()%>/resources/feedBack/js/feedback.js" type="text/javascript"></script> 
	
	<script>
	
	listReport();
	
	function listReport() {
		
		$('#mdReporte').modal('show');
		
		$(document).ready(
						function() {
							var vtxtPeriodo = $('#txtPeriodo').val(); 

							var htmlTable= '<table id=\"tblBacklog\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\" width=\"100%\"></thead></table>';
							document.getElementById('tbcontainerBacklog').innerHTML = htmlTable;
	
							$('#dvLoadBacklog').removeClass('overlay');
							$('#dvLoadBacklog').addClass('overlay');
							document.getElementById('dvLoadBacklog').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';

							var src = 'ServletTarea';
							$.post(src,{
												strAccion : '13'
											},
											function(pdata) {
												var obj = JSON.parse(pdata);
												var dataReporte = [];

												for (i = 0; i < obj.listaTareasBacklog.length; i++) {
													var arr = [];
													arr.push(i+1);
													arr.push(obj.listaTareasBacklog[i].squad);
													arr.push(obj.listaTareasBacklog[i].team);
													arr.push(obj.listaTareasBacklog[i].tipoTarea);
													arr.push(obj.listaTareasBacklog[i].estado);
													arr.push(obj.listaTareasBacklog[i].fechaVencimiento);
													arr.push(obj.listaTareasBacklog[i].dias);
													arr.push(obj.listaTareasBacklog[i].fechaFinalizacion);
													dataReporte.push(arr);
												}
												
												columnsReport = [ {
													title : "Nº"}, {
													title : "SQUAD"}, {
													title : "TEAM"}, {
													title : "TIPO TAREA"}, {
													title : "ESTADO"}, {	
													title : "FECHA VENCIMIENTO"}, {
													title : "DIAS"}, {
													title : "FECHA FINALIZACION"
												} ];
	
												setDataReporte(dataReporte,columnsReport);
												
												document.getElementById('dvLoadBacklog').innerHTML = '';
												$('#dvLoadBacklog').removeClass('overlay');
											});

						});
	}
	
	function setDataReporte(pdataReporte, pcolumnsReport) {

		if (typeof tableReporte === 'undefined') {

			var tableReporte = $('#tblBacklog')
					.DataTable(
							{
								processing : false,
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
	        							last: "Ultimo",
	        							next: "Siguiente",
	        							previous: "Anterior"
	   								 }
								},
								serverSide : false,
								data : pdataReporte,
								columns : pcolumnsReport,
								dom : 'Bfrtip',
								lengthMenu : [
										[ 10, 25, 50, -1 ],
										[ '10 registros', '25 registros',
												'50 registros', 'Mostrar todo' ] ],
								buttons : [
										{
											extend : 'pageLength',                                                          
											text : '<i class="fa fa-list-ol" aria-hidden="true"></i> Mostrar',
										},
										{
											extend : 'excelHtml5',
											text : '<i class="fa fa-file-excel-o"></i> Descargar en Excel',
											// 								className : 'btn btn-default',
											customize : function(xlsx) {
												var sheet = xlsx.xl.worksheets['reporte.xml'];

												// jQuery selector to add a border
												$('row c[r*="10"]', sheet)
														.attr('s', '25');
											}
										} ],
								destroy : true
							});
			$('.dataTables_filter input').addClass(
					'form-control-search-datatable');
			// 		$('.dataTables_filter input').attr('size',10);
		} else {
			// how to change the data contained inside datatable?
			tableReporte.fnClearTable();
			tableReporte.fnAddData(pdataReporte);
			tableReporte.fnAdjustColumnSizing();
		}
	}
	
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
