<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

<!-- ClockPicker CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/clockpicker/css/bootstrap-clockpicker.min.css">

<!-- ClockPicker JS -->
<script src="<%=request.getContextPath()%>/resources/clockpicker/js/bootstrap-clockpicker.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

<aside class="right-side"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	Mantenimiento <small>Personals</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-th-large"></i> Mantenimiento</a></li>
	<li class="active">Personals</li>
</ol>
</section> <!-- Main content --> 
<section class="content"> <!-- top row -->
<div class="row">
	<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
		<div class="form-inline">
			<div class="form-group">
				<a class="btn btn-default btn-sm" onclick="openModalInsert()">
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
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> LISTA DE PERSONAL</h3>
			</div>
			<div class="box-body">
				<label id="lblMessage" class="label label-info"></label>
					<div id="tbcontainer" class="table-responsive">
					</div>
			</div>
		</div>
	</div>
</div>
</section><!-- /.content --> 
</aside>
</body>

<!-- Modal Insertar -->
<div class="modal fade" id="mdNuevo" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    	<div class="box box-widget widget-user" style="margin-bottom: 0px;">
        	<div class="widget-user-header bg-blue-gradient text-center">
                                                    	<h3 class="widget-user-username">USUARIO</h3>
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
								<td><label>Id Entrada</label></td>
								<td>
									<div class="input-group">
										<input id="txtIdLogin1" type="text" class="form-control">
											<span class="input-group-addon">
											<span class="fa fa-id-badge"></span>
											</span>
									</div>
								</td>
							</tr>
							<tr><td><div class="user-padding"></div></td></tr>
							<tr>
								<td><label>Nombre</label></td>
								<td>
									<div class="input-group">
										<input id="txtNombre1" type="text" class="form-control">
											<span class="input-group-addon">
											<span class="fa fa-user"></span>
											</span>
									</div>
								</td>
							</tr>
							<tr><td><div class="user-padding"></div></td></tr>
							<tr><td><label>Apellido Paterno</label></td>
								<td>
									<div class="input-group">
										<input id="txtApPaterno1" type="text" class="form-control">
										<span class="input-group-addon">
										<span class="fa fa-user-o"></span>
										</span>
									</div>
								</td>
							</tr>
							<tr><td><div class="user-padding"></div></td></tr>
							<tr>
								<td><label>Apellido Materno</label></td>
								<td>
									<div class="input-group">
										<input id="txtApMaterno1" type="text" class="form-control">
										<span class="input-group-addon">
										<span class="fa fa-user-o"></span>
										</span>
									</div>
								</td>
							</tr>
							<tr><td><div class="user-padding"></div></td></tr>
							<tr>
								<td><label>Email</label></td>
								<td>
									<div class="input-group">
										<input id="txtEmail1" type="text" class="form-control">
										<span class="input-group-addon">
										<span class="fa fa-user-o"></span>
										</span>
									</div>
								</td>
							</tr>
							<tr><td><div class="user-padding"></div></td></tr>
							<tr>
								<td><label>Modalidad</label></td><td>
									<div class="input-group">
										<select id="cboModalidad1" class="form-control"></select>
										<span class="input-group-addon">
										<span class="fa fa-th-list"></span>
										</span>
									</div>
								</td>
							</tr>
							<tr><td><div class="user-padding"></div></td></tr>
							<tr>
								<td><label>Area</label></td>
								<td>
									<div class="input-group">
										<select id="cboArea1" class="form-control"></select>
										<span class="input-group-addon">
										<span class="fa fa-th-list"></span>
										</span>
									</div>
								</td>
							</tr>
							<tr><td><div class="user-padding"></div></td></tr>
							<tr>
								<td><label>Cargo</label></td>
								<td>
									<div class="input-group">
										<select id="cboCargo1" class="form-control"></select>
										<span class="input-group-addon">
											<span class="fa fa-th-list"></span>
										</span>
									</div>
								</td>
							</tr>
							<tr><td><div class="user-padding"></div></td></tr>
							<tr>
								<td><label>Perfil</label></td>
								<td>
									<div class="input-group">
										<select id="cboPerfil1" class="form-control"></select>
										<span class="input-group-addon">
											<span class="fa fa-th-list"></span>
										</span>
									</div>									
								</td>
							</tr>
							<tr><td><div class="user-padding"></div></td></tr>
							<tr>
								<td><label>Imagen</label></td>
								<td>
									<div class="input-group">
										<input id="txtImage1" type="file" class="form-control">
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

<!-- Modal Cambio de Clave -->
<div class="modal fade" id="mdChangePwd" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4  class="modal-title">Cambiar Clave</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        	<input type="hidden" id="hdIdPersonal2">  
        		<div class="form-group">
        			<label>Nuevo Password</label>
        			<input id="txtPwd1" type="password" class="form-control" onkeyup="validarTxtPwd()"/>
        		</div>
        		<div class="form-group">
        			<label id="mensaje">Confirmar Password</label>
        			<input id="txtPwd2" type="password" class="form-control" onkeyup="validarTxtPwd()"/>
        		</div>
        		<div class="form-inline">
        			<div class="form-group">
        				<a id="btnupdatePassword" onclick="accionesPersonal('updatePassword')" class="btn btn-danger btn-sm">
		        			<i class="fa fa-floppy-o" aria-hidden="true"></i> CAMBIAR
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
        <h4 class="modal-title">Mantenimiento de Personal</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        		<div class="form-group">
        			<label>¿Desea dar de baja al empleado?</label>
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



<!-- Modal Pregunta estado1-->
<div class="modal fade" id="mdPreguntaestado1" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Mantenimiento de Personal</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        		<div class="form-group">
        			<label>¿Desea activar al empleado?</label>
        		</div>
        		<div class="form-inline">
        			<div class="form-group">
        				<a onclick="cambiarestado1()" class="btn btn-primary btn-sm">
		        			<i class="fa fa-check" aria-hidden="true"></i> Activar
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
	listReport();
	listPerfil();
	listOptions('modalidad',vTeam);
	listOptions('cargo',vTeam);
	listOptions('area',vTeam);	
	
	
// 	showImage('resources/image/personal/default_avatar.jpg');
	
    function archivo(evt) {
        var files = evt.target.files;  
        for (var i = 0, f; f = files[i]; i++) {
          if (!f.type.match('image.*')) {
              continue;
          }
          if(f.size > 304128) {
	    	  alert('La imagen ingresada sobrepasa el tamaño permitido, por favor validar el tamaño que sea menor a 300 KB');
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
   
    document.getElementById('txtImage1').addEventListener('change', archivo, false);
	
	function showImage(pimg,tipo)
	{
		var canvas = document.getElementById("imgFoto1");
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
	
	$(document).ready(function() {
		$('.clockpicker').clockpicker({
			'default': 'now',
			placement: 'bottom',
		    align: 'left',
		    autoclose: true
		});
		
		$('#txtIdLogin1').keyup(function(){
// 			alert($(this).val().length);
			if($(this).val().length > 4 && $(this).val().length < 11){
// 				showImage('http://w3.ibm.com/bluepages/photo/Photo.jsp?cnum=' + $(this).val() + '815',0);
				showImage('http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?cnum=' + $(this).val() + '815',0);
			}
			else if($(this).val().length > 11){
				showImage('http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=' + $(this).val(),0);
			}
		});
	});
	
	function listReport()
	{
		$(document).ajaxStart(function() { Pace.restart(); });
		$(document).ready(function() {
			
			var src = "ServletWPersonal";
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
							arr.push(obj.reporte[i].nombre);
							arr.push(obj.reporte[i].apPaterno);
							arr.push(obj.reporte[i].apMaterno);
							arr.push(obj.reporte[i].email);
							arr.push(obj.reporte[i].modalidad);
							arr.push(obj.reporte[i].area);
							arr.push(obj.reporte[i].cargo);
							arr.push(obj.reporte[i].perfil);
							arr.push(obj.reporte[i].estado);
							
							arr.push(obj.reporte[i].idPersonal);
							arr.push(obj.reporte[i].idModalidad);
							arr.push(obj.reporte[i].idArea);
							arr.push(obj.reporte[i].idCargo);
							arr.push(obj.reporte[i].idPerfil);
							
							dataReporte.push(arr);
							}
						  
						  columnsReport = [ {title : "NRO"},
				            {title : "IDLOGIN"},
				            {title : "NOMBRE"},
				            {title : "AP_PATERNO"},
				            {title : "AP_MATERNO"},
				            {title : "EMAIL"},
				            {title : "MODALIDAD"},
				            {title : "AREA"},
				            {title : "CARGO"},
				            {title : "PERFIL"},
				            {title : "ESTADO"},
				            {title : "IDEMPLEADO"},//11
				            {title : "IDMODALIDAD"},
				            {title : "IDAREA"},
				            {title : "IDCARGO"},
				            {title : "IDPERFIL"},
				            {
				            	"sName" : "editarbtn",
				            	"sWidth" : "170px",
								"title" : "ACCION",
								"bSearchable" : false,
								"bSortable" : false,
								"mRender" : function( data, type, columns ) {
									
									
						if(columns[10].trim() == 'ACTIVO'){							
							
									return '<a title="Password" class="btn btn-primary btn-sm" onclick="openModalUpdatePassword(\'' + columns[11] + '\')"><i class="fa fa-key" aria-hidden="true"></i></a>&nbsp;' + 
										   '<a title="Editar" class="btn btn-primary btn-sm" onclick="openModalUpdate(\'' + columns[11] + '\',\'' + columns[1] + '\',\'' + columns[2] + '\',\'' + columns[3] + '\',\'' + columns[4] + '\',\'' + columns[5] + '\',\'' + columns[12] + '\',\'' + columns[13] + '\',\'' + columns[14] + '\',\'' + columns[15] + '\')"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>&nbsp;' + 
										   '<a title="Eliminar" class="btn btn-danger btn-sm" onclick="openModalDelete(\'' + columns[11] + '\',\'' + columns[1] + '\')"><i class="fa fa-trash-o" aria-hidden="true"></i></a>';								
								
						}else{
							
							return '<a title="Activar" class="btn btn-primary btn-sm" onclick="openModalEstado1(\'' + columns[11] + '\')"><i class="fa fa-check"  aria-hidden="true"></i></a>&nbsp;' ;
							
						}
						
						
						
						
								}								
							}
				          ];
					    setData(dataReporte,columnsReport);
					    $('#lblMessageImg').text('');
			});
			
		});
	}
	
	function listPerfil()
	{
	$(document).ready(function() {
		
		var src = "ServletWPerfil";
		$.post(src, {strOperation : 'listPerfil', iTeam : vTeam},
				function(pdata) {
// 				alert(pdata);
				  var obj = JSON.parse(pdata);
					  
					$('#cboPerfil1 option').remove();
					$('#cboPerfil1').append($('<option>', {value: '0',text : 'Seleccionar'}));
					
					if(obj.reporte.length > 0){
  	    				$.each(obj.reporte, function (i, item) {
  	    				    $('#cboPerfil1').append($('<option>', { 
  	    				        value: item.idPerfil,
  	    				        text : item.descripcion
  	    				    }));
  	    				});
      				}
      				else
      				{
      					$('#cboPerfil1').append($('<option>', { 
	    				    value: '0',
	    				    text : 'Seleccionar'
	    				}));
      				}
		});
	});
	}
	
	function listImage(pstrIdEmpleado)
	{
// 		$(document).ajaxStart(function() { Pace.restart(); });
		$(document).ready(function() {
			
			var src = "ServletWPersonal";
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
		  if(pOperacion != 'delete' && pOperacion != 'updatePassword')
			  var rvalidacion = validar();		
		  if(pOperacion != 'delete' && pOperacion != 'updatePassword')
			  if(rvalidacion == 1)
				return;		
		
		var src = "ServletWPersonal";
		
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
					strClave : $('#txtPwd1').val(), 
					iTeam : vTeam},
				function(pdata) {
// 					alert(pdata);					
					if(pdata == "ok"){
						if(pOperacion == 'save'){
							if($('#txtIdLogin1').val().length > 4 && $('#txtIdLogin1').val().length < 11){
// 								showImage('http://w3.ibm.com/bluepages/photo/Photo.jsp?cnum=' + $('#txtIdLogin1').val() + '815',1);
								showImage('http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?cnum=' + $('#txtIdLogin1').val() + '815',1);
							}
							else if($('#txtIdLogin1').val().length > 11){
								showImage('http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=' + $('#txtIdLogin1').val(),1);
							}
						}
						listReport();
						$('#mdNuevo').modal('hide');
						$('#mdPregunta').modal('hide');
						$('#mdChangePwd').modal('hide');
						
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
						$('#txtPwd1').val('');
						$('#txtPwd2').val('');						
						$('#txtImage1').val('');
// 						alert('Estado actual de los controles: HD1: ' + $('#hdIdPerfil1').text() + ' || HD2: ' + $('#hdIdPerfil2').text() + ' || TXT1: ' + $('#txtNombrePerfil1').val() + ' || TXT2: ' + $('#txtNombrePerfil2').val());
					}
					else{
						$('#lblMessage').text('Hubo un problema al procesar, no se actualizó, por favor vuelva a intentarlo.');
					}
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
	
		if(typeof tableReporte === 'undefined') 
	    {
	    
		var tableReporte = $('#tblReportes').DataTable(
				{
					processing : false,
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
	    // how to change the data contained inside datatable?
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
	}
	
	
	function openModalUpdatePassword(idEmpleado)
	{	   
		$(document).ready(function(){
			$('#mdChangePwd').modal('show');	
			$('#hdidEmpleado1').val(idEmpleado);
			$('#txtPwd1').val('');
			$('#txtPwd2').val('');			
			$('#btnupdatePassword').addClass("disabled");	
			document.getElementById("txtPwd1").style.borderColor = "initial";
			document.getElementById("txtPwd2").style.borderColor = "initial";	
		});	    
	}		
	
	function validarTxtPwd()
	{
		var pwd1 = document.getElementById('txtPwd1').value;
		var pwd2 = document.getElementById('txtPwd2').value;
		
		if(pwd1 == '' || pwd2 == ''){
			$('#btnupdatePassword').addClass("disabled");	
			document.getElementById("txtPwd1").style.borderColor = "initial";
			document.getElementById("txtPwd2").style.borderColor = "initial";		
		}
		else{	
			if(pwd1 == pwd2){
				document.getElementById("txtPwd1").style.borderColor = "green";
				document.getElementById("txtPwd2").style.borderColor = "green";				
				$('#btnupdatePassword').removeClass("disabled");
			}else {		
				document.getElementById("txtPwd1").style.borderColor = "red";
				document.getElementById("txtPwd2").style.borderColor = "red";
				$('#btnupdatePassword').addClass("disabled");
			}
		}
	}
	
	var vIDEMPLEADO;
	function openModalEstado1(idempleado){
		$('#mdPreguntaestado1').modal('show');
		vIDEMPLEADO =idempleado ;
	
	}
	
	function cambiarestado1(){
		
			
		$(document).ready(function() {	 		
			var src = "ServletWPersonal";
			$.post(src, {strOperation : "CambiarEstado1",idempleado: vIDEMPLEADO}
						 
				  );			
			
		}); 
		$('#mdPreguntaestado1').modal('hide');
		setTimeout(function(){listReport();}, 500);
		 
	}
	
	
	
</script>

</html>