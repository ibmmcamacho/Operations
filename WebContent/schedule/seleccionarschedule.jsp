<!DOCTYPE html>
<html>
<head>

<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/custom/css/styleBorder.css">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>SCHEDULE | CROSS</title>

<script type="text/javascript">
	var f = new Date();
	var date = f.getFullYear()
			+ '-'
			+ ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f
					.getMonth() + 1)) + '-'
			+ ((f.getDate()) < 10 ? '0' + f.getDate() : f.getDate());

	document.getElementById("txtFechaSchedule").value = date;
</script>

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
				Seleccionar Schedule <small>Schedule</small>
			</h1>
			<ol class="breadcrumb">
				<li><i class="fa fa-th-large"></i> Schedule</li>
				<li class="active">Seleccionar Schedule</li>
			</ol>
		</section>
		<input type="hidden" style="width: 100%;" class="form-control" id="pPerfil">
		<input type="hidden" style="width: 100%;" class="form-control" id="pTeam">
		<!-- Main content -->
		<section class="content">
		
		<div class="form-inline ">
          <fieldset class="scheduler-border">
			    <legend class="scheduler-border">Generar Schedule</legend>
			    <div class="control-group ">
			    
			    <div id="divBtnGeneraSchedule" class="btn-group">
				 </div> 
				 <div class="form-group ">
			      	<input type="text" class="form-control form-control-sm datePicker" id="txtFechaSchedule">
			     </div> 
			    </div>
			</fieldset>
        </div>

			<br>
			<div id="alertaConfirmacion"
				class="alert alert-success alert-dismissable fade in"
				style='display: none;'>
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>��xito!</strong> Su operaci�n se ha realizado
				satisfactoriamente.
			</div>

			<div id="alertaNegativa"
				class="alert alert-danger alert-dismissable fade in"
				style='display: none;'>
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>�Error!</strong> Su operaci�n no se ha realizado.
			</div>

			<div class="row">
				<div class="col-md-12">
					<div class="box">
						<div class="box-header">
							<h3 class="box-title">Lista de Schedules</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="table-responsive">
								<table id="example1"
									class="table table-bordered table-striped table-responsive table-hover"
									class="display"  cellspacing="0" style="font-size:11px">
								
									<thead class="bg-primary">
										<tr>
											<th>FECHA</th>
											<th>SEDE</th>
											<th>TURNO</th>
											<th>HORA INICIO</th>
											<th>HORA FIN</th>
											<th>ESTADO</th>
											<th>OPERADOR ASIGNADO</th>
											<th>ACCI�N</th>
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
			
			perfil();
			

		}); // Fin del $(document)

		function perfil(){
			
			var src = "ServletSesion";
     	 	
     		//Inicio POST para  listar informaci�n en la tabla
     	 	$.post(src, {strAccion:"0"}, 
     					function(pdata) {
     				     
     					  var obj = JSON.parse(pdata);
       					   
     					  var perfil = obj.Sesion[0].perfil;
     					  var team = obj.Sesion[0].team;
     					 
     					  $("#pPerfil").val(perfil);
     					  $("#pTeam").val(team);
     					  
     					  botonesGeneraSchedule();
     					  listar();
     	 	});
		}
		
		function botonesGeneraSchedule(){
			
			var src = "ServletWOptionsCont";
     	 	
     		//Inicio POST para  listar informaci�n en la tabla
     	 	$.post(src, {strOperation:"listOptions",
     	 				strType: "BTN_GENERA_SCHEDULE"}, 
     					function(pdata) {
     				     
     					  var obj = JSON.parse(pdata);
     					  var cadenaDivBtnGeneraSchedule ="";
     					  for(i = 0; i < obj.reporte.length; i++){
     						  
     						  if(obj.reporte[i].valor1 == "INDIVIDUAL"){
     							 cadenaDivBtnGeneraSchedule += '<button type="button" class="btn btn-primary" onclick="generarSchedule(\''+obj.reporte[i].valor2+'\')">'+obj.reporte[i].descripcion+'</button>';
     							  
     						  }else if(obj.reporte[i].valor1 == "MENU"){
     							 cadenaDivBtnGeneraSchedule += '<div class="btn-group">'+
								     						   '<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">Acreditaciones<span class="caret"></span></button>'+
								     						   '<ul class="dropdown-menu" role="menu">';
								     						   
								 for(j = 0; j < obj.reporte.length; j++){
								     if(obj.reporte[i].valor2 == obj.reporte[j].valor1){
								     cadenaDivBtnGeneraSchedule += '<li><a href="#" onclick="generarSchedule(\''+obj.reporte[j].valor2+'\')">'+obj.reporte[j].descripcion+'</a></li>';   
								     }
								 }
								 cadenaDivBtnGeneraSchedule += '</ul></div>';
     						  }
     						  
     						  
     					  }
     					 document.getElementById('divBtnGeneraSchedule').innerHTML = cadenaDivBtnGeneraSchedule;
     					  
     					  
       					  
     	 	});
		}
		
		
		function verSchedulePDF(pIdSchedule, pFecha, pSede, pTurno,	phoraInicio, phoraFin, pTipoReporte) {
			var src = "ServletPDF";

			//Inicio POST para insertar informaci�n 
				$.post(src,
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

								var win = window.open("","Your PDF","width=1024,height=768,resizable=yes,scrollbars=yes,toolbar=no,location=no,directories=no,status=no,menubar=no,copyhistory=no");
								win.document.location.href = src;

							});
		}

		function generarSchedule(pType) {
		
			var src = "ServletSchedule";
			var pFechaSchedule = $('#txtFechaSchedule').val();
			//Inicio POST actualizar estado Turno
			$.post(src, {
				strAccion : "6",
				strType : pType,
				strFechaSchedule : pFechaSchedule
			}, function(pdata) {
				var obj = JSON.parse(pdata);
// 				alert(obj.SeleccionarSchedule[0].resultado);
				if (obj.SeleccionarSchedule[0].resultado == "0") {
					activarAlertaConfirmacion('alertaNegativa');
					perfil();
				} else {
					activarAlertaConfirmacion('alertaConfirmacion');
					perfil();
				}
			});
			
		}

		function asignarSchedule(pIdSchedule, pTurno, pSede, pEstado, pfecha, phoraInicioTurno, phoraFinTurno) {

				if (confirm('�Est� seguro que desea Asignarse el Schedule "'
						+ pTurno + '"  "' + pSede + '"?')) {
					varEstado = pEstado;
					varIdSchedule = pIdSchedule;
					var src = "ServletSchedule";
					//Inicio POST actualizar estado Turno
					$.post(src, {
						strAccion : "4",
						strId : varIdSchedule,
						strEstado : varEstado,
						strOperacion : "SELECCIONAR_SCHEDULE"
					}, function(pdata) {
						var obj = JSON.parse(pdata);
						if (obj.SeleccionarSchedule[0].codigo == "0") {
							activarAlertaConfirmacion('alertaNegativa');
							listar();
						} else {
// 							activarAlertaConfirmacion('alertaConfirmacion');
// 							listar();
							var formatoCabecera = "["+pfecha+"] "+pSede+" - "+pTurno+" - ("+phoraInicioTurno+" - "+phoraFinTurno+")";
				           	//Inicio POST para completar listar informaci�n en la tabla
				            	$.post(src, {strAccion:"5", strIdSchedule: pIdSchedule, strCabecera: formatoCabecera }, 
				           				function(pdata) {
				            		
				            		 		var obj = JSON.parse(pdata);
				      				    
						      				  if(obj.iniciarSchedule[0].idRespuesta == "1"){
						      					javascript:recargarDiv('wcontentRight', 'schedule/detalleschedule.jsp');
						      					}else{
						      					alert('ERROR');
						      					}

						
				  		});
						}
					});
					//Fin Seleccionar Schedule
				} else {
					return false;

				}

		} // Fin funcion editar   
		
		
		function desactivarSchedule(pIdSchedule, pTurno, pSede, pEstado, pfecha, phoraInicioTurno, phoraFinTurno){
			
			if (confirm('�Est� seguro que desea eliminar el Schedule "'
					+ pTurno + '"  "' + pSede + '"?')) {
				varEstado = pEstado;
				varIdSchedule = pIdSchedule;
				var src = "ServletSchedule";
				//Inicio POST actualizar estado Turno
				$.post(src, {
					strAccion : "4",
					strId : varIdSchedule,
					strEstado : varEstado,
					strOperacion : "ELIMINAR_SCHEDULE"
				}, function(pdata) {
					var obj = JSON.parse(pdata);
					if (obj.SeleccionarSchedule[0].codigo == "0") {
						activarAlertaConfirmacion('alertaNegativa');
						listar();
					} else {
						activarAlertaConfirmacion('alertaConfirmacion');
						listar();
					}
				});
				//Fin Seleccionar Schedule
			} else {
				return false;
			}
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

		function listar() {
			// Haciendo visible Modal con Barra de progreso 
	          var $modal = $('.js-loading-bar');
	          $modal.modal('show');


	          var perfil =  $("#pPerfil").val();

	          var src = "ServletSchedule";

			//Inicio POST para completar listar informaci�n en la tabla
			$.post(src,{strAccion : "2"},
							function(pdata) {

								var obj = JSON.parse(pdata);
								var datatabla = [];
								var numeracion = 0;

								if (obj.ListaSchedule[0].idSchedule == "") {

								} else {

									for (i = 0; i < obj.ListaSchedule.length; i++) {

										numeracion = numeracion + 1;
										var arr = [];

										//captura de datos
										var idSchedule = obj.ListaSchedule[i].idSchedule;
										var fecha = obj.ListaSchedule[i].fecha;
										var estado = obj.ListaSchedule[i].estado;
										var descripcionEstado;
										var idTurno = obj.ListaSchedule[i].idTurno;
										var descripcionTurno = obj.ListaSchedule[i].descripcionTurno;
										var horaInicioTurno = obj.ListaSchedule[i].horaInicioTurno;
										var horaFinTurno = obj.ListaSchedule[i].horaFinTurno;
										var usermod = obj.ListaSchedule[i].usermod;
										var idSede = obj.ListaSchedule[i].idSede;
										var descripcionSede = obj.ListaSchedule[i].descripcionSede;
										var operadorAsignado = obj.ListaSchedule[i].operadorAsignado;
										var btnEliminar = "";

										if (estado == 1) {
											descripcionEstado = "SIN ASIGNAR";
											
										} else if (estado == 2) {
											descripcionEstado = "PENDIENTE";
										} else {
											descripcionEstado = "";
										}
										
										descripcionEstado = (estado == 1 ? '<span class="label label-info"><i class="fa fa-hourglass-end" aria-hidden="true"></i> SIN ASIGNAR</span>' : estado == 2 ? '<span class="label label-warning"><i class="fa fa-clock-o" aria-hidden="true"></i> PENDIENTE</span>' : '');
										
										if(perfil == 'ADMINISTRADOR'){
											btnEliminar =  "<div style='display:inline-flex;'><button style='padding:8px!important;margin-left:6px !important;' title=\"Eliminar Schedule\" type=\"button\" class=\"btn btn-danger btn-sm\" style='display:block;'  onclick=\"desactivarSchedule('"
												+ idSchedule
												+ "','"
												+ descripcionTurno
												+ "','"
												+ descripcionSede
												+ "','2')\"><i class=\"fa fa-trash\"></i></button></div></center>";
										}

										//Generaci�n de cadena para tabla  turno

										arr.push(fecha);
										arr.push(descripcionSede);
										arr.push(descripcionTurno);
										arr.push(horaInicioTurno);
										arr.push(horaFinTurno);
										arr.push(descripcionEstado);
										arr.push(operadorAsignado);
										arr.push("<center><div style='display:inline-flex;'><button style='padding:8px!important;margin-left:6px !important;' title=\"Ver Schedule (PDF)\" type=\"button\" class=\"btn btn-primary btn-sm\" style='display:block;'  onclick=\"verSchedulePDF('"
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
														+ "','PARCIAL')\"><i class=\"fa fa-file-pdf-o\"></i></button></div><div style='display:inline-flex;'><button style='padding:8px!important;margin-left:6px !important;' title=\"Asignarse Schedule\" type=\"button\" class=\"btn btn-warning btn-sm\" style='display:block;'  onclick=\"asignarSchedule('"
														+ idSchedule
														+ "','"
														+ descripcionTurno
														+ "','"
														+ descripcionSede
														+ "','"
														+ estado
														+ "','"
														+ fecha
														+ "','"
														+ horaInicioTurno
														+ "','"
														+ horaFinTurno
														+ "')\"><i class=\"fa fa-lock\"></i></button></div>"
														+btnEliminar);
										datatabla.push(arr);
									}
								}
								
								
								// DataTable
								var table = $('#example1').DataTable();
								table.destroy();	
									
									$('#example1').DataTable(
												{
													order: [[ 0, "desc" ]],
													language : {
														processing : "Procesando...",
														search : '<i class="fa fa-search fa-lg"></i>',
														searchPlaceholder : "Buscar...",
														emptyTable: "Ning�n dato disponible en esta tabla",
														lengthMenu: "Mostrar _MENU_ registros",
							    						zeroRecords: "Sin resultados encontrados",
							    						info: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
							    						infoEmpty: "No hay registros disponibles",
							    						infoFiltered: "(filtrado de un total de _MAX_ registros)",
							    						paginate: {
							    							first: "Primero",
							    							last: "�ltimo",
							    							next: "Siguiente",
							    							previous: "Anterior"
							    						}
													},
													dom : 'Bfrtip',
													lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
													data : datatabla,
													buttons : [
														{
															extend : 'pageLength',
															text : '<i class="fa fa-list-ol" aria-hidden="true"></i> Mostrar',
															className: "btn-sm"
														},
														{
														�	extend: "copy",
															exportOptions: {
																columns: [0,1,2,3,4,5,6]
															},
															className: "btn-sm",
															text : '<i class="fa fa-clipboard" aria-hidden="true"></i> Copiar'
														},
														{
															extend: "csv",
															exportOptions: {
																columns: [0,1,2,3,4,5,6]
															},
															className: "btn-sm",
															text : '<i class="fa fa-file-text-o" aria-hidden="true"></i> CSV'
														},
														{
															extend: "excel",
															exportOptions: {
																columns: [0,1,2,3,4,5,6]
															},
															className: "btn-sm",
															text : '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
														},
														{
															extend: "pdfHtml5",
															exportOptions: {
																columns: [0,1,2,3,4,5,6]
															},
															className: "btn-sm",
															text : '<i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF'
														},
														{
															extend: "print",
															exportOptions: {
																columns: [0,1,2,3,4,5,6]
															},
															className: "btn-sm",
															text : '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'
														}],
						       						responsive: true
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
							    });
							
								
							  //Ocultar Modal con barra de progreso
							    var $modal = $('.js-loading-bar');
						        $modal.modal('hide');

						       

							});// Fin del POST listar tabla
		} // Fin funcion Listar
	</script>

	<script type="text/javascript">
		$('.clockpicker').clockpicker({
			donetext : 'OK'
		});
	</script>

	<script>
		$(function() {
			//Initialize Select2 Elements
			$(".select2").select2();
		});
		
		// Setup Barra de progreso
        this.$('.js-loading-bar').modal({
          backdrop: 'static',
          show: false
        });

      // Haciendo visible Modal con Barra de progreso 
          var $modal = $('.js-loading-bar');
          $modal.modal('show');
	</script>

	<script type="text/javascript">
		function validar(e) {
			tecla = (document.all) ? e.keyCode : e.which;
			patron = /[\x5C'"]/;
			te = String.fromCharCode(tecla);
			return !patron.test(te);
		}

		function validar_solo_numeros(e) {
			var key = window.Event ? e.which : e.keyCode
			return (key >= 48 && key <= 57)
		}
		
		
	</script>
</body>
</html>
