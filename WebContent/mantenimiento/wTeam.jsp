<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
		<head>
		
		</head>

<body>
	<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
		     	<section class="content-header">
						<h1>
							Mantenimiento <small>Team</small>
						</h1>
						
						<ol class="breadcrumb">
									<li><a href="#"><i class="fa fa-th-large"></i> Mantenimiento</a></li>
									<li class="active">Team</li>
						</ol>
				</section> 
				
				<!-- Main content -->
				<section class="content"> <!-- top row -->
						<div class="row">
							<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
								<div class="form-inline">
											<div class="form-group">
												<a class="btn btn-default btn-sm" href="#" onclick="openModalNuevoPerfilDet()" id ="btnNuevo" style="display : none">
													<i class="fa fa-file-text-o" aria-hidden="true"></i> Nuevo
												</a>
													
												
											</div>
											
											
											<!-- COMBO PERFIL -->
											<div class="form-group">
												<span>Opciones</span>
													<select id="cboPerfil" class="form-control input-sm">
														<option > Seleccionar </option>
													</select>
													<span id="dvValidacionComboPerfil" class="hidden" style="color:red;">*</span>
											</div>
																		
											&nbsp;&nbsp;
																			
											<div class="form-group">
												<a id="btnConsultar" onclick="listReportPerfilDet(); mostrar()" class="btn btn-primary btn-sm">Consultar</a>
											</div>
								</div>
							</div>
						</div>
						<br/>

				
				
						<div class="row">
							<div class="col-lg-12 connectedSortable">
								<div class="box box-primary">
									<div class="box-header with-border">
										<h3 class="box-title"> <i class="fa fa-user" aria-hidden="true"></i> REPORTE PERFILES DETALLES</h3>
									</div>
									<div class="box-body">
										<div id="tbcontainerPerfilDet" class="table-responsive">
											Aquí podrás obtener toda la información que necesitas sobre las Perfiles y sus Detalles. 
										</div>
									</div>
								</div>
							</div>
						</div>
				
<!-- /.row -->
 <!-- Main row -->
<div class="row"></div>
<!-- /.row (main row) --> 



		</section><!-- /.content -->
 	</aside>
</body>


<!-- Modal Insertar -->

<div class="modal fade" id="mdNuevoTeam" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content" >
      <div class="modal-header" align ="center">
        <h4 class="modal-title">MANTENIMIENTO DE PERFILES DETALLE</h4>
      </div>
      <div class="modal-body"  >
        <div class="row" align="center" >
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="left">
        		<input type="hidden" id="hdIdPerfilDet">
        		<form data-toggle="validator" role="form">

        		<div class="form-group">
        			 <label for="txtDescripcion1" class="control-label">Descripcion:</label>    			
        			<input type="text" class="form-control" id="txtDescripcion1" placeholder="Descripcion" onkeyup="validarformulario()" required autofocus>
        		</div>
        		 <div class="help-block with-errors"></div>
        		
        		<div class="form-group">        				    
        			 <label for="txtDescripcion1" class="control-label">Url:</label>    			
        			<input type="text" class="form-control" id="txtUrl" placeholder="Url" onkeyup="validarformulario()" required>
        		</div>
        		 <div class="help-block with-errors"></div>
        		
        		<div class="form-group">        				    
        			 <label for="txtIconIzq" class="control-label">IconIzq:</label>    			
        			<input type="text" class="form-control" id="txtIconIzq" placeholder="IconoIzquierda" >
        		</div>
        		 <div class="help-block with-errors"></div>
        		
        		<div class="form-group">        				    
        			 <label for="txtIconDer" class="control-label">IconDer:</label>    			
        			<input type="text" class="form-control" id="txtIconDer" placeholder="IconoDerecha" >
        		</div>
        		 <div class="help-block with-errors"></div>
        		
        		<div class="form-group">        				    
        			 <label for="txtNivel" class="control-label">Nivel:</label>    			
        			<input type="text" class="form-control" id="txtNivel" placeholder="Nivel" onkeyup="validarformulario()" required>
        		</div>
        		 <div class="help-block with-errors"></div>
        		
        		<div class="form-group">        				    
        			 <label for="txtOrden" class="control-label">Orden:</label>         			    			
        			<input type="number" class="form-control" id="txtOrden" placeholder="Orden" min="1" maxlength="9" onkeyup="validarformulario()" onkeypress="return validarOrden(event)"  required>
        			
        		</div>
        		 <div class="help-block with-errors"></div>
        		<br>
        		
        		<div class="form-inline">
        			<div class="form-group">
        				<div class="form-group">
    						<a class="btn btn-primary" id="btnGuardarFormulario" >
    						<i class="fa fa-floppy-o" aria-hidden="true"></i> Agregar</a>
  						</div>
  						<div class="form-group">
    						<a class="btn btn-primary" id="btnActualizarFormulario" >
    						<i class="fa fa-floppy-o" aria-hidden="true"></i> Actualizar</a>
  						</div>
		        		<a role="button" class="btn btn-default btn-sm" data-dismiss="modal">
		        			<i class="fa fa-reply" aria-hidden="true"></i> Volver
		        		</a>
        			</div>
        		</div>
        		</form>
        	</div>
        </div>
      </div>
    </div>
  </div>
</div>
  
  
  <!-- Modal Pregunta -->
<div class="modal fade" id="mdPreguntaPerfilDet" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Mantenimiento de Perfil Detalle</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        		<div class="form-group">
        			<label>¿Desea eliminar este registro?</label>
        		</div>
        		<div class="form-inline">
        			<div class="form-group">
        				<a onclick="accionesPerfilDet('delete')" class="btn btn-danger btn-sm">
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

listPerfil();
listPerfilDet();


	/* function mostrar(dato) {
		  if (dato == "1") {
		    document.getElementById("combo").style.display = "block";
		    document.getElementById("descripcion").style.display = "none";		    
		  }
		  if (dato == "2") {
		    document.getElementById("combo").style.display = "none";
		    document.getElementById("descripcion").style.display = "block";		    
		  } 	
	} */
	
	var vTeam = document.getElementById('hdIdTeam').value;
	
	 
	/* COMBO PARA ELEGIR EL PERFILDET */
	
	function listPerfil()	{
		$(document).ready(function() {
			var src = "ServletWPerfil";
			$.post(src, {strOperation : 'listPerfil', iTeam : vTeam},
					function(pdata) {
					  var obj = JSON.parse(pdata);						
						$('#cboPerfil option').remove();						
						if(obj.reporte.length > 0){
							$('#cboPerfil').append($('<option>', {value: '',text : 'Seleccionar'}));
							
			    				$.each(obj.reporte, function (i, item) {
			    				    $('#cboPerfil').append($('<option>', { 
			    				        value: item.idPerfil,
			    				        text : item.descripcion			    				    
			    				    }));
			    				});	
			    				
			    				
		  				}else{
		  					$('#cboPerfil').append($('<option>', { 
		    				    value: '0',
		    				    text : 'Seleccionar'
		    				}));
		  				}
					});
		});
	}
	
	
	
	/* COMBO PARA CREAR NUEVO PERFILDETALLE */
	
	 function listPerfilDet()	{
		$(document).ready(function() {
			var src = "ServletWPerfilDet";
			$.post(src, {strOperation : 'listComboPerfilDet', IdPerfil : document.getElementById('cboPerfil').value},
					function(pdata) {
					  var obj = JSON.parse(pdata);						
						$('#cboPerfilDet option').remove();						
						if(obj.reporte.length > 0){
							$('#cboPerfilDet').append($('<option>', {value: '0',text : 'Seleccionar'}));
			    				$.each(obj.reporte, function (i, item) {
			    				    $('#cboPerfilDet').append($('<option>', { 
			    				        value: item.idPerfilDet,
			    				        text : item.descripcion			    				    
			    				    }));
			    				});			    				
		  				}else{
		  					$('#cboPerfilDet').append($('<option>', { 
		    				    value: '0',
		    				    text : 'Seleccionar'
		    				}));
		  				}
					});
		});
	}
	 
	
	
	
	
	
	/* COMBO PARA LISTAR TABLA */

function listReportPerfilDet(){	
	   // var  cboPerfil = document.getElementById('cboPerfil').value  ;
		//alert(""+cboPerfil);<
		
		$(document).ready(function(){
			
			var src = "ServletWPerfilDet";
			if(document.getElementById('cboPerfil').value > 0){
				$('#dvValidacionComboPerfil').removeClass('hidden');
				$('#dvValidacionComboPerfil').addClass('hidden');

			$.post(src, {
				strOperation : 'listReporterPerfilDet', IdPerfil : document.getElementById('cboPerfil').value
			},
				function(pdata) {
					var obj = JSON.parse(pdata);
					
					var dataReporte = [];
					var columnsReporte = [];
					
						for(i = 0; i < obj.ListaReportePerfilDet.length ; i++){
							var arr = [];
							arr.push(i+1);
							arr.push(obj.ListaReportePerfilDet[i].IdPerfilDet);
							arr.push(obj.ListaReportePerfilDet[i].Descripcion);
							arr.push(obj.ListaReportePerfilDet[i].Url);
							arr.push(obj.ListaReportePerfilDet[i].IconIzq);
							arr.push(obj.ListaReportePerfilDet[i].IconDer);
							arr.push(obj.ListaReportePerfilDet[i].Nivel);
							arr.push(obj.ListaReportePerfilDet[i].Orden);
							dataReporte.push(arr);							
						}
						
						
						columnsReporte=[
							{title : "NRO"},
							{title : "IdPerfilDet"}, 
				            {title : "Descripcion"},
				            {title : "Url"},
				            {title : "IconIzq"},
				            {title : "IconDer"},
				            {title : "Nivel"},
				            {title : "Orden"},
				            {
								"sName": "editarbtn",
								"title" : "Acciones", 
								"bSearchable": false,
								"sWidth": "100px",
								"bSortable": false,
								"mRender": function ( data, type, columns ) {									
									return '<a title="Editar" class="btn btn-primary btn-sm" onclick="openModalUpdatePerfilDet(\'' + columns[1] + '\',\'' + columns[2] + '\',\'' + columns[3] + '\',\'' + columns[4] + '\',\'' + columns[5] + '\',\'' + columns[6] + '\',\'' + columns[7] + '\')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>&nbsp;&nbsp;' + 
										   '<a title="Eliminar" class="btn btn-danger btn-sm" onclick="openModalDeletePerfilDet(\'' + columns[1] + '\')"><i class="fa fa-trash-o" aria-hidden="true"></i></a>';
								}
							}
						];
						setDataPerfilDet(dataReporte, columnsReporte);					
				});
			}
			else{
				$('#dvValidacionComboPerfil').removeClass('hidden');
				
			}
			
		});		
	} 
	

var htmlTablePerfilDet = '<table id=\"tblReportePerfilDet\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';


	/* SETDATA PARA EL PERFILDET */
	
	function setDataPerfilDet(pdataReporte, pcolumnsReporte){	
		
		document.getElementById('tbcontainerPerfilDet').innerHTML = htmlTablePerfilDet;	
		
		if(typeof tableReporte === 'undefined'){
	    
		var tableReporte = $('#tblReportePerfilDet').DataTable(
				{
					processing : false,
					serverSide : false,
					data: pdataReporte,
					columns: pcolumnsReporte,
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
		
	    }
	    else {
	        console.log('in else');	   
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
	}
	
	
	
	
	function accionesPerfilDet(pOperacion)
	{
		$(document).ready(function() {	
		
			var src = "ServletWPerfilDet";
			var piIdPerfilDet = $('#hdIdPerfilDet').text() == '' ? 0 : $('#hdIdPerfilDet').text();
			var pstrDescripcion = $('#txtDescripcion1').val() == '' ? '' : $('#txtDescripcion1').val();
			var purl = document.getElementById('txtUrl').value;
			var piconizq = document.getElementById('txtIconIzq').value;
			var piconder = document.getElementById('txtIconDer').value;
			var pnivel = document.getElementById('txtNivel').value;
			var porden = document.getElementById('txtOrden').value == '' ? '0' : document.getElementById('txtOrden').value;				
			var pIdPerfil = document.getElementById('cboPerfil').value;
		


			$.post(src, {strOperation : pOperacion, 
						 iIdPerfilDet : piIdPerfilDet,
						 strDescripcion : pstrDescripcion,
						 url : purl,
						 iconizq : piconizq,
						 iconder : piconder,
						 nivel : pnivel,
						 orden : porden,
						 IdPerfil : document.getElementById('cboPerfil').value},	
						 
					function(pdata) {

						if(pdata == "ok"){
							listReportPerfilDet();
							$('#mdNuevoTeam').modal('hide');
							$('#mdActualizar').modal('hide');
							$('#mdPreguntaPerfilDet').modal('hide');
							
							$('#hdIdPerfilDet').text('');
							$('#txtDescripcion1').val('');
							$('#txtUrl').val('');
							$('#txtIconIzq').val('');
							$('#txtIconDer').val('');
							$('#txtNivel').val('');
							$('#txtOrden').val('0');
							listPerfilDet();
						}
						else
							$('#lblMessage').text('Hubo un problema al procesar, no se actualizó, por favor vuelva a intentarlo.');
			});
			
		});
		}


	
	

	$("#cboPerfil").change(function mostrar(){
	
	if(document.getElementById('cboPerfil').value > 0){
		document.getElementById('btnNuevo').style='block';
	}else {
		
		document.getElementById('btnNuevo').style='display : none';
			}

	});

	
	
	
	$("#btnGuardarFormulario").click(function () {
		validarformulario();
		accionesPerfilDet('save');		
    });
	
	$("#btnActualizarFormulario").click(function () {
		validarformulario();
		accionesPerfilDet('update');		
    });
	

function validarformulario(){
	
	  var text1 = document.getElementById("txtDescripcion1");
	  var text2 = document.getElementById("txtUrl");
	  var text3 = document.getElementById("txtNivel");
	  var text4 = document.getElementById("txtOrden");
	
	  if(text1.value != "" && text2.value != "" && text3.value != "" && text4.value >= "1"){
	      $('#btnActualizarFormulario').removeClass('disabled');
	      $('#btnGuardarFormulario').removeClass('disabled');
	      
	     
	    
	  }else{
		  $('#btnActualizarFormulario').removeClass('disabled');
		  $('#btnActualizarFormulario').addClass('disabled');
		  $('#btnGuardarFormulario').removeClass('disabled');
		  $('#btnGuardarFormulario').addClass('disabled');
		  
	  }
	}
	

function validarOrden(e) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla==8) return true; //Tecla de retroceso (para poder borrar)
    patron = /\d/; //Solo acepta números
    te = String.fromCharCode(tecla);
    return patron.test(te); 
} 




function openModalUpdatePerfilDet(idPerfilDet,Descripcion,Url,IconIzq,IconDer,Nivel,Orden)
{
	$(document).ready(function(){
//			alert(idOptions + ' || ' + Descripcion);
	 	$('#btnActualizarFormulario').removeClass('hidden');
		$('#btnGuardarFormulario').removeClass('hidden');
		$('#btnGuardarFormulario').addClass('hidden'); 

		$('#mdNuevoTeam').modal('show');
		$('#hdIdPerfilDet').text(idPerfilDet);
		$('#txtDescripcion1').val(Descripcion);
		$('#txtUrl').val(Url);	
		$('#txtIconIzq').val(IconIzq);
		$('#txtIconDer').val(IconDer);
		$('#txtNivel').val(Nivel);
		$('#txtOrden').val(Orden);
		validarformulario();
	});
}


function openModalNuevoPerfilDet(){
		
		$("#txtDescripcion1").focus();
	 	$('#btnActualizarFormulario').removeClass('hidden');
		$('#btnActualizarFormulario').addClass('hidden');
		$('#btnGuardarFormulario').removeClass('hidden');	 
		
		$('#mdNuevoTeam').modal('show');
		$('#hdIdPerfilDet').text('');
		$('#txtDescripcion1').val('');
		$('#txtUrl').val('');
		$('#txtIconIzq').val('');
		$('#txtIconDer').val('');
		$('#txtNivel').val('');
		$('#txtOrden').val('0');
		validarformulario();
		
	}

function openModalDeletePerfilDet(idPerfilDet)
{
	$(document).ready(function(){
		$('#mdPreguntaPerfilDet').modal('show');
		$('#hdIdPerfilDet').text(idPerfilDet);
	});
}
	
	</script>
</html>





