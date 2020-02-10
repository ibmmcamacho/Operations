<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>Mantenimiento <small>Horarios</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-th-large"></i> Mantenimiento</a></li>
	<li class="active">Horarios</li>
</ol>
</section> <!-- Main content --> <section class="content"> <!-- top row -->
<div class="row">
	<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
		<div class="form-inline">
			<div class="form-group">
				<label>Malla a mostrar</label>
<!-- 				<a class="btn btn-default btn-sm" data-toggle="modal" data-target="#mdNuevo"> -->
<!-- 				<i class="fa fa-file-text-o" aria-hidden="true"></i> Nuevo -->
<!-- 				</a> -->
			</div>
			<div class="form-group">
				<select id="cboMallas"></select>
			</div>
			<div class="form-group">	
				<a class="btn btn-default" onclick="listReport()">
				<i class="fa fa-search" aria-hidden="true"></i> Consultar
				</a>
			</div>
		</div>
	</div>
</div>
<br />
<div class="row">
	<div class="col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> MONITOREO TWS</h3>
			</div>
			<div class="box-body">
				<label id="lblMessage" class="label label-info"></label>
				<div id="tbcontainer" class="table-responsive">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.row --> <!-- Main row -->
<div class="row"></div>
<!-- /.row (main row) --> </section><!-- /.content --> </aside>

</body>

<!-- Modal Insertar -->
<div class="modal fade" id="mdNuevo" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Crear un nuevo Horario</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        		<input type="hidden" id="hdIdHorario1">
        		<label>Horario</label>
        		<div class="form-group">
	        		<div class="input-group timePicker">
	        			<input id="txtHorario1" type="text" class="form-control" readonly="readonly">
	        			<span class="input-group-addon">
	        				<span class="fa fa-clock-o"></span>
	        			</span>
	        		</div>
        		</div>
        		
        		<div class="form-inline">
        			<div class="form-group">
        				<a onclick="accionesHorario('save')" class="btn btn-primary btn-sm">
		        			<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar
		        		</a>
		        		<a role="button" class="btn btn-default btn-sm" data-dismiss="modal">
		        			<i class="fa fa-reply" aria-hidden="true"></i> Volver
		        		</a>
        			</div>
        		</div>
        	</div>
        </div>
      </div>
    </div>
  </div>
</div>


<!-- Modal Pregunta -->
<div class="modal fade" id="mdPregunta" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Mantenimiento de Horario</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        	<input type="hidden" id="hdIdHorario2">
        		<div class="form-group">
        			<label>¿Desea eliminar este registro?</label>
        		</div>
        		<div class="form-inline">
        			<div class="form-group">
        				<a onclick="accionesHorario('delete')" class="btn btn-danger btn-sm">
		        			<i class="fa fa-floppy-o" aria-hidden="true"></i> ELIMINAR
		        		</a>
		        		<a role="button" class="btn btn-default btn-sm" data-dismiss="modal">
		        			<i class="fa fa-reply" aria-hidden="true"></i> Volver
		        		</a>
        			</div>
        		</div>
        	</div>
        </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	
var vTeam = document.getElementById('hdIdTeam').value;
var vUsuario = $('#smUsuario').text();

listOptions('MALLASTWS');

	function listOptions(tipo, team) {
		$(document).ready(function() {
	
			var src = "ServletWOptions";
			$.post(src, {
				strOperation : "listOptions",
				strType : tipo,
				iTeam : vTeam
			}, function(pdata) {
				var obj = JSON.parse(pdata);
	
				if (obj.reporte.length > 0) {
	
					if (tipo == "MALLASTWS") {
						$('#cboMallas option').remove();
						$('#cboMallas').append($('<option>', {
							value : '0',
							text : 'Todos'
						}));
	
						$.each(obj.reporte, function(i, item) {
							$('#cboMallas').append($('<option>', {
								value : item.valor1,
								text : item.descripcion
							}));
						});
						$('#cboMallas').select2({
							dropdownAutoWidth : true
						});
						
// 						if(vCliente != null || vCliente != '' || vCliente != 'null'){
// 							$('#cboMallas').val(vCliente).trigger("change");
// 						}
	
						//init();
	
	//						listTiempoSolucion('0');
	//						listTicketsResueltos('0');
	//						listUsuariosTop('0');
	//						listBackLog('0');
	//						listSedes('0');
	
					}
				}
			});
		});
	}

	function listReport()
		{
		$(document).ready(function() {
			
			var vcboMalla = $('#cboMallas').val();
			
			var src = "ServletReporteTWS";
			$.post(src, {strOperation : 'getMonitorTWS', strMalla : vcboMalla},
					function(pdata) {
// 						alert(pdata);
					  var obj = JSON.parse(pdata);
					  var dataReporte = [];
					  var columnsReport = [];
					  
						  for(i = 0 ; i < obj.reporte.length ; i++ )
						  	{
							var arr = [];
							arr.push(obj.reporte[i].job);
							arr.push(obj.reporte[i].fechaEjecutada);
							arr.push(obj.reporte[i].horaEjecutada);
							arr.push(obj.reporte[i].resultado);
							arr.push(obj.reporte[i].duracion);
							arr.push(obj.reporte[i].duracionEjecutada);
							arr.push(obj.reporte[i].tentativo);
							dataReporte.push(arr);
							}
						  
						  columnsReport = [ {title : "JOBS"},
							{title : "FECHA EJECUTADA"},
							{title : "HORA EJECUTADA"},
							{
								"sName": "RESULTADO",
								"title" : "RESULTADO",
								"bSearchable": true,
								"bSortable":true,
								"mRender": function ( data, type, full ) {
									return '<span class="label '+ (full[3] == 'OK' ? 'label-success"> SATISFACTORIO' : (full[3] == 'ERROR' ? 'label-danger"> FALLIDO' : 'label-warning"> OTRO = ' + full[3])) + '</span>'
								}
							},
						    {title : "TIEMPO ESTIMADO"}, 
				            {title : "TIEMPO EJECUTADO"},
				            {
								"sName": "TENTATIVO",
								"title" : "TENTATIVO",
								"bSearchable": true,
								"bSortable": true,
								"mRender": function ( data, type, full ) {
									return '<span class="'+ (full[6] > 100 ? 'text-red"> <i class="fa fa-caret-up"> </i><b> ' + full[6] + '%</b></span>' : (full[6] >= 0 && full[6] <= 80 ? 'text-green"> <i class="fa fa-caret-left"> </i> <b>' + full[6] + '%</b></span>' : 'text-yellow"> <i class="fa fa-caret-up"></i> <b>' + full[6] + '%</b></span>')); 
								}
							}
				          ];
					    setData(dataReporte,columnsReport);
			});
			
		});
		}

	
	var htmlTable = '<table id=\"tblReportes\" class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
	
	function openModalUpdate(idHorario,Descripcion)
	{
		$(document).ready(function(){
// 			alert(idPerfil + ' || ' + Descripcion);
			$('#mdActualizar').modal('show');
			$('#hdIdHorario1').text(idHorario);
			$('#txtHorario2').val(Descripcion);
		});
	}
	
	function openModalDelete(idHorario)
	{
		$(document).ready(function(){
			$('#mdPregunta').modal('show');
			$('#hdIdHorario2').text(idHorario);
		});
	}
	
	function setData(pdataReporte,pcolumnsReport)
	{
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
	    
		var tableReporte = $('#tblReportes').DataTable(
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
// 								className: 'btn btn-primary btn-sm'
							},
							{
								extend : 'excelHtml5',
								text : '<i class="fa fa-file-excel-o"></i> Descargar en Excel',
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