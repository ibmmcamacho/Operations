<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

<script type="text/javascript">

var f=new Date();
var date = f.getFullYear() + '-' + ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f.getMonth() + 1)) + '-' + ((f.getDate() + 1) < 10 ? '0' + f.getDate() : f.getDate());

document.getElementById("txtInicio").value = date;
document.getElementById("txtFin").value = date;

</script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/Charts/ChartJS/js/Chart.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/js/jquery-ui.min.js"></script>


<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	Reporte <small></small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-dashboard"></i> Reporte TSM</a></li>
	<li class="active">Proyecto</li>
</ol>
</section> <!-- Main content --> 
<section class="content"> <!-- top row -->
<div class="row">
	<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
		<div class="form-inline">
			<div class="form-group">
				<span>Tipo Reporte</span>
				<select id="cboTipoReporte" class="form-control input-sm">
					<option value="0">Seleccionar</option>
					<option value="1">Backup Fallidos</option>
					<option value="2">Backup Exitosos</option>
					<option value="3">General</option>
				</select>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="form-group">
				<span>Fechas</span> 
				<input type="text" class="form-control datePicker" id="txtInicio">
				<input type="text" class="form-control datePicker" id="txtFin">
				
				<select id="cboTipoPresentacion" class="form-control">
					<option value="REPORTE">REPORTE</option>
					<option value="GRAFICO">GRAFICO</option>
				</select>
				
				<a id="btnConsultar" onclick="listReport()" class="btn btn-primary btn-sm disabled">Consultar</a>
			</div>
		</div>
	</div>
</div>
<br />
<div class="row">
	<div class="col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> REPORTE HISTÓRICO</h3>
			</div>
			<div class="box-body">
				<div id="tbcontainer" class="table-responsive">
					Aquí podrás obtener toda la información que necesitas sobre los backups. 
				</div>
				
				<div id="tbcontainer2" class="table-responsive" style="max-height: 600px">
							<div class="form-group" id="dvGrafTSM"></div>
						</div>
				
<!-- 				<div id="tbcontainer2" class="table-responsive" style="position: relative; height:60vh; width:80vw"> -->
<!-- 					<div class="form-group" id="dvGrafTSM"></div> -->
<!-- 				</div> -->
				
			</div>
		</div>
	</div>
</div>
<!-- /.row --> <!-- Main row -->
<div class="row"></div>
<!-- /.row (main row) --> </section><!-- /.content --> </aside>
<!-- /.right-side -->




<script type="text/javascript">

var vTeam = document.getElementById('hdIdTeam').value;

	$(document).ready(function() {


		
		$('#cboTipoReporte').change(function(){
			if($('#cboTipoReporte').val() > 0){
				$('#btnConsultar').removeClass('disabled');
			}
			else{
				$('#btnConsultar').removeClass('disabled');
				$('#btnConsultar').addClass('disabled');
			}
		});
	});
	
	
	function listReport()
		{
		
		$(document).ready(function() {
			var strDateInicio = document.getElementById("txtInicio").value;
			var strDateFin = document.getElementById("txtFin").value;
			var objCbo1 = document.getElementById("cboTipoReporte");
			var objCbo2 = document.getElementById("cboTipoPresentacion");
			var pstrOperation = '';
			var piTeam = vTeam;
			console.log(objCbo2);
			console.log(objCbo2.options[objCbo2.selectedIndex].text);

			var strTipoReporte = '';
			if(objCbo2.options[objCbo2.selectedIndex].text == 'REPORTE'){
				pstrOperation = 'listReports';
				$('#tbcontainer').removeClass('hidden');
				$('#tbcontainer2').removeClass('hidden');
				$('#tbcontainer2').addClass('hidden');
			}
			else{
				pstrOperation = 'listGraficos';
				$('#tbcontainer').removeClass('hidden');
				$('#tbcontainer').addClass('hidden');
				$('#tbcontainer2').removeClass('hidden');
			}
				
			var strTipoReporte = objCbo1.options[objCbo1.selectedIndex].value;
			document.getElementById('dvGrafTSM').innerHTML = '<div id="idmonitorTSM" style="height: 80%; margin: 0 auto"></div>';
			
			var src = "ServletReporteTSM";
			$.post(src, {strFechaInicio : strDateInicio, strFechaFin : strDateFin, strTipo : strTipoReporte, strOperation : pstrOperation},
					function(pdata) {
// 						alert(pdata);	

					if(pstrOperation == 'listReports'){
						 var obj = JSON.parse(pdata);
						  var dataReporte = [];
						  var columnsReport = [];
							  for(i = 0 ; i < obj.reporte.length ; i++ )
							  	{
								var arr = [];
								arr.push(obj.reporte[i].nombretsm);
								arr.push(obj.reporte[i].datescheduled);
								arr.push(obj.reporte[i].timescheduled);
								arr.push(obj.reporte[i].datestart);
								arr.push(obj.reporte[i].timestart);
								arr.push(obj.reporte[i].schedule_name);
								arr.push(obj.reporte[i].node_name);
								arr.push(obj.reporte[i].status);
								arr.push(obj.reporte[i].result);
								arr.push(obj.reporte[i].reason);
								arr.push(obj.reporte[i].datecompleted);
								arr.push(obj.reporte[i].timecompleted);
								dataReporte.push(arr);
								}
							  
							  columnsReport = [ 
							  	{title : "NOMBRE_TSM"},
							    {title : "FECHA PROG."},
							    {title : "HORA PROG."}, 
							    {title : "FECHA EJECUTADO"}, 
					            {title : "HORA EJECUTADO"}, 
					            {title : "NOMBRE SCHEDULE"},
					            {title : "NOMBRE NODO"},
					            {title : "ESTADO"}, 
					            {title : "RESULTADO"},
					            {title : "RAZÓN"},
					            {title : "FECHA COMPLETADO"}, 
					            {title : "HORA COMPLETADO"}
					          ];
						  
						  
						    setData(dataReporte,columnsReport);
					}
					else{
						var obj = JSON.parse(pdata);
						console.log(obj);
						
						Highcharts.chart('idmonitorTSM', {
						    chart: {
						        type: 'line'
						    },
						    title: {
						        text: (strTipoReporte == '1' ? 'Back Fallido' : strTipoReporte == '2' ? 'Backup Completos' : 'Backup General')
						    },
						    subtitle: {
						        text: '	Source: Servers TSM'
						    },
						    legend: {
						        align: 'left',
						        verticalAlign: 'middle',
						        layout: 'vertical'
						    },
						    xAxis: {
						        categories: obj.reporte[0].labels
						    },
						    yAxis: {
						        title: {
						            text: ''
						        }
						    },
						    plotOptions: {
						    	line: {
						            dataLabels: {
						                enabled: true
						            },
						            enableMouseTracking: false
						        }
						    },
						    tooltip: {
						        shared: true,
						        crosshairs: true
						    },
						    series: obj.reporte[0].datasets,
						    responsive: {
						        rules: [{
						            condition: {
						                maxWidth: 500
						            },
						            chartOptions: {
						                legend: {
						                    align: 'center',
						                    verticalAlign: 'bottom',
						                    layout: 'horizontal'
						                }
						            }
						        }]
						    }
						});
						
						
						
// 						optionsLine= {
// 								responsive: true,
// 						        maintainAspectRatio: true,
// 				                legend : {position : 'left'},
// 				                title:{
// 				                    display:true,
// 				                    text:'Backups'
// 				                },
// 				                tooltips: {
// 				                    mode: 'index',
// 				                    intersect: false,
// 				                },
// 				                hover: {
// 				                    mode: 'nearest',
// 				                    intersect: true
// 				                },
// 				                scales: {
// 				                    xAxes: [{
// 				                        display: true,
// 				                        scaleLabel: {
// 				                            display: true
// 				                        }
// 				                    }],
// 				                    yAxes: [{
// 				                    	ticks: {
// 				                            beginAtZero: true
// 				                        },
// 				                        display: true,
// 				                        scaleLabel: {
// 				                            display: true
// 				                        }
// 				                    }]
// 				                }
// 				            };
							
// 				        	var ctx = document.getElementById('idmonitorTSM').getContext('2d');
// 				        	var myBarChart = new Chart(ctx, {
// 				                type: 'line',
// 				                data: obj.reporte[0],
// 				                options: optionsLine
// 				            });
					}


					 
			});
			
		});
		}
	
	
	
	function listReport1()
	{
	
	$(document).ready(function() {
		var strDateInicio = document.getElementById("txtInicio").value;
		var strDateFin = document.getElementById("txtFin").value;
		var objCbo1 = document.getElementById("cboTipoReporte");
		var objCbo2 = document.getElementById("cboTipoPresentacion");
		var pstrOperation = '';
		var piTeam = vTeam;
		console.log(objCbo2);
		console.log(objCbo2.options[objCbo2.selectedIndex].text);

		var strTipoReporte = '';
		if(objCbo2.options[objCbo2.selectedIndex].text == 'REPORTE'){
			pstrOperation = 'listReports';
			$('#tbcontainer').removeClass('hidden');
			$('#tbcontainer2').removeClass('hidden');
			$('#tbcontainer2').addClass('hidden');
		}
		else{
			pstrOperation = 'listGraficos';
			$('#tbcontainer').removeClass('hidden');
			$('#tbcontainer').addClass('hidden');
			$('#tbcontainer2').removeClass('hidden');
		}
			
		var strTipoReporte = objCbo1.options[objCbo1.selectedIndex].value;
		document.getElementById('dvGrafTSM').innerHTML = '<canvas id="idmonitorTSM" width="100%" height="100"></canvas>';
		
		var src = "ServletReporteTSM";
		$.post(src, {strFechaInicio : strDateInicio, strFechaFin : strDateFin, strTipo : strTipoReporte, strOperation : pstrOperation},
				function(pdata) {
//						alert(pdata);	

				if(pstrOperation == 'listReports'){
					 var obj = JSON.parse(pdata);
					  var dataReporte = [];
					  var columnsReport = [];
						  for(i = 0 ; i < obj.reporte.length ; i++ )
						  	{
							var arr = [];
							arr.push(obj.reporte[i].nombretsm);
							arr.push(obj.reporte[i].datescheduled);
							arr.push(obj.reporte[i].timescheduled);
							arr.push(obj.reporte[i].datestart);
							arr.push(obj.reporte[i].timestart);
							arr.push(obj.reporte[i].schedule_name);
							arr.push(obj.reporte[i].node_name);
							arr.push(obj.reporte[i].status);
							arr.push(obj.reporte[i].result);
							arr.push(obj.reporte[i].reason);
							arr.push(obj.reporte[i].datecompleted);
							arr.push(obj.reporte[i].timecompleted);
							dataReporte.push(arr);
							}
						  
						  columnsReport = [ 
						  	{title : "NOMBRE_TSM"},
						    {title : "FECHA PROG."},
						    {title : "HORA PROG."}, 
						    {title : "FECHA EJECUTADO"}, 
				            {title : "HORA EJECUTADO"}, 
				            {title : "NOMBRE SCHEDULE"},
				            {title : "NOMBRE NODO"},
				            {title : "ESTADO"}, 
				            {title : "RESULTADO"},
				            {title : "RAZÓN"},
				            {title : "FECHA COMPLETADO"}, 
				            {title : "HORA COMPLETADO"}
				          ];

						setData(dataReporte,columnsReport);
				}
				else{
					var obj = JSON.parse(pdata);
					console.log(obj);
					
					Highcharts.chart('idmonitorTSM', {
					    chart: {
					        type: 'line'
					    },
					    title: {
					        text: 'Backup Completos'
					    },
					    subtitle: {
					        text: '	Source: Servers TSM'
					    },
					    xAxis: {
					        categories: obj.reporte[0].labels[0]
					    },
					    yAxis: {
					        title: {
					            text: ''
					        }
					    },
					    plotOptions: {
					        line: {
					            dataLabels: {
					                enabled: true
					            },
					            enableMouseTracking: false
					        }
					    },
					    series: obj.reporte[0].series[0]
					});
					
					
					
					
					
					
// 					optionsLine= {
// 							responsive: true,
// 					        maintainAspectRatio: true,
// 			                legend : {position : 'left'},
// 			                title:{
// 			                    display:true,
// 			                    text:'Backups'
// 			                },
// 			                tooltips: {
// 			                    mode: 'index',
// 			                    intersect: false,
// 			                },
// 			                hover: {
// 			                    mode: 'nearest',
// 			                    intersect: true
// 			                },
// 			                scales: {
// 			                    xAxes: [{
// 			                        display: true,
// 			                        scaleLabel: {
// 			                            display: true
// 			                        }
// 			                    }],
// 			                    yAxes: [{
// 			                    	ticks: {
// 			                            beginAtZero: true
// 			                        },
// 			                        display: true,
// 			                        scaleLabel: {
// 			                            display: true
// 			                        }
// 			                    }]
// 			                }
// 			            };
						
// 			        	var ctx = document.getElementById('idmonitorTSM').getContext('2d');
// 			        	var myBarChart = new Chart(ctx, {
// 			                type: 'line',
// 			                data: obj.reporte[0],
// 			                options: optionsLine
// 			            });
				}


				 
		});
		
	});
	}
	
	
	
	var htmlTable = '<table id=\"tblReportes\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
	
	
	
	function setData(pdataReporte,pcolumnsReport)
	{
		$(document).ajaxStart(function() { Pace.restart(); });
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
	    console.log('in if');
	    
		
	    
		var tableReporte = $('#tblReportes').DataTable(
				{
					processing : false,
					serverSide : false,
					data : pdataReporte,
					columns : pcolumnsReport,
					dom: "<'row'<'col-sm-6'B><'col-sm-6 text-right'f>>" +
					"<'row'<'col-sm-12'tr>>" +
					"<'row'<'col-sm-5'i><'col-sm-7 text-right'p>>",
					language : {
						processing : "Procesando...",
						search : '<i class="fa fa-search fa-lg" aria-hidden="true"></i> ',
						searchPlaceholder : "Buscar...",
						lengthMenu: "Mostrar _MENU_ registros por página",
			            zeroRecords: "No se encontraron registros",
			            info: "Ver página _PAGE_ de _PAGES_ página(s)",
			            infoEmpty: "No hay información disponible",
			            infoFiltered: "(filtro de _MAX_ total de registros)",
			            paginate: {
			                first:      "Inicio",
			                last:       "Atras",
			                next:       "Siguiente",
			                previous:   "Atrás"
			            }
					},
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
					destroy : true
				});
		$('.dataTables_filter input').addClass('form-control-search-datatable');
// 		$('.dataTables_filter input').attr('size',10);
	    }
	    else {
	        console.log('in else');
	    // how to change the data contained inside datatable?
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
	}

</script>

</html>