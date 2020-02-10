<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/Charts/ChartJS/js/Chart.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/js/jquery-ui.min.js"></script>
<!--<script src="//cdn.rawgit.com/ashl1/datatables-rowsgroup/v1.0.0/dataTables.rowsGroup.js"></script> -->

<script type="text/javascript">

	var f = new Date();
	var date = f.getFullYear()
			+ '-'
			+ ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f.getMonth() + 1)) + '-'
			+ (f.getDate() < 10 ? '0' + f.getDate() : f.getDate());

	var vTeam = document.getElementById('hdIdTeam').value;
// 	var vCodCliente = document.getElementById('hdCliente').value;
	var vCliente = document.getElementById("hdCliente").value;
	
	document.getElementById("txtInicio").value = date;
	document.getElementById("txtFin").value = date;

	listClientMobility();
//  	listOptions('CLIENTE_ALERTA', vTeam);
// 	listOptions('ORIGEN_MAXIMO', vTeam);

// 	setInterval(function() {
// 		listTendenciaActual(0);
// 	}, 300000);


	$(document).ready(function() {

						var ctxPeriodo = document.getElementById("cvPeriodos");
						
						$('#chkUsuariosVip').change(function(){
							var pstrVip = document.getElementById("chkUsuariosVip").checked ? 'SI': 'NO';
							if(pstrVip == 'SI'){
								console.log('SI!');
								listBackLog('0','1');
							}
							else if(pstrVip == 'NO'){
								console.log('NO!');
								listBackLog('0','0');
							}
								
						});

						$('#btnConsultar').click(function() {
							listCiscoGSP();
							listTiempoSolucion('0');
							listTicketsResueltos('0');
							listBackLog('0','0');
							listTicketsResueltosFechas('0');
							listTicketsResueltosEstados('0');
							listUsuariosTop('0');
							listSedes('0');
							
							vCliente = $('#cboClientes option:selected').text();
							if(vCliente == 'Todos' || vCliente == 'AESA Constructora' || vCliente == 'AESA Minera' || vCliente == 'Aporta' || vCliente == 'Breca' || vCliente == 'BREIN' || vCliente == 'BVO' || vCliente == 'Centria' || vCliente == 'Estratégica' || vCliente == 'EXSA S.A.' || vCliente == 'Protepersa' || vCliente == 'Servicios Rimac' || vCliente == 'Urbanova'){
							listBacklogWO(); 
							listBacklogWOTareasV1("getMaximoTicketsBackLogWOTareas","INPRG","ALL");
							}else{
							document.getElementById("divBacklogWO").style.display = 'none';
							document.getElementById("divBacklogWOTareasV1").style.display = 'none';
							}
							
							
							
							
						});

						$('#btnTicketsTendencia').click(function() {
							$('#mdTicketsReporte').modal('show');
							listReport('listticketsTendenciaActual');
						});

						$('#btnTicketsPaises').click(function() {
							$('#mdTicketsReporte').modal('show');
							listReport('listticketspais');
						});

						$('#btnTicketsClientes').click(function() {
							$('#mdTicketsReporte').modal('show');
							listReport('listticketsclientes');
						});

						$('#btnTicketsDiario').click(function() {
							$('#mdTicketsReporte').modal('show');
							listReport('listticketsFrecuencia');
						});

						// Make the dashboard widgets sortable Using jquery UI
						$('.connectedSortable').sortable({
							placeholder : 'sort-highlight',
							connectWith : '.connectedSortable',
							handle : '.box-header, .nav-tabs',
							forcePlaceholderSize : true,
							zIndex : 999999
						});
						$('.connectedSortable .box-header, .connectedSortable .nav-tabs-custom').css('cursor', 'move');
					});

	function init() {
		
		if(vCliente == 'null' || vCliente == null ||  vCliente == ''){
			$('#cboClientes').prop("disabled", false);
			$('#btnOpcionesAvanzadas').prop("disabled", false);
		}
		else{
			$('#cboClientes').prop("disabled", true);
			$('#btnOpcionesAvanzadas').prop("disabled", true);
		}
	}
	
	
function listOptions(tipo, team) {
		$(document).ready(function() {

			var src = "ServletWOptions";
			$.post(src, {
				strOperation : "listOptions",
				strType : tipo,
				iTeam : team
			}, function(pdata) {
				var obj = JSON.parse(pdata);

				if (obj.reporte.length > 0) {

					if (tipo == "CLIENTE_ALERTA") {
						$('#cboClientes option').remove();
						$('#cboClientes').append($('<option>', {
							value : '0',
							text : 'Todos'
						}));

						$.each(obj.reporte, function(i, item) {
							$('#cboClientes').append($('<option>', {
								value : item.valor1,
								text : item.descripcion
							}));
						});
						$('#cboClientes').select2({
							width : '100%'
						});
						
						if(vCliente != null || vCliente != '' || vCliente != 'null'){
							$('#cboClientes').val(vCliente).trigger("change");
						}

						//init();

// 						listTiempoSolucion('0');
// 						listTicketsResueltos('0');
// 						listUsuariosTop('0');
// 						listBackLog('0');
// 						listSedes('0');

					}
				}
			});
		});
	}
	
function listClientMobility() {
	$(document).ready(function() {
		
		if(vCliente == 'PE-CTRA-ITS'){
			$('#cboClientes option').remove();
			$('#cboClientes').append($('<option>', { value : 'ALL', text : 'Todos' }));
			$('#cboClientes').append($('<option>', { value : 'PE-AECO-ITS', text : 'AESA Constructora' }));
			$('#cboClientes').append($('<option>', { value : 'PE-AEM-ITS', text : 'AESA Minera' }));
			$('#cboClientes').append($('<option>', { value : 'PE-APOR-ITS', text : 'Aporta' }));
			$('#cboClientes').append($('<option>', { value : 'PE-BREC-ITS', text : 'Breca' }));
			$('#cboClientes').append($('<option>', { value : 'PE-BREIN-ITS', text : 'BREIN' }));
			$('#cboClientes').append($('<option>', { value : 'PE-BVO-ITS', text : 'BVO' }));
			$('#cboClientes').append($('<option>', { value : 'PE-CTRA-ITS', text : 'Centria' }));
			$('#cboClientes').append($('<option>', { value : 'PE-ESTR-ITS', text : 'Estratégica' }));
			$('#cboClientes').append($('<option>', { value : 'PE-EXSA-ITS', text : 'EXSA S.A.' }));
			$('#cboClientes').append($('<option>', { value : 'PE-PROT-ITS', text : 'Protepersa' }));
			$('#cboClientes').append($('<option>', { value : 'PE-SRIM-ITS', text : 'Servicios Rimac' }));
			$('#cboClientes').append($('<option>', { value : 'PE-URBA-ITS', text : 'Urbanova' }));
			
		}
		else{
		var src = "ServletMaximoMobility";
		$.post(src, {
			strOperation : "getClientMobility",
			strClient : vCliente
		}, function(pdata) {
			var obj = JSON.parse(pdata);

			if (obj.clientMobility.length > 0) {
					$('#cboClientes option').remove();
					
					if(vCliente != null || vCliente != '' || vCliente != 'null'){
						$('#cboClientes').append($('<option>', {
							value : 'ALL',
							text : 'Todos'
						}));
					}

					$.each(obj.clientMobility, function(i, item) {
						$('#cboClientes').append($('<option>', {
							value : item.idClient,
							text : item.client
						}));
					});
					$('#cboClientes').select2({
						width : '100%'
					});
					
					if(vCliente != null || vCliente != '' || vCliente != 'null'){
						$('#cboClientes').val(vCliente).trigger("change");
					}

					//init();
				}
			
		});
		}
	});
}


function listBacklogWOTareasV1(pStrOp,pStrEstado,pStrDescripcionWOPrincipal){
		document.getElementById("divBacklogWOTareasV1").style.display = 'block';
		
		var vcboClientes = $('#cboClientes').val();
		if(vcboClientes != 'ALL'){
		vcboClientes = $('#cboClientes option:selected').text(); 
		}
		
		$(document).ready(
						function() {

							

							$('#dvLoadTicketsReporteV1').removeClass('overlay');
							$('#dvLoadTicketsReporteV1').addClass('overlay');
							document.getElementById('dvLoadTicketsReporteV1').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
							
							var src = 'ServletMaximoMobility';
							$
									.post(
											src,
											{
												strOperation : pStrOp,
												strCliente : vcboClientes,
												strEstado : pStrEstado,
												strDescripcionWOPrincipal : pStrDescripcionWOPrincipal
											},
											function(pdata) {
												var obj = JSON.parse(pdata);
												var dataReporte = [];

												for (i = 0; i < obj.ticketsReporte.length; i++) {
													var arr = [];
													arr.push(obj.ticketsReporte[i].ticketWODescripcionWOPrincipal);
													arr.push(obj.ticketsReporte[i].ticketWOFechaReportada);
													arr.push(obj.ticketsReporte[i].ticketWODescripcionWORelacionada);
													arr.push(obj.ticketsReporte[i].ticketWOFechaInicio);
													arr.push(obj.ticketsReporte[i].ticketWONombreGResolutor);
													arr.push(obj.ticketsReporte[i].ticketWOPropietario);
													arr.push(obj.ticketsReporte[i].ticketWODiasBacklog);
													dataReporte.push(arr);
												}

												columnsReport = [ {
													title : "DESCRIPCION WO PRINCIPAL"}, {
													title : "FECHA REPORTADA"}, {
													title : "DESCRIPCION DE LA ACTIVIDAD"}, {
													title : "FECHA DE INICIO"}, {
													title : "NOMBRE  GRUPO RESOLUTOR"}, {
													title : "PROPIETARIO"}, {
													title : "DIAS EN BACKLOG"
												} ];
												document.getElementById('dvLoadTicketsReporteV1').innerHTML = '';
												$('#dvLoadTicketsReporteV1').removeClass('overlay');
												setDataWOV1(dataReporte,columnsReport);
												
											});

						});

}



function listBacklogWO(){
	document.getElementById("divBacklogWO").style.display = 'block';
	$('#dvLoadBackLogWO').removeClass('overlay');
	$('#dvLoadBackLogWO').addClass('overlay');
	document.getElementById('dvBackLogWO').innerHTML = '<canvas id="idBackLogWO" width="100%" height="100"></canvas>';
	document.getElementById('dvLoadBackLogWO').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
	var vcboClientes = $('#cboClientes').val();
	var src = 'ServletMaximoMobility';
	
	if(vcboClientes != 'ALL'){
	vcboClientes = $('#cboClientes option:selected').text(); 
	}	
	
	$.post(src,{
						strOperation : 'getBackLogWO',
						strCliente : vcboClientes
					},
					function(pdata) {
						var obj = JSON.parse(pdata);
						
						var options = {
								tooltips : {
				            		enabled : true,
				                	intersect : false
				            	},
				            	responsive: true,
				            	legend: {
				                	position: 'bottom',
				            	},
				            	title: {
				                	display: true,
				                	text: 'BackLog WorkOrder'
				            	},
				            	animation: {
				                	animateScale: true,
				                	animateRotate: true
				            	}
				        	};
				         var ctxBacklog = document.getElementById('idBackLogWO').getContext('2d');
				         var chartBacklog = new Chart(ctxBacklog, {
							    type: 'doughnut',
							    data: obj.backlogWO[0],
							    options: options
							});
							
						var strTable = '';
						strTable = strTable + '<table id=\'tblBackLogWO\' class=\'table table-striped table-bordered table-condensed text-center\'><thead><tr><th>GRUPO PROPIETARIO</th><th>< 2 DIAS</th><th>ENTRE 2 A 3 DIAS</th><th>ENTRE 4 A 5 DIAS</th><th>ENTRE 6 A 7 DIAS </th><th>ENTRE 8 A 12 DIAS </th><th>ENTRE 13 A 30 DIAS</th><th>ENTRE 1 A 3 MESES</th><th>ENTRE 4 A 6 MESES</th><th>ENTRE 7 A 12 MESES</th><th>> 1 AÑO</th></tr></thead><tbody>';
						
						if((obj.tblBacklogWO.length > 0) && (obj.tblBacklogWO[0].ticketGrupoPropietario != 0)){
						for(i = 0 ; i < obj.tblBacklogWO.length ; i++){
							strTable = strTable + '<tr>' + '<td style="text-align: left;"> <a href="#" onclick="listReportWO(\'getMaximoTicketsBackLogWO\', \'INPRG\',\'' + obj.tblBacklogWO[i].ticketGrupoPropietario + '\')"  >' + obj.tblBacklogWO[i].ticketGrupoPropietario + '</a></td>' + '<td>' + (obj.tblBacklogWO[i].strValor1 > 0 ? '<label class=\'label label-info\'>':'') +obj.tblBacklogWO[i].strValor1 +(obj.tblBacklogWO[i].strValor1 > 0 ? '</label>':'') + '</td>' + '<td>' + (obj.tblBacklogWO[i].strValor2 > 0 ? '<label class=\'label label-info\'>':'') + obj.tblBacklogWO[i].strValor2 + (obj.tblBacklogWO[i].strValor2 > 0 ? '</label>':'')+'</td>' + '<td>' + (obj.tblBacklogWO[i].strValor3 > 0 ? '<label class=\'label label-info\'>':'') +obj.tblBacklogWO[i].strValor3 +(obj.tblBacklogWO[i].strValor3 > 0 ? '</label>':'')+'</td>' + '<td>' + (obj.tblBacklogWO[i].strValor4 > 0 ? '<label class=\'label label-warning\'>':'') +obj.tblBacklogWO[i].strValor4 +(obj.tblBacklogWO[i].strValor4 > 0 ? '</label>':'')+'</td>' + '<td>' + (obj.tblBacklogWO[i].strValor5 > 0 ? '<label class=\'label label-warning\'>':'') +obj.tblBacklogWO[i].strValor5 +(obj.tblBacklogWO[i].strValor5 > 0 ? '</label>':'')+ '</td>' + '<td>' + (obj.tblBacklogWO[i].strValor6 > 0 ? '<label class=\'label label-warning\'>':'') +obj.tblBacklogWO[i].strValor6 +(obj.tblBacklogWO[i].strValor6 > 0 ? '</label>':'')+'</td>' + '<td>' + (obj.tblBacklogWO[i].strValor7 > 0 ? '<label class=\'label label-danger\'>':'') +obj.tblBacklogWO[i].strValor7 +(obj.tblBacklogWO[i].strValor7 > 0 ? '</label>':'')+'</td>'+ '<td>' + (obj.tblBacklogWO[i].strValor8 > 0 ? '<label class=\'label label-danger\'>':'') +obj.tblBacklogWO[i].strValor8 +(obj.tblBacklogWO[i].strValor8 > 0 ? '</label>':'')+'</td>' +  '<td>' + (obj.tblBacklogWO[i].strValor9 > 0 ? '<label class=\'label label-danger\'>':'') +obj.tblBacklogWO[i].strValor9 +(obj.tblBacklogWO[i].strValor9 > 0 ? '</label>':'')+'</td>' +  '<td>' + (obj.tblBacklogWO[i].strValor10 > 0 ? '<label class=\'label label-danger\'>':'') +obj.tblBacklogWO[i].strValor10 +(obj.tblBacklogWO[i].strValor10 > 0 ? '</label>':'')+'</td>' + '</tr>';
						}
						}
						$('#dvLoadBackLogWO').removeClass('overlay');
						strTable = strTable + '</tbody></table>';
						document.getElementById('dvBackLogWOTable').innerHTML = strTable;
						document.getElementById('dvLoadBackLogWO').innerHTML = '';
						
						
						
						 
						
					});

}



function listBackLog(tipo,onVip){

	var vtxtInicio = $('#txtInicio').val();
	var vtxtFin = $('#txtFin').val();
	var vcboClientes = $('#cboClientes').val();
	$('#hdVip').val(onVip);
	
	$('#dvLoadBackLog').removeClass('overlay');
	$('#dvLoadBackLog').addClass('overlay');
	document.getElementById('dvBackLog').innerHTML = '<canvas id="idBackLog" width="100%" height="100"></canvas>';
	document.getElementById('dvLoadBackLog').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';

	var src = 'ServletMaximoMobility';
	$.post(src,{
						strOperation : 'getBackLog',
						ptxtInicio : vtxtInicio,
						ptxtFin : vtxtFin,
						pcboClientes : vcboClientes,
						strClient : vCliente,
						ptipo : tipo,
						pOnVip : onVip
					},
					function(pdata) {
						var obj = JSON.parse(pdata);
						
						var options = {
								tooltips : {
				            		enabled : true,
				                	intersect : false
				            	},
				            	responsive: true,
				            	legend: {
				                	position: 'bottom',
				            	},
				            	title: {
				                	display: true,
				                	text: 'BackLog ACtual'
				            	},
				            	animation: {
				                	animateScale: true,
				                	animateRotate: true
				            	}
				        	};
				        	
				        	var ctxBacklog = document.getElementById('idBackLog').getContext('2d');
				        	var chartBacklog = new Chart(ctxBacklog, {
							    type: 'doughnut',
							    data: obj.backlog[0],
							    options: options
							});
				    	
				    	
				    	$("#idBackLog").click( 
						    function(evt){
						        var objChart = chartBacklog.getElementsAtEvent(evt);
						        var grupoResolutor = objChart[0]._model.label;
						        listBackLogDetalle(grupoResolutor);
						        console.log(grupoResolutor);
						    }
						);
				    	
				    	var strTable = '';
						strTable = strTable + '<table id=\'tblBackLog\' class=\'table table-striped table-bordered table-condensed text-center\'><thead><tr><th>CLASE</th><th>GRUPO RESOLUTOR</th><th>PERSONA AFECTADA</th><th> < 5 DIAS </th><th> ENTRE 5 A 10 DIAS </th><th> ENTRE 11 A 15 DIAS </th><th> > 15 DIAS </th></tr></thead><tbody>';
						for(i = 0 ; i < obj.backlogTbl.length ; i++){
							for(j = 0 ; j < obj.backlogTbl[i].class.length ; j++){
								if(j == 0)
									strTable = strTable + '<tr><td rowspan=\'' + obj.backlogTbl[i].class.length + '\'>' + obj.backlogTbl[i].class[j].strClass + '</td><td style="text-align: left;"><a href="#"  onclick="listReport(\'getMaximoTicketsBackLog\',\'' + obj.backlogTbl[i].class[j].strGrupo + '\')">' + obj.backlogTbl[i].class[j].strGrupo + '</a></td><td>' + obj.backlogTbl[i].class[j].strEmail + '</td><td>' + (obj.backlogTbl[i].class[j].strValor1 > 0 ? '<label class=\'label label-info\'>' : '') + obj.backlogTbl[i].class[j].strValor1 + (obj.backlogTbl[i].class[j].strValor1 > 0 ? '</label>' : '') + '</td><td>' + (obj.backlogTbl[i].class[j].strValor2 > 0 ? '<label class=\'label label-primary\'>' : '') + obj.backlogTbl[i].class[j].strValor2 + (obj.backlogTbl[i].class[j].strValor1 > 0 ? '</label>' : '') + '</td><td>' + (obj.backlogTbl[i].class[j].strValor3 > 0 ? '<label class=\'label label-warning\'>' : '') + obj.backlogTbl[i].class[j].strValor3 + (obj.backlogTbl[i].class[j].strValor3 > 0 ? '</label>' : '') + '</td><td>' + (obj.backlogTbl[i].class[j].strValor4 > 0 ? '<label class=\'label label-danger\'>' : '') + obj.backlogTbl[i].class[j].strValor4 + (obj.backlogTbl[i].class[j].strValor4 > 0 ? '</label>' : '') + '</td></tr>';
								else
									strTable = strTable + '<tr>' + (obj.backlogTbl[i].class.length > 1 ? '' : '<td>' + obj.backlogTbl[i].class[j].strClass + '</td>') + '<td style="text-align: left;"><a href="#"  onclick="listReport(\'getMaximoTicketsBackLog\',\'' + obj.backlogTbl[i].class[j].strGrupo + '\')">' + obj.backlogTbl[i].class[j].strGrupo + '</a></td><td>' + obj.backlogTbl[i].class[j].strEmail + '</td><td>' + (obj.backlogTbl[i].class[j].strValor1 > 0 ? '<label class=\'label label-info\'>' : '') + obj.backlogTbl[i].class[j].strValor1 + (obj.backlogTbl[i].class[j].strValor1 > 0 ? '</label>' : '') + '</td><td>' + (obj.backlogTbl[i].class[j].strValor2 > 0 ? '<label class=\'label label-primary\'>' : '') + obj.backlogTbl[i].class[j].strValor2 + (obj.backlogTbl[i].class[j].strValor1 > 0 ? '</label>' : '') + '</td><td>' + (obj.backlogTbl[i].class[j].strValor3 > 0 ? '<label class=\'label label-warning\'>' : '') + obj.backlogTbl[i].class[j].strValor3 + (obj.backlogTbl[i].class[j].strValor3 > 0 ? '</label>' : '') + '</td><td>' + (obj.backlogTbl[i].class[j].strValor4 > 0 ? '<label class=\'label label-danger\'>' : '') + obj.backlogTbl[i].class[j].strValor4 + (obj.backlogTbl[i].class[j].strValor4 > 0 ? '</label>' : '') + '</td></tr>';
							}
						}
						strTable = strTable + '</tbody></table>';
						document.getElementById('dvBackLogTable').innerHTML = strTable;
				        
						document.getElementById('dvLoadBackLog').innerHTML = '';
						$('#dvLoadBackLog').removeClass('overlay');

					});
}



function listBackLogDetalle(tipo){

	var vtxtInicio = $('#txtInicio').val();
	var vtxtFin = $('#txtFin').val();
	var vcboClientes = $('#cboClientes').val();
	var onVip = $('#hdVip').val();
	
	$('#dvLoadBackLog').removeClass('overlay');
	$('#dvLoadBackLog').addClass('overlay');
	document.getElementById('dvLoadBackLog').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
	
	var src = 'ServletMaximoMobility';
	$.post(src,{
						strOperation : 'getBackLogDetalle',
						ptxtInicio : vtxtInicio,
						ptxtFin : vtxtFin,
						pcboClientes : vcboClientes,
						ptipo : tipo,
						pOnVip : onVip
					},
					function(pdata) {
						var obj = JSON.parse(pdata);
						
				    	var strTable = '';
						strTable = strTable + '<table id=\'tblBackLog\' class=\'table table-striped table-bordered table-condensed text-center\'><thead><tr><th>CLASE</th><th>GRUPO RESOLUTOR</th><th>PERSONA AFECTADA</th><th> < 5 DIAS </th><th> ENTRE 5 A 10 DIAS </th><th> ENTRE 11 A 15 DIAS </th><th> > 15 DIAS </th></tr></thead><tbody>';
						for(i = 0 ; i < obj.backlogTbl.length ; i++){
							for(j = 0 ; j < obj.backlogTbl[i].class.length ; j++){
								if(j == 0)
									strTable = strTable + '<tr><td rowspan=\'' + obj.backlogTbl[i].class.length + '\'>' + obj.backlogTbl[i].class[j].strClass + '</td><td style="text-align: left;"><a href="#"  onclick="listReport(\'getMaximoTicketsBackLog\',\'' + obj.backlogTbl[i].class[j].strGrupo + '\')">' + obj.backlogTbl[i].class[j].strGrupo + '</a></td><td>' + obj.backlogTbl[i].class[j].strEmail + '</td><td>' + (obj.backlogTbl[i].class[j].strValor1 > 0 ? '<label class=\'label label-info\'>' : '') + obj.backlogTbl[i].class[j].strValor1 + (obj.backlogTbl[i].class[j].strValor1 > 0 ? '</label>' : '') + '</td><td>' + (obj.backlogTbl[i].class[j].strValor2 > 0 ? '<label class=\'label label-primary\'>' : '') + obj.backlogTbl[i].class[j].strValor2 + (obj.backlogTbl[i].class[j].strValor1 > 0 ? '</label>' : '') + '</td><td>' + (obj.backlogTbl[i].class[j].strValor3 > 0 ? '<label class=\'label label-warning\'>' : '') + obj.backlogTbl[i].class[j].strValor3 + (obj.backlogTbl[i].class[j].strValor3 > 0 ? '</label>' : '') + '</td><td>' + (obj.backlogTbl[i].class[j].strValor4 > 0 ? '<label class=\'label label-danger\'>' : '') + obj.backlogTbl[i].class[j].strValor4 + (obj.backlogTbl[i].class[j].strValor4 > 0 ? '</label>' : '') + '</td></tr>';
								else
									strTable = strTable + '<tr>' + (obj.backlogTbl[i].class.length > 1 ? '' : '<td>' + obj.backlogTbl[i].class[j].strClass + '</td>') + '<td style="text-align: left;"><a href="#"  onclick="listReport(\'getMaximoTicketsBackLog\',\'' + obj.backlogTbl[i].class[j].strGrupo + '\')">' + obj.backlogTbl[i].class[j].strGrupo + '</a></td><td>' + obj.backlogTbl[i].class[j].strEmail + '</td><td>' + (obj.backlogTbl[i].class[j].strValor1 > 0 ? '<label class=\'label label-info\'>' : '') + obj.backlogTbl[i].class[j].strValor1 + (obj.backlogTbl[i].class[j].strValor1 > 0 ? '</label>' : '') + '</td><td>' + (obj.backlogTbl[i].class[j].strValor2 > 0 ? '<label class=\'label label-primary\'>' : '') + obj.backlogTbl[i].class[j].strValor2 + (obj.backlogTbl[i].class[j].strValor1 > 0 ? '</label>' : '') + '</td><td>' + (obj.backlogTbl[i].class[j].strValor3 > 0 ? '<label class=\'label label-warning\'>' : '') + obj.backlogTbl[i].class[j].strValor3 + (obj.backlogTbl[i].class[j].strValor3 > 0 ? '</label' : '') + '</td><td>' + (obj.backlogTbl[i].class[j].strValor4 > 0 ? '<label class=\'label label-danger\'>' : '') + obj.backlogTbl[i].class[j].strValor4 + (obj.backlogTbl[i].class[j].strValor4 > 0 ? '</label>' : '') + '</td></tr>';
							}
						}
						
// 						strTable = strTable + '<table id=\'tblBackLog\' class=\'table table-striped table-bordered table-condensed text-center\'><thead><tr><th>CLASE</th><th>GRUPO RESOLUTOR</th><th> < 5 DIAS </th><th> ENTRE 5 A 10 DIAS </th><th> ENTRE 11 A 15 DIAS </th><th> > 15 DIAS </th></tr></thead><tbody>';
// 						for(i = 0 ; i < obj.backlogTbl.length ; i++){
// 							for(j = 0 ; j < obj.backlogTbl[i].class.length ; j++){
// 								if(j == 0)
// 									strTable = strTable + '<tr><td rowspan=\'' + obj.backlogTbl[i].class.length + '\'>' + obj.backlogTbl[i].class[j].strClass + '</td><td style="text-align: left;"><a href="#"  onclick="listReport(\'getMaximoTicketsBackLog\',\'' + obj.backlogTbl[i].class[j].strGrupo + '\')">' + obj.backlogTbl[i].class[j].strGrupo + '</td><td>' + obj.backlogTbl[i].class[j].strValor1 + '</td><td>' + obj.backlogTbl[i].class[j].strValor2 + '</td><td>' + obj.backlogTbl[i].class[j].strValor3 + '</td><td>' + obj.backlogTbl[i].class[j].strValor4 + '</td></tr>';
// 								else
// 									strTable = strTable + '<tr>' + (obj.backlogTbl[i].class.length > 1 ? '' : '<td>' + obj.backlogTbl[i].class[j].strClass + '</td>') + '<td style="text-align: left;"><a href="#"  onclick="listReport(\'getMaximoTicketsBackLog\',\'' + obj.backlogTbl[i].class[j].strGrupo + '\')">' + obj.backlogTbl[i].class[j].strGrupo + '</td><td>' + obj.backlogTbl[i].class[j].strValor1 + '</td><td>' + obj.backlogTbl[i].class[j].strValor2 + '</td><td>' + obj.backlogTbl[i].class[j].strValor3 + '</td><td>' + obj.backlogTbl[i].class[j].strValor4 + '</td></tr>';
// 							}
// 						}
						strTable = strTable + '</tbody></table>';
						document.getElementById('dvBackLogTable').innerHTML = strTable;
				        
						document.getElementById('dvLoadBackLog').innerHTML = '';
						$('#dvLoadBackLog').removeClass('overlay');

					});
}

function listTicketsResueltos(tipo){
	var vtxtInicio = $('#txtInicio').val();
	var vtxtFin = $('#txtFin').val();
	var vcboClientes = $('#cboClientes').val();
	
	$('#dvLoadTicketsResueltos').removeClass('overlay');
	$('#dvLoadTicketsResueltos').addClass('overlay');
	document.getElementById('dvTicketsResueltos').innerHTML = '<canvas id="idTicketsResueltos" width="100%" height="100"></canvas>';
	document.getElementById('dvLoadTicketsResueltos').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
	
	var src = 'ServletMaximoMobility';
	$.post(src,{
						strOperation : 'getTicketsResueltos',
						ptxtInicio : vtxtInicio,
						ptxtFin : vtxtFin,
						pcboClientes : vcboClientes,
						strClient : vCliente,
						ptipo : tipo
					},
					function(pdata) {
						var obj = JSON.parse(pdata);
						
						optionsBar = {
			                    title:{
			                        display:true,
			                        text:"Tickets Resueltos"
			                    },
			                    tooltips: {
			                        mode: 'index',
			                        intersect: false
			                    },
			                    responsive: true,
			                    scales: {
			                        xAxes: [{
			                            stacked: true,
			                            display : false
			                        }],
			                        yAxes: [{
			                            stacked: true
			                        }]
			                    }
			                };
				        	var ctxTicketResultado = document.getElementById('idTicketsResueltos').getContext('2d');
				        	var myBarChart = new Chart(ctxTicketResultado, {
					            type: 'bar',
					            data: obj.ticketsResueltos[0],
					            options: optionsBar
					        });
				        
				        $("#idTicketsResueltos").click( 
						    function(evt){
						        var objChart = myBarChart.getElementsAtEvent(evt);
						        var grupoResolutor = objChart[0]._model.label;
						        document.getElementById('hdTicketResueltosGrupoSeleccion').value = grupoResolutor;
						        listTicketsResueltosFechas(grupoResolutor);
								listTicketsResueltosEstados(grupoResolutor);
								listUsuariosTop(grupoResolutor);
								listSedes(grupoResolutor);
// 						        console.log(grupoResolutor);
						    }
						);
				        	
				        	
						document.getElementById('dvLoadTicketsResueltos').innerHTML = '';
						$('#dvLoadTicketsResueltos').removeClass('overlay');
					});
}


function listTicketsResueltosFechas(tipo){
	var vtxtInicio = $('#txtInicio').val();
	var vtxtFin = $('#txtFin').val();
	var vcboClientes = $('#cboClientes').val();
	
	$('#dvLoadTicketsFechas').removeClass('overlay');
	$('#dvLoadTicketsFechas').addClass('overlay');
	document.getElementById('dvTicketsFechas').innerHTML = '<canvas id="idTicketsFechas" width="100%" height="100"></canvas>';
	document.getElementById('dvLoadTicketsFechas').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';

	var src = 'ServletMaximoMobility';
	$.post(src,{
						strOperation : 'getTicketsResueltosFechas',
						ptxtInicio : vtxtInicio,
						ptxtFin : vtxtFin,
						pcboClientes : vcboClientes,
						strClient : vCliente,
						ptipo : tipo
					},
					function(pdata) {
						var obj = JSON.parse(pdata);
						console.log(obj);
						optionsLine= {
				                responsive: true,
				                title:{
				                    display:true,
				                    text:'Tickets por fechas'
				                },
				                tooltips: {
				                    mode: 'index',
				                    intersect: false,
				                },
				                hover: {
				                    mode: 'nearest',
				                    intersect: true
				                },
				                scales: {
				                    xAxes: [{
				                        display: true,
				                        scaleLabel: {
				                            display: true
				                        }
				                    }],
				                    yAxes: [{
				                        display: true,
				                        scaleLabel: {
				                            display: true
				                        }
				                    }]
				                }
				            };
				        	var ctx = document.getElementById('idTicketsFechas').getContext('2d');
				        	var myBarChart = new Chart(ctx, {
				                type: 'line',
				                data: obj.ticketFechas[0],
				                options: optionsLine
				            });
				        	
						document.getElementById('dvLoadTicketsFechas').innerHTML = '';
						$('#dvLoadTicketsFechas').removeClass('overlay');
					});
}


function listTicketsResueltosEstados(tipo){
	var vtxtInicio = $('#txtInicio').val();
	var vtxtFin = $('#txtFin').val();
	var vcboClientes = $('#cboClientes').val();
	
	$('#dvLoadTicketsEstados').removeClass('overlay');
	$('#dvLoadTicketsEstados').addClass('overlay');
	document.getElementById('dvTicketsEstados').innerHTML = '<canvas id="idTicketsEstado1" width="100%" height="50"></canvas> <canvas id="idTicketsEstado2" width="100%" height="50"></canvas>';
	document.getElementById('dvLoadTicketsEstados').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
	
	var src = 'ServletMaximoMobility';
	$.post(src,{
						strOperation : 'getTicketsResueltosEstados',
						ptxtInicio : vtxtInicio,
						ptxtFin : vtxtFin,
						pcboClientes : vcboClientes,
						strClient : vCliente,
						ptipo : tipo
					},
					function(pdata) {
						var obj = JSON.parse(pdata);
						
						console.log(obj);
						var options1 = {
								tooltips : {
				            		enabled : true,
				                	intersect : false
				            	},
				            	responsive: true,
				            	legend: {
				                	position: 'bottom',
				            	},
				            	title: {
				                	display: true,
				                	text: 'Tickets de Requerimiento'
				            	},
				            	animation: {
				                	animateScale: true,
				                	animateRotate: true
				            	}
				        	};
				        	
				        	var ctxBacklog = document.getElementById('idTicketsEstado1').getContext('2d');
				        	var chartBacklog = new Chart(ctxBacklog, {
							    type: 'pie',
							    data: obj.estadoServicio[0],
							    options: options1
							});
							
							
							var options2 = {
								tooltips : {
				            		enabled : true,
				                	intersect : false
				            	},
				            	responsive: true,
				            	legend: {
				                	position: 'bottom',
				            	},
				            	title: {
				                	display: true,
				                	text: 'Tickets de Incidencia'
				            	},
				            	animation: {
				                	animateScale: true,
				                	animateRotate: true
				            	}
				        	};
				        	
							var ctxBacklog = document.getElementById('idTicketsEstado2').getContext('2d');
				        	var chartBacklog = new Chart(ctxBacklog, {
							    type: 'pie',
							    data: obj.estadoIncidencia[0],
							    options: options2
							});
	
						document.getElementById('dvLoadTicketsEstados').innerHTML = '';
						$('#dvLoadTicketsEstados').removeClass('overlay');
					});
}


function listTiempoSolucion(tipo){
	var vtxtInicio = $('#txtInicio').val();
	var vtxtFin = $('#txtFin').val();
	var vcboClientes = $('#cboClientes').val();
	
	$('#dvLoadTiempoResolutor').removeClass('overlay');
	$('#dvLoadTiempoResolutor').addClass('overlay');
	document.getElementById('dvTiempoResolutor').innerHTML = '<canvas id="idTiempoResolutor" width="100%" height="100%"></canvas>';
	document.getElementById('dvLoadTiempoResolutor').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
	
	var src = 'ServletMaximoMobility';
	$.post(src,{
						strOperation : 'getTiempoSolucion',
						ptxtInicio : vtxtInicio,
						ptxtFin : vtxtFin,
						pcboClientes : vcboClientes,
						strClient : vCliente,
						ptipo : tipo
					},
					function(pdata) {
						var obj = JSON.parse(pdata);
						
						var options = {
								tooltips : {
				            		enabled : true,
				                	intersect : false
				            	},
				            	responsive: true,
				            	legend: {
				                	position: 'bottom',
				            	},
				            	title: {
				                	display: true,
				                	text: 'Tiempo por Grupo de Resolución'
				            	},
				            	animation: {
				                	animateScale: true,
				                	animateRotate: true
				            	}
				        	};
				        	var ctxTiempoSolucion = document.getElementById('idTiempoResolutor').getContext('2d');
				        	var chartTiempoSolucion = new Chart(ctxTiempoSolucion, {
							    type: 'doughnut',
							    data: obj.tiempoSolucion[0],
							    options: options
							});
				        	
				        	$("#idTiempoResolutor").click( 
						    	function(evt){
								    var objChart = chartTiempoSolucion.getElementsAtEvent(evt);
								    var grupoResolutor = objChart[0]._model.label;
								    document.getElementById('hdTicketResueltosGrupoSeleccion').value = grupoResolutor;
								    grupoResolutor = grupoResolutor.substring(0,(grupoResolutor.indexOf("[") - 1));
								    
								    listTicketsResueltosFechas(grupoResolutor);
									listTicketsResueltosEstados(grupoResolutor);
									listUsuariosTop(grupoResolutor);
									listSedes(grupoResolutor);
							    }
							);

						document.getElementById('dvLoadTiempoResolutor').innerHTML = '';
						$('#dvLoadTiempoResolutor').removeClass('overlay');

					});
	}



function listUsuariosTop(tipo){
	var vtxtInicio = $('#txtInicio').val();
	var vtxtFin = $('#txtFin').val();
	var vcboClientes = $('#cboClientes').val();
	
	$('#dvLoadUsuarioTop').removeClass('overlay');
	$('#dvLoadUsuarioTop').addClass('overlay');
	document.getElementById('dvUsuarioTop').innerHTML = '<canvas id="idUsuariosTop" width="100%" height="100"></canvas>';
	document.getElementById('dvLoadUsuarioTop').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';

	var src = 'ServletMaximoMobility';
	$.post(src,{
						strOperation : 'getUsuariosTop',
						ptxtInicio : vtxtInicio,
						ptxtFin : vtxtFin,
						pcboClientes : vcboClientes,
						strClient : vCliente,
						ptipo : tipo
					},
					function(pdata) {
						var obj = JSON.parse(pdata);
						
						optionsBar = {
			                    title:{
			                        display:true,
			                        text:"Tickets Resueltos"
			                    },
			                    tooltips: {
			                        mode: 'point',
			                        intersect: true
			                    },
			                    responsive: true,
			                    scales: {
			                        xAxes: [{
			                            stacked: true,
			                            display : true
			                        }],
			                        yAxes: [{
			                            stacked: true
			                        }]
			                    }
			                };
				        	var ctxTicketResultado = document.getElementById('idUsuariosTop').getContext('2d');
				        	var myBarChart = new Chart(ctxTicketResultado, {
					            type: 'horizontalBar',
					            data: obj.usuariosTop[0],
					            options: optionsBar
					        });
				        	
						document.getElementById('dvLoadUsuarioTop').innerHTML = '';
						$('#dvLoadUsuarioTop').removeClass('overlay');

					});
}



function listSedes(tipo){
	var vtxtInicio = $('#txtInicio').val();
	var vtxtFin = $('#txtFin').val();
	var vcboClientes = $('#cboClientes').val();
	
	$('#dvLoadSedes').removeClass('overlay');
	$('#dvLoadSedes').addClass('overlay');
	document.getElementById('dvSedes').innerHTML = '<canvas id="idSedes" width="100%" height="70"></canvas>';
	document.getElementById('dvLoadSedes').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';

	var src = 'ServletMaximoMobility';
	$.post(src,{
						strOperation : 'getSedes',
						ptxtInicio : vtxtInicio,
						ptxtFin : vtxtFin,
						pcboClientes : vcboClientes,
						strClient : vCliente,
						ptipo : tipo
					},
					function(pdata) {
						var obj = JSON.parse(pdata);
						
						console.log(obj);
						var options1 = {
								tooltips : {
				            		enabled : true,
				                	intersect : false
				            	},
				            	responsive: true,
				            	legend: {
				                	position: 'bottom',
				            	},
				            	title: {
				                	display: true,
				                	text: 'Tickets por Sedes'
				            	},
				            	animation: {
				                	animateScale: true,
				                	animateRotate: true
				            	}
				        	};
				        	var ctx = document.getElementById('idSedes').getContext('2d');
				        	
// 				        	var ctxBacklog = document.getElementById('idTicketsEstado1').getContext('2d');
				        	var chartSedes = new Chart(ctx, {
							    type: 'pie',
							    data: obj.sede[0],
							    options: options1
							});
							
							
							
							
							
							
						
						
						
// 						optionsLine= {
// 				                responsive: true,
// 				                title:{
// 				                    display:true,
// 				                    text:'Tickets por sedes'
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
// 				                        display: false,
// 				                        scaleLabel: {
// 				                            display: true,
// 				                            labelString: 'Sedes'
// 				                        }
// 				                    }],
// 				                    yAxes: [{
// 				                        display: true,
// 				                        scaleLabel: {
// 				                            display: true,
// 				                        }
// 				                    }]
// 				                }
// 				            };
// 				        	var ctx = document.getElementById('idSedes').getContext('2d');
// 				        	var myBarChart = new Chart(ctx, {
// 				                type: 'line',
// 				                data: obj.sede[0],
// 				                options: optionsLine
// 				            });
				        	
						document.getElementById('dvLoadSedes').innerHTML = '';
						$('#dvLoadSedes').removeClass('overlay');

					});
}

	
	function listCiscoGSP() {
	
		var vClient = $('#cboClientes').val();
		var vDate = $('#txtInicio').val();
		
		
		txtCliente = $('#cboClientes option:selected').text();
		if(txtCliente == 'Todos' || txtCliente == 'AESA Constructora' || txtCliente == 'AESA Minera' || txtCliente == 'Aporta' || txtCliente == 'Breca' || txtCliente == 'BREIN' || txtCliente == 'BVO' || txtCliente == 'Centria' || txtCliente == 'Estratégica' || txtCliente == 'EXSA S.A.' || txtCliente == 'Protepersa' || txtCliente == 'Servicios Rimac' || txtCliente == 'Urbanova'){
		vClient = 'PE-CTRA-ITS';
		}
		
		var src = 'ServletMaximoWH';
		$.post(src,{
							strOperation : 'listCiscoGSP', pclient : vClient, pDate : vDate
						},
						function(pdata) {
						var obj = JSON.parse(pdata);
						
						if(obj != null || obj.cisco[0].length > 0){
							document.getElementById('lbltasaabandonoSla').innerHTML = obj.cisco[0].slaTasaAbandono;
							document.getElementById('lbltasaabandonodia').innerHTML = obj.cisco[0].tasaabandonodia;
							document.getElementById('lbltasaabandonomes').innerHTML = obj.cisco[0].tasaabandonomes;
						//	document.getElementById('lbltimeRespuestaResidenteSla').innerHTML = obj.cisco[0].slaTiempoRespuestaResidente;
						//	document.getElementById('lbltimeRespuestaNoResidenteSla').innerHTML = obj.cisco[0].slaTiempoRespuestaNoResidente;
						//	document.getElementById('lblresidente').innerHTML = obj.cisco[0].residente;
						//	document.getElementById('lblnoresidente').innerHTML = obj.cisco[0].noresidente;
							document.getElementById('lbltimeConversacionSla').innerHTML = obj.cisco[0].slaTiempoConversacion;
							document.getElementById('lbltimedia').innerHTML = obj.cisco[0].timedia;
							document.getElementById('lbltimemes').innerHTML = obj.cisco[0].timemes;
						}
						else{
							document.getElementById('lbltasaabandonoSla').innerHTML = "";
							document.getElementById('lbltasaabandonodia').innerHTML = "0";
							document.getElementById('lbltasaabandonomes').innerHTML = "0";
						//	document.getElementById('lbltimeRespuestaResidenteSla').innerHTML = "";
						//	document.getElementById('lbltimeRespuestaNoResidenteSla').innerHTML = "";
						//	document.getElementById('lblresidente').innerHTML = "0";
						//	document.getElementById('lblnoresidente').innerHTML = "0";
							document.getElementById('lbltimeConversacionSla').innerHTML = "";
							document.getElementById('lbltimedia').innerHTML = "0"; 
							document.getElementById('lbltimemes').innerHTML = "0";
						}
						
						});
	}


	function listReport(strOp, tipo) {
		
		$('#mdTicketsReporte').modal('show');
		
		$(document).ready(
						function() {
							var vCliente = document.getElementById("hdCliente").value;
							var vtxtInicio = $('#txtInicio').val();
							var vtxtFin = $('#txtFin').val();
							var vcboClientes = $('#cboClientes').val();
							var onVip = $('#hdVip').val();

							var htmlTable = '<table id=\"tblTickets\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
							document.getElementById('tbcontainer').innerHTML = htmlTable;

							$('#dvLoadTicketsReporte').removeClass('overlay');
							$('#dvLoadTicketsReporte').addClass('overlay');
							document.getElementById('dvLoadTicketsReporte').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';

							var src = 'ServletMaximoMobility';
							$
									.post(
											src,
											{
												strOperation : strOp,
												ptxtInicio : vtxtInicio,
												ptxtFin : vtxtFin,
												pcboClientes : String(vcboClientes),
												strClient : vCliente,
												ptipo : tipo,
												pOnVip : onVip
											},
											function(pdata) {
												var obj = JSON.parse(pdata);
												var dataReporte = [];

												for (i = 0; i < obj.ticketsReporte.length; i++) {
													var arr = [];
													arr.push(obj.ticketsReporte[i].idTicket);
													arr.push(obj.ticketsReporte[i].ticketTitulo);
													arr.push(obj.ticketsReporte[i].ticketEstado);
													arr.push(obj.ticketsReporte[i].ticketUsuarioVip);
													arr.push(obj.ticketsReporte[i].ticketCliente);
													arr.push(obj.ticketsReporte[i].ticketGrupoResolutor);
													arr.push(obj.ticketsReporte[i].ticketFechaCreacion);
													arr.push(obj.ticketsReporte[i].ticketPersonaReportado);
													arr.push(obj.ticketsReporte[i].ticketPersonaAfectada);
													dataReporte.push(arr);
												}
												
												columnsReport = [ {
													title : "TICKET"}, {
													title : "TITULO"}, {
													title : "ESTADO"}, {
													title : "USUARIO VIP"}, {	
													title : "CLIENTE"}, {
													title : "GRUPORESOLUTOR"}, {
													title : "FECHACREACION"}, {
													title : "PERSONAREPORTADO"}, {
													title : "PERSONAAFECTADA"
												} ];
												setData(dataReporte,
														columnsReport);
												document
														.getElementById('dvLoadTicketsReporte').innerHTML = '';
												$('#dvLoadTicketsReporte')
														.removeClass('overlay');
											});

						});
	}
	
	function listReportWO(pStrOp,pStrEstado, pStrNombreGrupoResolutor) {
		
		$('#mdTicketsReporte').modal('show');
		var vcboClientes = $('#cboClientes').val();
		
		if(vcboClientes != 'ALL'){
		vcboClientes = $('#cboClientes option:selected').text(); 
		}
		
		$(document).ready(
						function() {

							var htmlTable = '<table id=\"tblTickets\" ><thead class=\"bg-primary\"></thead></table>';
							document.getElementById('tbcontainer').innerHTML = htmlTable;

							$('#dvLoadTicketsReporte').removeClass('overlay');
							$('#dvLoadTicketsReporte').addClass('overlay');
							document.getElementById('dvLoadTicketsReporte').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
							
							var src = 'ServletMaximoMobility';
							$
									.post(
											src,
											{
												strOperation : pStrOp,
												strCliente : vcboClientes,
												strEstado : pStrEstado,
												strNombreGrupoResolutor : pStrNombreGrupoResolutor
											},
											function(pdata) {
												var obj = JSON.parse(pdata);
												var dataReporte = [];

												for (i = 0; i < obj.ticketsReporte.length; i++) {
													var arr = [];
													arr.push(obj.ticketsReporte[i].ticketWOSRRelacionado);
													arr.push(obj.ticketsReporte[i].ticketWOPrincipal);
													arr.push(obj.ticketsReporte[i].ticketWORelacionada);
													arr.push(obj.ticketsReporte[i].ticketWODescripcion);
													arr.push(obj.ticketsReporte[i].ticketWOCliente);
													arr.push(obj.ticketsReporte[i].ticketWOEstado);
													arr.push(obj.ticketsReporte[i].ticketWOFechaInicio);
													arr.push(obj.ticketsReporte[i].ticketWONombreGResolutor);
													arr.push(obj.ticketsReporte[i].ticketWOPropietario);
													arr.push(obj.ticketsReporte[i].ticketWOFechaReportada);
													arr.push(obj.ticketsReporte[i].ticketWOReportadoPor);
													arr.push(obj.ticketsReporte[i].ticketWOUsuarioAfectado);
													arr.push(obj.ticketsReporte[i].ticketWODiasBacklog);
													arr.push(obj.ticketsReporte[i].ticketWORangoBancklog);
													dataReporte.push(arr);
												}

												columnsReport = [ {
													title : "SR RELACIONADO"}, {
													title : "WO PRINCIPAL"}, {
													title : "WO RELACIONADA"}, {
													title : "DESCRIPCION"}, {
													title : "CLIENTE"}, {
													title : "ESTADO"}, {
													title : "FECHA INICIO"},{
													title : "NOMBRE  GRUPO RESOLUTOR"}, {
													title : "PROPIETARIO"}, {
													title : "FECHA REPORTADA"}, {
													title : "REPORTADO POR"}, {
													title : "USUARIO AFECTADO"}, {
													title : "DIAS EN BACKLOG"}, {
													title : "BACKLOG"
												} ];
												setDataWO(dataReporte,
														columnsReport);
												document
														.getElementById('dvLoadTicketsReporte').innerHTML = '';
												$('#dvLoadTicketsReporte')
														.removeClass('overlay');
											});

						});
	}

    function listReportWOTareas(pStrOp,pStrEstado, pStrDescripcionWOPrincipal) {
		
		$('#mdTicketsReporte').modal('show');
		var vcboClientes = $('#cboClientes').val();
		
		if(vcboClientes != 'ALL'){
		vcboClientes = $('#cboClientes option:selected').text(); 
		}
		
		$(document).ready(
						function() {

							var htmlTable = '<table id=\"tblTickets\" class=\"display table table-striped table-condensed table-bordered table-responsive table-hover\"  style=\"font-size:11px;\" ><thead class=\"bg-primary\"></thead></table>';
							document.getElementById('tbcontainer').innerHTML = htmlTable;

							$('#dvLoadTicketsReporte').removeClass('overlay');
							$('#dvLoadTicketsReporte').addClass('overlay');
							document.getElementById('dvLoadTicketsReporte').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
							
							var src = 'ServletMaximoMobility';
							$
									.post(
											src,
											{
												strOperation : pStrOp,
												strCliente : vcboClientes,
												strEstado : pStrEstado,
												strDescripcionWOPrincipal : pStrDescripcionWOPrincipal
											},
											function(pdata) {
												var obj = JSON.parse(pdata);
												var dataReporte = [];

												for (i = 0; i < obj.ticketsReporte.length; i++) {
													var arr = [];
													arr.push(obj.ticketsReporte[i].ticketWOSRRelacionado);
													arr.push(obj.ticketsReporte[i].ticketWOPrincipal);
													arr.push(obj.ticketsReporte[i].ticketWODescripcionWOPrincipal);
													arr.push(obj.ticketsReporte[i].ticketWORelacionada);
													arr.push(obj.ticketsReporte[i].ticketWODescripcionWORelacionada);
													arr.push(obj.ticketsReporte[i].ticketWOFechaReportada);
													arr.push(obj.ticketsReporte[i].ticketWONombreGResolutor);
													arr.push(obj.ticketsReporte[i].ticketWOPropietario);
													arr.push(obj.ticketsReporte[i].ticketWOCliente);
													arr.push(obj.ticketsReporte[i].ticketWOEstado);
													arr.push(obj.ticketsReporte[i].ticketWOFechaInicio);
													arr.push(obj.ticketsReporte[i].ticketWOReportadoPor);
													arr.push(obj.ticketsReporte[i].ticketWOUsuarioAfectado);
													arr.push(obj.ticketsReporte[i].ticketWODiasBacklog);
													arr.push(obj.ticketsReporte[i].ticketWORangoBancklog);
													dataReporte.push(arr);
												}

												columnsReport = [ {
													title : "SR RELACIONADO"}, {
													title : "WO PRINCIPAL"}, {
													title : "DESCRIPCION WO PRINCIPAL"}, {
													title : "WO ACTIVIDAD"}, {
													title : "DESCRIPCION DE LA ACTIVIDAD"}, {
													title : "FECHA REPORTADA"}, {
													title : "NOMBRE  GRUPO RESOLUTOR"}, {
													title : "PROPIETARIO"}, {
													title : "CLIENTE"}, {
													title : "ESTADO"}, {
													title : "FECHA INICIO"},{
													title : "REPORTADO POR"}, {
													title : "USUARIO AFECTADO"}, {
													title : "DIAS EN BACKLOG"}, {
													title : "BACKLOG"
												} ];
												setDataWO(dataReporte,
														columnsReport);
												document
														.getElementById('dvLoadTicketsReporte').innerHTML = '';
												$('#dvLoadTicketsReporte')
														.removeClass('overlay');
											});

						});
	} 
	
	
	function setData(pdataReporte, pcolumnsReport) {
		var htmlTable = '<table id=\"tblTickets\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
		document.getElementById('tbcontainer').innerHTML = htmlTable;

		var buttonCommon = {
			exportOptions : {
				format : {
					body : function(data, row, column, node) {
						// Strip $ from salary column to make it numeric
						return column === 5 ? data.replace(/[$,]/g, '') : data;
					}
				}
			}
		};

		if (typeof tableReporte === 'undefined') {

			var tableReporte = $('#tblTickets')
					.DataTable(
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
			$('.dataTables_filter input').addClass(
					'form-control-search-datatable');
			// 		$('.dataTables_filter input').attr('size',10);
		} else {
			// how to change the data contained inside datatable?
			tableReporte.fnClearTable();
			tableReporte.fnAddData(dataReporte);
			tableReporte.fnAdjustColumnSizing();
		}
	}
	
	function setDataWO(pdataReporte, pcolumnsReport) {
		var htmlTable = '<table id=\"tblTickets\" class=\"display table table-striped table-condensed table-bordered table-responsive table-hover\" style=\"font-size:11px;\" ><thead class=\"bg-primary\"></thead></table>';
		document.getElementById('tbcontainer').innerHTML = htmlTable;

		var buttonCommon = {
			exportOptions : {
				format : {
					body : function(data, row, column, node) {
						// Strip $ from salary column to make it numeric
						return column === 5 ? data.replace(/[$,]/g, '') : data;
					}
				}
			}
		};

		if (typeof tableReporte === 'undefined') {

			var tableReporte = $('#tblTickets')
					.DataTable(
							{
								processing : false,
								order: [[ 2, "desc" ]],
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
			$('.dataTables_filter input').addClass(
					'form-control-search-datatable');
			// 		$('.dataTables_filter input').attr('size',10);
		} else {
			// how to change the data contained inside datatable?
			tableReporte.fnClearTable();
			tableReporte.fnAddData(dataReporte);
			tableReporte.fnAdjustColumnSizing();
		}
	}
	
	function setDataWOV1(pdataReporte, pcolumnsReport) {
		
 		$(document).ajaxStart(function() { Pace.restart(); });
 		
 		
		var htmlTable = '<table id=\"tblTicketsV1\" class=\"display table table-striped table-condensed table-bordered table-responsive table-hover\" width=\"99%\" style=\"font-size:11px;\" >'+
									'<thead class=\"bg-primary\"></thead>'+
									'<thead class=\"filters\" >'+
							        '<tr>'+
							           '<th style=\"border: hidden\"></th>'+
							           '<th style=\"border: hidden\"></th>'+
							           '<th style=\"border: hidden\"></th>'+
							           '<th style=\"border: hidden\"></th>'+
							           '<th style=\"border: hidden\"></th>'+
							           '<th style=\"border: hidden\"></th>'+
							           '<th style=\"border: hidden\"></th>'+
							        '</tr>'+
							        '</thead>'+
							        '</table>';
		document.getElementById('tbcontainerV1').innerHTML = htmlTable;

		var buttonCommon = {
			exportOptions : {
				format : {
					body : function(data, row, column, node) {
						// Strip $ from salary column to make it numeric
						return column === 5 ? data.replace(/[$,]/g, '') : data;
					}
				}
			}
		};

		
		if (typeof tableReporte === 'undefined') {
		
			var tableReporte = $('#tblTicketsV1')
					.DataTable(
							{
								processing : false,
								order: [[ 0, "asc" ],[ 6, "desc" ]],
								serverSide : false,
								data : pdataReporte,
								columns : pcolumnsReport,
								rowsGroup: [0],
                    			
                    			rowCallback: function(row, data, index){ 
                    				$(row).find('td:eq(1)').css('text-align', 'center'); 
                    				$(row).find('td:eq(3)').css('text-align', 'center'); 
    								if(data[6] >= 6){ 
     									$(row).find('td:eq(6)').css('color', 'red'); 
     									$(row).find('td:eq(6)').css('text-align', 'center'); 
     									$(row).find('td:eq(6)').css('rotula-ama', 'yellow'); 
    								} 
    								if(data[6] >= 3 && data[6] < 6){ 
     									$(row).find('td:eq(6)').css('color', '#feb236'); 
     									$(row).find('td:eq(6)').css('text-align', 'center'); 
    								}
    								if(data[6] >= 0 && data[6] < 3){ 
     									$(row).find('td:eq(6)').css('color', 'green'); 
     									$(row).find('td:eq(6)').css('text-align', 'center'); 
    								}
    							},
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
		
		    // Setup - add a text input to each footer cell
	   		 $('#tblTicketsV1 .filters th').each( function () {
	         var title = $('#tblTicketsV1 thead th').eq( $(this).index() ).text();
	        $(this).html( '<input type="text" placeholder="Buscar" style="width:100%"  />' );
	    	} );

		table = $('#tblTicketsV1').DataTable();
		
		// Apply the search
	    table.columns().eq( 0 ).each( function ( colIdx ) {
	        $( 'input', $('.filters th')[colIdx] ).on( 'keyup change', function () {
	            table
	                .column( colIdx )
	                .search( this.value )
	                .draw();
	        } );
	    } );
			
			
		} else {
		alert('entro');
			// how to change the data contained inside datatable?
			tableReporte.fnClearTable();
			tableReporte.fnAddData(dataReporte);
			tableReporte.fnAdjustColumnSizing();
		}
	}
	
	

</script>

<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script',
			'https://www.google-analytics.com/analytics.js', 'ga');

	ga('create', 'UA-101093319-1', 'auto');
	ga('send', 'pageview');
</script>


<script>
     /*! RowsGroup for DataTables v2.0.0
 * 2015-2016 Alexey Shildyakov ashl1future@gmail.com
 * 2016 Tibor Wekerle
 */

/**
 * @summary     RowsGroup
 * @description Group rows by specified columns
 * @version     2.0.0
 * @file        dataTables.rowsGroup.js
 * @author      Alexey Shildyakov (ashl1future@gmail.com)
 * @contact     ashl1future@gmail.com
 * @copyright   Alexey Shildyakov
 * 
 * License      MIT - http://datatables.net/license/mit
 *
 * This feature plug-in for DataTables automatically merges columns cells
 * based on it's values equality. It supports multi-column row grouping
 * in according to the requested order with dependency from each previous 
 * requested columns. Now it supports ordering and searching. 
 * Please see the example.html for details.
 * 
 * Rows grouping in DataTables can be enabled by using any one of the following
 * options:
 *
 * * Setting the `rowsGroup` parameter in the DataTables initialisation
 *   to array which containes columns selectors
 *   (https://datatables.net/reference/type/column-selector) used for grouping. i.e.
 *    rowsGroup = [1, 'columnName:name', ]
 * * Setting the `rowsGroup` parameter in the DataTables defaults
 *   (thus causing all tables to have this feature) - i.e.
 *   `$.fn.dataTable.defaults.RowsGroup = [0]`.
 * * Creating a new instance: `new $.fn.dataTable.RowsGroup( table, columnsForGrouping );`
 *   where `table` is a DataTable's API instance and `columnsForGrouping` is the array
 *   described above.
 *
 * For more detailed information please see:
 *     
 */

(function($){

ShowedDataSelectorModifier = {
	order: 'current',
	page: 'current',
	search: 'applied',
}

GroupedColumnsOrderDir = 'asc';


/*
 * columnsForGrouping: array of DTAPI:cell-selector for columns for which rows grouping is applied
 */
var RowsGroup = function ( dt, columnsForGrouping )
{
	this.table = dt.table();
	this.columnsForGrouping = columnsForGrouping;
	 // set to True when new reorder is applied by RowsGroup to prevent order() looping
	this.orderOverrideNow = false;
	this.mergeCellsNeeded = false; // merge after init
	this.order = []
	
	var self = this;
	dt.on('order.dt', function ( e, settings) {
		if (!self.orderOverrideNow) {
			self.orderOverrideNow = true;
			self._updateOrderAndDraw()
		} else {
			self.orderOverrideNow = false;
		}
	})
	
	dt.on('preDraw.dt', function ( e, settings) {
		if (self.mergeCellsNeeded) {
			self.mergeCellsNeeded = false;
			self._mergeCells()
		}
	})
	
	dt.on('column-visibility.dt', function ( e, settings) {
		self.mergeCellsNeeded = true;
	})

	dt.on('search.dt', function ( e, settings) {
		// This might to increase the time to redraw while searching on tables
		//   with huge shown columns
		self.mergeCellsNeeded = true;
	})

	dt.on('page.dt', function ( e, settings) {
		self.mergeCellsNeeded = true;
	})

	dt.on('length.dt', function ( e, settings) {
		self.mergeCellsNeeded = true;
	})

	dt.on('xhr.dt', function ( e, settings) {
		self.mergeCellsNeeded = true;
	})

	this._updateOrderAndDraw();
	
/* Events sequence while Add row (also through Editor)
 * addRow() function
 *   draw() function
 *     preDraw() event
 *       mergeCells() - point 1
 *     Appended new row breaks visible elements because the mergeCells() on previous step doesn't apllied to already processing data
 *   order() event
 *     _updateOrderAndDraw()
 *       preDraw() event
 *         mergeCells()
 *       Appended new row now has properly visibility as on current level it has already applied changes from first mergeCells() call (point 1)
 *   draw() event
 */
};


RowsGroup.prototype = {
	setMergeCells: function(){
		this.mergeCellsNeeded = true;
	},

	mergeCells: function()
	{
		this.setMergeCells();
		this.table.draw();
	},

	_getOrderWithGroupColumns: function (order, groupedColumnsOrderDir)
	{
		if (groupedColumnsOrderDir === undefined)
			groupedColumnsOrderDir = GroupedColumnsOrderDir
			
		var self = this;
		var groupedColumnsIndexes = this.columnsForGrouping.map(function(columnSelector){
			return self.table.column(columnSelector).index()
		})
		var groupedColumnsKnownOrder = order.filter(function(columnOrder){
			return groupedColumnsIndexes.indexOf(columnOrder[0]) >= 0
		})
		var nongroupedColumnsOrder = order.filter(function(columnOrder){
			return groupedColumnsIndexes.indexOf(columnOrder[0]) < 0
		})
		var groupedColumnsKnownOrderIndexes = groupedColumnsKnownOrder.map(function(columnOrder){
			return columnOrder[0]
		})
		var groupedColumnsOrder = groupedColumnsIndexes.map(function(iColumn){
			var iInOrderIndexes = groupedColumnsKnownOrderIndexes.indexOf(iColumn)
			if (iInOrderIndexes >= 0)
				return [iColumn, groupedColumnsKnownOrder[iInOrderIndexes][1]]
			else
				return [iColumn, groupedColumnsOrderDir]
		})
		
		groupedColumnsOrder.push.apply(groupedColumnsOrder, nongroupedColumnsOrder)
		return groupedColumnsOrder;
	},
 
	// Workaround: the DT reset ordering to 'asc' from multi-ordering if user order on one column (without shift)
	//   but because we always has multi-ordering due to grouped rows this happens every time
	_getInjectedMonoSelectWorkaround: function(order)
	{
		if (order.length === 1) {
			// got mono order - workaround here
			var orderingColumn = order[0][0]
			var previousOrder = this.order.map(function(val){
				return val[0]
			})
			var iColumn = previousOrder.indexOf(orderingColumn);
			if (iColumn >= 0) {
				// assume change the direction, because we already has that in previos order
				return [[orderingColumn, this._toogleDirection(this.order[iColumn][1])]]
			} // else This is the new ordering column. Proceed as is.
		} // else got milti order - work normal
		return order;
	},
	
	_mergeCells: function()
	{
		var columnsIndexes = this.table.columns(this.columnsForGrouping, ShowedDataSelectorModifier).indexes().toArray()
		var showedRowsCount = this.table.rows(ShowedDataSelectorModifier)[0].length 
		this._mergeColumn(0, showedRowsCount - 1, columnsIndexes)
	},
	
	// the index is relative to the showed data
	//    (selector-modifier = {order: 'current', page: 'current', search: 'applied'}) index
	_mergeColumn: function(iStartRow, iFinishRow, columnsIndexes)
	{
		var columnsIndexesCopy = columnsIndexes.slice()
		currentColumn = columnsIndexesCopy.shift()
		currentColumn = this.table.column(currentColumn, ShowedDataSelectorModifier)
		
		var columnNodes = currentColumn.nodes()
		var columnValues = currentColumn.data()
		
		var newSequenceRow = iStartRow,
			iRow;
		for (iRow = iStartRow + 1; iRow <= iFinishRow; ++iRow) {
			
			if (columnValues[iRow] === columnValues[newSequenceRow]) {
				$(columnNodes[iRow]).hide()
			} else {
				$(columnNodes[newSequenceRow]).show()
				$(columnNodes[newSequenceRow]).attr('rowspan', (iRow-1) - newSequenceRow + 1)
				
				if (columnsIndexesCopy.length > 0)
					this._mergeColumn(newSequenceRow, (iRow-1), columnsIndexesCopy)
				
				newSequenceRow = iRow;
			}
			
		}
		$(columnNodes[newSequenceRow]).show()
		$(columnNodes[newSequenceRow]).attr('rowspan', (iRow-1)- newSequenceRow + 1)
		if (columnsIndexesCopy.length > 0)
			this._mergeColumn(newSequenceRow, (iRow-1), columnsIndexesCopy)
	},
	
	_toogleDirection: function(dir)
	{
		return dir == 'asc'? 'desc': 'asc';
	},
 
	_updateOrderAndDraw: function()
	{
		this.mergeCellsNeeded = true;
		
		var currentOrder = this.table.order();
		currentOrder = this._getInjectedMonoSelectWorkaround(currentOrder);
		this.order = this._getOrderWithGroupColumns(currentOrder)
		this.table.order($.extend(true, Array(), this.order))
		this.table.draw()
	},
};


$.fn.dataTable.RowsGroup = RowsGroup;
$.fn.DataTable.RowsGroup = RowsGroup;

// Automatic initialisation listener
$(document).on( 'init.dt', function ( e, settings ) {
	if ( e.namespace !== 'dt' ) {
		return;
	}

	var api = new $.fn.dataTable.Api( settings );
	
	if ( settings.oInit.rowsGroup ||
		 $.fn.dataTable.defaults.rowsGroup )
	{
		options = settings.oInit.rowsGroup?
			settings.oInit.rowsGroup:
			$.fn.dataTable.defaults.rowsGroup;
		var rowsGroup = new RowsGroup( api, options );
		$.fn.dataTable.Api.register( 'rowsgroup.update()', function () {
			rowsGroup.mergeCells();
			return this;
		} );
		$.fn.dataTable.Api.register( 'rowsgroup.updateNextDraw()', function () {
			rowsGroup.setMergeCells();
			return this;
		} );
	}
} );

}(jQuery));

/*

TODO: Provide function which determines the all <tr>s and <td>s with "rowspan" html-attribute is parent (groupped) for the specified <tr> or <td>. To use in selections, editing or hover styles.

TODO: Feature
Use saved order direction for grouped columns
	Split the columns into grouped and ungrouped.
	
	user = grouped+ungrouped
	grouped = grouped
	saved = grouped+ungrouped
	
	For grouped uses following order: user -> saved (because 'saved' include 'grouped' after first initialisation). This should be done with saving order like for 'groupedColumns'
	For ungrouped: uses only 'user' input ordering
*/   
    </script> 

</head>
<body>

	
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
					
					<div id="dvLoadTicketsReporte"></div>
				</div>
			</div>
		</div>
	</div>
	
	
	<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
	<section class="content-header">
	<h1>
		Dashboard <small>Mobility</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-th-large"></i> Dashboard</a></li>
		<li class="active">Mobility</li>
	</ol>
	</section> <!-- Main content --> 
	<section class="content"> <!-- top row -->
	<input id="hdIdAlerta" type="hidden"> 
	<input id="hdTipo" type="hidden">
	<input id="hdVip" type="hidden" value="0">

	<div class="row">
		<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
			<div class="form-inline">
				<div class="form-group">
					<span>Periodo:</span> <input type="text"
						class="form-control datePicker" id="txtInicio"> <input
						type="text" class="form-control datePicker" id="txtFin">
				</div>
				<div class="form-group">
					<!-- 					<a class="btn btn-primary" role="button" data-toggle="collapse" href="#opcionesAvanzadas" aria-expanded="false" aria-controls="#opcionesAvanzadas"> -->
					<!-- 				  Link with href -->
					<!-- 					</a> -->
					<button id="btnConsultar" class="btn btn-primary" type="button">
						Consultar</button>
					<button id="btnOpcionesAvanzadas" class="btn btn-default" type="button"
						data-toggle="collapse" data-target="#opcionesAvanzadas"
						aria-expanded="false" aria-controls="#opcionesAvanzadas">
						Opciones Avanzadas</button>
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
							
							
							
							
							
							
							
								<div style="display: none;">
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
										<option value="SR">Requerimiento</option>
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
									<select id="cboGrupoPropietario" multiple="multiple"
										class="cbo2">
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
					</div>
					<br />
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
<!-- 		<section class="col-xs-12 col-sm-6 col-md-6 col-lg-4 connectedSortable"> -->

<!-- 		<section class="content"> -->
<!-- 		<div class="row"> -->
			<section class="col-md-4">
				<!-- Widget: user widget style 1 -->
				<div class="box box-widget widget-user">
					<!-- Add the bg color to the header using any of the bg-* classes -->
					<div class="widget-user-header bg-black"
						style="background: url('http://preview.ibb.co/eqwwQ5/gsp03.png') center left;">
						<h3 class="widget-user-username">
							<b>Tasa de Abandono</b>
						</h3>
					</div>
<!-- 					<div class="widget-user-image"> -->
<!-- 						<img class="img-circle" src="http://image.ibb.co/eNLO55/ban_verde.jpg" -->
<!-- 							alt="User Avatar"> -->
<!-- 					</div> -->
					<div class="box-footer">
						<div class="row">
							<div class="col-sm-4 border-right">
								<div class="description-block">
									<h5 class="description-header"><label id="lbltasaabandonomes"></label></h5>
									<span class="description-text">MENSUAL(%)</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-4 border-right">
								<div class="description-block">
									<h5 class="description-header"><label id="lbltasaabandonoSla"></label></h5>
									<span class="description-text">SLA</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-4">
								<div class="description-block">
									<h5 class="description-header"><label id=lbltasaabandonodia></label></h5>
									<span class="description-text">DIARIO(%)</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
				</div>
				<!-- /.widget-user -->
			</section>
			<!-- /.col -->
			<section class="col-md-4">
				<!-- Widget: user widget style 1 -->
				<div class="box box-widget widget-user">
					<!-- Add the bg color to the header using any of the bg-* classes -->
					<div class="widget-user-header bg-black"
						style="background: url('http://preview.ibb.co/jCgVk5/gsp02.png') center left;">
						<h3 class="widget-user-username">
							<b>Tiempo de Respuesta<br> Onsite
							</b>
						</h3>
					</div>
<!-- 					<div class="widget-user-image"> -->
<!-- 						<img class="img-circle" src="http://image.ibb.co/fUYFJQ/ban_naranja.jpg" -->
<!-- 							alt="User Avatar"> -->
<!-- 					</div> -->
					<div class="box-footer">
						<div class="row">
							<div class="col-sm-3 border-right">
								<div class="description-block">
									<h5 class="description-header"><label id=lblresidente></label></h5>
									<span class="description-text">RESIDENTE</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-3 border-right">
								<div class="description-block">
									<h5 class="description-header"><label id="lbltimeRespuestaResidenteSla"></label></h5>
									<span class="description-text">SLA</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-3 border-right">
								<div class="description-block">
									<h5 class="description-header"><label id="lbltimeRespuestaNoResidenteSla"></label></h5>
									<span class="description-text">SLA</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-3">
								<div class="description-block">
									<h5 class="description-header"><label id=lblnoresidente></label></h5>
									<span class="description-text">NO RESIDENTE</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
				</div>
				<!-- /.widget-user -->
			</section>
			<!-- /.col -->

			<!-- fix for small devices only -->
			<section class="col-md-4">
				<!-- Widget: user widget style 1 -->
				<div class="box box-widget widget-user">
					<!-- Add the bg color to the header using any of the bg-* classes -->
					<div class="widget-user-header bg-black"
						style="background: url('http://preview.ibb.co/bvYzdQ/gsp01.png') center left;">
						<h3 class="widget-user-username">
							<b>Tiempo de Conversación</b>
						</h3>
					</div>
<!-- 					<div class="widget-user-image"> -->
<!-- 						<img class="img-circle" src="http://image.ibb.co/dfdMsk/ban_rojo.jpg" -->
<!-- 							alt="User Avatar"> -->
<!-- 					</div> -->
					<div class="box-footer">
						<div class="row">
							<div class="col-sm-4 border-right">
								<div class="description-block">
									<h5 class="description-header"><label id=lbltimedia></label></h5>
									<span class="description-text">DIARIO</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-4 border-right">
								<div class="description-block">
									<h5 class="description-header"><label id="lbltimeConversacionSla"></label></h5>
									<span class="description-text">SLA</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-4">
								<div class="description-block">
									<h5 class="description-header"><label id=lbltimemes></label></h5>
									<span class="description-text">MENSUAL</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
				</div>
				<!-- /.widget-user -->
			</section>
			</div>
	
	<div class="row" id='divBacklogWOTareasV1' style='display:none;'>
	<section class="col-xs-12 col-sm-12 col-md-12 col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i> BACKLOG WORK ORDER - TAREAS </h3>
				<a class="btn btn-default btn-sm pull-right" onclick="listReportWOTareas('getMaximoTicketsBackLogWOTareas', 'ALL', 'ALL')"><i class="fa fa-ticket" aria-hidden="true"></i> Ver Tickets</a>
				
			</div>
			<div class="box-body">
					<div class="row">
						<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
							<div id="tbcontainerV1" class="table-responsive">
							</div>
						</div>
					</div>
			</div>
			<div id="dvLoadTicketsReporteV1"></div>
		</div>
	</section>
	</div>
	
	
	<div class="row" id='divBacklogWO' style='display:none;'>
	<section class="col-xs-12 col-sm-12 col-md-12 col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i> BACKLOG WORK ORDER</h3>
				<a class="btn btn-default btn-sm pull-right" onclick="listReportWO('getMaximoTicketsBackLogWO', 'ALL', 'ALL')"><i class="fa fa-ticket" aria-hidden="true"></i> Ver Tickets</a>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div id="tbcontainer" class="table-responsive" style="max-height: 600px">
							<div class="form-group" id="dvBackLogWO"></div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
						<div id="tbcontainer" class="table-responsive" style="max-height: 600px">
							<div class="form-group" id="dvBackLogWOTable"></div>
						</div>
					</div>
				</div>
				
			</div>
			<div id="dvLoadBackLogWO"></div>
		</div>
	</section>
	</div>
	
	<div class="row">
	<section class="col-xs-12 col-sm-12 col-md-12 col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i> BACKLOG</h3>
				<label class="btn btn-success pull-right"><i class="fa fa-user-o" aria-hidden="true"></i> Usuarios VIP <input type="checkbox" id="chkUsuariosVip" name='chkUsuariosVip' class="pull-right"></label>
<!-- 				<a class="btn btn-success btn-sm " onclick="listBackLog('0','1')"><i class="fa fa-user-o" aria-hidden="true"></i>Usuarios VIP</a> &nbsp; -->
				<a class="btn btn-default btn-sm pull-right" onclick="listReport('getMaximoTicketsBackLog','0')"><i class="fa fa-ticket" aria-hidden="true"></i> Ver Tickets</a>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div id="tbcontainer" class="table-responsive" style="max-height: 600px">
							<div class="form-group" id="dvBackLog"></div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
						<div id="tbcontainer" class="table-responsive" style="max-height: 600px">
							<div class="form-group" id="dvBackLogTable"></div>
						</div>
					</div>
				</div>
				
			</div>
			<div id="dvLoadBackLog"></div>
		</div>
	</section>
	</div>
	
	<div class="row">
	<section class="col-xs-12 col-sm-4 col-md-4 col-lg-4 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i> TICKETS RESUELTOS POR GRUPO RESOLUTOR</h3>
				<a class="btn btn-default btn-sm pull-right" onclick="listReport('getMaximoTicketsResueltos','0')"><i class="fa fa-ticket" aria-hidden="true"></i> Ver Tickets</a>
			</div>
			<div class="box-body">
				<div id="tbcontainer" class="table-responsive">
					<div class="form-group" id="dvTicketsResueltos"></div>
				</div>
			</div>
			<div id="dvLoadTicketsResueltos"></div>
		</div>
	</section>
	
	<section class="col-xs-12 col-sm-4 col-md-4 col-lg-4 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<input id="hdTicketResueltosGrupoSeleccion" type="hidden" value="0">
				<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i> TOTAL DE TICKETS POR FECHAS</h3>
				<a class="btn btn-default btn-sm pull-right" onclick="listReport('getMaximoTicketsResueltos',document.getElementById('hdTicketResueltosGrupoSeleccion').value)"><i class="fa fa-ticket" aria-hidden="true"></i> Ver Tickets</a>
			</div>
			<div class="box-body">
				<div id="tbcontainer" class="table-responsive">
					<div class="form-group" id="dvTicketsFechas"></div>
				</div>
			</div>
			<div id="dvLoadTicketsFechas"></div>
		</div>
	</section>
	
	<section class="col-xs-12 col-sm-4 col-md-4 col-lg-4 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i> TOTAL DE TICKETS POR ESTADOS</h3>
				<a class="btn btn-default btn-sm pull-right" onclick="listReport('getMaximoTicketsResueltos',document.getElementById('hdTicketResueltosGrupoSeleccion').value)"><i class="fa fa-ticket" aria-hidden="true"></i> Ver Tickets</a>
			</div>
			<div class="box-body">
				<div id="tbcontainer" class="table-responsive">
					<div class="form-group" id="dvTicketsEstados"></div>
				</div>
			</div>
			<div id="dvLoadTicketsEstados"></div>
		</div>
	</section>
	</div>
	
	
	
	<div class="row">
		<section class="col-xs-12 col-sm-4 col-md-4 col-lg-4 connectedSortable">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title"><i class="fa fa-line-chart" aria-hidden="true"></i> TIEMPO SOLUCIÓN POR GRUPO RESOLUTOR</h3>
					<a class="btn btn-default btn-sm pull-right" onclick="listReport('getMaximoTicketsResueltos','0')"><i class="fa fa-ticket" aria-hidden="true"></i> Ver Tickets</a>
				</div>
				<div class="box-body">
					<div id="tbcontainer" class="table-responsive">
						<div class="form-group" id="dvTiempoResolutor" style="max-height: 450px"></div>
					</div>
				</div>
				<div id="dvLoadTiempoResolutor"></div>
			</div>
		</section>
	
		<section class="col-xs-12 col-sm-4 col-md-4 col-lg-4 connectedSortable">

		<div class="box box-primary">
			<div class="box-header with-border ui-sortable-handle">
				<h3 class="box-title"><i class="fa fa-ticket" aria-hidden="true"></i> USUARIOS TOP</h3>
				<a class="btn btn-default btn-sm pull-right" onclick="listReport('getMaximoTicketsResueltos',document.getElementById('hdTicketResueltosGrupoSeleccion').value)"><i class="fa fa-ticket" aria-hidden="true"></i> Ver Tickets</a>
			</div>
			<div class="box-body">
				<div id="tbcontainer" class="table-responsive">
					<div class="form-group" id="dvUsuarioTop" style="max-height: 400px"></div>
				</div>
			</div>
			<div id="dvLoadUsuarioTop"></div>
		</div>
		</section>
<!-- 	</div> -->
	
<!-- 	<div class="row"> -->
		<section class="col-xs-12 col-sm-4 col-md-4 col-lg-4 connectedSortable">
			<div class="box box-primary">
				<div class="box-header with-border ui-sortable-handle">
					<h3 class="box-title"><i class="fa fa-ticket" aria-hidden="true"></i> TICKETS POR SEDES</h3>
					<a class="btn btn-default btn-sm pull-right" onclick="listReport('getMaximoTicketsResueltos',document.getElementById('hdTicketResueltosGrupoSeleccion').value)"><i class="fa fa-ticket" aria-hidden="true"></i> Ver Tickets</a>
				</div>
				<div class="box-body">
				<div id="tbcontainer" class="table-responsive">
					<div class="form-group" id="dvSedes" style="max-height: 400px"></div>
				</div>
			</div>
			<div id="dvLoadSedes"></div>
			</div>
		</section>
	</div>
	</section> </aside>
</body>
</html>