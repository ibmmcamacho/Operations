<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	Mantenimiento <small>Banco de Claves</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-th-large"></i> Mantenimiento</a></li>
	<li class="active">Banco de Claves</li>
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
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> LISTA DE BANCO DE CLAVES</h3>
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
        <h4 class="modal-title">MANTENIMIENTO DE BANCO DE CLAVES</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        		<input type="hidden" id="hdIdBancoClaves">
        		<div class="form-group">
        			<label>Cliente</label>
        			<input id="txtCliente" type="text" class="form-control">
        		</div>
        		<div class="form-group">
        			<label>Servidor</label>
        			<input id="txtServidor" type="text" class="form-control">
        		</div>
        		<div class="form-group">
        			<label>Ip</label>
        			<input id="txtIp" type="text" class="form-control">
        		</div>
        		<div class="form-group">
        			<label>Instancia</label>
        			<input id="txtInstancia" type="text" class="form-control">
        		</div>
        		<div class="form-group">
        			<label>Mandante</label>
        			<input id="txtMandante" type="text" class="form-control">
        		</div>
        		<div class="form-group">
        			<label>Sistema - SubSistema</label>
        			<input id="txtSisSubSis" type="text" class="form-control">
        		</div>
        		<div class="form-group">
        			<label>Usuario</label>
        			<input id="txtUsuario" type="text" class="form-control">
        		</div>
        		<div class="form-group">
        			<label>Contraseña</label>
        			<input id="txtContrasena" type="text" class="form-control">
        		</div>
        		<div class="form-group">
        			<label>Observaciones</label>
        			<input id="txtObservaciones" type="text" class="form-control">
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
        <h4 class="modal-title">Mantenimiento de Banco de claves</h4>
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
		        			<i class="fa fa-floppy-o" aria-hidden="true"></i> Eliminar
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
			
			var src = "ServletBancoClaves";
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
							arr.push(obj.reporte[i].strCliente);
							arr.push(obj.reporte[i].strServidor);
							arr.push(obj.reporte[i].strIp);
							arr.push(obj.reporte[i].strInstancia);
							arr.push(obj.reporte[i].strMandante);
							arr.push(obj.reporte[i].strSisSubSis);
							arr.push(obj.reporte[i].strUsuario);
							arr.push(obj.reporte[i].strContrasena);
							arr.push(obj.reporte[i].strObservaciones);
							arr.push(obj.reporte[i].iIdBancoClaves);
							dataReporte.push(arr);
							}
						  
						  columnsReport = [ {title : "NRO"},
						    {title : "CLIENTE"}, 
				            {title : "SERVIDOR"},
				            {title : "IP"},
				            {title : "INSTANCIA"},
				            {title : "MANDANTE"},
				            {title : "SISTEMA/SUBSISTEMA"},
				            {title : "USUARIO"},
				            {title : "CONTRASEÑA"},
				            {title : "OBSERVACIONES"},
				            {title : "IDBANCOCLAVES"},
				            {
								"sName": "editarbtn",
								"title" : "ACCIONES_BC", 
								"bSearchable": false,
								"sWidth": "100px",
								"bSortable": false,
								"mRender": function ( data, type, columns ) {									
									return '<a title="Editar" class="btn btn-primary btn-sm" onclick="openModalUpdate(\'' + columns[10] + '\',\'' + columns[1] + '\',\'' + columns[2] + '\',\'' + columns[3] + '\',\'' + columns[4] + '\',\'' + columns[5] + '\',\'' + columns[6] + '\',\'' + columns[7].replace('\\','\\\\') + '\',\'' + columns[8] + '\',\'' + columns[9] + '\')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>&nbsp;&nbsp;' + 
										   '<a title="Eliminar" class="btn btn-danger btn-sm" onclick="openModalDelete(\'' + columns[10] + '\')"><i class="fa fa-trash-o" aria-hidden="true"></i></a>';
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

		var src = "ServletBancoClaves";
		var piIdBancoClaves = $('#hdIdBancoClaves').text() == '' ? 0 : $('#hdIdBancoClaves').text();
		var pstrCliente = $('#txtCliente').val() == '' ? '' : $('#txtCliente').val();
		var pstrServidor = $('#txtServidor').val() == '' ? '' : $('#txtServidor').val();
		var pstrIp = $('#txtIp').val() == '' ? '' : $('#txtIp').val();
		var pstrInstancia = $('#txtInstancia').val() == '' ? '' : $('#txtInstancia').val();
		var pstrMandante = $('#txtMandante').val() == '' ? '' : $('#txtMandante').val();
		var pstrSisSubSis = $('#txtSisSubSis').val() == '' ? '' : $('#txtSisSubSis').val();
		var pstrUsuario = $('#txtUsuario').val() == '' ? '' : $('#txtUsuario').val();
		var pstrContrasena = $('#txtContrasena').val() == '' ? '' : $('#txtContrasena').val();
		var pstrObservaciones = $('#txtObservaciones').val() == '' ? '' : $('#txtObservaciones').val();
// 		var piTeam = document.getElementById('hdIdTeam').value;

// 		alert('Enviando : ' + piIdOptions + ' || ' + pstrDescripcion);
		$.post(src, {strOperation : pOperacion, 
			iIdBancoClaves : piIdBancoClaves, 
			strCliente : pstrCliente,
			strServidor : pstrServidor,
			strIp : pstrIp,
			strInstancia : pstrInstancia,
			strMandante : pstrMandante,
			strSisSubSis : pstrSisSubSis,
			strUsuario : pstrUsuario,
			strContrasena : pstrContrasena,
			strObservaciones : pstrObservaciones,
			iTeam : vTeam},
				function(pdata) {
// 					alert(pdata);
					if(pdata == "ok"){
						listReport();
						$('#mdNuevo').modal('hide');
						$('#mdActualizar').modal('hide');
						$('#mdPregunta').modal('hide');
						
						$('#hdIdBancoClaves').text('0');
						$('#txtCliente').val('');
						$('#txtServidor').val('');
						$('#txtIp').val('');
						$('#txtInstancia').val('');
						$('#txtMandante').val('');
						$('#txtSisSubSis').val('');
						$('#txtUsuario').val('');
						$('#txtContrasena').val('');
						$('#txtObservaciones').val('');
						
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
		
		$('#hdIdBancoClaves').text('0');
		$('#txtCliente').val('');
		$('#txtServidor').val('');
		$('#txtIp').val('');
		$('#txtInstancia').val('');
		$('#txtMandante').val('');
		$('#txtSisSubSis').val('');
		$('#txtUsuario').val('');
		$('#txtContrasena').val('');
		$('#txtObservaciones').val('');
		$('#mdNuevo').modal('show');
	}
	
	function openModalUpdate(idBancoClaves,cliente,servidor,ip,instancia,mandante,sissubsis,usuario,contrasena,observaciones)
	{
		$(document).ready(function(){
// 			alert(idOptions + ' || ' + Descripcion);
			$('#btnActualizar').removeClass('hidden');
			$('#btnGuardar').removeClass('hidden');
			$('#btnGuardar').addClass('hidden');

			$('#mdNuevo').modal('show');
			$('#hdIdBancoClaves').text(idBancoClaves);
			$('#txtCliente').val(cliente);
			$('#txtServidor').val(servidor);
			$('#txtIp').val(ip);
			$('#txtInstancia').val(instancia);
			$('#txtMandante').val(mandante);
			$('#txtSisSubSis').val(sissubsis);
			$('#txtUsuario').val(usuario); 
			$('#txtContrasena').val(contrasena);
			$('#txtObservaciones').val(observaciones);
		});
	}
	
	function openModalDelete(idOptions)
	{
		$(document).ready(function(){
			$('#mdPregunta').modal('show');
			$('#hdIdBancoClaves').text(idOptions);
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
					columnDefs: [
				            {
				                "targets": [ 10 ],
				                "visible": false,
				                "searchable": false
				            }
				    ],
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