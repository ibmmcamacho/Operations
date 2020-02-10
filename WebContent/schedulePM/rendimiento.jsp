<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>RENDIMIENTO  | RIMAC</title>
    <script type="text/javascript">
	var f = new Date();
	var date = f.getFullYear()
			+ '-'
			+ ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f
					.getMonth() + 1)) + '-'
			+ ((f.getDate()) < 10 ? '0' + f.getDate() : f.getDate());

	document.getElementById("txtFecha").value = date;
	</script>
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
            Monitoreo Rendimiento Aplicaciones
            <small>Rimac</small>
          </h1>
          <ol class="breadcrumb">
            <li><i class="fa fa-th-large"></i> Rimac</li>
            <li class="active">Rendimiento Aplicaciones</li>
          </ol>
        </section>
        <input type="hidden" style="width: 100%;" class="form-control" id="pRendimiento">

        <!-- Main content -->
        <section class="content">
         <div class="form-inline">
         	<div class="form-group">
		         <input type="text" class="form-control form-control-sm datePicker"
							id="txtFecha">
				<button id="btnBuscar" title="Buscar" type="button" class="btn btn-info btn-sm"><i class="fa fa-search"></i> Buscar </button>
				<br><br>
			</div>
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
                  <h3 class="box-title">DETALLE DE ACTIVIDADES MONITOREO INDIA</h3>
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
	
	
	tablaHtml();
	listar_Rendimiento();
     alert('p');

	
    
    }); // Fin del $(document)
    
	 <!--   function perfil(){
			
			var src = "ServletSesion";
	 	 	
	 		//Inicio POST para  listar información en la tabla
	 	 	$.post(src, {strAccion:"0"}, 
	 					function(pdata) {
	 				     
	 					  var obj = JSON.parse(pdata);
	   					   
	 					  var perfil = obj.Sesion[0].perfil;
	 					  
	 					  $("#pPerfil").val(perfil);
	 					  
	 					 	tablaHtml();
	 					 	listar_Rendimiento();
	 					  
	 	 	});
		}
    
    -->
    
		function tablaHtml(){
			
			//var perfil = $("#pPerfil").val();      	
         					  
         					 var tabla = "<table id=\"example1\" class=\"table table-bordered table-striped table-responsive table-hover\" "
         					          + "class=\"display\" width=\"99%\" cellspacing=\"0\" style=\"font-size:10px; font-weight:bold\" >"
         	                 		  + "<thead class=\"bg-primary\">"
         	                 		  + "<tr>"
         	                 		  + "<th>NRO</th>"
         	                 		  + "<th>STATE</th>"
         	                 		  + "<th>NAME</th>"
         				        	  + "<th>AGENT</th>"
         				          	  + "<th>NODE COUNT</th>"
         		                      + "<th>EXEC</th>"
         		                      + "<th>START</th>"
         		                      + "<th>APLICATION</th>"
         		                      + "<th>BREAKDOWN</th>"
         		                      + "<th>RESPONSE TIME</th>"
         		                      + "<th>DETECTED PROBLEM PATTERNS</th>"
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
         				         	  + "<th style=\"border: hidden\"></th>"
         				         	  + "<th style=\"border: hidden\"></th>"
         				         	  + "<th style=\"border: hidden\"></th>"
         				         	  + "</tr>"
         				         	  + "</thead>" 
         				         	  + "</table>";
  	
         			        document.getElementById("divTabla").innerHTML = tabla; 
 
            }
    
    
	<!--  function generaCabecera(){
	    	var src = "ServletDetalleSchedule";
	    	$.post(src, {strAccion:"9"}, 
	   				function(pdata) {
	    			
	    			var obj = JSON.parse(pdata);
	    			
	    			if(obj.CabeceraSchedule[0].cabecera != ""){
	    				
		    			$("#idCabecera").text(obj.CabeceraSchedule[0].cabecera);
		    	    	
	    			}
	    	});
		}
		
    
	    $('#btnBuscar').click(function(){
	    		    	
	    	listar_detalle_schedule(3);
	    	
	    });
	  -->  
	    
	        
        function activarAlertaConfirmacion() { 

        		 document.getElementById('alertaConfirmacion').style.display = 'block';    
        		 setTimeout(function() {      
        			 desactivarAlertaConfirmacion();  
        	     }, 3000)
        		}// Fin funcion activarAlertaConfirmacion
        	 
        function desactivarAlertaConfirmacion() { 

        		 document.getElementById('alertaConfirmacion').style.display = 'none';    

        		}// Fin funcion desactivarAlertaConfirmacion
        
 
        function listar_Rendimiento(){
        			alert('llegue');
        	// Haciendo visible Modal con Barra de progreso 
            var $modal = $('.js-loading-bar');
            $modal.modal('show');
            //var pFechaSchedule = $('#txtFechaSchedule').val();
            var pFecha = '2018-07-02';
            var pTipo = 'CERTIFICADO';
        	//var perfil = $("#pPerfil").val();  
       	 	var src = "ServletRendimiento";   	
       	 	//var filtro = pTipoDeVista;
       	 
       	//Inicio POST para completar listar información en la tabla
        	$.post(src, {strAccion:"1" ,strFechaRendimiento : pFecha,strTipo : pTipo}, 

       				function(pdata) {
       			     
       				  var obj = JSON.parse(pdata);
       				  var datatabla = [];
       				  var numeracion = 0;
       				    
       				  if(obj.ListaRendimiento[0].idRendimiento == ""){
       					
       					}else{
       						  for(i = 0 ; i < obj.ListaRendimiento.length ; i++ ){	
       							  
       							  	numeracion = numeracion + 1;
       							  	var arr = [];
       							  
       							//captura de datos
       								var idRendimiento = obj.ListaRendimiento[i].idRendimiento;
       								var state = obj.ListaRendimiento[i].state;
       								var name = obj.ListaRendimiento[i].name;
       								var agent = obj.ListaRendimiento[i].agent;
       								var node = obj.ListaRendimiento[i].node;
       								var exec = obj.ListaRendimiento[i].exec;
       								var start = obj.ListaRendimiento[i].start;
       								var aplication = obj.ListaRendimiento[i].aplication;
       								var breakdown = obj.ListaRendimiento[i].breakdown;
       								var response = obj.ListaRendimiento[i].response;
       								var detected = obj.ListaRendimiento[i].detected;      						
     					     								    	
           							arr.push(numeracion);
           								arr.push(state);
    									arr.push(name);						
    									arr.push(agent);
    									arr.push(node);
    								 	arr.push(exec);
    								 	arr.push(start);
    								  	arr.push(aplication);
    								 	arr.push(breakdown);   
    								 	arr.push(response);   
    								 	arr.push(detected);   
           							 	
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
