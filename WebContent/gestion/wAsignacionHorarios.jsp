<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

<!-- ClockPicker CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/clockpicker/css/bootstrap-clockpicker.min.css">

<!-- ClockPicker JS -->
<script src="<%=request.getContextPath()%>/resources/clockpicker/js/bootstrap-clockpicker.min.js"></script>

<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	Gestión <small>Asignación de Horarios</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-th-large"></i> Mantenimiento</a></li>
	<li class="active">Asignación de Horarios</li>
</ol>
</section> <!-- Main content --> <section class="content"> <!-- top row -->
<div class="row">
	<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
		<div class="form-inline">
			<div class="form-group">
				<a class="btn btn-default btn-sm" href="#" onclick="openModalInsert()">
					<i class="fa fa-file-text-o" id="aNuevo" aria-hidden="true"></i> Nuevo
				</a>
				
				<a class="btn btn-default btn-sm" onlick="listReport()">
				<i class="fa fa-refresh fa-lg" aria-hidden="true"></i>
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
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> LISTA DE HORARIOS</h3>
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



<!-- Modal Actualizar -->
<div class="modal fade" id="mdAsignacion" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Actualizar Horario</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        		<input type="hidden" id="hdIdAsignacion1">
        		
        		<label>EMPLEADO</label>
        		<div class="form-group">
	        		<div class="input-group clockpicker">
	        			<select id="cboEmpleado" class="form-control"></select>
	        			<span class="input-group-addon">
	        				<span class="fa fa-clock-o"></span>
	        			</span>
	        		</div>
        		</div>
        		
        		<label>HORARIO</label>
        		<div class="form-group">
	        		<div class="input-group clockpicker">
	        			<select id="cboHorario" class="form-control"></select>
	        			<span class="input-group-addon">
	        				<span class="fa fa-clock-o"></span>
	        			</span>
	        		</div>
        		</div>

        		<div class="form-inline">
        			<div class="form-group">
        				<a id="btnGuardar" onclick="accionesHorario('save')" class="btn btn-primary btn-sm">
							<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar
						</a>
						<a id="btnActualizar" onclick="accionesHorario('update')" class="btn btn-primary btn-sm">
							<i class="fa fa-floppy-o" aria-hidden="true"></i> Actualizar
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
	
	$(document).ready(function() {
		listReport();
		listEmpleado();
		listHorarios();
		
// 		$('#aNuevo').click(function (){
// 			openModalInsert();
// 		});
	});
	
	function listEmpleado()
	{
	$(document).ready(function() {
		
		var src = "ServletWPersonal";
		$.post(src, {strOperation : 'list', iTeam : vTeam},
				function(pdata) {
	//				alert(pdata);
				  var obj = JSON.parse(pdata);
					  
					$('#cboEmpleado option').remove();
					$('#cboEmpleado').append($('<option>', {value: '0',text : 'Seleccionar'}));
					
					if(obj.reporte.length > 0){
		    				$.each(obj.reporte, function (i, item) {
		    				    $('#cboEmpleado').append($('<option>', { 
		    				        value: item.idPersonal,
		    				        text : item.nombre + ' ' + item.apPaterno + ' ' + item.apMaterno 
		    				    }));
		    				});
	  				}
	  				else
	  				{
	  					$('#cboEmpleado').append($('<option>', { 
	    				    value: '0',
	    				    text : 'Seleccionar'
	    				}));
	  				}
		});
	});
	}
	
	function listHorarios()
	{
	$(document).ready(function() {
		
		var src = "ServletWHorario";
		$.post(src, {strOperation : 'list', iTeam : vTeam},
				function(pdata) {
	//				alert(pdata);
				  var obj = JSON.parse(pdata);
					  
					$('#cboHorario option').remove();
					$('#cboHorario').append($('<option>', {value: '0',text : 'Seleccionar'}));
					
					if(obj.reporte.length > 0){
		    				$.each(obj.reporte, function (i, item) {
		    				    $('#cboHorario').append($('<option>', { 
		    				        value: item.idHorario,
		    				        text : item.horas
		    				    }));
		    				});
	  				}
	  				else
	  				{
	  					$('#cboHorario').append($('<option>', { 
	    				    value: '0',
	    				    text : 'Seleccionar'
	    				}));
	  				}
		});
	});
	}
	
	function listReport()
		{
		$(document).ajaxStart(function() { Pace.restart(); });
		$(document).ready(function() {
			
			var src = "ServletSWAsignacionHorarios";
			$.post(src, {strOperation : 'list', iTeam : vTeam},
					function(pdata) {
// 						alert(pdata);
					  var obj = JSON.parse(pdata);
					  var dataReporte = [];
					  var columnsReport = [];
					  
						  for(i = 0 ; i < obj.reporte.length ; i++ )
						  	{
							var arr = [];
							arr.push(i+1);
							arr.push(obj.reporte[i].idLogin);
							arr.push(obj.reporte[i].empleado);
							arr.push(obj.reporte[i].area);
							arr.push(obj.reporte[i].horas);
							arr.push(obj.reporte[i].idHorarioEmpleado);
							arr.push(obj.reporte[i].idEmpleado);
							arr.push(obj.reporte[i].idHorario);
							dataReporte.push(arr);
							}
						  
						  columnsReport = [ {title : "NRO"},
						    {title : "IDLOGIN"}, 
				            {title : "EMPLEADO"},
				            {title : "AREA"},
				            {title : "HORAS"},
				            {title : "IDHORARIOEMPLEADO"},
				            {title : "IDEMPLEADO"},
				            {title : "IDHORARIO"},
				            {
								"sName": "editarbtn",
								"title" : "Acciones", 
								"bSearchable": false,
								"sWidth": "100px",
								"bSortable": false,
								"mRender": function ( data, type, columns ) {									
									return '<a title="Editar" class="btn btn-primary btn-sm" onclick="openModal(\'' + columns[5] + '\',\'' + columns[6] + '\',\'' + columns[7] + '\')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>&nbsp;&nbsp;' + 
										   '<a title="Eliminar" class="btn btn-danger btn-sm" onclick="openModalDelete(\'' + columns[5] + '\')"><i class="fa fa-trash-o" aria-hidden="true"></i></a>';
								}
							}
				          ];
					    setData(dataReporte,columnsReport);
			});
			
		});
		}
	
	function accionesHorario(pOperacion)
	{
	$(document).ready(function() {

		var src = "ServletSWAsignacionHorarios";
		var piIdAsignacion = $('#hdIdAsignacion1').val() == '' ? '' : $('#hdIdAsignacion1').val();
		var piEmpleado = $('#cboEmpleado option:selected').val() == '0' ? '0' : $('#cboEmpleado option:selected').val();
		var piHorario = $('#cboHorario option:selected').val() == '0' ? '0' : $('#cboHorario option:selected').val();
// 		alert('Enviando : ' + piIdHorario + ' || ' + pstrHorario + ' || ' + pstrUsuario);
		$.post(src, {strOperation : pOperacion, iIdAsignacion : piIdAsignacion, iEmpleado : piEmpleado, iHorario : piHorario, iTeam : vTeam},
				function(pdata) {
// 					alert(pdata);
					if(pdata == "ok"){
						listReport();
						$('#mdAsignacion').modal('hide');
						$('#mdPregunta').modal('hide');
						
						$('#hdIdAsignacion1').val('');
						$('#cboEmpleado').val('0');
						$('#cboHorario').val('0');
						
// 						alert('Estado actual de los controles: HD1: ' + $('#hdIdPerfil1').text() + ' || HD2: ' + $('#hdIdPerfil2').text() + ' || TXT1: ' + $('#txtNombrePerfil1').val() + ' || TXT2: ' + $('#txtNombrePerfil2').val());
					}
					else
						$('#lblMessage').text('Hubo un problema al procesar, no se actualizó, por favor vuelva a intentarlo.');
		});
	});
	}
	
	var htmlTable = '<table id=\"tblReportes\" class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
	
	function openModalInsert()
	{
		$(document).ready(function(){
// 			alert(idPerfil + ' || ' + Descripcion);
			$('#btnActualizar').removeClass('hidden');
			$('#btnActualizar').addClass('hidden');
			$('#btnGuardar').removeClass('hidden');
			$('#mdAsignacion').modal('show');
			$('#hdIdAsignacion1').val('');
			$('#cboEmpleado').val('0');
			$('#cboHorario').val('0');
		});
	}
	
	function openModal(idAsignacion,idEmpleado,idHorario)
	{
		$(document).ready(function(){
// 			alert(idPerfil + ' || ' + Descripcion);
			$('#btnActualizar').removeClass('hidden');
			$('#btnGuardar').removeClass('hidden');
			$('#btnGuardar').addClass('hidden');
			$('#mdAsignacion').modal('show');
			$('#hdIdAsignacion1').val(idAsignacion);
			$('#cboEmpleado').val(idEmpleado);
			$('#cboHorario').val(idHorario);
		});
	}
	
	function openModalDelete(idAsignacion)
	{
		$(document).ready(function(){
			$('#mdPregunta').modal('show');
			$('#hdIdAsignacion1').val(idAsignacion);
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
					columnDefs: [
									{
						                "targets": [ 5 ],
						                "visible": false,
						                "searchable": false
						            },
						            {
						                "targets": [ 6 ],
						                "visible": false,
						                "searchable": false
						            },
						            {
						                "targets": [ 7 ],
						                "visible": false,
						                "searchable": false
						            }
									],
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