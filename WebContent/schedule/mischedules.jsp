<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
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
            Mis Schedules
            <small>Schedule</small>
          </h1>
          <ol class="breadcrumb">
            <li><i class="fa fa-th-large"></i> Schedule</li>
            <li class="active">Mis Schedules</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
           <button title="Actualizar" type="button" class="btn btn-info" onclick="listar_mis_schedules()""><i class="fa fa-refresh fa-sm"></i> Actualizar</button>  
           <br><br> 
            
          <div id="alertaConfirmacion" class="alert alert-success alert-dismissable fade in" style='display:none;'>
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong>¡Éxito!</strong>  Su operación se ha realizado satisfactoriamente.
		  </div>
		  
		  <div id="alertaNegativa" class="alert alert-danger alert-dismissable fade in" style='display:none;'>
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong>¡Error!</strong>  Su operación no se ha realizado.
		  </div>


         
                                                       
         
         <div class="row"> 
             <div class="col-md-12">
                <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Listado de Mis Schedules Asignados</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                <div class="table-responsive">
                  <table id="example1" class="table table-bordered table-striped table-responsive table-hover"
                  class="display"  cellspacing="0" style="font-size:11px">
                    <thead class="bg-primary">
                      <tr>
                        <th>FECHA SCHEDULE</th>
                        <th>SEDE</th>
                        <th>TURNO</th>
                        <th>HORA INICIO TURNO</th>
                        <th>HORA FIN TURNO</th>
                        <th>ESTADO</th>
                        <th>ACCIÓN</th>
                      </tr>
                    </thead>
                    <thead class="filters">
					  <tr>
										
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
          <!-- END TYPOGRAPHY -->

        </section><!-- /.content -->
      </aside><!-- /.content-wrapper -->

<script>     

$(document).ready(function() {
	
	listar_mis_schedules();
    
    }); // Fin del $(document)
    
    function  verSchedulePDF(pIdSchedule, pFecha, pSede, pTurno, phoraInicio, phoraFin, pTipoReporte){
    	var src = "ServletPDF";
    	
    	//Inicio POST para insertar información 
        $.post(src, {strId : pIdSchedule, strFecha: pFecha, strSede: pSede, strTurno: pTurno, strHoraInicio: phoraInicio, strHoraFin:phoraFin, strTipoReporte:pTipoReporte  }, 
    		function(pdata) {

        	    var win = window.open("", "Your PDF", "width=1024,height=768,resizable=yes,scrollbars=yes,toolbar=no,location=no,directories=no,status=no,menubar=no,copyhistory=no");
        	    win.document.location.href = src;
        	    
      
    	});	
    }
    
    
    
    function  verScheduleEXCEL(pIdSchedule){
    	var src = "ServletExcel";
    	
    	//Inicio POST para insertar información 
        $.post(src, {strId : pIdSchedule}, 
    		function(pdata) {

        	    var win = window.open("", "Your Excel", "width=520,height=250,resizable=no,scrollbars=no,toolbar=no,location=no,directories=no,status=no,menubar=no,copyhistory=no");
        	    win.document.location.href = src;
      
    	});	
    }
    
    function desasignarSchedule(pIdSchedule,pTurno,pSede,pEstado){

    	
    		if(confirm('¿Está seguro que desea Desasignarse el Schedule "'+pTurno+'"  "'+pSede+'"?')) { 
        	   	varEstado = pEstado;
       			varIdSchedule = pIdSchedule;
        	   	var src = "ServletSchedule";	 
        		//Inicio POST actualizar Schedule
        		  	$.post(src, {strAccion:"4", strId : varIdSchedule, strEstado : varEstado, strOperacion : "DESASIGNAR_SCHEDULE" }, 
        		 		function(pdata) {   
        		  			var obj = JSON.parse(pdata);
        		  			if(obj.SeleccionarSchedule[0].codigo == "0"){
        		  				activarAlertaConfirmacion('alertaNegativa');
        		  				listar_mis_schedules();
        		  			}else{
        		  				activarAlertaConfirmacion('alertaConfirmacion');
        		  				listar_mis_schedules();
        		  			}		    
        		  	});
        		//Fin Seleccionar Schedule
		      }else {
		               return false;
	
		             } 

	} // Fin funcion editar
    
		function activarAlertaConfirmacion(id) { 

		 	document.getElementById(id).style.display = 'block';    
		 	setTimeout(function() {      
			 desactivarAlertaConfirmacion(id);  
	     	}, 3000)
		}// Fin funcion activarAlertaConfirmacion
	 
		function desactivarAlertaConfirmacion(id) { 

		 	document.getElementById(id).style.display = 'none';    

		}// Fin funcion desactivarAlertaConfirmacion
        		
        function iniciarSchedule(idSchedule, vfecha, vdescripcionSede, vdescripcionTurno, vhoraInicioTurno, vhoraFinTurno) { 

        	var src = "ServletSchedule";
        	var formatoCabecera = "["+vfecha+"] "+vdescripcionSede+" - "+vdescripcionTurno+" - ("+vhoraInicioTurno+" - "+vhoraFinTurno+")";
           	//Inicio POST para completar listar información en la tabla
            	$.post(src, {strAccion:"5", strIdSchedule: idSchedule, strCabecera: formatoCabecera }, 
           				function(pdata) {
            		
            		 		var obj = JSON.parse(pdata);
      				    
		      				  if(obj.iniciarSchedule[0].idRespuesta == "1"){
		      					javascript:recargarDiv('wcontentRight', 'schedule/detalleschedule.jsp')
// 		      					window.location.href = "/ScheduleWeb/detalleschedule.jsp";	 	
		      					}else{
		      					alert('ERROR');
		      					}
            		
            		
		
  		});
        }// Fin funcion desactivarAlertaConfirmacion

  		function listar_mis_schedules(){
  		// Haciendo visible Modal con Barra de progreso 
            var $modal = $('.js-loading-bar');
            $modal.modal('show');
            
       	 var src = "ServletSchedule";
       	//Inicio POST para completar listar información en la tabla
        	$.post(src, {strAccion:"3"}, 
       				function(pdata) {
       			     
       				  var obj = JSON.parse(pdata);
       				  var datatabla = [];
       				  var numeracion = 0;
       				    
       				  if(obj.MisSchedules[0].idSchedule == ""){
       					
							 	
       					}else{
       						  
       						  for(i = 0 ; i < obj.MisSchedules.length ; i++ ){	
       							  
       							  numeracion = numeracion + 1;
       							  var arr = [];
       							  
       							  //captura de datos
       							  	var idSchedule = obj.MisSchedules[i].idSchedule;
       							    var fecha = obj.MisSchedules[i].fecha;
       							 	var estado = obj.MisSchedules[i].estado;
       							 	var descripcionEstado = obj.MisSchedules[i].descripcionEstado;
       							 	
       							 	var divestado = (descripcionEstado == 'SIN ASIGNAR' ? '<span class="label label-info"><i class="fa fa-hourglass-end" aria-hidden="true"></i> SIN ASIGNAR</span>' : descripcionEstado == 'EN PROGRESO' ? '<span class="label label-success"><i class="fa fa-clock-o" aria-hidden="true"></i> EN PROGRESO</span>' : descripcionEstado == 'FINALIZADO' ? '<span class="label label-primary"><i class="fa fa-check-circle-o" aria-hidden="true"></i> FINALIZADO</span>' : '');
       							 	var idTurno = obj.MisSchedules[i].idTurno;
       								var descripcionTurno = obj.MisSchedules[i].descripcionTurno;
       								var horaInicioTurno = obj.MisSchedules[i].horaInicioTurno;
       								var horaFinTurno = obj.MisSchedules[i].horaFinTurno;
       								var usermod = obj.MisSchedules[i].usermod;
       								var descripcionSede = obj.MisSchedules[i].descripcionSede;
       								var boton1;
       								var boton2;
       								var boton3;
       								
       								boton1 = "<center><div style='display:inline-flex;'><button style='padding:8px!important;margin-left:6px !important;' title=\"Ver Schedule (PDF)\" type=\"button\" class=\"btn btn-primary btn-sm\" style='display:block;' onclick=\"verSchedulePDF('"+idSchedule+"','"+fecha+"','"+descripcionSede+"','"+descripcionTurno+"','"+horaInicioTurno+"','"+horaFinTurno+"','PARCIAL') \"> <i class=\"fa fa-file-pdf-o\"></i></button></div>";
//        								boton2 = "<button style='padding:8px!important;margin-left:6px !important;' title=\"Iniciar Schedule\" type=\"button\" class=\"btn btn-warning btn-sm\" style='display:block;'  onclick=\"iniciarSchedule('"+idSchedule+"','"+fecha+"','"+descripcionSede+"','"+descripcionTurno+"','"+horaInicioTurno+"','"+horaFinTurno+"')\"><i class=\"fa fa-play-circle\"></i></button></div>";
//    									boton3 = "<button style='padding:8px!important;margin-left:6px !important;' title=\"Desasignar Schedule\" type=\"button\" class=\"btn btn-danger btn-sm\" style='display:block;'  onclick=\"desasignarSchedule('"+idSchedule+"','"+descripcionTurno+"','"+descripcionSede+"','"+estado+"')\"><i class=\"fa fa-unlock\"></i></button></div></center>";

       								
       								if(estado == 1){
       									boton2 = "<button style='padding:8px!important;margin-left:6px !important;' title=\"Iniciar Schedule\" type=\"button\" class=\"btn btn-warning btn-sm\" style='display:block;'  onclick=\"iniciarSchedule('"+idSchedule+"','"+fecha+"','"+descripcionSede+"','"+descripcionTurno+"','"+horaInicioTurno+"','"+horaFinTurno+"')\"><i class=\"fa fa-play-circle\"></i></button></div>";
       									boton3 = "<button style='padding:8px!important;margin-left:6px !important;' title=\"Desasignar Schedule\" type=\"button\" class=\"btn btn-danger btn-sm\" style='display:block;'  onclick=\"desasignarSchedule('"+idSchedule+"','"+descripcionTurno+"','"+descripcionSede+"','"+estado+"')\"><i class=\"fa fa-unlock\"></i></button></div></center>";
           								
       								}else if(estado == 2){
       									boton2 = "<button style='padding:8px!important;margin-left:6px !important;' title=\"Iniciar Schedule\" type=\"button\" class=\"btn btn-warning btn-sm\" style='display:block;'  onclick=\"iniciarSchedule('"+idSchedule+"','"+fecha+"','"+descripcionSede+"','"+descripcionTurno+"','"+horaInicioTurno+"','"+horaFinTurno+"')\"><i class=\"fa fa-play\"></i></button></div>";
       									boton3 = "<button style='padding:8px!important;margin-left:6px !important;' title=\"Desasignar Schedule\" type=\"button\" class=\"btn btn-danger btn-sm\" style='display:block;'  onclick=\"desasignarSchedule('"+idSchedule+"','"+descripcionTurno+"','"+descripcionSede+"','"+estado+"')\"><i class=\"fa fa-unlock\"></i></button></div></center>";
           								
       								}else if(estado == 3){
       									boton2 = "<button style='padding:8px!important;margin-left:6px !important;' title=\"Ver Schedule Finalizado (PDF)\" type=\"button\" class=\"btn btn-warning btn-sm\" style='display:block;'  onclick=\"verSchedulePDF('"+idSchedule+"','"+fecha+"','"+descripcionSede+"','"+descripcionTurno+"','"+horaInicioTurno+"','"+horaFinTurno+"','COMPLETO')\"><i class=\"fa fa-file-pdf-o\"></i></button></div>";
       									boton3 = "<button style='padding:8px!important;margin-left:6px !important;' title=\"Ver Schedule Finalizado (EXCEL)\" type=\"button\" class=\"btn btn-success btn-sm\" style='display:block;'  onclick=\"verScheduleEXCEL('"+idSchedule+"')\"><i class=\"fa fa-file-excel-o\"></i></button></div></center>";
           								
       								}
       								
       								
       									       								
       							  //Generación de cadena para tabla  turno
       							  	arr.push(fecha);
       							 	arr.push(descripcionSede);
       							 	arr.push(descripcionTurno);
       							 	arr.push(horaInicioTurno);
       							 	arr.push(horaFinTurno);  
       							 	arr.push(divestado);  
       							 	arr.push(boton1 + boton2 + boton3);
       							 	datatabla.push(arr);
       							  }  
       					  }
       				  
       				  
       				  
       				// DataTable
       				    var table = $('#example1').DataTable();
       				    table.destroy();
       				    
       				  $('#example1').DataTable( {
       					    order: [[ 0, "desc" ]],
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
       				     	lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
       				        data : datatabla,
       				     	columnDefs: [
       				     	{ "width": "15%", "targets": 1 },
							{ "width": "20%", "targets": 2 },
							{ "width": "15%", "targets": 6 }
        				    ],
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
	       						responsive: true
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
       				 
       				   
        	
        });// Fin del POST listar tabla
       	} // Fin funcion Listar
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
