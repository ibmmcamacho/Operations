<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>


<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	Mantenimiento <small>Slider</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-th-large"></i> Mantenimiento</a></li>
	<li class="active">Slider</li>
</ol>
</section> <!-- Main content --> 
<section class="content"> <!-- top row -->
<div class="row">
	<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
		<div class="form-inline">
			<div class="form-group">
				<a class="btn btn-default btn-sm" onclick="openModalInsert()";>
				<i class="fa fa-file-text-o" aria-hidden="true"></i> Nuevo
				</a>
				
				<a class="btn btn-default btn-sm" onclick="listReport()">
				<i class="fa fa-refresh fa-lg aria-hidden="true"></i>
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
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> LISTA DE SLIDE</h3>
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
<!-- /.row (main row) --> 
</section><!-- /.content --> </aside>

</body>

<!-- Modal Insertar -->
<div class="modal fade" id="mdNuevo" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    	<div class="box box-widget widget-user" style="margin-bottom: 0px;">
        	<div class="widget-user-header bg-blue-gradient text-center">
                                                    	<h3 class="widget-user-username">SLIDER</h3>
            </div>
        <div class="widget-user-image img-responsive">
        	<canvas id="imgFoto1" class="img-circle img-lg"></canvas>
        </div>
        <div class="box-body">
        	<div class="row">
            	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<br/><br/>
                    <center>
                    <input type="hidden" id="hdidEmpleado1">
                    	<table class="">
							<tr>
								<td><label>Id</label></td>
								<td>
									<div class="input-group">
										<input id="txtIdSlide" type="text" class="form-control">
											<span class="input-group-addon">
											<span class="fa fa-id-badge"></span>
											</span>
									</div>
								</td>
							</tr>
							<tr><td><div class="user-padding"></div></td></tr>
							<tr>
								<td><label>Descripción</label></td>
								<td>
									<div class="input-group">
										<input id="txtDescripcion" type="text" class="form-control">
											<span class="input-group-addon">
											<span class="fa fa-user"></span>
											</span>
									</div>
								</td>
							</tr>
							<tr><td><div class="user-padding"></div></td></tr>
							<tr>
								<td><label>Imagen</label></td>
								<td>
									<div class="input-group">
										<input id="txtImage" type="file" class="form-control">
										<span class="input-group-addon">
											<span class="fa fa-file-image-o"></span>
										</span>
									</div>
								</td>
							</tr>
						</table>
					</center>
                  </div>
                 </div>
                </div>
                <div class="box-footer">
                	<div class="row">
                    	<div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
                        	<div class="form-inline">
								<div class="form-group">
									<a id="btnGuardar" onclick="accionesPersonal('save')" class="btn btn-primary btn-sm">
										<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar
									</a>
									<a id="btnActualizar" onclick="accionesPersonal('update')" class="btn btn-primary btn-sm">
										<i class="fa fa-floppy-o" aria-hidden="true"></i> Actualizar
									</a>
									<a role="button" class="btn btn-default btn-sm" data-dismiss="modal">
										<i class="fa fa-reply" aria-hidden="true"></i> Volver
									</a>
									<label id="lblMessageImg"></label>
								</div>
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
        <h4 class="modal-title">Mantenimiento de Slide</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        		<div class="form-group">
        			<label>¿Desea eliminar el Slide?</label>
        		</div>
        		<div class="form-inline">
        			<div class="form-group">
        				<a onclick="accionesPersonal('delete')" class="btn btn-danger btn-sm">
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


<script type="application/javascript">
	
	var vTeam = document.getElementById('hdIdTeam').value;
	listOptions('SLIDE',vTeam);
	
// 	showImage('resources/image/personal/default_avatar.jpg');
	
    function archivo(evt) {
        var files = evt.target.files;  
        for (var i = 0, f; f = files[i]; i++) {
          if (!f.type.match('image.*')) {
              continue;
          }
          if(f.size > 5242880) { //5 MB
	    	  alert('La imagen ingresada sobrepasa el tamaño permitido, por favor validar el peso del archivo que sea menor a 5 MB');
	    	  continue;
	       }
   
          var reader = new FileReader();
   
          reader.onload = (function(theFile) {
              return function(e) {
                showImage(e.target.result,1);
              };
          })(f);
   
          reader.readAsDataURL(f);
        }
    }
   
    document.getElementById('txtImage').addEventListener('change', archivo, false);
	
	function showImage(pimg,tipo)
	{
		var canvas = document.getElementById("imgFoto");
		var ctx = canvas.getContext("2d");
		
		var img = new Image();
		img.src = pimg;
	 	ctx.drawImage(img, 0, 0, 300,150);
// 		alert('showImage  ==> ' + pimg);
		img.onload = function(){
			ctx.drawImage(img, 0, 0, 300,150);
			}
		if(tipo == 1){
			updateImage(pimg);	
		}

	};
	
	
	function listReport()
	{
	$(document).ready(function() {
		
		var src = "ServletWOptions";
		$.post(src, {strOperation : 'listOptionsImage', iTeam : vTeam},
				function(pdata) {
//						alert(pdata);
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
						arr.push(obj.reporte[i].valor3);
						dataReporte.push(arr);
						}
					  
					  columnsReport = [ {title : "NRO"},
					    {title : "IDOPTION"}, 
			            {title : "DESCRIPCION"},
			            {title : "VALOR1"},
			            {title : "VALOR2"},
			            {
							"sName": "img",
							"title" : "Imagen", 
							"bSearchable": false,
							"sWidth": "100px",
							"bSortable": false,
							"mRender": function ( data, type, columns ) {									
								return '<img class="img" src="' + columns[5] + '">';
							}
						},
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
	
	
	function listImage(pstrIdEmpleado)
	{
// 		$(document).ajaxStart(function() { Pace.restart(); });
		$(document).ready(function() {
			
			var src = "ServletWOptions";
			$.post(src, {strOperation : 'listImage', strIdEmpleado : pstrIdEmpleado, iTeam : vTeam},
					function(pdata) {
// 	 				alert('listImage == >' + pdata);
					  var obj = JSON.parse(pdata);
					
					  showImage((obj.image == '' ? 'resources/image/personal/default_avatar.jpg' : obj.image),0);
			});
		});
	}
	
	function listOptions(tipo,team)
	{
		$(document).ready(function() {
		
		var src = "ServletWOptions";
		$.post(src, {strOperation : "listOptions", strType : tipo, iTeam : team},
				function(pdata) {
// 				alert(pdata);
				  var obj = JSON.parse(pdata);
				  
				  if(obj.reporte.length > 0){
	    				
							 if(tipo == "modalidad")
							 {
								  $('#cboModalidad1 option').remove();
								  $('#cboModalidad1').append($('<option>', {value: '0',text : 'Seleccionar'}));
								  
								  $.each(obj.reporte, function (i, item) {
									  $('#cboModalidad1').append($('<option>', { 
			  	    				        value: item.idOption,
			  	    				        text : item.descripcion
			  	    				    }));
								  });
							 }
							 else if(tipo == "area")
							 {
								  $('#cboArea1 option').remove();
								  $('#cboArea1').append($('<option>', {value: '0',text : 'Seleccionar'}));
								  
								  $.each(obj.reporte, function (i, item) {
									  $('#cboArea1').append($('<option>', { 
			  	    				        value: item.idOption,
			  	    				        text : item.descripcion
			  	    				    }));
								  });
							 }
							 else if(tipo == "cargo")
							 {
								  $('#cboCargo1 option').remove();
								  $('#cboCargo1').append($('<option>', {value: '0',text : 'Seleccionar'}));
								  
								  $.each(obj.reporte, function (i, item) {
									  $('#cboCargo1').append($('<option>', { 
			  	    				        value: item.idOption,
			  	    				        text : item.descripcion
			  	    				    }));
								  });
							 }
	    				}
		});
	});
	}
	
	
	function updateImage(pImage)
	{
// 		$(document).ajaxStart(function() { Pace.restart(); });
		$(document).ready(function() {
			
			var src = "ServletWPersonal";
			var pstrIdLogin = $('#txtIdLogin1').val() == '' ? '' : $('#txtIdLogin1').val();
			
			$.post(src, {strOperation : 'image', strIdLogin : pstrIdLogin, strPhoto : pImage, iTeam : vTeam},
					function(pdata) {
				if(pdata == "ok"){
					$('#lblMessageImg').text('Se actualizó la imagen de perfil');
				}
				else{
					$('#lblMessageImg').text('Hubo un problema al actualizar la imagen de perfil');
				}
			});
		});
	}
	
	function validar(){
		if($('#txtIdLogin1').val().trim() == ''){
			document.getElementById("txtIdLogin1").focus();
			return 1;
		}
		if($('#txtNombre1').val().trim() == ''){
			document.getElementById("txtNombre1").focus();
			return 1;
		}
		if($('#txtApPaterno1').val().trim() == ''){
			document.getElementById("txtApPaterno1").focus();
			return 1;
		}
		if($('#txtApMaterno1').val().trim() == ''){
			document.getElementById("txtApMaterno1").focus();
			return 1;
		}
		if($('#txtEmail1').val().trim() == ''){
			document.getElementById("txtEmail1").focus();
			return 1;
		}
		if($('#cboModalidad1').val() == '0'){
			document.getElementById("cboModalidad1").focus();
			return 1;
		}
		if($('#cboArea1').val() == '0'){
			document.getElementById("cboArea1").focus();
			return 1;
		}
		if($('#cboCargo1').val() == '0'){
			document.getElementById("cboCargo1").focus();
			return 1;
		}
		if($('#cboPerfil1').val() == '0'){
			document.getElementById("cboPerfil1").focus();
			return 1;
		}
		return 0;
	}
	
	function accionesPersonal(pOperacion)
	{
// 		$(document).ajaxStart(function() { Pace.restart(); });
		$(document).ready(function() {
		if(pOperacion != 'delete')
			var rvalidacion = validar();
		if(pOperacion != 'delete')
			if(rvalidacion == 1)
				return;

		var src = "ServletWPersonal";
		
// 		var pstrIdEmpleado = $('#hdidEmpleado1').val().trim(); // == '' ? '0' : $('#hdidEmpleado1').val();
// 		var pstrIdLogin = "" + document.getElementById('txtIdLogin1').value.toString(); //$('#txtIdLogin1').val().trim().toString(); // == '' ? '' : $('#txtIdLogin1').val();
// 		var pstrNombre = "" + $('#txtNombre1').val().trim().toString(); // == '' ? '' : $('#txtNombre1').val();
// 		var pstrApPaterno = "" + $('#txtApPaterno1').val().trim().toString();  // == '' ? '' : $('#txtApPaterno1').val();
// 		var pstrApMaterno = "" + $('#txtApMaterno1').val().trim().toString();  // == '' ? '' : $('#txtApMaterno1').val();
		
// 		var piModalidad = $('#cboModalidad1 option:selected').val().trim();  // == '0' ? '0' : $('#cboModalidad1 option:selected').val();
// 		var piArea = $('#cboArea1 option:selected').val().trim();  // == '0' ? '0' : $('#cboArea1 option:selected').val();
// 		var piCargo = $('#cboCargo1 option:selected').val().trim();   // == '0' ? '0' : $('#cboCargo1 option:selected').val();
// 		var piPerfil = $('#cboPerfil1 option:selected').val().trim();   // == '0' ? '0' : $('#cboPerfil1 option:selected').val();
// 		var pstrClave = $('#pwd1').val();
		
// 		var pstrUsuario = $('#smUsuario').text().trim().toString();
		
// 		alert(pstrIdEmpleado + ' | ' + $('#hdidEmpleado1').val() + '\n' +
// 			+ pstrIdLogin + ' | ' + $('#txtIdLogin1').val().trim() + '\n' +
// 			+ pstrNombre + ' | ' + $('#txtNombre1').val() + '\n' +
// 			+ pstrApPaterno + ' | ' + $('#txtApPaterno1').val() + '\n' +
// 			+ pstrApMaterno + ' | ' + $('#txtApMaterno1').val() + '\n' +
// 			+ piModalidad + ' | ' + $('#cboModalidad1 option:selected').val() + '\n' +
// 			+ piArea + ' | ' + $('#cboArea1 option:selected').val() + '\n' +
// 			+ piCargo + ' | ' + $('#cboCargo1 option:selected').val() + '\n' +
// 			+ piPerfil + ' | ' + $('#cboPerfil1 option:selected').val() + '\n' +
// 			+ pstrClave + ' | ' + $('#pwd1').val() + '\n' +
// 			+ pstrUsuario + ' | ' + $('#smUsuario').text());
		
		$.post(src, {
					strOperation : pOperacion, 
					strIdEmpleado : $('#hdidEmpleado1').val(), 
					strIdLogin : $('#txtIdLogin1').val().trim(), 
					strNombre : $('#txtNombre1').val(), 
					strApPaterno : $('#txtApPaterno1').val(),
					strApMaterno : $('#txtApMaterno1').val(), 
					strEmail : $('#txtEmail1').val(),
					iModalidad : $('#cboModalidad1 option:selected').val(), 
					iArea : $('#cboArea1 option:selected').val(), 
					iCargo : $('#cboCargo1 option:selected').val(), 
					iPerfil : $('#cboPerfil1 option:selected').val(), 
					strClave : $('#pwd1').val(), 
					iTeam : vTeam},
				function(pdata) {
// 					alert(pdata);
					if(pdata == "ok"){
						if(pOperacion == 'save'){
							if($('#txtIdLogin1').val().length > 4 && $('#txtIdLogin1').val().length < 11){
								showImage('http://w3.ibm.com/bluepages/photo/Photo.jsp?cnum=' + $('#txtIdLogin1').val() + '815',1);
							}
							else if($('#txtIdLogin1').val().length > 11){
								showImage('http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=' + $('#txtIdLogin1').val(),1);
							}
						}
						
						listReport();
						$('#mdNuevo').modal('hide');
						$('#mdPregunta').modal('hide');
						
						$('#hdidEmpleado1').val('');
						$('#txtIdLogin1').val('');
						$('#txtNombre1').val('');
						$('#txtApPaterno1').val('');
						$('#txtApMaterno1').val('');
						$('#txtEmail1').val('');
						$('#cboModalidad1').val('0');
						$('#cboArea1').val('0');
						$('#cboCargo1').val('0');
						$('#cboPerfil1').val('0');
						$('#pwd1').val('');
						$('#txtImage1').val('');
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
		$('#btnActualizar').removeClass('hidden');
		$('#btnActualizar').addClass('hidden');
		$('#btnGuardar').removeClass('hidden');
		$('#txtIdLogin1').attr('disabled', false);
		$('#txtImage1').attr('disabled', true);
		
		$('#hdidEmpleado1').val('0');
		$('#txtIdLogin1').val('');
		$('#txtNombre1').val('');
		$('#txtApPaterno1').val('');
		$('#txtApMaterno1').val('');
		$('#txtEmail1').val('');
		$('#cboModalidad1').val('0');
		$('#cboArea1').val('0');
		$('#cboCargo1').val('0');
		$('#cboPerfil1').val('0');
		showImage('resources/image/personal/default_avatar.jpg',0);
// 		$('#imgFoto1').attr('src','resources/image/personal/default_avatar.jpg');
		
		$('#mdNuevo').modal('show');
		$('#lblMessageImg').text('');
	}
	
	function openModalUpdate(pstrIdEmpleado,pstrIdLogin,pstrPersonal,pstrApPaterno,pstrApMaterno,pstrEmail,piModalidad,piArea,piCargo,piPerfil,pstrFoto)
	{
		$(document).ready(function(){
			//alert(pstrIdEmpleado + ' || ' + pstrPersonal + ' || ' + pstrApPaterno + ' || ' + pstrApMaterno + ' || ' + pstrEmail + ' || ' + piModalidad + ' || ' + piArea + ' || ' + piCargo + ' || ' + piPerfil);
			$('#btnActualizar').removeClass('hidden');
			$('#btnGuardar').removeClass('hidden');
			$('#btnGuardar').addClass('hidden');
			
			$('#mdNuevo').modal('show');
			
			$('#txtIdLogin1').prop('disabled', true);
			$('#txtImage1').prop('disabled', false);
			$('#hdidEmpleado1').val(pstrIdEmpleado);
			$('#txtIdLogin1').val(pstrIdLogin);
			$('#txtNombre1').val(pstrPersonal);
			$('#txtApPaterno1').val(pstrApPaterno);
			$('#txtApMaterno1').val(pstrApMaterno);
			$('#txtEmail1').val(pstrEmail);
			$('#cboModalidad1').val(piModalidad);
			$('#cboArea1').val(piArea);
			$('#cboCargo1').val(piCargo);
			$('#cboPerfil1').val(piPerfil);
			listImage(pstrIdEmpleado);
			$('#lblMessageImg').text('');
		});
	}
	
	function openModalDelete(idPersonal, strIdLogin)
	{
		$(document).ready(function(){
			$('#mdPregunta').modal('show');
			$('#hdidEmpleado1').val(idPersonal);
			$('#txtIdLogin1').val(strIdLogin);
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
						search : '<i class="fa fa-search fa-lg"/>',
						searchPlaceholder : "Buscar..."
					},
					serverSide : false,
					data : pdataReporte,
					columns : pcolumnsReport,
					columnDefs: [
									{
						                "targets": [ 11 ],
						                "visible": false,
						                "searchable": false
						            },
						            {
						                "targets": [ 12 ],
						                "visible": false,
						                "searchable": false
						            },
						            {
						                "targets": [ 13 ],
						                "visible": false,
						                "searchable": false
						            },
						            {
						                "targets": [ 14 ],
						                "visible": false,
						                "searchable": false
						            },
						            {
						                "targets": [ 15 ],
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