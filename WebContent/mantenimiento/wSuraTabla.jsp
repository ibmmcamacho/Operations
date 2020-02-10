<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

</head>
<body>

<aside class="right-side "> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	REPORTE <small>SURA</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-th-large"></i> REPORTE</a></li>
	<li class="active">Sura</li>
</ol>
</section> <!-- Main content --> <section class="content"> <!-- top row -->
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="form-inline">
			
				<!-- ACA -->
				
				<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10">				
				<a style="color: red" class="hidden" id="alertfechas">*La Fecha Inicio debe ser menor a la Fecha Fin</a>
				<br>
				Fecha Inicio : 
				<input type="date" class="form-control" id="txtfecini" onchange="validarbtnConsultar()">
				Fecha Fin :
				<input type="date" class="form-control" id="txtfecfin" onchange="validarbtnConsultar()">
        		<button id="btnConsultar" disabled class="btn btn-primary" onclick="listTabla1()" onchange="validarbtnConsultar()"> <a class="fa fa-search" style="color: white"></a>  Consultar</button>
        		
        		</div>
        		
        		
        		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="right">
				<br><button id ="btnTODOS"  disabled class="btn btn-primary" onclick="openModalReporte('TODOS','TODOS')"><a class="fa fa-calendar" style="color: white"></a> Ver Todos</button>
				</div>
				
      			<!-- ACA -->
				
			
		</div>
	</div>
</div>
<br />



<div class="row">
	<div class="col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i>Tabla3 SLA DISPATCH (INCIDENTES) </h3>
			</div>
			<div class="box-body">
				<label id="lblMessage" class="label label-info"></label>
					<div id="tbcontainer3" class="table-responsive">
					</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> Tabla1 SLA RESOLVE (INCIDENTES)</h3>
			</div>
			<div class="box-body">
				<label id="lblMessage" class="label label-info"></label>
					<div id="tbcontainer1" class="table-responsive">
					</div>
			</div>
		</div>
	</div>
</div>


<div class="row">
	<div class="col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i>Tabla2 SLA RESOLVE (SR) </h3>
			</div>
			<div class="box-body">
				<label id="lblMessage" class="label label-info"></label>
					<div id="tbcontainer2" class="table-responsive">
					</div>
			</div>
		</div>
	</div>
</div>





			<div class="modal fade" id="mdListReport" tabindex="0" role="dialog">
			  <div class="modal-dialog" role="document" style="width: 1300px">
			    <div class="modal-content">
			    
			      <div class="modal-header" align="center">
			        <h2 class="modal-title" id ="TituloModal" >Lista de Tickets</h2>
			      </div>      
			      
				      <div class="modal-body">
				      	<div class="row">
				        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				        		<input type="hidden" id="hdIdPerfil">
				        		
				        		<div class="form-group">				        			
				        			<div id="tbcontainerListReport" class="table-responsive" align="center"></div>				        			
				       			</div> 
				       			       			       			
				        	</div>         				
				       	</div>
				       </div>
				       
			     </div>      
			   </div>
			 </div>



<!-- /.row --> <!-- Main row -->
<div class="row"></div>
<!-- /.row (main row) --> </section><!-- /.content --> </aside>
</body>

<script type="text/javascript">

function validarbtnConsultar(){
	
	var vFecini = document.getElementById("txtfecini").value;
	var vFecfin = document.getElementById("txtfecfin").value;
	
	if(vFecini > vFecfin){
		$('#btnConsultar').prop("disabled", true);
		$('#alertfechas').removeClass('hidden');
		
	}else{
		$('#btnConsultar').prop("disabled", false);
		$('#alertfechas').addClass('hidden');
	}
}

function listTabla1(){	
	
	$(document).ready(function() {
		
		$('#txtfecini').prop("disabled", true);
		$('#txtfecfin').prop("disabled", true);
		$('#btnConsultar').prop("disabled", true);
		$('#btnTODOS').prop("disabled", true);
		
		$('#tbcontainer1 p').remove();
		$('#tbcontainer2 p').remove();
		$('#tbcontainer3 p').remove();
		
		$('#tbcontainer1 div').remove();
		$('#tbcontainer2 div').remove();
		$('#tbcontainer3 div').remove();
		
		$('#tbcontainer1').append(' <p class="fa fa-refresh fa-spin" style="font-size:40px;color: black;"></p>  <br><br><h1 align="center">Cargando</h1>');
		$('#tbcontainer1').addClass('overlay');
		
		$('#tbcontainer2').append(' <p class="fa fa-refresh fa-spin" style="font-size:40px;color: black;"></p>  <br><br><h1 align="center">Cargando</h1>');
		$('#tbcontainer2').addClass('overlay');
		
		$('#tbcontainer3').append(' <p class="fa fa-refresh fa-spin" style="font-size:40px;color: black;"></p>  <br><br><h1 align="center">Cargando</h1>');
		$('#tbcontainer3').addClass('overlay');
		
		var vFecini = document.getElementById("txtfecini").value;
		var vFecfin = document.getElementById("txtfecfin").value;
		
		var src = "ServletWSuraTabla";
		$.post(src, {strAccion : 'ListTabla1' , FECHAINICIO : vFecini, FECHAFIN : vFecfin},
				function(pdata) {
					 /* alert(pdata); */
				  var obj = JSON.parse(pdata);
			
				  var dataReporte = [];
				  var columnsReport = [];
				

					  for(i = 0 ; i < obj.listarTabla1.length ; i++ )
					  	{
						var arr = [];
						arr.push(i+1);
						arr.push('Tabla1');
						arr.push(obj.listarTabla1[i].Prioridad);
						arr.push(obj.listarTabla1[i].Indicador.replace('@',' ').replace('@',' ').replace('@',' ').replace('@',' ').replace('@',' '));
						arr.push(obj.listarTabla1[i].Sla.replace('menor',' < '));
						arr.push(obj.listarTabla1[i].Cumple);
						arr.push(obj.listarTabla1[i].NoCumple);
						arr.push(obj.listarTabla1[i].Total);
						
						/* CALCULAR EL PORCENTAJE */
						var a = obj.listarTabla1[i].Cumple;
						var b = obj.listarTabla1[i].Total;
						var c = (a/b)*100;
						var porcentaje = parseInt(c)+"%" ;
						/* FIN CALCULAR EL PORCENTAJE */
						
						arr.push(porcentaje);
						arr.push(obj.listarTabla1[i].TasaDePenalidad);
						
						dataReporte.push(arr);
						}
					  
					  columnsReport = [ {title : "NRO"},
						{title : "#Tabla"},
						{title : "PRIORIDAD"},
					    {title : "INDICADOR"}, 
			            {title : "SLA"},
			            {title : "CUMPLE"}, 
			            {title : "NO CUMPLE"},
			            {title : "TOTAL"},
			            {title : "PORCENTAJE"},
			            {title : "TASA DE PENALIDAD"},
			            {
							"sName": "verticketbtn",
							"title" : "Tickets", 
							"bSearchable": false,
							"sWidth": "100px",
							"bSortable": false,
							"mRender": function ( data, type, columns ) {
								return '<a title="Ver tickets" class="btn btn-primary btn-sm" onclick="openModalReporte(\'' + columns[1] + '\',\'' + columns[2] +'\')"><i class="fa fa-external-link" aria-hidden="true"></i></a>&nbsp;&nbsp;'; 
									   
							}
						}
			          ];
				  	
				    setData1(dataReporte,columnsReport);
				    $('#tbcontainer1 p').remove();
					$('#tbcontainer1').removeClass('overlay');
					listTabla2();
					
		});
		
	});
	}
	var htmlTable1 = '<table id=\"tblReportes1\" class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
	function setData1(pdataReporte,pcolumnsReport)
	{
		document.getElementById('tbcontainer1').innerHTML = 	htmlTable1;
		
		if(typeof tableReporte === 'undefined') 
	    {
	    console.log('in if');
	    
		var tableReporte = $('#tblReportes1').DataTable(
				{
					
					data : pdataReporte,
					columns : pcolumnsReport,
					columnDefs: [
						{ "className": "text-center bold", "targets": [0,1,2,3,4,5,6,7,8,9,10] },
						{"targets": [1,2] ,"visible": false, "searchable": false}
					    ],
					    "lengthChange": false,
					    "searching": false,
					    "bFilter" : false,               
					    "bLengthChange": false,
					    "paging": false,
					    dom: "<'row'<'col-sm-6'B><'col-sm-6 text-right'f>>" +
						"<'row'<'col-sm-12'tr>>" +
						"<'row'<'col-sm-5'><'col-sm-7 text-right'p>>",
						language : {
							processing : "Procesando...",
							search : '<i class="fa fa-search fa-lg" aria-hidden="true"></i> ',
							searchPlaceholder : "Buscar...",
							lengthMenu: "Mostrar _MENU_ registros por página",
				            zeroRecords: "No se encontraron registros",
				            info: "Ver página _PAGE_ de _PAGES_ página(s)",
				            infoEmpty: "No hay información disponible",
				            infoFiltered: "(filtro de _MAX_ total de registros)",
				            paginate: {
				                first:      "Inicio",
				                last:       "Atras",
				                next:       "Siguiente",
				                previous:   "Atrás"
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
											className: "btn-sm"
										},
										{
										 	extend: "copy",
											exportOptions: {
												columns: ':visible(:not(.not-export-col))'
											},
											className: "btn-sm",
											text : '<i class="fa fa-clipboard" aria-hidden="true"></i> Copiar'
										},
										{
											extend: "csv",
											exportOptions: {
												columns: ':visible(:not(.not-export-col))'
											},
											className: "btn-sm",
											text : '<i class="fa fa-file-text-o" aria-hidden="true"></i> CSV'
										},
										{
											extend: "excel",
											exportOptions: {
												columns: ':visible(:not(.not-export-col))'
											},
											className: "btn-sm",
											text : '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
										},
										{
											extend: "pdfHtml5",
											exportOptions: {
												columns: ':visible(:not(.not-export-col))'
											},
											className: "btn-sm",
											text : '<i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF'
										},
										{
											extend: "print",
											exportOptions: {
												columns: ':visible(:not(.not-export-col))'
											},
											className: "btn-sm",
											text : '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'
										}]
					
				});
		/* $('.dataTables_filter input').addClass('form-control-search-datatable'); */
	    }
	    else {
	        console.log('in else');
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
	}
	
	
	
	function listTabla2(){
		
		$(document).ready(function() {
			
			var vFecini = document.getElementById("txtfecini").value;
			var vFecfin = document.getElementById("txtfecfin").value;
			
			var src = "ServletWSuraTabla";
			$.post(src, {strAccion : 'ListTabla2'  , FECHAINICIO : vFecini, FECHAFIN : vFecfin},
					function(pdata) {
						 /* alert(pdata); */
					  var obj = JSON.parse(pdata);
				
					  var dataReporte = [];
					  var columnsReport = [];
					

						  for(i = 0 ; i < obj.listarTabla2.length ; i++ )
						  	{
							var arr = [];
							arr.push(i+1);
							arr.push('Tabla2');
							arr.push(obj.listarTabla2[i].Prioridad);
							arr.push(obj.listarTabla2[i].Indicador.replace('@',' ').replace('@',' ').replace('@',' ').replace('@',' ').replace('@',' '));
							arr.push(obj.listarTabla2[i].Sla.replace('menor',' < '));
							arr.push(obj.listarTabla2[i].Cumple);
							arr.push(obj.listarTabla2[i].NoCumple);
							arr.push(obj.listarTabla2[i].Total);
							
							/* CALCULAR EL PORCENTAJE */
							var a = obj.listarTabla2[i].Cumple;
							var b = obj.listarTabla2[i].Total;
							var c = (a/b)*100;
							var porcentaje = parseInt(c)+"%" ;
							/* FIN CALCULAR EL PORCENTAJE */
							
							arr.push(porcentaje);
							arr.push(obj.listarTabla2[i].TasaDePenalidad);
							
							dataReporte.push(arr);
							}
						  
						  columnsReport = [ {title : "NRO"},
							{title : "#Tabla"},
							{title : "PRIORIDAD"},
							{title : "INDICADOR"}, 
				            {title : "SLA"},
				            {title : "CUMPLE"}, 
				            {title : "NO CUMPLE"},
				            {title : "TOTAL"},
				            {title : "PORCENTAJE"},
				            {title : "TASA DE PENALIDAD"},
				            {
								"sName": "verticketbtn",
								"title" : "Tickets", 
								"bSearchable": false,
								"sWidth": "100px",
								"bSortable": false,
								"mRender": function ( data, type, columns ) {
									return '<a title="Ver tickets" class="btn btn-primary btn-sm" onclick="openModalReporte(\'' + columns[1] + '\',\'' + columns[2] +'\')"><i class="fa fa-external-link" aria-hidden="true"></i></a>&nbsp;&nbsp;'; 
										   
								}
							}
				          ];
					  
					    setData2(dataReporte,columnsReport);
					    $('#tbcontainer2 p').remove();
						$('#tbcontainer2').removeClass('overlay');
						listTabla3(); 

			});
			
		});
		}
		var htmlTable2 = '<table id=\"tblReportes2\" class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
		function setData2(pdataReporte,pcolumnsReport)
		{
			document.getElementById('tbcontainer2').innerHTML = 	htmlTable2;
			
			if(typeof tableReporte === 'undefined') 
		    {
		    console.log('in if');
		    
			var tableReporte = $('#tblReportes2').DataTable(
					{
						
						data : pdataReporte,
						columns : pcolumnsReport,
						columnDefs: [
							{ "className": "text-center bold", "targets": [0,1,2,3,4,5,6,7,8,9,10] },
							{"targets": [1,2] ,"visible": false, "searchable": false}
						    ],
						    "lengthChange": false,
						    "searching": false,
						    "bFilter" : false,               
						    "bLengthChange": false,
						    "paging": false,
 						    dom: "<'row'<'col-sm-6'B><'col-sm-6 text-right'f>>" +
						"<'row'<'col-sm-12'tr>>" +
						"<'row'<'col-sm-5'><'col-sm-7 text-right'p>>",
						language : {
							processing : "Procesando...",
							search : '<i class="fa fa-search fa-lg" aria-hidden="true"></i> ',
							searchPlaceholder : "Buscar...",
							lengthMenu: "Mostrar _MENU_ registros por página",
				            zeroRecords: "No se encontraron registros",
				            info: "Ver página _PAGE_ de _PAGES_ página(s)",
				            infoEmpty: "No hay información disponible",
				            infoFiltered: "(filtro de _MAX_ total de registros)",
				            paginate: {
				                first:      "Inicio",
				                last:       "Atras",
				                next:       "Siguiente",
				                previous:   "Atrás"
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
											className: "btn-sm"
										},
										{
										 	extend: "copy",
											exportOptions: {
												columns: ':visible(:not(.not-export-col))'
											},
											className: "btn-sm",
											text : '<i class="fa fa-clipboard" aria-hidden="true"></i> Copiar'
										},
										{
											extend: "csv",
											exportOptions: {
												columns: ':visible(:not(.not-export-col))'
											},
											className: "btn-sm",
											text : '<i class="fa fa-file-text-o" aria-hidden="true"></i> CSV'
										},
										{
											extend: "excel",
											exportOptions: {
												columns: ':visible(:not(.not-export-col))'
											},
											className: "btn-sm",
											text : '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
										},
										{
											extend: "pdfHtml5",
											exportOptions: {
												columns: ':visible(:not(.not-export-col))'
											},
											className: "btn-sm",
											text : '<i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF'
										},
										{
											extend: "print",
											exportOptions: {
												columns: ':visible(:not(.not-export-col))'
											},
											className: "btn-sm",
											text : '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'
										}]

						
					});
			/* $('.dataTables_filter input').addClass('form-control-search-datatable'); */
		    }
		    else {
		        console.log('in else');
		        tableReporte.fnClearTable();
		        tableReporte.fnAddData(dataReporte);
		        tableReporte.fnAdjustColumnSizing();
		    }
		}
	
	
		function listTabla3(){
			
			$(document).ready(function() {
				
				var vFecini = document.getElementById("txtfecini").value;
				var vFecfin = document.getElementById("txtfecfin").value;
				
				var src = "ServletWSuraTabla";
				$.post(src, {strAccion : 'ListTabla3'  , FECHAINICIO : vFecini, FECHAFIN : vFecfin},
						function(pdata) {
							 /* alert(pdata); */
						  var obj = JSON.parse(pdata);
					
						  var dataReporte = [];
						  var columnsReport = [];
						

							  for(i = 0 ; i < obj.listarTabla3.length ; i++ )
							  	{
								var arr = [];
								arr.push(i+1);
								arr.push('Tabla3');
								arr.push(obj.listarTabla3[i].Prioridad);
								arr.push(obj.listarTabla3[i].Indicador.replace('@',' ').replace('@',' ').replace('@',' ').replace('@',' ').replace('@',' '));
								arr.push(obj.listarTabla3[i].Sla.replace('menor',' < '));
								arr.push(obj.listarTabla3[i].Cumple);
								arr.push(obj.listarTabla3[i].NoCumple);
								arr.push(obj.listarTabla3[i].Total);
								
								/* CALCULAR EL PORCENTAJE */
								var a = obj.listarTabla3[i].Cumple;
								var b = obj.listarTabla3[i].Total;
								var c = (a/b)*100;
								var porcentaje = parseInt(c)+"%" ;
								/* FIN CALCULAR EL PORCENTAJE */
								
								arr.push(porcentaje);
								arr.push(obj.listarTabla3[i].TasaDePenalidad);
								
								dataReporte.push(arr);
								}
							  
							  columnsReport = [ {title : "NRO"},
								{title : "#Tabla"},
								{title : "PRIORIDAD"},
							    {title : "INDICADOR"}, 
					            {title : "SLA"},
					            {title : "CUMPLE"}, 
					            {title : "NO CUMPLE"},
					            {title : "TOTAL"},
					            {title : "PORCENTAJE"},
					            {title : "TASA DE PENALIDAD"},
					            {
									"sName": "verticketbtn",
									"title" : "Tickets", 
									"bSearchable": false,
									"sWidth": "100px",
									"bSortable": false,
									"mRender": function ( data, type, columns ) {
										return '<a title="Ver tickets" class="btn btn-primary btn-sm" onclick="openModalReporte(\'' + columns[1] + '\',\'' + columns[2] +'\')"><i class="fa fa-external-link" aria-hidden="true"></i></a>&nbsp;&nbsp;'; 
											   
									}
								}
					          ];
						  
						    setData3(dataReporte,columnsReport);
						    $('#tbcontainer3 p').remove();
							$('#tbcontainer3').removeClass('overlay');
							
							$('#txtfecini').prop("disabled", false);
							$('#txtfecfin').prop("disabled", false);
							$('#btnConsultar').prop("disabled", false);
							$('#btnTODOS').prop("disabled", false);
				});
				
			});
			}
			var htmlTable3 = '<table id=\"tblReportes3\" class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
			function setData3(pdataReporte,pcolumnsReport)
			{
				document.getElementById('tbcontainer3').innerHTML = 	htmlTable3;
				
				if(typeof tableReporte === 'undefined') 
			    {
			    console.log('in if');
			    
				var tableReporte = $('#tblReportes3').DataTable(
						{
							
							data : pdataReporte,
							columns : pcolumnsReport,
							columnDefs: [
								{ "className": "text-center bold", "targets": [0,1,2,3,4,5,6,7,8,9,10] },
								{"targets": [1,2] ,"visible": false, "searchable": false}
							    ],
							    "lengthChange": false,
							    "searching": false,
							    "bFilter" : false,               
							    "bLengthChange": false,
							    "paging": false,
							    dom: "<'row'<'col-sm-6'B><'col-sm-6 text-right'f>>" +
								"<'row'<'col-sm-12'tr>>" +
								"<'row'<'col-sm-5'><'col-sm-7 text-right'p>>",
								language : {
									processing : "Procesando...",
									search : '<i class="fa fa-search fa-lg" aria-hidden="true"></i> ',
									searchPlaceholder : "Buscar...",
									lengthMenu: "Mostrar _MENU_ registros por página",
						            zeroRecords: "No se encontraron registros",
						            info: "Ver página _PAGE_ de _PAGES_ página(s)",
						            infoEmpty: "No hay información disponible",
						            infoFiltered: "(filtro de _MAX_ total de registros)",
						            paginate: {
						                first:      "Inicio",
						                last:       "Atras",
						                next:       "Siguiente",
						                previous:   "Atrás"
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
													className: "btn-sm"
												},
												{
												 	extend: "copy",
													exportOptions: {
														columns: ':visible(:not(.not-export-col))'
													},
													className: "btn-sm",
													text : '<i class="fa fa-clipboard" aria-hidden="true"></i> Copiar'
												},
												{
													extend: "csv",
													exportOptions: {
														columns: ':visible(:not(.not-export-col))'
													},
													className: "btn-sm",
													text : '<i class="fa fa-file-text-o" aria-hidden="true"></i> CSV'
												},
												{
													extend: "excel",
													exportOptions: {
														columns: ':visible(:not(.not-export-col))'
													},
													className: "btn-sm",
													text : '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
												},
												{
													extend: "pdfHtml5",
													exportOptions: {
														columns: ':visible(:not(.not-export-col))'
													},
													className: "btn-sm",
													text : '<i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF'
												},
												{
													extend: "print",
													exportOptions: {
														columns: ':visible(:not(.not-export-col))'
													},
													className: "btn-sm",
													text : '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'
												}]
							
						});
				/* $('.dataTables_filter input').addClass('form-control-search-datatable'); */
			    }
			    else {
			        console.log('in else');
			        tableReporte.fnClearTable();
			        tableReporte.fnAddData(dataReporte);
			        tableReporte.fnAdjustColumnSizing();
			    }
			}
	
		/* TABLA REPORTE */
		
		
		/* ABREMODAL */
		function openModalReporte(vTABLA,vPRIORIDAD){
			
			$('#tbcontainerListReport div').remove();
			
			$('#tbcontainerListReport').append(' <p class="fa fa-refresh fa-spin" style="font-size:40px;color: black;"></p>');
			$('#tbcontainerListReport').addClass('overlay');
			
			$('#mdListReport').modal('show');
			listReport(vTABLA,vPRIORIDAD);
		}
		/* FIN ABREMODAL */
		
		
	function listReport(vTABLA,vPRIORIDAD){
	
			$(document).ready(function() {
		
		var vFecini = document.getElementById("txtfecini").value;
		var vFecfin = document.getElementById("txtfecfin").value;		
		
		var src = "ServletWSuraTabla";
		$.post(src, {strAccion : 'ListReport',TABLA : vTABLA , PRIORIDAD : vPRIORIDAD ,FECHAINICIO : vFecini, FECHAFIN : vFecfin},
				function(pdata) {
					 
				  var obj = JSON.parse(pdata);
			
				  var dataReporte = [];
				  var columnsReport = [];
				
				
					  for(i = 0 ; i < obj.listReport.length ; i++ )
					  	{
						var arr = [];
						arr.push(i+1);
						arr.push(obj.listReport[i].CodTicket);
						arr.push(obj.listReport[i].Summary);
						arr.push(obj.listReport[i].Creator);
						arr.push(obj.listReport[i].AffectedPerson);
						arr.push(obj.listReport[i].CreationDate);
						arr.push(obj.listReport[i].ComplianceSlaDispatch.replace('null','-'));
						arr.push(obj.listReport[i].ComplianceSlaResolve.replace('null','-'));
						arr.push(obj.listReport[i].OwnerGroup);
						arr.push(obj.listReport[i].InternalPriority);						
						arr.push(obj.listReport[i].OwnerId);
						arr.push(obj.listReport[i].Owner);
						arr.push(obj.listReport[i].Status);
						arr.push(obj.listReport[i].Worklog.replace('null','-'));
						arr.push(obj.listReport[i].TimeToResolve);
						arr.push(obj.listReport[i].Class);
					
						dataReporte.push(arr);
						}
					  
					  columnsReport = [ {title : "NRO"},
						{title : "CodTicket"},
						{title : "Summary"},
					    {title : "Creator"}, 
			            {title : "AffectedPerson"},
			            {title : "CreationDate"}, 
			            {title : "ComplianceSlaDispatch"},
			            {title : "ComplianceSlaResolve"},
			            {title : "OwnerGroup"},
			            {title : "IntertnalPriority"},
			            {title : "OwnerId"},
			            {title : "Owner"},
			            {title : "Status"},
			            {title : "Worklog"},
			            {title : "TimeToResolve"},
			            {title : "Class"},
			           
			          
			          ];
				  
				    setDataListReport(dataReporte,columnsReport);
				    $('#tbcontainerListReport p').remove();
					$('#tbcontainerListReport').removeClass('overlay');
				  
		});
		
	});
	}
	/* var htmlTableListReport = '<table id=\"tblReportesListReport\" class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>'; */
	var htmlTableListReport = '<table id=\"tblReportesListReport\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
	
	function setDataListReport(pdataReporte,pcolumnsReport)
	{
		document.getElementById('tbcontainerListReport').innerHTML = htmlTableListReport;
		
		if(typeof tableReporte === 'undefined') 
	    {
	    
		var tableReporte = $('#tblReportesListReport').DataTable(
				{
					processing : false,
					language : {
						processing : "Procesando...",
						search : '<i class="fa fa-search fa-lg"/>',
						searchPlaceholder : "Buscar..."
					},
					serverSide : false,
					data: pdataReporte,
					columns: pcolumnsReport,
					dom: 'Bfrtip',
					lengthMenu : [
						[5, 10, 15, -1],
						['5 registros',
							'10 registros',
							'15 registros',
							'Mostrar todo']
					],
					buttons : [
						{
							extend : 'pageLength',
							text : '<i class="fa fa-list-ol" aria-hidden="true"></i> Mostrar',
							className: "btn-sm"
						},
						{
							extend: "excel",
							
							className: "btn-sm",
							text : '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
						}
					],
					destroy : true				
				});
		
	    }
	    else {
	        console.log('in else');	   
	        tableReporte.fnClearTable();
	        tableReporte.fnAddData(dataReporte);
	        tableReporte.fnAdjustColumnSizing();
	    }
	}
	
		
		/* FIN TABLA REPORTE */
			
			
	

</script>

<style>

.bold {
  font-weight : bold;
}

.overlay {
  opacity: 0.2;
}
</style>

</html>










