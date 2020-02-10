<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/air-datepicker-master/dist/css/datepicker.min.css">
<!-- <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->

<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/air-datepicker-master/dist/js/datepicker.min.js"></script> --%>
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/resources/air-datepicker-master/dist/js/i18n/datepicker.es.js"></script> --%>



<style  type="text/css">
.ui-datepicker{z-index: 99 !important};

</style>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/Charts/ChartJS/js/Chart.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/air-datepicker-master/dist/js/datepicker.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/air-datepicker-master/dist/js/i18n/datepicker.es.js"></script>
	<script src="<%=request.getContextPath()%>/resources/jsPDF/js1_4/jspdf.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/jsPDF/js1_4/plugins/addhtml.js"></script>
    <script src="<%=request.getContextPath()%>/resources/jsPDF/js1_4/plugins/cell.js"></script>
    <script src="<%=request.getContextPath()%>/resources/jsPDF/js1_4/plugins/jspdf.plugin.autotable.js"></script>

<script type="text/javascript">
var semana;
var mes;
var anio;
var idproyecto;
var nomproyecto;
$(document).ready(function() {
	
	
	$('#txtFecha').datepicker().on('click', function (ev) {
	        $('.datepicker').css("z-index", "999999999");
	}).data('datepicker');
	
	$('#txtFecha').datepicker({
        maxDate: new Date(),
        minDate: new Date('2019-04-02')
	});
	
	$('#txtPeriodo').datepicker({
        maxDate: new Date(),
        minDate: new Date('2019-04-02')
	});
	
	$('#txtPeriodo').datepicker().data('datepicker').selectDate(new Date());
	
	$('#divtabSDD1').hide();
	$('#divtabDCS1').hide();
	$('#divtabSDD2').hide();
	$('#divtabDCS2').hide(); 
 	$('#divtabInforme').hide(); 

	listarComboProyecto();
	
	$('#btnConsultar').click(function() {
		$('#divContentSDD1').empty();
		$('#divContentDCS1').empty();
		$('#divContentSDD2').empty();
		$('#divContentDCS2').empty();	
		
		$('#divtabSDD1').hide();
		$('#divtabSDD2').hide();
		$('#divtabDCS1').hide();
		$('#divtabDCS2').hide();
		$('#divtabInforme').hide(); 
		
		anio = $('#txtPeriodo').val().substr(0,4);
		mes = $('#txtPeriodo').val().substr(5,7);
		semana = "0";
		idproyecto= $('#cboClientes').val();
		nomproyecto= $("#cboClientes option:selected").html();
		listarNivelServicio(anio, mes, idproyecto, nomproyecto);
		//Graficos llamadas
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
							$('#divGrafLlamadaHora').show();
							graficoPorHora(obj);
							$('#divGrafLlamadaDia').show();
							graficoPorDia(obj);
							//Ocultar Modal con barra de progreso
// 							var $modal = $('.js-loading-bar');
// 							$modal.modal('hide');
				});
		
		//Graficos Tickets
		var src = 'ServletMobilitySLA';
		$.post(src,{
					strAccion : "11",
					id_proyecto : idproyecto,
					mes : mes,
					anio : anio,
					cliente : nomproyecto
						},
						function(pdata) {
							var obj = JSON.parse(pdata);
							$('#divGrafLineaBase').show();
							graficoLineaBase(obj);
							$('#divGrafDetalleLineaBase').show();
							graficoDetalleLineaBase(obj);
							$('#divtabInforme').show();
							//Ocultar Modal con barra de progreso
// 							var $modal = $('.js-loading-bar');
// 							$modal.modal('hide');
				});
		
		
	});
	
	//GRAFICOS TICKETS
	var myChartLineaBase ;
	  function graficoLineaBase(obj){
		  /* PRIMER GRAFICO */
		  
		  if(myChartLineaBase!=null){
			  myChartLineaBase.clear();
			  myChartLineaBase.destroy();
		  }
		  var data = obj.LineBase[0];
		  
		  var ctx = document.getElementById('myChartLineaBase');
		  
		  myChartLineaBase = new Chart(ctx, {
		  	  type: 'line',
		  	  data: data,
		  	  options: {
			  	    responsive: true,
			  	  	title:{
	                    display:true,
	                    text:'Resumen Histórico de Linea Base',
	                    fontSize: 20
	                },
	                tooltips: {
	                	enabled: true
	                },
	                hover: {
	                	enabled: false
	                },
	                animation: {
						duration: 2000,
						easing : 'easeInOutBack'
						,
						onComplete: function() {
						 	var chartInstance = this.chart,
						    ctx = chartInstance.ctx;
							ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
						   	ctx.textAlign = 'center';
						   	ctx.fillStyle = '#000000';
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
			  	    scales: {
			  	      yAxes: [{
			  	    	display: true,
				        gridLines: {
				          display: true
				        },
			  	        ticks: {
// 			  	          max: Math.ceil(Math.max(...data.datasets[0].data)+2000),
				          display: true,
				          beginAtZero: true,
			  	          fontSize: 15
			  	        }
			  	      }],
			  	    xAxes: [{
			  	    	display: true,
			  	    	scaleLabel: {
	                        display: true
	                    },
			  	        ticks: {
			  	          beginAtZero: true,
			  	          fontSize: 15
			  	        }
			  	      }]
	                },
				  	legend: {
				       display: true,
				            labels: {
				                fontSize: 14
				            }
				        },
				    layout: {
				            padding: {
				                left: 10,
				                right:10,
				                top: 10,
				                bottom: 10
				            }
				        }
				  	  }
		  	});  
	  }
	
	  var myChartDetalleLineaBase ;
	  function graficoDetalleLineaBase(obj){
		  /* PRIMER GRAFICO */
		  
		  if(myChartDetalleLineaBase!=null){
			  myChartDetalleLineaBase.clear();
			  myChartDetalleLineaBase.destroy();
		  }
		  var data = obj.DetalleLineBase[0];
		  
		  var ctx = document.getElementById('myChartDetalleLineaBase');
		  
		  myChartDetalleLineaBase = new Chart(ctx, {
		  	  type: 'line',
		  	  data: data,
		  	  options: {
			  	    responsive: true,
			  	  title:{
	                    display:true,
	                    text:'Resumen Histórico de Detalle Linea Base',
	                    fontSize: 20
	                },
	                tooltips: {
	                	enabled: true
	                },
	                hover: {
	                	enabled: false
	                },
	                animation: {
						duration: 2000,
						easing : 'easeInOutBack'
						,
						onComplete: function() {
						 	var chartInstance = this.chart,
						    ctx = chartInstance.ctx;
							ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
						   	ctx.textAlign = 'center';
						   	ctx.fillStyle = '#000000';
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
			  	    scales: {
			  	      yAxes: [{
			  	    	display: true,
				        gridLines: {
				          display: true
				        },
			  	        ticks: {
// 			  	          max: Math.ceil(Math.max(...data.datasets[3].data)+2000),
				          display: true,
				          beginAtZero: true,
			  	          fontSize: 15
			  	        }
			  	      }],
			  	    xAxes: [{
			  	    	display: true,
			  	    	scaleLabel: {
	                        display: true
	                    },
			  	        ticks: {
			  	          beginAtZero: true,
			  	          fontSize: 15
			  	        }
			  	      }]
	                },
				  	legend: {
				       display: true,
				            labels: {
				                fontSize: 14
				            }
				        },
				    layout: {
				            padding: {
				                left: 10,
				                right:10,
				                top: 10,
				                bottom: 10
				            }
				        }
				  	  }
		  	});  
	  }
	
	
	
	//GRAFICOS LLAMADAS
	var myChartLlamadaHora ;
	  function graficoPorHora(obj){
		  /* PRIMER GRAFICO */
		  
		  if(myChartLlamadaHora!=null){
			  myChartLlamadaHora.clear();
			  myChartLlamadaHora.destroy();
		  }
		  
		  var ctx = document.getElementById('myChartLlamadaHora');
		   myChartLlamadaHora = new Chart(ctx, {
		  	  type: 'bar',
		  	  data: obj.LlamadasPorHora[0],
		  	  options: {
		  		title:{
                    display:true,
                    text:'Llamadas por Hora',
                    fontSize: 20
                },
		  	    scales: {
		  	      yAxes: [{
		  	        stacked: true,
		  	        ticks: {
		  	          beginAtZero: true,
		  	          fontSize: 15
		  	        }
		  	      }],
		  	      xAxes: [{
		  	        stacked: true,
		  	        ticks: {
		  	          beginAtZero: true,
		  	          fontSize: 15
		  	        }
		  	      }]

		  	    },
		  	  legend: {
		            display: true,
		            labels: {
		                fontSize: 14
		            }
		        },
		      layout: {
		            padding: {
		                left: 10,
		                right:10,
		                top: 10,
		                bottom: 10
		            }
		        }
		  	  }
		  	});  
	  }
	  
	  
	  var myChartLlamadaDia;
	  
	  	function graficoPorDia(obj){
	  		
	  		if(myChartLlamadaDia!=null){
	  			myChartLlamadaDia.clear();
	  			myChartLlamadaDia.destroy();  
			  }
	  		
		  var ctx2 = document.getElementById('myChartLlamadaDia');
		   myChartLlamadaDia = new Chart(ctx2, {
		  	  type: 'bar',
		  	  data: obj.LlamadasPorDiaMes[0],
		  	 options: {
			  		title:{
	                    display:true,
	                    text:'Llamadas por Dia del Mes',
	                    fontSize: 20
	                },
			  	    scales: {
			  	      yAxes: [{
			  	        stacked: true,
			  	        ticks: {
			  	          beginAtZero: true,
			  	        fontSize: 15
			  	        }
			  	      }],
			  	      xAxes: [{
			  	        stacked: true,
			  	        ticks: {
			  	          beginAtZero: true,
			  	        fontSize: 15
			  	        }
			  	      }]

			  	    },
			  	  legend: {
			            display: true,
			            labels: {
			                fontSize: 14
			            }
			        },
			      layout: {
			            padding: {
			                left: 10,
			                right:10,
			                top: 10,
			                bottom: 10
			            }
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
	
	
	$('#btnReportetickets').click(function() {
		anio = $('#txtPeriodo').val().substr(0,4);
		mes = $('#txtPeriodo').val().substr(5,7);
		idproyecto= $('#cboClientes').val();

		desactivatabModalReporte();
		
		$('#divlitickets').show();
		$('#divlitickets').addClass("active");
		$('#tickets').show(); 
		$('#tickets').addClass("in active");; 
		
		
		
		
		
		$('#mdReporte').modal('show');
		
		var htmlTableTickets = '<table id=\"tblTickets\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\" width=\"100%\"></thead></table>';
		document.getElementById('tbcontainerTickets').innerHTML = htmlTableTickets;
		
		
	var src = 'ServletMobilitySLA';
	$.post(src,{
				strAccion : "7",
				id_proyecto : idproyecto,
				mes : mes,
				anio : anio 
					},
					function(pdata) {
						var obj = JSON.parse(pdata);
						var dataReporteTickets = [];

						for (i = 0; i < obj.ReporteTickets.length; i++) {
							var arr = [];
							arr.push(i+1);
							arr.push(obj.ReporteTickets[i].TICKETID);
							arr.push(obj.ReporteTickets[i].WOCH);
							arr.push(obj.ReporteTickets[i].STRCLASS);
							arr.push(obj.ReporteTickets[i].STATUS);
							arr.push(obj.ReporteTickets[i].INTERNALPRIORITY);
							arr.push(obj.ReporteTickets[i].EXTERNALSYSTEM);
							arr.push(obj.ReporteTickets[i].IDCALLMNG);
							arr.push(obj.ReporteTickets[i].SERVICE);
							arr.push(obj.ReporteTickets[i].SERVICELINE);
							arr.push(obj.ReporteTickets[i].PLUSCUSTOMER);
							arr.push(obj.ReporteTickets[i].NAMECLIENTE);
							arr.push(obj.ReporteTickets[i].LOCATION);
							arr.push(obj.ReporteTickets[i].DESCRIPTIONLOCATION);
							arr.push(obj.ReporteTickets[i].CREATIONDATE);
							arr.push(obj.ReporteTickets[i].ITDCHCREATEDBYGROUP);
							arr.push(obj.ReporteTickets[i].EMAILCREATEDBY);
							arr.push(obj.ReporteTickets[i].NAMECREATEDBY);
							arr.push(obj.ReporteTickets[i].EMAILREPORTEDBY);
							arr.push(obj.ReporteTickets[i].NAMEREPORTEDBY);
							arr.push(obj.ReporteTickets[i].EMAILAFFECTEDPERSON);
							arr.push(obj.ReporteTickets[i].NAMEAFFECTEDPERSON);
							arr.push(obj.ReporteTickets[i].OWNERGROUP);
							arr.push(obj.ReporteTickets[i].ITDRESOLVERGROUP);
							arr.push(obj.ReporteTickets[i].EMAILOWNER);
							arr.push(obj.ReporteTickets[i].NAMEOWNER);
							arr.push(obj.ReporteTickets[i].FINISHDATE);
							arr.push(obj.ReporteTickets[i].CLASSIFICATIONID);
							arr.push(obj.ReporteTickets[i].CLASIFICACION);
							arr.push(obj.ReporteTickets[i].CLASSSTRUCTUREID);
							arr.push(obj.ReporteTickets[i].CLASSIFICATIONLEVEL1);
							arr.push(obj.ReporteTickets[i].CLASSIFICATIONLEVEL2);
							arr.push(obj.ReporteTickets[i].CLASSIFICATIONLEVEL3);
							arr.push(obj.ReporteTickets[i].CLASSIFICATIONLEVEL4);
							arr.push(obj.ReporteTickets[i].CINUM);
							arr.push(obj.ReporteTickets[i].CINUMDESC);
							arr.push(obj.ReporteTickets[i].FCR);
							arr.push(obj.ReporteTickets[i].ISGLOBAL);
							arr.push(obj.ReporteTickets[i].GLOBALTICKETCLASS);
							arr.push(obj.ReporteTickets[i].GLOBALTICKETID);
							arr.push(obj.ReporteTickets[i].ITDCLOSURECODE);
							arr.push(obj.ReporteTickets[i].ITDMAJORINCIDENT);
							arr.push(obj.ReporteTickets[i].ORIGRECORDCLASS);
							arr.push(obj.ReporteTickets[i].ORIGRECORDID);
							arr.push(obj.ReporteTickets[i].RELATEDTOGLOBAL);
							arr.push(obj.ReporteTickets[i].DESCRIPTION);
							arr.push(obj.ReporteTickets[i].DETAIL);
							arr.push(obj.ReporteTickets[i].SINTOMA);
							arr.push(obj.ReporteTickets[i].CAUSA);
							arr.push(obj.ReporteTickets[i].SOLUCION);
							arr.push(obj.ReporteTickets[i].CHANGEBY_TKWEB);
							arr.push(obj.ReporteTickets[i].CHANGEDATE_TKWEB);
							arr.push(obj.ReporteTickets[i].STRTIEMPO_ESCALAMIENTO);
							arr.push(obj.ReporteTickets[i].STRTIEMPO_RESPUESTA);
							arr.push(obj.ReporteTickets[i].STRTIEMPO_SOLUCION);
							arr.push(obj.ReporteTickets[i].TKREABIERTO);
							arr.push(obj.ReporteTickets[i].GESTIONWEB);
							arr.push(obj.ReporteTickets[i].FECHA_ENCUESTA);
							arr.push(obj.ReporteTickets[i].PREGUNTA_ENCUESTA);
							arr.push(obj.ReporteTickets[i].RESPUESTA_ENCUESTA);
// 							arr.push(obj.ReporteTickets[i].COMENTARIO_ENCUESTA);
							arr.push(obj.ReporteTickets[i].ATENCION_MASIVA);
							dataReporteTickets.push(arr);
							
						}
						
						columnsReportTickets = [ {	
						title : "Nº"}, {
						title : "NRO TICKET"}, {
						title : "WOCH"}, {
						title : "CLASE"}, {
						title : "ESTADO"}, {	
						title : "PRIORIDAD INTERNA"}, {	
						title : "ORIGEN"}, {
						title : "IDCALLMANG"}, {
						title : "SERVICE"}, {		
						title : "SERVICELINE"}, {		
						title : "PLUSCUTOMER"}, {
						title : "NOMBRECLIENTE"}, {
						title : "CODIGO LOCALIDAD"}, {
						title : "DESCRIPCION LOCALIDAD"}, {
						title : "FECHA CREACION"}, {
						title : "ITDCHCREATEDBYGROUP"}, {	
						title : "EMAILCREATEDBY"}, {	
						title : "NAMECREATEDBY"}, {
						title : "EMAILREPORTEDBY"}, {	
						title : "NAMEREPORTEDBY"}, {
						title : "EMAILAFFECTEDPERSON"}, {	
						title : "NAMEAFFECTEDPERSON"}, {
						title : "OWNERGROUP"}, {
						title : "ITDRESOLVERGROUP"}, {
						title : "EMAILOWNER"}, {
						title : "NAMEOWNER"}, {	
						title : "FINISHDATE"}, {	
						title : "CLASSIFICATIONID"}, {	
						title : "CLASIFICACION"}, {
						title : "CLASSSTRUCTUREID"}, {	
						title : "CLASSIFICATIONLEVEL1"}, {
						title : "CLASSIFICATIONLEVEL2"}, {
						title : "CLASSIFICATIONLEVEL3"}, {
						title : "CLASSIFICATIONLEVEL4"}, {	
						title : "CINUM"}, {	
						title : "CINUMDESC"}, {	
						title : "FCR"}, {	
						title : "ISGLOBAL"}, {	
						title : "GLOBALTICKETCLASS"}, {	
						title : "GLOBALTICKETID"}, {	
						title : "ITDCLOSURECODE"}, {	
						title : "ITDMAJORINCIDENT"}, {	
						title : "ORIGRECORDCLASS"}, {	
						title : "ORIGRECORDID"}, {	
						title : "RELATEDTOGLOBAL"}, {	
						title : "DESCRIPTION"}, {	
						title : "DETAIL"}, {	
						title : "SINTOMA"}, {	
						title : "CAUSA"}, {	
						title : "SOLUCION"}, {	
						title : "CHANGEBY_TKWEB"}, {	
						title : "CHANGEDATE_TKWEB"}, {	
						title : "TIEMPO_ESCALAMIENTO"}, {	
						title : "TIEMPO_RESPUESTA"}, {	
						title : "TIEMPO_SOLUCION"}, {	
						title : "TKREABIERTO"}, {	
						title : "GESTIONWEB"}, {	
						title : "FECHA_ENCUESTA"}, {	
						title : "PREGUNTA_ENCUESTA"}, {
						title : "RESPUESTA_ENCUESTA"}, {
// 						title : "COMENTARIO_ENCUESTA"}, {
						title : "ATENCION_MASIVA"
						} ];
						
						setDataTickets(dataReporteTickets,columnsReportTickets);
	
			});
	}); 
	
	$('#btnReportellamadas').click(function() {
		anio = $('#txtPeriodo').val().substr(0,4);
		mes = $('#txtPeriodo').val().substr(5,7);
		idproyecto= $('#cboClientes').val();

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
				id_proyecto : idproyecto,
				mes : mes,
				anio : anio,
				tipoVista : "1",
				semana : "0"
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
						
						setDataLlamadas(dataReporteLlamadas,columnsReportLlamadas);
			});
	}); 
	
	
	$('#btnReporteWO').click(function() {
		anio = $('#txtPeriodo').val().substr(0,4);
		mes = $('#txtPeriodo').val().substr(5,7);
		idproyecto= $('#cboClientes').val();

		desactivatabModalReporte();
		
		$('#divliworkorder').show();
		$('#divliworkorder').addClass("active");
		$('#workorder').show(); 
		$('#workorder').addClass("in active");; 
		
		$('#mdReporte').modal('show');
		
		var htmlTableTickets = '<table id=\"tblWO\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\" width=\"100%\"></thead></table>';
		document.getElementById('tbcontainerWO').innerHTML = htmlTableTickets;
		
		
	var src = 'ServletMobilitySLA';
	$.post(src,{
				strAccion : "9",
				id_proyecto : idproyecto,
				mes : mes,
				anio : anio,
				id_opcion : "2"
					},
					function(pdata) {
						var obj = JSON.parse(pdata);
						var dataReporteTickets = [];

				
						
						for (i = 0; i < obj.ReporteWO.length; i++) {
							var arr = [];
							arr.push(i+1);
							arr.push(obj.ReporteWO[i].wogroupwa);
							arr.push(obj.ReporteWO[i].taskidwa);
							arr.push(obj.ReporteWO[i].descriptionwa);
							arr.push(obj.ReporteWO[i].pluspcustomerwa);
							arr.push(obj.ReporteWO[i].estadowa);
							arr.push(obj.ReporteWO[i].woprioritywa);
							arr.push(obj.ReporteWO[i].actstartwa);
							arr.push(obj.ReporteWO[i].changebywa);
							arr.push(obj.ReporteWO[i].cinum);
							arr.push(obj.ReporteWO[i].serviceline);
							arr.push(obj.ReporteWO[i].ownerwa);
							arr.push(obj.ReporteWO[i].ownergroupwa);
							arr.push(obj.ReporteWO[i].reportdatewa);
							arr.push(obj.ReporteWO[i].reportedbywa );
							arr.push(obj.ReporteWO[i].statusdatewa);
							arr.push(obj.ReporteWO[i].woclasswa);
// 							arr.push(obj.ReporteWO[i].tarea);
							arr.push(obj.ReporteWO[i].jpnum);
							arr.push(obj.ReporteWO[i].jpdescription);
							arr.push(obj.ReporteWO[i].actfinish);
							arr.push(obj.ReporteWO[i].woactualfin);
							arr.push(obj.ReporteWO[i].wonumwa);
							arr.push(obj.ReporteWO[i].habPuestoTrabajo);
							arr.push(obj.ReporteWO[i].wo_acta);
							dataReporteTickets.push(arr);
							
						}
						
						columnsReportTickets = [ {	
						title : "Nº"}, {
						title : "WOGROUP"}, {
						title : "IDTASK"}, {
						title : "DESCRIPTION"}, {
						title : "PLUSCUSTOMER"}, {
						title : "ESTADO"}, {
						title : "PRIORITY"}, {
						title : "ACTSTAR"}, {
						title : "CHANGEBY"}, {	
						title : "CINUM"}, {
						title : "SERVICELINE"}, {	
						title : "OWNER"}, {
						title : "OWNERGROUP"}, {
						title : "REPORTDATE"}, {
						title : "REPORTEDBY"}, {
						title : "STATUSDATE"}, {	
						title : "WOCLASS"}, {	
// 						title : "TAREA"}, {	
						title : "JPNUM"}, {
						title : "JPDESCRIPTION"}, {
						title : "ACTFINISH"}, {
						title : "WOACTUALFIN"}, {	
						title : "WONUM"}, {
						title : "HABPUESTOTRABAJO"}, {
						title : "WO_ACTA"
						} ];
						
						setDataWO(dataReporteTickets,columnsReportTickets);
	
			});
	}); 
	
	
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
	
	function setDataWO(pdataReporte, pcolumnsReport) {

		if (typeof tableReporte === 'undefined') {

			var tableReporte = $('#tblWO')
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
	
	var cantidadPorletsdd1 = 1;
	var cantidadPorletdcs1 = 1;
	var flagMultiplosdd1 = false;
	var flagaperturasdd1 = false;
	var flagMultiplodcs1 = false;
	var flagaperturadcs1 = false;
	var cantidadPorletsdd2 = 1;
	var cantidadPorletdcs2 = 1;
	var flagMultiplosdd2 = false;
	var flagaperturasdd2 = false;
	var flagMultiplodcs2 = false;
	var flagaperturadcs2 = false;
	var objResultado;
	
	
	function listarNivelServicio(anio, mes, idproyecto, nomproyecto){
		var src = "ServletMobilitySLA";
		$.post(src, {
			strAccion : "3",
			id_proyecto : idproyecto,
			mes : mes,
			anio : anio 
			}, function(pdata) {
				objResultado = JSON.parse(pdata);
				
		$.post(src, {
			strAccion : "2",
			cliente : nomproyecto
		}, function(pdata) {
			var obj = JSON.parse(pdata);
			
			//Traer resultado de NIveles de Servicio
			
			for (i = 0; i < obj.NivelServicio.length; i++) {
				if(i==0){
					 cantidadPorletsdd1 = 1;
					 cantidadPorletdcs1 = 1;
					 flagMultiplosdd1 = false;
					 flagaperturasdd1 = false;
					 flagMultiplodcs1 = false;
					 flagaperturadcs1 = false;
					 cantidadPorletsdd2 = 1;
					 cantidadPorletdcs2 = 1;
					 flagMultiplosdd2 = false;
					 flagaperturasdd2 = false;
					 flagMultiplodcs2 = false;
					 flagaperturadcs2 = false;	
				}
				var nombre_sl = obj.NivelServicio[i].nombre_sl;
				var id_tipo = obj.NivelServicio[i].id_tipo;
				
				if(nombre_sl == "Mesa de Ayuda"){
					
					
					if(id_tipo== '1' || id_tipo == '3'){
						$('#divtabSDD1').show();	
// 						$('#divContentSDD1').addClass("active");
						if(cantidadPorletsdd1 == 1){
							$('#divContentSDD1').append('<div class="row" align="center">');	
							generaNav(obj.NivelServicio[i],objResultado);
							flagaperturasdd1 = true;
						}else if(flagMultiplosdd1){
							$('#divContentSDD1').append('<div class="row" align="center">');	
							generaNav(obj.NivelServicio[i],objResultado);
							flagaperturasdd1 = true;
							flagMultiplosdd1 = false;
						}else{
							generaNav(obj.NivelServicio[i],objResultado);
							flagMultiplosdd1 = false;
						}
						
						if((cantidadPorletsdd1 % 4) == 0 ){
							$('#divContentSDD1').append('</div>');
							flagMultiplosdd1 = true;
						}else{
							flagMultiplosdd1 = false;
						}
						
						cantidadPorletsdd1 = cantidadPorletsdd1 + 1;	
					}else if(id_tipo == '2'){
						$('#divtabSDD2').show();
						if(cantidadPorletsdd2 == 1){
							$('#divContentSDD2').append('<div class="row" align="center">');	
							generaNav(obj.NivelServicio[i],objResultado);
							flagaperturasdd2 = true;
						}else if(flagMultiplosdd2){
							$('#divContentSDD2').append('<div class="row" align="center">');	
							generaNav(obj.NivelServicio[i],objResultado);
							flagaperturasdd2 = true;
							flagMultiplosdd2 = false;
						}else{
							generaNav(obj.NivelServicio[i],objResultado);
							flagMultiplosdd2 = false;
						}
						
						if((cantidadPorletsdd2 % 4) == 0 ){
							$('#divContentSDD2').append('</div>');
							flagMultiplosdd2 = true;
						}else{
							flagMultiplosdd2 = false;
						}
						
						cantidadPorletsdd2 = cantidadPorletsdd2 + 1;
					}
						
				}else if(nombre_sl == "Soporte en Sitio"){
					$('#divtabDCS1').show();	
// 					$('#divContentDCS').addClass("active");
					
					if(id_tipo== '1' || id_tipo == '3')
					{$('#divtabDCS1').show();
						if(cantidadPorletdcs1 == 1){
							$('#divContentDCS1').append('<div class="row" align="center">');	
							generaNav(obj.NivelServicio[i],objResultado);
							flagaperturadcs1 = true;
						}else if(flagMultiplodcs1){
							$('#divContentDCS1').append('<div class="row" align="center">');	
							generaNav(obj.NivelServicio[i],objResultado);
							flagaperturadcs1 = true;
							flagMultiplodcs1 = false;
						}else{
							generaNav(obj.NivelServicio[i],objResultado);
							flagMultiplodcs1 = false;
						}
						
						if((cantidadPorletdcs1 % 4) == 0 ){
							$('#divContentDCS1').append('</div>');
							flagMultiplodcs1 = true;
						}else{
							flagMultiplodcs1 = false;
						}
						
						cantidadPorletdcs1 = cantidadPorletdcs1 + 1;	
					}else if(id_tipo== '2' ){
						$('#divtabDCS2').show();
						if(cantidadPorletdcs2 == 1){
							$('#divContentDCS2').append('<div class="row" align="center">');	
							generaNav(obj.NivelServicio[i],objResultado);
							flagaperturadcs2 = true;
						}else if(flagMultiplodcs2){
							$('#divContentDCS2').append('<div class="row" align="center">');	
							generaNav(obj.NivelServicio[i],objResultado);
							flagaperturadcs2 = true;
							flagMultiplodcs2 = false;
						}else{
							generaNav(obj.NivelServicio[i],objResultado);
							flagMultiplodcs2 = false;
						}
						
						if((cantidadPorletdcs2 % 4) == 0 ){
							$('#divContentDCS2').append('</div>');
							flagMultiplodcs2 = true;
						}else{
							flagMultiplodcs2 = false;
						}
					}
					
				}
				
				
				}
			
			if(flagaperturasdd1){
				$('#divContentSDD1').append('</div">');		
			}
			if(flagaperturadcs1){
				$('#divContentDCS1').append('</div">');		
			}
			if(flagaperturasdd2){
				$('#divContentSDD2').append('</div">');		
			}
			if(flagaperturadcs2){
				$('#divContentDCS2').append('</div">');		
			}
		});
		
		});
		}

	function generaNav(vObjNS, vObjResultNS){
		var vid_sl = vObjNS.id_sl;
		var vdescripcion = vObjNS.descripcion;
		var vvalorletra = vObjNS.valorletra
		var vvalornum = vObjNS.valornum
		var vid_tipo = vObjNS.id_tipo
		var resultado;
		var vid_sla = vObjNS.id_sla;
		var vstr1 = vObjNS.str1;
		var vstr2 = vObjNS.str2;
		var vtipotendencia = vObjNS.idtendencia;
		var vvalor1 ;
		var vvalor2 ;
		var vicono ;
		var obj;
		var vtelefono;
		var vcorreo;
		var vcatalogo;
		var vadicional;
		var vchat;
		var vcorreobuzon;
		var vtotal;
		var vtotalinputs;
		var vobjLineaBaseOS;
		var vobjDetalleNSOS;
		var src1 = "ServletMobilitySLA";
		
	if(vid_tipo == "1" || vid_tipo == "3" ){ // LINEA BASE
 		
 		if(vid_sl == "1"){ //MESA DE AYUDA
 		$.post(src1, {
 			strAccion : "4",
			id_proyecto : idproyecto,
			mes : mes,
			anio : anio
		}, function(pdata) {
			var obj = JSON.parse(pdata);
			 vtelefono = obj.DistribucionTickets[0].telefono;
			 vcorreo = obj.DistribucionTickets[0].correo;
			 vcatalogo = obj.DistribucionTickets[0].catalogo;
			 vadicional = obj.DistribucionTickets[0].adicional;
			 vchat = obj.DistribucionTickets[0].chat;
			 vcorreobuzon = obj.DistribucionTickets[0].correobuzon;
			 vtotal = obj.DistribucionTickets[0].total;
			 vtotalinputs = obj.DistribucionTickets[0].totalinputs;
			 
			 generaNavHTML(vid_sl,vdescripcion, vvalorletra,vvalornum, vtipotendencia, vid_tipo, resultado, vid_sla, vstr1, vstr2, vvalor1, vvalor2,vtelefono,
			 			vcorreo,vcatalogo,vadicional,vchat,vcorreobuzon,vtotal,vtotalinputs,vobjLineaBaseOS,vobjDetalleNSOS,vicono);
			 
		});
 		}else if(vid_sl == "2"){  // SOPORTE EN SITIO
 			for( j=0; j<vObjResultNS.Resultado_NS.length; j++){
 		 		if(vObjNS.id_sla == vObjResultNS.Resultado_NS[j].id_sla){
 		 			resultado = vObjResultNS.Resultado_NS[j].valorletra;	
 		 			vvalor1 = vObjResultNS.Resultado_NS[j].valor1;
 		 			vvalor2 = vObjResultNS.Resultado_NS[j].valor2;
 		 			vicono = vObjResultNS.Resultado_NS[j].icono;
 		 		}	
 		 		}
 			$.post(src1, {
 				strAccion : "5",
 				id_sla : vid_sla,
 				mes : mes,
 				anio : anio
 			}, function(pdata) {
 				vobjLineaBaseOS = JSON.parse(pdata);
 	 			generaNavHTML(vid_sl,vdescripcion, vvalorletra,vvalornum, vtipotendencia, vid_tipo, resultado, vid_sla, vstr1, vstr2, vvalor1, vvalor2,vtelefono,
 	 	 	 			vcorreo,vcatalogo,vadicional,vchat,vcorreobuzon,vtotal,vtotalinputs,
 	 	 	 			vobjLineaBaseOS,vobjDetalleNSOS,vicono);	
 			});
 		}
 	}else if(vid_tipo == "2"){ //NIVEL DE SERVICIO
 		for( j=0; j<vObjResultNS.Resultado_NS.length; j++){
 		if(vObjNS.id_sla == vObjResultNS.Resultado_NS[j].id_sla){
 			resultado = vObjResultNS.Resultado_NS[j].valorletra;	
 			vvalor1 = vObjResultNS.Resultado_NS[j].valor1;
 			vvalor2 = vObjResultNS.Resultado_NS[j].valor2;
 			vicono = vObjResultNS.Resultado_NS[j].icono;
 			
 		}	
 		}
 		if(vid_sl == "1"){ //MESA DE AYUDA
 			
 			if(resultado == undefined){
 				resultado = 'N/A';	
 			}
 			generaNavHTML(vid_sl,vdescripcion, vvalorletra,vvalornum, vtipotendencia, vid_tipo, resultado, vid_sla, vstr1, vstr2, vvalor1, vvalor2,vtelefono,
 	 	 			vcorreo,vcatalogo,vadicional,vchat,vcorreobuzon,vtotal,vtotalinputs,vobjLineaBaseOS,vobjDetalleNSOS,vicono);	
 		}else if(vid_sl == "2"){// SOPORTE EN SITIO
 			$.post(src1, {
 				strAccion : "6",
 				id_sla : vid_sla,
 				id_proyecto : idproyecto,
 				mes : mes,
 				anio : anio
 			}, function(pdata) {
 				vobjDetalleNSOS = JSON.parse(pdata);
 	 			generaNavHTML(vid_sl,vdescripcion, vvalorletra,vvalornum, vtipotendencia, vid_tipo, resultado, vid_sla, vstr1, vstr2, vvalor1, vvalor2,vtelefono,
 	 	 	 			vcorreo,vcatalogo,vadicional,vchat,vcorreobuzon,vtotal,vtotalinputs,
 	 	 	 			vobjLineaBaseOS,vobjDetalleNSOS,vicono);	
 			});	
 		}
 		
 	}
 	
	} 	
	
 	function generaNavHTML(vid_sl,vdescripcion, vvalorletra,vvalornum, vtipotendencia, vid_tipo, resultado, vid_sla, vstr1, vstr2, vvalor1, vvalor2,vtelefono,
 			vcorreo,vcatalogo,vadicional,vchat,vcorreobuzon,vtotal,vtotalinputs, vobjLineaBaseOS,vobjDetalleNSOS,vicono){
	var strHtml = '<div class="col-lg-3">'+
							'<div class="box box-primary">'+	
							'<div class="box-header with-border">'+
							'<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i> '+vdescripcion+'</h3>'+
// 							<a class="btn btn-default btn-sm pull-right" onclick="listReport('getMaximoTicketsResueltos','0')"><i class="fa fa-ticket" aria-hidden="true"></i> Ver Tickets</a>
							'</div>'+
								'<div class="box-body" >'+
									'<div  class="table-responsive">'+ 							         
// 										'<div class="col-sm-12 col-sm-3 col-md-3 col-lg-3"align="left">'+
// 											'<img src="http://zanaro.com.br/wp-content/uploads/2017/05/capa-planilha-excel.jpg" style="width: 100%;height: 100%;">'+
// 										'</div>'+							
									
										'<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12" align="center">'+
									    	
			   								'<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">'; 								
			   							if(vid_sl == "1"){//MESA DE AYUDA
			   								if(vid_tipo == "1"){ //BASE LINE TICKETS
			   									var lineaBaseIcono;
			   									var diferencia ;
			   									var tasaDiferencia;
			   									if(parseInt(vtotal) > parseInt(vvalornum)){
			   										lineaBaseIcono = 'fa fa-times-circle text-red';
			   										diferencia = parseInt(vtotal) / parseInt(vvalornum);
			   									}else{
			   										 diferencia = parseInt(vtotal) / parseInt(vvalornum);
			   										if(diferencia >= 0.8){
			   											lineaBaseIcono = 'fa fa-exclamation-circle text-yellow';	
			   										}else{
			   											lineaBaseIcono = 'fa fa-check-circle text-green';	
			   										}
			   									}
			   									tasaDiferencia = parseInt(diferencia*100);
			   									strHtml +=	
			   									'<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" align="center"><h3>'+vtotal+' ('+tasaDiferencia+'%) <i class="'+lineaBaseIcono+'" aria-hidden="true"></i></h3>RESULTADO</div>'+
// 			   									'<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h4><b></b></h4></div>'+
			   									'<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"><h3>'+vvalornum+' <i class="'+vtipotendencia+' text-blue" aria-hidden="true"></i></h3>Linea Base</div>';
			   								}else if(vid_tipo == "3"){//BASE LINE INPUTS
			   									var lineaBaseIcono;
			   									var diferencia;
			   									var tasaDiferencia;
			   									if(parseInt(vtotalinputs) > parseInt(vvalornum)){
			   										lineaBaseIcono = 'fa fa-times-circle text-red';
			   										diferencia = parseInt(vtotalinputs) / parseInt(vvalornum);
			   									}else{
			   										 diferencia = parseInt(vtotalinputs) / parseInt(vvalornum);
			   										 console.log(diferencia);
			   										if(diferencia >= 0.8){
			   											lineaBaseIcono = 'fa fa-exclamation-circle text-yellow';	
			   										}else{
			   											lineaBaseIcono = 'fa fa-check-circle text-green';	
			   										}
			   									}
			   									
			   									tasaDiferencia = parseInt(diferencia*100);
			   									strHtml +=	
			   									'<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" align="center"><h3>'+vtotalinputs+' ('+tasaDiferencia+'%) <i class="'+lineaBaseIcono+'" aria-hidden="true"></i></h3>RESULTADO</div>'+
// 			   									'<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h4><b></b></h4></div>'+
			   									'<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"><h3>'+vvalornum+' <i class="'+vtipotendencia+' text-blue" aria-hidden="true"></i></h3>Linea Base</div>';
			   								}else{ // NIVELES DE SERVICIO
			   									strHtml +=	
			   									'<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" align="center"><h3>'+resultado+' <i class="'+vicono+'" aria-hidden="true"></i></h3>RESULTADO</div>'+
// 			   									'<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h4><b></b></h4></div>'+
			   									'<div cclass="col-xs-5 col-sm-5 col-md-5 col-lg-6" align="center"><h3>'+vvalorletra+' <i class="'+vtipotendencia+' text-blue" aria-hidden="true"></i></h3>SLA</div>';
			   								}
			   							}else if(vid_sl == "2"){ // SOPORTE EN SITIO
			   								if(vid_tipo == "2"){ // NIVELES DE SERVICIO
			   									strHtml +=	
					   								'<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" align="center"><h3>'+resultado+' <i class="'+vicono+'" aria-hidden="true"></i></h3>RESULTADO</div>'+
//	 			   									'<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h4><b></b></h4></div>'+
				   									'<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" align="center"><h3>'+vvalorletra+' <i class="'+vtipotendencia+' text-blue" aria-hidden="true"></i></h3>SLA</div>';
			   								}else{ // LINEA BASE
			   									var lineaBaseIcono;
			   									var diferencia = 0.0;
			   									var tasaDiferencia;
			   									if(parseInt(resultado) > parseInt(vvalornum)){
			   										lineaBaseIcono = 'fa fa-times-circle text-red';
			   									}else{
			   										 diferencia = parseInt(resultado) / parseInt(vvalornum);
			   										if(diferencia >= 0.8){
			   											lineaBaseIcono = 'fa fa-exclamation-circle text-yellow';	
			   										}else{
			   											lineaBaseIcono = 'fa fa-check-circle text-green';	
			   										}
			   									}
			   									tasaDiferencia = parseInt(diferencia*100);
			   									
			   									strHtml +=	
					   								'<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" align="center"><h3>'+resultado+' ('+tasaDiferencia+'%) <i class="'+lineaBaseIcono+'" aria-hidden="true"></i></h3>RESULTADO</div>'+
//	 			   									'<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h4><b></b></h4></div>'+
				   									'<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" align="center"><h3>'+vvalorletra+' <i class="'+vtipotendencia+' text-blue" aria-hidden="true"></i></h3>SLA</div>';
			   								}
				   								
			   							}
			   								
			   								
			   								strHtml +=	'</div>'+
// 			   								'<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">'+	   											   								
// 			   									'<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><h4>'+vdescripcion+'</h4></div>'+			   											   																		
// 			   								'</div>'+
			   								'<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 btn" style="background-color: #34495e;height: 30px;color: white;font-family: verdana"   data-toggle="collapse" href="#sladet'+vid_sla+'" role="button" aria-expanded="false" aria-controls="sladet'+vid_sla+'">'+
												'Detalle'+
											'</div>'+
  										'</div>'+
									'</div> '+
									'<div class="collapse" id="sladet'+vid_sla+'">'+
// 					  						 '<div class="col-xs-0 col-sm-3 col-md-3 col-lg-3"></div> '+
					  						 '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">';
	
	if(vid_sl == "1"){ // MESA DE AYUDA
		if(vid_tipo == "1"){ //BASE LINE TICKETS
			strHtml += 	
				'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
					'<h5>Telefono</h5>'+
				'</div>'+
				'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
					'<h5>'+vtelefono+'</h5>'+
				'</div>'+
				'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
					'<h5>Correo</h5>'+
				'</div>'+
				'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
					'<h5>'+vcorreo+'</h5>'+
				'</div>'+
				'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
					'<h5>Requerimiento adicional</h5>'+
				'</div>'+
				'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
					'<h5>'+vadicional+'</h5>'+
				'</div>'+
				'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
					'<h5>Cat&aacute;logo</h5>'+
				'</div>'+
				'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
					'<h5>'+vcatalogo+'</h5>'+
				'</div>'+
				'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
				'<h5>Chat</h5>'+
				'</div>'+
				'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
					'<h5>'+vchat+'</h5>'+
				'</div>';
			
		}else if(vid_tipo == "3"){
			strHtml += 	
				'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
					'<h5>Telefono</h5>'+
				'</div>'+
				'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
					'<h5>'+vtelefono+'</h5>'+
				'</div>'+
				'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
					'<h5>Correo Buz&oacute;n</h5>'+
				'</div>'+
				'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
					'<h5>'+vcorreobuzon+'</h5>'+
				'</div>'+
				'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
					'<h5>Cat&aacute;logo</h5>'+
				'</div>'+
				'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
					'<h5>'+vcatalogo+'</h5>'+
				'</div>'+
				'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
				'<h5>Chat</h5>'+
				'</div>'+
				'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
					'<h5>'+vchat+'</h5>'+
				'</div>';	
		}else if(vid_tipo == "2"){

			
			if(vstr1 != ''){
				strHtml += 	'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
								'<h4>'+vstr1+'</h4>'+
							'</div>'+
							'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
								'<h4>'+vvalor1+'</h4>'+
							'</div>';
			}							   		
														
			if(vstr2 != ''){
				strHtml += 	'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
								'<h4>'+vstr2+'</h4>'+
							'</div>'+
							'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
								'<h4>'+vvalor2+'</h4>'+
							'</div>';
			}
// 			strHtml += 	'<HR  style="border: 1px solid #3678AB;" />';
		}
	}else if(vid_sl == "2"){// SOPORTE EN SITIO
		
		if((vid_tipo == "1" || vid_tipo == "3")&&(vobjLineaBaseOS.lineaBaseOnsite.length > 0)){ //BASE LINE ONSITE
			
			for(z=0 ; z<vobjLineaBaseOS.lineaBaseOnsite.length; z++){
		strHtml += 	'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
	 					'<h5>'+tildes_unicode(vobjLineaBaseOS.lineaBaseOnsite[z].descripcion)+'</h5>'+
	 				'</div>'+
	 				'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
	 					'<h5>'+vobjLineaBaseOS.lineaBaseOnsite[z].resultado+'</h5>'+
	 				'</div>';	
			}	
		
		}else if(vid_tipo == "2"){// NIVELES DE SERVICIO
			
			if(vstr1 != ''){
				strHtml += 	
							'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
								'<h5>'+vstr1+'</h5>'+
							'</div>'+
							'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
								'<h5>'+vvalor1+'</h5>'+
							'</div>';
			}							   		
														
			if(vstr2 != ''){
				strHtml += 	'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
								'<h5>'+vstr2+'</h5>'+
							'</div>'+
							'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
								'<h5>'+vvalor2+'</h5>'+
							'</div>';
			}
			
			//DETALLE DE NIVELES DE SERVICIO
			
			var iconoVip;
			var iconoAlta;
			var iconoMedia;
			var iconoBaja;
			var iconoPT;
			//Validación estado Tiempo VIP
			if(parseInt(vobjDetalleNSOS.DetalleNivelServicioOnsite[0].vip_res_sla)>= (parseInt(vvalornum) + (100-parseInt(vvalornum))*0.2) ){
				iconoVip = 'fa fa-check-circle text-green';	
			}else if(parseInt(vobjDetalleNSOS.DetalleNivelServicioOnsite[0].vip_res_sla)> vvalornum){
				iconoVip = 'fa fa-exclamation-circle text-yellow';
			}else{
				iconoVip = 'fa fa-times-circle text-red';
			}
			
			//Validación estado Tiempo Alta
			if(parseInt(vobjDetalleNSOS.DetalleNivelServicioOnsite[0].alta_res_sla)>= (parseInt(vvalornum) + (100-parseInt(vvalornum))*0.2) ){
				iconoAlta = 'fa fa-check-circle text-green';	
			}else if(parseInt(vobjDetalleNSOS.DetalleNivelServicioOnsite[0].alta_res_sla)> vvalornum){
				iconoAlta = 'fa fa-exclamation-circle text-yellow';
			}else{
				iconoAlta = 'fa fa-times-circle text-red';
			}
			
			//Validación estado Tiempo Media
			if(parseInt(vobjDetalleNSOS.DetalleNivelServicioOnsite[0].media_res_sla)>= (parseInt(vvalornum) + (100-parseInt(vvalornum))*0.2) ){
				iconoMedia = 'fa fa-check-circle text-green';	
			}else if(parseInt(vobjDetalleNSOS.DetalleNivelServicioOnsite[0].media_res_sla)> vvalornum){
				iconoMedia = 'fa fa-exclamation-circle text-yellow';
			}else{
				iconoMedia = 'fa fa-times-circle text-red';
			}
			
			//Validación estado Tiempo Baja
			if(parseInt(vobjDetalleNSOS.DetalleNivelServicioOnsite[0].baja_res_sla)>= (parseInt(vvalornum) + (100-parseInt(vvalornum))*0.2)){
				iconoBaja = 'fa fa-check-circle text-green';	
			}else if(parseInt(vobjDetalleNSOS.DetalleNivelServicioOnsite[0].baja_res_sla)> vvalornum){
				iconoBaja = 'fa fa-exclamation-circle text-yellow';
			}else{
				iconoBaja = 'fa fa-times-circle text-red';
			}
			
			
			strHtml += 	'<HR  style="border: 1px solid #3678AB;" /><div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
						'<h4>VIP en Sla</h4>'+
						'</div>'+
						'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
							'<h4>'+vobjDetalleNSOS.DetalleNivelServicioOnsite[0].vip_en_sla+'</h4>'+
						'</div>'+
						'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
						'<h4>VIP cantidad</h4>'+
						'</div>'+
						'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
							'<h4>'+vobjDetalleNSOS.DetalleNivelServicioOnsite[0].vip_cant+'</h4>'+
						'</div>'+
						'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
						'<h4>VIP resultado</h4>'+
						'</div>'+
						'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
							'<h4>'+vobjDetalleNSOS.DetalleNivelServicioOnsite[0].vip_res_sla+'% <i class="'+iconoVip+'" aria-hidden="true"></i></h4>'+
						'</div> <HR  style="border: 1px solid #3678AB;" />'+
						'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
						'<h4>Prioridad Alta en Sla</h4>'+
						'</div>'+
						'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
							'<h4>'+vobjDetalleNSOS.DetalleNivelServicioOnsite[0].alta_en_sla+'</h4>'+
						'</div>'+
						'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
						'<h4>Prioridad Alta cantidad</h4>'+
						'</div>'+
						'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
							'<h4>'+vobjDetalleNSOS.DetalleNivelServicioOnsite[0].alta_cant+'</h4>'+
						'</div>'+
						'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
						'<h4>Prioridad Alta resultado</h4>'+
						'</div>'+
						'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
							'<h4>'+vobjDetalleNSOS.DetalleNivelServicioOnsite[0].alta_res_sla+'% <i class="'+iconoAlta+'" aria-hidden="true"></i></h4>'+
						'</div><HR  style="border: 1px solid #3678AB;" />'+
						'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
						'<h4>Prioridad Media en Sla</h4>'+
						'</div>'+
						'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
							'<h4>'+vobjDetalleNSOS.DetalleNivelServicioOnsite[0].media_en_sla+'</h4>'+
						'</div>'+
						'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
						'<h4>Prioridad Media cantidad</h4>'+
						'</div>'+
						'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
							'<h4>'+vobjDetalleNSOS.DetalleNivelServicioOnsite[0].media_cant+'</h4>'+
						'</div>'+
						'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
						'<h4>Prioridad Media resultado</h4>'+
						'</div>'+
						'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
							'<h4>'+vobjDetalleNSOS.DetalleNivelServicioOnsite[0].media_res_sla+'% <i class="'+iconoMedia+'" aria-hidden="true"></i></h4>'+
						'</div><HR  style="border: 1px solid #3678AB;" />'+
						'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
						'<h4>Prioridad Baja en Sla</h4>'+
						'</div>'+
						'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
							'<h4>'+vobjDetalleNSOS.DetalleNivelServicioOnsite[0].baja_en_sla+'</h4>'+
						'</div>'+
						'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
						'<h4>Prioridad Baja cantidad</h4>'+
						'</div>'+
						'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
							'<h4>'+vobjDetalleNSOS.DetalleNivelServicioOnsite[0].baja_cant+'</h4>'+
						'</div>'+
						'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
						'<h4>Prioridad Baja resultado</h4>'+
						'</div>'+
						'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
							'<h4>'+vobjDetalleNSOS.DetalleNivelServicioOnsite[0].baja_res_sla+'% <i class="'+iconoBaja+'" aria-hidden="true"></i></h4>'+
						'</div><HR  style="border: 1px solid #3678AB;" />';
			
			if(vdescripcion.indexOf('IMAC') == 0 && vdescripcion.indexOf('NR') == -1){
				
				//Validación estado Tiempo Baja
				if(parseInt(vobjDetalleNSOS.DetalleNivelServicioOnsite[0].ptrabajo_res_sla)>= (parseInt(vvalornum) + (100-parseInt(vvalornum))*0.2)){
					iconoPT = 'fa fa-check-circle text-green';	
				}else if(parseInt(vobjDetalleNSOS.DetalleNivelServicioOnsite[0].ptrabajo_res_sla)> vvalornum){
					iconoPT = 'fa fa-exclamation-circle text-yellow';
				}else{
					iconoPT = 'fa fa-times-circle text-red';
				}
				
				strHtml += 	'<HR  style="border: 1px solid #3678AB;" /><div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
							'<h4>Hab. puesto trabajo en sla</h4>'+
							'</div>'+
							'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
								'<h4>'+vobjDetalleNSOS.DetalleNivelServicioOnsite[0].ptrabajo_en_sla+'</h4>'+
							'</div>'+
							'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
							'<h4>Hab. puesto trabajo cantidad</h4>'+
							'</div>'+
							'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
								'<h4>'+vobjDetalleNSOS.DetalleNivelServicioOnsite[0].ptrabajo_cant+'</h4>'+
							'</div>'+
							'<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">'+
							'<h4>Hab. puesto trabajo resultado</h4>'+
							'</div>'+
							'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
								'<h4>'+vobjDetalleNSOS.DetalleNivelServicioOnsite[0].ptrabajo_res_sla+'% <i class="'+iconoPT+'" aria-hidden="true"></i></h4>'+
							'</div>';
			}
	
		}
	}
												
										
			strHtml += 				'</div>'+
					   	
					  				'</div>'+
									
									'</div>'+
								'</div>'+
							'</div>';
	if(vid_sl == "1"){
		if(vid_tipo == "1" || vid_tipo == "3"){
			$('#divContentSDD1').append(strHtml);	
		}else{
			$('#divContentSDD2').append(strHtml);
		}
			
	}else if(vid_sl == "2"){
		if(vid_tipo == "1" || vid_tipo == "3"){
			$('#divContentDCS1').append(strHtml);	
		}else{
			$('#divContentDCS2').append(strHtml);
		}
			
	}					
    

	}
	
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
	
	function creapdf(){

		var imgPortadaPie = 'data:image/jpeg;base64,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';

		//DATOS IBM
		var imgPortadaIBM = 'data:image/jpeg;base64,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';
		var nombrelegalIBM = 'IBM del Perú S.A.C.';
		
		//DATOS CLIENTES
		var imglogo28 = 'data:image/png;base64,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';
		var nombreProyecto28 = 'Rímac Seguros';
		
		//CLIENTE SELECCIONADO
		anio = $('#txtPeriodo').val().substr(0,4);
		mes = $('#txtPeriodo').val().substr(5,7);
		var nombreMeses = ["N/A","Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
	    
	
		var nombreMes = nombreMeses[parseInt(mes)];
	    
		idproyecto= $('#cboClientes').val();
		nomproyecto= $("#cboClientes option:selected").html();
		var nombrelegalProyecto;
		var imglogoProyecto;
		
		switch(idproyecto){
		case '28':
			nombrelegalProyecto = nombreProyecto28;
			imglogoProyecto = imglogo28;
			break;
		}
		
		var src = "ServletMobilitySLA";
		$.post(src, {
				strAccion : "10",
				id_proyecto : idproyecto,
				cliente : nomproyecto,
				mes : mes,
				anio : anio
		}, function(pdata) {
			var obj = JSON.parse(pdata);
			
		
	
		var doc = new jsPDF();
		 //doc.setFont("helvetica");
	 	 //doc.setLanguage("es-PE")
		 
		 //Pie 
		 function footer(){
		 doc.setFontType('normal')
		 doc.setFontSize(10);
		 doc.setTextColor(23, 32, 42); // formato color RGB
		 doc.line(15, 280, 190, 280); // coordenadas X1,Y1 - X2,Y2
		 doc.text(tildes_unicode('Página ')  + doc.internal.getNumberOfPages(), 170, 285)
		 };

		//Cabecera     
		 function header(){
		 doc.setFontType('normal')
		 doc.setFontSize(10);
		 doc.setTextColor(23, 32, 42);
		 doc.addImage(imgPortadaIBM, 'JPEG', 15, 10, 30, 10);  //addImage(imageData, format, x, y, width, height)
		 doc.addImage(imglogoProyecto, 'JPEG', 170, 5, 20, 20);
		 doc.text('Mesa de Ayuda - Informe Mensual del Servicio', 70, 15)
		 doc.text(nombreMes.toUpperCase()+' '+anio, 95, 20)
		 doc.line(15, 25, 190, 25); 
		 }
		 
		 function nuevaPagina(){
		    doc.addPage();
		    header();
		    footer();
		 }
		 
		 //Página 1: Portada
// 		 doc.setDrawColor(0)
// 		 doc.setFillColor(32, 53, 70)
// 		 doc.rect(0, 0, 210, 297, 'F')
		 doc.addImage(imgPortadaIBM, 'JPEG', 15, 15, 60, 20);
		 doc.addImage(imglogoProyecto, 'JPEG', 155, 5, 40, 40);
		 doc.setFontSize(22);
		 doc.setTextColor(0,85,136);
		 doc.setFontType("bold");
		 doc.text('Mesa de Ayuda - Informe Mensual',70, 100);
		 doc.setFontSize(18);
		 doc.text(70, 110, nombreMes.toUpperCase()+' '+anio);
		 doc.addImage(imgPortadaPie, 'JPEG', 15, 150, 180, 120);
		 
		//nueva pÃ¡gina
		 nuevaPagina();

		//PÃ¡gina 2: Indice
		 doc.setFontType('bold')
	     doc.setFontSize(16);
		 doc.text(90, 40, 'CONTENIDO');
		 doc.setFontType('normal')
	     doc.setFontSize(14);
		 doc.text(20, 70, '1. Introducción');
// 		 doc.text(20, 80, '2. Resumen Ejecutivo');
		 doc.text(20, 80, '2. Cumplimiento de Niveles de Servicio');
		 doc.text(50, 90, '2.1. Niveles de Servicio de Mesa de Ayuda');
		 doc.text(50, 100,'2.2. Niveles de Servicio de Soporte en Sitio');
		 doc.text(20, 110, '3. Resumen de llamadas');
// 	     doc.text(20, 120, '5. Resumen de tickets');
		
	     //nueva pÃ¡gina
		 nuevaPagina();
		 
		 //PÃ¡gina 3: Introduccion
		 doc.setFontType('bold')
	     doc.setFontSize(16);
		 doc.text(80, 40,tildes_unicode('1.- INTRODUCCIÓN'));
		 
		 doc.setFontType('normal')
	     doc.setFontSize(14);
	     var textIntro = "El presente informe tiene como objetivo brindar la información necesaria y consolidada de las labores realizadas durante el mes de "+nombreMes+" del "+anio+", referente a los Servicios de Mesa Ayuda contratados entre "+nombrelegalProyecto+" e "+nombrelegalIBM+". En este informe se entrega los resultados de las líneas bases, Acuerdos de Niveles del Servicio, análisis de las llamadas y tickets ingresados a la Mesa de Ayuda.";
	   	 doc.text(tildes_unicode(textIntro),15,60,{maxWidth: 175, align: "justify"});
		
	   	 //nueva pÃ¡gina
		 nuevaPagina();
	   	 
		//PÃ¡gina 4:  RESUMEN CUMPLIMIENTO DE NIVELES DE SERVICIO
		 doc.setFontType('bold')
	     doc.setFontSize(16);
		 doc.text(45, 40,tildes_unicode('2. CUMPLIMIENTO DE NIVELES DE SERVICIO'));
		 
		 
		 doc.setFontType('bold')
	     doc.setFontSize(15);
		 doc.text(27, 50,tildes_unicode('2.1 Cumplimiento de Niveles de Servicio de Mesa de Ayuda'));
		 
		 //Linea Base Mesa de Ayuda
		 var indiceLineaBaseSDD;
		 
		 for(i=0; i<obj.NivelServicio.length;i++){
		 if(obj.NivelServicio[i].id_sl == '1' && obj.NivelServicio[i].id_tipo == '1'){ // Linea Base Tickets
			 indiceLineaBaseSDD = i; break; 
		 }else if(obj.NivelServicio[i].id_sl == '1' && obj.NivelServicio[i].id_tipo == '3'){ // Linea Base Inputs
			 indiceLineaBaseSDD = i; break; 
		 }
	     }	 
		 
		 //Columnas cabeceras tabla Linea Base
		 var columnsLineaBaseSDD = [];
		 var cadena0 ={};
		 cadena0 = {title: "DESCRIPCIÓN", key: "descripcion", header:"DESCRIPCIÓN"};
		 columnsLineaBaseSDD.push(cadena0);
		 cadena0 = {title: "BASELINE", key: "baseline", header:"BASELINE"};
		 columnsLineaBaseSDD.push(cadena0);
		 
		//Columnas cabeceras tabla Detalle Linea Base
		 var columnsDetLineaBaseSDD = [];
		 var cadenaDet0 ={};
		 cadenaDet0 = {title: "ORIGEN", key: "origen", header:"ORIGEN"};
		 columnsDetLineaBaseSDD.push(cadenaDet0);
		 
		//Columnas cabeceras 
		 for(j=0; j<obj.DistribucionTicket.length;j++){
			 var cadena2 = {title:nombreMeses[parseInt(obj.DistribucionTicket[j].mes)].substr(0,3).toUpperCase()+'-'+obj.DistribucionTicket[j].anio.substr(2,2), key:"mes"+j , header:nombreMeses[parseInt(obj.DistribucionTicket[j].mes)].substr(0,3).toUpperCase()+'-'+obj.DistribucionTicket[j].anio.substr(2,2) };
			 columnsLineaBaseSDD.push(cadena2);
			 columnsDetLineaBaseSDD.push(cadena2);
		 }
		 cadena0 = {title: "DIFERENCIA", key: "diferencia", header:"DIFERENCIA"};
		 columnsLineaBaseSDD.push(cadena0);
		 cadena0 = {title: "%UTILIZADO", key: "utilizado", header:"%UTILIZADO"};
		 columnsLineaBaseSDD.push(cadena0);
		 
		 cadenaDet0 = {title: "PORCENTAJE", key: "porcentaje", header:"PORCENTAJE"};
		 columnsDetLineaBaseSDD.push(cadenaDet0);
	   	 
		
		//DATA tabla Linea Base
		 var dataLineaBaseSDD = [];
		 var caddataLineaBaseSDD = {};
		 caddataLineaBaseSDD.descripcion = obj.NivelServicio[indiceLineaBaseSDD].comentario;
		 caddataLineaBaseSDD.baseline = obj.NivelServicio[indiceLineaBaseSDD].valornum;
		 if(obj.NivelServicio[indiceLineaBaseSDD].id_tipo == '3'){
			 caddataLineaBaseSDD.mes0 = obj.DistribucionTicket[0].totalinputs;
			 caddataLineaBaseSDD.mes1 = obj.DistribucionTicket[1].totalinputs;
			 caddataLineaBaseSDD.mes2 = obj.DistribucionTicket[2].totalinputs;
			 caddataLineaBaseSDD.mes3 = obj.DistribucionTicket[3].totalinputs;
			 caddataLineaBaseSDD.mes4 = obj.DistribucionTicket[4].totalinputs;
			 caddataLineaBaseSDD.mes5 = obj.DistribucionTicket[5].totalinputs;
		 }else if(obj.NivelServicio[indiceLineaBaseSDD].id_tipo == '1'){
			 caddataLineaBaseSDD.mes0 = obj.DistribucionTicket[0].total;
			 caddataLineaBaseSDD.mes1 = obj.DistribucionTicket[1].total;
			 caddataLineaBaseSDD.mes2 = obj.DistribucionTicket[2].total;
			 caddataLineaBaseSDD.mes3 = obj.DistribucionTicket[3].total;
			 caddataLineaBaseSDD.mes4 = obj.DistribucionTicket[4].total;
			 caddataLineaBaseSDD.mes5 = obj.DistribucionTicket[5].total;	 
		 }
		 caddataLineaBaseSDD.diferencia = parseInt(obj.NivelServicio[indiceLineaBaseSDD].valornum) - parseInt(obj.DistribucionTicket[5].totalinputs);
		 caddataLineaBaseSDD.utilizado = Math.round(((parseFloat(obj.DistribucionTicket[5].totalinputs) / parseFloat(obj.NivelServicio[indiceLineaBaseSDD].valornum)) * 100.00) * 100) / 100 +'%';
		 
		 dataLineaBaseSDD.push(caddataLineaBaseSDD);
		 
		 //DATA tabla Detalle Linea base
		 var dataDetLineaBaseSDD = [];
		 var cadDetdataLineaBaseSDD = {};
		 
		 	
			
		 if(obj.NivelServicio[indiceLineaBaseSDD].id_tipo == '3'){
			 	cadDetdataLineaBaseSDD = {}
			 	cadDetdataLineaBaseSDD.origen = 'Telefono';
			 	cadDetdataLineaBaseSDD.mes0 = obj.DistribucionTicket[0].telefono;
				cadDetdataLineaBaseSDD.mes1 = obj.DistribucionTicket[1].telefono;
				cadDetdataLineaBaseSDD.mes2 = obj.DistribucionTicket[2].telefono;
				cadDetdataLineaBaseSDD.mes3 = obj.DistribucionTicket[3].telefono;
				cadDetdataLineaBaseSDD.mes4 = obj.DistribucionTicket[4].telefono;
				cadDetdataLineaBaseSDD.mes5 = obj.DistribucionTicket[5].telefono;
				cadDetdataLineaBaseSDD.porcentaje = Math.round(((parseFloat(obj.DistribucionTicket[5].telefono) / parseFloat(obj.DistribucionTicket[5].totalinputs))*100) * 100) / 100 +'%';
				dataDetLineaBaseSDD.push(cadDetdataLineaBaseSDD);
		 
			    cadDetdataLineaBaseSDD = {}
			 	cadDetdataLineaBaseSDD.origen = 'Correo Buzón';
			 	cadDetdataLineaBaseSDD.mes0 = obj.DistribucionTicket[0].correobuzon;
				cadDetdataLineaBaseSDD.mes1 = obj.DistribucionTicket[1].correobuzon;
				cadDetdataLineaBaseSDD.mes2 = obj.DistribucionTicket[2].correobuzon;
				cadDetdataLineaBaseSDD.mes3 = obj.DistribucionTicket[3].correobuzon;
				cadDetdataLineaBaseSDD.mes4 = obj.DistribucionTicket[4].correobuzon;
				cadDetdataLineaBaseSDD.mes5 = obj.DistribucionTicket[5].correobuzon;
				cadDetdataLineaBaseSDD.porcentaje = Math.round(((parseFloat(obj.DistribucionTicket[5].correobuzon) / parseFloat(obj.DistribucionTicket[5].totalinputs))*100) * 100) / 100 +'%';
				dataDetLineaBaseSDD.push(cadDetdataLineaBaseSDD);	
				
				cadDetdataLineaBaseSDD = {}
			 	cadDetdataLineaBaseSDD.origen = 'Tickets web';
			 	cadDetdataLineaBaseSDD.mes0 = obj.DistribucionTicket[0].catalogo;
				cadDetdataLineaBaseSDD.mes1 = obj.DistribucionTicket[1].catalogo;
				cadDetdataLineaBaseSDD.mes2 = obj.DistribucionTicket[2].catalogo;
				cadDetdataLineaBaseSDD.mes3 = obj.DistribucionTicket[3].catalogo;
				cadDetdataLineaBaseSDD.mes4 = obj.DistribucionTicket[4].catalogo;
				cadDetdataLineaBaseSDD.mes5 = obj.DistribucionTicket[5].catalogo;
				cadDetdataLineaBaseSDD.porcentaje = Math.round(((parseFloat(obj.DistribucionTicket[5].catalogo) / parseFloat(obj.DistribucionTicket[5].totalinputs))*100) * 100) / 100 +'%';
				dataDetLineaBaseSDD.push(cadDetdataLineaBaseSDD);
				
				cadDetdataLineaBaseSDD = {}
			 	cadDetdataLineaBaseSDD.origen = 'TOTAL';
			 	cadDetdataLineaBaseSDD.mes0 = obj.DistribucionTicket[0].totalinputs;
				cadDetdataLineaBaseSDD.mes1 = obj.DistribucionTicket[1].totalinputs;
				cadDetdataLineaBaseSDD.mes2 = obj.DistribucionTicket[2].totalinputs;
				cadDetdataLineaBaseSDD.mes3 = obj.DistribucionTicket[3].totalinputs;
				cadDetdataLineaBaseSDD.mes4 = obj.DistribucionTicket[4].totalinputs;
				cadDetdataLineaBaseSDD.mes5 = obj.DistribucionTicket[5].totalinputs;
				cadDetdataLineaBaseSDD.porcentaje = Math.round(((parseFloat(obj.DistribucionTicket[5].totalinputs) / parseFloat(obj.DistribucionTicket[5].totalinputs))*100) * 100) / 100 +'%';
				dataDetLineaBaseSDD.push(cadDetdataLineaBaseSDD);
				
				
		 }else if(obj.NivelServicio[indiceLineaBaseSDD].id_tipo == '1'){
			 	cadDetdataLineaBaseSDD.origen = 'Telefono';
			 	cadDetdataLineaBaseSDD.mes0 = obj.DistribucionTicket[0].telefono;
				cadDetdataLineaBaseSDD.mes1 = obj.DistribucionTicket[1].telefono;
				cadDetdataLineaBaseSDD.mes2 = obj.DistribucionTicket[2].telefono;
				cadDetdataLineaBaseSDD.mes3 = obj.DistribucionTicket[3].telefono;
				cadDetdataLineaBaseSDD.mes4 = obj.DistribucionTicket[4].telefono;
				cadDetdataLineaBaseSDD.mes5 = obj.DistribucionTicket[5].telefono;
				cadDetdataLineaBaseSDD.porcentaje = Math.round(((parseFloat(obj.DistribucionTicket[5].telefono) / parseFloat(obj.DistribucionTicket[5].total))*100) * 100) / 100 +'%';
				dataDetLineaBaseSDD.push(cadDetdataLineaBaseSDD);
				
			 	cadDetdataLineaBaseSDD = {}
			 	cadDetdataLineaBaseSDD.origen = 'Correo';
			 	cadDetdataLineaBaseSDD.mes0 = obj.DistribucionTicket[0].correo;
				cadDetdataLineaBaseSDD.mes1 = obj.DistribucionTicket[1].correo;
				cadDetdataLineaBaseSDD.mes2 = obj.DistribucionTicket[2].correo;
				cadDetdataLineaBaseSDD.mes3 = obj.DistribucionTicket[3].correo;
				cadDetdataLineaBaseSDD.mes4 = obj.DistribucionTicket[4].correo;
				cadDetdataLineaBaseSDD.mes5 = obj.DistribucionTicket[5].correo;
				cadDetdataLineaBaseSDD.porcentaje = Math.round(((parseFloat(obj.DistribucionTicket[5].correo) / parseFloat(obj.DistribucionTicket[5].total))*100) * 100) / 100 +'%';
				dataDetLineaBaseSDD.push(cadDetdataLineaBaseSDD);	
				
				cadDetdataLineaBaseSDD = {}
			 	cadDetdataLineaBaseSDD.origen = 'Requerimiento adicional';
			 	cadDetdataLineaBaseSDD.mes0 = obj.DistribucionTicket[0].adicional;
				cadDetdataLineaBaseSDD.mes1 = obj.DistribucionTicket[1].adicional;
				cadDetdataLineaBaseSDD.mes2 = obj.DistribucionTicket[2].adicional;
				cadDetdataLineaBaseSDD.mes3 = obj.DistribucionTicket[3].adicional;
				cadDetdataLineaBaseSDD.mes4 = obj.DistribucionTicket[4].adicional;
				cadDetdataLineaBaseSDD.mes5 = obj.DistribucionTicket[5].adicional;
				cadDetdataLineaBaseSDD.porcentaje = Math.round(((parseFloat(obj.DistribucionTicket[5].adicional) / parseFloat(obj.DistribucionTicket[5].total))*100) * 100) / 100 +'%';
				dataDetLineaBaseSDD.push(cadDetdataLineaBaseSDD);
				
				cadDetdataLineaBaseSDD = {}
			 	cadDetdataLineaBaseSDD.origen = 'Tickets web';
			 	cadDetdataLineaBaseSDD.mes0 = obj.DistribucionTicket[0].catalogo;
				cadDetdataLineaBaseSDD.mes1 = obj.DistribucionTicket[1].catalogo;
				cadDetdataLineaBaseSDD.mes2 = obj.DistribucionTicket[2].catalogo;
				cadDetdataLineaBaseSDD.mes3 = obj.DistribucionTicket[3].catalogo;
				cadDetdataLineaBaseSDD.mes4 = obj.DistribucionTicket[4].catalogo;
				cadDetdataLineaBaseSDD.mes5 = obj.DistribucionTicket[5].catalogo;
				cadDetdataLineaBaseSDD.porcentaje = Math.round(((parseFloat(obj.DistribucionTicket[5].catalogo) / parseFloat(obj.DistribucionTicket[5].total))*100) * 100) / 100 +'%';
				dataDetLineaBaseSDD.push(cadDetdataLineaBaseSDD);
				
				cadDetdataLineaBaseSDD = {}
			 	cadDetdataLineaBaseSDD.origen = 'TOTAL';
			 	cadDetdataLineaBaseSDD.mes0 = obj.DistribucionTicket[0].total;
				cadDetdataLineaBaseSDD.mes1 = obj.DistribucionTicket[1].total;
				cadDetdataLineaBaseSDD.mes2 = obj.DistribucionTicket[2].total;
				cadDetdataLineaBaseSDD.mes3 = obj.DistribucionTicket[3].total;
				cadDetdataLineaBaseSDD.mes4 = obj.DistribucionTicket[4].total;
				cadDetdataLineaBaseSDD.mes5 = obj.DistribucionTicket[5].total;
				cadDetdataLineaBaseSDD.porcentaje = Math.round(((parseFloat(obj.DistribucionTicket[5].total) / parseFloat(obj.DistribucionTicket[5].total))*100) * 100) / 100 +'%';
				dataDetLineaBaseSDD.push(cadDetdataLineaBaseSDD);
	
		 }
		 
		doc.setFontType('bold')
	    doc.setFontSize(13);
		doc.text(90, 70,tildes_unicode('Linea Base'));
		 
		doc.autoTable(columnsLineaBaseSDD, dataLineaBaseSDD,
					{startY: 80, 
					styles: {fontSize: 8},
					columnStyles: {descripcion: {cellWidth: 5}}
					});
		doc.setDrawColor(0)
		doc.rect(15, 120, 180, 100)
		doc.addImage(myChartLineaBase, 'PNG', 15, 120, 180, 100);
	  	
		//nueva pÃ¡gina
		 nuevaPagina();
		doc.setFontType('bold')
	    doc.setFontSize(13);
		doc.text(15, 40,tildes_unicode('Detalle de Linea Base'));
		 
		doc.autoTable(columnsDetLineaBaseSDD, dataDetLineaBaseSDD,
				{startY: 50, 
				styles: {fontSize: 8},
				columnStyles: {descripcion: {cellWidth: 5}}
				});
		
		doc.setDrawColor(0)
		doc.rect(15, 100, 180, 100)
		doc.addImage(myChartDetalleLineaBase, 'PNG', 15, 100, 180, 100);
	  		
		 //nueva pÃ¡gina
		 nuevaPagina();
		 
		 doc.setFontType('bold')
	     doc.setFontSize(13);
		 doc.text(65, 40,tildes_unicode('Niveles de Servicio de Mesa de Ayuda'));
		 
		 var alturaSLA = 50;
		 var nombreSLASDD;
		 var columnsSLASDD = [];
		 var cadena0SLASDD ={};
		 
		 var dataDetSLASDD = [];
		 var cadDetdataDetSLASDD = {};
		 var contadorTablas = 0;
		 
		 for(i=0; i<obj.NivelServicio.length; i++ ){
			if(obj.NivelServicio[i].id_sl == '1' && obj.NivelServicio[i].id_tipo == '2'){
				contadorTablas = contadorTablas +1;
				
				if((contadorTablas % 6) == 0){
					 nuevaPagina();	
				 }
				
				columnsSLASDD = [];
				cadena0SLASDD ={};
			
				nombreSLASDD = obj.NivelServicio[i].descripcion;
				
				 cadena0SLASDD = {title: "FÓRMULA", dataKey: "formula", header:"FÓRMULA"};
				 columnsSLASDD.push(cadena0SLASDD);
				 cadena0SLASDD = {title: "CANTIDAD", dataKey: "cantidad", header:"CANTIDAD"};
				 columnsSLASDD.push(cadena0SLASDD);
				 cadena0SLASDD = {title: "VALOR SLA", dataKey: "valorsla", header:"VALOR SLA"};
				 columnsSLASDD.push(cadena0SLASDD);
				 cadena0SLASDD = {title: "RESULTADO", dataKey: "resultado", header:"RESULTADO"};
				 columnsSLASDD.push(cadena0SLASDD);
				 
				 
				
				 for(j=0; j < obj.Resultado_NS.length; j++){
					if(obj.Resultado_NS[j].id_sla == obj.NivelServicio[i].id_sla){
						dataDetSLASDD = [];
						cadDetdataDetSLASDD = {};
						
						 cadDetdataDetSLASDD = {}
						 cadDetdataDetSLASDD.formula = obj.NivelServicio[i].str1;
						 cadDetdataDetSLASDD.cantidad = obj.Resultado_NS[j].valor1;
						 cadDetdataDetSLASDD.valorsla = obj.NivelServicio[i].valorletra;
						 cadDetdataDetSLASDD.resultado = obj.Resultado_NS[j].valorletra;
						 dataDetSLASDD.push(cadDetdataDetSLASDD);	
							
						 cadDetdataDetSLASDD = {}
		 				 cadDetdataDetSLASDD.formula = obj.NivelServicio[i].str2;
						 cadDetdataDetSLASDD.cantidad = obj.Resultado_NS[j].valor2;
						 cadDetdataDetSLASDD.valorsla = obj.NivelServicio[i].valorletra;
						 cadDetdataDetSLASDD.resultado = obj.Resultado_NS[j].valorletra;
						 dataDetSLASDD.push(cadDetdataDetSLASDD);	
						
					}
				 
				 }

// 				 console.log('dataDetSLASDD.column.dataKey '+Object.getOwnPropertyNames(dataDetSLASDD)) ;
				
				 doc.setFontType('normal')
			     doc.setFontSize(10);
				 alturaSLA = alturaSLA + 10; 
				 doc.text(15, alturaSLA ,'SLA : '+nombreSLASDD);
				 alturaSLA = alturaSLA + 5; 
				 doc.autoTable(columnsSLASDD, dataDetSLASDD,
							{startY: alturaSLA, 
							styles: {fontSize: 8},
							columnStyles: {formula: {cellWidth: 80}}
							});
				 if((contadorTablas % 5) == 0){
					 alturaSLA = 30;
				 }else{
				 alturaSLA = alturaSLA+20;
				 }
				 
				 
			}
			 
		 }
		 
		 //Nueva Pagina
		 nuevaPagina();
		 
		 doc.setFontType('bold')
	     doc.setFontSize(15);
		 doc.text(27, 40,tildes_unicode('2.2 Cumplimiento de Niveles de Servicio Soporte en Sitio'));
		 
		 doc.setFontType('bold')
	     doc.setFontSize(13);
		 doc.text(75, 55,tildes_unicode('Linea Base Soporte en Sitio'));
		 
		 var columnsLineaBaseDCS = [];

		 var cadena0LineaBaseDCS ={};
		 
		 
		 //CABECERA LINEA BASE ONSITE
		 cadena0LineaBaseDCS = {title: "DESCRIPCION", dataKey: "descripcion", header:"DESCRIPCION"};
		 columnsLineaBaseDCS.push(cadena0LineaBaseDCS);
		 cadena0LineaBaseDCS = {title: "LINEA BASE", dataKey: "lineabase", header:"LINEA BASE"};
		 columnsLineaBaseDCS.push(cadena0LineaBaseDCS);
		 cadena0LineaBaseDCS = {title: nombreMeses[parseInt((obj.ResultadoHistorico_LineaBaseOS[0].strMes1==''?'0':obj.ResultadoHistorico_LineaBaseOS[0].strMes1.substr(5,obj.ResultadoHistorico_LineaBaseOS[0].strMes1.length)))].substr(0,3).toUpperCase()+'-'+(obj.ResultadoHistorico_LineaBaseOS[0].strMes1==''?'N/A':obj.ResultadoHistorico_LineaBaseOS[0].strMes1.substr(2,2)), dataKey: "mes1"};
		 columnsLineaBaseDCS.push(cadena0LineaBaseDCS);
		 cadena0LineaBaseDCS = {title: nombreMeses[parseInt((obj.ResultadoHistorico_LineaBaseOS[0].strMes2==''?'0':obj.ResultadoHistorico_LineaBaseOS[0].strMes2.substr(5,obj.ResultadoHistorico_LineaBaseOS[0].strMes2.length)))].substr(0,3).toUpperCase()+'-'+(obj.ResultadoHistorico_LineaBaseOS[0].strMes2==''?'N/A':obj.ResultadoHistorico_LineaBaseOS[0].strMes2.substr(2,2)), dataKey: "mes2"};
		 columnsLineaBaseDCS.push(cadena0LineaBaseDCS);
		 cadena0LineaBaseDCS = {title: nombreMeses[parseInt((obj.ResultadoHistorico_LineaBaseOS[0].strMes3==''?'0':obj.ResultadoHistorico_LineaBaseOS[0].strMes3.substr(5,obj.ResultadoHistorico_LineaBaseOS[0].strMes3.length)))].substr(0,3).toUpperCase()+'-'+(obj.ResultadoHistorico_LineaBaseOS[0].strMes3==''?'N/A':obj.ResultadoHistorico_LineaBaseOS[0].strMes3.substr(2,2)), dataKey: "mes3"};
		 columnsLineaBaseDCS.push(cadena0LineaBaseDCS);
		 cadena0LineaBaseDCS = {title: nombreMeses[parseInt((obj.ResultadoHistorico_LineaBaseOS[0].strMes4==''?'0':obj.ResultadoHistorico_LineaBaseOS[0].strMes4.substr(5,obj.ResultadoHistorico_LineaBaseOS[0].strMes4.length)))].substr(0,3).toUpperCase()+'-'+(obj.ResultadoHistorico_LineaBaseOS[0].strMes4==''?'N/A':obj.ResultadoHistorico_LineaBaseOS[0].strMes4.substr(2,2)), dataKey: "mes4"};
		 columnsLineaBaseDCS.push(cadena0LineaBaseDCS);
		 cadena0LineaBaseDCS = {title: nombreMeses[parseInt((obj.ResultadoHistorico_LineaBaseOS[0].strMes5==''?'0':obj.ResultadoHistorico_LineaBaseOS[0].strMes5.substr(5,obj.ResultadoHistorico_LineaBaseOS[0].strMes5.length)))].substr(0,3).toUpperCase()+'-'+(obj.ResultadoHistorico_LineaBaseOS[0].strMes5==''?'N/A':obj.ResultadoHistorico_LineaBaseOS[0].strMes5.substr(2,2)), dataKey: "mes5"};
		 columnsLineaBaseDCS.push(cadena0LineaBaseDCS);
		 cadena0LineaBaseDCS = {title: nombreMeses[parseInt((obj.ResultadoHistorico_LineaBaseOS[0].strMes6==''?'0':obj.ResultadoHistorico_LineaBaseOS[0].strMes6.substr(5,obj.ResultadoHistorico_LineaBaseOS[0].strMes6.length)))].substr(0,3).toUpperCase()+'-'+(obj.ResultadoHistorico_LineaBaseOS[0].strMes6==''?'N/A':obj.ResultadoHistorico_LineaBaseOS[0].strMes6.substr(2,2)), dataKey: "mes6"};
		 columnsLineaBaseDCS.push(cadena0LineaBaseDCS);
		 
		 dataDetLineaBaseDCS = [];
		 cadDetdataLineaBaseDCS={};
		 // DETALLE LINEA BASE ONSITE
		 for(i=0; i<obj.ResultadoHistorico_LineaBaseOS.length; i++){
			 	cadDetdataLineaBaseDCS={};
			 	cadDetdataLineaBaseDCS.descripcion = obj.ResultadoHistorico_LineaBaseOS[i].descripcion;
			 	cadDetdataLineaBaseDCS.lineabase = obj.ResultadoHistorico_LineaBaseOS[i].lineabase;
			 	cadDetdataLineaBaseDCS.mes1 = obj.ResultadoHistorico_LineaBaseOS[i].valorMes1;
			 	cadDetdataLineaBaseDCS.mes2 = obj.ResultadoHistorico_LineaBaseOS[i].valorMes2;
				cadDetdataLineaBaseDCS.mes3 = obj.ResultadoHistorico_LineaBaseOS[i].valorMes3;
				cadDetdataLineaBaseDCS.mes4 = obj.ResultadoHistorico_LineaBaseOS[i].valorMes4;
				cadDetdataLineaBaseDCS.mes5 = obj.ResultadoHistorico_LineaBaseOS[i].valorMes5;
				cadDetdataLineaBaseDCS.mes6 = obj.ResultadoHistorico_LineaBaseOS[i].valorMes6;
				dataDetLineaBaseDCS.push(cadDetdataLineaBaseDCS);	
		 }
		 
						 
			 doc.autoTable(columnsLineaBaseDCS, dataDetLineaBaseDCS,
									{startY: 60, 
									styles: {fontSize: 8},
									columnStyles: {descripcion: {cellWidth: 40}},
									});
			
			 doc.setFontType('bold')
		     doc.setFontSize(13);
			 doc.text(70, 115,tildes_unicode('Niveles de Servicio Soporte en Sitio'));
			 
			 var columnsNSDCS = [];

			 var cadena0NSDCS ={};
			 
			 //CABECERA NIVELES DE SERVICIO ONSITE
			 cadena0NSDCS = {title: "DETALLE", dataKey: "detalle", header:"DETALLE"};
			 columnsNSDCS.push(cadena0NSDCS);
			 cadena0NSDCS = {title: "SLA", dataKey: "sla", header:"SLA"};
			 columnsNSDCS.push(cadena0NSDCS);
			 cadena0NSDCS = {title: nombreMeses[parseInt((obj.ResultadoHistorico_NS_OS[0].strMes1==''?'0':obj.ResultadoHistorico_NS_OS[0].strMes1.substr(5,obj.ResultadoHistorico_NS_OS[0].strMes1.length)))].substr(0,3).toUpperCase()+'-'+(obj.ResultadoHistorico_NS_OS[0].strMes1==''?'N/A':obj.ResultadoHistorico_NS_OS[0].strMes1.substr(2,2)), dataKey: "mes1"};
			 columnsNSDCS.push(cadena0NSDCS);
			 cadena0NSDCS = {title: nombreMeses[parseInt((obj.ResultadoHistorico_NS_OS[0].strMes2==''?'0':obj.ResultadoHistorico_NS_OS[0].strMes2.substr(5,obj.ResultadoHistorico_NS_OS[0].strMes2.length)))].substr(0,3).toUpperCase()+'-'+(obj.ResultadoHistorico_NS_OS[0].strMes2==''?'N/A':obj.ResultadoHistorico_NS_OS[0].strMes2.substr(2,2)), dataKey: "mes2"};
			 columnsNSDCS.push(cadena0NSDCS);
			 cadena0NSDCS = {title: nombreMeses[parseInt((obj.ResultadoHistorico_NS_OS[0].strMes3==''?'0':obj.ResultadoHistorico_NS_OS[0].strMes3.substr(5,obj.ResultadoHistorico_NS_OS[0].strMes3.length)))].substr(0,3).toUpperCase()+'-'+(obj.ResultadoHistorico_NS_OS[0].strMes3==''?'N/A':obj.ResultadoHistorico_NS_OS[0].strMes3.substr(2,2)), dataKey: "mes3"};
			 columnsNSDCS.push(cadena0NSDCS);
			 cadena0NSDCS = {title: nombreMeses[parseInt((obj.ResultadoHistorico_NS_OS[0].strMes4==''?'0':obj.ResultadoHistorico_NS_OS[0].strMes4.substr(5,obj.ResultadoHistorico_NS_OS[0].strMes4.length)))].substr(0,3).toUpperCase()+'-'+(obj.ResultadoHistorico_NS_OS[0].strMes4==''?'N/A':obj.ResultadoHistorico_NS_OS[0].strMes4.substr(2,2)), dataKey: "mes4"};
			 columnsNSDCS.push(cadena0NSDCS);
			 cadena0NSDCS = {title: nombreMeses[parseInt((obj.ResultadoHistorico_NS_OS[0].strMes5==''?'0':obj.ResultadoHistorico_NS_OS[0].strMes5.substr(5,obj.ResultadoHistorico_NS_OS[0].strMes5.length)))].substr(0,3).toUpperCase()+'-'+(obj.ResultadoHistorico_NS_OS[0].strMes5==''?'N/A':obj.ResultadoHistorico_NS_OS[0].strMes5.substr(2,2)), dataKey: "mes5"};
			 columnsNSDCS.push(cadena0NSDCS);
			 cadena0NSDCS = {title: nombreMeses[parseInt((obj.ResultadoHistorico_NS_OS[0].strMes6==''?'0':obj.ResultadoHistorico_NS_OS[0].strMes6.substr(5,obj.ResultadoHistorico_NS_OS[0].strMes6.length)))].substr(0,3).toUpperCase()+'-'+(obj.ResultadoHistorico_NS_OS[0].strMes6==''?'N/A':obj.ResultadoHistorico_NS_OS[0].strMes6.substr(2,2)), dataKey: "mes6"};
			 columnsNSDCS.push(cadena0NSDCS);
			 
	 		 doc.setFontType('bold')
	 	     doc.setFontSize(11);
	 		 var flag1 = false;
	 		 var flag2 = false;
	 		 var alturaNSOS = 120;
	 		 dataDetNSDCS = [];
			 cadDetdataNSDCS = {};
	 		 for(i=0; i<obj.ResultadoHistorico_NS_OS.length; i++){
		 		 if(obj.ResultadoHistorico_NS_OS[i].descripcion.toUpperCase().indexOf("RESPUESTA") != -1){
		 		 	if(!flag1){
		 		 	alturaNSOS = alturaNSOS + 8;
		 			doc.text(15, alturaNSOS ,tildes_unicode(obj.ResultadoHistorico_NS_OS[i].descripcion.substr(0,19)));	
		 			flag1 = true;
		 		 	}
		 		 	 cadDetdataNSDCS={};
					 cadDetdataNSDCS.detalle = obj.ResultadoHistorico_NS_OS[i].descripcion;
					 cadDetdataNSDCS.sla = obj.ResultadoHistorico_NS_OS[i].lineabase;
					 cadDetdataNSDCS.mes1 = obj.ResultadoHistorico_NS_OS[i].valorMes1;
					 cadDetdataNSDCS.mes2 = obj.ResultadoHistorico_NS_OS[i].valorMes2;
					 cadDetdataNSDCS.mes3 = obj.ResultadoHistorico_NS_OS[i].valorMes3;
					 cadDetdataNSDCS.mes4 = obj.ResultadoHistorico_NS_OS[i].valorMes4;
					 cadDetdataNSDCS.mes5 = obj.ResultadoHistorico_NS_OS[i].valorMes5;
					 cadDetdataNSDCS.mes6 = obj.ResultadoHistorico_NS_OS[i].valorMes6;
					 dataDetNSDCS.push(cadDetdataNSDCS);
		 		 }
		 		 if(i == obj.ResultadoHistorico_NS_OS.length - 1){
		 			alturaNSOS = alturaNSOS + 2;
			 		doc.autoTable(columnsNSDCS, dataDetNSDCS,
							{startY: alturaNSOS, 
							styles: {fontSize: 8},
							columnStyles: {descripcion: {cellWidth: 40}},
							});	
			 		dataDetNSDCS = [];
					cadDetdataNSDCS = {};
					flag1 = false;
					flag2 = true;
		 		 }
	 		 }
	 		 
	 		for(i=0; i<obj.ResultadoHistorico_NS_OS.length; i++){
		 		 if(obj.ResultadoHistorico_NS_OS[i].descripcion.toUpperCase().indexOf("SOLUCIÓN") != -1 &&
		 				obj.ResultadoHistorico_NS_OS[i].descripcion.toUpperCase().indexOf("IMAC") == -1){
		 		 	if(!flag1){
		 		 		
		 		 	if(flag2){alturaNSOS = alturaNSOS + 40;}else{alturaNSOS = alturaNSOS + 8;}
		 		 	
		 			doc.text(15, alturaNSOS ,tildes_unicode(obj.ResultadoHistorico_NS_OS[i].descripcion.substr(0,19)));	
		 			flag1 = true;
		 		 	}
		 		 	 cadDetdataNSDCS={};
					 cadDetdataNSDCS.detalle = obj.ResultadoHistorico_NS_OS[i].descripcion;
					 cadDetdataNSDCS.sla = obj.ResultadoHistorico_NS_OS[i].lineabase;
					 cadDetdataNSDCS.mes1 = obj.ResultadoHistorico_NS_OS[i].valorMes1;
					 cadDetdataNSDCS.mes2 = obj.ResultadoHistorico_NS_OS[i].valorMes2;
					 cadDetdataNSDCS.mes3 = obj.ResultadoHistorico_NS_OS[i].valorMes3;
					 cadDetdataNSDCS.mes4 = obj.ResultadoHistorico_NS_OS[i].valorMes4;
					 cadDetdataNSDCS.mes5 = obj.ResultadoHistorico_NS_OS[i].valorMes5;
					 cadDetdataNSDCS.mes6 = obj.ResultadoHistorico_NS_OS[i].valorMes6;
					 dataDetNSDCS.push(cadDetdataNSDCS);
		 		 }
		 		 if(i == obj.ResultadoHistorico_NS_OS.length - 1){
		 			alturaNSOS = alturaNSOS + 2;
			 		doc.autoTable(columnsNSDCS, dataDetNSDCS,
							{startY: alturaNSOS, 
							styles: {fontSize: 8},
							columnStyles: {descripcion: {cellWidth: 40}},
							});	
			 		dataDetNSDCS = [];
					cadDetdataNSDCS = {};
					flag1 = false;
		 		 }
	 		 }
	 		for(i=0; i<obj.ResultadoHistorico_NS_OS.length; i++){
		 		 if(obj.ResultadoHistorico_NS_OS[i].descripcion.toUpperCase().indexOf("SOLUCIÓN") != -1 &&
		 				obj.ResultadoHistorico_NS_OS[i].descripcion.toUpperCase().indexOf("IMAC") != -1){
		 		 	if(!flag1){
		 		 		if(flag2){alturaNSOS = alturaNSOS + 40;}else{alturaNSOS = alturaNSOS + 8;}
		 			doc.text(15, alturaNSOS ,tildes_unicode(obj.ResultadoHistorico_NS_OS[i].descripcion.substr(0,21)));	
		 			flag1 = true;
		 		 	}
		 		 	 cadDetdataNSDCS={};
					 cadDetdataNSDCS.detalle = obj.ResultadoHistorico_NS_OS[i].descripcion;
					 cadDetdataNSDCS.sla = obj.ResultadoHistorico_NS_OS[i].lineabase;
					 cadDetdataNSDCS.mes1 = obj.ResultadoHistorico_NS_OS[i].valorMes1;
					 cadDetdataNSDCS.mes2 = obj.ResultadoHistorico_NS_OS[i].valorMes2;
					 cadDetdataNSDCS.mes3 = obj.ResultadoHistorico_NS_OS[i].valorMes3;
					 cadDetdataNSDCS.mes4 = obj.ResultadoHistorico_NS_OS[i].valorMes4;
					 cadDetdataNSDCS.mes5 = obj.ResultadoHistorico_NS_OS[i].valorMes5;
					 cadDetdataNSDCS.mes6 = obj.ResultadoHistorico_NS_OS[i].valorMes6;
					 dataDetNSDCS.push(cadDetdataNSDCS);
		 		 }
		 		 if(i == obj.ResultadoHistorico_NS_OS.length - 1){
		 			alturaNSOS = alturaNSOS + 2;
			 		doc.autoTable(columnsNSDCS, dataDetNSDCS,
							{startY: alturaNSOS, 
							styles: {fontSize: 8},
							columnStyles: {descripcion: {cellWidth: 40}},
							});	 
			 		dataDetNSDCS = [];
					cadDetdataNSDCS = {};
					flag1 = false;
		 		 }
	 		 }

	 		//Nueva Pagina
			nuevaPagina();
	 		//DETALLE TIEMPO RESPUESTA
	 		doc.setFontType('bold')
	     	doc.setFontSize(13);
		 	doc.text(75, 40,tildes_unicode('Detalle del SLA por Prioridad'));
		 	
	 		flag1 = false;
	 		flag2 = false;
	 		alturaNSOS = 40;
			for(i=0; i<obj.ResultadoDetalle_NS_OS.length; i++){
		 		 if(obj.ResultadoDetalle_NS_OS[i].descripcion.toUpperCase().indexOf("RESPUESTA") != -1){
		 		 	if(!flag1){
		 		 	alturaNSOS = alturaNSOS + 10;
		 		 	doc.setFontSize(11);
		 		 	doc.text(15, alturaNSOS ,tildes_unicode(obj.ResultadoDetalle_NS_OS[i].descripcion.substr(0,19)));	
		 			flag1 = true;
		 		 	}else{
		 		 	alturaNSOS = alturaNSOS + 60;	
		 		 	}
		 		 	var fillColor1 = [37, 96, 166];
		 			var fillColor2 = [75, 135, 203];
		 		  tablaDetalleNSOnsite(alturaNSOS,obj.ResultadoDetalle_NS_OS[i],flag2,fillColor1,fillColor2);
		 		  
		 		 }
		 		
	 		 }
	 		
			//Nueva Pagina
			nuevaPagina();
		 	doc.setFontType('bold')
	 		flag1 = false;
	 		flag2 = false;
	 		alturaNSOS = 30;
			for(i=0; i<obj.ResultadoDetalle_NS_OS.length; i++){
		 		 if(obj.ResultadoDetalle_NS_OS[i].descripcion.toUpperCase().indexOf("SOLUCIÓN") != -1&&
			 				obj.ResultadoDetalle_NS_OS[i].descripcion.toUpperCase().indexOf("IMAC") == -1){
		 		 	if(!flag1){
		 		 	alturaNSOS = alturaNSOS + 10;
		 		 	doc.setFontSize(11);
		 		 	doc.text(15, alturaNSOS ,tildes_unicode(obj.ResultadoDetalle_NS_OS[i].descripcion.substr(0,19)));	
		 			flag1 = true;
		 		 	}else{
		 		 	alturaNSOS = alturaNSOS + 60;	
		 		 	}
		 		 	var fillColor1 = [68, 113, 40];
		 			var fillColor2 = [95, 161, 55];
		 		  tablaDetalleNSOnsite(alturaNSOS,obj.ResultadoDetalle_NS_OS[i],flag2,fillColor1,fillColor2);
		 		  
		 		 }
		 		
	 		 }
			
	 		
			
			function toHHMMSS(horas){
				var totalSec = horas*60*60; 
	 			var hours = parseInt( totalSec / 3600 ) % 24; 
	 			var minutes = parseInt( totalSec / 60 ) % 60; 
	 			var seconds = totalSec % 60; 
	 			var result = (hours < 10 ? "0" + hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes) + ":" + (seconds < 10 ? "0" + seconds : seconds);
				return result;
			}
			
	 		function tablaDetalleNSOnsite(alturaNSOS, obj,flag2, fillColor1, fillColor2){
	 			
	 			
	 			var resultadoVip = toHHMMSS(obj.usuarioVip);
	 	
	 			var resultadoAlta = toHHMMSS(obj.prioridadAlta);
	 			
	 			var resultadoMedia = toHHMMSS(obj.prioridadMedia);
	 			
	 			var resultadoBaja = toHHMMSS(obj.prioridadBaja);
	 			
	 			
	 			console.log(obj.descripcion);
		 	    let head = headRows();
		 	    head[0]['id'] = {content: obj.descripcion.substr(0,19) +' PARA ATENCIÓN INCIDENTES (hh:mm:ss)', colSpan: 14, styles: {valign: 'middle',halign: 'center', fillColor: fillColor1,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    head[1]['id'] = {content: 'Indicador', colSpan: 1,rowSpan: 3, styles: {valign: 'middle', halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    head[1]['cantVip'] = {content: 'Usuario Vip', colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    head[1]['cantPA'] = {content: 'Prioridad Alta', colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    head[1]['cantPM'] = {content: 'Prioridad Media', colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	head[1]['cantPB'] = {content: 'Prioridad baja', colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    head[1]['sla'] = {content: 'SLA', colSpan: 1, rowSpan: 3, styles: {valign: 'middle',halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};

		 	    head[2]['cantVip'] = {content: resultadoVip, colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    head[2]['cantPA'] = {content: resultadoAlta, colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    head[2]['cantPM'] = {content: resultadoMedia, colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	head[2]['cantPB'] = {content: resultadoBaja, colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		
		 	  	head[3]['cantVip'] = {content: 'Cant', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2 } };
		 	  	head[3]['enSlaVip'] = {content: 'En SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	head[3]['slaVip'] = {content: 'SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	
		 	    head[3]['cantPA'] = {content: 'Cant', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    head[3]['enSlaPA'] = {content: 'En SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    head[3]['slaPA'] = {content: 'SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    
		 	    head[3]['cantPM'] = {content: 'Cant', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	   	head[3]['enSlaPM'] = {content: 'En SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	head[3]['slaPM'] = {content: 'SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  
		 	  	head[3]['cantPB'] = {content: 'Cant', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	head[3]['enSlaPB'] = {content: 'En SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	head[3]['slaPB'] = {content: 'SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};

		 	  	let body = bodyRows(1);

		 	   function bodyRows(rowCount) {
		 		    let body = [];
		 		    for (var j = 1; j <= rowCount; j++) {
		 		        body.push({
		 		            id: obj.descripcion.substr(19,22),
		 		            cantVip: obj.vip_cant,
		 		            enSlaVip: obj.vip_en_sla,
		 		            slaVip: obj.vip_res_sla+'%',
		 		            cantPA: obj.alta_cant,
		 		            enSlaPA: obj.alta_en_sla,
		 		            slaPA: obj.alta_res_sla+'%',
		 		            cantPM: obj.media_cant,
		 		            enSlaPM: obj.media_en_sla,
		 		            slaPM: obj.media_res_sla+'%',
		 		            cantPB: obj.baja_cant,
		 		            enSlaPB: obj.baja_en_sla,
		 		            slaPB: obj.baja_res_sla+'%',
		 		            sla: obj.lineaBase+'%'
		 		        });
		 		    }
		 		    return body;
		 		}
		 	  function headRows() {
		 		    return [{id: 'ID', cantVip: 'cantVip', enSlaVip: 'enSlaVip', slaVip: 'slaVip', cantPA: 'cantPA'
		 		    				 , enSlaPA: 'enSlaPA', slaPA: 'slaPA', cantPM: 'cantPM', enSlaPM: 'enSlaPM'
		 		    				 , slaPM: 'slaPM', cantPB: 'cantPB', enSlaPB: 'enSlaPB', slaPB: 'slaPB'
		 		    			     , sla: 'sla'
		 		    	},{id: 'ID', cantVip: 'cantVip', enSlaVip: 'enSlaVip', slaVip: 'slaVip', cantPA: 'cantPA'
		    				 , enSlaPA: 'enSlaPA', slaPA: 'slaPA', cantPM: 'cantPM', enSlaPM: 'enSlaPM'
	 		    				 , slaPM: 'slaPM', cantPB: 'cantPB', enSlaPB: 'enSlaPB', slaPB: 'slaPB'
	 		    			     , sla: 'sla'
	 		    		},{id: 'ID', cantVip: 'cantVip', enSlaVip: 'enSlaVip', slaVip: 'slaVip', cantPA: 'cantPA'
		    				 , enSlaPA: 'enSlaPA', slaPA: 'slaPA', cantPM: 'cantPM', enSlaPM: 'enSlaPM'
	 		    				 , slaPM: 'slaPM', cantPB: 'cantPB', enSlaPB: 'enSlaPB', slaPB: 'slaPB'
	 		    			     , sla: 'sla'
	 		    		},{id: 'ID', cantVip: 'cantVip', enSlaVip: 'enSlaVip', slaVip: 'slaVip', cantPA: 'cantPA'
		    				 , enSlaPA: 'enSlaPA', slaPA: 'slaPA', cantPM: 'cantPM', enSlaPM: 'enSlaPM'
	 		    				 , slaPM: 'slaPM', cantPB: 'cantPB', enSlaPB: 'enSlaPB', slaPB: 'slaPB'
	 		    			     , sla: 'sla'
	 		    		}];
		 		}
	
		 	    if(!flag2){
		 	    	alturaNSOS = alturaNSOS + 10;
		 	    }else{
		 	    	alturaNSOS = alturaNSOS + 40;
		 	    }
		 	    console.log(alturaNSOS);
		 	 	doc.autoTable({
		 	        startY: alturaNSOS,
		 	        head: head,
		 	        body: body,
		 	        theme: 'grid',
		 	        bodyStyles: {valign: 'middle',halign: 'center',fontSize: 8},
		 	    });
		 	 	
		 	 	flag2 = true;
	 		}
	 		
	 		//Nueva Pagina
			nuevaPagina();
		 	doc.setFontType('bold')
	 		flag1 = false;
	 		flag2 = false;
	 		alturaNSOS = 30;
			for(i=0; i<obj.ResultadoDetalle_NS_OS.length; i++){
		 		 if(obj.ResultadoDetalle_NS_OS[i].descripcion.toUpperCase().indexOf("SOLUCIÓN") != -1&&
			 				obj.ResultadoDetalle_NS_OS[i].descripcion.toUpperCase().indexOf("IMAC") != -1){
		 		 	if(!flag1){
		 		 	alturaNSOS = alturaNSOS + 10;
		 		 	doc.setFontSize(11);
		 		 	doc.text(15, alturaNSOS ,tildes_unicode(obj.ResultadoDetalle_NS_OS[i].descripcion.substr(0,20)));	
		 			flag1 = true;
		 		 	}else{
		 		 	alturaNSOS = alturaNSOS + 60;	
		 		 	}
		 		 	var fillColor1 = [111, 45, 12];
		 			var fillColor2 = [184, 69, 16];
		 			tablaDetalleNSOnsiteIMAC(alturaNSOS,obj.ResultadoDetalle_NS_OS[i],flag2,fillColor1,fillColor2);
		 		  
		 		 }
		 		
	 		 }
	 		
	 		function tablaDetalleNSOnsiteIMAC(alturaNSOS, obj,flag2, fillColor1, fillColor2){
	 			

	 			var resultadoVip = toHHMMSS(obj.usuarioVip);
	 		 	
	 			var resultadoAlta = toHHMMSS(obj.prioridadAlta);
	 			
	 			var resultadoMedia = toHHMMSS(obj.prioridadMedia);
	 			
	 			var resultadoBaja = toHHMMSS(obj.prioridadBaja);
	 			
	 			
	 			
		 	    let head = headRows();
		 	   if(obj.descripcion.substr(20,22).toUpperCase().indexOf("PROVINCIA") == -1){
		 		  head[0]['id'] = {content: obj.descripcion.substr(0,20) +' PARA ATENCIÓN IMAC (hh:mm:ss)', colSpan: 16, styles: {valign: 'middle',halign: 'center', fillColor: fillColor1,
			 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};   
		 	   }else{
		 		  head[0]['id'] = {content: obj.descripcion.substr(0,20) +' PARA ATENCIÓN IMAC (hh:mm:ss)', colSpan: 14, styles: {valign: 'middle',halign: 'center', fillColor: fillColor1,
			 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};   
		 	   }
		 	    
		 	    head[1]['id'] = {content: 'Indicador', colSpan: 1,rowSpan: 3, styles: {valign: 'middle', halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    head[1]['cantVip'] = {content: 'Usuario Vip', colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    head[1]['cantPA'] = {content: 'Prioridad Alta', colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    head[1]['cantPM'] = {content: 'Prioridad Media', colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	head[1]['cantPB'] = {content: 'Prioridad baja', colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	
		 	  	if(obj.descripcion.substr(20,22).toUpperCase().indexOf("PROVINCIA") == -1){
		 	  	head[1]['cantPT'] = {content: 'Habilitación Puesto Trabajo', colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
			 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};	
		 	  	}else{
		 	    head[1]['sla'] = {content: 'SLA', colSpan: 1, rowSpan: 3, styles: {valign: 'middle',halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	}
		 	  	
		 	    head[2]['cantVip'] = {content: resultadoVip, colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    head[2]['cantPA'] = {content: resultadoAlta, colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    head[2]['cantPM'] = {content: resultadoMedia, colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	head[2]['cantPB'] = {content: resultadoBaja, colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	if(obj.descripcion.substr(20,22).toUpperCase().indexOf("PROVINCIA") == -1){
		 	  	head[2]['cantPT'] = {content: '4 dias', colSpan: 3, styles: {halign: 'center', fillColor: fillColor2,
			 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};	
			 	  	}
		 	  	head[3]['cantVip'] = {content: 'Cant', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2 } };
		 	  	head[3]['enSlaVip'] = {content: 'En SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	head[3]['slaVip'] = {content: 'SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	
		 	    head[3]['cantPA'] = {content: 'Cant', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    head[3]['enSlaPA'] = {content: 'En SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    head[3]['slaPA'] = {content: 'SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	    
		 	    head[3]['cantPM'] = {content: 'Cant', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	   	head[3]['enSlaPM'] = {content: 'En SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	head[3]['slaPM'] = {content: 'SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  
		 	  	head[3]['cantPB'] = {content: 'Cant', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	head[3]['enSlaPB'] = {content: 'En SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	head[3]['slaPB'] = {content: 'SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
		 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
		 	  	
		 	  	if(obj.descripcion.substr(20,22).toUpperCase().indexOf("PROVINCIA") == -1){
		 	  		head[3]['cantPT'] = {content: 'Cant', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
			 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
			 	  	head[3]['enSlaPT'] = {content: 'En SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
			 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};
			 	  	head[3]['slaPT'] = {content: 'SLA', colSpan: 1, styles: {halign: 'center', fillColor: fillColor2,fontSize: 8,
			 	    	lineColor: [219, 219, 219],lineWidth: 0.2}};	
				 }
		 	  	
		 	  	

		 	  	let body = bodyRows(1);

		 	   function bodyRows(rowCount) {
		 		    let body = [];
		 		    for (var j = 1; j <= rowCount; j++) {
		 		    	if(obj.descripcion.substr(20,22).toUpperCase().indexOf("PROVINCIA") == -1){
		 		    		 body.push({
				 		            id: obj.descripcion.substr(20,22),
				 		            cantVip: obj.vip_cant,
				 		            enSlaVip: obj.vip_en_sla,
				 		            slaVip: obj.vip_res_sla+'%',
				 		            cantPA: obj.alta_cant,
				 		            enSlaPA: obj.alta_en_sla,
				 		            slaPA: obj.alta_res_sla+'%',
				 		            cantPM: obj.media_cant,
				 		            enSlaPM: obj.media_en_sla,
				 		            slaPM: obj.media_res_sla+'%',
				 		            cantPB: obj.baja_cant,
				 		            enSlaPB: obj.baja_en_sla,
				 		            slaPB: obj.baja_res_sla+'%',
				 		            cantPT: obj.ptrabajo_cant,
				 		            enSlaPT: obj.ptrabajo_en_sla,
				 		            slaPT: obj.ptrabajo_res_sla+'%',
				 		        });	
		 		    	}else{
		 		    		 body.push({
				 		            id: obj.descripcion.substr(20,22),
				 		            cantVip: obj.vip_cant,
				 		            enSlaVip: obj.vip_en_sla,
				 		            slaVip: obj.vip_res_sla+'%',
				 		            cantPA: obj.alta_cant,
				 		            enSlaPA: obj.alta_en_sla,
				 		            slaPA: obj.alta_res_sla+'%',
				 		            cantPM: obj.media_cant,
				 		            enSlaPM: obj.media_en_sla,
				 		            slaPM: obj.media_res_sla+'%',
				 		            cantPB: obj.baja_cant,
				 		            enSlaPB: obj.baja_en_sla,
				 		            slaPB: obj.baja_res_sla+'%',
				 		            sla: obj.lineaBase+'%'
				 		        });	
		 		    	}
		 		    
		 		       
		 		    }
		 		    return body;
		 		}
		 	  function headRows() {
		 		 if(obj.descripcion.substr(20,22).toUpperCase().indexOf("PROVINCIA") == -1){
		 			 return [{id: 'ID', cantVip: 'cantVip', enSlaVip: 'enSlaVip', slaVip: 'slaVip', cantPA: 'cantPA'
		    				 , enSlaPA: 'enSlaPA', slaPA: 'slaPA', cantPM: 'cantPM', enSlaPM: 'enSlaPM'
		    				 , slaPM: 'slaPM', cantPB: 'cantPB', enSlaPB: 'enSlaPB', slaPB: 'slaPB'
		    			     ,  cantPT: 'cantPT', enSlaPT: 'enSlaPT', slaPT: 'slaPT'
					    	},{id: 'ID', cantVip: 'cantVip', enSlaVip: 'enSlaVip', slaVip: 'slaVip', cantPA: 'cantPA'
							 , enSlaPA: 'enSlaPA', slaPA: 'slaPA', cantPM: 'cantPM', enSlaPM: 'enSlaPM'
				    				 , slaPM: 'slaPM', cantPB: 'cantPB', enSlaPB: 'enSlaPB', slaPB: 'slaPB'
				    				,  cantPT: 'cantPT', enSlaPT: 'enSlaPT', slaPT: 'slaPT'
				    		},{id: 'ID', cantVip: 'cantVip', enSlaVip: 'enSlaVip', slaVip: 'slaVip', cantPA: 'cantPA'
							 , enSlaPA: 'enSlaPA', slaPA: 'slaPA', cantPM: 'cantPM', enSlaPM: 'enSlaPM'
				    				 , slaPM: 'slaPM', cantPB: 'cantPB', enSlaPB: 'enSlaPB', slaPB: 'slaPB'
				    				,  cantPT: 'cantPT', enSlaPT: 'enSlaPT', slaPT: 'slaPT'
				    		},{id: 'ID', cantVip: 'cantVip', enSlaVip: 'enSlaVip', slaVip: 'slaVip', cantPA: 'cantPA'
							 , enSlaPA: 'enSlaPA', slaPA: 'slaPA', cantPM: 'cantPM', enSlaPM: 'enSlaPM'
				    				 , slaPM: 'slaPM', cantPB: 'cantPB', enSlaPB: 'enSlaPB', slaPB: 'slaPB'
				    				,  cantPT: 'cantPT', enSlaPT: 'enSlaPT', slaPT: 'slaPT'
				    		}];	 
		 		 }else{
		 			 return [{id: 'ID', cantVip: 'cantVip', enSlaVip: 'enSlaVip', slaVip: 'slaVip', cantPA: 'cantPA'
		    				 , enSlaPA: 'enSlaPA', slaPA: 'slaPA', cantPM: 'cantPM', enSlaPM: 'enSlaPM'
		    				 , slaPM: 'slaPM', cantPB: 'cantPB', enSlaPB: 'enSlaPB', slaPB: 'slaPB'
		    			     , sla: 'sla'
		    	},{id: 'ID', cantVip: 'cantVip', enSlaVip: 'enSlaVip', slaVip: 'slaVip', cantPA: 'cantPA'
				 , enSlaPA: 'enSlaPA', slaPA: 'slaPA', cantPM: 'cantPM', enSlaPM: 'enSlaPM'
	    				 , slaPM: 'slaPM', cantPB: 'cantPB', enSlaPB: 'enSlaPB', slaPB: 'slaPB'
	    			     , sla: 'sla'
	    		},{id: 'ID', cantVip: 'cantVip', enSlaVip: 'enSlaVip', slaVip: 'slaVip', cantPA: 'cantPA'
				 , enSlaPA: 'enSlaPA', slaPA: 'slaPA', cantPM: 'cantPM', enSlaPM: 'enSlaPM'
	    				 , slaPM: 'slaPM', cantPB: 'cantPB', enSlaPB: 'enSlaPB', slaPB: 'slaPB'
	    			     , sla: 'sla'
	    		},{id: 'ID', cantVip: 'cantVip', enSlaVip: 'enSlaVip', slaVip: 'slaVip', cantPA: 'cantPA'
				 , enSlaPA: 'enSlaPA', slaPA: 'slaPA', cantPM: 'cantPM', enSlaPM: 'enSlaPM'
	    				 , slaPM: 'slaPM', cantPB: 'cantPB', enSlaPB: 'enSlaPB', slaPB: 'slaPB'
	    			     , sla: 'sla'
	    		}];	 
		 		 }
		 	 
		 		}
	
		 	    if(!flag2){
		 	    	alturaNSOS = alturaNSOS + 10;
		 	    }else{
		 	    	alturaNSOS = alturaNSOS + 40;
		 	    }
		 	    console.log(alturaNSOS);
		 	 	doc.autoTable({
		 	        startY: alturaNSOS,
		 	        head: head,
		 	        body: body,
		 	        theme: 'grid',
		 	        bodyStyles: {valign: 'middle',halign: 'center',fontSize: 7},
		 	    });
		 	 	
		 	 	flag2 = true;
	 		}
			


			//Nueva Pagina
			nuevaPagina();
					   
			doc.setFontType('bold')
			doc.setFontSize(16);
			doc.text(68, 35,tildes_unicode('3. RESUMEN DE LLAMADAS'));
						 
			doc.setFontType('bold')
			doc.setFontSize(13);
			doc.text(15, 50,tildes_unicode('3.1 Llamadas por Día de la Central IP'));
			
			doc.setFontType('normal')
		    doc.setFontSize(13);
		    var text1 = "El siguiente gráfico muestra el detalle diario del comportamiento general de las llamadas recibidas por la central IP.";
		   	doc.text(15, 60,tildes_unicode(text1),{maxWidth: 170, align: "justify"});
			
		   	 
			doc.setDrawColor(0)
			doc.rect(15, 85, 180, 100)
			doc.addImage(myChartLlamadaDia, 'PNG', 15, 85, 170, 90);
			

			//DATA tabla Linea Base
			 var head = [];
			 var detHead = [];
			 var body = [];
			 var detbody1 = [];
			 var detbody2 = [];
			 var detbody3 = [];
			 
			 
			 
			 //Columnas cabeceras tabla Linea Base
			 detHead.push("Tipo");
			 
			 //Detalle
			 detbody1.push("Abandonadas Mayores");
			 detbody2.push("Abandonadas Menores");
			 detbody3.push("Contestadas");
			//Columnas cabeceras 
			 for(j=0; j<obj.LlamadasPorDiaMes.length;j++){
			 detHead.push(obj.LlamadasPorDiaMes[j].numero_dia);
			 detbody1.push(obj.LlamadasPorDiaMes[j].Abandonadas_Mayores);
			 detbody2.push(obj.LlamadasPorDiaMes[j].Abandonadas_Menores);
			 detbody3.push(obj.LlamadasPorDiaMes[j].Llamadas_Contestadas);
			 }
			 
			 head.push(detHead);
			 body.push(detbody1);
			 body.push(detbody2);
			 body.push(detbody3);
			 
			
			doc.autoTable({
			    startY: 200,
		        head: head,
		        body: body,
		        headStyles: {valign: 'middle',halign: 'center',fontSize: 6},
		        bodyStyles: {valign: 'middle',halign: 'center',fontSize: 6},
		        columnStyles: {0: {cellWidth: 10}}
		    });
			
			
			//Nueva Pagina
			nuevaPagina();
			doc.setFontType('bold')
			doc.setFontSize(13);
			doc.text(15, 40,tildes_unicode('3.2 Llamadas por Hora de la Central IP'));
			doc.setFontType('normal')
		    doc.setFontSize(13);
			var text1 = "El siguiente gráfico muestra el detalle por hora del comportamiento general de las llamadas recibidas por la central IP. ";
		   	doc.text(15, 50,tildes_unicode(text1),{maxWidth: 175, align: "justify"});
			
		   	doc.setDrawColor(0)
			doc.rect(15, 75, 180, 100)
			doc.addImage(myChartLlamadaHora, 'PNG', 15, 75, 170, 90);  	
		   	
		  //DATA tabla Linea Base
			  head = [];
			  detHead = [];
			  body = [];
			  detbody1 = [];
			  detbody2 = [];
			  detbody3 = [];
			 
			 
			 
			 //Columnas cabeceras tabla Linea Base
			 detHead.push("Tipo");
			 
			 //Detalle
			 detbody1.push("Abandonadas Mayores");
			 detbody2.push("Abandonadas Menores");
			 detbody3.push("Contestadas");
			//Columnas cabeceras 
			 for(j=0; j<obj.LlamadasPorHora.length;j++){
			 detHead.push(obj.LlamadasPorHora[j].numero_hora);
			 detbody1.push(obj.LlamadasPorHora[j].Abandonadas_Mayores);
			 detbody2.push(obj.LlamadasPorHora[j].Abandonadas_Menores);
			 detbody3.push(obj.LlamadasPorHora[j].Llamadas_Contestadas);
			 }
			 
			 head.push(detHead);
			 body.push(detbody1);
			 body.push(detbody2);
			 body.push(detbody3);
			 
			
			doc.autoTable({
			    startY: 200,
		        head: head,
		        body: body,
		        headStyles: {valign: 'middle',halign: 'center',fontSize: 7},
		        bodyStyles: {valign: 'middle',halign: 'center',fontSize: 7},
		        columnStyles: {0: {cellWidth: 11}}
		    });
		  				
			// download the pdf
		  	doc.save('Informe_Mensual.pdf');
					  	
			
			    
	 
		});
	  }
	  
	  
	  
	  
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
	  <aside class="right-side"> 
	 	<section class="content-header">
		<h1><i class="fa fa-tachometer" aria-hidden="true"></i>
		Dashboard SLA<small>Mobility</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-th-large"></i> Dashboard SLA</a></li>
			<li class="active">Mobility</li>
		</ol>
		</section> <!-- Main content --> <section class="content"><!-- top row -->
		
		
		<div class="row">
		<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
			<div class="form-inline">
			<div class="col-sm-6 col-sm-6 col-md-6 col-lg-6">
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
<!-- 				<a id="btnConsultar" class="btn btn-primary btn-md pull-left" ><i class="fa fa-search" aria-hidden="true"></i> Consultar</a> -->
				<button id="btnConsultar" class="btn btn-primary" type="button">
				<i class="fa fa-search" aria-hidden="true"></i>Consultar</button>
				<button id="btnOpcionesAvanzadas" class="btn btn-default" type="button"
						data-toggle="collapse" data-target="#opcionesAvanzadas"
						aria-expanded="false" aria-controls="#opcionesAvanzadas">
						Opciones Avanzadas</button>
				</div>
			</div>
			<div class="col-sm-6 col-sm-6 col-md-6 col-lg-6 text-right">
<!-- 				<div class="form-group"> -->
				<button id = "btnReportetickets" class="btn btn-success btn-md pull-right" type="button" onclick=""><i class="fa fa-table" aria-hidden="true"></i> TICKETS</button>
				<button id = "btnReporteWO" class="btn btn-success btn-md pull-right" type="button" onclick=""><i class="fa fa-table" aria-hidden="true"></i> WORK ORDER</button>
				<button id = "btnReportellamadas" class="btn btn-success btn-md pull-right" type="button" onclick=""><i class="fa fa-table" aria-hidden="true"></i> LLAMADAS</button>
				<button id = "valores" class="btn btn-info btn-md pull-right" type="button" data-toggle="modal" data-target="#mdCorreo"><i class="fa fa-cog" aria-hidden="true"></i> VALORES</button>
<!-- 				</div> -->
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
        
        	<br>
        	<!-- Nav tabs -->
            	<ul class="nav nav-tabs nav-justified" id="myTabJust" role="tablist">
				  <li class="nav-item" id="divtabSDD1">
				    <a class="nav-link "  data-toggle="tab" href="#divContentSDD1" role="tab" aria-controls="sdd"
				      aria-selected="true">Mesa de Ayuda Linea Base</a>
				  </li>
				  <li class="nav-item" id="divtabSDD2">
				    <a class="nav-link"  data-toggle="tab" href="#divContentSDD2" role="tab" aria-controls="sdd"
				      aria-selected="false">Mesa de Ayuda Nivel de Servicio</a>
				  </li>
				  <li class="nav-item" id="divtabDCS1">
				    <a class="nav-link active"  data-toggle="tab" href="#divContentDCS1" role="tab" aria-controls="dcs"
				      aria-selected="false">Soporte en Sitio Linea Base</a>
				  </li>
				  <li class="nav-item" id="divtabDCS2">
				    <a class="nav-link"  data-toggle="tab" href="#divContentDCS2" role="tab" aria-controls="dcs"
				      aria-selected="false">Soporte en Sitio Nivel de Servicio</a>
				  </li>
				  <li class="nav-item" id="divtabInforme">
				    <a class="nav-link"  data-toggle="tab" href="#divContentInforme" role="tab" aria-controls="informe"
				      aria-selected="false">Informe Mensual</a>
				  </li>
				</ul>
			<br>
        	<!-- Tab panes -->
        	<div class="tab-content">
			  <div class="tab-pane" id="divContentSDD1">
			  
			  </div>
			  <div class="tab-pane" id="divContentSDD2">
			  
			  </div>
			  <div class="tab-pane" id="divContentDCS1">
			  
			  </div>
			  <div class="tab-pane" id="divContentDCS2">
			  
			  </div>
			  <div class="tab-pane" id="divContentInforme">
			  	<div class="row text-center" style="height: 50px;">
				  <button id = "btnInforme" class="btn btn-primary btn-md pull-center" type="button" onclick="creapdf()"><i class="fa fa-download" aria-hidden="true"></i> DESCARGAR INFORME MENSUAL</button>
			 	</div>
			  
			  <!-- GRAFICOS bloque1 -->
			  <!-- IZQUIERDA -->
	        	<div class="row">
	        	<section id="divGrafLineaBase" class="col-xs-12 col-sm-12 col-md-6 col-lg-6 connectedSortable">
	        		<div class="box box-primary">
	        		<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i>Histórico Linea Base</h3>
					</div>
	        		<div class="box-body" >							
					<div><canvas id="myChartLineaBase" ></canvas></div>
				</div></div></section>	
					<!-- DERECHA -->
				<section id="divGrafDetalleLineaBase" class="col-xs-12 col-sm-12 col-md-6 col-lg-6 connectedSortable" >
	        		<div class="box box-primary">
	        		<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i>Histórico Detalle Linea Base</h3>
					</div>
	        		<div class="box-body" >							
					<div><canvas id="myChartDetalleLineaBase" ></canvas></div>
					</div></div>
				</section>
				</div>
				
				<!-- GRAFICOS bloque2 -->
			  <!-- IZQUIERDA -->
	        	<div class="row">
	        	<section id="divGrafLlamadaHora" class="col-xs-12 col-sm-12 col-md-6 col-lg-6 connectedSortable">
	        		<div class="box box-primary">
	        		<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i>Llamadas Por Hora</h3>
					</div>
	        		<div class="box-body" >						
					<div><canvas id="myChartLlamadaHora" ></canvas></div>
				</div></div></section>	
					<!-- DERECHA -->
				<section id="divGrafLlamadaDia" class="col-xs-12 col-sm-12 col-md-6 col-lg-6 connectedSortable" >
	        		<div class="box box-primary">
	        		<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i>Llamadas Por Dia</h3>
					</div>
					<div class="box-body" >						
					<div><canvas id="myChartLlamadaDia" ></canvas></div>
					</div></div>
				</section>
				</div>
			  </div>
			</div>
        	
        
        </section>
      </aside>
      
     <aside class="right-side sizeHeight"> 
      </aside>

</body>
</html>
