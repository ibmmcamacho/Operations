<!DOCTYPE html>
<html>
<head>

<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SCHEDULE | CROSS</title>

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
          
	<!-- Content Wrapper. Contains page content -->
	<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
	
		<section class="content-header">
			<h1>
				Schedules Activos<small>Schedule</small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-th-large"></i> Schedule</li>
				<li class="active">Schedules Activos</li>
			</ol>
		</section>

		<!-- Main content -->
		<section class="content">
		<div class="form-inline">
			<div class="form-group">
				<button type="button" class="btn btn-default"
					onclick="listar()">
					<i class="fa fa-refresh fa-lg"></i> ACTUALIZAR
				</button>
			</div>
		</div>
			<br>
			<br>


			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Lista de Schedules Activos</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="table-responsive">
								<table id="example1"
									class="table table-bordered table-striped table-responsive table-hover"
									class="display" width="99%" cellspacing="0" style="font-size:10px; font-weight:bold">
									<thead class="bg-primary">
										<tr>
											<th>FECHA</th>
											<th>SEDE</th>
											<th>TURNO</th>
											<th>HORA INICIO</th>
											<th>HORA FIN</th>
											<th>ESTADO</th>
											<th>OPERADOR ASIGNADO</th>
											<th>ACCIÓN</th>
										</tr>
									</thead>
									<thead class="filters" >
										<tr>
										
											<th style="border: hidden"></th>
											<th style="border: hidden"></th>
											<th style="border: hidden"></th>
											<th style="border: hidden"></th>
											<th style="border: hidden"></th>
											<th style="border: hidden"></th>
											<th style="border: hidden"></th>
											<th style="border: hidden" hidden></th>
										
										</tr>
									</thead>
								

								</table>
							</div>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
			</div>
			<!-- END TYPOGRAPHY -->

		</section>
		<!-- /.content -->
	</aside>
	<!-- /.content-wrapper -->

	<script>
		$(document).ready(function() {

			listar();

		}); // Fin del $(document)

		function verSchedulePDF(pIdSchedule, pFecha, pSede, pTurno,
				phoraInicio, phoraFin, pTipoReporte) {
			var src = "ServletPDF";

			//Inicio POST para insertar información 
			$
					.post(
							src,
							{
								strId : pIdSchedule,
								strFecha : pFecha,
								strSede : pSede,
								strTurno : pTurno,
								strHoraInicio : phoraInicio,
								strHoraFin : phoraFin,
								strTipoReporte : pTipoReporte
							},
							function(pdata) {

								var win = window
										.open(
												"",
												"Your PDF",
												"width=1024,height=768,resizable=yes,scrollbars=yes,toolbar=no,location=no,directories=no,status=no,menubar=no,copyhistory=no");
								win.document.location.href = src;

							});
		}

		function listar() {
			
			// Haciendo visible Modal con Barra de progreso 
	          var $modal = $('.js-loading-bar');
	          $modal.modal('show');
	          
	          
			var src = "ServletSchedule";

			//Inicio POST para completar listar información en la tabla
			$
					.post(
							src,
							{
								strAccion : "7"
							},
							function(pdata) {

								var obj = JSON.parse(pdata);
								var datatabla = [];
								var numeracion = 0;

								if (obj.ListaScheduleActivos[0].idSchedule == "") {

								} else {

									for (i = 0; i < obj.ListaScheduleActivos.length; i++) {

										numeracion = numeracion + 1;
										var arr = [];

										//captura de datos
										var idSchedule = obj.ListaScheduleActivos[i].idSchedule;
										var fecha = obj.ListaScheduleActivos[i].fecha;
										var estado = obj.ListaScheduleActivos[i].estado;
										var descripcionEstado;
										var idTurno = obj.ListaScheduleActivos[i].idTurno;
										var descripcionTurno = obj.ListaScheduleActivos[i].descripcionTurno;
										var horaInicioTurno = obj.ListaScheduleActivos[i].horaInicioTurno;
										var horaFinTurno = obj.ListaScheduleActivos[i].horaFinTurno;
										var usermod = obj.ListaScheduleActivos[i].usermod;
										var idSede = obj.ListaScheduleActivos[i].idSede;
										var descripcionSede = obj.ListaScheduleActivos[i].descripcionSede;
										var operadorAsignado = obj.ListaScheduleActivos[i].operadorAsignado;


										if (estado == 1) {
											descripcionEstado = "SIN ASIGNAR";
										} else if (estado == 2) {
											descripcionEstado = "PENDIENTE";
										} else {
											descripcionEstado = "";
										}

										//Generación de cadena para tabla  turno

										arr.push(fecha);
										arr.push(descripcionSede);
										arr.push(descripcionTurno);
										arr.push(horaInicioTurno);
										arr.push(horaFinTurno);
										arr.push(descripcionEstado);
										arr.push(operadorAsignado);
										arr.push("<center><button title=\"Ver Schedule (PDF)\" type=\"button\" class=\"btn btn-primary btn-ls centradoV\"  onclick=\"verSchedulePDF('"
														+ idSchedule
														+ "','"
														+ fecha
														+ "','"
														+ descripcionSede
														+ "','"
														+ descripcionTurno
														+ "','"
														+ horaInicioTurno
														+ "','"
														+ horaFinTurno
														+ "','PARCIAL')\" ><i class=\"fa fa-file-pdf-o\"></i></center>");
										datatabla.push(arr);
									}
								}

								// DataTable
								var table = $('#example1').DataTable();
								table.destroy();

								$('#example1')
										.DataTable(
												{
													language : {
														searchPlaceholder : "Buscar...",
														search : '<i class="fa fa-search fa-lg">',

													},

						       				     	columnDefs: [
						       				     	 { "width": "6%", "targets": 7 }
						       				    	],
						       				    	
													dom : 'Bfrtip',
													lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
													data : datatabla,
													buttons : [
															{
																extend : 'pageLength',
																text : '<i class="fa fa-list-ol" aria-hidden="true"></i> Mostrar',
															},
															{
																extend : 'excelHtml5',
																text : '<i class="fa fa-file-excel-o"></i> Descargar en Excel',
																customize : function(
																		xlsx) {
																	var sheet = xlsx.xl.worksheets['reporte.xml'];

																	// jQuery selector to add a border
																	$(
																			'row c[r*="10"]',
																			sheet)
																			.attr(
																					's',
																					'25');
																}
															} ]
												});
								
								// Setup - add a text input to each footer cell
								    $('#example1 .filters th').each( function () {
								        var title = $('#example1 thead th').eq( $(this).index() ).text();
								        $(this).html( '<input type="text" placeholder="Buscar '+title+'" style="width:100%"  />' );
								    } );

								table = $('#example1').DataTable();
								
								// Apply the search
							    table.columns().eq( 0 ).each( function ( colIdx ) {
							        $( 'input', $('.filters th')[colIdx] ).on( 'keyup change', function () {
							            table
							                .column( colIdx )
							                .search( this.value )
							                .draw();
							        } );
							    } );
								
							  //Ocultar Modal con barra de progreso
							    var $modal = $('.js-loading-bar');
						        $modal.modal('hide');


							});// Fin del POST listar tabla
		} // Fin funcion Listar
		
		// Setup Barra de progreso
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
