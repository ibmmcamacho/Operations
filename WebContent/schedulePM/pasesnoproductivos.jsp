<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>PASES NO PRODUCTIVOS  | RIMAC</title>
     <style>
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
    <script type="text/javascript">
	var f = new Date();
	var date = f.getFullYear()
			+ '-'
			+ ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f
					.getMonth() + 1)) + '-'
			+ ((f.getDate()) < 10 ? '0' + f.getDate() : f.getDate());

	document.getElementById("txtFechaDesde").value = date;
	document.getElementById("txtFechaHasta").value = date;
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
            Pases no Productivos Rimac
            <small>Rimac</small>
          </h1>
          <ol class="breadcrumb">
            <li><i class="fa fa-th-large"></i> Rimac</li>
            <li class="active">Pases No Productivos</li>
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
							id="txtFechaDesde">
				 </td>
				 <td>                              
		         <input type="text" class="form-control form-control-sm datePicker"
							id="txtFechaHasta">
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
                <!--  <div class="box-header">
                  <h3 class="box-title">DETALLE DE PASES NO PRODUCTIVOS RIMAC</h3>
                  <h4 id="idCabecera" style = "color:red"></h4>
                </div><!-- /.box-header -->
                <ul class="nav nav-pills">
				  <li class="active"><a data-toggle="tab" href="#pestanadbm"><i class="fa fa-table" aria-hidden="true"></i> Base de Datos</a></li>
				  <li><a data-toggle="tab" href="#pestanawme"><i class="fa fa-table" aria-hidden="true"></i>Aplicaciones</a></li>
				</ul>
				<div class="tab-content">
				
					<div id="pestanadbm" class="tab-pane fade in active">
					<div class="box-body">
						<div id="divTabladbm" class="table-responsive">
							Aquí se muestra la data de los tickets de Datamanagment.
						</div>
						<br/>
					</div>
			  		</div>
			  	
			  		<div id="pestanawme" class="tab-pane fade">
					<div class="box-body">
						<div id="divTablawme" class="table-responsive">
							Aquí se muestra la data de los tickets de WME.
						</div>
						<br/>
					</div>			  
			  		</div>
		                
                
                </div>
                
              </div><!-- /.box --> 
             </div>
         </div>
          <!-- END TYPOGRAPHY -->

        </section><!-- /.content -->
      </aside><!-- /.content-wrapper -->

<script>     

$(document).ready(function() {
	
	
	//tablaHtml();
	//listar_Sla("dbm");
	//listar_Sla("wme");
	listReportSolicitud("dbm", 'tblReporteDbm', 'divTabladbm');
	listReportSolicitud("wme", 'tblReporteWme', 'divTablawme');
    }); // Fin del $(document)
        
		function tablaHtml(){    	
         					  
         					 var tabla = "<table id=\"example1\" class=\"table table-bordered table-striped table-responsive table-hover\" "
         					          + "class=\"display\" width=\"99%\" cellspacing=\"0\" style=\"font-size:10px; font-weight:bold\" >"
         					          + "<thead class=\"bg-primary\">"
         	                 		  + "<tr>"
         	                 		  + "<th>FECHA</th>"
         	                 		  + "<th>EJECUTADO</th>"
         	                 		  + "<th>TIEMPO ACUMULADO</th>"
         				        	  + "<th>TOTAL TICKET</th>"
         				          	  + "<th>TICKET</th>"
         		                      + "<th>% ATENCIÓN</th>"
         		                      + "<th>RESULTADO</th>"
         		                      + "<th>EJECUTADO</th>"
        	                 		  + "<th>TIEMPO ACUMULADO</th>"
        				        	  + "<th>TOTAL TICKET</th>"
        				          	  + "<th>TICKET</th>"
        		                      + "<th>% ATENCIÓN</th>"
        		                      + "<th>RESULTADO</th>"
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
         				         	  + "</tr>"
         				         	  + "</thead>" 
         				         	  + "</table>";
  	
         			        document.getElementById("divTabla").innerHTML = tabla; 
 
            }
    
		$('#btnBuscar').click(function(){
	    	
			listReportSolicitud("dbm", 'tblReporteDbm', 'divTabladbm');
			listReportSolicitud("wme", 'tblReporteWme', 'divTablawme');
	    });
   
        function listar_Sla(ptipo){
        	
        	// Haciendo visible Modal con Barra de progreso 
            var $modal = $('.js-loading-bar');
            $modal.modal('show');
            var Desde = $('#txtFechaDesde').val();
            var Hasta = $('#txtFechaHasta').val();
            //var pFecha = '2018-07-02';
            //var pTipo = 'CERTIFICADO';
        	//var perfil = $("#pPerfil").val();  
       	 	var src = "ServletSla";   	
       	 	//var filtro = pTipoDeVista;
       	 
       	//Inicio POST para completar listar información en la tabla
        	$.post(src, {strAccion:"1" ,strFechaDesde : Desde,strFechaHasta : Hasta,strtipo : ptipo}, 

       				function(pdata) {
       			     
       				  var obj = JSON.parse(pdata);
       				  var datatabla = [];
       				  var numeracion = 0;
       				    
       				  if(obj.ListaSla[0].ejecutado_man == ""){
       					
       					}else{
       						  for(i = 0 ; i < obj.ListaSla.length ; i++ ){	
       							  
       							  	numeracion = numeracion + 1;
       							  	var arr = [];
       							  
       							//captura de datos
       								var fecha = obj.ListaSla[i].fecha;
       								var ejecutado_man = obj.ListaSla[i].ejecutado_man;
       								var tiempo_man = obj.ListaSla[i].tiempo_man;
       								var total_man = obj.ListaSla[i].total_man;
       								var tickets_man = obj.ListaSla[i].tickets_man;
       								var porcentaje_man = obj.ListaSla[i].porcentaje_man+' %';
       								var ejecutado_tar = obj.ListaSla[i].ejecutado_tar;
       								var tiempo_tar = obj.ListaSla[i].tiempo_tar;
       								var total_tar = obj.ListaSla[i].total_tar;
       								var tickets_tar = obj.ListaSla[i].tickets_tar;
       								var porcentaje_tar = obj.ListaSla[i].porcentaje_tar+' %'; 
       								
     					     		if(obj.ListaSla[i].porcentaje_man=='100.00'){
     					     			var resultado_man = '<a style="color:green">CUMPLIO</a>'
     					     		}else{
     					     			var resultado_man = '<a style="color:blue">NO CUMPLIO</a>'
     					     		}
     					     		
     					     		if(obj.ListaSla[i].porcentaje_tar=='100.00'){
     					     			var resultado_tar = '<a style="color:green">CUMPLIO</a>'
     					     		}else{
     					     			var resultado_tar = '<a style="color:blue">NO CUMPLIO</a>'
     					     		}
           								arr.push(fecha);
           								arr.push(ejecutado_man);
    									arr.push(tiempo_man);						
    									arr.push(total_man);
    									arr.push(tickets_man);
    								 	arr.push(porcentaje_man);
    								 	arr.push(resultado_man);
    								 	arr.push(ejecutado_tar);
    								  	arr.push(tiempo_tar);
    								 	arr.push(total_tar);   
    								 	arr.push(tickets_tar);   
    								 	arr.push(porcentaje_tar);   
    								 	arr.push(resultado_tar);
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
        				        "orderable": false,
        				        dom: 'Bfrtip',
        				        data : datatabla,  
        				     	lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
        				     	fnRowCallback: function(nRow, data, iDisplayIndex, iDisplayIndexFull) {
             	                    if (data[5] != '100.00 %' || data[11] != '100.00 %')
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
        
        //	 document.getElementById("idCabecera").innerHTML = pTipo2 + ' - ' + pFecha;
        
       	} // Fin funcion Listar
       	
       	
       	
	 

       	
       	
       	
       	function listReportSolicitud(pFiltro, pidtbl, pdiv) {
       		var $modal = $('.js-loading-bar');
            $modal.modal('show');
            var Desde = $('#txtFechaDesde').val();
            var Hasta = $('#txtFechaHasta').val();	
       		
    		var src = "ServletSla";
    		
    	 	
    		//Inicio POST para crear Nueva Solicitud
    	 	$.post(src, {strAccion:"1" ,strFechaDesde : Desde,strFechaHasta : Hasta,strtipo : pFiltro}, 
    					function(pdata) {

      			 		var obj = JSON.parse(pdata);
    			 		if(obj.ListaSla[0].ejecutado_man == ""){
    			  				console.log('Error');
    			  			}else{
    							//Redireccionar página
    			  				var dataReporte = [];
    							var columnsReport = [];
    							
    							var arr = [];
    							
    						 		                      
    							columnsReport = [ 
    								{title : "FECHA"},
    							    {title : "EJECUTADO"},	
    					            {title : "TIEMPO ACUMULADO"},					    
    					            {title : "TOTAL TICKET"}, 
    					            {title : "TICKET"}, 
    					            {title : "% ATENCIÓN"},
    					            {title : "RESULTADO"},
    					            {title : "EJECUTADO"},
    					            {title : "TIEMPO ACUMULADO"},
    					            {title : "TOTAL TICKET"},
    					            {title : "TICKET"},
    					            {title : "% ATENCIÓN"},
    					            {title : "RESULTADO"}
    					            
    					          ];
    							
    							for(i = 0 ; i < obj.ListaSla.length ; i++ ){	
    	  							  
      							  	var arr = [];
      							  
      							//captura de datos
      								var fecha = obj.ListaSla[i].fecha;
      								var ejecutado_man = obj.ListaSla[i].ejecutado_man;
      								var tiempo_man = obj.ListaSla[i].tiempo_man;
      								var total_man = obj.ListaSla[i].total_man;
      								var tickets_man = obj.ListaSla[i].tickets_man;
      								var porcentaje_man = obj.ListaSla[i].porcentaje_man+' %';
      								var ejecutado_tar = obj.ListaSla[i].ejecutado_tar;
      								var tiempo_tar = obj.ListaSla[i].tiempo_tar;
      								var total_tar = obj.ListaSla[i].total_tar;
      								var tickets_tar = obj.ListaSla[i].tickets_tar;
      								var porcentaje_tar = obj.ListaSla[i].porcentaje_tar+' %'; 
      								
    					     		if(obj.ListaSla[i].porcentaje_man=='100.00'){
    					     			var resultado_man = '<a style="color:green">CUMPLIO</a>'
    					     		}else{
    					     			var resultado_man = '<a style="color:blue">NO CUMPLIO</a>'
    					     		}
    					     		
    					     		if(obj.ListaSla[i].porcentaje_tar=='100.00'){
    					     			var resultado_tar = '<a style="color:green">CUMPLIO</a>'
    					     		}else{
    					     			var resultado_tar = '<a style="color:blue">NO CUMPLIO</a>'
    					     		}
          								arr.push(fecha);
          								arr.push(ejecutado_man);
    									arr.push(tiempo_man);						
    									arr.push(total_man);
    									arr.push(tickets_man);
    								 	arr.push(porcentaje_man);
    								 	arr.push(resultado_man);
    								 	arr.push(ejecutado_tar);
    								  	arr.push(tiempo_tar);
    								 	arr.push(total_tar);   
    								 	arr.push(tickets_tar);   
    								 	arr.push(porcentaje_tar);   
    								 	arr.push(resultado_tar);
    								 	dataReporte.push(arr);	
      							  }    
//     							id=\"btnVer"+i+"\"
    							setDataSolicitud(dataReporte,columnsReport,pidtbl,pdiv);
    							
    			  			}	
    		});//Fin del POST			    
    	}
       	
       	
       	
       	
       	
       	function setDataSolicitud(pdataReporte,pcolumnsReport,pidtbl,pdiv){
    		$(document).ajaxStart(function() { Pace.restart(); });
    		var htmlTableReporteSolicitud = '<table id=\"'+pidtbl+'\" class=\"display table table-bordered table-responsive table-hover\" width=\"99%\" >'+
    									'<thead class=\"bg-primary\"></thead>'+
    									'<thead class="filters'+pidtbl+'" >'+
    							        '<tr>'+
    							           '<th style="border: hidden"></th>'+
    							           '<th style="border: hidden"></th>'+
    							           '<th style="border: hidden"></th>'+
    							           '<th style="border: hidden"></th>'+
    							           '<th style="border: hidden"></th>'+
    							           '<th style="border: hidden"></th>'+
    							           '<th style="border: hidden"></th>'+
    							           '<th style="border: hidden"></th>'+
    							           '<th style="border: hidden"></th>'+
    							           '<th style="border: hidden"></th>'+
    							           '<th style="border: hidden"></th>'+
    							           '<th style="border: hidden"></th>'+
    							           '<th style="border: hidden"></th>'+
    							        '</tr>'+
    							        '</thead>'+
    							        '</table>';
    		document.getElementById(pdiv).innerHTML = htmlTableReporteSolicitud;
    	
    		if(typeof tableReporte === 'undefined') 
    	    {
    	    console.log('in if');
    	    
    		var tableReporte = $('#'+pidtbl).DataTable(
    				{
    					processing : false,
    					language : {
    						processing : "Procesando...",
    						search : '<i class="fa fa-search fa-lg"></i>',
    						searchPlaceholder : "Buscar..."
    					},
    					serverSide : false,
    					data : pdataReporte,
    					columns : pcolumnsReport,
    					dom : 'Bfrtip',
    					fnRowCallback: function(nRow, data, iDisplayIndex, iDisplayIndexFull) {
     	                    if (data[5] != '100.00 %' || data[11] != '100.00 %')
     	                    {
     	                    	$('td', nRow).css('background-color', '#E74C3C');
                                $('td', nRow).css('color', 'white');
                                $('td', nRow).css('font-weight', 'bold');
                                $('td', nRow).addClass('parpadea');
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
    							} ],
    					destroy : true
    				});
    		$('.dataTables_filter input').addClass('form-control-search-datatable');
    		
    		// Setup - add a text input to each footer cell
    	    $('#'+pidtbl+' .filters'+pidtbl+' th').each( function () {
    	        var title = $('#'+pidtbl+' thead th').eq( $(this).index() ).text();
    	        $(this).html( '<input type="text" placeholder="Buscar '+title+'" style="width:100%"  />' );
    	    } );

    		table = $('#'+pidtbl).DataTable();
    		
    		// Apply the search
    	    table.columns().eq( 0 ).each( function ( colIdx ) {
    	        $( 'input', $('.filters'+pidtbl+' th')[colIdx] ).on( 'keyup change', function () {
    	            table
    	                .column( colIdx )
    	                .search( this.value )
    	                .draw();
    	        } );
    	    } );
    		
    	    var $modal = $('.js-loading-bar');
	        $modal.modal('hide');

    	    }
    	    else {
    	        console.log('in else');
    	    // how to change the data contained inside datatable?
    	        tableReporte.fnClearTable();
    	        tableReporte.fnAddData(dataReporte);
    	        tableReporte.fnAdjustColumnSizing();
    	    }
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
