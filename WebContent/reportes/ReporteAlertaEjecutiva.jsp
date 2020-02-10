<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

<script type="text/javascript">

var f=new Date();
var date = f.getFullYear() + '-' + ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f.getMonth() + 1)) + '-' + ((f.getDate()) < 10 ? '0' + f.getDate() : f.getDate());

document.getElementById("txtInicio").value = date;
document.getElementById("txtFin").value = date;

</script>


<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	Reporte <small>Control panel</small>
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
				<span>Fechas</span> 
				<input type="text" class="form-control datePicker" id="txtInicio">
				<input type="text" class="form-control datePicker" id="txtFin">
				
				<a id="btnConsultar" onclick="listReport()" class="btn btn-primary btn-sm">Consultar</a>
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
					Aquí podrás obtener toda la información de los tickets registrado como Alertas Ejecutivas.
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
	
	
	
	
	function listReport() {
	
		$(document).ready(function() {
			var strDateInicio = document.getElementById("txtInicio").value;
			var strDateFin = document.getElementById("txtFin").value;
			var piTeam = vTeam;
			
		var src = 'ServletReporteAlertaEjecutiva';
		$.post(src, {strOperation : "listReporteAE",pstrDateInicio : strDateInicio,pstrDateFin : strDateFin,iTeam : piTeam},
					function(pdata) {
					  var obj = JSON.parse(pdata);
					  var dataReporte = [];
					  var columnsReport = [];
						  for(i = 0 ; i < obj.reporte.length ; i++ )
						  	{
						  	
							var arr = [];
							arr.push(obj.reporte[i].idTicket);
							arr.push(obj.reporte[i].maximoEstado);
							arr.push(obj.reporte[i].cliente);
							arr.push(obj.reporte[i].resumen);
							arr.push(obj.reporte[i].detalle);
							arr.push(obj.reporte[i].prioridad);
							arr.push(obj.reporte[i].fechaCreacion);
							arr.push(obj.reporte[i].estado);
							arr.push(obj.reporte[i].idGrupoPropietario);
							arr.push(obj.reporte[i].grupoPropietario);
							arr.push(obj.reporte[i].pm);
							arr.push(obj.reporte[i].crisisTurno);
							arr.push(obj.reporte[i].fechaNotificacionIBM);
							arr.push(obj.reporte[i].dataCenter);
							arr.push(obj.reporte[i].fechaFin);
							arr.push(obj.reporte[i].tipoFalla);
							arr.push(obj.reporte[i].concurrencia);
							arr.push(obj.reporte[i].otrosClientes);
							arr.push(obj.reporte[i].propietarioIncidencia);
							arr.push(obj.reporte[i].servicioImpactado);
							arr.push(obj.reporte[i].sla);
							arr.push(obj.reporte[i].impactoNegocio);
							arr.push(obj.reporte[i].idTicketProblema);
							arr.push(obj.reporte[i].idTicketCambio);
							arr.push(obj.reporte[i].cambioPm);
							arr.push(obj.reporte[i].recibioAlerta);
							arr.push(obj.reporte[i].derivoCambio);
							arr.push(obj.reporte[i].desviacionesIncidentes);
							arr.push(obj.reporte[i].evaluacionCrisis);
							arr.push(obj.reporte[i].observaciones);
							arr.push(obj.reporte[i].usuarioCreador);
							arr.push(obj.reporte[i].usuarioModificador);
							dataReporte.push(arr);
							}
						  
						  columnsReport = [ {title : "IDTICKET"},
						    {title : "MAXIMOESTADO"},
						    {title : "CLIENTE"}, 
				            {title : "RESUMEN"}, 
				            {title : "DETALLE"}, 
				            {title : "PRIORIDAD"}, 
				            {title : "FECHA_CREACION"},
				            {title : "ESTADO"},
				            {title : "IDGRUPOPROPIETARIO"},
				            {title : "GRUPOPROPIETARIO"}, 
				            {title : "PM"},
				            {title : "CRISIS_TURNO"},
				            {title : "FECHA_AFECTACION"},
				            {title : "DATACENTER"},
				            {title : "HORA_FIN"},
				            {title : "TIPO_FALLA"},
				            {title : "CONCURRENCIA"},
				            {title : "OTROS_CLIENTES"},
				            {title : "PROPIEDAD_INCIDENCIA"},
				            {title : "SERVICIO_IMPACTADO"},
				            {title : "SLA"},
				            {title : "IMPACTO_NEGOCIO"},
				            {title : "TICKET_PROBLEMA"},
				            {title : "TICKET_CAMBIO"},
				            {title : "CAMBIO PRIORIDAD"},
				            {title : "NOTIFICACIONES"},
				            {title : "DERIVO CAMBIO"},
				            {title : "DESVIACIONES INCIDENTES"},
				            {title : "EVALUACION CRISIS"},
				            {title : "OBSERVACIONES"},
				            {title : "USUARIO CREADOR"},
				            {title : "USUARIO MODIFICADOR"}
				          ];
					setData(dataReporte,columnsReport);
					    
			});
			
		});
	}
	
	
	
	var htmlTable = '<table id=\"tblReportes\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
	
	
	
	function setData(pdataReporte,pcolumnsReport)
	{
		$(document).ajaxStart(function() { Pace.restart(); });
		document.getElementById('tbcontainer').innerHTML = 	htmlTable;
	
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