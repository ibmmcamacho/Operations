<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>


<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/Charts/ChartJS/js/Chart.min.js"></script> --%>
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/custom/css/custom.css"> --%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/select2/css/select2.min.css">
</head>
<body>
<aside class="right-side"> <!-- Content Header (Page header) --> 
<section class="content-header"> 
	<h1>
		Productividad <small>MENSUAL & SEMANAL</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-th-large"></i> Productividad</a></li>	
		<li class="active">MENSUAL & SEMANAL</li>
	</ol>
</section> <!-- Main content -->
<section class="content">

	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="form-inline">
				<div class="form-group" >
				    <label> Pais: </label>
				</div>
				<div class="form-group" >
				    <select class="cbo2" id="cboPais">
				    	<option value="0">TODOS</option>
				    	<option value="Peru">PERU</option>
				    	<option value="India">INDIA</option>
				    </select>
				</div>
				<div class="form-group">&nbsp;</div>
				<div class="form-group" >
				    <label> Torre: </label>
				</div>
				<div class="form-group" >
				    <select class="cbo2" id="cboTorre" ></select>
				</div>
			</div>
		</div>
		<div class="user-padding"></div>
		<div class="user-padding"></div>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="form-inline">
				<div class="form-group">
				    <label> Inicio: </label>
				</div>
				<div class="form-group" >
				    <select class="cbo2" id="cboAnioIni"></select>
				</div>
				<div class="form-group">&nbsp;</div>
				<div class="form-group" >
				    <select class="cbo2" id="cboFechaClaimIni"></select>
				</div>
				<div class="form-group">&nbsp;</div>
				<div class="form-group">
					<label>Intervalo</label>
				</div>
				<div class="form-group" >
					<div class="material-switch pull-right">
					    <input id="chkFechaFin" type="checkbox"/>
					    <label for="chkFechaFin" class="label-primary"></label>
					</div>
				</div>
				<div class="form-group">&nbsp;</div>
				<div id="divFechaAnioFin" class="form-group hidden" >
				    <select class="cbo2" id="cboAnioFin"></select>
				</div>
				<div id="divFechaMesFin" class="form-group hidden" >
				    <select class="cbo2" id="cboFechaClaimFin"></select>
				</div>
				<div class="form-group">&nbsp;&nbsp;</div>
				<div class="form-group">
					<a id="btnBuscar" onclick="buscar()" title="Buscar" href="#" class="btn btn-sm btn-primary">
					<i class="fa fa-search"></i>Buscar</a>
			    </div>
			</div>
		</div>
	</div>
	
	
	<br/>
	<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<legend class="scheduler-border" ><h4>Productividad por semanas</h4></legend>	
	<div class="row">
		<div class="col-lg-12 connectedSortable">		
			<div class="box box-primary">
				<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title" ><i class="fa fa-table" ></i> Tendencia de resolución semanal </h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<div id="dvResolucionSemanal" class="table-responsive">
							</div>
						</div>
					</div>
				</div>
				<div id="dvLoadResolucionSemanal"></div>
			</div>        
		</div>	
	</div>
	
	<legend class="scheduler-border"><h4>Productividad por mes</h4></legend>	
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 connectedSortable">
			<div class="box box-primary">
				<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title" id="lblTendenciaResolucionMensual"><i class="fa fa-table" ></i> Tendencia de resolución por Squad </h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<div id="dvMensualSquad1" class="table-responsive">
							</div>
						</div>
					</div>
				</div>
				<div id="dvLoadMensualSquad1"></div>
			</div>         
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 connectedSortable">
			<div class="box box-primary">
				<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title" id="lblTendenciaResolucionMensual"><i class="fa fa-tachometer" ></i> Tendencia de resolución por Squad </h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<div id="dvMensualSquad2" class="table-responsive">
								<div class="form-group" id="dvGrafMensualSquad"></div>
							</div>
						</div>
					</div>
				</div>
				<div id="dvLoadMensualSquad2"></div>
			</div>         
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 connectedSortable">	
			<div class="box box-primary">
				<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title" id="lblTendenciaResolucionMensual2"><i class="fa fa-table" ></i> Tendencia de resolución por Horarios </h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<div id="dvMensualHorario1" class="table-responsive"></div>
						</div>
					</div>
				</div>
				<div id="dvLoadMensualHorario1"></div>
			</div>        
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 connectedSortable">
			<div class="box box-primary">
				<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title" id="lblTendenciaResolucionMensual"><i class="fa fa-tachometer" ></i> Tendencia de resolución por Horarios </h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<div id="dvMensualHorario2" class="table-responsive">
								<div class="form-group" id="dvGrafMensualHorario"></div>
							</div>
						</div>
					</div>
				</div>
				<div id="dvLoadMensualHorario2"></div>
			</div>         
		</div>	
	</div>
	
	
	
	<legend class="scheduler-border"><h4>Productividad por especialista</h4></legend>
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 connectedSortable">	
			<div class="box box-primary">
				<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title" id="lblTendenciaResolucionMensual2"><i class="fa fa-table" ></i> Productividad de especialista por tipo de ticket </h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<div id="dvEspecialistaClase1" class="table-responsive"></div>
						</div>
					</div>
				</div>
				<div id="dvLoadEspecialistaClase1"></div>
			</div>        
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 connectedSortable">
			<div class="box box-primary">
				<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title" id="lblTendenciaResolucionMensual"><i class="fa fa-tachometer" ></i> Productividad de especialista por tipo de ticket </h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<div id="dvEspecialistaClase2" class="table-responsive">
								<div class="form-group" id="dvGrafEspecialistaClase"></div>
							</div>
						</div>
					</div>
				</div>
				<div id="dvLoadEspecialistaClase2"></div>
			</div>         
		</div>	
	</div>
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 connectedSortable">	
			<div class="box box-primary">
				<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title" id="lblTendenciaResolucionMensual2"><i class="fa fa-table" ></i> Productividad de especialista por horario</h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<div id="dvEspecialistaHorario1" class="table-responsive"></div>
						</div>
					</div>
				</div>
				<div id="dvLoadEspecialistaHorario1"></div>
			</div>        
		</div>
		<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 connectedSortable">
			<div class="box box-primary">
				<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title" id="lblTendenciaResolucionMensual"><i class="fa fa-tachometer" ></i> Productividad de especialista por horario </h3>
				</div>
				<div class="box-body">
					<div class="row">
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<div id="dvEspecialistaHorario2" class="table-responsive">
								<div class="form-group" id="dvGrafEspecialistaHorario"></div>
							</div>
						</div>
					</div>
				</div>
				<div id="dvLoadEspecialistaHorario2"></div>
			</div>         
		</div>	
	</div>
	
	</div>
	</div>

</section>
</aside>
</body>


<script type="text/javascript">
	
	listOptions('listOptionsAnio',1);
	listGrupoResolutor();
	
	function buscar(){
		listTendenciaResolucion();
		listMesMensualHorario();
		listMesActualSquads();
		listEspecialistaClase();
		listEspecialistaHorario();
	}
	
	$(document).ready(function(){
		$('#cboAnioIni').change(function(){
			listOptions('listOptionsFechaClaim', $('#cboAnioIni').val());
		});
		
		$('#cboAnioFin').change(function(){
			listOptions('listOptionsFechaClaim', $('#cboAnioIni').val());
		});
		
		$('#chkFechaFin').change(function(){
			var chkFechaFin = document.getElementById("chkFechaFin");
			
	 		if(chkFechaFin.checked == true){	
	 			$('#divFechaAnioFin').removeClass('hidden');
	 			$('#divFechaMesFin').removeClass('hidden');
	 		}else {
	 			$('#divFechaAnioFin').removeClass('hidden');
	 			$('#divFechaMesFin').removeClass('hidden');
	 			$('#divFechaAnioFin').addClass('hidden');
	 			$('#divFechaMesFin').addClass('hidden');
	 		}
		});
	});
	
	
	function listOptions(poperation, piAnio) {
		$(document).ready(function() {
			var src = "ServletWOptions";
			$.post(src, {
				strOperation : poperation,
				iAnio : piAnio
			}, function(pdata) {
				var obj = JSON.parse(pdata);

				if (obj.reporte.length > 0) {

					if (poperation == "listOptionsAnio") {
						$('#cboAnioIni option').remove();
						$('#cboAnioFin option').remove();

						$.each(obj.reporte, function(i, item) {
							$('#cboAnioIni').append($('<option>', {
								value : item.descripcion,
								text : item.descripcion
							}));
						});
						$.each(obj.reporte, function(i, item) {
							$('#cboAnioFin').append($('<option>', {
								value : item.descripcion,
								text : item.descripcion
							}));
						});
						
						$('#cboAnioIni').select2({ width : '100%'});
						$('#cboAnioFin').select2({ width : '100%'});
						
						$('#cboAnioIni').val('2019').trigger("change");
						$('#cboAnioFin').val('2019').trigger("change");
					}
					else if (poperation == "listOptionsFechaClaim") {
						$('#cboFechaClaimIni option').remove();
						$('#cboFechaClaimFin option').remove();

						$.each(obj.reporte, function(i, item) {
							$('#cboFechaClaimIni').append($('<option>', {
								value : item.valor2,
								text : item.descripcion
							}));
						});
						$.each(obj.reporte, function(i, item) {
							$('#cboFechaClaimFin').append($('<option>', {
								value : item.valor2,
								text : item.descripcion
							}));
						});
						$('#cboFechaClaimIni').select2({ width : '100%'});
						$('#cboFechaClaimFin').select2({ width : '100%'});
					}
				}
			});
		});
	}
	
	
	
	function listGrupoResolutor(){
		$(document).ready(function() {
			var src = "ServletReporteDispatch";
			$.post(src, {
				strOperacion : 'listGrupoResolutor',
				iAnio : ''
			}, function(pdata) {
				var obj = JSON.parse(pdata);

				if (obj.reporte.length > 0) {
					$('#cboTorre option').remove();
					$('#cboTorre').append($('<option>', {
						value : '0',
						text : '   TODOS   '
					}));

					$.each(obj.reporte, function(i, item) {
						$('#cboTorre').append($('<option>', {
							value : item.groupid,
							text : item.group
						}));
					});
					
					$('#cboTorre').select2({ width : '100%'});
				}
			});
		});
	}
	
	
	
	
	
	function listTendenciaResolucion(){
		$('#dvLoadResolucionSemanal').removeClass('overlay');
		$('#dvLoadResolucionSemanal').addClass('overlay');	
		document.getElementById('dvLoadResolucionSemanal').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
		
		var vpais = $('#cboPais').val();
		var vtorre = $('#cboTorre').val();
		var vfechaini = $('#cboFechaClaimIni').val();
		var vfechafin = '';
		
		var chkFechaFin = document.getElementById("chkFechaFin");
		vfechafin =  (chkFechaFin.checked == true? $('#cboFechaClaimFin').val() : $('#cboFechaClaimIni').val());
		
		$(document).ready(function(){
			var src = "ServletReporteDispatch";
			$.post(src, {
				strOperacion : 'listTendenciaResolucion', 
				strPais : vpais,
				strTorre : vtorre,
				strFechaIni : vfechaini,
				strFechaFin : vfechafin
			},
				function(pdata) {
					var obj = JSON.parse(pdata);
					var dataReporte = [];
					var columnsReporte = [];
					
					if(obj.reporte.length > 0){
						
					var dataReporte_ = [];
					dataReporte_.push("IBM");
					dataReporte_.push("Squad Commercial");
					dataReporte_.push("Squad Credicorp");
					dataReporte_.push("Squad Intergroup");
					dataReporte_.push("Squad Multi Industria 1");
					dataReporte_.push("Squad Multi Industria 2");
					dataReporte_.push("Resolución Total");
					dataReporte_.push("Diferencial Semanal");
					dataReporte_.push("Tickets entrantes");
					dataReporte_.push("Eficiencia");
					dataReporte_.push("In Business Hours");
					dataReporte_.push("Out of Business Hours");
					dataReporte_.push("Weekend");
					dataReporte_.push("Horas Total");
					dataReporte_.push("Promedio de resolución diaria");
					dataReporte_.push("% Resolución en Horario de Oficina");
					
					var ivalidacion = 0;
					
						for(i = 0; i < dataReporte_.length ; i++){
							var arr = [];
							arr.push(dataReporte_[i]);
							
							for(j = 0; j < obj.reporte[1].datos.length; j++){
								ivalidacion = 0;
								for(k = 0; k < obj.reporte[1].datos[j].dato.length; k++){
	 								if(ivalidacion==1)
									break;
	 								
									if(obj.reporte[1].datos[j].dato[k].descripcion == dataReporte_[i]){
										arr.push(obj.reporte[1].datos[j].dato[k].total);
										ivalidacion = 1;
									}
								}
								if(ivalidacion==0)
									arr.push(0);
							}
							dataReporte.push(arr);
						}
						columnsReporte = obj.reporte[0].head;

						document.getElementById('dvLoadResolucionSemanal').innerHTML = '';
						$('#dvLoadResolucionSemanal').removeClass('overlay');
						setDataTendenciaResolucion(dataReporte, columnsReporte,1);
					}
					else{
						document.getElementById('dvLoadResolucionSemanal').innerHTML = '';
						$('#dvLoadResolucionSemanal').removeClass('overlay');
						setDataTendenciaResolucion(dataReporte, columnsReporte,0);
					}
										
				});
		});		
	}
	
	
	function listMesActualSquads(){
		$('#dvLoadMensualSquad1').removeClass('overlay');
		$('#dvLoadMensualSquad1').addClass('overlay');
		$('#dvLoadMensualSquad2').removeClass('overlay');
		$('#dvLoadMensualSquad2').addClass('overlay');
		document.getElementById('dvLoadMensualSquad1').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
		document.getElementById('dvLoadMensualSquad2').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
		
		var vpais = $('#cboPais').val();
		var vtorre = $('#cboTorre').val();
		var vfechaini = $('#cboFechaClaimIni').val();
		var vfechafin = '';
		
		var chkFechaFin = document.getElementById("chkFechaFin");
		vfechafin =  (chkFechaFin.checked == true? $('#cboFechaClaimFin').val() : $('#cboFechaClaimIni').val());
		
		$(document).ready(function(){
			var src = "ServletReporteDispatch";
			$.post(src, {
				strOperacion : 'listReporteMesActual', 
				strPais : vpais,
				strTorre : vtorre,
				strFechaIni : vfechaini,
				strFechaFin : vfechafin
			},
				function(pdata) {
					var obj = JSON.parse(pdata);
					var dataReporte = [];
					var columnsReporte = [];
					
					if(obj.reporte.length > 0){
						
						for(i = 0; i < obj.reporte.length ; i++){
							var arr = [];
							arr.push(obj.reporte[i].squad);
							arr.push(obj.reporte[i].incriteria);
							arr.push(obj.reporte[i].outofcriteria);
							arr.push(obj.reporte[i].planificado);
							arr.push(obj.reporte[i].noaplica);
							arr.push(obj.reporte[i].total);
							dataReporte.push(arr);
						}
						
						columnsReporte=[
				            {title : "Squads"},
				            {title : "In criteria"},
				            {title : "Out of criteria"},
				            {title : "Planificado"},
				            {title : "No Aplica"},
				            {title : "Total"}
				            ];
						
						var xAxisCategorias = [];
						xAxisCategorias.push("In criteria");
						xAxisCategorias.push("Out of criteria");
						xAxisCategorias.push("Planificado");
						xAxisCategorias.push("No Aplica");
						setChart('dvGrafMensualSquad','Cumplimiento OLA/SLA por segmento',xAxisCategorias,obj.dataChart);
						
						document.getElementById('dvLoadMensualSquad1').innerHTML = '';
						$('#dvLoadMensualSquad1').removeClass('overlay');
						document.getElementById('dvLoadMensualSquad2').innerHTML = '';
						$('#dvLoadMensualSquad2').removeClass('overlay');
						setDataTable('dvMensualSquad1',dataReporte, columnsReporte,1,obj.reporte.length);
					}
					else{
						document.getElementById('dvLoadMensualSquad1').innerHTML = '';
						$('#dvLoadMensualSquad1').removeClass('overlay');
						document.getElementById('dvLoadMensualSquad2').innerHTML = '';
						$('#dvLoadMensualSquad2').removeClass('overlay');
						setDataTable('dvMensualSquad1',dataReporte, columnsReporte,0,obj.reporte.length);
					}
				});
		});
	}
	
	function listMesMensualHorario(){
		$('#dvLoadMensualHorario1').removeClass('overlay');
		$('#dvLoadMensualHorario1').addClass('overlay');	
		document.getElementById('dvLoadMensualHorario1').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
		
		$('#dvLoadMensualHorario2').removeClass('overlay');
		$('#dvLoadMensualHorario2').addClass('overlay');	
		document.getElementById('dvLoadMensualHorario2').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
		
		var vpais = $('#cboPais').val();
		var vtorre = $('#cboTorre').val();
		var vfechaini = $('#cboFechaClaimIni').val();
		var vfechafin = '';
		
		var chkFechaFin = document.getElementById("chkFechaFin");
		vfechafin =  (chkFechaFin.checked == true? $('#cboFechaClaimFin').val() : $('#cboFechaClaimIni').val());
		
		$(document).ready(function(){
			var src = "ServletReporteDispatch";
			$.post(src, {
				strOperacion : 'listReporteMesActualHorario', 
				strPais : vpais,
				strTorre : vtorre,
				strFechaIni : vfechaini,
				strFechaFin : vfechafin
			},
				function(pdata) {
					var obj = JSON.parse(pdata);
					var dataReporte = [];
					var columnsReporte = [];
					
					if(obj.reporte.length > 0){
						
						
						for(i = 0; i < obj.reporte.length ; i++){
							var arr = [];
							arr.push(obj.reporte[i].squad);
							arr.push(obj.reporte[i].incriteria);
							arr.push(obj.reporte[i].outofcriteria);
							arr.push(obj.reporte[i].planificado);
							arr.push(obj.reporte[i].noaplica);
							arr.push(obj.reporte[i].total);
							dataReporte.push(arr);
						}
						
						columnsReporte=[
				            {title : "Squads"},
				            {title : "In criteria"},
				            {title : "Out of criteria"},
				            {title : "Planificado"},
				            {title : "No Aplica"},
				            {title : "Total"}
				            ];
						
						var xAxisCategorias = [];
						xAxisCategorias.push("In criteria");
						xAxisCategorias.push("Out of criteria");
						xAxisCategorias.push("Planificado");
						xAxisCategorias.push("No Aplica");
						setChart('dvGrafMensualHorario','Resolución en Horario de Oficina',xAxisCategorias,obj.dataChart);
					
						document.getElementById('dvLoadMensualHorario1').innerHTML = '';
						$('#dvLoadMensualHorario1').removeClass('overlay');
						document.getElementById('dvLoadMensualHorario2').innerHTML = '';
						$('#dvLoadMensualHorario2').removeClass('overlay');
						setDataTable('dvMensualHorario1',dataReporte, columnsReporte,1,obj.reporte.length);
					}
					else{
						document.getElementById('dvLoadMensualHorario1').innerHTML = '';
						$('#dvLoadMensualHorario1').removeClass('overlay');
						document.getElementById('dvLoadMensualHorario2').innerHTML = '';
						$('#dvLoadMensualHorario2').removeClass('overlay');
						setDataTable('dvMensualHorario1',dataReporte, columnsReporte,0,obj.reporte.length);
					}
										
				});
		});		
	}
	
	
	function listEspecialistaClase(){
		$('#dvLoadEspecialistaClase1').removeClass('overlay');
		$('#dvLoadEspecialistaClase1').addClass('overlay');	
		document.getElementById('dvLoadEspecialistaClase1').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
		
		$('#dvLoadEspecialistaClase2').removeClass('overlay');
		$('#dvLoadEspecialistaClase2').addClass('overlay');	
		document.getElementById('dvLoadEspecialistaClase2').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
		
		var vpais = $('#cboPais').val();
		var vtorre = $('#cboTorre').val();
		var vfechaini = $('#cboFechaClaimIni').val();
		var vfechafin = '';
		
		var chkFechaFin = document.getElementById("chkFechaFin");
		vfechafin =  (chkFechaFin.checked == true? $('#cboFechaClaimFin').val() : $('#cboFechaClaimIni').val());
		
		$(document).ready(function(){
			var src = "ServletReporteDispatch";
			$.post(src, {
				strOperacion : 'listReporteEspecialistaClase', 
				strPais : vpais,
				strTorre : vtorre,
				strFechaIni : vfechaini,
				strFechaFin : vfechafin
			},
				function(pdata) {
					var obj = JSON.parse(pdata);
					var dataReporte = [];
					var columnsReporte = [];
					
					if(obj.reporte.length > 0){
						
						
						for(i = 0; i < obj.reporte.length ; i++){
							var arr = [];
							arr.push(obj.reporte[i].owner);
							arr.push(obj.reporte[i].incident);
							arr.push(obj.reporte[i].problem);
							arr.push(obj.reporte[i].sr);
							arr.push(obj.reporte[i].change);
							arr.push(obj.reporte[i].workorder);
							arr.push(obj.reporte[i].activity);
							arr.push(obj.reporte[i].total);
							dataReporte.push(arr);
						}
						
						columnsReporte=[
				            {title : "Especialista"},
				            {title : "INC"},
				            {title : "PR"},
				            {title : "SR"},
				            {title : "CH"},
				            {title : "WO"},
				            {title : "ACT"},
				            {title : "Total"}
				            ];
						
						var xAxisCategorias = [];
						xAxisCategorias.push("Incidente");
						xAxisCategorias.push("Problema");
						xAxisCategorias.push("Requerimiento SR");
						xAxisCategorias.push("Cambio");
						xAxisCategorias.push("Work Order");
						xAxisCategorias.push("Actividad");
						setChart('dvGrafEspecialistaClase','Productividad Especialista',xAxisCategorias,obj.dataChart);
					
						document.getElementById('dvLoadEspecialistaClase1').innerHTML = '';
						$('#dvLoadEspecialistaClase1').removeClass('overlay');
						document.getElementById('dvLoadEspecialistaClase2').innerHTML = '';
						$('#dvLoadEspecialistaClase2').removeClass('overlay');
						setDataTable('dvEspecialistaClase1',dataReporte, columnsReporte,1,obj.reporte.length);
					}
					else{
						document.getElementById('dvLoadEspecialistaClase1').innerHTML = '';
						$('#dvLoadEspecialistaClase1').removeClass('overlay');
						document.getElementById('dvLoadEspecialistaClase2').innerHTML = '';
						$('#dvLoadEspecialistaClase2').removeClass('overlay');
						setDataTable('dvEspecialistaClase1',dataReporte, columnsReporte,0,obj.reporte.length);
					}
										
				});
		});		
	}
	
	function listEspecialistaHorario(){
		$('#dvLoadEspecialistaHorario1').removeClass('overlay');
		$('#dvLoadEspecialistaHorario1').addClass('overlay');	
		document.getElementById('dvLoadEspecialistaHorario1').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
		
		$('#dvLoadEspecialistaHorario2').removeClass('overlay');
		$('#dvLoadEspecialistaHorario2').addClass('overlay');	
		document.getElementById('dvLoadEspecialistaHorario2').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
		
		var vpais = $('#cboPais').val();
		var vtorre = $('#cboTorre').val();
		var vfechaini = $('#cboFechaClaimIni').val();
		var vfechafin = '';
		
		var chkFechaFin = document.getElementById("chkFechaFin");
		vfechafin =  (chkFechaFin.checked == true? $('#cboFechaClaimFin').val() : $('#cboFechaClaimIni').val());
		
		$(document).ready(function(){
			var src = "ServletReporteDispatch";
			$.post(src, {
				strOperacion : 'listReporteEspecialistaHorario', 
				strPais : vpais,
				strTorre : vtorre,
				strFechaIni : vfechaini,
				strFechaFin : vfechafin
			},
				function(pdata) {
					var obj = JSON.parse(pdata);
					var dataReporte = [];
					var columnsReporte = [];
					
					if(obj.reporte.length > 0){
						
						
						for(i = 0; i < obj.reporte.length ; i++){
							var arr = [];
							arr.push(obj.reporte[i].owner);
							arr.push(obj.reporte[i].incriteria);
							arr.push(obj.reporte[i].outofcriteria);
							arr.push(obj.reporte[i].planificado);
							arr.push(obj.reporte[i].noaplica);
							arr.push(obj.reporte[i].total);
							dataReporte.push(arr);
						}
						
						columnsReporte=[
				            {title : "Especialista"},
				            {title : "In criteria"},
				            {title : "Out of criteria"},
				            {title : "Planificado"},
				            {title : "No Aplica"},
				            {title : "Total"}
				            ];
						
						var xAxisCategorias = [];
						xAxisCategorias.push("In criteria");
						xAxisCategorias.push("Out of criteria");
						xAxisCategorias.push("Planificado");
						xAxisCategorias.push("No Aplica");
						setChart('dvGrafEspecialistaHorario','Cumplimiento SLA/OLA',xAxisCategorias,obj.dataChart);
					
						document.getElementById('dvLoadEspecialistaHorario1').innerHTML = '';
						$('#dvLoadEspecialistaHorario1').removeClass('overlay');
						document.getElementById('dvLoadEspecialistaHorario2').innerHTML = '';
						$('#dvLoadEspecialistaHorario2').removeClass('overlay');
						setDataTable('dvEspecialistaHorario1',dataReporte, columnsReporte,1,obj.reporte.length);
					}
					else{
						document.getElementById('dvLoadEspecialistaHorario1').innerHTML = '';
						$('#dvLoadEspecialistaHorario1').removeClass('overlay');
						document.getElementById('dvLoadEspecialistaHorario2').innerHTML = '';
						$('#dvLoadEspecialistaHorario2').removeClass('overlay');
						setDataTable('dvEspecialistaHorario1',dataReporte, columnsReporte,0,obj.reporte.length);
					}
										
				});
		});		
	}
	
	
	
	var htmlTable1 = '<table id=\"tblReportes\"class=\"display 	compact table table-bordered table-condensed table-hover\"><thead class=\"bg-primary\"></thead></table>';
	function setDataTendenciaResolucion(pdataReporte,pcolumnsReport,ptipo)
	{
		document.getElementById('dvResolucionSemanal').innerHTML = 	htmlTable1;
		
		if(ptipo == 0){
			document.getElementById('dvResolucionSemanal').innerHTML = 'No se ha encontrado información para este rango de fecha, por favor prueba cambiando de rango o espera unos minutos y vuelve a intentarlo.';
			return;
		}
		
		if(typeof tableReporte1 === 'undefined') 
	    {
		var tableReporte1 = $('#tblReportes').DataTable({
			data : pdataReporte,
			columns : pcolumnsReport,
			"info":     false,
			"bPaginate": false,
			"ordering": false,
			"pageLength": 50,
			dom: 'Bfrtip',
			buttons: [
	            'copy', 'csv', 'excel', 'pdf', 'print'
	        ],
			 'rowCallback': function(row, data, index){
				 if(data[0] == 'Diferencial Semanal'){
					 for(i=0;i<data.length;i++){
						 if(i==0)
							 $(row).find('td:eq(' + i + ')').html('<strong>' + data[i] + ' </strong>');
						 else if(parseFloat(data[i]) >= 0){
						 $(row).find('td:eq(' + i + ')').addClass('bg-success');
						 $(row).find('td:eq(' + i + ')').html('<i class="fa fa-chevron-circle-up text-success" aria-hidden="true"></i> <strong><label class="label label-success">' + data[i] + ' %</label></strong>');
						 }
						 else{
							 $(row).find('td:eq(' + i + ')').addClass('bg-danger');
							 $(row).find('td:eq(' + i + ')').html('<i class="fa fa-chevron-circle-down text-red" aria-hidden="true"></i> <strong><label class="label label-danger">' + data[i] + ' %</label></strong>');
						 }
						 $(row).find('td:eq(' + i + ')').css({'border-bottom':'1px solid #848484'});
					 }
				 }
				 if(data[0] == 'Eficiencia'){
					 for(i=0;i<data.length;i++){
						 if(i==0)
							 $(row).find('td:eq(' + i + ')').html('<strong>' + data[i] + ' </strong><i class="fa fa-question-circle text-info" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="(Tks.Resueltos/Tks.Entrantes)"></i>'); 
						 else if(parseFloat(data[i]) >= 100){
						 $(row).find('td:eq(' + i + ')').addClass('bg-success');
						 $(row).find('td:eq(' + i + ')').html('<i class="fa fa-check text-success" aria-hidden="true"></i> <strong><label class="label label-success">' + data[i] + ' %</label></strong>');
						 }
						 else{
							 $(row).find('td:eq(' + i + ')').addClass('bg-danger');
							 $(row).find('td:eq(' + i + ')').html('<i class="fa fa-times text-red" aria-hidden="true"></i> <strong><label class="label label-danger">' + data[i] + ' %</label></strong>');
						 }
						 $(row).find('td:eq(' + i + ')').css({'border-bottom':'1px solid #848484','border-top':'1px solid #848484'});
					 }
				 }
				 if(data[0] == 'Resolución Total'){
					 for(i=0;i<data.length;i++){
						 $(row).find('td:eq(' + i + ')').html('<strong>' + data[i] + ' </strong>');
						 $(row).find('td:eq(' + i + ')').css({'border-top':'1px solid #848484'});
					 }
				 }
				 if(data[0] == 'Horas Total'){
					 for(i=0;i<data.length;i++){
						 $(row).find('td:eq(' + i + ')').html('<strong>' + data[i] + ' </strong>');
						 $(row).find('td:eq(' + i + ')').css({'border-top':'1px solid #848484'});
					 }
				 }
				 if(data[0] == 'Promedio de resolución diaria'){
					 for(i=0;i<data.length;i++){
						 if(i==0)
							$(row).find('td:eq(' + i + ')').html('<strong>' + data[i] + ' </strong><i class="fa fa-question-circle text-info" aria-hidden="true" data-toggle="tooltip" data-placement="top" title="(Lunes a Viernes)"></i>');
						 else
						 	$(row).find('td:eq(' + i + ')').html('<strong>' + data[i] + ' </strong>');
					 }
				 }
				 if(data[0] == '% Resolución en Horario de Oficina'){
					 for(i=0;i<data.length;i++){
						 if(i==0)
								$(row).find('td:eq(' + i + ')').html('<strong>' + data[i] + ' </strong>');
							 else
							 	$(row).find('td:eq(' + i + ')').html('<strong>' + data[i] + ' %</strong>');
						 $(row).find('td:eq(' + i + ')').css({'border-bottom':'1px solid #848484'});
					 }
				 }
				 
				 
			 }
		});
	    }
	    else {
	    // how to change the data contained inside datatable?
	        tableReporte1.fnClearTable();
	        tableReporte1.fnAddData(dataReporte);
	        tableReporte1.fnAdjustColumnSizing();
	    }
	}
	
	
	function setDataTable(pdivTable,pdataReporte,pcolumnsReport,ptipo,pcount)
	{
		document.getElementById(pdivTable).innerHTML = '<table id="' + (pdivTable+'ads') + '"class="display compact table table-bordered table-hover"><thead class="bg-primary"></thead></table>';
		
		if(ptipo == 0){
			document.getElementById(pdivTable).innerHTML = 'No se ha encontrado información para este rango de fecha, por favor prueba cambiando de rango o espera unos minutos y vuelve a intentarlo.';
			return;
		}
		
		if(typeof tableReporte2 === 'undefined') 
	    {
	    
		var tableReporte2 = $(('#'+pdivTable+'ads')).DataTable({
			data : pdataReporte,
			columns : pcolumnsReport,
			"info":     false,
			"bPaginate": (pcount > 10 ? true : false),
			"ordering": false,
			"pageLength": 10,
			dom: 'Bfrtip',
			buttons: [
	            'copy', 'csv', 'excel', 'pdf', 'print'
	        ]
		});
	    }
	    else {
	    // how to change the data contained inside datatable?
	        tableReporte2.fnClearTable();
	        tableReporte2.fnAddData(dataReporte);
	        tableReporte2.fnAdjustColumnSizing();
	    }
	}
	
	function setChart(pdivGraf,ptitle,pcategorias,pseries){
		document.getElementById(pdivGraf).innerHTML = '<div id="' + (pdivGraf+'ads') + '" style="height: 80%; margin: 0 auto"></div>';
		
		Highcharts.chart(pdivGraf+'ads', {
		    chart: {
		        type: 'column'
		    },
		    title: {
		        text: ptitle
		    },
		    xAxis: {
		        categories: pcategorias
		    },
		    yAxis: {
		        min: 0,
		        title: {
		            enabled:false
		        },
		        stackLabels: {
		            enabled: true,
		            style: {
		                fontWeight: 'bold',
		                color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
		            }
		        }
		    },
		    legend: {
		        backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
		        borderColor: '#CCC',
		        borderWidth: 1,
		        shadow: true
		    },
		    tooltip: {
		        headerFormat: '<b>{point.x}</b><br/>',
		        pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
		    },
		    plotOptions: {
		        column: {
		            stacking: 'normal',
		            dataLabels: {
		                enabled: false,
		                color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
		            }
		        }
		    },
		    series: pseries
		});
		
	}
	
</script>

</html>