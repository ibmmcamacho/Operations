<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>REPORTE RENDIMIENTO | RIMAC</title>
   <style>
   .parpadea {

                  animation-name: parpadeo;
                  animation-duration: 2s;
                  animation-timing-function: linear;
                  animation-iteration-count: infinite;

                  -webkit-animation-name:parpadeo;
                  -webkit-animation-duration: 2s;
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
   
    <script type="text/javascript">
	var f = new Date();
	var date = f.getFullYear()
			+ '-'
			+ ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f
					.getMonth() + 1)) + '-'
			+ ((f.getDate()) < 10 ? '0' + f.getDate() : f.getDate());

	document.getElementById("txtdesde").value = date;
	document.getElementById("txthasta").value = date;
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
            Reporte de Monitoreo Rendimiento Aplicaciones
            <small>Rimac</small>
          </h1>
          <ol class="breadcrumb">
            <li><i class="fa fa-th-large"></i> Rimac</li>
            <li class="active">Reporte Rendimiento Aplicaciones</li>
          </ol>
        </section>
        <input type="hidden" style="width: 100%;" class="form-control" id="pRendimiento">

        <!-- Main content -->
        <section class="content">
         <div class="form-inline">
         	<div class="form-group">
       		   <table>
       		   <tr>
       		   	 <td>                              
		         <input type="text" class="form-control form-control-sm datePicker"
							id="txtdesde">
				 </td>	
                 <td>                              
		         <input type="text" class="form-control form-control-sm datePicker"
							id="txthasta">
				 </td>
				 <td>
				<button id="btnBuscar" title="Buscar" type="button" class="btn btn-info btn-sm"><i class="fa fa-search"></i> Buscar </button>
				</td>
				</tr>
				</table>
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
                  <h3 class="box-title">DETALLE DE REPORTE DE RENDIMIENTO DE APLICACIONES RIMAC</h3>
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
	listar_Reporte_Rendimiento();	
    
    }); // Fin del $(document)
        
		function tablaHtml(){    	
         					  
         					 var tabla = "<table id=\"example1\" class=\"table table-bordered table-striped table-responsive table-hover\" "
         					          + "class=\"display\" width=\"99%\" cellspacing=\"0\" style=\"font-size:10px; font-weight:bold\" >"
         	                 		  + "<thead class=\"bg-primary\">"
         	                 		  + "<tr>"
         	                 		  + "<th>APLICACIÓN</th>"
         	                 		  + "<th>CÓDIGO</th>"
         	                 		  + "<th>TRANSACCIÓN</th>"
         				        	  + "<th>THRESHOLD(MS) PERCENTIL95</th>"
         				          	  + "<th>THRESHOLD(MS)</th>"
         		                      + "<th>TOTAL TRANSACCIONES</th>"
         		                      + "<th>N° TRANSACCIONES DESVIADAS</th>"
         		                      + "<th>INDICADOR DESEMPEÑO</th>"
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
         				         	  + "</tr>"
         				         	  + "</thead>" 
         				         	  + "</table>";
  	
         			        document.getElementById("divTabla").innerHTML = tabla; 
 
            }
    
		$('#btnBuscar').click(function(){
	    	
			listar_Reporte_Rendimiento();
	    	
	    });
   
        function listar_Reporte_Rendimiento(){
        	
        	// Haciendo visible Modal con Barra de progreso 
            var $modal = $('.js-loading-bar');
            $modal.modal('show');
            var pdesde = $('#txtdesde').val();
            var phasta = $('#txthasta').val();
            //var pTipo = $('#idtipo').val();
            //var pTipo2 = $('#idtipo option:selected').text();
            //var pdesde = '2018-07-01';
            //var phasta = '2018-07-25';
        	//var perfil = $("#pPerfil").val();  
       	 	var src = "ServletRendimiento";   	
       	 	//var filtro = pTipoDeVista;
       	 
       	//Inicio POST para completar listar información en la tabla
        	$.post(src, {strAccion:"2" ,strDesde : pdesde,strHasta : phasta}, 

       				function(pdata) {
       			     
       				  var obj = JSON.parse(pdata);
       				  var datatabla = [];
       				//  var numeracion = 0;
       				    
       				  if(obj.ListaRendimientoReporte[0].fecha_reporte == ""){
       				
       					}else{
       						  for(i = 0 ; i < obj.ListaRendimientoReporte.length ; i++ ){	
       							  
       							  	//numeracion = numeracion + 1;
       							  	var arr = [];
       							 	var arr1 = [];
       							 	var arr2 = [];
       							 	var arr3 = [];
       							 	var arr4 = [];
       							 	var arr5 = [];
    							 	var arr6 = [];
    							 	var arr7 = [];
    							 	var arr8 = [];
    							 	var arr9 = [];
    							 	var arr10 = [];
       							 	var arr11 = [];
       							 	var arr12 = [];
       							 	var arr13 = [];
       							 	var arr14 = [];
       							 	var arr15 = [];
    							 	var arr16 = [];
    							 	var arr17 = [];
    							 	
    							 	var poliza_aplicacion = 'PIVOTAL';
       								var poliza_codigo = 'Piv01';
       								var poliza_transaccion = 'Consulta de Póliza';       								
       								var poliza_percentil = obj.ListaRendimientoReporte[i].poliza_percentil;
       								var poliza_threshold = obj.ListaRendimientoReporte[i].poliza_threshold;
       								var poliza_total = obj.ListaRendimientoReporte[i].poliza_total;
       								var poliza_desvios = obj.ListaRendimientoReporte[i].poliza_desvios;
       								if (obj.ListaRendimientoReporte[i].poliza_indicador == ''){
       									var poliza_indicador = obj.ListaRendimientoReporte[i].poliza_indicador;
       								}else{
       									var poliza_indicador = obj.ListaRendimientoReporte[i].poliza_indicador+' %';	
       								}
       								
       								
    							 	var certificado_aplicacion = 'PIVOTAL';
       								var certificado_codigo = 'Piv02';
       								var certificado_transaccion = 'Consulta de Certificados';       								
       								var certificado_percentil = obj.ListaRendimientoReporte[i].certificado_percentil;
       								var certificado_threshold = obj.ListaRendimientoReporte[i].certificado_threshold;
       								var certificado_total = obj.ListaRendimientoReporte[i].certificado_total;
       								var certificado_desvios = obj.ListaRendimientoReporte[i].certificado_desvios;
       								if (obj.ListaRendimientoReporte[i].certificado_indicador == ''){
       									var certificado_indicador = obj.ListaRendimientoReporte[i].certificado_indicador;
       								}else{
       									var certificado_indicador = obj.ListaRendimientoReporte[i].certificado_indicador+' %';	
       								}
       								
    							 	var cobertura_aplicacion = 'PIVOTAL';
       								var cobertura_codigo = 'Piv03';
       								var cobertura_transaccion = 'Buscar Coberturas Certificados';       								
       								var cobertura_percentil = obj.ListaRendimientoReporte[i].cobertura_percentil;
       								var cobertura_threshold = obj.ListaRendimientoReporte[i].cobertura_threshold;
       								var cobertura_total = obj.ListaRendimientoReporte[i].cobertura_total;
       								var cobertura_desvios = obj.ListaRendimientoReporte[i].cobertura_desvios;
       								var cobertura_indicador = obj.ListaRendimientoReporte[i].cobertura_indicador+' %';
       								if (obj.ListaRendimientoReporte[i].cobertura_indicador == ''){
       									var cobertura_indicador = obj.ListaRendimientoReporte[i].cobertura_indicador;
       								}else{
       									var cobertura_indicador = obj.ListaRendimientoReporte[i].cobertura_indicador+' %';	
       								}
       								
       								var proveedores_aplicacion = 'PIVOTAL';
       								var proveedores_codigo = 'Piv04';
       								var proveedores_transaccion = 'Busca Lista Proveedores';       								
       								var proveedores_percentil = obj.ListaRendimientoReporte[i].proveedores_percentil;
       								var proveedores_threshold = obj.ListaRendimientoReporte[i].proveedores_threshold;
       								var proveedores_total = obj.ListaRendimientoReporte[i].proveedores_total;
       								var proveedores_desvios = obj.ListaRendimientoReporte[i].proveedores_desvios;
       								var proveedores_indicador = obj.ListaRendimientoReporte[i].proveedores_indicador+' %';
       								       								
    							 	var trasmision_aplicacion = 'PIVOTAL';
       								var trasmision_codigo = 'Piv05';
       								var trasmision_transaccion = 'Transmisión de Casos';       								
       								var trasmision_percentil = obj.ListaRendimientoReporte[i].trasmision_percentil;
       								var trasmision_threshold = obj.ListaRendimientoReporte[i].trasmision_threshold;
       								var trasmision_total = obj.ListaRendimientoReporte[i].trasmision_total;
       								var trasmision_desvios = obj.ListaRendimientoReporte[i].trasmision_desvios;
       								var trasmision_indicador = obj.ListaRendimientoReporte[i].trasmision_indicador+' %';       								

    							 	var siniestro_cert_aplicacion = 'PIVOTAL';
       								var siniestro_cert_codigo = 'Piv06';
       								var siniestro_cert_transaccion = 'Consulta de Siniestros por certificados';       								
       								var siniestro_cert_percentil = obj.ListaRendimientoReporte[i].siniestro_cert_percentil;
       								var siniestro_cert_threshold = obj.ListaRendimientoReporte[i].siniestro_cert_threshold;
       								var siniestro_cert_total = obj.ListaRendimientoReporte[i].siniestro_cert_total;
       								var siniestro_cert_desvios = obj.ListaRendimientoReporte[i].siniestro_cert_desvios;
       								var siniestro_cert_indicador = obj.ListaRendimientoReporte[i].siniestro_cert_indicador+' %';
       								
    							 	var det_sin_aplicacion = 'PIVOTAL';
       								var det_sin_codigo = 'Piv07';
       								var det_sin_transaccion = 'Consulta detalle de Siniestros';       								
       								var det_sin_percentil = obj.ListaRendimientoReporte[i].det_sin_percentil;
       								var det_sin_threshold = obj.ListaRendimientoReporte[i].det_sin_threshold;
       								var det_sin_total = obj.ListaRendimientoReporte[i].det_sin_total;
       								var det_sin_desvios = obj.ListaRendimientoReporte[i].det_sin_desvios;
       								var det_sin_indicador = obj.ListaRendimientoReporte[i].det_sin_indicador+' %';       								

    							 	var asegurados_aplicacion = 'PIVOTAL';
       								var asegurados_codigo = 'Piv08';
       								var asegurados_transaccion = 'Consulta de asegurados por Certificado';       								
       								var asegurados_percentil = obj.ListaRendimientoReporte[i].asegurados_percentil;
       								var asegurados_threshold = obj.ListaRendimientoReporte[i].asegurados_threshold;
       								var asegurados_total = obj.ListaRendimientoReporte[i].asegurados_total;
       								var asegurados_desvios = obj.ListaRendimientoReporte[i].asegurados_desvios;
       								var asegurados_indicador = obj.ListaRendimientoReporte[i].asegurados_indicador+' %';
       								
    							 	var feb_cob_aplicacion = 'PIVOTAL';
       								var feb_cob_codigo = 'Piv09';
       								var feb_cob_transaccion = 'Consulta de Fecha por Cobertura';       								
       								var feb_cob_percentil = obj.ListaRendimientoReporte[i].feb_cob_percentil;
       								var feb_cob_threshold = obj.ListaRendimientoReporte[i].feb_cob_threshold;
       								var feb_cob_total = obj.ListaRendimientoReporte[i].feb_cob_total;
       								var feb_cob_desvios = obj.ListaRendimientoReporte[i].feb_cob_desvios;
       								var feb_cob_indicador = obj.ListaRendimientoReporte[i].feb_cob_indicador+' %';       								

    							 	var cupones_aplicacion = 'PIVOTAL';
       								var cupones_codigo = 'Piv10';
       								var cupones_transaccion = 'Consulta de cupones pendientes por certificado';       								
       								var cupones_percentil = obj.ListaRendimientoReporte[i].cupones_percentil;
       								var cupones_threshold = obj.ListaRendimientoReporte[i].cupones_threshold;
       								var cupones_total = obj.ListaRendimientoReporte[i].cupones_total;
       								var cupones_desvios = obj.ListaRendimientoReporte[i].cupones_desvios;
       								var cupones_indicador = obj.ListaRendimientoReporte[i].cupones_indicador+' %';       								

    							 	var financia_aplicacion = 'PIVOTAL';
       								var financia_codigo = 'Piv11';
       								var financia_transaccion = 'Obtener detalle de financiamiento';       								
       								var financia_percentil = obj.ListaRendimientoReporte[i].financia_percentil;
       								var financia_threshold = obj.ListaRendimientoReporte[i].financia_threshold;
       								var financia_total = obj.ListaRendimientoReporte[i].financia_total;
       								var financia_desvios = obj.ListaRendimientoReporte[i].financia_desvios;
       								var financia_indicador = obj.ListaRendimientoReporte[i].financia_indicador+' %';
       								
    							 	var poliza_buscar_aplicacion = 'REL';
       								var poliza_buscar_codigo = 'Rel01';
       								var poliza_buscar_transaccion = 'Emision de Póliza AM - Buscar Trámite';       								
       								var poliza_buscar_percentil = obj.ListaRendimientoReporte[i].poliza_buscar_percentil;
       								var poliza_buscar_threshold = obj.ListaRendimientoReporte[i].poliza_buscar_threshold;
       								var poliza_buscar_total = obj.ListaRendimientoReporte[i].poliza_buscar_total;
       								var poliza_buscar_desvios = obj.ListaRendimientoReporte[i].poliza_buscar_desvios;
       								var poliza_buscar_indicador = obj.ListaRendimientoReporte[i].poliza_buscar_indicador+' %';
       								
    							 	var poliza_preafi_aplicacion = 'REL';
       								var poliza_preafi_codigo = 'Rel02';
       								var poliza_preafi_transaccion = 'Emision de Póliza AM - Pre Afiliación';       								
       								var poliza_preafi_percentil = obj.ListaRendimientoReporte[i].poliza_preafi_percentil;
       								var poliza_preafi_threshold = obj.ListaRendimientoReporte[i].poliza_preafi_threshold;
       								var poliza_preafi_total = obj.ListaRendimientoReporte[i].poliza_preafi_total;
       								var poliza_preafi_desvios = obj.ListaRendimientoReporte[i].poliza_preafi_desvios;
       								var poliza_preafi_indicador = obj.ListaRendimientoReporte[i].poliza_preafi_indicador+' %';
       								
    							 	var poliza_act_aplicacion = 'REL';
       								var poliza_act_codigo = 'Rel03';
       								var poliza_act_transaccion = 'Emision de Póliza AM - Activar';       								
       								var poliza_act_percentil = obj.ListaRendimientoReporte[i].poliza_act_percentil;
       								var poliza_act_threshold = obj.ListaRendimientoReporte[i].poliza_act_threshold;
       								var poliza_act_total = obj.ListaRendimientoReporte[i].poliza_act_total;
       								var poliza_act_desvios = obj.ListaRendimientoReporte[i].poliza_act_desvios;
       								var poliza_act_indicador = obj.ListaRendimientoReporte[i].poliza_act_indicador+' %';       								
									
       								var bizagi_aplicacion = 'BIZAGI';
       								var bizagi_codigo = 'Biz01';
       								var bizagi_transaccion = 'BPM Siniestros Vehiculos - Ingreso al Sistema';       								
       								var bizagi_percentil = obj.ListaRendimientoReporte[i].bizagi_percentil;
       								var bizagi_threshold = obj.ListaRendimientoReporte[i].bizagi_threshold;
       								var bizagi_total = obj.ListaRendimientoReporte[i].bizagi_total;
       								var bizagi_desvios = obj.ListaRendimientoReporte[i].bizagi_desvios;
       								var bizagi_indicador = obj.ListaRendimientoReporte[i].bizagi_indicador+' %';
       								
    							 	var endoso_aplicacion = 'SAS';
       								var endoso_codigo = 'SAS01';
       								var endoso_transaccion = 'Registro de Pólizas y Endosos - Activar Póliza';       								
       								var endoso_percentil = obj.ListaRendimientoReporte[i].endoso_percentil;
       								var endoso_threshold = obj.ListaRendimientoReporte[i].endoso_threshold;
       								var endoso_total = obj.ListaRendimientoReporte[i].endoso_total;
       								var endoso_desvios = obj.ListaRendimientoReporte[i].endoso_desvios;
       								var endoso_indicador = obj.ListaRendimientoReporte[i].endoso_indicador+' %';       								

    							 	var salud_aplicacion = 'SAS';
       								var salud_codigo = 'SAS02';
       								var salud_transaccion = 'Salud - Procesar TreeView';       								
       								var salud_percentil = obj.ListaRendimientoReporte[i].salud_percentil;
       								var salud_threshold = obj.ListaRendimientoReporte[i].salud_threshold;
       								var salud_total = obj.ListaRendimientoReporte[i].salud_total;
       								var salud_desvios = obj.ListaRendimientoReporte[i].salud_desvios;
       								var salud_indicador = obj.ListaRendimientoReporte[i].salud_indicador+' %';       								

    							 	var trama_aplicacion = 'SAS';
       								var trama_codigo = 'SAS03';
       								var trama_transaccion = 'SCTR - Movimientos';       								
       								var trama_percentil = obj.ListaRendimientoReporte[i].trama_percentil;
       								var trama_threshold = obj.ListaRendimientoReporte[i].trama_threshold;
       								var trama_total = obj.ListaRendimientoReporte[i].trama_total;
       								var trama_desvios = obj.ListaRendimientoReporte[i].trama_desvios;
       								var trama_indicador = obj.ListaRendimientoReporte[i].trama_indicador+' %';       								
    								       													    	
           								arr.push(poliza_aplicacion);
           								arr.push(poliza_codigo);
    									arr.push(poliza_transaccion);						
    									arr.push(poliza_percentil);
    									arr.push(poliza_threshold);
    								 	arr.push(poliza_total);
    								 	arr.push(poliza_desvios);
    								  	arr.push(poliza_indicador);           							 	
           							 	datatabla.push(arr);
           							 	
           							 	arr1.push(certificado_aplicacion);
           								arr1.push(certificado_codigo);
           								arr1.push(certificado_transaccion);						
           								arr1.push(certificado_percentil);
           								arr1.push(certificado_threshold);
           								arr1.push(certificado_total);
           								arr1.push(certificado_desvios);
           								arr1.push(certificado_indicador);           							 	
        							 	datatabla.push(arr1);
        							 	
           							 	arr2.push(cobertura_aplicacion);
           								arr2.push(cobertura_codigo);
           								arr2.push(cobertura_transaccion);						
           								arr2.push(cobertura_percentil);
           								arr2.push(cobertura_threshold);
           								arr2.push(cobertura_total);
           								arr2.push(cobertura_desvios);
           								arr2.push(cobertura_indicador);           							 	
        							 	datatabla.push(arr2);
        							 	
           							 	arr3.push(proveedores_aplicacion);
           							 	arr3.push(proveedores_codigo);
           								arr3.push(proveedores_transaccion);						
           								arr3.push(proveedores_percentil);
           								arr3.push(proveedores_threshold);
           								arr3.push(proveedores_total);
           								arr3.push(proveedores_desvios);
           								arr3.push(proveedores_indicador);           							 	
        							 	datatabla.push(arr3);
        							 	
           							 	arr4.push(trasmision_aplicacion);
           								arr4.push(trasmision_codigo);
           								arr4.push(trasmision_transaccion);						
           								arr4.push(trasmision_percentil);
           								arr4.push(trasmision_threshold);
           								arr4.push(trasmision_total);
           								arr4.push(trasmision_desvios);
           								arr4.push(trasmision_indicador);           							 	
        							 	datatabla.push(arr4);
        							 	
           							 	arr5.push(siniestro_cert_aplicacion);
           								arr5.push(siniestro_cert_codigo);
           								arr5.push(siniestro_cert_transaccion);						
           								arr5.push(siniestro_cert_percentil);
           								arr5.push(siniestro_cert_threshold);
           								arr5.push(siniestro_cert_total);
           								arr5.push(siniestro_cert_desvios);
           								arr5.push(siniestro_cert_indicador);           							 	
        							 	datatabla.push(arr5);
        							 	
           							 	arr6.push(det_sin_aplicacion);
           								arr6.push(det_sin_codigo);
           								arr6.push(det_sin_transaccion);						
           								arr6.push(det_sin_percentil);
           								arr6.push(det_sin_threshold);
           								arr6.push(det_sin_total);
           								arr6.push(det_sin_desvios);
           								arr6.push(det_sin_indicador);           							 	
        							 	datatabla.push(arr6);
        							 	
           							 	arr7.push(asegurados_aplicacion);
           								arr7.push(asegurados_codigo);
           								arr7.push(asegurados_transaccion);						
           								arr7.push(asegurados_percentil);
           								arr7.push(asegurados_threshold);
           								arr7.push(asegurados_total);
           								arr7.push(asegurados_desvios);
           								arr7.push(asegurados_indicador);           							 	
        							 	datatabla.push(arr7);
        							 	
           							 	arr8.push(feb_cob_aplicacion);
           								arr8.push(feb_cob_codigo);
           								arr8.push(feb_cob_transaccion);						
           								arr8.push(feb_cob_percentil);
           								arr8.push(feb_cob_threshold);
           								arr8.push(feb_cob_total);
           								arr8.push(feb_cob_desvios);
           								arr8.push(feb_cob_indicador);           							 	
        							 	datatabla.push(arr8);
        							 	
           							 	arr9.push(cupones_aplicacion);
           								arr9.push(cupones_codigo);
           								arr9.push(cupones_transaccion);						
           								arr9.push(cupones_percentil);
           								arr9.push(cupones_threshold);
           								arr9.push(cupones_total);
           								arr9.push(cupones_desvios);
           								arr9.push(cupones_indicador);           							 	
        							 	datatabla.push(arr9);
        							 	
           							 	arr10.push(financia_aplicacion);
           								arr10.push(financia_codigo);
           								arr10.push(financia_transaccion);						
           								arr10.push(financia_percentil);
           								arr10.push(financia_threshold);
           								arr10.push(financia_total);
           								arr10.push(financia_desvios);
           								arr10.push(financia_indicador);           							 	
        							 	datatabla.push(arr10);
        							 	
           							 	arr11.push(poliza_buscar_aplicacion);
           								arr11.push(poliza_buscar_codigo);
           								arr11.push(poliza_buscar_transaccion);						
           								arr11.push(poliza_buscar_percentil);
           								arr11.push(poliza_buscar_threshold);
           								arr11.push(poliza_buscar_total);
           								arr11.push(poliza_buscar_desvios);
           								arr11.push(poliza_buscar_indicador);           							 	
        							 	datatabla.push(arr11);
        							 	
           							 	arr12.push(poliza_preafi_aplicacion);
           								arr12.push(poliza_preafi_codigo);
           								arr12.push(poliza_preafi_transaccion);						
           								arr12.push(poliza_preafi_percentil);
           								arr12.push(poliza_preafi_threshold);
           								arr12.push(poliza_preafi_total);
           								arr12.push(poliza_preafi_desvios);
           								arr12.push(poliza_preafi_indicador);           							 	
        							 	datatabla.push(arr12);
        							 	
           							 	arr13.push(poliza_act_aplicacion);
           								arr13.push(poliza_act_codigo);
           								arr13.push(poliza_act_transaccion);						
           								arr13.push(poliza_act_percentil);
           								arr13.push(poliza_act_threshold);
           								arr13.push(poliza_act_total);
           								arr13.push(poliza_act_desvios);
           								arr13.push(poliza_act_indicador);           							 	
        							 	datatabla.push(arr13);
        							 	
           							 	arr14.push(bizagi_aplicacion);
           								arr14.push(bizagi_codigo);
           								arr14.push(bizagi_transaccion);						
           								arr14.push(bizagi_percentil);
           								arr14.push(bizagi_threshold);
           								arr14.push(bizagi_total);
           								arr14.push(bizagi_desvios);
           								arr14.push(bizagi_indicador);           							 	
        							 	datatabla.push(arr14);
        							 	
           							 	arr15.push(endoso_aplicacion);
           								arr15.push(endoso_codigo);
           								arr15.push(endoso_transaccion);						
           								arr15.push(endoso_percentil);
           								arr15.push(endoso_threshold);
           								arr15.push(endoso_total);
           								arr15.push(endoso_desvios);
           								arr15.push(endoso_indicador);           							 	
        							 	datatabla.push(arr15);
        							 	
           							 	arr16.push(salud_aplicacion);
           								arr16.push(salud_codigo);
           								arr16.push(salud_transaccion);						
           								arr16.push(salud_percentil);
           								arr16.push(salud_threshold);
           								arr16.push(salud_total);
           								arr16.push(salud_desvios);
           								arr16.push(salud_indicador);           							 	
        							 	datatabla.push(arr16);
        							 	
           							 	arr17.push(trama_aplicacion);
           								arr17.push(trama_codigo);
           								arr17.push(trama_transaccion);						
           								arr17.push(trama_percentil);
           								arr17.push(trama_threshold);
           								arr17.push(trama_total);
           								arr17.push(trama_desvios);
           								arr17.push(trama_indicador);           							 	
        							 	datatabla.push(arr17);       
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
         	                    if (parseInt(data[3]) > parseInt(data[4]))
         	                    {
         	                    	console.log(data[3]+'|'+data[4]);
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
        
        	 document.getElementById("idCabecera").innerHTML = pdesde + ' al ' + phasta;
        
       	} // Fin funcion Listar
       	
       	
       	
	 

   		
   		
</script>
<script>
<script type="text/javascript">
$('.clockpicker').clockpicker({
    donetext: 'OK'
});

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
