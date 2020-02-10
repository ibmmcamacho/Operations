<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

<script type="text/javascript">

var f=new Date();
var date = f.getFullYear() + '-' + ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f.getMonth() + 1)) + '-' + ((f.getDate() + 1) < 10 ? '0' + f.getDate() : f.getDate());

document.getElementById("txtInicio").value = date;
document.getElementById("txtFin").value = date;

</script>


<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	Reporte <small></small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-dashboard"></i> Reporte Histórico</a></li>
	<li class="active">Proyecto</li>
</ol>
</section> <!-- Main content --> <section class="content"> <!-- top row -->
<div class="row">
	<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
		<div class="form-inline">
			<div class="form-group">
				<span>Tipo Reporte</span>
				<select id="cboTipoReporte" class="form-control input-sm">
					<option value="0">Seleccionar</option>
					<option value="1">Tardanza detallada</option>
					<option value="2">Tardanza consolidado Anual</option>
					<option value="4">Tardanza consolidado Semanal</option>
					<option value="5">Asistencia</option>
				</select>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="form-group">
				<span>Fechas</span> 
				<input type="text" class="form-control datePicker" id="txtInicio">
				<input type="text" class="form-control datePicker" id="txtFin">
				
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
					Aquí podrás obtener toda la información que necesitas sobre las marcaciones y tardanzas bajo demanda. 
				</div>
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
	
	
	function listTeams()
	{
		$(document).ready(function(){
			var src = "ServletWReporteMarcador";
			$.post(src, {strOperation : "listTeams"},
					function(pdata) {
				var obj = JSON.parse(pdata);
				$('#cboList1 option').remove();
				if(obj[0].area != "null"){
					$('#cboList1').append($('<option>', {
				        value: 'null',
				        text : 'TODOS'
				    }));
					$.each(obj, function (i, item) {
					    $('#cboList1').append($('<option>', {
					        value: item.area,
					        text : item.area
					    }));
					});
				}
				else
				{
					    $('#cboList1').append($('<option>', { 
					        value: '0',
					        text : 'Seleccionar' 
					}));
				}
			});
		});
	}
	
	function listReport()
		{
		
		$(document).ready(function() {
			var strDateInicio = document.getElementById("txtInicio").value;
			var strDateFin = document.getElementById("txtFin").value;
			var objCbo1 = document.getElementById("cboTipoReporte");
// 			var objCbo2 = document.getElementById("cboList1");
			var strTipoReporte = objCbo1.options[objCbo1.selectedIndex].value;
// 			var strTeam = objCbo2.options[objCbo2.selectedIndex].value;
			var piTeam = vTeam;
			
			var src = "ServletWReporteMarcador";
			$.post(src, {strFechaInicio : strDateInicio, strFechaFin : strDateFin, strTipo : strTipoReporte, iTeam : piTeam, strOperation : 'listReports'},
					function(pdata) {
// 						alert(pdata);
					  var obj = JSON.parse(pdata);
					  var dataReporte = [];
					  var columnsReport = [];
					  if(strTipoReporte == "1")
					  {
						  for(i = 0 ; i < obj.reporte.length ; i++ )
						  	{
							var arr = [];
							arr.push(i+1);
							arr.push(obj.reporte[i].area);
							arr.push(obj.reporte[i].modalidad);
							arr.push(obj.reporte[i].cargo);
							arr.push(obj.reporte[i].idempleado);
							arr.push(obj.reporte[i].personal);
							arr.push(obj.reporte[i].email);
							arr.push(obj.reporte[i].horario);
							arr.push(obj.reporte[i].mes);
							arr.push(obj.reporte[i].fechaEntrada);
							arr.push(obj.reporte[i].horaEntrada);
							arr.push(obj.reporte[i].fechaSalida);
							arr.push(obj.reporte[i].horaSalida);
							arr.push(obj.reporte[i].minutos);
							arr.push(obj.reporte[i].obs);
							arr.push(obj.reporte[i].ip);
							arr.push(obj.reporte[i].os);
							arr.push(obj.reporte[i].browser);
							dataReporte.push(arr);
							}
						  
						  columnsReport = [ 
						  	{title : "NRO"},
						    {title : "AREA"},
						    {title : "MODALIDAD"}, 
						    {title : "CARGO"}, 
				            {title : "IDEMPLEADO"}, 
				            {title : "PERSONAL"},
				            {title : "EMAIL"},
				            {title : "HORARIO"}, 
				            {title : "MES"},
				            {title : "FECHA_ENTRADA"},
				            {title : "HORA_ENTRADA"}, 
				            {title : "FECHA_SALIDA"},
				            {title : "HORA_SALIDA"},
				            {title : "TIEMPO"},
				            {title : "OBSERVACIONES"},
				            {title : "DIRECCION_IP"},
				            {title : "SISTEMA OP"},
				            {title : "BROWSER"}
				          ];
					  }
					  else if(strTipoReporte == "2")
					  {
						  for(i = 0 ; i < obj.reporte.length ; i++ )
						  	{
							var arr = [];
							arr.push(i+1);
							arr.push(obj.reporte[i].area);
							arr.push(obj.reporte[i].idempleado);
							arr.push(obj.reporte[i].personal);
							arr.push(obj.reporte[i].enero);
							arr.push(obj.reporte[i].febrero);
							arr.push(obj.reporte[i].marzo);
							arr.push(obj.reporte[i].abril);
							arr.push(obj.reporte[i].mayo);
							arr.push(obj.reporte[i].junio);
							arr.push(obj.reporte[i].julio);
							arr.push(obj.reporte[i].agosto);
							arr.push(obj.reporte[i].septiembre);
							arr.push(obj.reporte[i].octubre);
							arr.push(obj.reporte[i].noviembre);
							arr.push(obj.reporte[i].diciembre);
							dataReporte.push(arr);
							}
					  		columnsReport = [ {title : "NRO"},
					  	                {title : "AREA"}, 
							            {title : "IDEMPLEADO"}, 
							            {title : "PERSONAL"}, 
							            {title : "ENERO"}, 
							            {title : "FEBRERO"},
							            {title : "MARZO"},
							            {title : "ABRIL"}, 
							            {title : "MAYO"},
							            {title : "JUNIO"},
							            {title : "JULIO"},
							            {title : "AGOSTO"},
							            {title : "SEPTIEMBRE"},
							            {title : "OCTUBRE"},
							            {title : "NOVIEMBRE"},
							            {title : "DICIEMBRE"}
							          ];
					  }
					  else if(strTipoReporte == "4")
					  {
						  for(i = 0 ; i < obj.reporte.length ; i++ )
						  	{
							var arr = [];
							arr.push(i+1);
							arr.push(obj.reporte[i].area);
							arr.push(obj.reporte[i].modalidad);
							arr.push(obj.reporte[i].cargo);
							arr.push(obj.reporte[i].idempleado);
							arr.push(obj.reporte[i].personal);
							arr.push(obj.reporte[i].email);
							arr.push(obj.reporte[i].horario);
							arr.push(obj.reporte[i].mes);
							arr.push(obj.reporte[i].semana);
							arr.push(obj.reporte[i].minutos);
							dataReporte.push(arr);
							}
					  		columnsReport = [ 
					  					{title : "NRO"},
									    {title : "AREA"},
									    {title : "MODALIDAD"}, 
									    {title : "CARGO"}, 
							            {title : "IDEMPLEADO"}, 
							            {title : "PERSONAL"},
							            {title : "EMAIL"},
							            {title : "HORARIO"}, 
							            {title : "MES"},
							            {title : "SEMANA"},
							            {title : "MINUTOS"}
							          ];
					  }
					  else if(strTipoReporte == "5")
					  {
						  for(i = 0 ; i < obj.reporte.length ; i++ )
						  	{
							var arr = [];
							arr.push(i+1);
							arr.push(obj.reporte[i].idempleado);
							arr.push(obj.reporte[i].personal);
							arr.push(obj.reporte[i].email);
							arr.push(obj.reporte[i].dia);
							arr.push(obj.reporte[i].fecha);
							arr.push(obj.reporte[i].horario);
							arr.push(obj.reporte[i].asistencia);
							arr.push(obj.reporte[i].obs);
							
							dataReporte.push(arr);
							}
					  		columnsReport = [ 
					  					{title : "NRO"},
							            {title : "IDEMPLEADO"}, 
							            {title : "PERSONAL"},
							            {title : "EMAIL"},
							            {title : "DIA"},
							            {title : "FECHA"},
							            {title : "HORARIO"},
							            {title : "ASISTENCIA"},
							            {title : "OBSERVACION"}
							          ];
					  }
					  
					    setData(dataReporte,columnsReport);
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