<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SCHEDULE  | CROSS</title>
    
    <style>
    
    	#example1 td{
    		font-weight: lighter !important;
    	}
    
	    .filtros th{
	    	padding: 10px 7px !important;
	    }
	    
	     td div.details-control {
		    background: url('http://www.datatables.net/examples/resources/details_open.png') no-repeat center center;
		    cursor: pointer;
		    width: 40px;
			height: 40px;
		}
		tr.shown td div.details-control {
		    background: url('http://www.datatables.net/examples/resources/details_close.png') no-repeat center center;
		}
		
		table.dataTable tbody tr.selected {
		    background-color: #f9f9f9;
		}
		
		/* td Child */
		.td-child{
			padding: 0px !important;
			padding-left: 61px !important;
			padding-right: 199px !important;
		}

		.table-child{
			margin: 0px;
		}

		.thead-child{
			color: black;
			background: white;
		}
		.thead-child th{
			border: none;
			background: white;
			border-bottom-style: dotted !important;
		}

		.table-child td{
			border: none;

		}
    </style>
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
      <aside class="right-side"> <!-- Content Header (Page header) -->
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Detalle de Schedule
            <small>Schedule</small>
          </h1>
          <ol class="breadcrumb">
            <li><i class="fa fa-th-large"></i> Schedule</li>
            <li class="active">Detalle de Schedule</li>
          </ol>
        </section>
        <input type="hidden" style="width: 100%;" class="form-control" id="pPerfil">
	    <input type="hidden" style="width: 100%;" class="form-control" id="pTeam">
        <!-- Main content -->
        <section class="content">
         <div>
         Seleccione Estado : 
         <select class="form-control select2" name="c_plataforma" style="width: 180px;" id="cboEstado">

		  <option value="1"> ATENDIDO </option>
		  <option value="2" selected> NO ATENTIDO </option>
		  <option value="3"> TODOS </option>
		</select>
		<button id="btnBuscar" title="Buscar" type="button" class="btn btn-info btn-sm"><i class="fa fa-search"></i> Buscar </button>
<!-- 		<button id=\"play"+numeracion+"\"   style='display:block;' onclick=\"iniciar('play"+numeracion+"','pInicio"+numeracion+"','stop"+numeracion+"', '"+idScheact+"','"+idSchedule+"')\" >INICIAR </button> -->
		<br><br>
         </div>   
         <div id="alertaConfirmacion" class="alert alert-success alert-dismissable fade in" style='display:none;'>
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong>Éxito!</strong>  Su operación se ha realizado satisfactoriamente.
		  </div>
		  
		  <div id="alertaError" class="alert alert-danger alert-dismissable fade in" style='display:none;'>
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong>Error!</strong>  No se pudo completar el proceso de registro o actualización.
		  </div>

         <div class="row"> 
             <div class="col-md-12">
                <div class="box">
                <div class="box-header">
                  <h3 class="box-title">DETALLE DE ACTIVIDADES DEL SCHEDULE</h3>
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


<!-- Modal DESCRIPCION -->
<div class="modal fade" id="mdRCT" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
         <h4 class="modal-title">Descripción del RCT</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        	<input type="hidden" id="hdIdPerfil2">
        		<div class="form-group">        			
        			<input id="descripcionRCT" style="height:  40px" class="form-control col-xs-12 col-sm-12 col-md-12 col-lg-12"></input>
        		</div>
        		<br>
        		<br>
        		<div class="form-inline">
        			<div class="form-group">
        				<a onclick="valorinput()" class="btn btn-primary btn-sm">
		        			<i class="fa fa-floppy-o"  aria-hidden="true"></i> Enviar
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
</div><!-- Modal FIN DESCRIPCION -->

<script>     

$(document).ready(function() {
	
// 	listar_detalle_schedule();
// 	var vTeam = document.getElementById('hdIdTeam').value;
		perfil();
	
	
    }); // Fin del $(document)
    
	    function perfil(){
			
			var src = "ServletSesion";
	 	 	
	 		//Inicio POST para  listar información en la tabla
	 	 	$.post(src, {strAccion:"0"}, 
	 					function(pdata) {
	 				     
	 					  var obj = JSON.parse(pdata);
	   					   
	 					  var perfil = obj.Sesion[0].perfil;
	 					  var team = obj.Sesion[0].team;
	 					 
	 					  $("#pPerfil").val(perfil);
	 					  $("#pTeam").val(team);
	 					 
	 					 	tablaHtml();
	 						listar_detalle_schedule("2");
	 					  
	 	 	});
		}
    
		function tablaHtml(){
			
			var perfil = $("#pPerfil").val();      	
         					  
         					 var tabla = "<table id=\"example1\" class=\"table table-bordered table-responsive table-hover\" "
         					          + "class=\"display\" width=\"99%\" cellspacing=\"0\" style=\"font-size:10px; font-weight:bold\" >"
         	                 		  + "<thead class=\"bg-primary\">"
         	                 		  + "<tr>"
         	                 		  + "<th>Nª</th>"
         	                 		  + "<th>HORA EJEC</th>"
         	                 		  + "<th>DESCRIPCIÓN</th>";
         				          
//          				     if(perfil == 'ADMINISTRADOR'){	//--BG001
         				         tabla +="<th>PERIODO</th>";  
//          				     }
         	                 	
         	                 	  tabla += "<th>HORA LIMITE</th>"
         				        	 	+ "<th>PROCEDIMIENTO</th>"
         				          		+ "<th>CLIENTE</th>"
         		                     	+ "<th>SERVIDOR</th>"
         		                     	+ "<th>TWS</th>"
         		                     	+ "<th>COMENTARIO</th>"
         		                     	+ "<th>HORA INICIO</th>"
         		                     	+ "<th>HORA FIN</th>"
         		                     	+ "<th>OBSERVACIONES</th>"
         		                     	+ "<th>ESTADO</th>"
         		                     	+ "</tr>"
         		                     	+ "</thead>"
         		                     	+ "<thead class=\"filters\" >"
         		                     	+ "<tr class='filtros'>"
         		                     	+ "<th style=\"border: hidden\"></th>"
         		                     	+ "<th style=\"border: hidden\"></th>"
         		                     	+ "<th style=\"border: hidden\"></th>";
         				          
//          				         if(perfil == 'ADMINISTRADOR'){ //--BG001
         				        	tabla += "<th style=\"border: hidden\"></th>";
//          				          }

         				          tabla +="<th style=\"border: hidden\"></th>"
         				         		+"<th style=\"border: hidden\"></th>"
         				         		+"<th style=\"border: hidden\"></th>"
         				         		+"<th style=\"border: hidden\"></th>"
         				         		+"<th style=\"border: hidden\"></th>"
         				         		+"<th style=\"border: hidden\"></th>"
         				         		+"<th style=\"border: hidden\"></th>"
         				         		+"<th style=\"border: hidden\"></th>"
         				         		+"<th style=\"border: hidden\" hidden></th>"
         				         		+"<th style=\"border: hidden\" hidden></th>"
         				         		+"</tr>"
         				         		+"</thead>" 
         				         		+"</table>";
  	
         			        document.getElementById("divTabla").innerHTML = tabla; 
 
            }
    
    
	    function generaCabecera(){
	    	var src = "ServletDetalleSchedule";
	    	$.post(src, {strAccion:"9"}, 
	   				function(pdata) {
	    			
	    			var obj = JSON.parse(pdata);
	    			console.log(obj)
	    			if(obj.CabeceraSchedule[0].cabecera != ""){
	    				
		    			$("#idCabecera").text(obj.CabeceraSchedule[0].cabecera);
		    	    	
	    			}
	    	});
		}
    
	    $('#btnBuscar').click(function(){
	    	
	    	var icboEstado = $('#cboEstado').val(); 
	    	
	    	listar_detalle_schedule(icboEstado);
	    	
	    });
    
    	function iniciar(idbtnplay, idpInicio, idbtnstop, idScheact, idSche){
    		
	    	document.getElementById(idbtnplay).style.display = 'none';
	    	
	    	document.getElementById(idbtnplay+"RCThi").style.display = 'none';// esconde el boton RCT en el campo HoraInicio
	    	
	    	var src = "ServletDetalleSchedule";
	    	$.post(src, {strAccion:"3", strIdScheduleActividad: idScheact, strIdSchedule: idSche}, 
       				function(pdata) {
	    			
	    			var obj = JSON.parse(pdata);
	    			
	    			if(obj.BeanScheduleActividad[0].idScheduleActividad != ""){
	    				var horaActual = obj.BeanScheduleActividad[0].horaInicio;
		    			document.getElementById(idpInicio).style.display = 'block'; 	
		    			$("#"+idpInicio).text(horaActual); 	
		    	    	document.getElementById(idbtnstop).style.display = 'block';
		    	    	
		    	    	document.getElementById(idbtnstop+"RCThf").style.display = 'block'; //muestra boton RCT en el campo HoraFin
		    	    	
	    			}
	    			
	    	});
	    	
    	}
    
    	function detener(idbtnstop, idpFin, idScheact, idSche){
    		document.getElementById(idbtnstop).style.display = 'none';
    		var src = "ServletDetalleSchedule";
	    	$.post(src, {strAccion:"4", strIdScheduleActividad: idScheact, strIdSchedule: idSche}, 
       				function(pdata) {
	    			
	    			var obj = JSON.parse(pdata);
	    			
	    			if(obj.BeanScheduleActividad[0].idScheduleActividad != ""){
	    				var horaActual = obj.BeanScheduleActividad[0].horaFin;	
	    				document.getElementById(idpFin).style.display = 'block';
		    			$("#"+idpFin).text(horaActual);
	    			}
	    			
	    			//eliminar fila
	    			var table = $('#example1').DataTable();
	    			table.row('.selected').remove().draw( false );
	    			table.$('tr.selected').removeClass('selected');
	    	});
    	}
    	
    	function registrarComentario(idScheact, idtextcomentario, idSche){
    		
    		var src = "ServletDetalleSchedule";
    		var comentario = $("#"+idtextcomentario).val().split("\n").join(" ").trim();
    		
	    	$.post(src, {strAccion:"5", strIdScheduleActividad: idScheact, strComentario: comentario, strIdSchedule: idSche}, 
       				function(pdata) {
	    			
	    			var obj = JSON.parse(pdata);
	    			
	    			if(obj.ActualizarComentario[0].codigo > 0){
	    				activarAlertaConfirmacion();	
	    			}else{
	    				activarAlertaError();
	    			}
	    			
	    	});
    	}
    	
		function registrarEstado(idScheact, idSelectEstado, idSche){
    		
    		var src = "ServletDetalleSchedule";
    		var estado = $("#"+idSelectEstado).val();
    		
	    	$.post(src, {strAccion:"6", strIdScheduleActividad: idScheact, strEstado: estado, strIdSchedule: idSche}, 
       				function(pdata) {
	    			
	    			var obj = JSON.parse(pdata);
	    			
	    			if(obj.ActualizarEstado[0].codigo > 0){
	    				activarAlertaConfirmacion();	
	    			}else{
	    				activarAlertaError();
	    			}
	    			
	    	});
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
        
        var prueba=[];
       	var prueba2 =[];
 
              		
        function listar_detalle_schedule(pTipoDeVista){
        	// Haciendo visible Modal con Barra de progreso 
            var $modal = $('.js-loading-bar');
            $modal.modal('show');
            
        	var perfil = $("#pPerfil").val();  
       	 	var src = "ServletDetalleSchedule";   	
       	 	var filtro = pTipoDeVista;
       	 
       	//Inicio POST para completar listar información en la tabla
        	$.post(src, {strAccion:"2" }, 

       				function(pdata) {
       			     
       				  var obj = JSON.parse(pdata);
       				  var datatabla = [];
       				  var numeracion = 0;
       					console.log(obj)
       				  if(obj.ListaScheduleActividad[0].idScheduleActividad == ""){
       					
       					}else{
       						  generaCabecera(); // Funcion generar combo Select para tipo de vista
       						
       						  if($("#pTeam").val() == 'SURA'){
       							 
       							 for(i = 0 ; i < obj.ListaScheduleActividad.length ; i++ ){	
       								
       								numeracion = numeracion + 1;
       								var idSede = obj.ListaScheduleActividad[i].idSede;
       								var idActividad = obj.ListaScheduleActividad[i].idActividad;
       								var idTurno = obj.ListaScheduleActividad[i].idTurno;
     							 	var descripcionTurno = obj.ListaScheduleActividad[i].descripcionTurno;
     							 	var descripcionSede = obj.ListaScheduleActividad[i].descripcionSede;
     								var horaEjecucion = obj.ListaScheduleActividad[i].horaEjecucion;
     								var descripcion = obj.ListaScheduleActividad[i].descripcion;
     								var horaTermino = obj.ListaScheduleActividad[i].horaTermino;
     								var idPeriodo = obj.ListaScheduleActividad[i].idPeriodo;
     								var descripcionPeriodo = obj.ListaScheduleActividad[i].descripcionPeriodo;
     								var idPlataforma = obj.ListaScheduleActividad[i].idPlataforma;
     								var descripcionPlataforma = obj.ListaScheduleActividad[i].descripcionPlataforma;
     								var idProcedimiento = obj.ListaScheduleActividad[i].idProcedimiento;
     								var descripcionProcedimiento = obj.ListaScheduleActividad[i].descripcionProcedimiento;
     								var idServidor = obj.ListaScheduleActividad[i].idServidor;
     								var descripcionServidor = obj.ListaScheduleActividad[i].descripcionServidor;
     								var idCliente = obj.ListaScheduleActividad[i].idCliente;
     								var descripcionCliente = obj.ListaScheduleActividad[i].descripcionCliente;
     								var jobStream = obj.ListaScheduleActividad[i].jobStream;
     								var idTipoActividad = obj.ListaScheduleActividad[i].idTipoActividad;
     								var descripcionTipoActividad = obj.ListaScheduleActividad[i].descripcionTipoActividad;
     								var estado = obj.ListaScheduleActividad[i].estado;
     								var accion = obj.ListaScheduleActividad[i].accion;
     								var idTipoRespaldo = obj.ListaScheduleActividad[i].idTipoRespaldo;
     								var descripcionTipoRespaldo = obj.ListaScheduleActividad[i].descripcionTipoRespaldo;
     								var duracion = obj.ListaScheduleActividad[i].duracion;
     								var comentario = obj.ListaScheduleActividad[i].comentario;
     								var ventanaMax = obj.ListaScheduleActividad[i].ventanaMax;
     								var tws = obj.ListaScheduleActividad[i].tws;
     								var idScheact = obj.ListaScheduleActividad[i].idScheact;
     								var idSchedule = obj.ListaScheduleActividad[i].idSchedule;
     								var estadoschedact = obj.ListaScheduleActividad[i].estadoschedact;
     								var ip = obj.ListaScheduleActividad[i].ip;
     								
     								var duracion = obj.ListaScheduleActividad[i].duracion;
     								var comentariosched = obj.ListaScheduleActividad[i].comentariosched;
     								var usermod = obj.ListaScheduleActividad[i].usermod;
     								var estadotar = obj.ListaScheduleActividad[i].estadotar;
     								var cboEstado ;
       								prueba2 =  obj.ListaScheduleActividad;
       									
	       							  	var arr = [];
	       							 	var subtareas=0;
	       							 	
	       							 	
	       							  
	       								//captura de datos
	       								
	     							    var horaInicio = obj.ListaScheduleActividad[i].horaInicio;
	     								var horaFin = obj.ListaScheduleActividad[i].horaFin;
	     								var varHORAEJECUCION = "'" + horaEjecucion+ "',";
										var varHORATERMINO  = "'" +horaTermino + "',";
										var varHORAINICIO  = "'" + horaInicio+ "'";
	     								
	     								if(horaInicio == null || horaInicio == "" || horaInicio == "null"){
	       									horaInicio = "<button id=\"play"+numeracion+"\" title=\"Iniciar Actividad\" type=\"button\" class=\"btn btn-warning btn-xs\" style='display:block;' onclick=\"iniciar('play"+numeracion+"','pInicio"+numeracion+"','stop"+numeracion+"', '"+idScheact+"','"+idSchedule+"')\" ><i class=\"fa fa-play\"></i> INICIAR </button>"+
	       									"<button id=\"play"+numeracion+"RCThi"+"\" title=\"RCT Actividad\" type=\"button\" class=\"btn btn-primary btn-xs\" style='display:block;' onclick=\"modalRCT("+idCliente+","+idServidor+","+idTurno+",'"+horaEjecucion+"','"+horaTermino+"',"+idActividad+","+idSchedule+",'"+horaInicio+"')\"><i class=\"fa fa-cog fa-spin fa-fw\"></i> RCT</button>"+
	   							  			"<p id=\"pInicio"+numeracion+"\" style='display:none;'></p>";
	       									horaFin = "<button id=\"stop"+numeracion+"\" title=\"Detener Actividad\" type=\"button\" class=\"btn btn-warning btn-xs\" style='display:none;' onclick=\"detener('stop"+numeracion+"','pFin"+numeracion+"', '"+idScheact+"','"+idSchedule+"')\"><i class=\"fa fa-stop\"></i> TERMINAR </button>"+
	       									
	   							 			"<p id=\"pFin"+numeracion+"\" style='display:none;'></p>"+
	   							 		"<button id=\"stop"+numeracion+"RCThf"+"\" title=\"RCT Actividad\" type=\"button\" class=\"btn btn-primary btn-xs\" style='display:none;' onclick=\"modalRCT("+idCliente+","+idServidor+","+idTurno+","+varHORAEJECUCION+varHORATERMINO+idActividad+","+idSchedule+","+varHORAINICIO+")\"><i class=\"fa fa-cog fa-spin fa-fw\"></i> RCT</button>";
	       								
	     								
	     								
	     								
	     								
	     								}else if(horaFin == null || horaFin == "" || horaFin == "null"){
	       									horaFin = "<button id=\"stop"+numeracion+"\" title=\"Detener Actividad\" type=\"button\" class=\"btn btn-warning btn-xs\" style='display:block;' onclick=\"detener('stop"+numeracion+"','pFin"+numeracion+"', '"+idScheact+"','"+idSchedule+"')\"><i class=\"fa fa-stop\"></i> TERMINAR </button>"+
	       									"<button id=\"stop"+numeracion+"RCThf"+"\" title=\"RCT Actividad\" type=\"button\" class=\"btn btn-primary btn-xs\" style='display:block;' onclick=\"modalRCT("+idCliente+","+idServidor+","+idTurno+","+varHORAEJECUCION+varHORATERMINO+idActividad+","+idSchedule+","+varHORAINICIO+")\"><i class=\"fa fa-cog fa-spin fa-fw\"></i> RCT</button>"+
	   							 			"<p id=\"pFin"+numeracion+"\" style='display:none;'></p>";
	       								}
	       								 
	       								
	     							   for(a = 0 ; a < obj.ListaScheduleActividad.length ; a++ ){
	     								   if (idActividad == obj.ListaScheduleActividad[a].idSede) {
	     									  subtareas++;
	     									  
										   }
	     							   }
	       								
	       								if(estadotar == 0){
	           							 	cboEstado = "<select id=\"cboEstado"+numeracion+"\" class=\"form-control\" name=\"estado\" style=\"width: 100%; font-size:10px; font-weight:bold\" onChange=\"registrarEstado('"+idScheact+"','cboEstado"+numeracion+"','"+idSchedule+"')\">"+
	    			            						"<option value=\"0\" selected >OK</option><option value=\"1\">FALLIDO</option><option value=\"2\">N/A</option></select>";	
	           							}
	           							if(estadotar == 1){
	           							 	cboEstado = "<select id=\"cboEstado"+numeracion+"\" class=\"form-control\" name=\"estado\" style=\"width: 100%; font-size:10px; font-weight:bold\" onChange=\"registrarEstado('"+idScheact+"','cboEstado"+numeracion+"','"+idSchedule+"')\">"+
	    			            				"<option value=\"0\">OK</option><option value=\"1\" selected >FALLIDO</option><option value=\"2\">N/A</option></select>";	
	           							}
	           							if(estadotar == 2){
	           							 	cboEstado = "<select id=\"cboEstado"+numeracion+"\" class=\"form-control\" name=\"estado\" style=\"width: 100%; font-size:10px; font-weight:bold\" onChange=\"registrarEstado('"+idScheact+"','cboEstado"+numeracion+"','"+idSchedule+"')\">"+
	    			            				"<option value=\"0\">OK</option><option value=\"1\">FALLIDO</option><option value=\"2\" selected >N/A</option></select>";	
	           							}
	           							
	           							
	           							//Cambio numeración x idactividad
// 	           							arr.push(subtareas > 0 ? "<div class='details-control'></div>" : " ");
	           							arr.push(numeracion);
	           							
	           							if (subtareas > 0) {
	           								
		       									horaInicio = "";
		       									
		       									horaFin = "";
		       								
										}
	           							
	           							if(filtro == "3"){ // añadir a la tabla todos los registros
	           								arr.push(horaEjecucion);
	    									arr.push(descripcion);
// 	    									if(perfil == 'ADMINISTRADOR'){ //--BG001
	    										arr.push(descripcionPeriodo);
// 	    	         				        }
	    									
	    									arr.push(horaTermino);
	    									arr.push(descripcionProcedimiento);
	    								 	arr.push(descripcionCliente);
	    								 	arr.push(descripcionServidor +" - " +ip);
	    								  	arr.push(idActividad);
	    								 	arr.push(comentario);
	    								 	arr.push(horaInicio);
	           							 	arr.push(horaFin);
	           							 	arr.push("<textarea cols=\"10\"  id=\"observacion"+numeracion+"\" onChange=\"registrarComentario('"+idScheact+"','observacion"+numeracion+"','"+idSchedule+"')\" >"+comentariosched+"</textarea>");			         	
	           							 	arr.push(cboEstado);	
	           							 	
	           							 	datatabla.push(arr);
	           							 	
	           							}else if(filtro == "1"){ //añadir a la tabla solo los registros con fecha de finalización
	
	           								if(obj.ListaScheduleActividad[i].horaFin == null || obj.ListaScheduleActividad[i].horaFin == "" || obj.ListaScheduleActividad[i].horaFin == "null" || obj.ListaScheduleActividad[i].horaFin == " "){
	           								}else{
	           									arr.push(horaEjecucion);
	        									arr.push(descripcion);
// 	        									if(perfil == 'ADMINISTRADOR'){ //--BG001
	        										arr.push(descripcionPeriodo);
// 	        	         				        }
	        									arr.push(horaTermino);
	        									arr.push(descripcionProcedimiento);
	        								 	arr.push(descripcionCliente);
	        								 	arr.push(descripcionServidor +" - " +ip);
	        								  	arr.push(idActividad);
	        								 	arr.push(comentario);
	        								 	arr.push(horaInicio);
	               							 	arr.push(horaFin);
	               							 	arr.push("<textarea cols=\"10\"  id=\"observacion"+numeracion+"\" onChange=\"registrarComentario('"+idScheact+"','observacion"+numeracion+"','"+idSchedule+"')\" >"+comentariosched+"</textarea>");			         	
	               							 	arr.push(cboEstado);	
	               							 	
	               							 	datatabla.push(arr);
	           								}
	           								
	           							}else if(filtro == "2"){  //añadir a la tabla solo los registros sin fecha de finalización
	           								if(obj.ListaScheduleActividad[i].horaFin == null || obj.ListaScheduleActividad[i].horaFin == "" || obj.ListaScheduleActividad[i].horaFin == "null" || obj.ListaScheduleActividad[i].horaFin == " "){
	           									arr.push(horaEjecucion);
	        									arr.push(descripcion);
// 	        									if(perfil == 'ADMINISTRADOR'){ //--BG001
	        										arr.push(descripcionPeriodo);
// 	        	         				        }
	        									arr.push(horaTermino);
	        									arr.push(descripcionProcedimiento);
	        								 	arr.push(descripcionCliente);
	        								 	arr.push(descripcionServidor +" - " +ip);
	        								  	arr.push(idActividad);
	        								 	arr.push(comentario);
	        								 	arr.push(horaInicio);
	               							 	arr.push(horaFin);
	               							 	arr.push("<textarea cols=\"10\"  id=\"observacion"+numeracion+"\" onChange=\"registrarComentario('"+idScheact+"','observacion"+numeracion+"','"+idSchedule+"')\" >"+comentariosched+"</textarea>");			         	
	               							 	arr.push(cboEstado);
	               							 	
	               							 	datatabla.push(arr);
	           								}
	           							}
	       							
    
									}//Fin for - Sura
	       						}else{
	       						  for(i = 0 ; i < obj.ListaScheduleActividad.length ; i++ ){	
	       							  
	       							  	numeracion = numeracion + 1;
	       							  	var arr = [];
	       							  
	       							//captura de datos
	       							
	     							    var idActividad = obj.ListaScheduleActividad[i].idActividad;
	     							    var idTurno = obj.ListaScheduleActividad[i].idTurno;
	     							 	var descripcionTurno = obj.ListaScheduleActividad[i].descripcionTurno;
	     							 	var idSede = obj.ListaScheduleActividad[i].idSede;
	     							 	var descripcionSede = obj.ListaScheduleActividad[i].descripcionSede;
	     								var horaEjecucion = obj.ListaScheduleActividad[i].horaEjecucion;
	     								var descripcion = obj.ListaScheduleActividad[i].descripcion;
	     								var horaTermino = obj.ListaScheduleActividad[i].horaTermino;
	     								var idPeriodo = obj.ListaScheduleActividad[i].idPeriodo;
	     								var descripcionPeriodo = obj.ListaScheduleActividad[i].descripcionPeriodo;
	     								var idPlataforma = obj.ListaScheduleActividad[i].idPlataforma;
	     								var descripcionPlataforma = obj.ListaScheduleActividad[i].descripcionPlataforma;
	     								var idProcedimiento = obj.ListaScheduleActividad[i].idProcedimiento;
	     								var descripcionProcedimiento = obj.ListaScheduleActividad[i].descripcionProcedimiento;
	     								var idServidor = obj.ListaScheduleActividad[i].idServidor;
	     								var descripcionServidor = obj.ListaScheduleActividad[i].descripcionServidor;
	     								var idCliente = obj.ListaScheduleActividad[i].idCliente;
	     								var descripcionCliente = obj.ListaScheduleActividad[i].descripcionCliente;
	     								var jobStream = obj.ListaScheduleActividad[i].jobStream;
	     								var idTipoActividad = obj.ListaScheduleActividad[i].idTipoActividad;
	     								var descripcionTipoActividad = obj.ListaScheduleActividad[i].descripcionTipoActividad;
	     								var estado = obj.ListaScheduleActividad[i].estado;
	     								var accion = obj.ListaScheduleActividad[i].accion;
	     								var idTipoRespaldo = obj.ListaScheduleActividad[i].idTipoRespaldo;
	     								var descripcionTipoRespaldo = obj.ListaScheduleActividad[i].descripcionTipoRespaldo;
	     								var duracion = obj.ListaScheduleActividad[i].duracion;
	     								var comentario = obj.ListaScheduleActividad[i].comentario;
	     								var ventanaMax = obj.ListaScheduleActividad[i].ventanaMax;
	     								var tws = obj.ListaScheduleActividad[i].tws;
	     								var idScheact = obj.ListaScheduleActividad[i].idScheact;
	     								var idSchedule = obj.ListaScheduleActividad[i].idSchedule;
	     								var estadoschedact = obj.ListaScheduleActividad[i].estadoschedact;
	     								var ip = obj.ListaScheduleActividad[i].ip;
	     								var horaInicio = obj.ListaScheduleActividad[i].horaInicio;
	     								var horaFin = obj.ListaScheduleActividad[i].horaFin;
	     								var duracion = obj.ListaScheduleActividad[i].duracion;
	     								var comentariosched = obj.ListaScheduleActividad[i].comentariosched;
	     								var usermod = obj.ListaScheduleActividad[i].usermod;
	     								var estadotar = obj.ListaScheduleActividad[i].estadotar;
	     								var cboEstado ;
							/* 																																	(CLIENTE,SERVIDOR,TURNO,HORAEJECUCION,FECHAVIGENCIA,IDACTIVIDAD,IDSCHEDULEORIGEN,HORAINICIO) */
	     													/* idCliente,idServidor,idTurno,horaEjecucion,horaTermino */
	     															
	     								if(tws == "1"){
	     									descripcionTWS = "Si";
	     								}else{
	     									descripcionTWS = "No";
	     								}
	     								    		
																																												var varHORAEJECUCION = "'" + horaEjecucion+ "',";
																																												var varHORATERMINO  = "'" +horaTermino + "',";
																																												var varHORAINICIO  = "'" + horaInicio+ "'";
	       								
		if(horaInicio == null || horaInicio == "" || horaInicio == "null"){
			
			horaInicio = "<button id=\"play"+numeracion+"\" title=\"Iniciar Actividad\" type=\"button\" class=\"btn btn-warning btn-xs\" style='display:block;' onclick=\"iniciar('play"+numeracion+"','pInicio"+numeracion+"','stop"+numeracion+"', '"+idScheact+"','"+idSchedule+"')\" ><i class=\"fa fa-play\"></i> INICIAR </button>"+	       									
			
			"<button id=\"play"+numeracion+"RCThi"+"\" title=\"RCT Actividad\" type=\"button\" class=\"btn btn-primary btn-xs\" style='display:block;' onclick=\"modalRCT("+idCliente+","+idServidor+","+idTurno+",'"+horaEjecucion+"','"+horaTermino+"',"+idActividad+","+idSchedule+",'"+horaInicio+"')\"><i class=\"fa fa-cog fa-spin fa-fw\"></i> RCT</button>"+
			
			"<p id=\"pInicio"+numeracion+"\" style='display:none;'></p>";
			
			horaFin = "<button id=\"stop"+numeracion+"\" title=\"Detener Actividad\" type=\"button\" class=\"btn btn-warning btn-xs\" style='display:none;' onclick=\"detener('stop"+numeracion+"','pFin"+numeracion+"', '"+idScheact+"','"+idSchedule+"')\"><i class=\"fa fa-stop\"></i> TERMINAR </button>"+
			
			"<p id=\"pFin"+numeracion+"\" style='display:none;'></p>"+
			
			"<button id=\"stop"+numeracion+"RCThf"+"\" title=\"RCT Actividad\" type=\"button\" class=\"btn btn-primary btn-xs\" style='display:none;' onclick=\"modalRCT("+idCliente+","+idServidor+","+idTurno+","+varHORAEJECUCION+varHORATERMINO+idActividad+","+idSchedule+","+varHORAINICIO+")\"><i class=\"fa fa-cog fa-spin fa-fw\"></i> RCT</button>";
			
			
			
		}else if(horaFin == null || horaFin == "" || horaFin == "null"){
			
			horaFin = "<button id=\"stop"+numeracion+"\" title=\"Detener Actividad\" type=\"button\" class=\"btn btn-warning btn-xs\" style='display:block;' onclick=\"detener('stop"+numeracion+"','pFin"+numeracion+"', '"+idScheact+"','"+idSchedule+"')\"><i class=\"fa fa-stop\"></i> TERMINAR </button>"+
			
			"<button id=\"stop"+numeracion+"RCTS"+"\" title=\"RCT Actividad\" type=\"button\" class=\"btn btn-primary btn-xs\" style='display:block;' onclick=\"modalRCT("+idCliente+","+idServidor+","+idTurno+",'"+horaEjecucion+"','"+horaTermino+"',"+idActividad+","+idSchedule+",'"+horaInicio+"')\"><i class=\"fa fa-cog fa-spin fa-fw\"></i> RCT</button>"+
			
			"<p id=\"pFin"+numeracion+"\" style='display:none;'></p>";
		}
		
		if(estadotar == 0){
					 	cboEstado = "<select id=\"cboEstado"+numeracion+"\" class=\"form-control\" name=\"estado\" style=\"width: 100%; font-size:10px; font-weight:bold\" onChange=\"registrarEstado('"+idScheact+"','cboEstado"+numeracion+"','"+idSchedule+"')\">"+
      						"<option value=\"0\" selected >OK</option><option value=\"1\">FALLIDO</option><option value=\"2\">N/A</option></select>";	
					}
					if(estadotar == 1){
					 	cboEstado = "<select id=\"cboEstado"+numeracion+"\" class=\"form-control\" name=\"estado\" style=\"width: 100%; font-size:10px; font-weight:bold\" onChange=\"registrarEstado('"+idScheact+"','cboEstado"+numeracion+"','"+idSchedule+"')\">"+
      				"<option value=\"0\">OK</option><option value=\"1\" selected >FALLIDO</option><option value=\"2\">N/A</option></select>";	
					}
					if(estadotar == 2){
					 	cboEstado = "<select id=\"cboEstado"+numeracion+"\" class=\"form-control\" name=\"estado\" style=\"width: 100%; font-size:10px; font-weight:bold\" onChange=\"registrarEstado('"+idScheact+"','cboEstado"+numeracion+"','"+idSchedule+"')\">"+
      				"<option value=\"0\">OK</option><option value=\"1\">FALLIDO</option><option value=\"2\" selected >N/A</option></select>";	
					}
					
	           							
	           							//Cambio '' x numeración
	           							arr.push(numeracion);
	           							
	           							if(filtro == "3"){ // añadir a la tabla todos los registros
	           								arr.push(horaEjecucion);
	    									arr.push(descripcion);
// 	    									if(perfil == 'ADMINISTRADOR'){ //--BG001
	    										arr.push(descripcionPeriodo);
// 	    	         				        }
	    									
	    									arr.push(horaTermino);
	    									arr.push(descripcionProcedimiento);
	    								 	arr.push(descripcionCliente);
	    								 	arr.push(descripcionServidor +" - " +ip);
	    								  	arr.push(descripcionTWS);
	    								 	arr.push(comentario);
	    								 	arr.push(horaInicio);
	           							 	arr.push(horaFin);
	           							 	arr.push("<textarea cols=\"10\"  id=\"observacion"+numeracion+"\" onChange=\"registrarComentario('"+idScheact+"','observacion"+numeracion+"','"+idSchedule+"')\" >"+comentariosched+"</textarea>");			         	
	           							 	arr.push(cboEstado);	
	           							 	
	           							 	datatabla.push(arr);
	           							 	
	           							}else if(filtro == "1"){ //añadir a la tabla solo los registros con fecha de finalización
	
	           								if(obj.ListaScheduleActividad[i].horaFin == null || obj.ListaScheduleActividad[i].horaFin == "" || obj.ListaScheduleActividad[i].horaFin == "null" || obj.ListaScheduleActividad[i].horaFin == " "){
	           								}else{
	           									arr.push(horaEjecucion);
	        									arr.push(descripcion);
// 	        									if(perfil == 'ADMINISTRADOR'){ //--BG001
	        										arr.push(descripcionPeriodo);
// 	        	         				        }
	        									arr.push(horaTermino);
	        									arr.push(descripcionProcedimiento);
	        								 	arr.push(descripcionCliente);
	        								 	arr.push(descripcionServidor +" - " +ip);
	        								  	arr.push(descripcionTWS);
	        								 	arr.push(comentario);
	        								 	arr.push(horaInicio);
	               							 	arr.push(horaFin);
	               							 	arr.push("<textarea cols=\"10\"  id=\"observacion"+numeracion+"\" onChange=\"registrarComentario('"+idScheact+"','observacion"+numeracion+"','"+idSchedule+"')\" >"+comentariosched+"</textarea>");			         	
	               							 	arr.push(cboEstado);	
	               							 	
	               							 	datatabla.push(arr);
	           								}
	           								
	           							}else if(filtro == "2"){  //añadir a la tabla solo los registros sin fecha de finalización
	           								if(obj.ListaScheduleActividad[i].horaFin == null || obj.ListaScheduleActividad[i].horaFin == "" || obj.ListaScheduleActividad[i].horaFin == "null" || obj.ListaScheduleActividad[i].horaFin == " "){
	           									arr.push(horaEjecucion);
	        									arr.push(descripcion);
// 	        									if(perfil == 'ADMINISTRADOR'){ //--BG001
	        										arr.push(descripcionPeriodo);
// 	        	         				        }
	        									arr.push(horaTermino);
	        									arr.push(descripcionProcedimiento);
	        								 	arr.push(descripcionCliente);
	        								 	arr.push(descripcionServidor +" - " +ip);
	        								  	arr.push(descripcionTWS);
	        								 	arr.push(comentario);
	        								 	arr.push(horaInicio);
	               							 	arr.push(horaFin);
	               							 	arr.push("<textarea cols=\"10\"  id=\"observacion"+numeracion+"\" onChange=\"registrarComentario('"+idScheact+"','observacion"+numeracion+"','"+idSchedule+"')\" >"+comentariosched+"</textarea>");			         	
	               							 	arr.push(cboEstado);
	               							 	
	               							 	datatabla.push(arr);
	           								}
	           							}
	       								
	       							  }  //Fin for recorrer la tabla
       						  }//Fin else comparacion schedule Sura
       					  }
       				  
       				// DataTable
     				    var table = $('#example1').DataTable();
     				    table.destroy();
     			
     				    if ($("#pTeam").val() == 'SURA') {
     			 	
     				    	if(perfil == 'ADMINISTRADOR'){
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
             	                columnDefs: [
             	                	{ "width": "0%", "targets": 0 },
           	       		      	    { "width": "1%", "targets": 1 },{ "width": "35%", "targets": 2 },{ "width": "1%", "targets": 3 },
             	                	{ "width": "1%", "targets": 4 },{ "width": "10%", "targets": 5 },{ "width": "1%", "targets": 6 },{ "width": "1%", "targets": 7 },
             	                	{ "width": "1%", "targets": 8 ,"visible": false, "searchable": false},{ "width": "30%", "targets": 9 },{ "width": "1%", "targets": 10 },{ "width": "1%", "targets": 11 },
             	                	{ "width": "1%", "targets": 12 },{ "width": "1%", "targets": 13 }
               				    ],
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
            				 }else{
            					$('#example1').DataTable( {
            				    	language: {
            				            searchPlaceholder: "Buscar...",
            				            search : '<i class="fa fa-search fa-lg">',
            				            
            				        },
            				        dom: 'Bfrtip',
            				        data : datatabla,  
            				     	lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
            				     	fnRowCallback: function(nRow, data, iDisplayIndex, iDisplayIndexFull) {
             	                    if ( data[7] == "Si" )
             	                    {
             	                        $('td', nRow).css('background-color', '#68FF7E');
             	                    }
             	                },
             	                columnDefs: [
             	                	{ 
             	                		"className": 'details-control',
             	         		      	"orderable": false,
             	       		      	  	"data": null,
             	       		      	  	"defaultContent": '', 
             	       		      	  	"targets": 0 
           	       		      	    },
//            	       		      		{
//            	       		      			"targets": 8,
//            	       		      			"visible":false
//            	       		      	    },
             	                	{ "width": "1%", "targets": 0 },{ "width": "1%", "targets": 1 },{ "width": "25%", "targets": 2 },
             	                	{ "width": "1%", "targets": 3 },{ "width": "1%", "targets": 4 },{ "width": "1%", "targets": 5 },{ "width": "1%", "targets": 6 },
             	                	{ "width": "1%", "targets": 7 },{ "width": "25%", "targets": 8 },{ "width": "1%", "targets": 9 },{ "width": "1%", "targets": 10 },
             	                	{ "width": "1%", "targets": 11 },{ "width": "1%", "targets": 12 }
             	                	,{ "width": "1%", "targets": 13 } //++BG001
               				    ],
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
            				 }
							
						}else{

	       				 if(perfil == 'ADMINISTRADOR'){
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
	         	                columnDefs: [
	       	       		      	    { "width": "1%", "targets": 1 },{ "width": "65%", "targets": 2 },{ "width": "1%", "targets": 3 },
	         	                	{ "width": "1%", "targets": 4 },{ "width": "1%", "targets": 5 },{ "width": "1%", "targets": 6 },{ "width": "1%", "targets": 7 },
	         	                	{ "width": "1%", "targets": 8 },{ "width": "25%", "targets": 9 },{ "width": "1%", "targets": 10 },{ "width": "1%", "targets": 11 },
	         	                	{ "width": "1%", "targets": 12 },{ "width": "1%", "targets": 13 }
	           				    ],
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
	        				 }else{	//Otros perfiles
	        					$('#example1').DataTable( {
	        				    	language: {
	        				            searchPlaceholder: "Buscar...",
	        				            search : '<i class="fa fa-search fa-lg">',
	        				            
	        				        },
	        				        dom: 'Bfrtip',
	        				        data : datatabla,  
	        				     	lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
	        				     	fnRowCallback: function(nRow, data, iDisplayIndex, iDisplayIndexFull) {
	         	                    if ( data[7] == "Si" )
	         	                    {
	         	                        $('td', nRow).css('background-color', '#68FF7E');
	         	                    }
	         	                },
	         	                columnDefs: [
	         	                	{ "width": "1%", "targets": 0 },{ "width": "1%", "targets": 1 },{ "width": "65%", "targets": 2 },
	         	                	{ "width": "1%", "targets": 3 },{ "width": "1%", "targets": 4 },{ "width": "1%", "targets": 5 },{ "width": "1%", "targets": 6 },
	         	                	{ "width": "1%", "targets": 7 },{ "width": "1%", "targets": 8 },{ "width": "25%", "targets": 9 },{ "width": "1%", "targets": 10 },
	         	                	{ "width": "1%", "targets": 11 },{ "width": "1%", "targets": 12 }
	         	                	,{ "width": "1%", "targets": 13 } //++BG001 --Diminuye el "8" de 25% a 1% y el 9 de 1 a 25%
	           				    ],
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
	        				 }
       				 
						}
       				    
       					
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
   
var varIDCLIENTE;      	
var varIDSERVIDOR;      	
var varIDTURNO;  
var varHORAEJECUCION;
var varFECHAVIGENCIA;
var varIDACTIVIDAD;
var varIDSCHEDULEORIGEN;
var varHORAINICIO;


      	/* MUESTRA MODAL PARA LA DESCRIPCION DEL MOTIVO DEL RCT */
      	function modalRCT(CLIENTE,SERVIDOR,TURNO,HORAEJECUCION,FECHAVIGENCIA,IDACTIVIDAD,IDSCHEDULEORIGEN,HORAINICIO){  
      /* alert(IDSCHEDULEORIGEN); */
			$('#mdRCT').modal('show');
      		$('#descripcionRCT').val('');
      		varIDCLIENTE = CLIENTE;
      		varIDSERVIDOR = SERVIDOR;
      		varIDTURNO = TURNO;
      		varHORAEJECUCION = HORAEJECUCION;
      		varFECHAVIGENCIA = FECHAVIGENCIA;
      		varIDACTIVIDAD = IDACTIVIDAD;
      		varIDSCHEDULEORIGEN = IDSCHEDULEORIGEN;
      		varHORAINICIO = HORAINICIO; 
      		
      	}
      	
      	function valorinput(){
      		
      		var DescVal = document.getElementById('descripcionRCT').value;
    	
    		$(document).ready(function() {    		
    			var src = "ServletDetalleSchedule";
    			$.post(src, {strAccion : "11", 
    						 IDCLIENTE : varIDCLIENTE,
    						 IDSERVIDOR: varIDSERVIDOR,
    						 IDTURNO : varIDTURNO,
    						 HORAEJECUCION: varHORAEJECUCION,
    						 FECHAVIGENCIA: varFECHAVIGENCIA,
    						 IDACTIVIDAD : varIDACTIVIDAD,
    						 IDSCHEDULEORIGEN : varIDSCHEDULEORIGEN,
    						 DESCRIPCION : DescVal,
    						 HORAINICIO : varHORAINICIO},
    						 function(pdata) {
  				    			var obj = JSON.parse(pdata); 
  				    			listar_detalle_schedule("2");//ME
    						 });    			
    		}); 
      		
    		$('#mdRCT').modal('hide');    		
    		  setTimeout(function(){
    			
    		//eliminar fila
			var table = $('#example1').DataTable();
			table.row('.selected').remove().draw( false );
			table.$('tr.selected').removeClass('selected');
			
			
  			}, 500);   
  			
   		}

      	
   		
</script>

<script type="text/javascript">
$('.clockpicker').clockpicker({
    donetext: 'OK'
});
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

 <script type="text/javascript">
		function validar(e) {
		    tecla = (document.all) ? e.keyCode : e.which;
		    patron =/[\x5C'"]/;
		    te = String.fromCharCode(tecla);
		    return !patron.test(te);
		}
		
		function validar_solo_numeros(e) {
			var key = window.Event ? e.which : e.keyCode
			return (key >= 48 && key <= 57)
		} 
</script>
</body>
</html>
