<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>BLACKOUT | IBM</title>
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
            BLACKOUT
            <small>IBM</small>
          </h1>
          <ol class="breadcrumb">
            <li><i class="fa fa-th-large"></i> IBM</li>
            <li class="active">administar Blackout</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
		<button title="Actualizar lista de Blackout" type="button"
		class="btn  bg-blue" onclick="listar_Blackout()">
		<i class="fa fa-refresh fa-lg"></i> Actualizar
	</button>
		<br>
		<br>

		  <input type="hidden" style="width: 100%;" class="form-control" id="pPerfil">

                                                       
         
         <div class="row"> 
             <div class="col-md-12">
                <div class="box">
                <div class="box-header">
                  <h3 class="box-title">DETALLE DE BLACKOUT</h3>
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
	listar_Blackout();
	
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
         	                 		  + "<th>INICIO</th>"
         	                 	      + "<th>SUPPRESSEND</th>"
         				        	  + "<th>CHANGENUMBER</th>"
         				          	  + "<th>DESCRIPTION</th>"
         				          	  + "<th>CUSTOMERCODE</th>"
         				          	  + "<th>DURATION</th>"
         				          	  + "<th>ORIGINATOR</th>"
         				          	  + "<th>RESOURCEID</th>"
         				          	  + "<th>COMPONENT</th>"
         				          	  + "<th>COMPONENT TYPE</th>"
         				          	  + "<th>APPLID</th>"
         				          	  + "<th>INSTANCEID</th>"
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
         				         	  + "<th style=\"border: hidden\"></th>"
         				         	  + "<th style=\"border: hidden\"></th>"
         				         	  + "<th style=\"border: hidden\"></th>"
         				         	  + "</tr>"
         				         	  + "</thead>" 
         				         	  + "</table>";
  	
         			        document.getElementById("divTabla").innerHTML = tabla; 
 
            }
    

    			
 
        function listar_Blackout(){
            var $modal = $('.js-loading-bar');
            $modal.modal('show');
       	 	var src = "ServletBlackout";       	 	
        	$.post(src, {strAccion:"1"}, 

       				function(pdata) {
       			     
       				  var obj = JSON.parse(pdata);
       				  var datatabla = [];
       				  var numeracion = 0;
       				    
       				  if(obj.ListaBlackout[0].tipo == ""){
       					
       					}else{
       						  for(i = 0 ; i < obj.ListaBlackout.length ; i++ ){	
       							  
       							  	numeracion = numeracion + 1;
       							  	var arr = [];
       								var perfil = $("#pPerfil").val();
       							//captura de datos
       							
       								var tipo = obj.ListaBlackout[i].tipo;
       								var inicio = obj.ListaBlackout[i].inicio;
       								var suppressend = obj.ListaBlackout[i].suppressend;
       								var changenumber = obj.ListaBlackout[i].changenumber.split("\n").join(" ").split("\t").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("/").trim();
       								//var description = obj.ListaBlackout[i].description.split("\n").join(" ").split("\t").join(" ").split("'").join("\'").split("\"").join("\''").split("\\").join("e").trim();
       								var description = obj.ListaBlackout[i].description;
       								var customercode = obj.ListaBlackout[i].customercode;
       								var duration = obj.ListaBlackout[i].duration;
       								var originator = obj.ListaBlackout[i].originator;
       								var resourceid = obj.ListaBlackout[i].resourceid;
       								var component = obj.ListaBlackout[i].component;   
       								var componenttype = obj.ListaBlackout[i].componenttype;
       								var applid = obj.ListaBlackout[i].applid;
       								var instanceid = obj.ListaBlackout[i].instanceid;
       							       						  		
           							arr.push(numeracion);
           							arr.push(tipo);
    								arr.push(inicio);
    								arr.push(suppressend);	
    								arr.push(changenumber);
    								arr.push(description);
    								arr.push(customercode);
    								arr.push(duration);
    								arr.push(originator);
    								arr.push(resourceid);
    								arr.push(component);
    								arr.push(componenttype);   
    								arr.push(applid);  
    								arr.push(instanceid);  
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
        				     	//fnRowCallback: function(nRow, data, iDisplayIndex, iDisplayIndexFull) {
         	                    //if ( data[1] == "OFFLINE" )
         	                    //{
         	                    //   $('td', nRow).css('background-color', '#E74C3C');
                                //   $('td', nRow).css('color', 'white');
                                //   $('td', nRow).css('font-weight', 'bold');
         	                    //   $('td', nRow).addClass('parpadea');
         	                    //}
         	                //},
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
      	
		
					function opcionesHtml() {
						var src = "ServletBlackout";
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
