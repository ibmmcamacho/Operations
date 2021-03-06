<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	Mantenimiento <small>Perfil</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-th-large"></i> Mantenimiento</a></li>
	<li class="active">Perfil</li>
</ol>
</section> <!-- Main content --> <section class="content"> <!-- top row -->
<div class="row">
	<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
		<div class="form-inline">
			<div class="form-group">
				<a class="btn btn-default btn-sm" data-toggle="modal" data-target="#mdNuevoPerfil">
				<i class="fa fa-file-text-o" aria-hidden="true"></i> Nuevo
				</a>
				
				<a class="btn btn-default btn-sm" onclick="listReport()">
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
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> LISTA DE PERFILES</h3>
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
<div class="modal fade" id="mdNuevoPerfil" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Crear un nuevo Perfil</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        		<input type="hidden" id="hdIdPerfil">
        		<div class="form-group">
        			<label>Nombre</label>
        			<input id="txtNombrePerfil1" type="text" class="form-control">
        		</div>
        		<div class="form-inline">
        			<div class="form-group">
        				<a onclick="accionesPerfil('savePerfil')" class="btn btn-primary btn-sm">
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

<!-- Modal Actualizar -->
<div class="modal fade" id="mdActualizarPerfil" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Actualizar Perfil</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        		<input type="hidden" id="hdIdPerfil1">
        		<div class="form-group">
        			<label>Nombre</label>
        			<input id="txtNombrePerfil2" type="text" class="form-control">
        		</div>
        		<div class="form-inline">
        			<div class="form-group">
        				<a onclick="accionesPerfil('updatePerfil')" class="btn btn-primary btn-sm">
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
        <h4 class="modal-title">Mantenimiento de Perfil</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        	<input type="hidden" id="hdIdPerfil2">
        		<div class="form-group">
        			<label>�Desea eliminar este registro?</label>
        		</div>
        		<div class="form-inline">
        			<div class="form-group">
        				<a onclick="accionesPerfil('deletePerfil')" class="btn btn-danger btn-sm">
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
	listReport();
	
	function listReport()
		{
		$(document).ready(function() {
			
			var src = "ServletWPerfil";
			$.post(src, {strOperation : 'listPerfil', iTeam : vTeam},
					function(pdata) {
// 						alert(pdata);
					  var obj = JSON.parse(pdata);
					  var dataReporte = [];
					  var columnsReport = [];

						  for(i = 0 ; i < obj.reporte.length ; i++ )
						  	{
							var arr = [];
							arr.push(i+1);
							arr.push(obj.reporte[i].idPerfil);
							arr.push(obj.reporte[i].descripcion);
							dataReporte.push(arr);
							}
						  
						  columnsReport = [ {title : "NRO"},
						    {title : "IDPERFIL"}, 
				            {title : "DESCRIPCION"},
				            {
								"sName": "editarbtn",
								"title" : "Acciones", 
								"bSearchable": false,
								"sWidth": "100px",
								"bSortable": false,
								"mRender": function ( data, type, columns ) {									
									return '<a title="Editar" class="btn btn-primary btn-sm" onclick="openModalUpdate(\'' + columns[1] + '\',\'' + columns[2] + '\')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>&nbsp;&nbsp;' + 
										   '<a title="Eliminar" class="btn btn-danger btn-sm" onclick="openModalDelete(\'' + columns[1] + '\')"><i class="fa fa-trash-o" aria-hidden="true"></i></a>';
								}
							}
				          ];
					  
					    setData(dataReporte,columnsReport);
					    
			});
			
		});
		}
	
	function accionesPerfil(pOperacion)
	{
// 		$(document).ajaxStart(function() { Pace.restart(); });
	$(document).ready(function() {

		var src = "ServletWPerfil";
		var piIdPerfil = $('#hdIdPerfil1').text() == '' ? $('#hdIdPerfil2').text() == '' ? 0 : $('#hdIdPerfil2').text() : $('#hdIdPerfil1').text();
		var pstrDescripcion = $('#txtNombrePerfil1').val() == '' ? $('#txtNombrePerfil2').val() == '' ? '' : $('#txtNombrePerfil2').val() : $('#txtNombrePerfil1').val();
// 		alert('Enviando : ' + piIdPerfil + ' || ' + pstrDescripcion);
		$.post(src, {strOperation : pOperacion, iIdPerfil : piIdPerfil, strDescripcion : pstrDescripcion, iTeam : vTeam},
				function(pdata) {
// 					alert(pdata);
					if(pdata == "ok"){
						listReport();
						$('#mdNuevoPerfil').modal('hide');
						$('#mdActualizarPerfil').modal('hide');
						$('#mdPregunta').modal('hide');
						
						$('#hdIdPerfil1').text('');
						$('#hdIdPerfil2').text('');
						$('#txtNombrePerfil1').val('');
						$('#txtNombrePerfil2').val('');
// 						alert('Estado actual de los controles: HD1: ' + $('#hdIdPerfil1').text() + ' || HD2: ' + $('#hdIdPerfil2').text() + ' || TXT1: ' + $('#txtNombrePerfil1').val() + ' || TXT2: ' + $('#txtNombrePerfil2').val());
					}
					else
						$('#lblMessage').text('Hubo un problema al procesar, no se actualiz�, por favor vuelva a intentarlo.');
		});
	});
	}
	
	var htmlTable = '<table id=\"tblReportes\" class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
	
	function openModalUpdate(idPerfil,Descripcion)
	{
		$(document).ready(function(){
// 			alert(idPerfil + ' || ' + Descripcion);
			$('#mdActualizarPerfil').modal('show');
			$('#hdIdPerfil1').text(idPerfil);
			$('#txtNombrePerfil2').val(Descripcion);
		});
	}
	
	function openModalDelete(idPerfil)
	{
		$(document).ready(function(){
			$('#mdPregunta').modal('show');
			$('#hdIdPerfil2').text(idPerfil);
		});
	}
	
	function setData(pdataReporte,pcolumnsReport)
	{
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
						lengthMenu: "Mostrar _MENU_ registros por p�gina",
			            zeroRecords: "No se encontraron registros",
			            info: "Ver p�gina _PAGE_ de _PAGES_ p�gina(s)",
			            infoEmpty: "No hay informaci�n disponible",
			            infoFiltered: "(filtro de _MAX_ total de registros)",
			            paginate: {
			                first:      "Inicio",
			                last:       "Atras",
			                next:       "Siguiente",
			                previous:   "Atr�s"
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
									�	extend: "copy",
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
	    }
	    else {
	        console.log('in else');
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
	}
</script>

</html>