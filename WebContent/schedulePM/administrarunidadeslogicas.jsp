<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>UNIDADES LÓGICAS  | IBM</title>
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
            UNIDADES LOGICAS
            <small>IBM</small>
          </h1>
          <ol class="breadcrumb">
            <li><i class="fa fa-th-large"></i> IBM</li>
            <li class="active">Unidades Lógicas</li>
          </ol>
        </section>
        <input type="hidden" style="width: 100%;" class="form-control" id="pRendimiento">

        <!-- Main content -->
        <section class="content">
        <button title="Nueva Tarea" type="button" class="btn bg-blue"
		data-toggle="modal" data-target="#modalNew" onclick="refreshCombos()">
		<i class="fa fa-file-text-o"></i> Nuevo
		</button>
		<button title="Actualizar lista de Tareas" type="button"
		class="btn  bg-blue" onclick="listar_Unidades()">
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
						<a class="label-primary">Nueva Unidad Lógica&nbsp;&nbsp;</a><a
							style="color: red; font-weight: bold;"></a>
					</h4>
				</div>
				<div class="modal-body">
					<input type="hidden" style="width: 100%;" class="form-control" id="iIdtarea"> <label for="recipient-name" class="control-label">Resource ID</label>
						<div class="form-group">
							<p id="alerticboResource" class="text-danger" style='display: none;'></p>
							<select class="form-control select2" style="width: 100%;" id="icboResource">
								<option value="">--SELECCIONE--</option>
							</select>
						</div>						
						<div class="form-group">
							<label for="recipient-name" class="control-label">IP</label>
							<p id="alertiip" class="text-danger" style='display: none;'></p>
							<input type="text" style="width: 100%;" class="form-control" id="iIP" onkeypress="return validar(event)">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Tower</label>
							<p id="alerticboTower" class="text-danger" style='display: none;'></p>
							<select class="form-control select2" style="width: 100%;" id="icboTower">
								<option value="">--SELECCIONE--</option>
								<option value="bk">backups</option>
								<option value="c2">Cliente gromero Microsoft</option>
								<option value="cl">Cliente</option>
								<option value="dm">data managment</option>
								<option value="ec">email colaboration</option>
								<option value="nw">networking</option>
								<option value="sa">SAP</option>
								<option value="w2">wme de rimac</option>
								<option value="web">web</option>
								<option value="wm">wme</option>
							</select>
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Disk</label>
							<p id="alertidisk" class="text-danger" style='display: none;'></p>
							<input type="text" style="width: 100%;" class="form-control" id="iDisk" onkeypress="return validar(event)">
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
					<input type="hidden" style="width: 100%;" class="form-control" id="uIdtarea"> <label for="recipient-name" class="control-label">Resource ID</label>
						<div class="form-group">
							<p id="alertucboResource" class="text-danger" style='display: none;'></p>
							<select class="form-control select2" style="width: 100%;" id="ucboResource">
								<option value="">--SELECCIONE--</option>
							</select>
						</div>						
						<div class="form-group">
							<label for="recipient-name" class="control-label">IP</label>
							<p id="alertuip" class="text-danger" style='display: none;'></p>
							<input type="text" style="width: 100%;" class="form-control" id="uIP" onkeypress="return validar(event)">
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Tower</label>
							<p id="alertucboTower" class="text-danger" style='display: none;'></p>
							<select class="form-control select2" style="width: 100%;" id="ucboTower">
								<option value="">--SELECCIONE--</option>
								<option value="bk">backups</option>
								<option value="c2">Cliente gromero Microsoft</option>
								<option value="cl">Cliente</option>
								<option value="dm">data managment</option>
								<option value="ec">email colaboration</option>
								<option value="nw">networking</option>
								<option value="sa">SAP</option>
								<option value="w2">wme de rimac</option>
								<option value="web">web</option>
								<option value="wm">wme</option>
							</select>
						</div>
						<div class="form-group">
							<label for="recipient-name" class="control-label">Disk</label>
							<p id="alertudisk" class="text-danger" style='display: none;'></p>
							<input type="text" style="width: 100%;" class="form-control" id="uDisk" onkeypress="return validar(event)">
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
                  <h3 class="box-title">DETALLE DE UNIDADES LÓGICAS</h3>
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
	listar_Unidades();
	
   //  alert('p');

	
    
    }); // Fin del $(document)
    

    
		function tablaHtml(){
			
			//var perfil = $("#pPerfil").val();      	
         					  
         					 var tabla = "<table id=\"example1\" class=\"table table-bordered table-striped table-responsive table-hover\" "
         					          + "class=\"display\" width=\"99%\" cellspacing=\"0\" style=\"font-size:10px; font-weight:bold\" >"
         	                 		  + "<thead class=\"bg-primary\">"
         	                 		  + "<tr>"
         	                 		  + "<th>N°</th>"
         	                 		  + "<th>RESOURCE ID</th>"
         	                 		  + "<th>IP</th>"
         				        	  + "<th>TOWER</th>"
         				          	  + "<th>DISK</th>"
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

			var src = "ServletUnidadesLogicas";
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
			$('#icboTower').val("").trigger('change');
			$('#iDisk').val('');
			$('#ucboResource').val("").trigger('change');
			$('#uIP').val('');
			$('#ucboTower').val("").trigger('change');
			$('#uDisk').val('');
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
     				document.getElementById('alerticboTower').style.display = 'none';
     				document.getElementById('alertiip').style.display = 'none';
     				document.getElementById('alertidisk').style.display = 'none';
     			} // Fin funcion limpiarAlertasNew		       
     function limpiarAlertasEdit() {
    				document.getElementById('alertucboResource').style.display = 'none';
    				document.getElementById('alertucboTower').style.display = 'none';
    				document.getElementById('alertuip').style.display = 'none';
    				document.getElementById('alertudisk').style.display = 'none';
    			} // Fin funcion limpiarAlertasEdit 		
        		
     function modalEditar(id, resourceid, ip, tower, disk) {

    				limpiarAlertasEdit();
    				limpiarModales();

    				$("#uId").val(id);
    				$("#ucboResource").val(resourceid).trigger('change');
    				$("#uIP").val(ip);
    				$("#ucboTower").val(tower).trigger('change');
    				$("#uDisk").val(disk);

    			}// Fin funcion modalEditar		
        		
 
        function listar_Unidades(){
            var $modal = $('.js-loading-bar');
            $modal.modal('show');
       	 	var src = "ServletUnidadesLogicas";       	 	
        	$.post(src, {strAccion:"1"}, 

       				function(pdata) {
       			     
       				  var obj = JSON.parse(pdata);
       				  var datatabla = [];
       				  var numeracion = 0;
       				    
       				  if(obj.ListaUnidadesLogicas[0].id == ""){
       					
       					}else{
       						  for(i = 0 ; i < obj.ListaUnidadesLogicas.length ; i++ ){	
       							  
       							  	numeracion = numeracion + 1;
       							  	var arr = [];
       							 var perfil = $("#pPerfil").val();
       							//captura de datos
       								var id = obj.ListaUnidadesLogicas[i].id;
       								var resourceid = obj.ListaUnidadesLogicas[i].resource_id;
       								var ip = obj.ListaUnidadesLogicas[i].ip;
       								var tower = obj.ListaUnidadesLogicas[i].tower;
       								var towerdesc = obj.ListaUnidadesLogicas[i].towerdesc;
       								var disk = obj.ListaUnidadesLogicas[i].disk;
       								var customercode = obj.ListaUnidadesLogicas[i].customercode;
       								var customer = obj.ListaUnidadesLogicas[i].customer;
       								var btnEstado="";	
       								if (perfil == 'ADMINISTRADOR'){
       								btnEstado = "<button title=\"Eliminar Unidad Logica\" type=\"button\" class=\"btn bg-red\"  onclick=\"eliminar('"
										+ id
										+ "','"
										+ resourceid
										+ "','"
										+ ip
										+ "','"
										+ tower
										+ "','"
										+ disk
										+ "')\"><i class=\"fa fa-trash\"></i></button>&nbsp;";
       						  		}
           							arr.push(numeracion);
           							arr.push(resourceid);
    								arr.push(ip);						
    								arr.push(towerdesc);
    								arr.push(disk);
    								arr.push(customercode);
    								arr.push(customer);
    								arr
									.push("<button title=\"Editar Unidad Lógica\" type=\"button\" class=\"btn bg-yellow\" data-toggle=\"modal\" data-target=\"#modalEdit\" "
											+ " onclick=\"modalEditar('"
											+ id
											+ "','"
											+ resourceid
											+ "','"
											+ ip
											+ "','"
											+ tower
											+ "','"
											+ disk
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
			var cbotower = $('#icboTower').val();
			var ip = $('#iIP').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
			var disk = $('#iDisk').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
			
			//console.log('==>' + iselSeleccion + ' | ' + ifecha);
			
			
			if (cboresource == "" || cboresource == null) {
				flag = 1;
				document.getElementById('alerticboResource').style.display = 'block';
				$("#alerticboResource").text("*Este campo es obligatorio");
			}
			
			if (cbotower == "" || cbotower == null) {
				flag = 1;
				document.getElementById('alerticboTower').style.display = 'block';
				$("#alerticboTower").text("*Este campo es obligatorio");
			}
			if (disk == "" || disk == null) {
				flag = 1;
				document.getElementById('alertidisk').style.display = 'block';
				$("#alertidisk").text("*Este campo es obligatorio");
			}

			return flag;
		}// Fin funcion validarModalNew
		
      	function validarModalEdit() {

			limpiarAlertasEdit();
			var flag = 0; // 0 validacion OK, 1 validación con alertas

			var cboresource = $('#ucboResource').val();
			var cbotower = $('#ucboTower').val();
			var ip = $('#uIP').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
			var disk = $('#uDisk').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
			
			if (cboresource == "" || cboresource == null) {
				flag = 1;
				document.getElementById('alertucboResource').style.display = 'block';
				$("#alertucboResource").text("*Este campo es obligatorio");
			}
			
			if (cbotower == "" || cbotower == null) {
				flag = 1;
				document.getElementById('alertucboTower').style.display = 'block';
				$("#alertucboTower").text("*Este campo es obligatorio");
			}
			if (disk == "" || disk == null) {
				flag = 1;
				document.getElementById('alertudisk').style.display = 'block';
				$("#alertudisk").text("*Este campo es obligatorio");
			}

			return flag;
		}// Fin funcion validarModalEdit
		
		function validar(e) {
			tecla = (document.all) ? e.keyCode : e.which;
			patron = /[\x5C'"]/;
			te = String.fromCharCode(tecla);
			return !patron.test(te);
		}
      	
     // Inicio registrar Unidad Logica
		$('#btnRegistrar').click(function() {

							limpiarAlertasNew();

							var cboresource = $('#icboResource').val();
							var cbotower = $('#icboTower').val();
							var ip = $('#iIP').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
							var disk = $('#iDisk').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
							
							
							var resultado;

							resultado = validarModalNew();

							if (resultado == "0") {
								var src = "ServletUnidadesLogicas";
								$.post(src,
												{
													strAccion : "3",
													strResource : cboresource,
													strIp : ip,
													strTower : cbotower,
													strDisk : disk
												},

												function(pdata) {
													var obj = JSON
															.parse(pdata);
													if (obj.RegistroUnidadLogica[0].codigo == "2") {
														document.getElementById('mensajeRegistrar').style.display = 'block';
														$("#mensajeRegistrar").text(obj.RegistroUnidadLogica[0].resultado);
													}else if(obj.RegistroUnidadLogica[0].codigo == "0"){
														document.getElementById('mensajeRegistrar').style.display = 'block';
														$("#mensajeRegistrar").text(obj.RegistroUnidadLogica[0].resultado);
													}else {
													
														listar_Unidades();
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
							var cbotower = $('#ucboTower').val();
							var id =$('#uId').val();
							var ip = $('#uIP').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
							var disk = $('#uDisk').val().split("\n").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
														
							var resultado;

							resultado = validarModalEdit();

							if (resultado == "0") {
								var src = "ServletUnidadesLogicas";
								$.post(src,
												{
													strAccion : "4",
													strId : id,
													strResource : cboresource,
													strIp : ip,
													strTower : cbotower,
													strDisk : disk
												},

												function(pdata) {
													var obj = JSON
															.parse(pdata);
													if (obj.RegistroUnidadLogica[0].codigo == "2") {
														document.getElementById('mensajeEdit').style.display = 'block';
														$("#mensajeEdit").text(obj.RegistroUnidadLogica[0].resultado);
													}else if(obj.RegistroUnidadLogica[0].codigo == "0"){
														document.getElementById('mensajeEdit').style.display = 'block';
														$("#mensajeEdit").text(obj.RegistroUnidadLogica[0].resultado);
													}else {
													
														listar_Unidades();
														document.getElementById('mensajeEdit').style.display = 'none';
														$("#mensajeEdit").text("");
														$("#modalEdit").modal('hide');
														activarAlertaConfirmacion('alertaConfirmacion');

													}
												});//Fin del POST
							} else { // resultado  == "1" -- se detectan errores
							}
						});
		//Fin Actualizar Unidad Logica
		
		//Inicio de Eliminar Unidad Logica
					function eliminar(pId,pResourceid,pIP,pTower,pDisk) {				

					if (confirm('¿Está seguro que desea Eliminar la Unidad Logica "'
							+ pDisk + '"?')) {

						var src = "ServletUnidadesLogicas";
						//Inicio POST actualizar estado Tarea
						$
								.post(
										src,
										{
											strAccion : "5",
											strId : pId,
											strResource : pResourceid,
											strIp : pIP,
											strTower : pTower,
											strDisk : pDisk
										},
										function(pdata) {
											var obj = JSON.parse(pdata);
											if (obj.RegistroUnidadLogica[0].codigo == "0") {
												activarAlertaError();
												listar_Unidades();
											} else {
												activarAlertaConfirmacion();
												listar_Unidades();
											}
										});
						//Fin Actualizar estado Turno
					} else {
						return false;

					}
				
			}
		
		
					function opcionesHtml() {
						var src = "ServletUnidadesLogicas";
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
