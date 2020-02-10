<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SCHEDULER DE BACKUPS | IBM</title>
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
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            SCHEDULER DE BACKUPS
            <small>IBM</small>
          </h1>
          <ol class="breadcrumb">
            <li><i class="fa fa-th-large"></i> IBM</li>
            <li class="active">Scheduler Backups</li>
          </ol>
        </section>
        <input type="hidden" style="width: 100%;" class="form-control" id="pRendimiento">

        <!-- Main content -->
        <section class="content">
        <button title="Nueva Scheduler Backup" type="button" class="btn bg-blue"
		data-toggle="modal" data-target="#modalNew" onclick="refreshCombos()">
		<i class="fa fa-file-text-o"></i> Nuevo
		</button>
		<button title="Actualizar Schedulers Backups" type="button"
		class="btn  bg-blue" onclick="listar_Backups()">
		<i class="fa fa-refresh fa-lg"></i> Actualizar
	</button>
		<br>
		<br>
		 
         <div id="alertaConfirmacion" class="alert alert-success alert-dismissable fade in" style='display:none;'>
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong>Éxito!</strong>  Su operación se ha realizado satisfactoriamente.
		  </div>
		  
		  <div id="alertaError" class="alert alert-danger alert-dismissable fade in" style='display:none;'>
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong>Error!</strong>  No se pudo completar el proceso de registro o actualización.
		  </div>
		  
		  <input type="hidden" style="width: 100%;" class="form-control" id="pPerfil">
		  	
		<!--         Inicio   Modal Nuevo                                                       -->

	<div class="modal fade" id="modalNew" role="dialog" aria-labelledby="exampleModalLongTitle2" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header label-primary">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLongTitle2">
						<a class="label-primary">Nuevo Scheduler Backup&nbsp;&nbsp;</a><a
							style="color: red; font-weight: bold;"></a>
					</h4>
				</div>
				<div class="modal-body">
						<div class="form-group">
							<label for="recipient-name" class="control-label">Tipo Scheduler</label>
							<p id="alertitipo" class="text-danger" style='display: none;'></p>
							<input type="text" style="width: 100%;" class="form-control" id="iTipo" onkeypress="return validar(event)">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Scheduler Name</label>
							<p id="alertischedulername" class="text-danger" style='display: none;'></p>
							<input type="text" style="width: 100%;" class="form-control" id="iSchedulername" onkeypress="return validar(event)">
						</div>
					 	<div class="form-group">
							<label for="recipient-name" class="control-label">IP</label>
							<p id="alertiip" class="text-danger" style='display: none;'></p>
							<input type="text" style="width: 100%;" class="form-control" id="iIP" onkeypress="return validar(event)">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Resource ID</label>
							<p id="alerticboResource" class="text-danger" style='display: none;'></p>
							<select class="form-control select2" style="width: 100%;" id="icboResource">
								<option value="">--SELECCIONE--</option>
							</select>
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Severity</label>
							<p id="alerticboSeverity" class="text-danger" style='display: none;'></p>
							<select class="form-control select2" style="width: 100%;" id="icboSeverity">
								<option value="">--SELECCIONE--</option>
								<option value="5">FATAL</option>
								<option value="4">CRITICAL</option>
								<option value="3">WARNING</option>
							</select>
						</div>							
						<p id="mensajeRegistrar" class="text-danger" style='display: none;'></p>
				</div>
				<div class="modal-footer">
					<button id="btnRegistrar" type="submit" class="btn btn-primary">
						<i class="fa fa-floppy-o"></i> Guardar
					</button>
					<button type="button" class="btn btn-danger" data-dismiss="modal">
						<i class="fa fa-reply"></i> Cerrar
					</button>
				</div>
			</div>
		</div>
	</div>
	<!--Fin Modal Nuevo	--> 
		
         <!--		Inicio Modal Editar	-->
	<div class="modal fade" id="modalEdit" role="dialog"
		aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header label-primary">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLongTitle">
						<a class="label-primary">Editar Unidad Lógica&nbsp;&nbsp;</a><a
							style="color: red; font-weight: bold;"></a>
					</h4>
				</div>
				<div class="modal-body">

					<input type="hidden" style="width: 100%;" class="form-control"	id="uId">
						<div class="form-group">
							<label for="recipient-name" class="control-label">Tipo Scheduler</label>
							<p id="alertutipo" class="text-danger" style='display: none;'></p>
							<input type="text" style="width: 100%;" class="form-control" id="uTipo" onkeypress="return validar(event)">
						</div>
					 	<div class="form-group">
							<label for="recipient-name" class="control-label">Scheduler Name</label>
							<p id="alertuschedulername" class="text-danger" style='display: none;'></p>
							<input type="text" style="width: 100%;" class="form-control" id="uSchedulername" onkeypress="return validar(event)">
						</div>
					 	<div class="form-group">
							<label for="recipient-name" class="control-label">IP</label>
							<p id="alertuip" class="text-danger" style='display: none;'></p>
							<input type="text" style="width: 100%;" class="form-control" id="uIP" onkeypress="return validar(event)">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Resource ID</label>
							<p id="alertucboResource" class="text-danger" style='display: none;'></p>
							<select class="form-control select2" style="width: 100%;" id="ucboResource">
								<option value="">--SELECCIONE--</option>
							</select>
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Resource ID</label>
							<p id="alertucboSeverity" class="text-danger" style='display: none;'></p>
							<select class="form-control select2" style="width: 100%;" id="ucboSeverity">
								<option value="">--SELECCIONE--</option>
								<option value="5">FATAL</option>
								<option value="4">CRITICAL</option>
								<option value="3">WARNING</option>
							</select>
						</div>	

					<p id="mensajeEdit" class="text-danger" style='display: none;'></p>

				</div>
				<div class="modal-footer">
					<a id="btnActualizar" class="btn btn-primary">
						<i class="fa fa-floppy-o"></i> Guardar
					</a>
					<a type="button" class="btn btn-danger" data-dismiss="modal">
						<i class="fa fa-reply"></i> Cerrar
					</a>
				</div>
			</div>
		</div>
	</div>
	<!-- Fin Modal Editar -->
                                                       
         
         <div class="row"> 
             <div class="col-md-12">
                <div class="box">
                <div class="box-header">
                  <h3 class="box-title">DETALLE DE SCHEDULERS DE BACKUPS</h3>
                  <h4 id="idCabecera" style = "color:red"></h4>
                </div><!-- /.box-header -->
                <div class="box-body">
                	<div class="table-responsive"  id="divTabla">
                  
                	</div>
                </div><!-- /.box-body -->
              </div><!-- /.box --> 
             </div>
         </div>
          <!-- END TYPOGRAPHY -->

        </section><!-- /.content -->
      </aside><!-- /.content-wrapper -->

<script>     

$(document).ready(function() {
	
	refreshCombos();
	opcionesHtml();
	tablaHtml();
	listar_Backups();
	
   //  alert('p');

	
    
    }); // Fin del $(document)
    

    
		function tablaHtml(){
			
			//var perfil = $("#pPerfil").val();      	
         					  
         					 var tabla = "<table id=\"example1\" class=\"table table-bordered table-striped table-responsive table-hover\" "
         					          + "class=\"display\" width=\"99%\" cellspacing=\"0\" style=\"font-size:10px; font-weight:bold\" >"
         	                 		  + "<thead class=\"bg-primary\">"
         	                 		  + "<tr>"
         	                 		  + "<th>N°</th>"
         	                 		  + "<th>TIPO</th>"
         	                 		  + "<th>SCHEDULER NAME</th>"
         	                 		  + "<th>IP</th>"
         	                 		  + "<th>RESOURCE ID</th>"
         	                 		  + "<th>SEVERITY</th>"
         	                 		  + "<th>CUSTOMER CODE</th>"
         	                 		  + "<th>CUSTOMER</th>"
         				          	  + "<th></th>"
         		                      + "</tr>"
         		                      + "</thead>"
         		                      + "<thead class=\"filters\" >"
         		                      + "<tr>"
         		                      + "<th style=\"border: hidden\"></th>"
         		                      + "<th style=\"border: hidden\"></th>"
         		                      + "<th style=\"border: hidden\"></th>"
         		                      + "<th style=\"border: hidden\"></th>"
         				         	  + "<th style=\"border: hidden\"></th>"
         				         	  + "<th style=\"border: hidden\"></th>"
         				         	  + "<th style=\"border: hidden\"></th>"
         				         	  + "<th style=\"border: hidden\"></th>"
         				         	  + "<th style=\"border: hidden\" hidden></th>"
         				         	  + "</tr>"
         				         	  + "</thead>" 
         				         	  + "</table>";
  	
         			        document.getElementById("divTabla").innerHTML = tabla; 
 
            }
    
		function listarComboOption(pAccion, pIdCombo) {
			//Combo
			$(pIdCombo + " option").remove();
			$(pIdCombo).append($('<option>', {
				value : "",
				text : " --SELECCIONE-- "
			}));

			var src = "ServletBackups";
			$.post(src, {
				strAccion : "2"
			}, function(pdata) {

				var obj = JSON.parse(pdata);

				for (i = 0; i < obj.ListaOption.length; i++) {

					$(pIdCombo).append($('<option>', {
						value : obj.ListaOption[i].idOption,
						text : obj.ListaOption[i].descripcion
					}));
				}
			});
		} // Fin funcion listarComboOption
    
		function refreshCombos() {
			
			
			listarComboOption('2', '#icboResource');
			listarComboOption('2', '#ucboResource');
			limpiarModales();
		}
		
		function limpiarModales() {
			$('#icboResource').val("").trigger('change');
			$('#iIP').val('');
			$('#iTipo').val('');
			$('#iSchedulername').val('');
			$('#icboSeverity').val("").trigger('change');
			$('#ucboResource').val("").trigger('change');
			$('#uIP').val('');
			$('#uTipo').val('');
			$('#uSchedulername').val('');
			$('#ucboSeverity').val("").trigger('change');
			document.getElementById('alerticboResource').style.display = 'none';
			document.getElementById('alertiip').style.display = 'none';
			document.getElementById('alertitipo').style.display = 'none';
			document.getElementById('alertischedulername').style.display = 'none';
			document.getElementById('alerticboSeverity').style.display = 'none';
			document.getElementById('alertucboResource').style.display = 'none';
			document.getElementById('alertuip').style.display = 'none';
			document.getElementById('alertutipo').style.display = 'none';
			document.getElementById('alertuschedulername').style.display = 'none';
			document.getElementById('alertucboSeverity').style.display = 'none';
		}
	        
        function activarAlertaConfirmacion() { 

        		 document.getElementById('alertaConfirmacion').style.display = 'block';    
        		 setTimeout(function() {      
        			 desactivarAlertaConfirmacion();  
        	     }, 3000)
        		}// Fin funcion activarAlertaConfirmacion
        	 
        function desactivarAlertaConfirmacion() { 

        		 document.getElementById('alertaConfirmacion').style.display = 'none';    

        		}// Fin funcion desactivarAlertaConfirmacion
      function limpiarAlertasNew() {
     				document.getElementById('alerticboResource').style.display = 'none';
     				document.getElementById('alertiip').style.display = 'none';
     				document.getElementById('alertitipo').style.display = 'none';
     				document.getElementById('alertischedulername').style.display = 'none';
     				document.getElementById('alerticboSeverity').style.display = 'none';
     			} // Fin funcion limpiarAlertasNew		       
     function limpiarAlertasEdit() {
    				document.getElementById('alertucboResource').style.display = 'none';
    				document.getElementById('alertuip').style.display = 'none';
    				document.getElementById('alertutipo').style.display = 'none';
    				document.getElementById('alertuschedulername').style.display = 'none';
    				document.getElementById('alertucboSeverity').style.display = 'none';
    			} // Fin funcion limpiarAlertasEdit 		
        		
     function modalEditar(id, resourceid, ip, schedulername, tipo, severity) {

    				limpiarAlertasEdit();
    				limpiarModales();

    				$("#uId").val(id);
    				$("#ucboResource").val(resourceid).trigger('change');
    				$("#uIP").val(ip);
    				$("#uTipo").val(tipo);
    				$("#uSchedulername").val(schedulername);
    				$("#ucboSeverity").val(severity).trigger('change');

    			}// Fin funcion modalEditar		
        		
 
        function listar_Backups(){
            var $modal = $('.js-loading-bar');
            $modal.modal('show');
       	 	var src = "ServletBackups"; 
        	$.post(src, {strAccion:"1"}, 

       				function(pdata) {
       			     
       				  var obj = JSON.parse(pdata);
       				  var datatabla = [];
       				  var numeracion = 0;
       				    
       				  if(obj.ListaBackups[0].id == ""){
       					
       					}else{
       						  for(i = 0 ; i < obj.ListaBackups.length ; i++ ){	
       							  
       							  	numeracion = numeracion + 1;
       							  	var arr = [];
       							  
       							//captura de datos
       								var perfil = $("#pPerfil").val();
       								var id = obj.ListaBackups[i].id;
       								var schedulername = obj.ListaBackups[i].schedulername;
       								var ip = obj.ListaBackups[i].ipaddress;
       								var resource = obj.ListaBackups[i].resource;
       								var severity = obj.ListaBackups[i].severity; 
       								var tipo = obj.ListaBackups[i].tipo; 
       								var severidad = obj.ListaBackups[i].severidad; 
       								var customercode = obj.ListaBackups[i].customercode; 
       								var customer = obj.ListaBackups[i].customer; 
       								var btnEstado="";	
       								
       								if (perfil == 'ADMINISTRADOR'){
           								btnEstado = "<button title=\"Eliminar Schedule Backup\" type=\"button\" class=\"btn bg-red\"  onclick=\"eliminar('"
    										+ id
    										+ "','"
    										+ resource
    										+ "','"
    										+ ip
    										+ "','"
    										+ schedulername
    										+ "','"
    										+ tipo
    										+ "','"
    										+ severity
    										+ "')\"><i class=\"fa fa-trash\"></i></button>&nbsp;";
           						  		}
       								
           							arr.push(numeracion);
           							arr.push(tipo);
           							arr.push(schedulername);
    								arr.push(ip);						
    								arr.push(resource);
    								arr.push(severidad);
    								arr.push(customercode);
    								arr.push(customer);
    								arr
									.push("<button title=\"Editar Backup\" type=\"button\" class=\"btn bg-yellow\" data-toggle=\"modal\" data-target=\"#modalEdit\" "
											+ " onclick=\"modalEditar('"
											+ id
											+ "','"
											+ resource
											+ "','"
											+ ip
											+ "','"
											+ schedulername
											+ "','"
											+ tipo
											+ "','"
											+ severity
											+ "' )\" ><i class=\"fa fa-edit\"></i></button>"
											+ btnEstado);            							 	
           							 	datatabla.push(arr);
           							 	
           							    		
       							  }  
       					  }
       				  
       				// DataTable
     				    var table = $('#example1').DataTable();
     				    table.destroy();

       				 //if(perfil == 'ADMINISTRADOR'){
        					$('#example1').DataTable( {
        				    	language: {
        				            searchPlaceholder: "Buscar...",
        				            search : '<i class="fa fa-search fa-lg">',
        				            
        				        },
        				        dom: 'Bfrtip',
        				        data : datatabla,  
        				     	lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
        				     	fnRowCallback: function(nRow, data, iDisplayIndex, iDisplayIndexFull) {
         	                    if ( data[8] == "Si" )
         	                    {
         	                        $('td', nRow).css('background-color', '#68FF7E');
         	                    }
         	                },
         	                //columnDefs: [
         	                //	{ "width": "2%", "targets": 0 },{ "width": "10%", "targets": 1 },{ "width": "30%", "targets": 2 },{ "width": "15%", "targets": 3 },
         	                //	{ "width": "3%", "targets": 4 },{ "width": "10%", "targets": 5 },{ "width": "10%", "targets": 6 },{ "width": "15%", "targets": 7 },
         	                //	{ "width": "2%", "targets": 8 },{ "width": "3%", "targets": 9 }         	                	
           				    //],
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
        											} ]
        				    } );
        				 //}
       				    
       					
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
					
					// Capturar fila seleccionada 
				    $('#example1 tbody').on( 'click', 'tr', function () {
				    		
				    	    
					        if ( $(this).hasClass('selected') ) {
					        	table.$('tr.selected').removeClass('selected');
					        	 $(this).addClass('selected');
					        }else {

					            table.$('tr.selected').removeClass('selected');
					            $(this).addClass('selected');
					        }
				    } );
					
				  //Ocultar Modal con barra de progreso
				    var $modal = $('.js-loading-bar');
			        $modal.modal('hide');
        	
        });// Fin del POST listar tabla
       	} // Fin funcion Listar
       	
       	
       	
       	function activarAlertaConfirmacion() { 

   		 document.getElementById('alertaConfirmacion').style.display = 'block';    
   		 setTimeout(function() {      
   			 desactivarAlertaConfirmacion();  
   	     }, 3000)
   		}// Fin funcion activarAlertaConfirmacion
   	 
   		function desactivarAlertaConfirmacion() { 

   		 document.getElementById('alertaConfirmacion').style.display = 'none';    

   		}// Fin funcion desactivarAlertaConfirmacion
   		
   		function activarAlertaError() { 

      		 document.getElementById('alertaError').style.display = 'block';    
      		 setTimeout(function() {      
      			 desactivarAlertaError();  
      	     }, 3000)
      		}// Fin funcion activarAlertaConfirmacion
      	 
      	function desactivarAlertaError() { 

      	document.getElementById('alertaError').style.display = 'none';    

      	}// Fin funcion desactivarAlertaConfirmacion
      	
      	
      	function validarModalNew() {

			limpiarAlertasNew();
			var flag = 0; // 0 validacion OK, 1 validación con alertas

			var cboresource = $('#icboResource').val();
			var ip = $('#iIP').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
			var schedulername = $('#iSchedulername').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
			var tipo = $('#iTipo').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
			var severity = $('#icboSeverity').val();
			RegE = /^\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}$/
			//console.log('==>' + iselSeleccion + ' | ' + ifecha);
			
			
			if (cboresource == "" || cboresource == null) {
				flag = 1;
				document.getElementById('alerticboResource').style.display = 'block';
				$("#alerticboResource").text("*Este campo es obligatorio");
			}
			if (ip.match(RegE)) {
				
				}else if (ip == "" || ip == null)
				{
					flag = 1;
					document.getElementById('alertiip').style.display = 'block';
					$("#alertiip").text("*Este campo es obligatorio");	
					
				}else{
					flag = 1;
					document.getElementById('alertiip').style.display = 'block';
					$("#alertiip").text("*Ip invalido");
				
			}
			if (schedulername == "" || schedulername == null) {
				flag = 1;
				document.getElementById('alertischedulername').style.display = 'block';
				$("#alertischedulername").text("*Este campo es obligatorio");
			}
			if (severity == "" || severity == null) {
				flag = 1;
				document.getElementById('alerticboSeverity').style.display = 'block';
				$("#alerticboSeverity").text("*Este campo es obligatorio");
			}

			return flag;
		}// Fin funcion validarModalNew
		
      	function validarModalEdit() {

			limpiarAlertasEdit();
			var flag = 0; // 0 validacion OK, 1 validación con alertas

			var cboresource = $('#ucboResource').val();
			var ip = $('#uIP').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
			var schedulername = $('#uSchedulername').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
			var tipo = $('#uTipo').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
			var severity = $('#ucboSeverity').val();
			RegE = /^\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}$/
			
			if (cboresource == "" || cboresource == null) {
				flag = 1;
				document.getElementById('alertucboResource').style.display = 'block';
				$("#alertucboResource").text("*Este campo es obligatorio");
			}
			if (ip.match(RegE)) {
				
			}else if (ip == "" || ip == null)
			{
				flag = 1;
				document.getElementById('alertuip').style.display = 'block';
				$("#alertuip").text("*Este campo es obligatorio");	
				
			}else{
				flag = 1;
				document.getElementById('alertuip').style.display = 'block';
				$("#alertuip").text("*Ip invalido");
			
			}
			if (schedulername == "" || schedulername == null) {
				flag = 1;
				document.getElementById('alertuschedulername').style.display = 'block';
				$("#alertuschedulername").text("*Este campo es obligatorio");
			}
			if (severity == "" || severity == null) {
				flag = 1;
				document.getElementById('alertucboSeverity').style.display = 'block';
				$("#alertucboSeverity").text("*Este campo es obligatorio");
			}

			return flag;
		}// Fin funcion validarModalEdit
		
		function validar(e) {
			tecla = (document.all) ? e.keyCode : e.which;
			patron = /[\x5C'"]/;
			te = String.fromCharCode(tecla);
			return !patron.test(te);
		}
      	
     // Inicio registrar Scheduler Backup
		$('#btnRegistrar').click(function() {

							limpiarAlertasNew();

							var cboresource = $('#icboResource').val();
							var ip = $('#iIP').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
							var schedulername = $('#iSchedulername').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
							var tipo = $('#iTipo').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
							var severity = $('#icboSeverity').val();
							
							
							var resultado;

							resultado = validarModalNew();

							if (resultado == "0") {
								var src = "ServletBackups";
								$.post(src,
												{
													strAccion : "3",
													strResource : cboresource,
													strIpaddress : ip,
													strSchedulername : schedulername,
													strTipo : tipo,
													strSeverity : severity
												},

												function(pdata) {
													var obj = JSON
															.parse(pdata);
													if (obj.RegistroBackup[0].codigo == "2") {
														document.getElementById('mensajeRegistrar').style.display = 'block';
														$("#mensajeRegistrar").text(obj.RegistroBackup[0].resultado);
													}else if(obj.RegistroBackup[0].codigo == "0"){
														document.getElementById('mensajeRegistrar').style.display = 'block';
														$("#mensajeRegistrar").text(obj.RegistroBackup[0].resultado);
													}else {
													
														listar_Backups();
														document.getElementById('mensajeRegistrar').style.display = 'none';
														$("#mensajeRegistrar").text("");
														$("#modalNew").modal('hide');
														activarAlertaConfirmacion('alertaConfirmacion');

													}
												});//Fin del POST
							} else { // resultado  == "1" -- se detectan errores
							}
						});
		//Fin registrar turno
      	
      	
   		   // Inicio registrar Unidad Logica
		$('#btnActualizar').click(function() {

							limpiarAlertasEdit();

							var cboresource = $('#ucboResource').val();
							var id =$('#uId').val();
							var ip = $('#uIP').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
							var schedulername = $('#uSchedulername').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
							var tipo = $('#uTipo').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
							var severity = $('#ucboSeverity').val();
														
							var resultado;

							resultado = validarModalEdit();

							if (resultado == "0") {
								var src = "ServletBackups";
								$.post(src,
												{
													strAccion : "4",
													strId : id,
													strResource : cboresource,
													strIpaddress : ip,
													strSchedulername : schedulername,
													strTipo : tipo,
													strSeverity : severity
												},

												function(pdata) {
													var obj = JSON
															.parse(pdata);
													if (obj.RegistroBackup[0].codigo == "2") {
														document.getElementById('mensajeEdit').style.display = 'block';
														$("#mensajeEdit").text(obj.RegistroBackup[0].resultado);
													}else if(obj.RegistroBackup[0].codigo == "0"){
														document.getElementById('mensajeEdit').style.display = 'block';
														$("#mensajeEdit").text(obj.RegistroBackup[0].resultado);
													}else {
													
														listar_Backups();
														document.getElementById('mensajeEdit').style.display = 'none';
														$("#mensajeEdit").text("");
														$("#modalEdit").modal('hide');
														activarAlertaConfirmacion('alertaConfirmacion');

													}
												});//Fin del POST
							} else { // resultado  == "1" -- se detectan errores
							}
						});
		//Fin registrar Scheduler Backup
		
		
		function eliminar(pId,pResource,pIP,pSchedulername,pTipo,pSeverity) {				

					if (confirm('¿Está seguro que desea Eliminar el Scheduler "'
							+ pSchedulername + '"?')) {

						var src = "ServletBackups";
						//Inicio POST actualizar estado Tarea
						$
								.post(
										src,
										{
											strAccion : "5",
											strId : pId,
											strResource : pResource,
											strIpaddress : pIP,
											strSchedulername : pSchedulername,
											strTipo : pTipo,
											strSeverity : pSeverity
										},
										function(pdata) {
											var obj = JSON.parse(pdata);
											if (obj.RegistroBackup[0].codigo == "0") {
												activarAlertaError();
												listar_Backups();
											} else {
												activarAlertaConfirmacion();
												listar_Backups();
											}
										});
						//Fin Actualizar estado Turno
					} else {
						return false;

					}
				
			}
		
		function opcionesHtml() {
						var src = "ServletBackups";
						$.post(src,{strAccion : "0"},
										function(pdata) {

											var obj = JSON.parse(pdata);
											var perfil = obj.Sesion[0].perfil;

											$("#pPerfil").val(perfil);										
										});
						
					}
   		
</script>
<script>
            $(function () {
                //Initialize Select2 Elements
                $(".select2").select2();
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
