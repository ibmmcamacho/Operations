<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/Charts/ChartJS/js/Chart.min.js"></script> --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/Charts/ChartJS/js/Chart.bundle.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/Charts/ECharts/js/echartsWC.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/js/jquery-ui.min.js"></script>


<script type="text/javascript">

var f=new Date();
var date = f.getFullYear() + '-' + ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f.getMonth() + 1)) + '-' + (f.getDate()  < 10 ? '0' + f.getDate()  : f.getDate());

var vTeam = document.getElementById('hdIdTeam').value;
document.getElementById("txtInicio").value = date;
document.getElementById("txtFin").value = date;


listOptions('GRUPOPROPIETARIO_ALERTA', vTeam);
listOptions('ORIGEN_MAXIMO', vTeam);


setInterval(function(){ listTendenciaActual(0); }, 300000);

$(document).ready(function(){

	var ctxPeriodo = document.getElementById("cvPeriodos");
	
	$('#btnConsultar').click(function(){
		listPaises();
		listClientes();
		listFrecuencia();
		listTendenciaActual(1);
	});
	
	$('#btnTicketsTendencia').click(function(){
		$('#mdTicketsReporte').modal('show');
		listReport('listticketsTendenciaActual');
	});
	
	$('#btnTicketsPaises').click(function(){
		$('#mdTicketsReporte').modal('show');
		listReport('listticketspais');
	});
	
	$('#btnTicketsClientes').click(function(){
		$('#mdTicketsReporte').modal('show');
		listReport('listticketsclientes');
	});
	
	$('#btnTicketsDiario').click(function(){
		$('#mdTicketsReporte').modal('show');
		listReport('listticketsFrecuencia');
	});
	
		// Make the dashboard widgets sortable Using jquery UI
	  $('.connectedSortable').sortable({
	    placeholder         : 'sort-highlight',
	    connectWith         : '.connectedSortable',
	    handle              : '.box-header, .nav-tabs',
	    forcePlaceholderSize: true,
	    zIndex              : 999999
	  });
	  $('.connectedSortable .box-header, .connectedSortable .nav-tabs-custom').css('cursor', 'move');
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																	
});

function init(){

	$('#cboTipoTickets').val('0').trigger("change");
	$('#cboClase').val('0').trigger("change");
	$('#cboFuente').val('0').trigger("change");
	$('#cboGrupoPropietario').val(['I-PCT-PE-VIR01','I-COP-PE-VIR01','I-COP-IN-VIR01']).trigger("change");
	$('#cboGrupoResolutor').val('0').trigger("change");
}

function listOptions(tipo, team) {
		$(document).ready(function() {

			var src = "ServletWOptions";
			$.post(src, {
				strOperation : "listOptions",
				strType : tipo,
				iTeam : team
			}, function(pdata) {
				// 				alert(pdata);
				var obj = JSON.parse(pdata);
				
				if (obj.reporte.length > 0) {
				
					if (tipo == "GRUPOPROPIETARIO_ALERTA") {
						$('#cboGrupoPropietario option').remove();
						$('#cboGrupoPropietario').append($('<option>', {
							value : '0',
							text : 'Todos'
						}));
						
						$.each(obj.reporte, function(i, item) {
							$('#cboGrupoPropietario').append($('<option>', {
								value : item.valor1,
								text : item.descripcion
							}));
						});
						
						$('#cboGrupoResolutor option').remove();
						$('#cboGrupoResolutor').append($('<option>', {
							value : '0',
							text : 'Todos'
						}));

						$.each(obj.reporte, function(i, item) {
							$('#cboGrupoResolutor').append($('<option>', {
								value : item.valor1,
								text : item.descripcion
							}));
						});
						
						$('#cboGrupoPropietario').select2({ minimumResultsForSearch: -1, width: '100%' });
						$('#cboGrupoResolutor').select2({ minimumResultsForSearch: -1, width: '100%' });
						
						init();
						
						listPaises();
						listClientes();
						listFrecuencia();
						listTendenciaActual(1);
					}
					else if (tipo == "ORIGEN_MAXIMO") {
						$('#cboFuente option').remove();
						$('#cboFuente').append($('<option>', {
							value : '0',
							text : 'Todos'
						}));

						$.each(obj.reporte, function(i, item) {
							$('#cboFuente').append($('<option>', {
								value : item.valor1,
								text : item.descripcion
							}));
						});
						
						$('#cboFuente').select2({ minimumResultsForSearch: -1, width: '100%' });
						
						init();
						
						
						
					}
				}
			});
		});
	}


function listPaises(tipo){
	
	var vtxtInicio = $('#txtInicio').val();
	var vtxtFin = $('#txtFin').val();
	var vcboTipoTickets = $('#cboTipoTickets').val();
	var vcboClase = $('#cboClase').val();
	var vcboFuente = $('#cboFuente').val();
	var vcboGrupoPropietario = $('#cboGrupoPropietario').val();
	var vcboGrupoResolutor = $('#cboGrupoResolutor').val();
	
	$('#dvLoadPaises').removeClass('overlay');
	$('#dvLoadPaises').addClass('overlay');
	document.getElementById('dvLoadPaises').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
	
	var src = 'ServletMaximoWH';
	$.post(src, {
				strOperation : 'listpais', 
				ptxtInicio : vtxtInicio,
				ptxtFin : vtxtFin,
				pcboTipoTickets : String(vcboTipoTickets),
				pcboClase : String(vcboClase),
				pcboFuente : String(vcboFuente),
				pcboGrupoPropietario : String(vcboGrupoPropietario),
				pcboGrupoResolutor : String(vcboGrupoResolutor),
				ptipo : tipo
			}, function(pdata) {
				var obj = JSON.parse(pdata);
				
				var options = {
					legend: {
			            display: false
			        },
			        responsive: true,
                    scales: {
                        yAxes: [{
                            ticks: {
                                beginAtZero: true,
                                steps: 0,
                                stepValue: 0,
                                min: 0
                                }
                        }]
                    }
				}
				
				
				document.getElementById('dvPaises').innerHTML = "<canvas id=\"cvPaises\" width=\"100\" height=\"50\"></canvas>";
				var ctxPaises = document.getElementById("cvPaises");
				var barChartPaises = new Chart(ctxPaises, {
				    type: 'bar',
				    data: obj.dataPaises,
				    options: options
				});
				
				var vtotal = 0;
				var vtbPais = '<div class=\'table-responsive\'><table class=\'table table-striped table-bordered table-condensed\'><thead><tr class=\'bg-primary\'><th>País</th><th>Cantidad</th></tr></thead><tbody>';
				$.each(obj.paises, function(i, item) {
						vtbPais = vtbPais + '<tr><td>' + item.pais + '</td><td>' + item.cantidad + '</td></tr>';
						vtotal = vtotal + parseInt(item.cantidad);
						});
				vtbPais = vtbPais + '<tr><td>TOTAL</td><td>' + vtotal + '</td></tr>';
				vtbPais = vtbPais + '</tbody></table>';
				
				document.getElementById('dvPaisesData').innerHTML = vtbPais;
				
				ctxPaises.onclick = function (evt) {
					/*console.log(evt);
					var activePoints = barChartPaises.getElementsAtEvent(evt);
				  	console.log(activePoints);*/
				  	
			      var activePoints = barChartPaises.getElementsAtEvent(evt);
			      var chartData = activePoints[0]['_chart'].config.data;
			      var idx = activePoints[0]['_index'];
			
			      var label = chartData.labels[idx];
			      var value = chartData.datasets[0].data[idx];
			      
			      listClientes(label);
			      
// 			      var url = "http://example.com/?label=" + label + "&value=" + value;
// 			      console.log(url);
			    };
			    
			    document.getElementById('dvLoadPaises').innerHTML = '';
				$('#dvLoadPaises').removeClass('overlay');
				
			});
}

function listClientes(tipo){
	
	var vtxtInicio = $('#txtInicio').val();
	var vtxtFin = $('#txtFin').val();
	var vcboTipoTickets = $('#cboTipoTickets').val();
	var vcboClase = $('#cboClase').val();
	var vcboFuente = $('#cboFuente').val();
	var vcboGrupoPropietario = $('#cboGrupoPropietario').val();
	var vcboGrupoResolutor = $('#cboGrupoResolutor').val();
	
	$('#dvLoadClientes').removeClass('overlay');
	$('#dvLoadClientes').addClass('overlay');
	document.getElementById('dvLoadClientes').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
	
	var src = 'ServletMaximoWH';
	$.post(src, {
				strOperation : 'listclientes', 
				ptxtInicio : vtxtInicio,
				ptxtFin : vtxtFin,
				pcboGrupoPropietario : String(vcboGrupoPropietario),
				pcboFuente : String(vcboFuente),
				ptipo : tipo
			}, function(pdata) {
				var obj = JSON.parse(pdata);
				
				var options = {
					scales: {
					}
				}

				document.getElementById('dvClientes').innerHTML = '<div id="dvClientesMain" style="height:280px;"></div>';
				
				var chart = echarts.init(document.getElementById('dvClientesMain'));
				chart.setOption(obj.dataClientes);

				var vtotal = 0;
				var vtbClientes = '<div class=\'table-responsive\'><table class=\'table table-striped table-bordered table-condensed\'><thead><tr class=\'bg-primary\'><td>Cliente</td><td>Cantidad</td></tr></thead><tbody>';
				$.each(obj.clientes, function(i, item) {
						vtbClientes = vtbClientes + '<tr><td><a href=\'#\' onclick="listFrecuencia(\'' + item.cliente.trim() + '\')">' + item.cliente + '</a></td><td>' + item.cantidad + '</td></tr>';
						vtotal = vtotal + parseInt(item.cantidad);
						});
				vtbClientes = vtbClientes + '<tr><td>TOTAL</td><td>' + vtotal + '</td></tr>';
				vtbClientes = vtbClientes + '</tbody></table>';
				document.getElementById('dvClientesData').innerHTML = vtbClientes;


				chart.on('click', function(evt){
					listFrecuencia(evt.name);
				} )
				
				document.getElementById('dvLoadClientes').innerHTML = '';
				$('#dvLoadClientes').removeClass('overlay');

			});
}


function listFrecuencia(tipo){

	var vtxtInicio = $('#txtInicio').val();
	var vtxtFin = $('#txtFin').val();
	var vcboTipoTickets = $('#cboTipoTickets').val();
	var vcboClase = $('#cboClase').val();
	var vcboFuente = $('#cboFuente').val();
	var vcboGrupoPropietario = $('#cboGrupoPropietario').val();
	var vcboGrupoResolutor = $('#cboGrupoResolutor').val();
	
	
	$('#dvLoadFrecuencia').removeClass('overlay');
	$('#dvLoadFrecuencia').addClass('overlay');
	document.getElementById('dvLoadFrecuencia').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
	
	var src = 'ServletMaximoWH';
	$.post(src, {
				strOperation : 'listFrecuencia', 
				ptxtInicio : vtxtInicio,
				ptxtFin : vtxtFin,
				pcboGrupoPropietario : String(vcboGrupoPropietario),
				pcboFuente : String(vcboFuente),
				ptipo : tipo
			}, function(pdata) {
				var obj = JSON.parse(pdata);
				
				var options = {
	                responsive: true,
	                hoverMode: 'index',
	                stacked: false,
	                title:{
	                    display: true,
	                    text:'Tendencia de generación de tickets'
	                },
	                scales: {
	                    yAxes: [{
	                        type: "linear", // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
	                        display: true,
	                        position: "left",
	                        id: "y-axis-1",
	                    }]
	                }
            	}
            	
            	var options1 = {}
				
				document.getElementById('dvFrecuencia1').innerHTML = '<canvas id="cvFrecuencia1" width="100" height="50"></canvas>';
				var ctxFrecuencia1 = document.getElementById("cvFrecuencia1");
// 				console.log(obj.dataFrecuencia);
				var barChartFrecuencia1 = new Chart(ctxFrecuencia1, {
				    type: 'line',
				    data: obj.dataFrecuencia,
				    options: options
				});
				
				document.getElementById('dvFrecuencia2').innerHTML = '<canvas id="cvFrecuencia2" width="100" height="50"></canvas>';
				var ctxFrecuencia2 = document.getElementById("cvFrecuencia2");
// 				console.log(obj.dataFrecuencia);
				var barChartFrecuencia2 = new Chart(ctxFrecuencia2, {
				    type: 'doughnut',
				    data: obj.estados,
				    options: options1
				});
				
				var vtotal = 0;
				var vtbFrecuencia = '<div class=\'table-responsive\'><table class=\'table table-striped table-bordered table-condensed\'><thead><tr class=\'bg-primary\'><th>Día</th><th>Cantidad</th></tr></thead><tbody>';
				$.each(obj.frecuencias, function(i, item) {
// 				console.log(i + ' || ' + item);
// 						if(i > 0){
							vtbFrecuencia = vtbFrecuencia + '<tr><td>' + item.frecuencia + '</td><td>' + item.cantidad + '</td></tr>';
							vtotal = vtotal + parseInt(item.cantidad);
// 						}
						});
				vtbFrecuencia = vtbFrecuencia + '<tr><td>TOTAL</td><td>' + vtotal + '</td></tr>';
				vtbFrecuencia = vtbFrecuencia + '</tbody></table>';
				document.getElementById('dvFrecuenciaData').innerHTML = vtbFrecuencia;
				
				document.getElementById('dvLoadFrecuencia').innerHTML = '';
				$('#dvLoadFrecuencia').removeClass('overlay');
			});
}

function listTendenciaActual(tipo){
	
	var vtxtInicio = $('#txtInicio').val();
	var vtxtFin = $('#txtFin').val();
	var vcboGrupoPropietario = $('#cboGrupoPropietario').val();
	var vcboFuente = $('#cboFuente').val();
	if(tipo == 1){
		$('#dvLoadTendenciaActual').removeClass('overlay');
		$('#dvLoadTendenciaActual').addClass('overlay');
		document.getElementById('dvLoadTendenciaActual').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
	}
	
	
	var src = 'ServletMaximoWH';
	$.post(src, {
				strOperation : 'listTendenciaActual', 
				ptxtInicio : vtxtInicio,
				ptxtFin : vtxtFin,
				pcboGrupoPropietario : String(vcboGrupoPropietario),
				pcboFuente : String(vcboFuente),
				ptipo : (tipo == 1 ? 'si' : 'no')
			}, function(pdata) {
				
				if(pdata != 'vacio'){
					var obj = JSON.parse(pdata);
// 					console.log(obj);
					
					document.getElementById('dvTendenciaActual').innerHTML = '<canvas id="cvTendenciaActual" width="100" height="30"></canva>';
					var ctxFrecuencia1 = document.getElementById("cvTendenciaActual");
					
					var ctxTendenciaActual = document.getElementById("cvTendenciaActual").getContext("2d");
					var barTendenciaActual = new Chart(ctxTendenciaActual, obj.tendenciaActual);
					
					if(tipo == 1){
						document.getElementById('dvLoadTendenciaActual').innerHTML = '';
						$('#dvLoadTendenciaActual').removeClass('overlay');
					}
				}
				else{
					document.getElementById('dvLoadTendenciaActual').innerHTML = '';
					$('#dvLoadTendenciaActual').removeClass('overlay');
				}
					
				});			
}


	function listReport(tipo)
		{
		$(document).ready(function() {
			var vtxtInicio = $('#txtInicio').val();
			var vtxtFin = $('#txtFin').val();
			var vcboGrupoPropietario = $('#cboGrupoPropietario').val();
			var vcboFuente = $('#cboFuente').val();
			
			var htmlTable = '<table id=\"tblTickets\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
			document.getElementById('tbcontainer').innerHTML = 	htmlTable;
			
			$('#dvLoadTicketsReporte').removeClass('overlay');
			$('#dvLoadTicketsReporte').addClass('overlay');
			document.getElementById('dvLoadTicketsReporte').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
			
			var src = 'ServletMaximoWH';
			$.post(src, {
						strOperation : tipo, 
						ptxtInicio : vtxtInicio,
						ptxtFin : vtxtFin,
						pcboGrupoPropietario : String(vcboGrupoPropietario),
						pcboFuente : String(vcboFuente),
						ptipo : tipo
					}, function(pdata) {
							var obj = JSON.parse(pdata);
							var dataReporte = [];

						  	for(i = 0 ; i < obj.ticketsReporte.length ; i++ )
						  	{
								var arr = [];
								arr.push(obj.ticketsReporte[i].pais);
								arr.push(obj.ticketsReporte[i].ticket);
								arr.push(obj.ticketsReporte[i].estado);
								arr.push(obj.ticketsReporte[i].cliente);
								arr.push(obj.ticketsReporte[i].titulo);
								arr.push(obj.ticketsReporte[i].fecha);
								dataReporte.push(arr);
							}
						  
						  columnsReport = [ 
						  	{title : "PAIS"},
						    {title : "TICKET"},
						    {title : "ESTADO"}, 
						    {title : "CLIENTE"}, 
				            {title : "TITULO"}, 
				            {title : "FECHA"}
				          ]; 
					    setData(dataReporte,columnsReport);
					    document.getElementById('dvLoadTicketsReporte').innerHTML = '';
						$('#dvLoadTicketsReporte').removeClass('overlay');
			});
			
		});
		}
	
	
	
	
	function setData(pdataReporte,pcolumnsReport)
	{
		var htmlTable = '<table id=\"tblTickets\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
		document.getElementById('tbcontainer').innerHTML = 	htmlTable;
	
		var buttonCommon = {
				exportOptions : {
					format : {
						body : function(data, row, column, node) {
							// Strip $ from salary column to make it numeric
							return column === 5 ? data.replace(
									/[$,]/g, '') : data;
						}
					}
				}
			};
		
		if(typeof tableReporte === 'undefined') 
	    {
// 	    console.log('in if');
	    
		var tableReporte = $('#tblTickets').DataTable(
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
	    }
	    else {
// 	        console.log('in else');
	    // how to change the data contained inside datatable?
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
	}
</script>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-101093319-1', 'auto');
  ga('send', 'pageview');

</script>

</head>
<body>


<!-- Modal -->
<!-- 	<div class="modal fade" id="mdLayout" role="dialog" -->
<!-- 		aria-labelledby="myModalLabel"> -->
<!-- 		<div class="modal-dialog modal-lg" role="document"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="box box-primary"> -->
<!-- 					<div class="box-header with-border"> -->
<!-- 						<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i>DETALLE DE TICKETS</h3> -->
<!-- 					</div> -->
<!-- 					<div class="box-body"> -->
<!-- 						<div class="row"> -->
<!-- 							<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12"> -->
<!-- 								<div class="table-responsive"> -->
<!-- 									<div class="form-group"> -->
<!-- 										<span>Tipos de Tickets:</span> -->
<!-- 									</div> -->
<!-- 									<div class="form-group"> -->
<!-- 										<select id="cboTipoTickets" multiple="multiple" class="cbo2"> -->
<!-- 											<option>BackLog</option> -->
<!-- 											<option>Resueltos</option> -->
<!-- 										</select> -->
<!-- 									</div> -->
<!-- 									<div class="form-group"> -->
<!-- 										<span>Clase de Tickets:</span> -->
<!-- 									</div> -->
<!-- 									<div class="form-group"> -->
<!-- 										<select id="cboFuente1" multiple="multiple" class="cbo2"> -->
<!-- 											<option>INCIDENCIA</option> -->
<!-- 											<option>SERVICIO</option> -->
<!-- 											<option>PROBLEMA</option> -->
<!-- 											<option>WORKORDER CANCELADO</option> -->
<!-- 											<option>WORKORDER ACTIVO</option> -->


<!-- 										</select> -->
<!-- 									</div> -->
<!-- 									<div class="form-group"> -->
<!-- 										<span>Grupo Propietario:</span> -->
<!-- 									</div> -->
<!-- 									<div class="form-group"> -->
<!-- 										<select id="cboGrupoPropietario" multiple="multiple" class="cbo2"> -->
<!-- 											<option>I-PCT-PE-VIR01</option> -->
<!-- 											<option>I-COP-PE-VIR01</option> -->
<!-- 											<option>I-PCT-IN-VIR01</option> -->
<!-- 											<option>I-COP-IN-VIR01</option> -->
<!-- 										</select> -->
<!-- 									</div> -->
<!-- 									<div class="form-group"> -->
<!-- 										<span>Grupo Resolutor:</span> -->
<!-- 									</div> -->
<!-- 									<div class="form-group"> -->
<!-- 										<select id="cboGrupoResolutor" multiple="multiple" class="cbo2"> -->
<!-- 											<option>I-PCT-PE-VIR01</option> -->
<!-- 											<option>I-COP-PE-VIR01</option> -->
<!-- 											<option>I-PCT-IN-VIR01</option> -->
<!-- 											<option>I-COP-IN-VIR01</option> -->
<!-- 										</select> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="modal-footer"> -->
<!-- 						<a class="btn btn-default" data-dismiss="modal"><i class="fa fa-undo" aria-hidden="true"></i> Atras</a> -->
<!-- 					</div> -->
<!-- 					<div id="dvLoadTicketsReporte"></div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->














<!-- Modal -->
	<div class="modal fade" id="mdTicketsReporte" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i>DETALLE DE TICKETS</h3>
					</div>
					<div class="box-body">
						<div class="row">
							<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
								<div id="tbcontainer" class="table-responsive">
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a class="btn btn-default" data-dismiss="modal"><i class="fa fa-undo" aria-hidden="true"></i> Atras</a>
					</div>
					<div id="dvLoadTicketsReporte"></div>
				</div>
			</div>
		</div>
	</div>

<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
	<section class="content-header">
	<h1>
		Dashboard <small>Comparativo India</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-th-large"></i> Dashboard</a></li>
		<li class="active">Comparativo India</li>
	</ol>
	</section> <!-- Main content -->
	<section class="content"> <!-- top row -->
	<input id="hdIdAlerta" type="hidden">
	<input id="hdTipo" type="hidden">
	
	<div class="row">
		<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
			<div class="form-inline">
				<div class="form-group">
					<span>Periodo:</span>
					<input type="text" class="form-control datePicker" id="txtInicio">
					<input type="text" class="form-control datePicker" id="txtFin">
				</div>
				<div class="form-group">
<!-- 					<a class="btn btn-primary" role="button" data-toggle="collapse" href="#opcionesAvanzadas" aria-expanded="false" aria-controls="#opcionesAvanzadas"> -->
<!-- 				  Link with href -->
<!-- 					</a> -->
					<button id="btnConsultar" class="btn btn-primary" type="button">
					  Consultar
					</button>
					<button class="btn btn-default" type="button" data-toggle="collapse" data-target="#opcionesAvanzadas" aria-expanded="false" aria-controls="#opcionesAvanzadas">
					  Opciones Avanzadas
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
			<div class="collapse" id="opcionesAvanzadas">
			  <div class="well">
				<div class="row">
					<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
						<div class="table-responsive">
							<div class="form-group">
								<span>Tipos de Tickets:</span>
							</div>
							<div class="form-group">
								<select id="cboTipoTickets" multiple="multiple" class="cbo2">
									<option value="0">Todos</option>
									<option value="backlog">BackLog</option>
									<option value="resueltos">Resueltos</option>
								</select>
							</div>
							
							<div class="form-group">
								<span>Clase de Tickets:</span>
							</div>
							<div class="form-group">
								<select id="cboClase" multiple="multiple" class="cbo2">
									<option value="0">Todos</option>
									<option value="INCIDENT">Incidencia</option>
									<option value="SR">Servicio</option>
									<option value="PROBLEM">Problema</option>
									<option value="CHANGE">Cambio</option>
									<option value="WORKORDER">WorkOrder</option>
								</select>
							</div>
							<div class="form-group">
								<span>Origen:</span>
							</div>
							<div class="form-group">
								<select id="cboFuente" multiple="multiple" class="cbo2">
								</select>
							</div>
							<div class="form-group">
								<span>Grupo Propietario:</span>
							</div>
							<div class="form-group">
								<select id="cboGrupoPropietario" multiple="multiple" class="cbo2">
								</select>
							</div>
							<div class="form-group">
								<span>Grupo Resolutor:</span>
							</div>
							<div class="form-group">
								<select id="cboGrupoResolutor" multiple="multiple" class="cbo2">
								</select>
							</div>
						</div>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
					<div class="table-responsive">
<!-- 						<div class="form-inline"> -->
							
<!-- 						</div> -->
					</div>
					</div>
				</div>
			  </div>
			</div>
		</div>
	</div>
	
	<br>
	<div class="row">
		<section class="col-xs-12 col-sm-12 col-md-12 col-lg-12 connectedSortable">
			<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"> <i class="fa fa-line-chart" aria-hidden="true"></i> TENDENCIA ACTUAL</h3>
				<a id="btnTicketsTendencia" class="btn btn-default btn-sm pull-right"><i class="fa fa-ticket" aria-hidden="true"></i> Ver Tickets</a>
			</div>
			<div class="box-body">
				<div id="dvcontainer" class="table-responsive">
					<div class="form-group" id="dvTendenciaActual">
						<canvas id="cvTendenciaActual" width="100" height="30"></canvas>
					</div>
				</div>
			</div>
			<div id="dvLoadTendenciaActual"></div>
			</div>
		</section>
	</div>
	<div class="row">
		<section class="col-xs-12 col-sm-6 col-md-6 col-lg-4 connectedSortable">
		
		<div class="box box-primary">
			<div class="box-header with-border ui-sortable-handle">
				<h3 class="box-title"> <i class="fa fa-globe" aria-hidden="true"></i> PAISES</h3>
				<a id="btnTicketsPaises" class="btn btn-default btn-sm pull-right"><i class="fa fa-ticket" aria-hidden="true"></i> Ver Tickets</a>
			</div>
			<div class="box-body">
				<div id="dvcontainer" class="table-responsive">
					
					<div class="form-group" id="dvPaises">
						<canvas id="cvPaises" width="100" height="100"></canvas>
					</div>
					<div class="form-group" id="dvPaisesData" style="max-height: 300px">
					</div>
				</div>
			</div>
			<div id="dvLoadPaises"></div>
		</div>
		</section>

		<section class="col-xs-12 col-sm-6 col-md-6 col-lg-4 connectedSortable">

		<div class="box box-primary">
			<div class="box-header with-border ui-sortable-handle">
				<h3 class="box-title"> <i class="fa fa-suitcase" aria-hidden="true"></i> CLIENTES</h3>
				<a id="btnTicketsClientes" class="btn btn-default btn-sm pull-right"><i class="fa fa-ticket" aria-hidden="true"></i> Ver Tickets</a>
			</div>
			<div class="box-body">
				<div id="dvcontainer" class="table-responsive">

					<div class="form-group" id="dvClientes">
						<div id="dvClientesMain" style="height:280px;"></div>
<!-- 						<canvas id="cvClientes" width="100" height="100"></canvas> -->
					</div>
					<div class="form-group" id="dvClientesData" style="max-height: 300px">
					</div>
				</div>
			</div>
			<div id="dvLoadClientes"></div>
		</div>
			
		</section>
		<section class="col-xs-12 col-sm-6 col-md-6 col-lg-4 connectedSortable">
		
		<div class="box box-primary">
			<div class="box-header with-border ui-sortable-handle">
				<h3 class="box-title"> <i class="fa fa-calendar-check-o" aria-hidden="true"></i> DIARIO</h3>
				<a id="btnTicketsDiario" class="btn btn-default btn-sm pull-right"><i class="fa fa-ticket" aria-hidden="true"></i> Ver Tickets</a>
			</div>
			<div class="box-body">
				<div id="dvcontainer" class="table-responsive">
				
						<div class="form-group" id="dvFrecuencia1">
						<canvas id="cvFrecuencia1" width="100" height="100"></canvas>
						</div>
						<div class="form-group" id="dvFrecuenciaData" style="max-height: 300px">
						</div>
				</div>
			</div>
			<div id="dvLoadFrecuencia"></div>
		</div>
		
		<div class="box box-primary">
			<div class="box-header with-border ui-sortable-handle">
				<h3 class="box-title"> <i class="fa fa-check-square-o" aria-hidden="true"></i> ESTADOS</h3>
				<a id="btnTicketsDiario" class="btn btn-default btn-sm pull-right"><i class="fa fa-ticket" aria-hidden="true"></i> Ver Tickets</a>
			</div>
			<div class="box-body">
				<div id="dvcontainer" class="table-responsive">
				
						<div class="form-group" id="dvFrecuencia2">
						<canvas id="cvFrecuencia2" width="100" height="100"></canvas>
						</div>
<!-- 						<div class="form-group" id="dvFrecuenciaData" style="max-height: 300px"> -->
<!-- 						</div> -->
				</div>
			</div>
			<div id="dvLoadFrecuencia"></div>
		</div>
			
		</section>
	</div>
	</section>
</aside>
</body>
</html>