<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/air-datepicker-master/dist/css/datepicker.min.css">
<!-- Librerias para toggle -->
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap-toggle/css/bootstrap-toggle.min.css" media="all"/> --%>
<!-- <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet"> -->



<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->

<!-- <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet"> -->



<style  type="text/css">
.ui-datepicker{z-index: 99 !important};
</style>

   <!-- Librerias para toggle -->
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap-toggle/js/bootstrap-toggle.min.js" media="all"/> --%>
<!-- <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script> -->

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/Charts/ChartJS/js/Chart.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/air-datepicker-master/dist/js/datepicker.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/air-datepicker-master/dist/js/i18n/datepicker.es.js"></script>
<%-- 	<script src="<%=request.getContextPath()%>/resources/jsPDF/js1_4/jspdf.min.js"></script> --%>
<%--     <script src="<%=request.getContextPath()%>/resources/jsPDF/js1_4/plugins/addhtml.js"></script> --%>
<%--     <script src="<%=request.getContextPath()%>/resources/jsPDF/js1_4/plugins/cell.js"></script> --%>
<%--     <script src="<%=request.getContextPath()%>/resources/jsPDF/js1_4/plugins/jspdf.plugin.autotable.js"></script> --%>
    
<!--     <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script> -->
<%-- 	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/air-datepicker-master/dist/js/datepicker.min.js"></script> --%>
<%-- 	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/air-datepicker-master/dist/js/i18n/datepicker.es.js"></script> --%>
   
   

<script type="text/javascript">

$(function() {
	    $('#checkOption').bootstrapToggle();
//     $('#checkOption').bootstrapToggle('enable');
	 });
	 
//Make the dashboard widgets sortable Using jquery UI
$('.connectedSortable').sortable({
	placeholder : 'sort-highlight',
	connectWith : '.connectedSortable',
	handle : '.box-header, .nav-tabs',
	forcePlaceholderSize : true,
	zIndex : 999999
});
$('.connectedSortable .box-header, .connectedSortable .nav-tabs-custom').css('cursor', 'move');

Date.prototype.getWeek = function () {
	var onejan = new Date(this.getFullYear(), 0, 1);		
	return Math.ceil((((new Date(this.getFullYear(), this.getMonth(), this.getDate()) - onejan) / 86400000) + onejan.getDay() + 1) / 7);	
};


var mes;
var anio;
var idproyecto;
var nomproyecto;
$(document).ready(function() {
	
	$("#cboSemana").select2();
	
	$('#divSemana').hide();
// 	$('#checkOption').bootstrapToggle('enable');
	$('#checkOption').bootstrapToggle('enable');
	

	
	$("#checkOption").on( 'change', function() {
		if($('#checkOption').is(':checked') ){
			$('#divSemana').hide();	
			$('#divMes').show();
		}else{
			$('#divSemana').show();	
			$('#divMes').hide();	
			
		}
	});
	
	var ultimodia = new Date();
	var limiteSemana = ultimodia.getWeek();
	
	var semana;
	
	$("#cboSemana").on('change', function() {
	
		ultimodia = new Date();
		limiteSemana = ultimodia.getWeek();
		
	});
	

	$('#txtPeriodo').datepicker().on('click', function (ev) {
	        $('.datepicker').css("z-index", "999999999");
	}).data('datepicker');
	
	$('#txtPeriodo').datepicker({
        maxDate: new Date(),
        minDate: new Date('2016-01-01')
	});
	
	$('#txtPeriodo').datepicker().data('datepicker').selectDate(new Date());
	

	$('#txtAnio').datepicker().on('click', function (ev) {
        $('.datepicker').css("z-index", "999999999");
	}).data('datepicker');
	
	$('#txtAnio').datepicker({
	    maxDate: new Date(),
	    minDate: new Date('2016-01-01')
	});
	
	$('#txtAnio').datepicker().data('datepicker').selectDate(new Date());

	listarComboProyecto();
	
	listarComboSemana(limiteSemana);
	
	 $('#btnConsultar').click(function() {
		// Haciendo visible Modal con Barra de progreso 
			var $modal = $('.js-loading-bar');
			$modal.modal('show');
			
			$('#divContentSDD1').empty();
			$('#divContentDCS1').empty();
			$('#divContentSDD2').empty();
			$('#divContentDCS2').empty();
			
			$('#divtabSDD1').hide();
			$('#divtabSDD2').hide();
			$('#divtabDCS1').hide();
			$('#divtabDCS2').hide();
			
			anio= "0000";
			mes = "00";
			semana = "0";
			if($('#checkOption').is(':checked')){ //Vista por Periodo (Anio-mes)
				anio = $('#txtPeriodo').val().substr(0,4);
				mes = $('#txtPeriodo').val().substr(5,7);	
				
			}else{								//Vista por Semana (Anio-Semana)
				mes = "01";
				anio = $('#txtAnio').val().substr(0,4);
				semana = $('#cboSemana').val();
			}
		
			idproyecto= $('#cboClientes').val();
			nomproyecto= $("#cboClientes option:selected").html();
			
			 var src = 'ServletMobilityLlamadas';
				$.post(src,{
							strAccion : "2",
							id_proyecto : idproyecto,
							mes : mes,
							anio : anio,
							semana : semana
								},
								function(pdata) {
									var obj = JSON.parse(pdata);
									$('#divGra1').show();
									graficoPorHora(obj);
									$('#divGra2').show();
									graficoPorSemana(obj);
									$('#divGra3').show();
									graficoPorDia(obj);
									$('#divGra4').show();
									graficoPorDiaMes(obj);
									//Ocultar Modal con barra de progreso
									var $modal = $('.js-loading-bar');
									$modal.modal('hide');
								});
			
		});
	 
	 $('#btnReportellamadas').click(function() {
		 	idproyecto= $('#cboClientes').val();
		    var tipoVista;
		 	if($('#checkOption').is(':checked')){ //Vista por Periodo (Anio-mes)
				anio = $('#txtPeriodo').val().substr(0,4);
				mes = $('#txtPeriodo').val().substr(5,7);	
				tipoVista = "1";
				semana = 0;
				
			}else{								//Vista por Semana (Anio-Semana)
				mes = "01";
				anio = $('#txtAnio').val().substr(0,4);
				semana = $('#cboSemana').val();
				tipoVista = "2";
			}

			desactivatabModalReporte();
			
			$('#divlillamadas').show();
			$('#divlilllamadas').addClass("active");
			$('#llamadas').show(); 
			$('#llamadas').addClass("in active");; 
			
			$('#mdReporte').modal('show');
			
			var htmlTableLlamadas = '<table id=\"tblLlamadas\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\" width=\"100%\"></thead></table>';
			document.getElementById('tbcontainerLlamadas').innerHTML = htmlTableLlamadas;
      
				
		var src = 'ServletMobilitySLA';
		$.post(src,{
					strAccion : "8",
					tipoVista : tipoVista,
					id_proyecto : idproyecto,
					mes : mes,
					anio : anio,
					semana : semana 
						},
						function(pdata) {
							var obj = JSON.parse(pdata);
							var dataReporteLlamadas = [];

							for (i = 0; i < obj.ReporteLlamadas.length; i++) {
								var arr = [];
								arr.push(i+1);
								arr.push(obj.ReporteLlamadas[i].fechaInicio);
								arr.push(obj.ReporteLlamadas[i].tiempoCola);
								arr.push(obj.ReporteLlamadas[i].tiempoConversacion);
								arr.push(obj.ReporteLlamadas[i].agente);
								arr.push(obj.ReporteLlamadas[i].tipo);
								dataReporteLlamadas.push(arr);
//	 							console.log(dataReporteLlamadas);
							}
							
							columnsReportLlamadas = [ {
								title : "Nº"}, {
								title : "FECHA INICIO"}, {
								title : "TIEMPO COLA"}, {
								title : "TIEMPO CONVERSACIÓN"}, {	
								title : "AGENTE"}, {
								title : "TIPO"
							} ];
							
							setDataLlamadas(dataReporteLlamadas,columnsReportLlamadas);
				});
		});
	
	function listarComboProyecto() {
	
		$("#cboClientes option").remove();
		$("#cboClientes").append($('<option>', {
			value : "0",
			text : " --SELECCIONE-- "
		}));
	
		var src = "ServletMobilitySLA";
		$.post(src, {
			strAccion : "1"
		}, function(pdata) {
			var obj = JSON.parse(pdata);
			for (i = 0; i < obj.Proyecto.length; i++) {
	
				$('#cboClientes').append($('<option>', {
					value : obj.Proyecto[i].idproyecto,
					text : obj.Proyecto[i].nombreProyecto
				}));
			}
			$('#cboClientes').select2({
				width : '100%'
			});
		});
	
	}// Fin funcion listarComboPeriodo
	  
	function listarComboSemana(numSemanaLimite) {
		
		$("#cboSemana option").remove();
		$("#cboSemana").append($('<option>', {
			value : 0,
			text : " --SELECCIONE-- "
		}));
	
			for (i = 1; i <= numSemanaLimite; i++) {
	
				$('#cboSemana').append($('<option>', {
					value : i,
					text : 'Semana '+i
				}));
			}
		$('#cboSemana').select2({
				width : '100%'
		});
		
	
	}// Fin funcion listarComboPeriodo

	  
	  function tildes_unicode(str){
			str = str.replace(new RegExp("Ã¡","g"), "\u00e1");
			str = str.replace(new RegExp("Ã©","g"), "\u00e9");
			str = str.replace(new RegExp("Ã­","g"), "\u00ed");
			str = str.replace(new RegExp("Ã³","g"), "\u00f3");
			str = str.replace(new RegExp("Ãº","g"), "\u00fa");

			str = str.replace(new RegExp("Ã","g"), "\u00c1");
			str = str.replace(new RegExp("Ã‰","g"), "\u00c9");
			str = str.replace(new RegExp("Ã","g"), "\u00cd");
			str = str.replace(new RegExp("Ã“","g"), "\u00d3");
			str = str.replace(new RegExp("Ãš","g"), "\u00da");
			
			str = str.replace(new RegExp("Ã±","g"), "\u00f1");
			str = str.replace(new RegExp("Ã‘","g"), "\u00d1");

			return str;
		}
	  	$('#divGra1').hide();
		$('#divGra2').hide();
		$('#divGra3').hide();
		$('#divGra4').hide();
	
	 
	
	  var myChart1 ;
	  function graficoPorHora(obj){
		  /* PRIMER GRAFICO */
		  
		  if(myChart1!=null){
			  myChart1.clear();
			  myChart1.destroy();
		  }
		  
		  var ctx = document.getElementById('myChart1');
		   myChart1 = new Chart(ctx, {
		  	  type: 'bar',
		  	  data: obj.LlamadasPorHora[0],
		  	  options: {
		  	    scales: {
		  	      yAxes: [{
		  	        stacked: true,
		  	        ticks: {
		  	          beginAtZero: true,
		  	          fontSize: 18
		  	        }
		  	      }],
		  	      xAxes: [{
		  	        stacked: true,
		  	        ticks: {
		  	          beginAtZero: true,
		  	          fontSize: 18
		  	        }
		  	      }]

		  	    }
		  	  }
		  	});  
	  }
	  var myChart2;
	  
	  function graficoPorSemana(obj){
		  
		  if(myChart2!=null){
			  myChart2.clear();
			  myChart2.destroy();  
		  }
		  
		  
		 var  ctx2 = document.getElementById('myChart2');
		  myChart2 = new Chart(ctx2, {
		  	  type: 'bar',
		  	  data: obj.LlamadasPorSemana[0],
		  	 options: {
			  	    scales: {
			  	      yAxes: [{
			  	        stacked: true,
			  	        ticks: {
			  	          beginAtZero: true,
			  	        fontSize: 18
			  	        }
			  	      }],
			  	      xAxes: [{
			  	        stacked: true,
			  	        ticks: {
			  	          beginAtZero: true,
			  	        fontSize: 18
			  	        }
			  	      }]

			  	    }
			  	  }
			  	});  
		  }
	  
	  var myChart3;
	  
	  	function graficoPorDia(obj){
	  		
	  		if(myChart3!=null){
	  			myChart3.clear();
	  			myChart3.destroy();  
			  }
	  		
		  var ctx2 = document.getElementById('myChart3');
		   myChart3 = new Chart(ctx2, {
		  	  type: 'bar',
		  	  data: obj.LlamadasPorDiaSemana[0],
		  	 options: {
			  	    scales: {
			  	      yAxes: [{
			  	        stacked: true,
			  	        ticks: {
			  	          beginAtZero: true,
			  	        fontSize: 18
			  	        }
			  	      }],
			  	      xAxes: [{
			  	        stacked: true,
			  	        ticks: {
			  	          beginAtZero: true,
			  	        fontSize: 18
			  	        }
			  	      }]

			  	    }
			  	  }
			  	});  
		  }
	  
	  	var myChart4;
		  
	  	function graficoPorDiaMes(obj){
	  		
	  		if(myChart4!=null){
	  			myChart4.clear();
	  			myChart4.destroy();  
			  }
	  		
		  var ctx2 = document.getElementById('myChart4');
		   myChart4 = new Chart(ctx2, {
		  	  type: 'bar',
		  	  data: obj.LlamadasPorDiaMes[0],
		  	 options: {
			  	    scales: {
			  	      yAxes: [{
			  	        stacked: true,
			  	        ticks: {
			  	          beginAtZero: true,
			  	        fontSize: 18
			  	        }
			  	      }],
			  	      xAxes: [{
			  	        stacked: true,
			  	        ticks: {
			  	          beginAtZero: true,
			  	        fontSize: 18
			  	        }
			  	      }]

			  	    }
			  	  }
			  	});  
		  }
	  	
	  
	  	 
	  	 
	  	
	  	
	  	function desactivatabModalReporte(){
			$('#divlillamadas').hide();
			$('#divlillamadas').removeClass("active");
			$('#llamadas').hide();
			$('#llamadas').removeClass("in active");
			
			$('#divlitickets').hide();
			$('#divlitickets').removeClass("active");
			$('#tickets').hide();
			$('#tickets').removeClass("in active");
			
			$('#divliworkorder').hide();
			$('#divliworkorder').removeClass("active");
			$('#workorder').hide();
			$('#workorder').removeClass("in active");	
		}
	  	
	  	
	  	function setDataLlamadas(pdataReporte, pcolumnsReport) {

			if (typeof tableReporte === 'undefined') {

				var tableReporte = $('#tblLlamadas')
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
	  	 
});  


//Setup Barra de progreso
this.$('.js-loading-bar').modal({
	backdrop : 'static',
	show : false
});
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

<!-- Modal REPORTE LLAMADAS-->
	<div class="modal fade" id="mdReporte" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> REPORTE</h3>
					</div>
					<div class="box-body">
					<ul class="nav nav-tabs">
					  <li id="divlillamadas"><a data-toggle="tab" href="#llamadas">LLAMADAS</a></li>
					  <li id="divlitickets"><a data-toggle="tab" href="#tickets">TICKETS</a></li>
					  <li id="divliworkorder" ><a data-toggle="tab" href="#workorder">WORK ORDER</a></li>
					</ul>
					<div class="tab-content">
					  <div id="llamadas" class="tab-pane fade">
						<div class="row">
							<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
								<div id="tbcontainerLlamadas" class="table-responsive">
								</div>
							</div>
						</div>
					  </div>
					  <div id="tickets" class="tab-pane fade">
						<div class="row">
							<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
								<div id="tbcontainerTickets" class="table-responsive">
								</div>
							</div>
						</div>
					  </div>
					  <div id="workorder" class="tab-pane fade">
						<div class="row">
							<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
								<div id="tbcontainerWO" class="table-responsive">
								</div>
							</div>
						</div>
					  </div>
					</div>
				</div>
				<div class="modal-footer">
                 	<button type="button" class="btn btn-danger " data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
                </div> 
                <div id="dvLoadReporte"></div>
			</div>
		</div>
	</div>
	</div>
	

<!--   <aside class="right-side sizeHeight " style="background-color: #1B3648; color: white">  -->
	  <aside class="right-side" > 
	 	<section class="content-header">
		<h1><i class="fa fa-tachometer" aria-hidden="true"></i>
		Dashboard LLAMADAS<small>Mobility</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-th-large"></i> Dashboard LLAMADAS</a></li>
			<li class="active">Mobility</li>
		</ol>
		</section> <!-- Main content --> <section class="content"><!-- top row -->
		
		
		<div class="row">
		<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12 ">
		<div class="form-inline">
<!-- 				<div class="form-group"> -->
		<div class="col-sm-12 col-sm-12 col-md-12 col-lg-5">
				<button id="btnOpcionesAvanzadas" class="btn btn-info" type="button"
						data-toggle="collapse" data-target="#opcionesAvanzadas"
						aria-expanded="false" aria-controls="#opcionesAvanzadas">
				<i class="fa fa-users" aria-hidden="true"></i> CLIENTES</button>
				
				<input id="checkOption" type="checkbox" checked data-toggle="toggle" data-width="150"
				data-on="<i class='fa fa-bar-chart' aria-hidden='true'></i> VISTA MES" data-off="<i class='fa fa-bar-chart' aria-hidden='true'></i> VISTA SEMANA" data-onstyle="success" data-offstyle="warning">	
				 
				<button id="btnConsultar" class="btn btn-primary" type="button">
				<i class="fa fa-search" aria-hidden="true"></i> CONSULTAR</button>
				<button id = "btnReportellamadas" class="btn btn-success" type="button" onclick="">
				<i class="fa fa-download" aria-hidden="true"></i> REPORTE DE LLAMADAS</button> 
<!-- 		</div> -->
<!-- 		<div class="col-sm-12 col-sm-12 col-md-12 col-lg-7">	 -->
		
				
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
									<span>Cliente:</span>
								</div>
								<div class="form-group">
									<select id="cboClientes" class="cbo2">
									</select>
								</div>
							</div>
						</div>
					</div>
					<br />
					<div class="row">
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<div class="table-responsive">
							</div>
						</div>
					</div>
					</div>
				</div>
			</div>
			</div>
			
			<div class="row">
			<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
			<div class="well">
					<div class="row">
					<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<div class="table-responsive">
							<div class="form-group">
							<div id="divMes">
									<span><i class="fa fa-calendar" aria-hidden="true"></i> Periodo: </span> 
											<input type="text" class="form-control" id="txtPeriodo"
										       class="datepicker-here"
										       data-language='es'
										       data-min-view="months"
										       data-view="months"
										       data-date-format="yyyy-mm" />
							 </div>
							 <div id="divSemana">
									<span><i class="fa fa-calendar" aria-hidden="true"></i> Año: </span> 
											<input type="text" class="form-control" id="txtAnio"
											   class="datepicker-here"
										       data-language='es'
										       data-min-view="years"
										       data-view="years"
										       data-date-format="yyyy" />
										       <BR/>
									<span><i class="fa fa-calendar" aria-hidden="true"></i> Semana: </span> 
									<select class="select2" id="cboSemana"></select> 
									</div>
						</div>
						</div>
						</div>
						</div>
					</div>
					</div>
				</div>
		
        <br/>
        	<!-- GRAFICO DE BARRAS PRINCIPAL - NUMERO DE LLAMADAS POR HORA  -->
        	<div class="row">
        	<section id="divGra1" class="col-xs-12 col-sm-12 col-md-12 col-lg-8 connectedSortable" style=" height: 600px">
        		<div class="box box-primary">
        		<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i>Número de Llamadas Por Hora</h3>
				</div>
        		<div class="box-body" >							
				<div><canvas id="myChart1" ></canvas></div>
			</div></div></section>		
			<section class="col-xs-12 col-sm-12 col-md-12 col-lg-4 connectedSortable" >
        	<!-- ARRIBA -->				
				<div id="divGra2"  class="col-xs-12 col-sm-12 col-md-12 col-lg-12 connectedSortable"  >
				<div class="box box-primary">
				<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i>Número de Llamadas Por Semana</h3>
				</div>
				<div class="box-body" >								
				<div><canvas id="myChart2" ></canvas></div>
				</div></div></div>	
				<!-- ABAJO -->
				<div id="divGra3" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 connectedSortable" >
        		<div class="box box-primary">
        		<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i>Número de Llamadas Por Dia de la Semana</h3>
				</div>
        		<div class="box-body" >								
				<div><canvas id="myChart3" ></canvas></div>
				</div></div></div>
			</section>
			</div>	
			<!-- GRAFICO DE BARRAS PRINCIPAL - NUMERO DE LLAMADAS POR DIA DEL MES  -->
			<div class="row">
        	<section id="divGra4" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 connectedSortable"  >
        		<div class="box box-primary">
        		<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i>Número de Llamadas Por Dia del Mes</h3>
				</div>
        		<div class="box-body" >						
				<div><canvas id="myChart4" ></canvas></div>
			</div></div></section>	
			</div>
    		
        </section>
      </aside>
      <aside class="right-side sizeHeight"> 
      </aside>
      
    

</body>
</html>
