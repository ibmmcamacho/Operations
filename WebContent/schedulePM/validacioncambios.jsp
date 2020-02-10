<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>VALIDACIÓN CAMBIOS | IBM</title>
    <style>
    
    
.lds-roller {
  display: inline-block;
  position: relative;
  width: 64px;
  height: 64px;
}
.lds-roller div {
  animation: lds-roller 1.2s cubic-bezier(0.5, 0, 0.5, 1) infinite;
  transform-origin: 32px 32px;
}
.lds-roller div:after {
  content: " ";
  display: block;
  position: absolute;
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: #cef;
  margin: -3px 0 0 -3px;
}
.lds-roller div:nth-child(1) {
  animation-delay: -0.036s;
}
.lds-roller div:nth-child(1):after {
  top: 50px;
  left: 50px;
}
.lds-roller div:nth-child(2) {
  animation-delay: -0.072s;
}
.lds-roller div:nth-child(2):after {
  top: 54px;
  left: 45px;
}
.lds-roller div:nth-child(3) {
  animation-delay: -0.108s;
}
.lds-roller div:nth-child(3):after {
  top: 57px;
  left: 39px;
}
.lds-roller div:nth-child(4) {
  animation-delay: -0.144s;
}
.lds-roller div:nth-child(4):after {
  top: 58px;
  left: 32px;
}
.lds-roller div:nth-child(5) {
  animation-delay: -0.18s;
}
.lds-roller div:nth-child(5):after {
  top: 57px;
  left: 25px;
}
.lds-roller div:nth-child(6) {
  animation-delay: -0.216s;
}
.lds-roller div:nth-child(6):after {
  top: 54px;
  left: 19px;
}
.lds-roller div:nth-child(7) {
  animation-delay: -0.252s;
}
.lds-roller div:nth-child(7):after {
  top: 50px;
  left: 14px;
}
.lds-roller div:nth-child(8) {
  animation-delay: -0.288s;
}
.lds-roller div:nth-child(8):after {
  top: 45px;
  left: 10px;
}
@keyframes lds-roller {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

    
    .color-palette {
                    height: 35px;
                    line-height: 35px;
                    text-align: center;
                }
                .color-palette-set {
                    margin-bottom: 15px;
                }
                .color-palette span {
                    display: none;
                    font-size: 12px;
                }
                .color-palette:hover span {
                    display: block;
                }
                .color-palette-box h4 {
                    position: absolute;
                    top: 100%;
                    left: 25px;
                    margin-top: -40px;
                    color: rgba(255, 255, 255, 0.8);
                    font-size: 12px;
                    display: block;
                    z-index: 7;
                }           
                .loader {
                    border: 16px solid #f3f3f3; /* Light grey */
                    border-top: 16px solid #3498db; /* Blue */
                    border-radius: 50%;
                    width: 120px;
                    height: 120px;
                    animation: spin 2s linear infinite;
                }

                @keyframes spin {
                    0% { transform: rotate(0deg); }
                    100% { transform: rotate(360deg); }
                }
                /* Add animation to "page content" */
                
   .parpadea {

                  animation-name: parpadeo;
                  animation-duration: 4s;
                  animation-timing-function: linear;
                  animation-iteration-count: infinite;

                  -webkit-animation-name:parpadeo;
                  -webkit-animation-duration: 4s;
                  -webkit-animation-timing-function: linear;
                  -webkit-animation-iteration-count: infinite;
                }
   @-moz-keyframes parpadeo{  
                  0% { opacity: 1.0; }
                  50% { opacity: 0.0; }
                  100% { opacity: 1.0; }
                }

                @-webkit-keyframes parpadeo {  
                  0% { opacity: 1.0; }
                  50% { opacity: 0.0; }
                   100% { opacity: 1.0; }
                }

                @keyframes parpadeo {  
                  0% { opacity: 1.0; }
                   50% { opacity: 0.0; }
                  100% { opacity: 1.0; }
                }
              canvas{
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
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
      <aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            VALIDACIÓN CAMBIOS
            <small>IBM</small>
          </h1>
          <ol class="breadcrumb">
            <li><i class="fa fa-th-large"></i> IBM</li>
            <li class="active">Validación Cambios</li>
          </ol>
        </section>
        <input type="hidden" style="width: 100%;" class="form-control" id="pRendimiento">

        <!-- Main content -->
        <section class="content">
		<button title="Actualizar lista de Tareas" type="button"
		class="btn  bg-blue" onclick="listar_AgentStatus()">
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
						<a class="label-primary">Validación de Agente&nbsp;&nbsp;</a><a
							style="color: red; font-weight: bold;"></a>
					</h4>
				</div>
				<div class="modal-body">
				
				<center><div id="loader" class="lds-roller"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div></center>
				<!--  <center><div id="loader" class="loader"></div></center>-->
				
					<div id="mensajenegativo" class="alert alert-danger alert-dismissable" style='display: none;'>
	                    <i class="icon fa fa-warning"></i> SE VERIFICA QUE EL AGENTE NO SE ENCUENTRA RECOPILANDO INFORMACIÓN Y SE ENCUENTRA INHIBIDO
                  	</div>
                  	<div id="mensajenegativo2" class="alert alert-danger alert-dismissable" style='display: none;'>
	                    <i class="icon fa fa-warning"></i> SE VERIFICA QUE EL AGENTE ENCUENTRA INHIBIDO
                  	</div>
                  	<div id="mensajenegativo3" class="alert alert-danger alert-dismissable" style='display: none;'>
	                    <i class="icon fa fa-warning"></i> SE VERIFICA QUE EL AGENTE SE ENCUENTRA RECOPILANDO INFORMACIÓN SIN EMBARGO SE ENCUENTRA INHIBIDO       	
	                </div>
	                <div id="mensajenegativo4" class="alert alert-danger alert-dismissable" style='display: none;'>
	                    <i class="icon fa fa-warning"></i> HUBO UN ERROR, FAVOR VOLVER A VALIDAR NUEVAMENTE
	                </div>
                  	<div id="mensajeafirmativo" class="alert alert-success alert-dismissable" style='display: none;'>
	                    <i class="icon fa fa-check"></i> SE VERIFICA QUE EL AGENTE SE ENCUENTRA RECOPILANDO INFORMACIÓN Y NO SE ENCUENTRA INHIBIDO
                  	</div> 

				</div>
				<div class="modal-footer">
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
                  <h3 class="box-title">DETALLE DE AGENT STATUS</h3>
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
	
	//refreshCombos();
	opcionesHtml();
	tablaHtml();
	listar_AgentStatus();
	
   //  alert('p');

	
    
    }); // Fin del $(document)
    

    
		function tablaHtml(){
			
			//var perfil = $("#pPerfil").val();      	
         					  
         					 var tabla = "<table id=\"example1\" class=\"table table-bordered table-striped table-responsive table-hover\" "
         					          + "class=\"display\" width=\"99%\" cellspacing=\"0\" style=\"font-size:10px; font-weight:bold\" >"
         	                 		  + "<thead class=\"bg-primary\">"
         	                 		  + "<tr>"
         	                 		  + "<th>N°</th>"
         	                 		  + "<th>STATUS</th>"
         	                 		  + "<th>NODE</th>"
         	                 	      + "<th>NODE2</th>"
         				        	  + "<th>PRODUCT</th>"
         				          	  + "<th>IPADDRESS</th>"
         				          	  + "<th>HOSTNAME</th>"
         				          	  + "<th>VERSION</th>"
         				          	  + "<th>HOSTINFO</th>"
         				          	  + "<th>THROUGHNODE</th>"
         				          	  + "<th>HEARTBEAT</th>"
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
         				         	  + "<th style=\"border: hidden\"></th>"
         				         	  + "<th style=\"border: hidden\"></th>"
         				         	  + "<th style=\"border: hidden\"></th>"
         				         	  + "<th style=\"border: hidden\" hidden></th>"
         				         	  + "</tr>"
         				         	  + "</thead>" 
         				         	  + "</table>";
  	
         			        document.getElementById("divTabla").innerHTML = tabla; 
 
            }
    
    		
        function activarAlertaConfirmacion() { 
        	 document.getElementById('mensajeafirmativo').style.display = 'block';            		
        }// Fin funcion desactivarAlertaConfirmacion
        function activarAlertaNegacion() { 
             document.getElementById('mensajenegativo').style.display = 'block';  
        }// Fin funcion desactivarAlertaConfirmacion
        function activarAlertaNegacion2() { 
             document.getElementById('mensajenegativo2').style.display = 'block';  
        }// Fin funcion desactivarAlertaConfirmacion
        function activarAlertaNegacion3() { 
             document.getElementById('mensajenegativo3').style.display = 'block';  
        }// Fin funcion desactivarAlertaConfirmacion
        function activarAlertaNegacion4() { 
            document.getElementById('mensajenegativo4').style.display = 'block';  
       }// Fin funcion desactivarAlertaConfirmacion
        		

        
    function validastatus(status,node, node2, ip, host, product, throught) {
    	document.getElementById("loader").style.display = "block";
    	var src = "ServletAgentStatus";
		//Inicio POST actualizar estado Tarea
			$
					.post(
							src,
							{
								strAccion : "2",
								strStatus : status,
								strNode : node,
								strNode2 : node2,
								strIp : ip,
								strHost : host,
								strProduct : product,
								strThought : throught
							},
							function(pdata) {
								var obj = JSON.parse(pdata);
								if (obj.ValidacionAgente[0].resultado == "Y" && obj.ValidacionAgente[0].resultado2 == "Y") {
									document.getElementById("loader").style.display = "block";
									activarAlertaConfirmacion();
									document.getElementById("loader").style.display = "none";
									//listar_AgentStatus();
								} else if (obj.ValidacionAgente[0].resultado == "N" && obj.ValidacionAgente[0].resultado2 == "F")  {
									document.getElementById("loader").style.display = "block";
									activarAlertaNegacion();							
									document.getElementById("loader").style.display = "none";
									//listar_AgentStatus();
								}else if (obj.ValidacionAgente[0].resultado == "" && obj.ValidacionAgente[0].resultado2 == "F")  {
									document.getElementById("loader").style.display = "block";
									activarAlertaNegacion2();							
									document.getElementById("loader").style.display = "none";
								}else if (obj.ValidacionAgente[0].resultado == "Y" && obj.ValidacionAgente[0].resultado2 == "F")  {
									document.getElementById("loader").style.display = "block";
									activarAlertaNegacion3();							
									document.getElementById("loader").style.display = "none";
								}								
								else{
									document.getElementById("loader").style.display = "block";
									activarAlertaNegacion4();							
									document.getElementById("loader").style.display = "none";
								}
									
							});
			//Fin Actualizar estado Turno

	}// Fin funcion valida Status			
    			
 
        function listar_AgentStatus(){
            var $modal = $('.js-loading-bar');
            $modal.modal('show');
       	 	var src = "ServletAgentStatus";       	 	
        	$.post(src, {strAccion:"1"}, 

       				function(pdata) {
       			     
       				  var obj = JSON.parse(pdata);
       				  var datatabla = [];
       				  var numeracion = 0;
       				    
       				  if(obj.ListaAgentStatus[0].status == ""){
       					
       					}else{
       						  for(i = 0 ; i < obj.ListaAgentStatus.length ; i++ ){	
       							  
       							  	numeracion = numeracion + 1;
       							  	var arr = [];
       								var perfil = $("#pPerfil").val();
       							//captura de datos
       							
       								var status = obj.ListaAgentStatus[i].status;
       								var node = obj.ListaAgentStatus[i].node;
       								var node2 = obj.ListaAgentStatus[i].nodeb;
       								var product = obj.ListaAgentStatus[i].product;
       								var ipaddress = obj.ListaAgentStatus[i].ipaddress;
       								var hostname = obj.ListaAgentStatus[i].hostname;
       								var version = obj.ListaAgentStatus[i].version;
       								var hostinfo = obj.ListaAgentStatus[i].hostinfo;
       								var throughnode = obj.ListaAgentStatus[i].throughnode;
       								var heartbeat = obj.ListaAgentStatus[i].heartbeat;       								
       								var btnEstado="";	
       								btnEstado = "<button title=\"Ver Status de Agente\" type=\"button\" class=\"btn bg-orange\" data-toggle=\"modal\" data-target=\"#modalEdit\" "
										+ " onclick=\"validastatus('"
										+ status
										+ "','"
										+ node
										+ "','"
										+ node2
										+ "','"
										+ ipaddress
										+ "','"
										+ hostname
										+ "','"
										+ product
										+ "','"
										+ throughnode
										+ "')\"><i class=\"fa fa-check-square\"></i></button>&nbsp;";
       						  		
           							arr.push(numeracion);
           							arr.push(status);
    								arr.push(node);
    								arr.push(node2);	
    								arr.push(product);
    								arr.push(ipaddress);
    								arr.push(hostname);
    								arr.push(version);
    								arr.push(hostinfo);
    								arr.push(throughnode);
    								arr.push(heartbeat);
    								arr.push(btnEstado);          							 	
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
         	                    if ( data[1] == "OFFLINE" )
         	                    {
         	                       $('td', nRow).css('background-color', '#E74C3C');
                                   $('td', nRow).css('color', 'white');
                                   $('td', nRow).css('font-weight', 'bold');
         	                       $('td', nRow).addClass('parpadea');
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
       	
       	

      	

		
		function validar(e) {
			tecla = (document.all) ? e.keyCode : e.which;
			patron = /[\x5C'"]/;
			te = String.fromCharCode(tecla);
			return !patron.test(te);
		}
      	
					 $('#modalEdit').on('hidden.bs.modal', function () {
						 document.getElementById('mensajenegativo').style.display = 'none';
						 document.getElementById('mensajenegativo2').style.display = 'none';
						 document.getElementById('mensajenegativo3').style.display = 'none';
						 document.getElementById('mensajenegativo4').style.display = 'none';
						 document.getElementById('mensajeafirmativo').style.display = 'none';    
                       });
					
		
					function opcionesHtml() {
						var src = "ServletAgentStatus";
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
