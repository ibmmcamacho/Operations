<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	Administrar Schedule <small> Opciones</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-th-large"></i> Administrar Schedule </a></li>
	<li class="active"> Opciones</li>
</ol>
</section> <!-- Main content --> <section class="content"> <!-- top row -->
<div class="row">
	<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
		<div class="form-inline">
			<div class="form-group">
				<a class="btn btn-default btn-sm" href="#" onclick="openModalNuevo()">
				<i class="fa fa-file-text-o" aria-hidden="true"></i> Nuevo
				</a>
				
				<a class="btn btn-default btn-sm" onclick="listReport()">
				<i class="fa fa-refresh fa-lg" aria-hidden="true"></i>
				</a>
			</div>
			&nbsp;&nbsp;
			<div class="form-group">
				<span>Opciones</span>
				<select id="cboTipoReporte" class="form-control input-sm">
					<option value="0">Seleccionar</option>
				</select>
			</div>
			&nbsp;&nbsp;
			<div class="form-group">
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
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> LISTA DE OPCIONES</h3>
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
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">MANTENIMIENTO DE REGISTRO</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        		<input type="hidden" id="hdIdOptions">
        		<div class="form-group">
        			<label>Descripción</label>
        			<input id="txtDescripcion1" type="text" class="form-control">
        		</div>
        		<div class="form-group">
        			<label>Valor1</label>
        			<input id="txtValor1" type="text" class="form-control">
        		</div>
        		<div class="form-group">
        			<label>Valor2</label>
        			<input id="txtValor2" type="text" class="form-control">
        		</div>
        		<div class="form-inline">
        			<div class="form-group">
        				<a id="btnGuardar" onclick="acciones('save')" class="btn btn-primary btn-sm">
		        			<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar
		        		</a>
		        		<a id="btnActualizar" onclick="acciones('update')" class="btn btn-primary btn-sm">
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
        <h4 class="modal-title">Mantenimiento de Opciones</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        		<div class="form-group">
        			<label>¿Desea eliminar este registro?</label>
        		</div>
        		<div class="form-inline">
        			<div class="form-group">
        				<a onclick="acciones('delete')" class="btn btn-danger btn-sm">
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
	listType();
	
	function listType()
	{
	$(document).ready(function() {
		var src = "ServletWOptionsCont";
		$.post(src, {strOperation : 'listType', iTeam : vTeam},
				function(pdata) {
// 				alert(pdata);
				  var obj = JSON.parse(pdata);
					
					$('#cboTipoReporte option').remove();
					
					if(obj.tipo.length > 0){
						$('#cboTipoReporte').append($('<option>', {value: '0',text : 'Seleccionar'}));
  	    				$.each(obj.tipo, function (i, item) {
  	    				    $('#cboTipoReporte').append($('<option>', { 
  	    				        value: item.descripcion,
  	    				        text : item.descripcion
  	    				    }));
  	    				});
      				}
      				else
      				{
      					$('#cboTipoReporte').append($('<option>', { 
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
			
			var src = "ServletWOptionsCont";
			$.post(src, {strOperation : 'listOptions', iTeam : vTeam, strType : document.getElementById('cboTipoReporte').value},
					function(pdata) {
// 						alert(pdata);
					  var obj = JSON.parse(pdata);
					  var dataReporte = [];
					  var columnsReport = [];
					  
						  for(i = 0 ; i < obj.reporte.length ; i++ )
						  	{
							var arr = [];
							arr.push(i+1);
							arr.push(obj.reporte[i].idOption);
							arr.push(obj.reporte[i].descripcion);
							arr.push(obj.reporte[i].valor1);
							arr.push(obj.reporte[i].valor2);
							dataReporte.push(arr);
							}
						  
						  columnsReport = [ {title : "NRO"},
						    {title : "IDOPTION"}, 
				            {title : "DESCRIPCION"},
				            {title : "VALOR1"},
				            {title : "VALOR2"},
				            {
								"sName": "editarbtn",
								"title" : "Acciones", 
								"bSearchable": false,
								"sWidth": "100px",
								"bSortable": false,
								"mRender": function ( data, type, columns ) {									
									return '<a title="Editar" class="btn btn-primary btn-sm" onclick="openModalUpdate(\'' + columns[1] + '\',\'' + columns[2] + '\',\'' + columns[3] + '\',\'' + columns[4] + '\')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>&nbsp;&nbsp;' + 
										   '<a title="Eliminar" class="btn btn-danger btn-sm" onclick="openModalDelete(\'' + columns[1] + '\')"><i class="fa fa-trash-o" aria-hidden="true"></i></a>';
								}
							}
				          ];
					  
					    setData(dataReporte,columnsReport);
					    
			});
		});
		}
	
	function acciones(pOperacion)
	{
	$(document).ready(function() {

		var src = "ServletWOptionsCont";
		var piIdOptions = $('#hdIdOptions').text() == '' ? 0 : $('#hdIdOptions').text();
		var pstrDescripcion = $('#txtDescripcion1').val() == '' ? '' : $('#txtDescripcion1').val();
		var pstrValor1 = document.getElementById('txtValor1').value;
		var pstrValor2 = document.getElementById('txtValor2').value;
		
		var piTeam = document.getElementById('hdIdTeam').value;
		var piType = document.getElementById('cboTipoReporte').value;

// 		alert('Enviando : ' + piIdOptions + ' || ' + pstrDescripcion);
		$.post(src, {strOperation : pOperacion, iIdOptions : piIdOptions, strDescripcion : pstrDescripcion, strValor1 : pstrValor1 , strValor2 : pstrValor2, iTeam : vTeam, strType : document.getElementById('cboTipoReporte').value},
				function(pdata) {
// 					alert(pdata);
					if(pdata == "ok"){
						listReport();
						$('#mdNuevo').modal('hide');
						$('#mdActualizar').modal('hide');
						$('#mdPregunta').modal('hide');
						
						$('#hdIdOptions').text('');
						$('#txtDescripcion1').val('');
						$('#txtValor1').val('');
						$('#txtValor2').val('');
// 						alert('Estado actual de los controles: HD1: ' + $('#hdIdOptions1').text() + ' || HD2: ' + $('#hdIdOptions2').text() + ' || TXT1: ' + $('#txtNombreOptions1').val() + ' || TXT2: ' + $('#txtNombreOptions2').val());
					}
					else
						$('#lblMessage').text('Hubo un problema al procesar, no se actualizó, por favor vuelva a intentarlo.');
		});
	});
	}
	
	var htmlTable = '<table id=\"tblReportes\" class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
	
	function openModalNuevo(){
		
		$('#btnActualizar').removeClass('hidden');
		$('#btnActualizar').addClass('hidden');
		$('#btnGuardar').removeClass('hidden');
		
		$('#hdIdOptions').text('');
		$('#txtDescripcion1').val('');
		$('#txtValor1').val('');
		$('#txtValor2').val('');
		$('#mdNuevo').modal('show');
	}
	
	function openModalUpdate(idOptions,Descripcion,valor1,valor2)
	{
		$(document).ready(function(){
// 			alert(idOptions + ' || ' + Descripcion);
			$('#btnActualizar').removeClass('hidden');
			$('#btnGuardar').removeClass('hidden');
			$('#btnGuardar').addClass('hidden');

			$('#mdNuevo').modal('show');
			$('#hdIdOptions').text(idOptions);
			$('#txtDescripcion1').val(Descripcion);
			$('#txtValor1').val(valor1);
			$('#txtValor2').val(valor2);
		});
	}
	
	function openModalDelete(idOptions)
	{
		$(document).ready(function(){
			$('#mdPregunta').modal('show');
			$('#hdIdOptions').text(idOptions);
		});
	}
	
	function setData(pdataReporte,pcolumnsReport)
	{
		document.getElementById('tbcontainer').innerHTML = 	htmlTable;
	
		var buttonCommon = {
				exportOptions : {
					format : {
						body : function(data, row, column, node) {
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
						search : '<i class="fa fa-search fa-lg"/>',
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
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
	}
</script>

</html>