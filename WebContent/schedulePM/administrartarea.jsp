<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<!--      <meta charset="UTF-8">  -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>
<script type="text/javascript">

var f=new Date();
var date = f.getFullYear() + '-' + ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f.getMonth() + 1)) + '-' + ((f.getDate()) < 10 ? '0' + f.getDate() : f.getDate());

document.getElementById("utxtFecha").value = date;
document.getElementById("itxtfecha_").value = date;

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
						<div class="progress-bar" role="progressbar" aria-valuenow="100"
							aria-valuemin="0" aria-valuemax="100" style="width: 100%">
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
		Mantenimiento <small>Tarea</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="index.php"><i class="fa fa-th-large"></i>
				Mantenimiento</a></li>
		<li class="active">Tarea</li>
	</ol>
	</section> <!-- Main content --> <section id="page"
		title="Schedule Gobierno / Mantenimiento Tarea" class="content">
	<button title="Nueva Tarea" type="button" class="btn bg-blue"
		data-toggle="modal" data-target="#modalNew" onclick="refreshCombos()">
		<i class="fa fa-file-text-o"></i> Nuevo
	</button>
	<button title="Actualizar lista de Tareas" type="button"
		class="btn  bg-blue" onclick="visualizar()">
		<i class="fa fa-refresh fa-lg"></i> Actualizar
	</button>
	<br>
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

	<!--         Inicio   Modal Nuevo                                                       -->

	<div class="modal fade" id="modalNew" role="dialog" aria-labelledby="exampleModalLongTitle2" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header label-primary">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLongTitle2">
						<a class="label-primary">Nueva Tarea&nbsp;&nbsp;</a><a
							style="color: red; font-weight: bold;"></a>
					</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" style="width: 100%;" class="form-control" id="iIdtarea"> <label for="recipient-name" class="control-label">Tipo</label>
						<div class="form-group">
							<p id="alerticboTipo" class="text-danger" style='display: none;'></p>
							<select class="form-control cbo2" style="width: 100%;" id="icboTipo">
								<option value="">--SELECCIONE--</option>
							</select>
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Tarea</label>
							<p id="alertiTarea" class="text-danger" style='display: none;'></p>
							<textarea name="ta_tarea" id="iTarea" class="form-control" rows="5" required></textarea>
						</div>

						<div class="form-group">
							<label for="recipient-name" class="control-label">Owner</label>
							<p id="alerticboOwner" class="text-danger" style='display: none;'></p>
							<select class="cbo2" multiple="multiple" style="width: 100%;" id="icboOwner">
								<option value="">--SELECCIONE--</option>
							</select>
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Aprobador</label>
							<p id="alerticboAprobador" class="text-danger" style='display: none;'></p>
							<select class="form-control cbo2" multiple="multiple" name="c_aprobador" style="width: 100%;" id="icboAprobador">
								<option value="">--SELECCIONE--</option>
							</select>
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Frecuencia</label>
							<p id="alertiFrecuencia" class="text-danger" style='display: none;'></p>
							<input type="text" style="width: 100%;" class="form-control" id="iFrecuencia" onkeypress="return validar(event)">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Programación</label>
							<p id="alertiProgramacion" class="text-danger" style='display: none;'></p>
							<input type="text" style="width: 100%;" class="form-control" id="iProgramacion" onkeypress="return validar(event)">
						</div>
						<div class="hidden"> <!-- ADD by ME -->
							<div id="formSeleccionN" class="form-group">
								<label for="recipient-name" class="control-label">Selección Periodo</label>
								<p id="alertucboPeriodo" class="text-danger" style='display: none;'></p>
								<div class="radio">
									<label class="radio-inline">
									  <input type="radio" name="optionsRadios1" id="rdbiRecurrente" value="recurrente"> Recurrente
									</label>
									<label class="radio-inline">
									  <input type="radio" name="optionsRadios1" id="rdbiNoRecurrente" value="norecurrente"> No Recurrente
									</label>
								</div>
							</div>
						</div><!-- ADD by ME -->
						<div class="form-group">
							<label for="recipient-name" class="control-label">Periodo</label>
							<p id="alerticboPeriodo" class="text-danger" style='display: none;'></p>
							
							<div class="form-inline">
								<div class="form-group hidden" id="divNoRecurrenteN">
									<span>Fecha</span>
									<input type="text" class="form-control datePicker" id="itxtfecha_">
								</div>
							</div>
								
							<div class="form-group hidden" id="divRecurrenteN">
								<select class="form-control cbo2" style="width: 100%;" id="icboPeriodo">
									<option value="">--SELECCIONE--</option>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="recipient-name" class="control-label">Aviso Inicial (Dia(s) antes)</label>
							<p id="alertiAvisoInicial" class="text-danger" style='display: none;'></p>
							<input type="number" name="quantity" min="0" max="5" style="width: 100%;" class="form-control" id="iAvisoInicial">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Aviso Final (Dia(s) después)</label>
							<p id="alertiAvisoFinal" class="text-danger" style='display: none;'></p>
							<input type="number" name="quantity" min="0" max="5" style="width: 100%;" class="form-control" id="iAvisoFinal">
						</div>
						<p id="mensajeRegistrar" class="text-danger" style='display: none;'></p>
				</div>
				<div class="modal-footer">
					<button id="btnRegistrar1"  class="btn btn-primary">
						<i class="fa fa-floppy-o"></i> Guardar
					</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">
						<i class="fa fa-reply"></i> Cerrar
					</button>
				</div>
			</div>
		</div>
	</div>
	<!--Fin Modal Nuevo	--> 
	
	<!--		Inicio Modal Editar	-->
	<div class="modal fade" id="modalEdit" role="dialog"
		aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header label-primary">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLongTitle">
						<a class="label-primary">Mantenimiento Tarea&nbsp;&nbsp;</a><a
							style="color: red; font-weight: bold;"></a>
					</h4>
				</div>
				<div class="modal-body">

					<input type="hidden" style="width: 100%;" class="form-control"
						id="uIdtarea">

					<div class="form-group">
						<label for="recipient-name" class="control-label">Tipo</label>
						<p id="alertucboTipo" class="text-danger" style='display: none;'></p>
						<select class="form-control cbo2" style="width: 100%;"
							id="ucboTipo">
							<option value="">--SELECCIONE--</option>
						</select>
					</div>
					<!-- 			         <br> -->

					<div class="form-group">
						<label for="recipient-name" class="control-label">Tarea</label>
						<p id="alertuTarea" class="text-danger" style='display: none;'></p>
						<textarea name="ta_tarea" id="uTarea" class="form-control"
							rows="5" required></textarea>
					</div>
					<!-- 		            <br> -->

					<div class="form-group">
						<label for="recipient-name" class="control-label">Owner</label>
						<p id="alertucboOwner" class="text-danger" style='display: none;'></p>
						<select class="form-control cbo2" multiple="multiple" style="width: 100%;"
							id="ucboOwner">
							<option value="">--SELECCIONE--</option>
						</select>
					</div>
					<!-- 			         <br> -->

					<div class="form-group">
						<label for="recipient-name" class="control-label">Aprobador</label>
						<p id="alertucboAprobador" class="text-danger"
							style='display: none;'></p>
						<select class="form-control cbo2" multiple="multiple" name="c_aprobador"
							style="width: 100%;" id="ucboAprobador">
							<option value="">--SELECCIONE--</option>
						</select>
					</div>
					<!-- 			         <br> 	 -->

					<div class="form-group">
						<label for="recipient-name" class="control-label">Frecuencia</label>
						<p id="alertuFrecuencia" class="text-danger"
							style='display: none;'></p>
						<input type="text" style="width: 100%;" class="form-control"
							id="uFrecuencia">
					</div>

					<div class="form-group">
						<label for="recipient-name" class="control-label">Programación</label>
						<p id="alertuProgramacion" class="text-danger" style='display: none;'></p>
						<input type="text" style="width: 100%;" class="form-control"
							id="uProgramacion"> <label id="alertuprogramacion"
							class="text-danger" style='display: none;'></label>
					</div>
					<div class="hidden">
							<div id="formSeleccionU" class="form-group">
								<label for="recipient-name" class="control-label">Selección Periodo</label>
								<p id="alertucboPeriodo" class="text-danger" style='display: none;'></p>
									
								<div class="radio">
									<label class="radio-inline">
									  <input type="radio" name="optionsRadios2" id="rdbuRecurrente" value="recurrente"> Recurrente
									</label>
									<label class="radio-inline">
									  <input type="radio" name="optionsRadios2" id="rdbuNoRecurrente" value="norecurrente"> No Recurrente
									</label>
								</div>
							</div>
					</div>
					<div class="form-group">
						<label for="recipient-name" class="control-label">Periodo</label>
						<p id="alertucboPeriodo" class="text-danger"
							style='display: none;'></p>
						
						<div class="form-inline">
							<div class="form-group hidden" id="divNoRecurrenteU">
								<span>Fecha</span> 
								<input type="text" class="form-control datePicker" id="utxtFecha">
							</div>
						</div>
							
						<div class="form-group hidden" id="divRecurrenteU">
							<select class="form-control cbo2" style="width: 100%;" id="ucboPeriodo">
								<option value="">--SELECCIONE--</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label for="recipient-name" class="control-label">Aviso
							Inicial (Dia(s) antes)</label>
						<p id="alertuAvisoInicial" class="text-danger"
							style='display: none;'></p>
						<input type="number" name="quantity" min="0" max="5"
							style="width: 100%;" class="form-control" id="uAvisoInicial">
					</div>

					<div class="form-group">
						<label for="recipient-name" class="control-label">Aviso
							Final (Dia(s) después)</label>
						<p id="alertuAvisoFinal" class="text-danger"
							style='display: none;'></p>
						<input type="number" name="quantity" min="0" max="5"
							style="width: 100%;" class="form-control" id="uAvisoFinal">
					</div>

					<p id="mensajeEdit" class="text-danger" style='display: none;'></p>

				</div>
				<div class="modal-footer">
					<a id="btnActualizar" class="btn btn-primary">
						<i class="fa fa-floppy-o"></i> Guardar
					</a>
					<a type="button" class="btn btn-danger" data-dismiss="modal">
						<i class="fa fa-reply"></i> Cerrar
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Fin Modal Editar --> <!-- INICIO TABLA RESULTADOS -->
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Resultados de Busqueda</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive" id="divTabla">

					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
	</div>
	<!-- FIN TABLA RESULTADOS --> </section><!-- /.content -->
	
	<!-- jQuery 2.2.4 -->
<%-- <script src="<%=request.getContextPath()%>/resources/jquery/js/jquery-2.2.4.min.js"></script> --%>
	
		<script type="text/javascript">
			$(document).ready(function() {
				
				var vTeam = document.getElementById('hdIdTeam').value;
				visualizar()
				refreshCombos();
				
// 				seleccionFrecuenciaNuevo();
// 				seleccionFrecuenciaActualizacion();
				
				$('#rdbiRecurrente').change(function(){
					seleccionFrecuenciaNuevo()
				});
				$('#rdbiNoRecurrente').change(function(){
					seleccionFrecuenciaNuevo()
				});
				
				$('#rdbuRecurrente').change(function(){
					seleccionFrecuenciaActualizacion()
				});
				$('#rdbuNoRecurrente').change(function(){
					seleccionFrecuenciaActualizacion()
				});
				
				
				
// 				$("#rdbiRecurrente").attr('checked', 'checked');
				$("#rdbiRecurrente").prop("checked", false);
				$("#rdbiRecurrente").prop("checked", true);
				$("#rdbuRecurrente").prop("checked", false);
				$("#rdbuRecurrente").prop("checked", true);
				
				seleccionFrecuenciaNuevo();
				seleccionFrecuenciaActualizacion();
				
// 				$("#rdbiRecurrente").attr('checked', 'checked');
// 				$("#rdbuRecurrente").attr('checked', 'checked');
// 			});
			
			$('#btnRegistrar1').click(function() {

								limpiarAlertasNew();
								
								$('#rdbiRecurrente').prop("checked");
								
								var icboTipo = $('#icboTipo').val();
								var iTarea = $('#iTarea').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
								var icboOwner = $('#icboOwner').val();
								var icboAprobador = $('#icboAprobador').val();
								var iFrecuencia = $('#iFrecuencia').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
								var iProgramacion = $('#iProgramacion').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
								var icboPeriodo = ($('#icboPeriodo').val() == "" || $('#icboPeriodo') == null) ? 0 : $('#icboPeriodo').val();
								var iAvisoInicial = $('#iAvisoInicial').val();
								var iAvisoFinal = $('#iAvisoFinal').val();
								var iSelPeriodo = ($('input[id=rdbiRecurrente]:checked', '#formSeleccionN').val() == 'recurrente' ? 'RECURRENTE' : $('input[id=rdbiNoRecurrente]:checked', '#formSeleccionN').val() == 'norecurrente' ? 'NORECURRENTE' : '');
								var iFecha = $('#itxtfecha_').val();
								
								var resultado;

								resultado = validarModalNew();
								
								console.log('valor resultado de validaciones '+ resultado);
		
								if (resultado == "0") {
									var src = "ServletTarea";
									$.post(src,
													{
														strAccion : "2",
														strTipo : icboTipo,
														strTarea : iTarea,
														strOwner : icboOwner,
														strAprobador : icboAprobador,
														strFrecuencia : iFrecuencia,
														strProgramacion : iProgramacion,
														strPeriodo : icboPeriodo,
														strAvisoInicial : iAvisoInicial,
														strAvisoFinal : iAvisoFinal,
														strSelPeriodo : iSelPeriodo,
														strFecha : iFecha,
														iTeam : vTeam
													},

													function(pdata) {
														var obj = JSON
																.parse(pdata);
														if (obj.RegistroTarea[0].codigo == "0") {
															document.getElementById('mensajeRegistrar').style.display = 'block';
															$("#mensajeRegistrar").text(obj.RegistroTarea[0].resultado);
														} else {
															visualizar();
															document.getElementById('mensajeRegistrar').style.display = 'none';
															$("#mensajeRegistrar").text("");
															$("#modalNew").modal('hide');
															activarAlertaConfirmacion('alertaConfirmacion');

														}
													});//Fin del POST
								} else { // resultado  == "1" -- se detectan errores
								}
								listarComboPeriodo();
							});
			//Fin registrar turno
			
			});
			
			function visualizar(){
				// Haciendo visible Modal con Barra de progreso 
				var $modal = $('.js-loading-bar');
				$modal.modal('show');
				
				var tabla = "<table id=\"example1\" class=\"display table table-hover\" "
					+ " style=\"font-size:12px; font-weight:bold; width:100%\"> "
					+ "	<thead class=\"bg-primary\">"
					+ "          <tr>"
					+ "            <th>N</th>"
					+ "            <th>Tipo</th>"
					+ "            <th>Tarea</th>"
					+ "            <th>Owner</th>"
					+ "            <th>Aprobador</th>"
					+ "            <th>Frecuencia</th>"
					+ "            <th>Programación</th>"
					+ "            <th>Periodo</th>"
					+ "            <th>Aviso Inicial</th>"
					+ "            <th>Aviso Final</th>"
					+ "            <th>Estado</th>"
					+ "            <th>Acción</th>";
					
	

			
			tabla += " </tr> </thead>"
			+ "	<tfoot"
			+ "          <tr>"
			+ "            <th>N</th>"
			+ "            <th>Tipo</th>"
			+ "            <th>Tarea</th>"
			+ "            <th>Owner</th>"
			+ "            <th>Aprobador</th>"
			+ "            <th>Frecuencia</th>"
			+ "            <th>Programación</th>"
			+ "            <th>Periodo</th>"
			+ "            <th>Aviso Inicial</th>"
			+ "            <th>Aviso Final</th>"
			+ "            <th>Estado</th>"
			+ "            <th>Acción</th>";
			
			
			tabla += "	      </tr>" + "	     </tfoot>" + "      </table>";

			document.getElementById("divTabla").innerHTML = tabla;

				listar();
			}
			
			
			function seleccionFrecuenciaNuevo(){
				if($('input[id=rdbiRecurrente]:checked', '#formSeleccionN').val()=="recurrente"){
					$('#divRecurrenteN').removeClass("hidden");
					$('#divNoRecurrenteN').removeClass("hidden");
					$('#divNoRecurrenteN').addClass("hidden");
// 					console.log('RECURRENTE ' + $('input[id=rdbRecurrente]:checked', '#formSeleccion').val());
				}
				else{
					$('#divNoRecurrenteN').removeClass("hidden");
					$('#divRecurrenteN').removeClass("hidden");
					$('#divRecurrenteN').addClass("hidden");
// 					console.log('RECURRENTE ' + $('input[id=rdbRecurrente]:checked', '#formSeleccion').val());
				}
			}
			
			function seleccionFrecuenciaActualizacion(){
				
				if($('input[id=rdbuRecurrente]:checked', '#formSeleccionU').val()=="recurrente"){
					$('#divRecurrenteU').removeClass("hidden");
					$('#divNoRecurrenteU').removeClass("hidden");
					$('#divNoRecurrenteU').addClass("hidden");
// 					console.log('RECURRENTE ' + $('input[id=rdbRecurrente]:checked', '#formSeleccion').val());
				}
				else{
					$('#divNoRecurrenteU').removeClass("hidden");
					$('#divRecurrenteU').removeClass("hidden");
					$('#divRecurrenteU').addClass("hidden");
// 					console.log('NO RECURRENTE ' + $('input[id=rdbNoRecurrente]:checked', '#formSeleccion').val());
				}
			}
			
// 			$eventSelect = $('#icboTipo');
			
			//$eventSelect.on("select2:select", function (e) { log("select2:select", e); });

			$('#icboOwner').change(function(){
				console.log($('#icboOwner').val());
				console.log(String($('#icboOwner').val()));
			});
			
			function limpiarModalFeedback() {
				document.getElementById("divHeader").style.display = 'block';
				document.getElementById("divEstrellas").style.display = 'block';
				document.getElementById("divComentario").style.display = 'none';
				document.getElementById("divAfirmativo").style.display = 'none';
				document.getElementById("divNegativo").style.display = 'none';
				document.getElementById("btnEnviarComentario").style.display = 'none';
				document.getElementById("btnCerrar").style.display = 'none';

				$("#iComentario").val("");
				$("#puntaje").text("");

				$('.star-rating .fa').removeClass('fa-star').addClass('fa-star-o');
			}

			
			$('#btnEnviarComentario').click(function() {
				var puntaje = $("#valorPuntaje").val();
				var comentario = $("#iComentario").val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
				var rutaPagina = $("#page").attr("title");
	
				var src = "ServletFeedBack";
				$.post(src,{
									strPuntaje : puntaje,
									strComentario : comentario,
									strRutaPagina : rutaPagina
								},
								function(pdata) {
									var obj = JSON.parse(pdata);
	
									if (obj.Resultado[0].codigo != ""
											|| obj.Resultado[0].codigo != 0) {
										document.getElementById("divEstrellas").style.display = 'none';
										document.getElementById("divComentario").style.display = 'none';
										document.getElementById("divAfirmativo").style.display = 'block';
										document.getElementById("divNegativo").style.display = 'none';
										document.getElementById("btnEnviarComentario").style.display = 'none';
										document.getElementById("btnCerrar").style.display = 'block';
										document.getElementById("divHeader").style.display = 'none';
									} else {
										document.getElementById("divEstrellas").style.display = 'none';
										document.getElementById("divComentario").style.display = 'none';
										document.getElementById("divAfirmativo").style.display = 'none';
										document.getElementById("divNegativo").style.display = 'block';
										document.getElementById("btnEnviarComentario").style.display = 'none';
										document.getElementById("btnCerrar").style.display = 'block';
										document.getElementById("divHeader").style.display = 'none';
									}
	
								});
			});

			function refreshCombos() {
				
				var vTeam = document.getElementById('hdIdTeam').value;
				listarComboPeriodo();
				
				listarComboOption('8', '#icboTipo');
				listarComboOption('8', '#ucboTipo');

				listarComboGrupo('list', '#ucboOwner',vTeam);
				listarComboGrupo('list', '#ucboAprobador',vTeam);

				listarComboGrupo('list', '#icboOwner',vTeam);
				listarComboGrupo('list', '#icboAprobador',vTeam);

				limpiarModales();
			}

			function listarComboPeriodo() {

				$("#ucboPeriodo option").remove();
				$("#ucboPeriodo").append($('<option>', {
					value : "",
					text : " --SELECCIONE-- "
				}));

				$("#icboPeriodo option").remove();
				$("#icboPeriodo").append($('<option>', {
					value : "",
					text : " --SELECCIONE-- "
				}));

				var src = "ServletPeriodo";
				$.post(src, {
					strAccion : "2"
				}, function(pdata) {
					var obj = JSON.parse(pdata);
					for (i = 0; i < obj.ListaPeriodo.length; i++) {

						$('#ucboPeriodo').append($('<option>', {
							value : obj.ListaPeriodo[i].idPeriodo,
							text : obj.ListaPeriodo[i].descripcion
						}));
						$('#icboPeriodo').append($('<option>', {
							value : obj.ListaPeriodo[i].idPeriodo,
							text : obj.ListaPeriodo[i].descripcion
						}));
					}
				});

			}// Fin funcion listarComboPeriodo

			function listarComboOption(pAccion, pIdCombo) {
				//Combo
				$(pIdCombo + " option").remove();
				$(pIdCombo).append($('<option>', {
					value : "",
					text : " --SELECCIONE-- "
				}));

				var src = "ServletOptionSCHPM";
				$.post(src, {
					strAccion : pAccion
				}, function(pdata) {

					var obj = JSON.parse(pdata);

					for (i = 0; i < obj.ListaOption.length; i++) {

						$(pIdCombo).append($('<option>', {
							value : obj.ListaOption[i].idOption,
							text : obj.ListaOption[i].descripcion
						}));
					}
				});
			} // Fin funcion listarComboOption
			
			
			function listarComboGrupo(pAccion,pIdCombo,vTeam) {
				//Combo
				$(pIdCombo + " option").remove();
				$(pIdCombo).append($('<option>', {
					value : "",
					text : " --SELECCIONE-- "
				}));

				var src = "ServletWPersonal";
				$.post(src, {

					strOperation : pAccion,iTeam : vTeam
				}, function(pdata) {

					var obj = JSON.parse(pdata);

					for (i = 0; i < obj.reporte.length; i++) {

						$(pIdCombo).append($('<option>', {
							value : obj.reporte[i].idPersonal,
							text : obj.reporte[i].nombre + ' ' + obj.reporte[i].apPaterno
						}));
					}
				});
			} // Fin funcion listarComboGrupo

			function limpiarAlertasEdit() {
				document.getElementById('alertucboTipo').style.display = 'none';
				document.getElementById('alertuTarea').style.display = 'none';
				document.getElementById('alertucboOwner').style.display = 'none';
				document.getElementById('alertucboAprobador').style.display = 'none';
				document.getElementById('alertuFrecuencia').style.display = 'none';
				document.getElementById('alertuProgramacion').style.display = 'none';
				document.getElementById('alertucboPeriodo').style.display = 'none';
				document.getElementById('alertuAvisoInicial').style.display = 'none';
				document.getElementById('alertuAvisoFinal').style.display = 'none';
			} // Fin funcion limpiarAlertasEdit

			function limpiarAlertasNew() {
				document.getElementById('alerticboTipo').style.display = 'none';
				document.getElementById('alertiTarea').style.display = 'none';
				document.getElementById('alerticboOwner').style.display = 'none';
				document.getElementById('alerticboAprobador').style.display = 'none';
				document.getElementById('alertiFrecuencia').style.display = 'none';
				document.getElementById('alertiProgramacion').style.display = 'none';
				document.getElementById('alerticboPeriodo').style.display = 'none';
				document.getElementById('alertiAvisoInicial').style.display = 'none';
				document.getElementById('alertiAvisoFinal').style.display = 'none';
			} // Fin funcion limpiarAlertasEdit

			function limpiarModales() {
				$('#uIdtarea').val('');
				$('#uTarea').val('');
				$('#uFrecuencia').val('');
				$('#uProgramacion').val('');
				$('#uAvisoInicial').val(0);
				$('#uAvisoFinal').val(0);

				$('#iIdtarea').val('');
				$('#iTarea').val('');
				$('#iFrecuencia').val('');
				$('#iProgramacion').val('');
				$('#iAvisoInicial').val(0);
				$('#iAvisoFinal').val(0);
			}

			function validarModalEdit() {

				limpiarAlertasEdit();
				var flag = 0; // 0 validacion OK, 1 validación con alertas

				var uIdtarea = $('#uIdtarea').val();
				var ucboTipo = $('#ucboTipo').val();
				var uTarea = $('#uTarea').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
				var ucboOwner = $('#ucboOwner').val();
				var ucboAprobador = $('#ucboAprobador').val();
				var uFrecuencia = $('#uFrecuencia').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
				var uProgramacion = $('#uProgramacion').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
				var ucboPeriodo = $('#ucboPeriodo').val();
				var selSeleccion = $('input[id=rdbuRecurrente]:checked', '#formSeleccionU').val()=="recurrente" ? "RECURRENTE" : $('input[id=rdbuNoRecurrente]:checked', '#formSeleccionU').val() ? "NORECURRENTE" : "";
				var ufecha = $('#utxtFecha').val();
				var uAvisoInicial = $('#uAvisoInicial').val();
				var uAvisoFinal = $('#uAvisoFinal').val();
				
// 				alert(selSeleccion);
				
				if (uIdtarea == "" || uIdtarea == null) {
					flag = 1;
					alert("Error al detectar uIdtarea (ID TAREA)");
				}
				if (ucboTipo == "" || ucboTipo == null) {
					flag = 1;
					document.getElementById('alertucboTipo').style.display = 'block';
					$("#alertucboTipo").text("*Este campo es obligatorio");
				}
				if (uTarea == "" || uTarea == null) {
					flag = 1;
					document.getElementById('alertuTarea').style.display = 'block';
					$("#alertuTarea").text("*Este campo es obligatorio");
				}
				if (ucboOwner == "" || ucboOwner == null) {
					flag = 1;
					document.getElementById('alertucboOwner').style.display = 'block';
					$("#alertucboOwner").text("*Este campo es obligatorio");
				}
				if (ucboAprobador == "" || ucboAprobador == null) {
					flag = 1;
					document.getElementById('alertucboAprobador').style.display = 'block';
					$("#alertucboAprobador").text("*Este campo es obligatorio");
				}
				if (uFrecuencia == "" || uFrecuencia == null) {
					flag = 1;
					document.getElementById('alertuFrecuencia').style.display = 'block';
					$("#alertuFrecuencia").text("*Este campo es obligatorio");
				}
				if (uProgramacion == "" || uProgramacion == null) {
					flag = 1;
					document.getElementById('alertuProgramacion').style.display = 'block';
					$("#alertuProgramacion").text("*Este campo es obligatorio");
				}
				if(selSeleccion == "RECURRENTE" && (ucboPeriodo == "" || ucboPeriodo == null)) {
					console.log("RECURRENTE");
					flag = 1;
					document.getElementById('alertucboPeriodo').style.display = 'block';
					$("#alertucboPeriodo").text("*Este campo es obligatorio");
				}
				if(selSeleccion == "NORECURRENTE" && (ufecha == "" || ufecha == null)) {
					console.log("NORECURRENTE" + " ==> " + ufecha);
					flag = 1;
					document.getElementById('alertucboPeriodo').style.display = 'block';
					$("#alertucboPeriodo").text("*Este campo es obligatorio_");
				}
				if (uAvisoInicial == "" || uAvisoInicial == null) {
					flag = 1;
					document.getElementById('alertuAvisoInicial').style.display = 'block';
					$("#alertuAvisoInicial").text("*Este campo es obligatorio");
				}
				if (uAvisoFinal == "" || uAvisoFinal == null) {
					flag = 1;
					document.getElementById('alertuAvisoFinal').style.display = 'block';
					$("#alertuAvisoFinal").text("*Este campo es obligatorio");
				}
				
				console.log(flag);

				return flag;
			}// Fin funcion validarModalEdit

			function validarModalNew() {

				limpiarAlertasNew();
				var flag = 0; // 0 validacion OK, 1 validación con alertas

				var icboTipo = $('#icboTipo').val();
				var iTarea = $('#iTarea').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
				var icboOwner = $('#icboOwner').val();
				var icboAprobador = $('#icboAprobador').val();
				var iFrecuencia = $('#iFrecuencia').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
				var iProgramacion = $('#iProgramacion').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
				var icboPeriodo = $('#icboPeriodo').val();
				var iselSeleccion = $('input[id=rdbiRecurrente]:checked', '#formSeleccionN').val()=="recurrente" ? "RECURRENTE" : "NORECURRENTE";
				var ifecha = document.getElementById('itxtfecha_').value; // $('#itxtfecha_').val();
				var iAvisoInicial = $('#iAvisoInicial').val();
				var iAvisoFinal = $('#iAvisoFinal').val();
				//console.log('==>' + iselSeleccion + ' | ' + ifecha);
				
				
				if (icboTipo == "" || icboTipo == null) {
					flag = 1;
					document.getElementById('alerticboTipo').style.display = 'block';
					$("#alerticboTipo").text("*Este campo es obligatorio");
				}
				if (iTarea == "" || iTarea == null) {
					flag = 1;
					document.getElementById('alertiTarea').style.display = 'block';
					$("#alertiTarea").text("*Este campo es obligatorio");
				}
				if (icboOwner == "" || icboOwner == null) {
					flag = 1;
					document.getElementById('alerticboOwner').style.display = 'block';
					$("#alerticboOwner").text("*Este campo es obligatorio");
				}
				if (icboAprobador == "" || icboAprobador == null) {
					flag = 1;
					document.getElementById('alerticboAprobador').style.display = 'block';
					$("#alerticboAprobador").text("*Este campo es obligatorio");
				}
				if (iFrecuencia == "" || iFrecuencia == null) {
					flag = 1;
					document.getElementById('alertiFrecuencia').style.display = 'block';
					$("#alertiFrecuencia").text("*Este campo es obligatorio");
				}
				if (iProgramacion == "" || iProgramacion == null) {
					flag = 1;
					document.getElementById('alertiProgramacion').style.display = 'block';
					$("#alertiProgramacion").text("*Este campo es obligatorio");
				}
				
				
				if(iselSeleccion == "RECURRENTE" && (icboPeriodo == "" || icboPeriodo == null)) {
					flag = 1;
					document.getElementById('alerticboPeriodo').style.display = 'block';
					$("#alerticboPeriodo").text("*Este campo es obligatorio");
				}
				if(iselSeleccion == "NORECURRENTE" && (ifecha == "" || ifecha == null)) {
					flag = 1;
					document.getElementById('alertucboPeriodo').style.display = 'block';
					$("#alertucboPeriodo").text("*Este campo es obligatorio_");
				}
				
				if (iAvisoInicial == "" || iAvisoInicial == null) {
					flag = 1;
					document.getElementById('alertiAvisoInicial').style.display = 'block';
					$("#alertiAvisoInicial").text("*Este campo es obligatorio");
				}
				if (iAvisoFinal == "" || iAvisoFinal == null) {
					flag = 1;
					document.getElementById('alertiAvisoFinal').style.display = 'block';
					$("#alertiAvisoFinal").text("*Este campo es obligatorio");
				}

				return flag;
			}// Fin funcion validarModalNew

			// Inicio registrar turno
			

			//Inicio Actualizar Turno
			$('#btnActualizar').click(function() {
				

								limpiarAlertasEdit();

								var uIdtarea = $('#uIdtarea').val();
								var ucboTipo = $('#ucboTipo').val();
								var uTarea = $('#uTarea').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
								var ucboOwner = $('#ucboOwner').val();
								var ucboAprobador = $('#ucboAprobador').val();
								var uFrecuencia = $('#uFrecuencia').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
								var uProgramacion = $('#uProgramacion').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
								var ucboPeriodo = ($('#ucboPeriodo').val() == "" || $('#ucboPeriodo').val() == null) ? 0 : $('#ucboPeriodo').val();
								var uAvisoInicial = $('#uAvisoInicial').val();
								var uAvisoFinal = $('#uAvisoFinal').val();
								var uSelPeriodo = ($('input[id=rdbuRecurrente]:checked', '#formSeleccionU').val() == 'recurrente' ? 'RECURRENTE' : $('input[id=rdbuNoRecurrente]:checked', '#formSeleccionU').val() == 'norecurrente' ? 'NORECURRENTE' : '');
								var uFecha = $('#utxtFecha').val();
								
								var resultado;

								resultado = validarModalEdit();
								
								console.log(resultado + ' - btnActualizar');

								if (resultado == "0") {
									var src = "ServletTarea";
									$.post(src,{
														strAccion : "3",
														strIdtarea : uIdtarea,
														strTipo : ucboTipo,
														strTarea : uTarea,
														strOwner : ucboOwner,
														strAprobador : ucboAprobador,
														strFrecuencia : uFrecuencia,
														strProgramacion : uProgramacion,
														strPeriodo : ucboPeriodo,
														strAvisoInicial : uAvisoInicial,
														strAvisoFinal : uAvisoFinal,
														strSelPeriodo : uSelPeriodo,
														strFecha : uFecha,
														iTeam : vTeam
													},
													function(pdata) {
														var obj = JSON.parse(pdata);
														if (obj.ActualizarTarea[0].codigo == "0") {
															document.getElementById('mensajeEdit').style.display = 'block';
															$("#mensajeEdit")
																	.text(
																			obj.ActualizarTarea[0].resultado);
														} else {
															visualizar();
															document.getElementById('mensajeEdit').style.display = 'none';
															$("#mensajeEdit").text("");
															$("#modalEdit").modal('hide');
															activarAlertaConfirmacion('alertaConfirmacion');

														}
													});//Fin del POST
								
								} else { // resultado  == "1" -- se detectan errores
								}
								listarComboPeriodo();
							});
			//Fin Actualizar Tarea

			function modalEditar(pIdtarea, pcboTipo, pTarea, pOwner,
					pAprobador, pFrecuencia, pProgramacion, pPeriodo,
					pAvisoInicial, pAvisoFinal, selperiodo) {
           
				limpiarAlertasEdit();
				limpiarModales();
				seleccionFrecuenciaActualizacion();
                console.log('pIdtarea: '+pIdtarea+ ' pcboTipo: '+pcboTipo
                		  +' pTarea: '+pTarea+' pOwner: '+pOwner+
    					  +' pAprobador: '+pAprobador+ 'pFrecuencia: '+pFrecuencia+
    					  +' pProgramacion: '+pProgramacion+ 'pPeriodo: '+pPeriodo+
    					  +' pAvisoInicial:'+pAvisoInicial+' pAvisoFinal: '+pAvisoFinal+' selperiodo: '+selperiodo);
				$("#uIdtarea").val(pIdtarea);
				$("#ucboTipo").val(pcboTipo).trigger('change');
				$("#uTarea").val(pTarea);
				$("#ucboOwner").val(JSON.parse(pOwner)).trigger('change');
				
				console.log(pAprobador);
				
				$("#ucboAprobador").val(JSON.parse(pAprobador)).trigger('change');
				$("#uFrecuencia").val(pFrecuencia);
				$("#uProgramacion").val(pProgramacion);
				$("#ucboPeriodo").val(pPeriodo).trigger('change');
				
				/* if(selperiodo == 'RECURRENTE'){
					$("#rdbuRecurrente").prop("checked", false);
					$("#rdbuRecurrente").prop("checked", true);
				}
				else{
					$("#rdbuNoRecurrente").prop("checked", false);
					$("#rdbuNoRecurrente").prop("checked", true);
					$("#utxtFecha").val($("#ucboPeriodo option:selected").text());
				} */
				$('#rdbiRecurrente').prop("checked");
// 				console.log(selperiodo + ' == ' + $("#ucboPeriodo option:selected").text());
				
				$("#uAvisoInicial").val(parseInt(pAvisoInicial));
				$("#uAvisoFinal").val(parseInt(pAvisoFinal)).val();

			}// Fin funcion modalEditar

			function editarEstado(pIdTarea, pDescripcion, pEstado) {

				if (pEstado == "0") {

					if (confirm('¿Está seguro que desea DESACTIVAR la tarea "'
							+ pDescripcion + '"?')) {

						var src = "ServletTarea";
						//Inicio POST actualizar estado Tarea
						$
								.post(
										src,
										{
											strAccion : "4",
											strIdtarea : pIdTarea,
											strTarea : pDescripcion,
											strEstado : pEstado
										},
										function(pdata) {
											var obj = JSON.parse(pdata);
											if (obj.ActualizarTareaEstado[0].codigo == "0") {
												activarAlertaConfirmacion('alertaNegativa');
												visualizar();
											} else {
												activarAlertaConfirmacion('alertaConfirmacion');
												visualizar();
											}
										});
						//Fin Actualizar estado Turno
					} else {
						return false;

					}
				} else {

					if (confirm('¿Está seguro que desea ACTIVAR la Tarea "'
							+ pDescripcion + '"?')) {

						var src = "ServletTarea";
						//Inicio POST actualizar estado Turno
						$.post(src,{
											strAccion : "4",
											strIdtarea : pIdTarea,
											strTarea : pDescripcion,
											strEstado : pEstado
										},
										function(pdata) {
											var obj = JSON.parse(pdata);
											if (obj.ActualizarTareaEstado[0].codigo == "0") {
												activarAlertaConfirmacion('alertaNegativa');
												visualizar();
											} else {
												activarAlertaConfirmacion('alertaConfirmacion');
												visualizar();
											}
										});
						//Fin Actualizar estado Turno
					} else {
						return false;

					}

				}
			}

			function validar(e) {
				tecla = (document.all) ? e.keyCode : e.which;
				patron = /[\x5C'"]/;
				te = String.fromCharCode(tecla);
				return !patron.test(te);
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
				var src = "ServletTarea";
				//Inicio POST para completar listar información en la tabla
				$.post(src,{strAccion : "1",iTeam : vTeam},
								function(pdata) {

									var obj = JSON.parse(pdata);

									var datatabla1 = [];
									var numeracion = 0;

									if (obj.ListaTareas[0].idTarea == "") {
										//Ocultar Modal con barra de progreso
										var $modal = $('.js-loading-bar');
										$modal.modal('hide');

									} else {

										for (i = 0; i < obj.ListaTareas.length; i++) {

											numeracion = numeracion + 1;
											var arr = [];

											//captura de datos
											var idTarea = obj.ListaTareas[i].idTarea;
											var idTipoTarea = obj.ListaTareas[i].idTipoTarea;
											var tipoTarea = obj.ListaTareas[i].tipoTarea;
											var tarea = obj.ListaTareas[i].tarea;
											var idOwner = obj.ListaTareas[i].idOwner;
											var owner = obj.ListaTareas[i].owner;
											var idAprobador = obj.ListaTareas[i].idAprobador;
											var aprobador = obj.ListaTareas[i].aprobador;
											var frecuencia = obj.ListaTareas[i].frecuencia;
											var programacion = obj.ListaTareas[i].programacion;
											var idPeriodo = obj.ListaTareas[i].idPeriodo;
											var periodo = obj.ListaTareas[i].periodo;
											var selperiodo = obj.ListaTareas[i].selPeriodo;
											var avisoIn = obj.ListaTareas[i].avisoIn;
											var avisoFin = obj.ListaTareas[i].avisoFin;
											var estado = obj.ListaTareas[i].estado;
											var btnEstado;

											if (estado == "1") {
												estado = "ACTIVO";
												btnEstado = "<button title=\"Desactivar Tarea\" type=\"button\" class=\"btn bg-red\"  onclick=\"editarEstado('"
														+ idTarea
														+ "','"
														+ tarea
														+ "','0')\"><i class=\"fa fa-close\"></i></button>&nbsp;";
											} else {
												estado = "INACTIVO";
												btnEstado = "<button title=\"Activar Tarea\" type=\"button\" class=\"btn bg-green\"  onclick=\"editarEstado('"
														+ idTarea
														+ "','"
														+ tarea
														+ "','1')\"><i class=\"fa fa-check\"></i></button>&nbsp;";
											}

											//Generación de cadena para tabla  turno
											arr.push(numeracion);
											arr.push(tipoTarea);
											arr.push(tarea);
											arr.push(owner);
											arr.push(aprobador);
											arr.push(frecuencia);
											arr.push(programacion);
											arr.push(periodo);
											arr.push(avisoIn);
											arr.push(avisoFin);
											arr.push(estado);

											arr.push("<button title=\"Editar Tarea\" type=\"button\" class=\"btn bg-yellow\" data-toggle=\"modal\" data-target=\"#modalEdit\" "
															+ " onclick=\"modalEditar('"
															+ idTarea
															+ "','"
															+ idTipoTarea
															+ "','"
															+ tarea
															+ "','"
															+ idOwner
															+ "','"
															+ idAprobador
															+ "','"
															+ frecuencia
															+ "','"
															+ programacion
															+ "','"
															+ idPeriodo
															+ "','"
															+ avisoIn
															+ "','"
															+ avisoFin
															+ "','"
															+ selperiodo
															+ "' )\" ><i class=\"fa fa-edit\"></i></button>"
															+ btnEstado);

											datatabla1.push(arr);
										}
									}

									// DataTable
// 									var table = $('#example1').DataTable();
// 									table.destroy();

									
									
									var table = $('#example1').DataTable(
													{
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
														dom: "<'row'<'col-sm-6'B><'col-sm-6 text-right'f>>" +
														"<'row'<'col-sm-12'tr>>" +
														"<'row'<'col-sm-5'i><'col-sm-7 text-right'p>>",
														data : datatabla1,
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
														responsive : true
													});
									
									$('#example1 tfoot th').each( function () {
								        var title = $(this).text();
								        $(this).html( '<input type="text" placeholder="'+title+'" />' );
								    } );
									

									// DataTable
									// 					    var table = $('#example1').DataTable();
									// 					    table.destroy();

									// 					  $('#example1').DataTable( {
									// 					    	language: {
									// 					            searchPlaceholder: "Buscar...",
									// 					            search : '<i class="fa fa-search fa-lg">',

									// 					        },
									// 					        dom: 'Bfrtip',
									// 					        lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
									// 					        data : datatabla,
									// 					        buttons : [
									// 													{
									// 													extend : 'pageLength',
									// 													text : '<i class="fa fa-list-ol" aria-hidden="true"></i> Mostrar',
									// 												},
									// 												{
									// 													extend : 'excelHtml5',
									// 													text : '<i class="fa fa-file-excel-o"></i> Descargar en Excel',
									// 													customize : function(
									// 															xlsx) {
									// 														var sheet = xlsx.xl.worksheets['reporte.xml'];

									// 														// jQuery selector to add a border
									// 														$('row c[r*="10"]',sheet).attr('s','25');
									// 													}
									// 												} ]
									// 					    } );

									// Setup - add a text input to each footer cell
									// 					    $('#example1 .filters th').each( function () {
									// 					        var title = $('#example1 thead th').eq( $(this).index() ).text();
									// 					        $(this).html( '<input type="text" placeholder="Buscar '+title+'" style="width:100%"  />' );
									// 					    } );

									// 					table = $('#example1').DataTable();

									// Apply the search
									// 				    table.columns().eq( 0 ).each( function ( colIdx ) {
									// 				        $( 'input', $('.filters th')[colIdx] ).on( 'keyup change', function () {
									// 				            table
									// 				                .column( colIdx )
									// 				                .search( this.value )
									// 				                .draw();
									// 				        } );
									// 				    } );
									
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

									//Ocultar Modal con barra de progreso
									var $modal = $('.js-loading-bar');
									$modal.modal('hide');

								});

				// Fin del POST listar tabla

			}
		</script> 
		<script type="text/javascript">
		$('.clockpicker').clockpicker({
			donetext : 'OK'
		});
		</script> 
		<script type="text/javascript">
		//Setup Barra de progreso
		this.$('.js-loading-bar').modal({
			backdrop : 'static',
			show : false
		});
		</script>
</body>
</html>
