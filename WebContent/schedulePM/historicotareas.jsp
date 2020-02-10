<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

<!--      <meta charset="UTF-8">  -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Librerias para Kartik -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/kartik-v-bootstrap-fileinput-d66e684/css/fileinput.css"
	media="all" />

<!-- Librerias para toggle -->
<link rel="stylesheet" type="text/css"
	href="http://www.bootstraptoggle.com/css/bootstrap-toggle.css">
<script src="http://www.bootstraptoggle.com/js/bootstrap-toggle.js"
	type="text/javascript"></script>

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
	<aside class="right-side "> <!-- Content Header (Page header) -->

	<section class="content-header">
	<h1>
		Tareas Aprobadas
	</h1>
	<ol class="breadcrumb">
		<li><a href="index.php"><i class="fa fa-th-large"></i>
				Schedule Gobierno</a></li>
		<li class="active">Tareas Aprobadas</li>
	</ol>
	</section> <!-- Main content --> <section id="page"
		title="Schedule Gobierno / Tareas Aprobadas" class="content">
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

	<!--     Inicio      Modal Editar                                                       -->
	<div class="modal fade" id="modalEdit" role="dialog"
		aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #68DFF0">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLongTitle">
						<a style="color: white">Archivo adjunto&nbsp;&nbsp;</a><a
							style="color: red; font-weight: bold;"></a>
					</h4>
				</div>
				<div class="modal-body">

					<input type="hidden" style="width: 100%;" class="form-control"
						id="pIdTareaGenerada"> <input type="hidden"
						style="width: 100%;" class="form-control" id="pIdFile"> <input
						type="hidden" style="width: 100%;" class="form-control"
						id="pPerfil">
					</hr>
					<label>Adjuntar nuevo archivo:</label> <input id="fileEdit"
						class="file" multiple="true" data-show-upload="false"
						data-show-caption="true" type="file" name="fileArchivo"><br>
					<br>
					<small>* Solo se permiten los formatos (xls, xlsx, doc,
						docx, ppt, pptx, jpeg, txt, pdf)</small><br>
					<button id="btnActualizar" type="submit"
						class="btn btn-primary btn-sm">
						<i class="fa fa-floppy-o"></i> Guardar
					</button>
					<p id="pErrorFile" class="text-danger" style='display: none;'></p>
					</hr>
					<br>
					<br>
					<table style="width: 100%;" class="table">
						<thead>
							<tr>
								<th>#</th>
								<th colspan="3">Descripción</th>
								<th colspan="2" align="center"><center>Acción</center></th>
							</tr>
						</thead>
						<tbody id="tablaFileAdjunto">

						</tbody>
					</table>

					</hr>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">
						<i class="fa fa-reply"></i> Cerrar
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Fin Modal Editar -->
	
	<div class="row">
		<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
			<div class="form-inline">
			  	<div class="form-group">
				    <label> Seleccione Filtro: </label>
				</div>
				<div class="form-group" style="width: 152px;">
				    <select class="select2" id="cboFiltro"></select>
				</div>
				<div class="form-group" id="divFiltro" style="display: none;">
					<div class="form-group" style="margin-left: 12px;">
					    <label> Fechas: </label>
					</div>
				
					<div class="form-group validar"><input type="text" class="form-control datePicker" id="txtInicio"></div>
					<div class="form-group validar"><input type="text" class="form-control datePicker" id="txtFin"></div>
				</div>
					
				<div class="form-group">
					<a id="btnBuscar" title="Buscar" href="#" class="btn btn-sm btn-primary"><i class="fa fa-search"></i> Filtrar</a>
				</div>
			</div>
		</div>
	</div>

	<br>
	<br>
	<!-- INICIO TABLA RESULTADOS -->
	<div class="row">
		<div class="col-md-12">
			<div class="box">
				<div class="box-header">
					<h3 class="box-title">Resultados de Busqueda</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="table-responsive" id="divTabla"></div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
	</div>
	<!-- FIN TABLA RESULTADOS --> </section><!-- /.content --> <!--         Boton feedback -->
	<div id="feedback">
		<a href="#" type="button" class="btn btn-info btn-lg"
			data-toggle="modal" data-target="#myModal"
			onclick="limpiarModalFeedback()"> <img
			src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz48IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPjxzdmcgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgeD0iMHB4IiB5PSIwcHgiIHdpZHRoPSI5LjI5OXB4IiBoZWlnaHQ9IjUwLjYyNXB4IiB2aWV3Qm94PSIwIDAgOS4yOTkgNTAuNjI1IiBlbmFibGUtYmFja2dyb3VuZD0ibmV3IDAgMCA5LjI5OSA1MC42MjUiIHhtbDpzcGFjZT0icHJlc2VydmUiPjxnPjxwYXRoIGZpbGw9IiNGRkZGRkYiIGQ9Ik0zLjUxNiw0Ni44N3YxLjYzNWg1LjY2N3YwLjk3NEgzLjUxNnYxLjE0N2gtMC40NGwtMC4zNTItMS4xNDdIMi4zNjdDMC43ODksNDkuNDc4LDAsNDguNzg4LDAsNDcuNDA5YzAtMC4zNCwwLjA2OC0wLjczOCwwLjIwNS0xLjE5NWwwLjc3OSwwLjI1MmMtMC4xMjEsMC4zNzUtMC4xODIsMC42OTUtMC4xODIsMC45NjFjMCwwLjM2NywwLjEyMiwwLjY0LDAuMzY2LDAuODE0YzAuMjQ0LDAuMTc2LDAuNjM2LDAuMjY0LDEuMTc1LDAuMjY0SDIuNzZWNDYuODdIMy41MTZ6Ii8+PHBhdGggZmlsbD0iI0ZGRkZGRiIgZD0iTTkuMjk5LDQyLjk4NWMwLDAuOTQ5LTAuMjg5LDEuNjk3LTAuODY2LDIuMjQ2Yy0wLjU3OCwwLjU0OS0xLjM4MiwwLjgyNC0yLjQwOCwwLjgyNGMtMS4wMzYsMC0xLjg1Ny0wLjI1Ni0yLjQ2Ny0wLjc2NmMtMC42MS0wLjUxMS0wLjkxNC0xLjE5My0wLjkxNC0yLjA1NGMwLTAuODA1LDAuMjY1LTEuNDQsMC43OTQtMS45MDljMC41MjktMC40NywxLjIyOC0wLjcwMywyLjA5NS0wLjcwM2gwLjYxNXY0LjQyNGMwLjc1NC0wLjAyMSwxLjMyNi0wLjIxMSwxLjcxNy0wLjU3MlM4LjQ1LDQzLjYwNiw4LjQ1LDQyLjk1YzAtMC42OTEtMC4xNDUtMS4zNzUtMC40MzQtMi4wNTFoMC44NjZjMC4xNDgsMC4zNDQsMC4yNTUsMC42NjgsMC4zMTksMC45NzVDOS4yNjcsNDIuMTgxLDkuMjk5LDQyLjU1MSw5LjI5OSw0Mi45ODV6IE0zLjQ1Nyw0My4yNDljMCwwLjUxNywwLjE2OCwwLjkyNiwwLjUwNCwxLjIzMnMwLjgwMSwwLjQ4OCwxLjM5NiwwLjU0M3YtMy4zNTdjLTAuNjEzLDAtMS4wODMsMC4xMzgtMS40MSwwLjQxQzMuNjIxLDQyLjM1LDMuNDU3LDQyLjc0MSwzLjQ1Nyw0My4yNDl6Ii8+PHBhdGggZmlsbD0iI0ZGRkZGRiIgZD0iTTkuMjk5LDM2LjI1MmMwLDAuOTQ5LTAuMjg5LDEuNjk3LTAuODY2LDIuMjQ2Yy0wLjU3OCwwLjU0OS0xLjM4MiwwLjgyNC0yLjQwOCwwLjgyNGMtMS4wMzYsMC0xLjg1Ny0wLjI1Ni0yLjQ2Ny0wLjc2NmMtMC42MS0wLjUxLTAuOTE0LTEuMTkzLTAuOTE0LTIuMDUzYzAtMC44MDUsMC4yNjUtMS40NDEsMC43OTQtMS45MXMxLjIyOC0wLjcwMywyLjA5NS0wLjcwM2gwLjYxNXY0LjQyNGMwLjc1NC0wLjAyLDEuMzI2LTAuMjExLDEuNzE3LTAuNTcyczAuNTg2LTAuODY5LDAuNTg2LTEuNTI1YzAtMC42OTEtMC4xNDUtMS4zNzUtMC40MzQtMi4wNTFoMC44NjZjMC4xNDgsMC4zNDQsMC4yNTUsMC42NjgsMC4zMTksMC45NzZTOS4yOTksMzUuODE5LDkuMjk5LDM2LjI1MnogTTMuNDU3LDM2LjUxNmMwLDAuNTE2LDAuMTY4LDAuOTI2LDAuNTA0LDEuMjMyYzAuMzM2LDAuMzA4LDAuODAxLDAuNDg4LDEuMzk2LDAuNTQzdi0zLjM1N2MtMC42MTMsMC0xLjA4MywwLjEzNy0xLjQxLDAuNDFDMy42MjEsMzUuNjE4LDMuNDU3LDM2LjAwOCwzLjQ1NywzNi41MTZ6Ii8+PHBhdGggZmlsbD0iI0ZGRkZGRiIgZD0iTTguMzE5LDI3Ljg2MnYwLjA1M2MwLjY1MiwwLjQ0OSwwLjk3OSwxLjEyMSwwLjk3OSwyLjAxN2MwLDAuODQtMC4yODYsMS40OTMtMC44NiwxLjk2UzcuMDQ3LDMyLjU5LDUuOTg5LDMyLjU5Yy0xLjA1OCwwLTEuODgxLTAuMjMzLTIuNDY3LTAuNzAyYy0wLjU4Ni0wLjQ3LTAuODc5LTEuMTIxLTAuODc5LTEuOTU3YzAtMC44NzEsMC4zMTYtMS41MzksMC45NDktMi4wMDVWMjcuODVsLTAuNDYzLDAuMDQxbC0wLjQ1MSwwLjAyM0gwLjA2NHYtMC45NzRoOS4xMTd2MC43OTFMOC4zMTksMjcuODYyeiBNOC40ODMsMjkuODA3YzAtMC42NjQtMC4xOC0xLjE0Ni0wLjU0MS0xLjQ0NHMtMC45NDQtMC40NDgtMS43NS0wLjQ0OEg1Ljk4N2MtMC45MDksMC0xLjU1OSwwLjE1MS0xLjk0NywwLjQ1NWMtMC4zODgsMC4zMDMtMC41ODMsMC43ODUtMC41ODMsMS40NDljMCwwLjU3LDAuMjIyLDEuMDA4LDAuNjY1LDEuMzExUzUuMTksMzEuNTgzLDYsMzEuNTgzYzAuODE5LDAsMS40MzgtMC4xNDksMS44NTYtMC40NTFDOC4yNzQsMzAuODMxLDguNDgzLDMwLjM4OSw4LjQ4MywyOS44MDd6Ii8+PHBhdGggZmlsbD0iI0ZGRkZGRiIgZD0iTTIuNjU0LDIxLjg5MWMwLTAuODQ0LDAuMjg4LTEuNDk5LDAuODY0LTEuOTY2YzAuNTc2LTAuNDY3LDEuMzkyLTAuNywyLjQ0Ni0wLjdjMS4wNTUsMCwxLjg3NCwwLjIzNSwyLjQ1OCwwLjcwNmMwLjU4NCwwLjQ3MSwwLjg3NiwxLjEyNCwwLjg3NiwxLjk2YzAsMC40MTgtMC4wNzYsMC44LTAuMjMsMS4xNDZjLTAuMTU0LDAuMzQ2LTAuMzkzLDAuNjM2LTAuNzEzLDAuODd2MC4wN2wwLjgyNiwwLjIwNXYwLjY5N0gwLjA2NHYtMC45NzNoMi4yMTVjMC40OTYsMCwwLjk0MSwwLjAxNiwxLjMzNiwwLjA0N3YtMC4wNDdDMi45NzUsMjMuNDU0LDIuNjU0LDIyLjc4MiwyLjY1NCwyMS44OTF6IE0zLjQ2OSwyMi4wMzJjMCwwLjY2NCwwLjE5LDEuMTQzLDAuNTcxLDEuNDM2czEuMDIyLDAuNDM5LDEuOTI1LDAuNDM5YzAuOTAzLDAsMS41NDgtMC4xNSwxLjkzNy0wLjQ1MWMwLjM5LTAuMzAxLDAuNTg0LTAuNzgzLDAuNTg0LTEuNDQ3YzAtMC41OTgtMC4yMTktMS4wNDMtMC42NTMtMS4zMzZzLTEuMDYyLTAuNDM5LTEuODc4LTAuNDM5Yy0wLjgzNiwwLTEuNDU5LDAuMTQ2LTEuODY5LDAuNDM5UzMuNDY5LDIxLjQxOCwzLjQ2OSwyMi4wMzJ6Ii8+PHBhdGggZmlsbD0iI0ZGRkZGRiIgZD0iTTkuMTgzLDEzLjU3N0w4LjI2OSwxMy43N3YwLjA0N2MwLjQwMSwwLjMyLDAuNjc0LDAuNjQsMC44MTYsMC45NThzMC4yMTQsMC43MTYsMC4yMTQsMS4xOTJjMCwwLjYzNy0wLjE2NCwxLjEzNi0wLjQ5MSwxLjQ5N2MtMC4zMjgsMC4zNjEtMC43OTUsMC41NDItMS40LDAuNTQyYy0xLjI5NywwLTEuOTc3LTEuMDM3LTIuMDM5LTMuMTExbC0wLjAzNS0xLjA5SDQuOTM0Yy0wLjUwNCwwLTAuODc2LDAuMTA4LTEuMTE2LDAuMzI1Yy0wLjI0LDAuMjE3LTAuMzYsMC41NjMtMC4zNiwxLjA0YzAsMC41MzUsMC4xNjQsMS4xNDEsMC40OTIsMS44MTZsLTAuNzQ0LDAuMjk5Yy0wLjE3Mi0wLjMxNi0wLjMwNy0wLjY2My0wLjQwNC0xLjA0Yy0wLjA5Ny0wLjM3Ny0wLjE0Ni0wLjc1NS0wLjE0Ni0xLjEzNGMwLTAuNzY2LDAuMTctMS4zMzMsMC41MS0xLjcwMmMwLjM0LTAuMzY5LDAuODg1LTAuNTU0LDEuNjM1LTAuNTU0aDQuMzg0djAuNzIySDkuMTgzeiBNOC40OTYsMTUuNzc0YzAtMC42MDUtMC4xNjYtMS4wODEtMC40OTgtMS40MjdjLTAuMzMyLTAuMzQ2LTAuNzk3LTAuNTE5LTEuMzk2LTAuNTE5aC0wLjU4bDAuMDQxLDAuOTczYzAuMDI3LDAuNzczLDAuMTQ3LDEuMzMxLDAuMzYsMS42NzNjMC4yMTQsMC4zNDIsMC41NDQsMC41MTMsMC45OTMsMC41MTNjMC4zNTIsMCwwLjYxOS0wLjEwNiwwLjgwMy0wLjMxOVM4LjQ5NiwxNi4xNTcsOC40OTYsMTUuNzc0eiIvPjxwYXRoIGZpbGw9IiNGRkZGRkYiIGQ9Ik05LjI5OSw4LjI4NWMwLDAuOTMtMC4yODYsMS42NDktMC44NTgsMi4xNTljLTAuNTcxLDAuNTEtMS4zODEsMC43NjUtMi40MjgsMC43NjVjLTEuMDc1LDAtMS45MDUtMC4yNTktMi40OTEtMC43NzZTMi42NDMsOS4xNzgsMi42NDMsOC4yMjFjMC0wLjMwOSwwLjAzMy0wLjYxNywwLjEtMC45MjZDMi44MSw2Ljk4NiwyLjg4OCw2Ljc0NCwyLjk3Nyw2LjU2OGwwLjgyNiwwLjI5OUMzLjcxNyw3LjA4MiwzLjY0Niw3LjMxNiwzLjU4OSw3LjU3QzMuNTMyLDcuODI0LDMuNTA0LDguMDQ5LDMuNTA0LDguMjQ0YzAsMS4zMDUsMC44MzIsMS45NTcsMi40OTYsMS45NTdjMC43ODksMCwxLjM5Ni0wLjE1OSwxLjgxNS0wLjQ3OGMwLjQyMi0wLjMxOSwwLjYzNC0wLjc5LDAuNjM0LTEuNDE1YzAtMC41MzUtMC4xMTUtMS4wODQtMC4zNDctMS42NDZoMC44NjFDOS4xODgsNy4wOTIsOS4yOTksNy42MzMsOS4yOTksOC4yODV6Ii8+PHBhdGggZmlsbD0iI0ZGRkZGRiIgZD0iTTUuODk2LDQuMTc4QzUuNjU2LDQuMDEsNS4zNDQsMy43NTQsNC45NTcsMy40MUwyLjc2LDEuMzM2VjAuMTgybDIuNzM2LDIuNjAyTDkuMTgzLDB2MS4xNzhMNi4xNDYsMy40NDVsMC42MzMsMC43MzJoMi40MDJ2MC45NjFIMC4wNjR2LTAuOTZoNC44MzRjMC4yMTUsMCwwLjU0NiwwLjAxNiwwLjk5NiwwLjA0N1Y0LjE3OEg1Ljg5NnoiLz48L2c+PC9zdmc+"
			alt="Feedback" title="Feedback Button" height="70px" />
		</a>
	</div>
	<!-- 		Fin boton beedback --> <!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div id="divHeader" class="modal-header" tyle='display:block;'>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title text-center">Feedback</h4>
				</div>
				<div class="modal-body">

					<div id="divEstrellas" class="row" style='display: block;'>
						<div class="col-sm-12">
							<h4 class="modal-title">¿Cómo calificaría esta página?</h4>
							<br>
							<div class="star-rating">
								<span class="fa fa-star-o" data-rating="1"></span> <span
									class="fa fa-star-o" data-rating="2"></span> <span
									class="fa fa-star-o" data-rating="3"></span> <span
									class="fa fa-star-o" data-rating="4"></span> <span
									class="fa fa-star-o" data-rating="5"></span> <input
									id="valorPuntaje" name="whatever1" type="hidden"
									class="rating-value" value="0">
							</div>
							<h4 id="puntaje"></h4>
						</div>
					</div>
					<br>
					<div id="divComentario" class="row" style='display: none;'>
						<div class="col-sm-12">
							<label class="control-label">Por favor brindanos tus
								comentarios ...</label>
							<textarea name="ta_comentario" id="iComentario"
								class="form-control" rows="4" required></textarea>
						</div>
					</div>
					<div id="divAfirmativo" class="row" style='display: none'>
						<div class="col-sm-12">
							<h3>
								<i class="fa fa-check-circle text-green" style="font-size: 1em;"></i>
								¡Gracias por el feedback!
							</h3>
							<br>
							<h5>Sus comentarios serán revisados por un especialista.</h5>
						</div>
					</div>
					<div id="divNegativo" class="row" style='display: none;'>
						<div class="col-sm-12">
							<h3>
								<i class="fa fa-times-circle text-red" style="font-size: 1em;"></i>
								¡Lo siento, hubo un error durante el envío!
							</h3>
							<br>
							<h5>Por favor vuelva a intentarlo.</h5>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button id="btnEnviarComentario" type="button"
						class="btn btn-primary" style='display: none;'>Enviar</button>
					<button id="btnCerrar" type="button" class="btn btn-default"
						style='display: none;' data-dismiss="modal">cerrar</button>

				</div>
			</div>
		</div>
	</div>


	<!-- Librerias para Kartik --> 
	<script src="<%=request.getContextPath()%>/resources/kartik-v-bootstrap-fileinput-d66e684/js/fileinput.js" type="text/javascript"></script> 
	<!-- Librerias para feedBack --> 
	<script src="<%=request.getContextPath()%>/resources/feedBack/js/feedback.js" type="text/javascript"></script> 
	
	<script>
		 $(function () {
	         
	         $('.datePicker').datetimepicker({
	             useCurrent: false,
	             minDate: moment()
	         });
	
	         $('.datePicker').datetimepicker().on('dp.change', function (e) {
	             var hoy = moment(new Date(e.date));
	             hoy.add(0, 'days');
	             $('.datePicker').data('DateTimePicker').maxDate(hoy);
	              $(this).data("DateTimePicker").hide();
	         });
	
	     });
		$(document).ready(function() {

			opcionesHtml();
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

				$('.star-rating .fa').removeClass('fa-star').addClass(
						'fa-star-o');

			}
			
			//Validar campos en blancos requeridos
			function valRequerido(myID){
				var ok=true;
			 	//Inputs type text
				$(myID + " div.validar:has(input[type=text]) input").each(function(){
					if($(this).val().trim()=="" || $(this).val()==null)
				    	ok=false;
				}); 
				
				//Select
			 	$(myID + " div.validar:has(select) select").each(function(){
					if($(this).val()=="" || $(this).val()==null)
				    	ok=false;
				});
				
			 	//Radio
			 	$(myID + " div.validar:has(input[type=radio]) input").each(function(){
			 		$(this).on('ifUnchecked', function(event){
				  		ok=false;
					});
				});
			 	
			 	//Checkbox
			 	$(myID + " div.validar:has(input[type=checkbox]) input").each(function(){
			 		$(this).on('ifUnchecked', function(event){
				  		ok=false;
					});
				});
				return ok;
			}
			
			function valInput(myID)
			{
				$(myID + " input[type=text]").each(function(){
					console.log('valida');
				    if($(this).val().trim()=="" || $(this).val()==null){
				    	$('div.validar:has(#' + $(this).attr('id') + ')').addClass('error');
				    }
				});
			}
			
			//Validación de los inputs type text (Cuando se escribe)
			  $("input[type=text]").focus(function() {
			    if( $(this).val().trim().length > 0) {
			    	$('div.validar:has(#' + $(this).attr('id') + ')').removeClass('error');
			    }
			});

			$('#btnEnviarComentario')
					.click(
							function() {
								var puntaje = $("#valorPuntaje").val();
								var comentario = $("#iComentario").val().split(
										"\n").join(" ").split("'").join("\'")
										.split("\"").join("\''").split("\\")
										.join("/").trim();
								var rutaPagina = $("#page").attr("title");

								var src = "ServletFeedBack";
								$
										.post(
												src,
												{
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

			$('#btnBuscar').click(function() {

				visualizar();

			});

			function visualizar() {
				
				var RangoI = $('#txtInicio').val();
				var RangoF = $('#txtFin').val();
				var op = $('#cboFiltro option:selected').val();
								
				if(op==0){
					tablaHtml();
					listar(0, "2018-05-02", "2018-05-02");
				}else{
					if(valRequerido('#divFiltro')){
						tablaHtml();
						if(op==1){
							listar(2, RangoI, RangoF);
						}else{
							listar(1, RangoI, RangoF);
						}
						
					}else{
						valInput('#divFiltro');
					}
				}
			}

			function opcionesHtml() {
				var src = "ServletTarea";
				$.post(src,{strAccion : "0"},
					function(pdata) {

						var obj = JSON.parse(pdata);
						var perfil = obj.Sesion[0].perfil;
						
						$("#pPerfil").val(perfil);
						
						comboFiltro();

						visualizar();
					});
			}

			function comboFiltro() {

				$("#cboFiltro option").remove();
				$("#cboFiltro").append($('<option>', {
					value : "0",
					text : " Todos ",
					selected : "selected"
				}));
				$("#cboFiltro").append($('<option>', {
					value : "1",
					text : " Fecha aprobada"
				}));
				$("#cboFiltro").append($('<option>', {
					value : "2",
					text : "Fecha ejecutada"
				}));
			}
			$("#cboFiltro").change(function(){
				var op = $('#cboFiltro option:selected').val();
				if(op==0){
					$('#divFiltro').hide();
					
				}else{
					$('#divFiltro').show();
				}
			});
			function tablaHtml() {

				var perfil = $("#pPerfil").val();

				var tabla = "<table id=\"example1\" class=\"display table table-bordered table-hover\" "
// 						+ " class=\"display\" width=\"99%\" cellspacing=\"0\" style=\"font-size:10px; font-weight:bold\"> "
// 						+ " cellspacing=\"0\" style=\"font-size:10px; font-weight:bold\"> "
						+ " style=\"font-size:12px; font-weight:bold\"> "
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
						+ "            <th>Fecha Creación</th>";

				if (perfil == 'ADMINISTRADOR' || perfil == 'GESTOR'
						|| perfil == 'DPE') {
					tabla += "    <th>Ejecutado</th>"
							+ "      <th>Aprobado</th>"
							+ "      <th>Adjunto</th>";
				} else {
					if (idVista == "1") {
						tabla += "    <th>Ejecutado</th>"
								+ "      <th>Aprobado</th>"
								+ "      <th>Adjunto</th>";
					} else {
						tabla += "    <th>Ejecutado</th>"
								+ "      <th>Adjunto</th>";
					}
				}

				tabla += " </tr>" + "        </thead>";
				tabla += "</table>";

				document.getElementById("divTabla").innerHTML = tabla;
			}

			function modalFile(pidtarea, pNombreFile, pBase64) {
				// Create Base64 Object
				$('#fileEdit').fileinput('reset');

				document.getElementById('pErrorFile').style.display = 'none';

				$('#pIdTareaGenerada').val(pidtarea);
				$('#pIdFile').val(pNombreFile);
				$('#pBase64').text(pBase64);

				var tipoFile = base64MimeType(pBase64);
				var nombreFile = $("#" + pNombreFile).text();
				var cadenaTabla = "";

				if (nombreFile != "") {
					cadenaTabla = "<tr> "
							+ "<td> 1 </td> "
							+ "<td colspan = \"3\">"
							+ nombreFile
							+ "</td>"
							+ "<td align=\"right\">"
							+ "<button title=\"Descargar\" type=\"button\" class=\"btn btn-primary btn-sm\" style='display:block;' onclick=\"descargarFile('"
							+ pBase64
							+ "','"
							+ nombreFile
							+ "','"
							+ tipoFile
							+ "')\"><i class=\"fa fa-download\"></i></button>"
							+ "</td >"
							+ "<td align=\"left\">"
							+ "<button title=\"Eliminar\" type=\"button\" class=\"btn btn-danger btn-sm\" style='display:block;' onclick=\"eliminarFile('"
							+ pidtarea + "','" + pNombreFile
							+ "')\"><i class=\"fa fa-trash\"></i></button>"
							+ "</td>" + "</tr>";

				} else {
					cadenaTabla = "<tr><td colspan = \"4\"> No hay archivo adjunto</td></tr>";
				}

				document.getElementById("tablaFileAdjunto").innerHTML = cadenaTabla;

			}

			function descargarFile(pBase64, nombreFile, TipoFile) {
				download(pBase64, nombreFile, TipoFile);
			}

			function eliminarFile(pIdTareaGenerada, pNombreFile) {
				var src = "ServletTarea";
				$.post(src,{
									strAccion : "8",
									strIdTareaGenerada : pIdTareaGenerada,
									strArchivo : "",
									strArchivoNombre : ""
								},
								function(pdata) {
  
									var obj = JSON.parse(pdata);

									if (obj.BeanTareaAsignada[0].idTareaGenerada != ""
											|| obj.BeanTareaAsignada[0].idTareaGenerada != 0) {
										var nombreFile = obj.BeanTareaAsignada[0].archivoNombre;
										var file = obj.BeanTareaAsignada[0].archivo;
										$("#" + pNombreFile).text("");
										modalFile(pIdTareaGenerada,
												pNombreFile, file);

									} else {

									}
								});
			}

			function base64MimeType(encoded) {
				var result = null;

				if (typeof encoded !== 'string') {
					return result;
				}

				var mime = encoded
						.match(/data:([a-zA-Z0-9]+\/[a-zA-Z0-9-.+]+).*,.*/);

				if (mime && mime.length) {
					result = mime[1];
				}

				return result;
			}

			function limpiarVariable() {

				$('#pIdTareaGenerada').val('');
				$('#pIdFile').val('');

			}

			//Inicio Editar Adjunto
			$('#btnActualizar').click(function() {

								var pidtarea = $('#pIdTareaGenerada').val();
								var pFile = $('#pIdFile').val();

								var files = document.getElementById('fileEdit').files;
								var nameFile;

								function getBase64(file) {

									nameFile = files[0].name;
									var reader = new FileReader();
									reader.readAsDataURL(file);
									reader.onload = function() {
										adjuntar(reader.result, nameFile,
												pidtarea, pFile);
									};
									reader.onerror = function(error) {
										console.log('Error: ', error);
									};
								}

								if (files.length > 0) {
									getBase64(files[0]);
								} else {
									document.getElementById('pErrorFile').style.display = 'block';
									$("#pErrorFile").text(
											"*Debe adjuntar un archivo");
								}

							});
			//Fin Actualizar Tarea

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

			function ejecutar(idbtnEjecutar, idpEjecutar, idbtnAprobar,
					pIdTareaGenerada) {

				document.getElementById(idbtnEjecutar).style.display = 'none';
				var src = "ServletTarea";
				$.post(src,{
									strAccion : "6",
									strIdTareaGenerada : pIdTareaGenerada
								},
								function(pdata) {

									var obj = JSON.parse(pdata);

									if (obj.BeanTareaAsignada[0].idTareaGenerada != ""
											|| obj.BeanTareaAsignada[0].idTareaGenerada != 0) {
										var fechaRealizada = obj.BeanTareaAsignada[0].fechaRealizada;
										document.getElementById(idpEjecutar).style.display = 'block';
										$("#" + idpEjecutar).text(
												fechaRealizada);
										document.getElementById(idbtnAprobar).style.display = 'block';
									}
								});
			}

			function aprobar(idbtnAprobar, idpAprobar, pIdTareaGenerada) {

				document.getElementById(idbtnAprobar).style.display = 'none';
				var src = "ServletTarea";
				$.post(src,{
									strAccion : "7",
									strIdTareaGenerada : pIdTareaGenerada
								},
								function(pdata) {

									var obj = JSON.parse(pdata);

									if (obj.BeanTareaAsignada[0].idTareaGenerada != ""
											|| obj.BeanTareaAsignada[0].idTareaGenerada != 0) {
										var fechaAprobada = obj.BeanTareaAsignada[0].fechaAprobada;
										document.getElementById(idpAprobar).style.display = 'block';
										$("#" + idpAprobar).text(fechaAprobada);
									}
								});
			}

			function adjuntar(pArchivo, pArchivoNombre, pIdTareaGenerada, pFile) {

				var src = "ServletTarea";
				$.post(src,{
									strAccion : "8",
									strArchivo : pArchivo,
									strArchivoNombre : pArchivoNombre,
									strIdTareaGenerada : pIdTareaGenerada
								},
								function(pdata) {

									var obj = JSON.parse(pdata);

									if (obj.BeanTareaAsignada[0].idTareaGenerada != ""
											|| obj.BeanTareaAsignada[0].idTareaGenerada != 0) {
										var nombreFile = obj.BeanTareaAsignada[0].archivoNombre;
										$("#" + pFile).text(nombreFile);
										modalFile(pIdTareaGenerada, pFile,
												pArchivo);
									} else {

									}
								});
			}

			function listar(pEstado, RangoI, RangoF) {

				limpiarVariable();
				
				var src = "ServletTarea";
				var accion;
				var idVista = 0;
				var perfil = $("#pPerfil").val();

				if (perfil == 'ADMINISTRADOR' || perfil == 'GESTOR'
						|| perfil == 'DPE') {
					accion = "10";
				} else { // perfil APROBADOR o OWNER
					accion = "5";
				}

				//Inicio POST para  listar información en la tabla
				$.post(src,{
									strAccion : accion,
									strEstado : pEstado,
									strIdOperacion : idVista,
									iTeam : vTeam,
									strRangoI : RangoI,
									strRangoF : RangoF
								},
								function(pdata) {

									var obj = JSON.parse(pdata);

									var datatabla = [];
									var numeracion = 0;

									if (obj.ListaTareasCerrada[0].idTarea == "") {
										$("#aside").addClass("sizeHeight");

										var table = $('#example1').DataTable({
											processing : true,
											language : {
												processing : "Procesando...",
												search : '<i class="fa fa-search fa-lg"></i>',
												searchPlaceholder : "Buscar..."
											},
											dom : 'Bfrtip',
											lengthMenu : [
													[ 10, 25, 50, -1 ],
													[ '10 Registros', '25 registros' , '50 registros', 'Mostrar todos' ] ],
											data : datatabla,
											buttons : [
														{
														extend: "copy",
											 			exportOptions: {
															columns: ':visible(:not(.not-export-col))'
														},
														className: "btn-sm"
														},
														{
											 			extend: "csv",
											 			exportOptions: {
															columns: ':visible(:not(.not-export-col))'
														},
														className: "btn-sm"
														},
														{
											 			extend: "excel",
														exportOptions: {
											      			columns: ':visible(:not(.not-export-col))'
											      		},
											 			className: "btn-sm"
														},
														{
											 			extend: "pdfHtml5",
											 			exportOptions: {
															columns: ':visible(:not(.not-export-col))'
														},
											  			className: "btn-sm"
														},
														{
											  			extend: "print",
											  			exportOptions: {
											      			columns: ':visible(:not(.not-export-col))'
											      		},
											  			className: "btn-sm"
														}
													],
													responsive: true
										});
										
										
										//Ocultar Modal con barra de progreso
										var $modal = $('.js-loading-bar');
										$modal.modal('hide');

									} else {
										//Ocultar Modal con barra de progreso
										var $modal = $('.js-loading-bar');
										$modal.modal('hide');

										if (obj.ListaTareasCerrada.length < 3) {
											$("#aside").addClass("sizeHeight");
										} else {
											$("#aside").removeClass(
													"sizeHeight");
										}

										for (i = 0; i < obj.ListaTareasCerrada.length; i++) {

											numeracion = numeracion + 1;
											var arr = [];

											//captura de datos
											var idTareaGenerada = obj.ListaTareasCerrada[i].idTareaGenerada;
											var tipoTarea = obj.ListaTareasCerrada[i].tipoTarea;
											var tarea = obj.ListaTareasCerrada[i].tarea;
											var owner = obj.ListaTareasCerrada[i].owner;
											var aprobador = obj.ListaTareasCerrada[i].aprobador;
											var frecuencia = obj.ListaTareasCerrada[i].frecuencia;
											var programacion = obj.ListaTareasCerrada[i].programacion;
											var periodo = obj.ListaTareasCerrada[i].periodo;
											var avisoIn = obj.ListaTareasCerrada[i].avisoIn;
											var avisoFin = obj.ListaTareasCerrada[i].avisoFin;
											var fechaGenerada = obj.ListaTareasCerrada[i].fechaGenerada;
											var fechaRealizada = obj.ListaTareasCerrada[i].fechaRealizada;
											var fechaAprobada = obj.ListaTareasCerrada[i].fechaAprobada;
											var archivo = obj.ListaTareasCerrada[i].archivo;
											var archivoNombre = obj.ListaTareasCerrada[i].archivoNombre;
											var btn;

											
											btn = "<button title=\"Editar file adjunto\" type=\"button\" class=\"btn btn-primary btn-xs\" style='display:block;' data-toggle=\"modal\" data-target=\"#modalEdit\" onclick=\"modalFile('"
													+ idTareaGenerada
													+ "','pFile"
													+ numeracion
													+ "', '"
													+ archivo
													+ "')\"><i class=\"fa fa-paperclip\"></i> EDITAR </button> "
													+ "<p id=\"pFile"+numeracion+"\" style='display:block;'>"
													+ archivoNombre + "</p>";

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
											arr.push(fechaGenerada);

											if (perfil == 'ADMINISTRADOR'
													|| perfil == 'GESTOR'
													|| perfil == 'DPE') {
												arr.push(fechaRealizada);
												arr.push(fechaAprobada);
												arr.push(btn);
											} else {
												if (idVista == '1') {
													arr.push(fechaRealizada);
													arr.push(fechaAprobada);
													arr.push(btn);
												} else {
													arr.push(fechaRealizada);
													arr.push(btn);
												}
											}

											datatabla.push(arr);
										}
									}

									var table =  $('#example1').DataTable({
														processing : true,
														language : {
															processing : "Procesando...",
															search : '<i class="fa fa-search fa-lg"></i>',
															searchPlaceholder : "Buscar..."
														},
														dom : 'Bfrtip',
														lengthMenu : [
																[ 10, 25, 50, -1 ],
																[ '10 Registros', '25 registros' , '50 registros', 'Mostrar todos' ] ],
														data : datatabla,
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
															responsive: true
													});

								});

				// Fin del POST listar tabla

			}
		</script> <script type="text/javascript">
		$('.clockpicker').clockpicker({
			donetext : 'OK'
		});
	</script> <script>
		$(function() {
			//Initialize Select2 Elements
			$(".select2").select2();
		});
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
