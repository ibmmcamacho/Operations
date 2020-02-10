<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/air-datepicker-master/dist/css/datepicker.min.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/air-datepicker-master/dist/js/datepicker.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/air-datepicker-master/dist/js/i18n/datepicker.es.js"></script>

<style type="text/css"> 
.ui-datepicker{z-index: 99 !important};
</style> 

<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/Charts/ChartJS/js/Chart.min.js"></script>

 
<script type="text/javascript">

	var f = new Date();
	var date = f.getFullYear()
			+ '-'
			+ ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f.getMonth() + 1));
// 			+ '-'
// 			+ (f.getDate() < 10 ? '0' + f.getDate() : f.getDate());
 	
 	document.getElementById("txtPeriodo").value = date;


$(document).ready(function() {
	
	$('#txtFecha').datepicker().on('click', function (ev) {
	        $('.datepicker').css("z-index", "999999999");
	}).data('datepicker');
	
	$('#txtFecha').datepicker({
        maxDate: new Date(),
        minDate: new Date('2018-10-02')
	});
	
	$('#txtPeriodo').datepicker({
        maxDate: new Date(),
        minDate: new Date('2018-10-02')
	});
	
	getSesion();

	

						$('#btnConsultar').click(function() {
							var vtxtPeriodo = $('#txtPeriodo').val(); 
							
							$('#divLoadTasaAbandono').removeClass('overlay');
							$('#divLoadTasaAbandono').addClass('overlay');
							document.getElementById('divLoadTasaAbandono').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
							
							$('#divLoadTasaRespuesta').removeClass('overlay');
							$('#divLoadTasaRespuesta').addClass('overlay');
							document.getElementById('divLoadTasaRespuesta').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
							
							$('#divLoadTiempoConversacion').removeClass('overlay');
							$('#divLoadTiempoConversacion').addClass('overlay');
							document.getElementById('divLoadTiempoConversacion').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
							
							$('#divLoadTasaResolucion').removeClass('overlay');
							$('#divLoadTasaResolucion').addClass('overlay');
							document.getElementById('divLoadTasaResolucion').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
							
							
							var src = 'ServletMaximoMobility';
							$.post(src,{
												strOperation : 'getSlaMDA',
												ptxtPeriodo : vtxtPeriodo
											},
											function(pdata) {
												var obj = JSON.parse(pdata);
							
							listTasaAbandono(obj);
							listTasaRespuesta(obj);
							listTiempoConversacion(obj);
							listTasaResolucion(obj);
							});
						});
					
						// Make the dashboard widgets sortable Using jquery UI
// 						$('.connectedSortable').sortable({
// 							placeholder : 'sort-highlight',
// 							connectWith : '.connectedSortable',
// 							handle : '.box-header, .nav-tabs',
// 							forcePlaceholderSize : true,
// 							zIndex : 999999
// 						});
// 						$('.connectedSortable .box-header, .connectedSortable .nav-tabs-custom').css('cursor', 'move');
});

function getSesion(){
	
	var src = 'ServletMaximoMobility';
	$.post(src,{
						strOperation : 'getSession'
				},
	function(pdata) {
						var obj = JSON.parse(pdata);
						
						if(obj.session[0].strcodCliente != "PE-BCP-SO"){
							$('#btnConsultar').hide();	
							$('#reporte').hide();	
							$('#valores').hide();	
						}
	
	
	});

					
}




function listTasaAbandono(obj){
	document.getElementById('divTasaAbandono').innerHTML = '<canvas id="idTasaAbandono" width="100%" height="30%"></canvas>'+
	'<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">'+
	'<div class="box box-default">'+
		'<div class="box-header with-border">'+
			'<h3 class="box-title">RESULTADOS SLA (%)</h3><br>'+
			'<div class="box-tools pull-right">'+
				'<button type="button" class="btn btn-box-tool" '+
					'data-widget="collapse">'+
					'<i class="fa fa-minus"></i>'+
				'</button>'+
			'</div>'+
		'</div>'+
		'<div class="box-footer no-padding" id="divHistoricoTA">'+
		'</div>'+
		'</div>'+
	'</div>';
	
							var data = obj.SlaTasaAbandonoDiario[0];
							optionsLine = {
					                responsive: true,
					                title:{
					                    display:true,
					                    text:'Tasa de Abandono'
					                },
					                tooltips: {
// 					                    mode: 'index',
// 					                    intersect: true,
					                	enabled: false
					                },
					                hover: {
					                	enabled: false
// 	 				                    mode: 'nearest',
// 	  				                    intersect: true,
// 	  				                    animationDuration: 0,
// 	  				                  	animationDuration: 0
					                },
					                animation: {
										duration: 2000,
										easing : 'easeInOutBack',
										onComplete: function() {
										 	var chartInstance = this.chart,
										    ctx = chartInstance.ctx;
											ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
										   	ctx.textAlign = 'center';
										   	ctx.color = '#2C3E50';
										   	ctx.textBaseline = 'bottom';
										        this.data.datasets.forEach(function(dataset, i) {
										          var meta = chartInstance.controller.getDatasetMeta(i);
										          meta.data.forEach(function(bar, index) {
										            var data = dataset.data[index];
										            ctx.fillText(data, bar._model.x , bar._model.y );
										          });
										        });
										      }
									},
					               	legend: {
									      display: true
									    },    
					                scales: {
					                    yAxes: [{
					                    	display: true,
									        gridLines: {
									          display: true
									        },
									        ticks: {
// 									          max: Math.max(...data.datasets[0].data) + Math.max(...data.datasets[1].data)+2,
											  max: Math.ceil(Math.max(...data.datasets[1].data)+10),
									          display: true,
									          beginAtZero: true
									        }
					                    }],
					                    xAxes: [{
					                        display: true,
					                        scaleLabel: {
					                            display: true
					                        },
									        ticks: {
									          beginAtZero: true
									        }
					                    }]
					                }
					            };
				        	var ctx = document.getElementById('idTasaAbandono').getContext('2d');
				        	var myBarChart = new Chart(ctx, {
				        		type: 'line',
// 				        		data: {
// 				        			"labels": ["2018-11-01","2018-11-02","2018-11-03","2018-11-04","2018-11-05","2018-11-06","2018-11-07","2018-11-08","2018-11-09","2018-11-10","2018-11-12","2018-11-13","2018-11-14","2018-11-15","2018-11-16","2018-11-17","2018-11-18","2018-11-19","2018-11-20"],
// 				        			"datasets": [
// 				        				{"label": "SLA","fill": false,"backgroundColor": "#00897B","borderColor": "#00897B","data": [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]},
// 				        				{"label": "Resultado","fill": false,"backgroundColor": "#FFEA00","borderColor": "#FFEA00","data": [2.3, 5.0, 4.6, 5.0, 1.0, 2.3, 5.0, 4.6, 5.0, 1.0, 2.3, 5.0, 4.6, 5.0, 1.0, 2.3, 5.0, 4.6, 5.0]}]
// 				        		  },
				        		 data: data,
				        		 options: optionsLine
				            });
				        	
				        	
				        	var strCadenaSlaMesAnterior = "";
				        	if(obj.SlaTasaAbandonoMensual[0].slaTasaColorMesAnterior == 0){   //Dentro del SLA , color verder
				        		strCadenaSlaMesAnterior += "<li><a href=\"#\">"+ obj.SlaTasaAbandonoMensual[0].strMesAnterior+" <span class=\"pull-right text-green\"><i class=\"fa fa-angle-up\"></i> "
				        								+ obj.SlaTasaAbandonoMensual[0].slaTasaAbandonoMesAnterior +"%</span></a></li>";	
				        	}else if(obj.SlaTasaAbandonoMensual[0].slaTasaColorMesAnterior == 1){ //Por vencer del SLA , color amarillo
				        		strCadenaSlaMesAnterior += "<li><a href=\"#\">"+ obj.SlaTasaAbandonoMensual[0].strMesAnterior+"<span class=\"pull-right text-yellow\"><i class=\"fa fa-angle-left\"></i> "
				        								+ obj.SlaTasaAbandonoMensual[0].slaTasaAbandonoMesAnterior +"%</span></a></li>";
				        	}else{ // SLA vencido, valor 2, color rojo
				        		strCadenaSlaMesAnterior += "<li><a href=\"#\">"+ obj.SlaTasaAbandonoMensual[0].strMesAnterior+"<span class=\"pull-right text-red\"><i class=\"fa fa-angle-down\"></i> "
				        								+ obj.SlaTasaAbandonoMensual[0].slaTasaAbandonoMesAnterior +"%</span></a></li>";
				        	}
				         
				        	var strCadenaSlaMesActual = "";
				        	if(obj.SlaTasaAbandonoMensual[0].slaTasaColorMesActual == 0){   //Dentro del SLA , color verder
				        		strCadenaSlaMesActual += "<li><a href=\"#\">"+ obj.SlaTasaAbandonoMensual[0].strMesActual+"<span class=\"pull-right text-green\"><i class=\"fa fa-angle-up\"></i> "
													+ obj.SlaTasaAbandonoMensual[0].slaTasaAbandonoMesActual +"%</span></a></li>";	
				        	}else if(obj.SlaTasaAbandonoMensual[0].slaTasaColorMesActual == 1){ //Por vencer del SLA , color amarillo
				        		strCadenaSlaMesActual += "<li><a href=\"#\">"+ obj.SlaTasaAbandonoMensual[0].strMesActual+"<span class=\"pull-right text-yellow\"><i class=\"fa fa-angle-left\"></i> "
				        							+ obj.SlaTasaAbandonoMensual[0].slaTasaAbandonoMesActual +"%</span></a></li>";
				        	}else{ // SLA vencido, valor 2, color rojo
				        		strCadenaSlaMesActual += "<li><a href=\"#\">"+ obj.SlaTasaAbandonoMensual[0].strMesActual+"<span class=\"pull-right text-red\"><i class=\"fa fa-angle-down\"></i> "
				        							+ obj.SlaTasaAbandonoMensual[0].slaTasaAbandonoMesActual +"%</span></a></li>";
				        	}
				        	
				        	var strHtmlSlaHistorico = "<ul class=\"nav nav-pills nav-stacked\">"
													+ strCadenaSlaMesAnterior
													+ strCadenaSlaMesActual
													+ "</ul>";
				        	
						console.log(strHtmlSlaHistorico);
						document.getElementById('divHistoricoTA').innerHTML = strHtmlSlaHistorico;	
				        	
						document.getElementById('divLoadTasaAbandono').innerHTML = '';
						$('#divLoadTasaAbandono').removeClass('overlay');
					
}


function listTasaRespuesta(obj){
	
	document.getElementById('divTasaRespuesta').innerHTML = '<canvas id="idTasaRespuesta" width="100%" height="30%"></canvas>'+
	'<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">'+
	'<div class="box box-default">'+
		'<div class="box-header with-border">'+
			'<h3 class="box-title">RESULTADOS SLA (%)</h3>'+
			'<div class="box-tools pull-right">'+
				'<button type="button" class="btn btn-box-tool"'+
					'data-widget="collapse">'+
					'<i class="fa fa-minus"></i>'+
				'</button>'+
			'</div>'+
		'</div>'+
		'<div class="box-footer no-padding" id="divHistoricoTR">'+
		'</div>'+
	'</div>'+
	'</div>';
	
					var data = obj.SlaTasaRespuestaDiario[0];
					optionsLine= {
				                responsive: true,
				                title:{
				                    display:true,
				                    text:'Tasa de Respuesta'
				                },
				                tooltips: {
//					                    mode: 'index',
//					                    intersect: true,
				                	enabled: false
				                },
				                hover: {
				                	enabled: false
//	 				                    mode: 'nearest',
//	  				                    intersect: true,
//	  				                    animationDuration: 0,
//	  				                  	animationDuration: 0
				                },
				                animation: {
									duration: 2000,
									easing : 'easeInOutBack',
									onComplete: function() {
									 	var chartInstance = this.chart,
									    ctx = chartInstance.ctx;
										ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
									   	ctx.textAlign = 'center';
									   	ctx.color = '#428bca';
									   	ctx.textBaseline = 'bottom';
									        this.data.datasets.forEach(function(dataset, i) {
									          var meta = chartInstance.controller.getDatasetMeta(i);
									          meta.data.forEach(function(bar, index) {
									            var data = dataset.data[index];
									            ctx.fillText(data, bar._model.x, bar._model.y - 5);
									          });
									        });
									      }
								},
				               	legend: {
								      "display": true
								    },    
								    scales: {
					                    yAxes: [{
					                    	display: true,
									        gridLines: {
									          display: true
									        },
									        ticks: {
									          max: 120,
									          display: true,
									          beginAtZero: true
									        }
					                    }],
					                    xAxes: [{
					                        display: true,
					                        scaleLabel: {
					                            display: true
					                        },
									        ticks: {
									          beginAtZero: true
									        }
					                    }]
					                }
				    			
				                
				            };
				        	var ctx = document.getElementById('idTasaRespuesta').getContext('2d');
				        	var myBarChart = new Chart(ctx, {
				        		type: 'line',
// 				        		data: {
// 				        			"labels": ["2018-11-01","2018-11-02","2018-11-03","2018-11-04","2018-11-05","2018-11-06","2018-11-07","2018-11-08","2018-11-09","2018-11-10","2018-11-12","2018-11-13","2018-11-14","2018-11-15","2018-11-16","2018-11-17","2018-11-18","2018-11-19","2018-11-20"],
// 				        			"datasets": [
// 				        				{"label": "SLA","fill": false,"backgroundColor": "#00897B","borderColor": "#00897B","data": [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]},
// 				        				{"label": "Resultado","fill": false,"backgroundColor": "#FFEA00","borderColor": "#FFEA00","data": [2.3, 5.0, 4.6, 5.0, 1.0, 2.3, 5.0, 4.6, 5.0, 1.0, 2.3, 5.0, 4.6, 5.0, 1.0, 2.3, 5.0, 4.6, 5.0]}]
// 				        		  },
				        		 data: data, 
				        		 options: optionsLine
				            });
				        	
				        	
				        	var strCadenaSlaMesAnterior = "";
				        	if(obj.SlaTasaRespuestaMensual[0].slaTasaColorMesAnterior == 0){   //Dentro del SLA , color verder
				        		strCadenaSlaMesAnterior += "<li><a href=\"#\">"+ obj.SlaTasaRespuestaMensual[0].strMesAnterior+" <span class=\"pull-right text-green\"><i class=\"fa fa-angle-up\"></i> "
				        								+ obj.SlaTasaRespuestaMensual[0].slaTasaRespuestaMesAnterior +"%</span></a></li>";	
				        	}else if(obj.SlaTasaRespuestaMensual[0].slaTasaColorMesAnterior == 1){ //Por vencer del SLA , color amarillo
				        		strCadenaSlaMesAnterior += "<li><a href=\"#\">"+ obj.SlaTasaRespuestaMensual[0].strMesAnterior+"<span class=\"pull-right text-yellow\"><i class=\"fa fa-angle-left\"></i> "
				        								+ obj.SlaTasaRespuestaMensual[0].slaTasaRespuestaMesAnterior +"%</span></a></li>";
				        	}else{ // SLA vencido, valor 2, color rojo
				        		strCadenaSlaMesAnterior += "<li><a href=\"#\">"+ obj.SlaTasaRespuestaMensual[0].strMesAnterior+"<span class=\"pull-right text-red\"><i class=\"fa fa-angle-down\"></i> "
				        								+ obj.SlaTasaRespuestaMensual[0].slaTasaRespuestaMesAnterior +"%</span></a></li>";
				        	}
				         
				        	var strCadenaSlaMesActual = "";
				        	if(obj.SlaTasaRespuestaMensual[0].slaTasaColorMesActual == 0){   //Dentro del SLA , color verder
				        		strCadenaSlaMesActual += "<li><a href=\"#\">"+ obj.SlaTasaRespuestaMensual[0].strMesActual+"<span class=\"pull-right text-green\"><i class=\"fa fa-angle-up\"></i> "
													+ obj.SlaTasaRespuestaMensual[0].slaTasaRespuestaMesActual +"%</span></a></li>";	
				        	}else if(obj.SlaTasaRespuestaMensual[0].slaTasaColorMesActual == 1){ //Por vencer del SLA , color amarillo
				        		strCadenaSlaMesActual += "<li><a href=\"#\">"+ obj.SlaTasaRespuestaMensual[0].strMesActual+"<span class=\"pull-right text-yellow\"><i class=\"fa fa-angle-left\"></i> "
				        							+ obj.SlaTasaRespuestaMensual[0].slaTasaRespuestaMesActual +"%</span></a></li>";
				        	}else{ // SLA vencido, valor 2, color rojo
				        		strCadenaSlaMesActual += "<li><a href=\"#\">"+ obj.SlaTasaRespuestaMensual[0].strMesActual+"<span class=\"pull-right text-red\"><i class=\"fa fa-angle-down\"></i> "
				        							+ obj.SlaTasaRespuestaMensual[0].slaTasaRespuestaMesActual +"%</span></a></li>";
				        	}
				        	
				        	var strHtmlSlaHistorico = "<ul class=\"nav nav-pills nav-stacked\">"
													+ strCadenaSlaMesAnterior
													+ strCadenaSlaMesActual
													+ "</ul>";
				        	
						console.log(strHtmlSlaHistorico);
						document.getElementById('divHistoricoTR').innerHTML = strHtmlSlaHistorico;	
				        	
						document.getElementById('divLoadTasaRespuesta').innerHTML = '';
						$('#divLoadTasaRespuesta').removeClass('overlay');
}

function listTiempoConversacion(obj){
	
	document.getElementById('divTiempoConversacion').innerHTML = '<canvas id="idTiempoConversacion" width="100%" height="30%"></canvas>'+
	'<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">'+
	'<div class="box box-default">'+
		'<div class="box-header with-border">'+
			'<h3 class="box-title">RESULTADOS SLA (Min))</h3>'+
			'<div class="box-tools pull-right">'+
				'<button type="button" class="btn btn-box-tool"'+
					'data-widget="collapse">'+
					'<i class="fa fa-minus"></i>'+
				'</button>'+
			'</div>'+
		'</div>'+
		'<div class="box-footer no-padding" id="divHistoricoTC">'+
		'</div>'+
	'</div>'+
	'</div>';
		
					var data = obj.SlaTiempoConversacionDiario[0];
					optionsLine= {
				                responsive: true,
				                title:{
				                    display:true,
				                    text:'Tiempo de Solución'
				                },
				                tooltips: {
//					                    mode: 'index',
//					                    intersect: true,
				                	enabled: false
				                },
				                hover: {
				                	enabled: false
//	 				                    mode: 'nearest',
//	  				                    intersect: true,
//	  				                    animationDuration: 0,
//	  				                  	animationDuration: 0
				                },
				                animation: {
									duration: 2000,
									easing : 'easeInOutBack',
									onComplete: function() {
									 	var chartInstance = this.chart,
									    ctx = chartInstance.ctx;
										ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
									   	ctx.textAlign = 'center';
									   	ctx.color = '#428bca';
									   	ctx.textBaseline = 'bottom';
									        this.data.datasets.forEach(function(dataset, i) {
									          var meta = chartInstance.controller.getDatasetMeta(i);
									          meta.data.forEach(function(bar, index) {
									            var data = dataset.data[index];
									            ctx.fillText(data, bar._model.x, bar._model.y - 5);
									          });
									        });
									      }
								},
				               	legend: {
								      "display": true
								    },    
				                scales: {
				                    yAxes: [{
				                    	display: true,
								        gridLines: {
								          display: true
								        },
								        ticks: {
								          max: Math.ceil(Math.max(...data.datasets[1].data)+10),
								          display: true,
								          beginAtZero: true
								        }
				                    }],
				                    xAxes: [{
				                        display: true,
				                        scaleLabel: {
				                            display: true
				                        },
								        ticks: {
								          beginAtZero: true
								        }
				                    }]
				                }
				                
				            };
				        	var ctx = document.getElementById('idTiempoConversacion').getContext('2d');
				        	var myBarChart = new Chart(ctx, {
				        		type: 'line',
// 				        		data: {
// 				        			"labels": ["2018-11-01","2018-11-02","2018-11-03","2018-11-04","2018-11-05","2018-11-06","2018-11-07","2018-11-08","2018-11-09","2018-11-10","2018-11-12","2018-11-13","2018-11-14","2018-11-15","2018-11-16","2018-11-17","2018-11-18","2018-11-19","2018-11-20"],
// 				        			"datasets": [
// 				        				{"label": "SLA","fill": false,"backgroundColor": "#00897B","borderColor": "#00897B","data": [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]},
// 				        				{"label": "Resultado","fill": false,"backgroundColor": "#FFEA00","borderColor": "#FFEA00","data": [2.3, 5.0, 4.6, 5.0, 1.0, 2.3, 5.0, 4.6, 5.0, 1.0, 2.3, 5.0, 4.6, 5.0, 1.0, 2.3, 5.0, 4.6, 5.0]}]
// 				        		  },
				        		 data: data, 
				        		 options: optionsLine
				            });
				        	
				        	
				        	var strCadenaSlaMesAnterior = "";
				        	if(obj.SlaTiempoConversacionMensual[0].slaTasaColorMesAnterior == 0){   //Dentro del SLA , color verder
				        		strCadenaSlaMesAnterior += "<li><a href=\"#\">"+ obj.SlaTiempoConversacionMensual[0].strMesAnterior+" <span class=\"pull-right text-green\"><i class=\"fa fa-angle-up\"></i> "
				        								+ obj.SlaTiempoConversacionMensual[0].slaTiempoConversacionMesAnterior +" </span></a></li>";	
				        	}else if(obj.SlaTiempoConversacionMensual[0].slaTasaColorMesAnterior == 1){ //Por vencer del SLA , color amarillo
				        		strCadenaSlaMesAnterior += "<li><a href=\"#\">"+ obj.SlaTiempoConversacionMensual[0].strMesAnterior+"<span class=\"pull-right text-yellow\"><i class=\"fa fa-angle-left\"></i> "
				        								+ obj.SlaTiempoConversacionMensual[0].slaTiempoConversacionMesAnterior +" </span></a></li>";
				        	}else{ // SLA vencido, valor 2, color rojo
				        		strCadenaSlaMesAnterior += "<li><a href=\"#\">"+ obj.SlaTiempoConversacionMensual[0].strMesAnterior+"<span class=\"pull-right text-red\"><i class=\"fa fa-angle-down\"></i> "
				        								+ obj.SlaTiempoConversacionMensual[0].slaTiempoConversacionMesAnterior +" </span></a></li>";
				        	}
				         
				        	var strCadenaSlaMesActual = "";
				        	if(obj.SlaTiempoConversacionMensual[0].slaTasaColorMesActual == 0){   //Dentro del SLA , color verder
				        		strCadenaSlaMesActual += "<li><a href=\"#\">"+ obj.SlaTiempoConversacionMensual[0].strMesActual+"<span class=\"pull-right text-green\"><i class=\"fa fa-angle-up\"></i> "
													+ obj.SlaTiempoConversacionMensual[0].slaTiempoConversacionMesActual +" </span></a></li>";	
				        	}else if(obj.SlaTiempoConversacionMensual[0].slaTasaColorMesActual == 1){ //Por vencer del SLA , color amarillo
				        		strCadenaSlaMesActual += "<li><a href=\"#\">"+ obj.SlaTiempoConversacionMensual[0].strMesActual+"<span class=\"pull-right text-yellow\"><i class=\"fa fa-angle-left\"></i> "
				        							+ obj.SlaTiempoConversacionMensual[0].slaTiempoConversacionMesActual +" </span></a></li>";
				        	}else{ // SLA vencido, valor 2, color rojo
				        		strCadenaSlaMesActual += "<li><a href=\"#\">"+ obj.SlaTiempoConversacionMensual[0].strMesActual+"<span class=\"pull-right text-red\"><i class=\"fa fa-angle-down\"></i> "
				        							+ obj.SlaTiempoConversacionMensual[0].slaTiempoConversacionMesActual +" </span></a></li>";
				        	}
				        	
				        	var strHtmlSlaHistorico = "<ul class=\"nav nav-pills nav-stacked\">"
													+ strCadenaSlaMesAnterior
													+ strCadenaSlaMesActual
													+ "</ul>";
				        	
						console.log(strHtmlSlaHistorico);
						document.getElementById('divHistoricoTC').innerHTML = strHtmlSlaHistorico;	
				        	
						document.getElementById('divLoadTiempoConversacion').innerHTML = '';
						$('#divLoadTiempoConversacion').removeClass('overlay');
}

function listTasaResolucion(obj){
	
	document.getElementById('divTasaResolucion').innerHTML = '<canvas id="idTasaResolucion" width="100%" height="30%"></canvas>'+
	'<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">'+
	'<div class="box box-default">'+
		'<div class="box-header with-border">'+
			'<h3 class="box-title">RESULTADOS SLA (%)</h3>'+
			'<div class="box-tools pull-right">'+
				'<button type="button" class="btn btn-box-tool"'+
					'data-widget="collapse">'+
					'<i class="fa fa-minus"></i>'+
				'</button>'+
			'</div>'+
		'</div>'+
		'<div class="box-footer no-padding" id="divHistoricoTasaResolucion">'+
		'</div>'+
	'</div>'+
	'</div>';
	
					var data = obj.SlaTasaResolucionDiario[0];
					optionsLine= {
				                responsive: true,
				                title:{
				                    display:true,
				                    text:'Tasa de Respuesta'
				                },
 				                	tooltips: {
// 					                    mode: 'index',
// 					                    intersect: true,
					              	  	enabled: false
					              	},
					                hover: {
					                	enabled: false
// 	 				                    mode: 'nearest',
// 	  				                    intersect: true,
// 	  				                    animationDuration: 0,
// 	  				                  	animationDuration: 0
					                },
					                animation: {
										duration: 2000,
										easing : 'easeInOutBack',
									onComplete: function() {
									 	var chartInstance = this.chart,
									    ctx = chartInstance.ctx;
										ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
									   	ctx.textAlign = 'center';
									   	ctx.color = '#428bca';
									   	ctx.textBaseline = 'bottom';
									        this.data.datasets.forEach(function(dataset, i) {
									          var meta = chartInstance.controller.getDatasetMeta(i);
									          meta.data.forEach(function(bar, index) {
									            var data = dataset.data[index];
									            ctx.fillText(data, bar._model.x, bar._model.y - 5);
									          });
									        });
									      }
								},
								legend: {
								      "display": true
								    },    
								    scales: {
					                    yAxes: [{
					                    	display: true,
									        gridLines: {
									          display: true
									        },
									        ticks: {
									          max: 120,
									          display: true,
									          beginAtZero: true
									        }
					                    }],
					                    xAxes: [{
					                        display: true,
					                        scaleLabel: {
					                            display: true
					                        },
									        ticks: {
									          beginAtZero: true
									        }
					                    }]
					                }
				    			
				                
				            };
				        	var ctx = document.getElementById('idTasaResolucion').getContext('2d');
				        	var myBarChart = new Chart(ctx, {
				        		type: 'line',
// 				        		data: {
// 				        			"labels": ["2018-11-01","2018-11-02","2018-11-03","2018-11-04","2018-11-05","2018-11-06","2018-11-07","2018-11-08","2018-11-09","2018-11-10","2018-11-12","2018-11-13","2018-11-14","2018-11-15","2018-11-16","2018-11-17","2018-11-18","2018-11-19","2018-11-20"],
// 				        			"datasets": [
// 				        				{"label": "SLA","fill": false,"backgroundColor": "#00897B","borderColor": "#00897B","data": [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]},
// 				        				{"label": "Resultado","fill": false,"backgroundColor": "#FFEA00","borderColor": "#FFEA00","data": [2.3, 5.0, 4.6, 5.0, 1.0, 2.3, 5.0, 4.6, 5.0, 1.0, 2.3, 5.0, 4.6, 5.0, 1.0, 2.3, 5.0, 4.6, 5.0]}]
// 				        		  },
				        		 data: data, 
				        		 options: optionsLine
				            });
				        	
				        	
				        	var strCadenaSlaMesAnterior = "";
				        	if(obj.SlaTasaResolucionMensual[0].slaTasaColorMesAnterior == 0){   //Dentro del SLA , color verder
				        		strCadenaSlaMesAnterior += "<li><a href=\"#\">"+ obj.SlaTasaResolucionMensual[0].strMesAnterior+" <span class=\"pull-right text-green\"><i class=\"fa fa-angle-up\"></i> "
				        								+ obj.SlaTasaResolucionMensual[0].slaTasaResolucionMesAnterior +"%</span></a></li>";	
				        	}else if(obj.SlaTasaResolucionMensual[0].slaTasaColorMesAnterior == 1){ //Por vencer del SLA , color amarillo
				        		strCadenaSlaMesAnterior += "<li><a href=\"#\">"+ obj.SlaTasaResolucionMensual[0].strMesAnterior+"<span class=\"pull-right text-yellow\"><i class=\"fa fa-angle-left\"></i> "
				        								+ obj.SlaTasaResolucion[0].slaTasaResolucionMessAnterior +"%</span></a></li>";
				        	}else{ // SLA vencido, valor 2, color rojo
				        		strCadenaSlaMesAnterior += "<li><a href=\"#\">"+ obj.SlaTasaResolucionMensual[0].strMesAnterior+"<span class=\"pull-right text-red\"><i class=\"fa fa-angle-down\"></i> "
				        								+ obj.SlaTasaResolucionMensual[0].slaTasaResolucionMesAnterior +"%</span></a></li>";
				        	}
				         
				        	var strCadenaSlaMesActual = "";
				        	if(obj.SlaTasaResolucionMensual[0].slaTasaColorMesActual == 0){   //Dentro del SLA , color verder
				        		strCadenaSlaMesActual += "<li><a href=\"#\">"+ obj.SlaTasaResolucionMensual[0].strMesActual+"<span class=\"pull-right text-green\"><i class=\"fa fa-angle-up\"></i> "
													+ obj.SlaTasaResolucionMensual[0].slaTasaResolucionMesActual +"%</span></a></li>";	
				        	}else if(obj.SlaTasaResolucionMensual[0].slaTasaColorMesActual == 1){ //Por vencer del SLA , color amarillo
				        		strCadenaSlaMesActual += "<li><a href=\"#\">"+ obj.SlaTasaResolucionMensual[0].strMesActual+"<span class=\"pull-right text-yellow\"><i class=\"fa fa-angle-left\"></i> "
				        							+ obj.SlaTasaResolucionMensual[0].slaTasaResolucionMesActual +"%</span></a></li>";
				        	}else{ // SLA vencido, valor 2, color rojo
				        		strCadenaSlaMesActual += "<li><a href=\"#\">"+ obj.SlaTasaResolucionMensual[0].strMesActual+"<span class=\"pull-right text-red\"><i class=\"fa fa-angle-down\"></i> "
				        							+ obj.SlaTasaResolucionMensual[0].slaTasaResolucionMesActual +"%</span></a></li>";
				        	}
				        	
				        	var strHtmlSlaHistorico = "<ul class=\"nav nav-pills nav-stacked\">"
													+ strCadenaSlaMesAnterior
													+ strCadenaSlaMesActual
													+ "</ul>";
				        	
						console.log(strHtmlSlaHistorico);
						document.getElementById('divHistoricoTasaResolucion').innerHTML = strHtmlSlaHistorico;	
				        	
						document.getElementById('divLoadTasaResolucion').innerHTML = '';
						$('#divLoadTasaResolucion').removeClass('overlay');
}

function listReport() {
	
	$('#mdReporte').modal('show');
	
	$(document).ready(
					function() {
						var vtxtPeriodo = $('#txtPeriodo').val(); 

						var htmlTableLlamadas = '<table id=\"tblLlamadas\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\" width=\"100%\"></thead></table>';
						document.getElementById('tbcontainerLlamadas').innerHTML = htmlTableLlamadas;

						var htmlTableSla = '<table id=\"tblSla\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\" width=\"100%\"></thead></table>';
						document.getElementById('tbcontainerSla').innerHTML = htmlTableSla;
						
						var htmlTableTickets = '<table id=\"tblTickets\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\" width=\"100%\"></thead></table>';
						document.getElementById('tbcontainerTickets').innerHTML = htmlTableTickets;
						
						
						
						$('#dvLoadReporte').removeClass('overlay');
						$('#dvLoadReporte').addClass('overlay');
						document.getElementById('dvLoadReporte').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';

						var src = 'ServletMaximoMobility';
						$.post(src,{
											strOperation : 'getSlaMDAReport',
											ptxtPeriodo : vtxtPeriodo
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
											}
											
											columnsReportLlamadas = [ {
												title : "Nº"}, {
												title : "FECHA INICIO"}, {
												title : "TIEMPO COLA"}, {
												title : "TIEMPO CONVERSACIÓN"}, {	
												title : "AGENTE"}, {
												title : "TIPO"
											} ];
											
											
											var dataReporteSla = [];

											for (i = 0; i < obj.ReporteSlaDiario.length; i++) {
												var arr = [];
												arr.push(i+1);
												arr.push(obj.ReporteSlaDiario[i].fecha);
												arr.push(obj.ReporteSlaDiario[i].tasaAbandono);
												arr.push(obj.ReporteSlaDiario[i].tasaRespuesta);
												arr.push(obj.ReporteSlaDiario[i].tiempoSolucion);
												arr.push(obj.ReporteSlaDiario[i].tasaResolucion);
												arr.push(obj.ReporteSlaDiario[i].correoRecibido);
												dataReporteSla.push(arr);
											}
											
											columnsReportSla = [ {
												title : "Nº"}, {
												title : "FECHA"}, {
												title : "TASA DE ABANDONO"}, {
												title : "TASA RESPUESTA"}, {	
												title : "TIEMPO SOLUCION"}, {
												title : "TASA RESOLUCION"}, {
												title : "CORREOS RECIBIDOS"
											} ];
											
											
											var dataReporteTickets = [];

											for (i = 0; i < obj.ReporteTickets.length; i++) {
												var arr = [];
												arr.push(i+1);
												arr.push(obj.ReporteTickets[i].TICKETID);
												arr.push(obj.ReporteTickets[i].STRCLASS);
// 												arr.push(obj.ReporteTickets[i].NAMECREATEDBY);
												arr.push(obj.ReporteTickets[i].NAMECLIENTE);
												arr.push(obj.ReporteTickets[i].STATUS);
												arr.push(obj.ReporteTickets[i].INTERNALPRIORITY);
												arr.push(obj.ReporteTickets[i].EXTERNALSYSTEM);
												arr.push(obj.ReporteTickets[i].OWNERGROUP);
												arr.push(obj.ReporteTickets[i].SERVICELINE);
												arr.push(obj.ReporteTickets[i].ITDRESOLVERGROUP);
												arr.push("");
												arr.push(obj.ReporteTickets[i].SERVICE);
												arr.push(obj.ReporteTickets[i].CLASSIFICATIONLEVEL1);
												arr.push(obj.ReporteTickets[i].CLASSIFICATIONLEVEL2);
												arr.push(obj.ReporteTickets[i].CLASSIFICATIONLEVEL3);
												arr.push(obj.ReporteTickets[i].CLASSIFICATIONLEVEL4);
												arr.push(obj.ReporteTickets[i].NAMEAFFECTEDPERSON );
												arr.push(obj.ReporteTickets[i].NAMEREPORTEDBY);
												arr.push(obj.ReporteTickets[i].LOCATION);
												arr.push(obj.ReporteTickets[i].DESCRIPTIONLOCATION);
												arr.push(obj.ReporteTickets[i].DESCRIPTION);
												arr.push(obj.ReporteTickets[i].DETAIL);
												arr.push("");
												arr.push("");
												arr.push(obj.ReporteTickets[i].CREATIONDATE);
												arr.push("");
												arr.push(obj.ReporteTickets[i].FINISHDATE);
												arr.push(obj.ReporteTickets[i].CINUM);
												dataReporteTickets.push(arr);
											}
											
											columnsReportTickets = [ {	
											title : "Nº"}, {
											title : "Nro Ticket"}, {
											title : "Clase"}, {
// 											title : "Creador"}, {
											title : "Cliente"}, {
											title : "Estado"}, {
											title : "Prioridad Interna "}, {
											title : "Fuente"}, {
											title : "OwnerGroup"}, {
											title : "ServiceLine"}, {	
											title : "Grupo Resolutor"}, {
											title : "TRCMS"}, {	
											title : "Servicio"}, {
											title : "Rama1"}, {
											title : "Rama2"}, {
											title : "Rama3"}, {
											title : "Rama4"}, {	
											title : "Persona Afectada"}, {	
											title : "Informado Por"}, {	
											title : "Código Localidad"}, {
											title : "Descripción Localidad"}, {
											title : "Resumen"}, {
											title : "Detalle"}, {	
											title : "Solución"}, {
											title : "Transaccion SAP"}, {
											title : "Fecha Creación"}, {
											title : "Inicio de Indisponibilidad"}, {
											title : "Finalización Real"}, {
											title : "CI"
											} ];
											
											setDataLlamadas(dataReporteLlamadas,columnsReportLlamadas);
											setDataTickets(null,columnsReportTickets);
											setDataSla(dataReporteSla,columnsReportSla);
											
											document.getElementById('dvLoadReporte').innerHTML = '';
											$('#dvLoadReporte').removeClass('overlay');
										});

					});
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

function setDataSla(pdataReporte, pcolumnsReport) {

	if (typeof tableReporte === 'undefined') {

		var tableReporte = $('#tblSla')
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

function setDataTickets(pdataReporte, pcolumnsReport) {

	if (typeof tableReporte === 'undefined') {

		var tableReporte = $('#tblTickets')
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

$("#btnGuardarCorreo").click(function(){
	
	var strFecha = $("#txtFecha").val();
	var nCorreo = $("#txtCorreo").val();
	
	var src = 'ServletMaximoMobility';
	$.post(src,{
				strOperation : 'updateCorreo',
				ptxtPeriodo : strFecha,
				ptxtCorreo : nCorreo
				},
	function(pdata) {
				var obj = JSON.parse(pdata);
	
				if(obj.resultadoUpdate[0].idResultado > 0){
// 					$("#alertaConfirmacion").fadeToggle(4000);	
					$("#alertaConfirmacion").fadeIn(2500).fadeOut(200);
					$("#mdCorreo").modal('hide');
// 				alert('operacion Exitosa!!');	
				}else{
					$("#alertaNegativa").fadeIn(2500).fadeOut(200);
				}
	});
	
});

</script>



</head>
<body>
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
					  <li class="active"><a data-toggle="tab" href="#llamadas">LLAMADAS</a></li>
					  <li><a data-toggle="tab" href="#tickets">TICKETS</a></li>
					  <li><a data-toggle="tab" href="#slaDiario">SLA DIARIO</a></li>
					</ul>
					<div class="tab-content">
					  <div id="llamadas" class="tab-pane fade in active">
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
					  <div id="slaDiario" class="tab-pane fade">
						<div class="row">
							<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
								<div id="tbcontainerSla" class="table-responsive">
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
	
	<!-- Modal UPDATE CORREOS-->
	<div class="modal fade" id="mdCorreo" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-md" role="document">
			<div class="modal-content">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> CORREOS RECIBIDOS</h3>
					</div>
					<div class="box-body">
						<div class="form-inline">
							<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<div class="form-group" >
							<span><i class="fa fa-calendar" aria-hidden="true"></i> Fecha: </span> 
							<input type="text" class="form-control" id="txtFecha"
							       class="datepicker-here"
							       data-language='es'
							       data-date-format="yyyy-mm-dd" />
							</div>	
							<div class="form-group">
							<span><i class="fa fa-envelope" aria-hidden="true"></i> Correos: </span> <input id="txtCorreo" type="number" min="1" class="form-control"/>
							</div>
							</div>
						</div>
					</div>	
						 <div id="alertaNegativa" class="alert alert-danger " style='display:none;'>
					    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					    <strong>¡Error!</strong>  Su operación no se ha realizado.
					  </div>
					<div class="modal-footer">
                    <button id="btnGuardarCorreo" type="submit" class="btn btn-primary "><i class="fa fa-floppy-o"></i> Guardar</button>
                 	<button type="button" class="btn btn-danger " data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
                	</div>  
				</div>  
			</div>
		</div>
	</div>

	
	<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
	<section class="content-header">
	<h1><i class="fa fa-tachometer" aria-hidden="true"></i>
		Dashboard Diario<small>Mobility</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-th-large"></i> Dashboard Diario</a></li>
		<li class="active">Mobility</li>
	</ol>
	</section> <!-- Main content --> <section class="content"> <!-- top row -->


	<div class="row">
		<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
			<div class="form-inline">
			<div class="col-sm-8 col-sm-8 col-md-8 col-lg-8">
				<div class="form-group">
					<span><i class="fa fa-calendar" aria-hidden="true"></i> Periodo: </span> 
						<input type="text" class="form-control" id="txtPeriodo"
					       class="datepicker-here"
					       data-language='es'
					       data-min-view="months"
					       data-view="months"
					       data-date-format="yyyy-mm" />
				</div>
				<div class="form-group">
<!-- 					<button id="btnConsultar" class="btn btn-primary" type="button">Consultar</button> -->
					<a id="btnConsultar" class="btn btn-primary btn-md pull-left" ><i class="fa fa-search" aria-hidden="true"></i> Consultar</a>
				</div>
			</div>
			<div class="col-sm-4 col-sm-4 col-md-4 col-lg-4 text-right">
				<div class="form-group">
					<a id = "valores" class="btn btn-info btn-md pull-left" data-toggle="modal" data-target="#mdCorreo"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> VALORES</a>
<!-- 					<a class="btn btn-success btn-md pull-right" onclick="listReport()"><i class="fa fa-table" aria-hidden="true"></i> REPORTE</a> -->
				</div>
				<div class="form-group">
<!-- 					<a class="btn btn-info btn-md pull-left" onclick=""><i class="fa fa-cogs" aria-hidden="true"></i> VALORES</a> -->
					<a id = "reporte" class="btn btn-success btn-md pull-right" onclick="listReport()"><i class="fa fa-table" aria-hidden="true"></i> REPORTE</a>
				</div>
			</div>
			</div>
		</div>
	</div>

	

	<br>
	<div id="alertaConfirmacion" class="alert alert-success " style='display:none;'>
					    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					    <strong>¡Éxito!</strong>  Su operación se ha realizado satisfactoriamente.
	</div>

	
	<div class="row">
	<section class="col-xs-12 col-sm-12 col-md-12 col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div id="divLoadTasaAbandono"></div>
			<div class="box-header with-border">
				<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i> Tasa de Abandono</h3>
			</div>
			<div class="box-body">  
				<div id="tbcontainer" class="table-responsive">
					<div class="form-group" id="divTasaAbandono">
					</div>
				</div>
			</div>
			<div id="divLoadTasaAbandono" ></div> 
		</div>
	</section>
	<section class="col-xs-12 col-sm-12 col-md-12 col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i> Tasa de Respuesta</h3>
			</div>
			<div class="box-body">
				<div id="tbcontainer" class="table-responsive">
					<div class="form-group" id="divTasaRespuesta"></div>
				</div>
			</div>
			<div id="divLoadTasaRespuesta"></div>
		</div>
	</section>
	</div>
	<div class="row">
	<section class="col-xs-12 col-sm-12 col-md-12 col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"><i class="fa fa-tachometer" aria-hidden="true"></i> Tiempo de Resolución</h3>
			</div>
			<div class="box-body">
				<div id="tbcontainer" class="table-responsive">
					<div class="form-group" id="divTiempoConversacion"></div>
				</div>
			</div>
			<div id="divLoadTiempoConversacion"></div>
		</div>
	</section>
	<section class="col-xs-12 col-sm-12 col-md-12 col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i> Tasa de Resolución</h3>
			</div>
			<div class="box-body">
				<div id="tbcontainer" class="table-responsive">
					<div class="form-group" id="divTasaResolucion"></div>
				</div>
			</div>
			<div id="divLoadTasaResolucion"></div>
		</div>
	</section>
	</div>

	</section> </aside>
</body>
</html>

