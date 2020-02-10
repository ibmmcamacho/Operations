<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- Customizer -->
<!-- <script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script> -->

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	SMART REQUEST<small> Mis Solicitudes</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-windows"></i> SMART REQUEST</a></li>
	<li class="active"> Mis Solicitudes</li>
</ol>
</section> <!-- Main content --> <section class="content"> <!-- top row -->
	<button id="nuevaSolicitud" title="" type="button" class="btn btn-primary" onclick=""><i class="fa fa-file-text-o"></i> Nuevo</button>
    <button title="" type="button" class="btn btn-primary " onclick=""><i class="fa fa-refresh fa-lg"></i> Actualizar</button>  
    <br><br> 
           
<br />

<div class="row">
	<div class="col-lg-12 connectedSortable">
		<div class="box box-primary" style="max-width:95% ;margin-left:auto;margin-right:auto;">
			<div class="box-header with-border">
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> Mis Solicitudes</h3>
			</div>
			<div class="box-body">
		
				<div id="tbcontainerConsumoDisco" class="table-responsive">
					Aqu� podr�s obtener toda la informaci�n de los tickets registrado como Alertas Ejecutivas.
				</div>
				<br/>
			</div>
		</div>
	</div>
</div>
<!-- /.row --> <!-- Main row -->
<div class="row"></div>
<!-- /.row (main row) --> </section><!-- /.content --> </aside>
<!-- /.right-side -->




<script type="text/javascript">

$(document).ready(function() {
	listReportConsumoDisco();	
});

	$("#nuevaSolicitud").click(function(){
		javascript:recargarDiv('wcontentRight','<%=request.getContextPath()%>/smartRequest/nuevaSolicitud.jsp');
	});
	
	$("#btnVer1").click(function(){
		javascript:recargarDiv('wcontentRight','<%=request.getContextPath()%>/smartRequest/nuevaSolicitudPendiente.jsp');
	});
	
	$("#btnVer2").click(function(){
		javascript:recargarDiv('wcontentRight','<%=request.getContextPath()%>/smartRequest/nuevaSolicitud.jsp');
	});
	
	$("#btnVer3").click(function(){
		javascript:recargarDiv('wcontentRight','<%=request.getContextPath()%>/smartRequest/nuevaSolicitudAprobada.jsp');
	});


	
	function listReportConsumoDisco() {
	

			
					  var dataReporte = [];
					  var columnsReport = [];
						  					  	
							var arr1 = [];
						
							var arr3 = [];
							
							arr1.push("F000001");
							arr1.push("30-05-2018");
							arr1.push("Alta");
							arr1.push("Usuario Nuevo");
							arr1.push("Anthony Canales");
							arr1.push("PENDIENTE VISADOR");
							arr1.push("<div class=\"text-center\"><button id=\"btnVer1\" title=\"Ver solicitud\" type=\"button\" class=\"btn bg-primary\"\"> "+
									"<i class=\"fa fa-eye fa-pull-center\"></i></button><div>");
							dataReporte.push(arr1);
							
							
							
							arr3.push("F000003");
							arr3.push("10-06-2018");
							arr3.push("Baja");
							arr3.push("Baja");
							arr3.push("Anthony Canales");
							arr3.push("APROBADO");
							arr3.push("<div class=\"text-center\"><button id=\"btnVer3\"  title=\"Ver solicitud\" type=\"button\" class=\"btn bg-primary\"\"> "+
									"<i class=\"fa fa-eye fa-pull-center\"></i></button><div>");
							dataReporte.push(arr3);
						
						  columnsReport = [ 
							{title : "ID"},
						    {title : "FECHA REGISTRO"},						    
				            {title : "TIPO SOLICITUD"}, 
				            {title : "ACCION"}, 
				            {title : "USUARIO FINAL"},
				            {title : "ESTADO"},
				            {title : "ACCION"}
				          ];
						  
					setDataConsumoDisco(dataReporte,columnsReport);
					    
	}
	
	
	function setDataConsumoDisco(pdataReporte,pcolumnsReport){
		$(document).ajaxStart(function() { Pace.restart(); });
		var htmlTableConsumoDisco = '<table id=\"tblReportesConsumoDisco\"class=\"display table table-bordered table-responsive table-hover\" width=\"99%\" >'+
									'<thead class=\"bg-primary\"></thead>'+
									'<thead class="filters" >'+
							        '<tr>'+
							           '<th style="border: hidden"></th>'+
							           '<th style="border: hidden"></th>'+
							           '<th style="border: hidden"></th>'+
							           '<th style="border: hidden"></th>'+
							           '<th style="border: hidden"></th>'+
							           '<th style="border: hidden"></th>'+
							           '<th style="border: hidden" hidden></th>'+
							        '</tr>'+
							        '</thead>'+
							        '</table>';
		document.getElementById('tbcontainerConsumoDisco').innerHTML = htmlTableConsumoDisco;
	
		if(typeof tableReporte === 'undefined') 
	    {
	    console.log('in if');
	    
		var tableReporte = $('#tblReportesConsumoDisco').DataTable(
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
	    $('#tblReportesConsumoDisco .filters th').each( function () {
	        var title = $('#tblReportesConsumoDisco thead th').eq( $(this).index() ).text();
	        $(this).html( '<input type="text" placeholder="Buscar '+title+'" style="width:100%"  />' );
	    } );

		table = $('#tblReportesConsumoDisco').DataTable();
		
		// Apply the search
	    table.columns().eq( 0 ).each( function ( colIdx ) {
	        $( 'input', $('.filters th')[colIdx] ).on( 'keyup change', function () {
	            table
	                .column( colIdx )
	                .search( this.value )
	                .draw();
	        } );
	    } );

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

</html>