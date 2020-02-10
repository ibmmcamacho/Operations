<%@page import="com.pe.ibm.bean.BeanSession"%>
<%
	BeanSession objBeanSessionCHeader = new BeanSession();
	objBeanSessionCHeader = (BeanSession) session.getAttribute("usuarioLogin");		
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
  <head>
<!--      <meta charset="UTF-8">  -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SCHEDULE  | CROSS</title>
    </head>
    <body>
    
    <!-- Modal  Cargando pagina-->
		<div class="modal js-loading-bar">
		 <div class="modal-dialog">
		   <div class="modal-content">
		   
		     <div class="modal-body">
		     <h3>Cargando ...</h3>
		       <div class="progress progress-striped active">
		  <div class="progress-bar" role="progressbar"
		       aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"
		       style="width: 100%">
		  </div>
		</div>
		     </div>
		   </div>
		 </div>
		</div>
		<!-- Fin Modal  Cargando pagina-->
          
         
      <!-- Content Wrapper. Contains page content -->
      <aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
        
        <section class="content-header">
          <h1>
            Mantenimiento
            <small>Turno</small>
          </h1>
          <ol class="breadcrumb">
            <li><i class="fa fa-th-large"></i> Schedule</li>
            <li class="active">Administrar Turno</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <button title="Nuevo Turno" type="button" class="btn btn-primary"   onclick="modalGeneral(1,0)"><i class="fa fa-file-text-o fa-sm"></i> Nuevo</button>
          
           <button title="Actualizar lista de Turnos" type="button" class="btn btn-info" onclick="listar()"><i class="fa fa-refresh fa-sm"></i> Actualizar</button>       
           <br><br>  
        
          <div id="alertaConfirmacion" class="alert alert-success alert-dismissable fade in" style='display:none;'>
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong>¡Éxito!</strong>  Su operación se ha realizado satisfactoriamente.
		  </div>
		  
		  <div id="alertaNegativa" class="alert alert-danger alert-dismissable fade in" style='display:none;'>
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong>¡Error!</strong>  Su operación no se ha realizado.
		  </div>
         
         <div class="modal fade" id="exampleModalRegistrar" role="dialog" aria-labelledby="exampleModalLongTitle2" aria-hidden="true">
         <div class="modal-dialog" role="document">
         <div class="modal-content">
         	<div class="modal-header" style="background-color: #68DFF0">
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                   </button>
                   <h4 class="modal-title" id="exampleModalLongTitle2"><a style="color:white">Actualizar Turno&nbsp;&nbsp;</a><a style="color:red;font-weight: bold;"></a></h4>
              </div>
              <div class="modal-body">
              	<div id="containerHeader">
              		<div class="text-center">
	              		<h2 for="recipient-name" class="control-label">
	              			<strong>¿Qué tipo de turno deseas crear?</strong>
	              		</h2>
	              		<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="Id">  
				       	<select class="form-control select2" style="width: 100%;" id="cboTipoTurno" onchange="showContent()">
				       		<option value="" selected="true" disabled="true"> --SELECCIONE UN TIPO DE TURNO-- </option>
				       		<option value="1">Turno</option>
				       		<option value="2">Grupo de Turnos</option>
				       	</select>
			    	</div>
			       	<br>
              	</div>
			       
			       	<div id="containerGeneral">
			       		<label for="recipient-name" class="control-label" >Descripcion</label>
                   		<input type="text" style="width: 100%;" class="form-control" name="t_desc" id="descripcion" onkeypress="return validar(event)" required> 
	                   	<p id="alertDescripcion1" class="text-danger" style='display:none;'></p>
	                   	<br> 
	                   
	                   	<label for="recipient-name" class="control-label">BTN OPCION</label>
				       	<p id="alerticboTurno" class="text-danger" style='display:none;'></p>
				       	<select class="form-control select2" style="width: 100%;" id="cboOpcion">
				       	<option value="" disabled="true" selected="true"> --SELECCIONE-- </option>
				       	</select>
				       	<p id="alertCboOpcion" class="text-danger" style='display:none;'></p>
				       	<br>
			       	</div>
			       	<div id="containerGrupoTurno">
			       		<label for="recipient-name" class="control-label">Turnos</label>
				       	<select id="cboTurnos" class="form-control select2" style="width: 100%;" multiple="multiple">
				       	</select>
				       	<p id="alertCboTurnos" class="text-danger" style='display:none;'></p>
				       	<br>
			       	</div>
                  	<div id="containerTurno">
               			<label for="recipient-name" class="control-label"  >Hora Inicio</label>
                    	<div class="input-group clockpicker">
					  		<input type="text" class="form-control" id="horaInicio" readonly>
					  		<span class="input-group-addon">
								<span class="glyphicon glyphicon-time"></span>
							</span>
				   		</div>
				   		<p id="alertHoraInicio1" class="text-danger" style='display:none;'></p>
                    	<br>
                                                                            
	                   	<label for="recipient-name" class="control-label" >Hora Fin</label>
	                    <div class="input-group clockpicker">
							<input type="text" class="form-control" id="horaFin" readonly>
							<span class="input-group-addon">
								<span class="glyphicon glyphicon-time"></span>
							</span>
						</div>
						<p id="alertHoraFin1" class="text-danger" style='display:none;'></p>
                  	</div>                                  
                    <div id="containerMore">
                    	<!-- checkbox BG002 -->
						<div class="checkbox">
						    <label>
						      <input type="checkbox" id="validaFecha" checked="true"> Validar Fecha
						    </label>
						    <label data-toggle="tooltip" data-placement="top" 
	        				title="Opción que indica si es necesario que la fecha se valide con el periodo de cada tarea para generar el Schedule con este turno.">
		        				<span class="badge pull-right">?</span>
		        			</label>
					  	</div>
                    </div>
                    <br>
                    <p id="mensajeRegistrar" class="text-danger" style='display:none;'></p> 
                    
           		</div>
<!--            		Para registrar -->
                <div class="modal-footer" id="containerSubmit">
                    <button id="btnRegistrar" type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> Guardar</button>
                 	<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
                </div>  
<!--                 Para actualizar -->
                <div class="modal-footer" id="containerUpdate">
                    <button id="btnActualizar" type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> Actualizar</button>
                 	<button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
                </div>                                                                
         </div>
         </div>
         </div>
                                                                

          <!-- INICIO TABLA RESULTADOS -->
         <div class="row"> 
             <div class="col-md-12">
                <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Resultados de Busqueda</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                <div class="table-responsive">
                  <table id="example1" class="table table-bordered table-striped table-responsive table-hover"
                  class="display" width="99%" cellspacing="0" style="font-size:10px; font-weight:bold">
                    <thead class="bg-primary">
                      <tr>
                        <th>N</th>
                        <th>DESCRIPCION</th>
                        <th>HORA INICIO</th>
                        <th>HORA FIN</th>
                        <th>GTurnos</th>
                        <th>Team</th>
                        <th>Opcion</th>
                        <th>Valida Fecha</th>
                        <th>ACCIONES</th>
                      </tr>
                    </thead>
                    <thead class="filters" >
			         <tr>
			            <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden" hidden></th>
			         </tr>
			        </thead>

                  </table>
                  </div>
                </div><!-- /.box-body -->
              </div><!-- /.box --> 
             </div>
         </div>
          <!-- FIN TABLA RESULTADOS -->

        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->


<script>
	//Inicializa las variables de actualización
	//TODO: Falta inicializar campos
	var vu_Descripcion = "";
	var vu_HoraInicio = "";
	var vu_HoraFin = "";
	var vu_Id = "";
	
	 /* Habilita el Select2 */
	 $("#cboTurnos").select2();
	 var acum_selectTurnos = "";
	 //div seleccionar dias (SEMANAL)		 
	 $('#cboTurnos').change( function () {		
		 var cboTurnos = document.getElementById('cboTurnos').value; 			 
		 
	   if(cboTurnos == cboTurnos){
		  selectTurnos = $(this).val();
		   acum_selectTurnos = "" + selectTurnos;
	   }
	 });
		 
		//Carga de la pagina
        $(document).ready(function() {
        	
        listar();			//Lista los datos de la tabla
 		listarOpciones();	//Inicializa el combo de Opciones --BG001
 		
 		cleanAll();		//Clean
 		
 		//Inicio registrar turno
 		$('#btnRegistrar').click(function(){
 			//Valida los campos de la selección
 			var okForm = validateFormFields();
 			//Si es correcto procede a realizar la acción
 			if (okForm) {
 				//Get values
 				var vTipoTurno = document.getElementById('cboTipoTurno').value;
 		        var vDescripcion = document.getElementById("descripcion").value.trim();
 		        var vOpcion = document.getElementById("cboOpcion").value.trim();
 		        var vGrupoTurnos = acum_selectTurnos.trim();
 				var vHoraInicial = document.getElementById("horaInicio").value.trim();
 				var vFecha = checkboxState("validaFecha");
 				var vHoraFinal = document.getElementById("horaFin").value.trim();
 				
 				var src = "ServletTurno"
 				//Inicio POST para insertar información 
	        	$.post(src, {strAccion:"5", strDescripcion : vDescripcion, 
	        		strHoraInicio: vHoraInicial ,strHoraFin: vHoraFinal,
	        		strGTurnos : vGrupoTurnos, strOption: vOpcion, 
	        		strVFecha : vFecha}, 
					function(pdata) {
			        	var obj = JSON.parse(pdata);
			        	console.log(obj)
			 	  		if(obj.Turno[0].codigo == "0"){
			 	  			document.getElementById('mensajeRegistrar').style.display = 'block';
			 	  			$("#mensajeRegistrar").text(obj.Turno[0].resultado);	
			 	  		}else{
			 	  			$("#mensajeRegistrar").text("");	
			 	  			$("#exampleModalRegistrar").modal('hide');	
			 	  			listar();
			 	  			activarAlertaConfirmacion('alertaConfirmacion');
			 	  		}
	        	});
 				console.log("Registraras");
			}
		});
 		//Fin registrar turno
      	
 		//Inicio Actualizar Turno
 		 $('#btnActualizar').click(function(){
 			//Valida los campos de la selección
  			var okForm = validateFormFields();
  			//Si es correcto procede a realizar la acción
  			if (okForm) {
  			//Get values
 				var vIdTurno = document.getElementById('Id').value;
 				var vTipoTurno = document.getElementById('cboTipoTurno').value;
 		        var vDescripcion = document.getElementById("descripcion").value.trim();
 		        var vOpcion = document.getElementById("cboOpcion").value.trim();
 		        var vGrupoTurnos = acum_selectTurnos.trim();
 		        var vFecha = checkboxState("validaFecha");
 				var vHoraInicial = document.getElementById("horaInicio").value.trim();
 				var vHoraFinal = document.getElementById("horaFin").value.trim();
 				
 				var src = "ServletTurno"
 				//Inicio POST para actualizar información 
	        	$.post(src, {strAccion:"6", strDescripcion : vDescripcion, 
	        		strId : vIdTurno, strOperacion : "UPDATE",
	        		strHoraInicio: vHoraInicial ,strHoraFin: vHoraFinal,
	        		strGTurnos : vGrupoTurnos, strOption: vOpcion,
	        		strVFecha : vFecha}, 
					function(pdata) {
			        	var obj = JSON.parse(pdata);
			 	  		if(obj.ActualizarTurno[0].codigo == "0"){
			 	  			document.getElementById('mensajeRegistrar').style.display = 'block';
			 	  			$("#mensajeRegistrar").text(obj.Turno[0].resultado);	
			 	  		}else{
			 	  			$("#mensajeRegistrar").text("");	
			 	  			$("#exampleModalRegistrar").modal('hide');	
			 	  			listar();
			 	  			activarAlertaConfirmacion('alertaConfirmacion');
			 	  		}
	        	});
 			}
 		});
 		//Fin Actualizar Turno
        });   	

	function checkboxState(id){
		var checkbox = document.getElementById(id).checked;
		if (checkbox == true) {
			return 1;
		}else {
			return 0;
		}
	}
	function setCheckboxState(id, val){
		if (val == 1) {
			document.getElementById(id).checked = true;
		}else{
			document.getElementById(id).checked = false;
		}
	}
	function cleanUpdateVariables() {
		//TODO: Faltan variables de actualizacion
		vu_Descripcion = "";
		vu_HoraInicio = "";
		vu_HoraFin = "";
		vu_Id = "";
		vu_Opcion = "";
		acum_selectTurnos = "";
		$('#cboTurnos').val('0').trigger('change');
	}
	
	function dividirCadena(cadenaADividir,separador) {
		   var arrayDeCadenas = cadenaADividir.split(separador);
		   var result = [];
		   for (var i=0; i < arrayDeCadenas.length; i++) {
			      result.push(arrayDeCadenas[i].trim());
		   }
		   return result;
	}
	
	function fillFormUpdate(pId, pDescripcion, pHoraInicio, pHoraFin, pOpcion, pGTurnos, vFecha){
		//Limpio las variables de actualizacion
		cleanUpdateVariables();
		//Seteo las variables que se actualizaran
		//TODO: Faltan variables de actualizacion
		vu_Descripcion = pDescripcion;
		vu_HoraInicio = pHoraInicio;
		vu_HoraFin = pHoraFin;
		vu_Id = pId;
		vu_Opcion = "";
		
		//TODO: Faltan campos por actualizar
		//Actualizamos los campos
		if (pGTurnos == "") {
			console.log("Es de tipo 1 sin grupo de turnos");
			$("#cboTipoTurno").val(1);
		}else {
			//#Llenar Turnos Select2
			var arr = dividirCadena(pGTurnos,",")
			$("#cboTurnos").select2();
			$('#cboTurnos').val(arr);
			$('#cboTurnos').trigger('change');
			$("#cboTipoTurno").val(2);
		}
		
		//Completa
		console.log("Actualiza campos")
		acum_selectTurnos = pGTurnos;
		$("#descripcion").val(pDescripcion);
		$("#cboOpcion").val(pOpcion);
		setCheckboxState("validaFecha", vFecha); //BG002
		$("#horaInicio").val(pHoraInicio);
		$("#horaFin").val(pHoraFin);
		$("#Id").val(pId);
	}
	
	function modalGeneral(option, pGTurnos){
		if (option == 1) {
			console.log("Esta creando");
		}else{
			console.log("Esta actualizando");
		}
		console.log("El estado del checkbox: "+checkboxState("validaFecha")); //BG002
		//Limpiamos los campos
		 cleanAll();
		//Ocultamos los campos según la opcion
		hideBasics(option, pGTurnos);
		//Mostramos el Modal
		$('#exampleModalRegistrar').modal('show');
	}
 
 
 function editarEstado(pId, pDescripcion, pEstado){

		if(confirm('¿Está seguro que desea desactivar el turno "'+pDescripcion+'"?')) { 
	        	   varEstado = pEstado;
	       		   varId = pId;
	       		   var vFecha = checkboxState("validaFecha");
	        	   var src = "ServletTurno";	 
	        		//Inicio POST actualizar estado Turno
	        		//BG001 4->6
	        		  	$.post(src, {strAccion:"6", strId : varId, strEstado : varEstado, strOperacion : "DELETE" ,
	        		  		strOption: "0", strVFecha : vFecha}, 
	        		 		function(pdata) {   
	        		  			var obj = JSON.parse(pdata);
	        		  			if(obj.ActualizarTurno[0].codigo == "0"){
	        		  				activarAlertaConfirmacion('alertaNegativa');
	        		  				listar();
	        		  			}else{
	        		  				activarAlertaConfirmacion('alertaConfirmacion');
	        		  				listar();
	        		  			}		    
	        		  	});
	        		//Fin Actualizar estado Turno
	      }else {
	               return false;

	             } 
	}
 
 function listar(){
	 
	// Haciendo visible Modal con Barra de progreso 
     var $modal = $('.js-loading-bar');
     $modal.modal('show');
     
	 var src = "ServletTurno";
 	
	//Inicio POST para completar listar información en la tabla
 	$.post(src, {strAccion:"2"}, 
				function(pdata) {
			     
				  var obj = JSON.parse(pdata);
				  var datatabla = [];
				  var numeracion = 0;
				  $('#cboTurnos').empty();
				  if(obj.ListaTurno[0].idTurno == ""){
						
					  }else{
						  
						  for(i = 0 ; i < obj.ListaTurno.length ; i++ ){	
							  
							  numeracion = numeracion + 1;
							  var arr = [];
							  	listCombo(obj.ListaTurno[i]);//BG001 turno
							  //captura de datos
							    var id = obj.ListaTurno[i].idTurno;
							    var descripcion = obj.ListaTurno[i].descripcion;
							    var horaInicio = obj.ListaTurno[i].horaInicio;
							    var horaFin = obj.ListaTurno[i].horaFin; 
							    //Begin of BG001
							    var gTurnos = obj.ListaTurno[i].gTurnos; 
							    var idTeam = obj.ListaTurno[i].idTeam; 
							    var idOption = obj.ListaTurno[i].idOption; 
							    var vFecha = obj.ListaTurno[i].vFecha; 
							  	//End of BG001
							    var estado = obj.ListaTurno[i].estado;
							    var btn;
							    
							    if(estado == "1"){
							    btn = "<div style='display:inline-flex;'><button style='padding:8px!important;margin-left:6px !important;' title=\"Desactivar Turno\" type=\"button\" class=\"btn btn-danger btn-sm\"  onclick=\"editarEstado('"+id+"','"+descripcion+"','0')\"><i class=\"fa fa-close\"></i></button></div></center>";	
							    }
							 
							  //Generación de cadena para tabla  turno
							  	arr.push(numeracion);
				        		arr.push(descripcion);
				        		arr.push(horaInicio);
				        		arr.push(horaFin);
				        		//Begin of BG001
				        		arr.push(gTurnos);
				        		arr.push(idTeam);
				        		arr.push(idOption);
				        		if (vFecha == 1) {
				        			arr.push("Sí");
								}else {
									arr.push("No");
								}
				        		
				        		//End of BG001

				        		arr.push("<center><div style='display:inline-flex;'><button style='padding:8px!important;margin-left:6px !important;' title=\"Editar Turno\" type=\"button\" class=\"btn btn-warning btn-sm\"  onclick=\"modalGeneral(2,'"+gTurnos+"');fillFormUpdate('"+id+"','"+descripcion+"','"+horaInicio+"','"+horaFin+"','"+idOption+"','"+gTurnos+"','"+vFecha+"');\"><i class=\"fa fa-edit\"></i></button></div>"+
				        				btn);
				        		datatabla.push(arr);
							  }  
					  }
				  
				  
				  
				// DataTable
				    var table = $('#example1').DataTable();
				    table.destroy();
				    
				  $('#example1').DataTable( {
					   language : {
							processing : "Procesando...",
							search : '<i class="fa fa-search fa-lg"></i>',
							searchPlaceholder : "Buscar...",
							emptyTable: "Ningún dato disponible en esta tabla",
							lengthMenu: "Mostrar _MENU_ registros",
  						zeroRecords: "Sin resultados encontrados",
  						info: "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
  						infoEmpty: "No hay registros disponibles",
  						infoFiltered: "(filtrado de un total de _MAX_ registros)",
  						paginate: {
  							first: "Primero",
  							last: "Último",
  							next: "Siguiente",
  							previous: "Anterior"
  						}
						},
				        dom: 'Bfrtip',
				        data : datatabla,
				        lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
				        buttons : [
							{
								extend : 'pageLength',
								text : '<i class="fa fa-list-ol" aria-hidden="true"></i> Mostrar',
								className: "btn-sm"
							},
							{
							 	extend: "copy",
								exportOptions: {
									columns: [0,1,2,3,4,5]
								},
								className: "btn-sm",
								text : '<i class="fa fa-clipboard" aria-hidden="true"></i> Copiar'
							},
							{
								extend: "csv",
								exportOptions: {
									columns: [0,1,2,3,4,5]
								},
								className: "btn-sm",
								text : '<i class="fa fa-file-text-o" aria-hidden="true"></i> CSV'
							},
							{
								extend: "excel",
								exportOptions: {
									columns: [0,1,2,3,4,5]
								},
								className: "btn-sm",
								text : '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
							},
							{
								extend: "pdfHtml5",
								exportOptions: {
									columns: [0,1,2,3,4,5]
								},
								className: "btn-sm",
								text : '<i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF'
							},
							{
								extend: "print",
								exportOptions: {
									columns: [0,1,2,3,4,5]
								},
								className: "btn-sm",
								text : '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'
							}],
   						responsive: true,
						columnDefs: [
						{ "width": "10%", "targets": 0 },
						{ "width": "25%", "targets": 1 },
						{ "width": "25%", "targets": 2 },
						{ "width": "25%", "targets": 3 },
						{ "width": "10%", "targets": 4 }
						],
				    } );
				    
				// Setup - add a text input to each footer cell
				    $('#example1 .filters th').each( function () {
				        var title = $('#example1 thead th').eq( $(this).index() ).text();
				        $(this).html( '<input type="text" placeholder="Buscar '+title+'" style="width:100%"  />' );
				    } );

				table = $('#example1').DataTable();
				
				// Apply the search
			    table.columns().eq( 0 ).each( function ( colIdx ) {
			        $( 'input', $('.filters th')[colIdx] ).on( 'keyup change', function () {
			            table
			                .column( colIdx )
			                .search( this.value )
			                .draw();
			        } );
			    } );
				
			  //Ocultar Modal con barra de progreso
			    var $modal = $('.js-loading-bar');
		        $modal.modal('hide');
 	
 });

	// Fin del POST listar tabla

	
	}
 
 	//Begin of BG001
 	function listCombo(obj) {
 		var pIdCombo = '#cboTurnos';
 		$(pIdCombo).append(
 	  			$('<option>',{
 	  				value: obj.idTurno,
 	  				text: obj.descripcion
 	  			})		
 	  		);
	}
	
 	 function listarOpciones(){
	 var src = "ServletWOptionsCont";
	 var pIdCombo = '#cboOpcion';
		$.post(src, {strOperation : 'listOptions', iTeam : vTeam, strType : 'BTN_GENERA_SCHEDULE'},
				function(pdata) {
				  var obj = JSON.parse(pdata);
				  console.log(obj);
				  var dataReporte = [];
				  for (var i = 0; i < obj.reporte.length; i++) {
					  $(pIdCombo).append(
         	    	  			$('<option>',{
         	    	  				value: obj.reporte[i].idOption,
         	    	  				text: obj.reporte[i].descripcion
         	    	  			})		
         	    	  		);
				  }
		  });
 	}
 	
 	function validateFormFields(){
 		//Init fields styles
 		document.getElementById('alertDescripcion1').style.display = 'none';
		document.getElementById('alertHoraInicio1').style.display = 'none';
		document.getElementById('alertHoraFin1').style.display = 'none';
		document.getElementById('alertCboTurnos').style.display = 'none';
		document.getElementById('alertCboOpcion').style.display = 'none';
		
		document.getElementById('mensajeRegistrar').style.display = 'none';
		
		
		document.getElementById("descripcion").style.borderColor = "black";
        document.getElementById("descripcion").style.borderWidth = "1px";
        
        document.getElementById("cboOpcion").style.borderColor = "black";
        document.getElementById("cboOpcion").style.borderWidth = "1px";
        
        document.getElementById("cboTurnos").style.borderColor = "black";
        document.getElementById("cboTurnos").style.borderWidth = "1px";
        
        document.getElementById("horaInicio").style.borderColor = "black";
        document.getElementById("horaInicio").style.borderWidth = "1px";
        
        document.getElementById("horaFin").style.borderColor = "black";
        document.getElementById("horaFin").style.borderWidth = "1px";
        
        var vTipoTurno = document.getElementById('cboTipoTurno').value;
        var vDescripcion = document.getElementById("descripcion").value.trim();
        var vOpcion = document.getElementById("cboOpcion").value.trim();
        var vGrupoTurnos = acum_selectTurnos;
		var vHoraInicial = document.getElementById("horaInicio").value.trim();
		var vHoraFinal = document.getElementById("horaFin").value.trim();
		//Init boolean values
		var bDescripcion = true;
		var bOpcion = true;
		var bHoraInicio = true;
		var bHoraFin = true;
		var bTurnos = true;	//Grupo de turnos
		var bOpcion = true;
		
		/* ##################Validate Fields#####################*/
		// Special Characters
		if(/[a-zA-Z0-9 ():-]/.test(vDescripcion) == false){
			document.getElementById("descripcion").style.borderColor = "red";
           	document.getElementById("descripcion").style.borderWidth = "2px";
       		document.getElementById('alertDescripcion1').style.display = 'block';
           	$("#alertDescripcion1").text("*No se permiten caracteres especiales");
           	bDescripcion = false;
		}
		//Empty Fields
		if(vDescripcion == ""){
   	 		document.getElementById("descripcion").style.borderColor = "red";
            document.getElementById("descripcion").style.borderWidth = "2px";
            document.getElementById('alertDescripcion1').style.display = 'block';
            $("#alertDescripcion1").text("*Este campo es requerido");
            bDescripcion = false;
        }
		if(vOpcion == ""){
   	 		document.getElementById("cboOpcion").style.borderColor = "red";
            document.getElementById("cboOpcion").style.borderWidth = "2px";
            document.getElementById('alertCboOpcion').style.display = 'block';
            $("#alertCboOpcion").text("*Debe seleccionar una opcion");
            bOpcion = false;
        }
		
		
		//Special Validations
		if (vTipoTurno == 1) {
			//Turnos
			if(vHoraInicial == ""){
	   	 		document.getElementById("horaInicio").style.borderColor = "red";
	            document.getElementById("horaInicio").style.borderWidth = "2px";
	            document.getElementById('alertHoraInicio1').style.display = 'block';
	            $("#alertHoraInicio1").text("*Este campo es requerido");
	            bHoraInicio = false;
	        }
			if(vHoraFinal == ""){
	   	 		document.getElementById("horaFin").style.borderColor = "red";
	            document.getElementById("horaFin").style.borderWidth = "2px";
	            document.getElementById('alertHoraFin1').style.display = 'block';
	            $("#alertHoraFin1").text("*Este campo es requerido");
	            bHoraFin = false;
	        }
		}else if (vTipoTurno == 2) {
			//Grupo de Turnos
			if(vGrupoTurnos == "" || vGrupoTurnos === "null"){
	   	 		document.getElementById("cboTurnos").style.borderColor = "red";
	            document.getElementById("cboTurnos").style.borderWidth = "2px";
	            document.getElementById('alertCboTurnos').style.display = 'block';
	            $("#alertCboTurnos").text("*Debes seleccionar turnos");
	            bTurnos = false;
	        }
		}
		var v_verifiedValue = false;
		if (bDescripcion == true && bOpcion == true) {
			if (vTipoTurno == 1) {
				if (bHoraInicio == true && bHoraFin == true) {
					v_verifiedValue = true;
				}
			}else if (vTipoTurno == 2) {
				if (bTurnos == true) {
					v_verifiedValue = true;
				}
			}
		}
		return v_verifiedValue;
 	}
 	
 	function hideBasics(option, pGTurnos){
 		//We are going to hide both div for Turnos & GrupoTurnos cases, including the buttons of save
 		document.getElementById('containerGrupoTurno').style.display = 'none';
 		document.getElementById('containerTurno').style.display = 'none';
 		document.getElementById('containerGeneral').style.display = 'none';
 		document.getElementById('containerMore').style.display = 'none';
 		
 		if (option == 1) {		//Para un registrar
 			document.getElementById('containerHeader').style.display = 'block';
 			document.getElementById('containerSubmit').style.display = 'none';
 			document.getElementById('containerUpdate').style.display = 'none';
		}else if (option == 2) {//Para un actualizar
			document.getElementById('containerHeader').style.display = 'none';
			document.getElementById('containerSubmit').style.display = 'none';
			document.getElementById('containerUpdate').style.display = 'block';
			document.getElementById('containerMore').style.display = 'block';
			console.log("El valor de pGTurnos es: "+pGTurnos);
			if (pGTurnos.trim() == "") {
				document.getElementById('containerGeneral').style.display = 'block';
				document.getElementById('containerTurno').style.display = 'block';
				document.getElementById('containerGrupoTurno').style.display = 'none';
			}else {
				document.getElementById('containerGeneral').style.display = 'block';
// 				document.getElementById('containerTurno').style.display = 'none'; //--BG004
				document.getElementById('containerTurno').style.display = 'block'; //++BG004
				document.getElementById('containerGrupoTurno').style.display = 'block';
			}
		}
 	}
 	
	function cleanAll() {
		//Clear all form fields
		document.getElementById('mensajeRegistrar').style.display = 'none';
		document.getElementById('cboTipoTurno').selectedIndex= "0";
		document.getElementById('cboOpcion').selectedIndex= "0";
		$('#cboTurnos').val('0').trigger('change.select2');
		acum_selectTurnos = "";
		$("#descripcion").val("");
	 	$("#horaInicio").val("");
 		$("#horaFin").val("");
 		$("#Id").val(0);
 		
	}
	
	function cleanPartial(){
		//Clear partial fields
		document.getElementById('mensajeRegistrar').style.display = 'none';
		document.getElementById('cboOpcion').selectedIndex= "0";
		$('#cboTurnos').val('0').trigger('change.select2');
		acum_selectTurnos = "";
		$("#descripcion").val("");
	 	$("#horaInicio").val("");
 		$("#horaFin").val("");
 		$("#Id").val(0);
	}
 	
 	function showContent() {
 		//Show form fields by tipoTurno
	 	var tipoTurno = document.getElementById('cboTipoTurno').value;
	 	console.log("El valor es: " + tipoTurno)
		if (tipoTurno == 1) {
			//Turnos
			document.getElementById('containerGeneral').style.display = 'block';
			document.getElementById('containerTurno').style.display = 'block';
			document.getElementById('containerGrupoTurno').style.display = 'none';
			document.getElementById('containerMore').style.display = 'block';
			document.getElementById('containerSubmit').style.display = 'block';
		}else if (tipoTurno == 2) {
			//Grupo Turnos
			document.getElementById('containerGeneral').style.display = 'block';
// 			document.getElementById('containerTurno').style.display = 'none'; //--BG004
			document.getElementById('containerTurno').style.display = 'block'; //++BG004
			document.getElementById('containerGrupoTurno').style.display = 'block';
			document.getElementById('containerMore').style.display = 'block';
			document.getElementById('containerSubmit').style.display = 'block';
		}else{
			console.log("No entra");
			//Nothing
		}
	 	cleanPartial();
	}
 	
 	//End of BG001
 
 function validar(e) {
	    tecla = (document.all) ? e.keyCode : e.which;
	    patron =/[\x5C'"]/;
	    te = String.fromCharCode(tecla);
	    return !patron.test(te);
	} 
 
 function activarAlertaConfirmacion(id) { 

	 document.getElementById(id).style.display = 'block';    
	 setTimeout(function() {      
		 desactivarAlertaConfirmacion(id);  
     }, 3000)
	}// Fin funcion activarAlertaConfirmacion
 
 function desactivarAlertaConfirmacion(id) { 

	 document.getElementById(id).style.display = 'none';    

	}// Fin funcion desactivarAlertaConfirmacion
 
        

	$('.clockpicker').clockpicker({
	    placement: 'top',
	    align: 'left',
	    donetext: 'Ok'
	});
	
	// Setup Barra de progreso
    this.$('.js-loading-bar').modal({
      backdrop: 'static',
      show: false
    });

  // Haciendo visible Modal con Barra de progreso 
      var $modal = $('.js-loading-bar');
      $modal.modal('show');
 </script>

  </body>
</html>
