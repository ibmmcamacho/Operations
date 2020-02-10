<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/custom/css/styleDispatch.css">
</head>
<body>

<aside class="right-side "> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	REPORTE <small>Tablero Productividad</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-th-large"></i> REPORTE</a></li>
	<li class="active">Tablero Productividad</li>
</ol>
</section> <!-- Main content --> <section class="content"> <!-- top row -->
<div class="row">
	
	<div class="form-inline"> <!--  TODO COMBOS -->
		
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-12" >
							
			<fieldset class="scheduler-border" style="padding-top: 0;">
			    <legend class="scheduler-border"><h4 style="margin-top: 0;">Filtros :</h4></legend>
						
						
						<div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-2" style="padding-top: 10px; " align="left">							
							Tribu :
							<select id="cboSelectTribu" disabled  class="form-control" onchange="llenaComboSquad();validarCombos()" multiple="multiple">
								<option > Seleccionar </option>
							</select>
							
						</div>
						
						<div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-2" style="padding-top: 10px; " align="left">							
							Squad :
							<select id="cboSelectSquad" disabled class="form-control" onchange="llenaComboTeam();validarCombos()" multiple="multiple" style="width: 50px">
								<option > Seleccionar Squad</option>
							</select>
							
						</div>
						
						
						
						<div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-2" style="padding-top: 10px;" align="left">
						Team:
							<select id="cboSelectTeam" disabled class="form-control" onchange="llenaComboOwner();validarCombos()"  multiple="multiple">
								<option > Seleccionar Team</option>
							</select>
						
						</div>
						
						
						<!-- <div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-2" style="padding-top: 10px;" align="left">
							Grupo:
							<select id="cboSelectGroupOwner"  disabled class="form-control " onchange="llenaComboOwner();validarCombos()" multiple="multiple" >
								<option > Seleccionar Group Owner</option>
							</select>
														
						</div> -->
						
						<div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-2" style="padding-top: 10px;" align="left">
						Propietario(s):
								<select id="cboSelectOwner"  disabled onchange="validarCombos()" class="form-control " multiple="multiple">
									<option > Seleccionar Owner</option>
								</select>
							
						</div>
						
						<div class="form-group col-xs-4 col-sm-4 col-md-4 col-lg-2" style="padding-top: 10px;" align="left">
						
						Site:
								<select id="cboSite"  disabled onchange="validarCombos()" class="form-control " multiple="multiple">
									<option value="0"> Todos</option>
									<option value="Campus">Campus</option>
									<option value="Interbank">Interbank</option>
									<option value="Petroperu">PetroPerú</option>
								</select>
							
						
						
						</div> 	
				</fieldset>
			</div>
			
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" >
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
					<fieldset class="scheduler-border" style="padding-top: 0;">
					    <legend class="scheduler-border"><h4 style="margin-top: 0;">Filtro(s) para Tickets :</h4></legend>
							<div class="form-group col-sm-6 col-sm-6 col-md-6 col-lg-6" style="padding-top: 10px;" align="left">
							Class(Ticket):
									<select id="cboClassTicket" onchange="validarCombos()" disabled class="form-control " multiple="multiple">
										<option > Seleccionar Tipo de Ticket</option>
									</select>
							</div> 	
							
							<div class="form-group col-sm-6 col-sm-6 col-md-6 col-lg-6" style="padding-top: 10px;" align="left">
							Status:
									<select id="cboSelectStatus" onchange="validarCombos()" disabled class="form-control " multiple="multiple">
										<option > Seleccionar Status</option>
									</select>
							</div> 	
					</fieldset>
				</div>
			</div>
				
			<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" >
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
					<fieldset class="scheduler-border" style="padding-top: 0;">
					    <legend class="scheduler-border"><h4 style="margin-top: 0;">Filtrar por Fechas :</h4></legend>
							<a style="color: red" class="hidden" id="alertfechas">*La Fecha Inicio debe ser menor a la Fecha Fin</a>
							<div class="form-group col-sm-6 col-sm-6 col-md-6 col-lg-5" style="padding-top: 10px;" align="left">
							Fecha Inicio : 
									<input id="txtFecini" type="date" disabled onchange="validarCombos()" class="form-control ">
							</div> 	
							
							<div class="form-group col-sm-6 col-sm-6 col-md-6 col-lg-5" style="padding-top: 10px;" align="left">
							Fecha Fin :
									<input id="txtFecfin" type="date" disabled onchange="validarCombos()" class="form-control ">
									
							</div> 	
							
							
							<div class="form-group col-sm-6 col-sm-6 col-md-6 col-lg-2" style="padding-top: 10px;" align="left">
									<button id="btnShow" disabled class="btn btn-primary" onclick="listReport2()"> <a class="fa fa-search" style="color: white"></a>  Consultar</button>
							</div>
					</fieldset>
				</div>
				
			</div>		
					
	</div><!--  TODO COMBOS -->
	
</div>

<br />

<div class="row" style="height: 1000px;padding-left: 25px;padding-right: 25px"><!-- PADRE TABLAS -->

			<div class="row">
				<div class="col-lg-12 connectedSortable">
					<div class="box box-primary" style="border-radius: 20px">
						<div class="box-header with-border">
							<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> 
							
				<label data-toggle="tooltip" data-placement="top" title="Filtros: Squad > Team > Class Ticket > Site  y (Fecha Inicio - Fecha Fin)">
        				<h4>  Tabla 1</h4>
       			</label>
       						</h3>
										
						</div>
						<div class="box-body">
							<label id="lblMessage" class="label label-info"></label>
								<div id="tbcontainer1"  class="table-responsive">
								<i>Aquí podrás obtener toda la información que necesitas sobre los Filtros Seleccionados.</i>
								</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12 connectedSortable">
					<div class="box box-primary" style="border-radius: 20px">
						<div class="box-header with-border">
							<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> 

				<label data-toggle="tooltip" data-placement="top" title="Filtros: Squad > Team > Class Ticket > Site  y (Fecha Inicio - Fecha Fin)">
      				<h4>  Tabla 2</h4>
       			</label>
						
							</h3>
						
						</div>
						<div class="box-body">
							<label id="lblMessage" class="label label-info"></label>
								<div id="tbcontainer2" class="table-responsive">
								<i>Aquí podrás obtener toda la información que necesitas sobre los Filtros Seleccionados.</i>
								</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-12 connectedSortable">
					<div class="box box-primary" style="border-radius: 20px">
						<div class="box-header with-border">
							<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i>  

							<label data-toggle="tooltip" data-placement="top" title="Filtros: Squad > Team > Class Ticket > Site  y (Fecha Inicio - Fecha Fin)">
			        				<h4>  Tabla 3</h4>
			       			</label>
	
							</h3>
						</div>
						<div class="box-body">
							<label id="lblMessage" class="label label-info"></label>
								<div id="tbcontainer3" class="table-responsive">
								<i>Aquí podrás obtener toda la información que necesitas sobre los Filtros Seleccionados.</i>
								</div>
						</div>
					</div>
				</div>
				
			</div>
</div> <!-- FIN PADRE TABLAS -->

</body>

<script>

function validarCombos() {
	
	var vTribu = $('#cboSelectTribu').val().toString();
	var vSquad = $('#cboSelectSquad').val().toString();
	var vTeam = $('#cboSelectTeam').val().toString();
	/* var vGroupOwner= $('#cboSelectGroupOwner').val().toString(); */
	var vOwner = $('#cboSelectOwner').val().toString();
	var vClassTicket= $('#cboClassTicket').val().toString();
	var vStatus= $('#cboSelectStatus').val().toString();
	var vFecini= $('#txtFecini').val().toString();
	var vFecfin= $('#txtFecfin').val().toString();
	
	if (vTribu != '' && vSquad != '' && vTeam != '' /* && vGroupOwner != ''  */&& vOwner != '' 
		&& vClassTicket != '' && vStatus != '' && vFecini != '' && vFecfin != '' ){
		
		if(vFecini < vFecfin){		
			
			$('#btnShow').prop("disabled",false);
			$('#alertfechas').addClass('hidden');
			
		}else { 
			
			$('#btnShow').prop("disabled",true);
			$('#alertfechas').removeClass('hidden');
			
		}
		
	}else {
		$('#btnShow').prop("disabled",true);		
	}
	
	
}

llenaComboTribu();
 
$('#cboSite').select2();

$('#cboSite').change(function(){			
	var vcboSite = $('#cboSite').val().toString();			
			
	if(vcboSite.startsWith('0')){				
		$('#cboSite').val(0).trigger('change.select2');			  			  	
  	}else{		  		
	}
});


$('#cboSelectTribu').select2();
$('#cboSelectTribu').change(function(){			
	var vcboTribu = $('#cboSelectTribu').val().toString();			
			
	if(vcboTribu.startsWith('0')){				
		$('#cboSelectTribu').val(0).trigger('change.select2');			  			  	
  	}else{		  		
	}
});


function llenaComboTribu()	{	
	$(document).ready(function() {
		
		var src = "ServletTablero";
		$.post(src, {strAccion : 'CboTribu'},
				function(pdata) {
				  var obj = JSON.parse(pdata);						
				  $('#cboSelectTribu option').remove();			
					if(obj.cboTribu.length > 0){
						$('#cboSelectTribu').append($('<option>', {value: '0',text : 'Todos'}));
		    				$.each(obj.cboTribu, function (i, item) {
		    				    $('#cboSelectTribu').append($('<option>', { 
		    				        value: item.Tribu,
		    				        text : item.Tribu			    				    
		    				    }));
		    				});			    				
	  				}else{
	  					$('#cboSelectTribu').append($('<option>', { 
	    				    value: '0',
	    				    text : 'Seleccionar'
	    				}));
	  				}$('#cboSelectTribu').prop("disabled",false);
	  				
	  				setTimeout(function(){llenaComboClassTicket();}, 1000);
	  				
				});
	})
}




$('#cboSelectSquad').select2();

$('#cboSelectSquad').change(function(){			
	var vcboSquad = $('#cboSelectSquad').val().toString();			
			
	if(vcboSquad.startsWith('0')){				
		$('#cboSelectSquad').val(0).trigger('change.select2');			  			  	
  	}else{		  		
	}
});


function llenaComboSquad()	{	
	
	$('#cboSelectSquad').prop("disabled",true);
	
	$('#cboSelectTeam').prop("disabled",true);
	
	$('#cboSelectOwner').prop("disabled",true);
	$('#cboSite').prop("disabled",true);
	
	
	$(document).ready(function() {	
		
		var src = "ServletTablero";
		$.post(src, {strAccion : 'CboSquad' ,TRIBU : $('#cboSelectTribu').val().toString()},
				function(pdata) {
				  var obj = JSON.parse(pdata);						
				  $('#cboSelectSquad option').remove();			
					if(obj.cboSquad.length > 0){
						$('#cboSelectSquad').append($('<option>', {value: '0',text : 'Todos'}));
		    				$.each(obj.cboSquad, function (i, item) {
		    				    $('#cboSelectSquad').append($('<option>', { 
		    				        value: item.Squad,
		    				        text : item.Squad			    				    
		    				    }));
		    				});			    				
	  				}else{
	  					$('#cboSelectSquad').append($('<option>', { 
	    				    value: '0',
	    				    text : 'Seleccionar'
	    				}));
	  				}$('#cboSelectSquad').prop("disabled",false);
				});
			
	})
}


$('#cboSelectTeam').select2();

$('#cboSelectTeam').change(function(){			
	var vcboTeam = $('#cboSelectTeam').val().toString();			
			
	if(vcboTeam.startsWith('0')){				
		$('#cboSelectTeam').val(0).trigger('change.select2');			  			  	
  	}else{		  		
	}
});


function llenaComboTeam()	{	
	
	$('#cboSelectTeam').prop("disabled",true);		
	
	$('#cboSelectOwner').prop("disabled",true);
	$('#cboSite').prop("disabled",true);
	
	$(document).ready(function() {
		var src = "ServletTablero";
		$.post(src, {strAccion : 'CboTeam',SQUAD :  $('#cboSelectSquad').val().toString()},
				function(pdata) {
				  var obj = JSON.parse(pdata);						
				  $('#cboSelectTeam option').remove();			
					if(obj.cboTeam.length > 0){
						$('#cboSelectTeam').append($('<option>', {value: '0',text : 'Todos'}));
		    				$.each(obj.cboTeam, function (i, item) {
		    				    $('#cboSelectTeam').append($('<option>', { 
		    				        value: item.Team,
		    				        text : item.Team			    				    
		    				    }));
		    				});			    				
	  				}else{
	  					$('#cboSelectTeam').append($('<option>', { 
	    				    value: '0',
	    				    text : 'Seleccionar'
	    				}));
	  				}$('#cboSelectTeam').prop("disabled",false);
				});
	})
}


/* $('#cboSelectGroupOwner').select2();

$('#cboSelectGroupOwner').change(function(){			
	var vcboGroupOwner = $('#cboSelectGroupOwner').val().toString();			
			
	if(vcboGroupOwner.startsWith('0')){				
		$('#cboSelectGroupOwner').val(0).trigger('change.select2');			  			  	
  	}else{		  		
	}
});

function llenaComboGroupOwner()	{	
	
	$('#cboSelectGroupOwner').prop("disabled",true);
	
	
	$('#cboSelectOwner').prop("disabled",true);
	$('#cboSite').prop("disabled",true);
	
	$(document).ready(function() {
		var src = "ServletTablero";
		$.post(src, {strAccion : 'CboGroupOwner',TEAM :  $('#cboSelectTeam').val().toString()},
				function(pdata) {
				  var obj = JSON.parse(pdata);						
				  $('#cboSelectGroupOwner option').remove();			
					if(obj.cboGroupOwner.length > 0){
						$('#cboSelectGroupOwner').append($('<option>', {value: '0',text : 'Todos'}));
		    				$.each(obj.cboGroupOwner, function (i, item) {
		    				    $('#cboSelectGroupOwner').append($('<option>', { 
		    				        value: item.IdGroupOwner,
		    				        text : item.GroupOwner			    				    
		    				    }));
		    				});			    				
	  				}else{
	  					$('#cboSelectGroupOwner').append($('<option>', { 
	    				    value: '0',
	    				    text : 'Seleccionar'
	    				}));
	  				}$('#cboSelectGroupOwner').prop("disabled",false);
				});
	})
} */

$('#cboSelectOwner').select2();

$('#cboSelectOwner').change(function(){			
	var vcboOwner = $('#cboSelectOwner').val().toString();			
			
	if(vcboOwner.startsWith('0')){				
		$('#cboSelectOwner').val(0).trigger('change.select2');			  			  	
  	}else{		  		
	}
});

function llenaComboOwner()	{	
	
	
	$('#cboSelectOwner').prop("disabled",true);
	$('#cboSite').prop("disabled",true);
	$('#txtFecini').prop("disabled",true);
	$('#txtFecfin').prop("disabled",true);
	
	$(document).ready(function() {
		var src = "ServletTablero";
		$.post(src, {strAccion : 'CboOwner',TEAM :  $('#cboSelectTeam').val().toString()},
				function(pdata) {
				  var obj = JSON.parse(pdata);						
				  $('#cboSelectOwner option').remove();			
					if(obj.cboOwner.length > 0){
						$('#cboSelectOwner').append($('<option>', {value: '0',text : 'Todos'}));
		    				$.each(obj.cboOwner, function (i, item) {
		    				    $('#cboSelectOwner').append($('<option>', { 
		    				        value: item.IdOwner,
		    				        text : item.Owner			    				    
		    				    }));
		    				});			    				
	  				}else{
	  					$('#cboSelectOwner').append($('<option>', { 
	    				    value: '0',
	    				    text : 'Seleccionar'
	    				}));
	  				}
					$('#cboSelectOwner').prop("disabled",false);
	  				$('#cboSite').prop("disabled",false);
	  				$('#txtFecini').prop("disabled",false);
	  				$('#txtFecfin').prop("disabled",false);
	  				
	  				
				});
	})
}


$('#cboClassTicket').select2();

$('#cboClassTicket').change(function(){			
	var vcboClassTicket = $('#cboClassTicket').val().toString();			
			
	if(vcboClassTicket.startsWith('0')){				
		$('#cboClassTicket').val(0).trigger('change.select2');			  			  	
  	}else{		  		
	}
});

function llenaComboClassTicket()	{	
	
	$(document).ready(function() {
		var src = "ServletTablero";
		$.post(src, {strAccion : 'CboClassTicket'},
				function(pdata) {
				  var obj = JSON.parse(pdata);						
				  $('#cboClassTicket option').remove();			
					if(obj.cboClassTicket.length > 0){
						$('#cboClassTicket').append($('<option>', {value: '0',text : 'Todos'}));
		    				$.each(obj.cboClassTicket, function (i, item) {
		    				    $('#cboClassTicket').append($('<option>', { 
		    				        value: item.TipoTicket,
		    				        text : item.TipoTicket			    				    
		    				    }));
		    				});			    				
	  				}else{
	  					$('#cboClassTicket').append($('<option>', { 
	    				    value: '0',
	    				    text : 'Seleccionar'
	    				}));
	  				}$('#cboClassTicket').prop("disabled",false);
	  				setTimeout(function(){llenaComboStatus();}, 1000);
	  				
				});
	})
}



$('#cboSelectStatus').select2();

$('#cboSelectStatus').change(function(){			
	var vcboStatus = $('#cboSelectStatus').val().toString();			
			
	if(vcboStatus.startsWith('0')){				
		$('#cboSelectStatus').val(0).trigger('change.select2');			  			  	
  	}else{		  		
	}
});

function llenaComboStatus()	{	
	
	$(document).ready(function() {
		var src = "ServletTablero";
		$.post(src, {strAccion : 'CboSelectStatus'},
				function(pdata) {
				  var obj = JSON.parse(pdata);						
				  $('#cboSelectStatus option').remove();			
					if(obj.cboSelectStatus.length > 0){
						$('#cboSelectStatus').append($('<option>', {value: '0',text : 'Todos'}));
		    				$.each(obj.cboSelectStatus, function (i, item) {
		    				    $('#cboSelectStatus').append($('<option>', { 
		    				        value: item.Status,
		    				        text : item.Status			    				    
		    				    }));
		    				});			    				
	  				}else{
	  					$('#cboSelectStatus').append($('<option>', { 
	    				    value: '0',
	    				    text : 'Seleccionar'
	    				}));
	  				}$('#cboSelectStatus').prop("disabled",false);
				});
	})
}



function listReport1(){
	
	$(document).ready(function() {
			
		var vSquad = $('#cboSelectSquad').val().toString();
		var vOwner= $('#cboSelectOwner').val().toString();
		
		var vFechaini = $('#txtFecini').val().toString();
		var vFechafin = $('#txtFecfin').val().toString();
		var vTeam = $('#cboSelectTeam').val().toString();
		var vClass = $('#cboClassTicket').val().toString();
		
		var vSite = $('#cboSite').val().toString();
		
		var src = "ServletTablero";
		
		$.post(src, {strAccion : 'ListReportT1',TEAM : vTeam,SITE : vSite,FECHAINICIO : vFechaini,FECHAFIN :vFechafin,SQUAD : vSquad,IDOWNER : vOwner ,CLASS : vClass},
				function(pdata) {
					 
		  var obj = JSON.parse(pdata);
	
		  var dataReporte = [];
		  var columnsReport = [];
		
	  if(obj.listReportT1[0].Squad != 'No hay registros' && obj.listReportT1[0].Squad != null){
			  for(i = 0 ; i < obj.listReportT1.length ; i++ )
			  	{
				var arr = [];
				arr.push(i+1);//1
				arr.push(obj.listReportT1[i].Squad.replace('null','Sin Squad'));//2
				arr.push(obj.listReportT1[i].idOwner.replace('null','Sin Propietario'));//3
				arr.push(obj.listReportT1[i].Team.replace('null','Sin Team'));//4
				arr.push(obj.listReportT1[i].Backlog);//5
				arr.push(obj.listReportT1[i].Queued);//6
				arr.push(obj.listReportT1[i].RcaComp);//7
				arr.push(obj.listReportT1[i].InProgress);//8
				arr.push(obj.listReportT1[i].Pending);//9
				arr.push(obj.listReportT1[i].SlaHold);//10
				arr.push(obj.listReportT1[i].Resolved);//11
			
				dataReporte.push(arr);
				}
			  
			  columnsReport = [ {title : "NRO"},//1
				{title : "Squad"},//2
				{title : "Owner"},//3
				{title : "Team"},//4
				{title : "Backlog"},//5
				{title : "Queued"},//6
				{title : "RcaComp"},//7				
				{title : "InProgress"},//8
				{title : "Pending"},//9				
				{title : "SlaHold"},//10
				{title : "Resolved"}//11
				
	          ];		  
		    setDataListReport(dataReporte);
		    $('#tbcontainer1 p').remove();
			$('#tbcontainer1').removeClass('overlay');
			$('#btnShow').prop("disabled",false);
			
		  }else{
			  
			    $('#tbcontainer1 p').remove();
				$('#tbcontainer1').removeClass('overlay');
				document.getElementById('tbcontainer1').innerHTML = '<h3 align="center">No hay Registros con los Filtros Seleccionados</h3>';
				$('#btnShow').prop("disabled",false);
			  
		  }
		  
		});

	});
}

var htmlTableListReport1 = '<table id=\"tblReportes1\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\">'
	
						+'<tr>'
								+'<th rowspan="2">Nro</th>'
								+'<th rowspan="2">SQUAD</th>'
								+'<th rowspan="2">OWNER</th>'
								+'<th rowspan="2">TEAM</th>'
								+'<th rowspan="2">BACKLOG</th>'
								
								+'<th colspan="2" style="background-color : skyblue;color : black">TO DO</th>'
								
								+'<th colspan="2" style="background-color : yellow;color : black">DOING</th>'
								
								+'<th rowspan="2">SLAHOLD</th>'
								+'<th rowspan="2">DONE</th>'
						+'</tr>'
						
						+'<tr>'
								/* +'<th>Squad</th>'
								+'<th>Owner</th>'
								+'<th>Team</th>'
								+'<th>Backlog</th>' */
								
								+'<th>Queued</th>'
								+'<th>RcaComp</th>'
								
								+'<th>InProgress</th>'								
								+'<th>Pending</th>'
								
								/* +'<th>SlaHold</th>'
								+'<th>Resolved</th>' */
						+'</tr>'
								
								+'</thead>'
								
								+'<thead class=\"filters\" >'
								+ "<tr class='filtros'>"
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
									
								+'</tr>'

							+'</thead>'
								
								
							+'</table>';

function setDataListReport(pdataReporte){
		document.getElementById('tbcontainer1').innerHTML = htmlTableListReport1;
		
		if(typeof tableReporte === 'undefined') 
		{
		
		var tableReporte = $('#tblReportes1').DataTable(
				{
			processing : false,
			language : {
				processing : "Procesando...",
				search : '<i class="fa fa-search fa-lg"/>',
				searchPlaceholder : "Buscar..."
			},
			serverSide : false,
			data: pdataReporte,
			/* columns: pcolumnsReport, */			
			dom: 'Bfrtip',
			lengthMenu : [
				[-1, 5, 10,15],
				['Mostrar Todo',
					'5 registros',
					'10 registros',
					'15 registros']
			],
			columnDefs: [
				{ "className": "text-center", "targets": [0,1,2,3,4,5,6,7,8,9,10] },
				
			    ],
		    fnRowCallback: function(nRow, data, iDisplayIndex, iDisplayIndexFull) {
				if ( data[1] == "GRAND TOTAL" )
	            {
	                $('td:eq(1)', nRow).html( '<b colspan = "3">Grand Total</b>' );
	                $('td', nRow).css('background-color', '#4CAF50');
	                $('td', nRow).css('color', 'white');
	            }
              },
			buttons : [
				{
					extend : 'pageLength',
					text : '<i class="fa fa-list-ol" aria-hidden="true"></i> Mostrar',
					className: "btn-sm"
				},
				{
					extend: "excel",
					
					className: "btn-sm",
					
					text : '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel',
					filename: "ReporteTabla1",
					sheetName: "REPORTE",
					title: "Reporte Generado por IBM del Perú",
					header: true,
					customize: function( xlsx ) {
		                var sheet = xlsx.xl.worksheets['sheet1.xml'];
		                console.log("Generando Excel");
		                $('row c', sheet).each( function () {
		                	// Get the row value
		                	console.log($(this));
		                	var attr = $(this).context.parentElement.attributes.r.value;
		                	//Row number
		                	var ind = parseInt(attr);
		                	//Customize the cell style
		                	if (ind % 2 == 0) {
		                		$(this).attr( 's', '45' );
							}else{
								$(this).attr( 's', '25' );
							}
		                	//Rotate 90 degrees
		                	if (ind == 2) {
		                		console.log("Special validation");
		                		//Value of the cell
		                		var val = parseInt($(this).context.textContent);		   

		                		//Validates if the cell value is integer
 								if (isNaN(val)) {
 									console.log(' Is not a number');
 									var cell = $(this).context.attributes.r.value; //A2
 									var col = cell.replace(/[0-9]/g, '');
			                		$('row:first c[r^="'+col+'"]', sheet).attr('s', '42');
 								}else{
 									console.log(' Is a number');
 									var cell = $(this).context.attributes.r.value; //A2
			                		var col = cell.replace(/[0-9]/g, '');
			                		var nCell = col + '1';
			                		console.log("Affected field: "+nCell);
			                		$('row:first c[r^="'+col+'"]', sheet).attr('s', '45');
 								}
							}
		                });
		            }
				}
			],
			destroy : true				
		});

					// Setup - add a text input to each footer cell
					    $('#tblReportes1 .filters th').each( function () {
					        var title = $('#tblReportes1 thead th').eq( $(this).index() ).text();
					        $(this).html( '<input type="text" placeholder="Buscar " style="width:100%"  />' );
					    } );
				
					table1 = $('#tblReportes1').DataTable();
					
					// Apply the search
				    table1.columns().eq( 0 ).each( function ( colIdx ) {
				        $( 'input', $('#tblReportes1 .filters th')[colIdx] ).on( 'keyup change', function () {
				            table1
				                .column( colIdx )
				                .search( this.value )
				                .draw();
				        } );
				    } );


				
		
		}
		else {
		    console.log('in else');	   
		    tableReporte.fnClearTable();
		    tableReporte.fnAddData(dataReporte);
		    tableReporte.fnAdjustColumnSizing();
		}
	}


function listReport2(){
	
	setTimeout(function(){$('#btnShow').prop("disabled",true);}, 500);
	
	
	$('#tbcontainer1 i').remove();
	$('#tbcontainer1 h3').remove();
	$('#tbcontainer1 div').remove();
	
	$('#tbcontainer1').append(' <p class="fa fa-refresh fa-spin" style="font-size:40px;color: black;"></p>');
	$('#tbcontainer1').addClass('overlay');
	
	$('#tbcontainer2 i').remove();
	$('#tbcontainer2 h3').remove();
	$('#tbcontainer2 div').remove();
	
	$('#tbcontainer2').append(' <p class="fa fa-refresh fa-spin" style="font-size:40px;color: black;"></p>');
	$('#tbcontainer2').addClass('overlay');
	
	$('#tbcontainer3 i').remove();
	$('#tbcontainer3 h3').remove();
	$('#tbcontainer3 div').remove();
	
	$('#tbcontainer3').append(' <p class="fa fa-refresh fa-spin" style="font-size:40px;color: black;"></p>');
	$('#tbcontainer3').addClass('overlay');
	
	$(document).ready(function() {

		var vTribu= $('#cboSelectTribu').val().toString();
		var vSquad = $('#cboSelectSquad').val().toString();
		var vTeam = $('#cboSelectTeam').val().toString();
		var vClass = $('#cboClassTicket').val().toString();
		
		var vFechaini = $('#txtFecini').val().toString();
		var vFechafin = $('#txtFecfin').val().toString();
		
		var vSite = $('#cboSite').val().toString();
		
		/* alert(vFechaini); */ 
		
	var src = "ServletTablero";
		
		$.post(src, {strAccion : 'ListReportT2',SITE : vSite,FECHAINICIO : vFechaini ,FECHAFIN: vFechafin,TRIBU : vTribu,SQUAD : vSquad,TEAM : vTeam , CLASS : vClass},
				
				function(pdata) {
					 
		  var obj = JSON.parse(pdata);
	
		  var dataReporte = [];
		  var columnsReport = [];
		
		  if(obj.listReportT2[0].idOwner != 'No hay registros' && obj.listReportT2[0].idOwner != null){
			  
		  
			  for(i = 0 ; i < obj.listReportT2.length ; i++ )
			  	{
				var arr = [];
				arr.push(i+1);//1
				arr.push(obj.listReportT2[i].idOwner.replace('NULL','Sin Propietario').replace('null','Sin Propietario'));//2
				arr.push(obj.listReportT2[i].Owner.replace('NULL','-').replace('null','-'));//3
				arr.push(obj.listReportT2[i].Team);//4
				arr.push(obj.listReportT2[i].Queued);//5
				arr.push(obj.listReportT2[i].Planned);//6
				arr.push(obj.listReportT2[i].InProgress);//7
				arr.push(obj.listReportT2[i].Pending);//8
				arr.push(obj.listReportT2[i].SlaHold);//9
				arr.push(obj.listReportT2[i].Done);//10
				arr.push(obj.listReportT2[i].Resolved);//11
				arr.push(obj.listReportT2[i].Total);//12
				
			
			
				dataReporte.push(arr);
				}
			  
			  columnsReport = [ {title : "NRO"},//1
				{title : "OwnerID"},//2
				{title : "Owner"},//3	
				{title : "Team"},//4	
				{title : "Queued"},//5
				{title : "Planned"},//6
				{title : "In Progress"},//7
				{title : "Pending"},//8
				{title : "SLA hold"},//9
				{title : "Closed"},//10
				{title : "Resolved"},//11
				{title : "TOTAL"}//12
				
	          ];		  
		    setDataListReport2(dataReporte);
		    $('#tbcontainer2 p').remove();
			$('#tbcontainer2').removeClass('overlay');
			listReport3();
		    
		  }else{
			  
			    $('#tbcontainer2 p').remove();
				$('#tbcontainer2').removeClass('overlay');
				document.getElementById('tbcontainer2').innerHTML = '<h3 align="center">No hay Registros con los Filtros Seleccionados</h3>';
				listReport3();
			  
		  }
		  
		});

	});
}

var htmlTableListReport2 = '<table id=\"tblReportes2\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\">'

						+'<tr>'
							+'<th >Nro</th>'
							+'<th >Id Owner</th>'
							+'<th >Owner</th>'
							+'<th >Team</th>'
							+'<th >Queued</th>'
							
							+'<th >Planned</th>'
							
							+'<th >In Progress</th>'
							+'<th >Pending</th>'
							
							+'<th >SlaHold</th>'
							+'<th >Closed</th>'
							+'<th >Resolved</th>'
							+'<th >Total</th>'
						+'</tr>'

						+'</thead>'
						
					+'<thead class=\"filters\" >'
						+ "<tr class='filtros'>"
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
							
						+'</tr>'

					+'</thead>'
					
					
						+'</table>';

function setDataListReport2(pdataReporte) {
	
		document.getElementById('tbcontainer2').innerHTML = htmlTableListReport2;
		
		if(typeof tableReporte === 'undefined') 
		{
		
		var tableReporte = $('#tblReportes2').DataTable(
				{
			processing : false,
			language : {
				processing : "Procesando...",
				search : '<i class="fa fa-search fa-lg"/>',
				searchPlaceholder : "Buscar..."
			},
			serverSide : false,
			data: pdataReporte,			
			dom: 'Bfrtip',
			lengthMenu : [
				[-1, 5, 10,15],
				['Mostrar Todo',
					'5 registros',
					'10 registros',
					'15 registros']
			],
			fnRowCallback: function(nRow, data, iDisplayIndex, iDisplayIndexFull) {
				if ( data[1] == "GRAND TOTAL" ){
	                $('td:eq(1)', nRow).html( '<b colspan = "3">Grand Total</b>' );
	                $('td', nRow).css('background-color', '#4CAF50');
	                $('td', nRow).css('color', 'white');
	            }
              },
			columnDefs: [
				{ "className": "text-center", "targets": [0,1,2,3,4,5,6,7,8,9,10,11] },
				{ "prop" : "colspan", "targets": [1] },
				
				
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
					text : '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel',
					filename: "ReporteTabla2",
					sheetName: "REPORTE",
					title: "Reporte Generado por IBM del Perú",
					header: true,
					customize: function( xlsx ) {
		                var sheet = xlsx.xl.worksheets['sheet1.xml'];
		                console.log("Generando Excel");
		                $('row c', sheet).each( function () {
		                	// Get the row value
		                	console.log($(this));
		                	var attr = $(this).context.parentElement.attributes.r.value;
		                	//Row number
		                	var ind = parseInt(attr);
		                	//Customize the cell style
		                	if (ind % 2 == 0) {
		                		$(this).attr( 's', '45' );
							}else{
								$(this).attr( 's', '25' );
							}
		                	//Rotate 90 degrees
		                	if (ind == 2) {
		                		console.log("Special validation");
		                		//Value of the cell
		                		var val = parseInt($(this).context.textContent);		   

		                		//Validates if the cell value is integer
 								if (isNaN(val)) {
 									console.log(' Is not a number');
 									var cell = $(this).context.attributes.r.value; //A2
 									var col = cell.replace(/[0-9]/g, '');
			                		$('row:first c[r^="'+col+'"]', sheet).attr('s', '42');
 								}else{
 									console.log(' Is a number');
 									var cell = $(this).context.attributes.r.value; //A2
			                		var col = cell.replace(/[0-9]/g, '');
			                		var nCell = col + '1';
			                		console.log("Affected field: "+nCell);
			                		$('row:first c[r^="'+col+'"]', sheet).attr('s', '45');
 								}
							}
		                });
		            }
				}
			],
			destroy : true				
		});

		
				// Setup - add a text input to each footer cell
				    $('#tblReportes2 .filters th').each( function () {
				        var title = $('#tblReportes2 thead th').eq( $(this).index() ).text();
				        $(this).html( '<input type="text" placeholder="Buscar '+title+'" style="width:100%"  />' );
				    } );
			
				table2 = $('#tblReportes2').DataTable();
				
				// Apply the search
			    table2.columns().eq( 0 ).each( function ( colIdx ) {
			        $( 'input', $('#tblReportes2 .filters th')[colIdx] ).on( 'keyup change', function () {
			            table2
			                .column( colIdx )
			                .search( this.value )
			                .draw();
			        } );
			    } );
		
		}
		else {
		    console.log('in else');	   
		    tableReporte.fnClearTable();
		    tableReporte.fnAddData(dataReporte);
		    tableReporte.fnAdjustColumnSizing();
		}
	}


function listReport3(){
	
	$(document).ready(function() {

		var vOwner= $('#cboSelectOwner').val().toString();
		var vClass = $('#cboClassTicket').val().toString();
		var vStatus = $('#cboSelectStatus').val().toString();
		
		var vFechaini = $('#txtFecini').val().toString();
		var vFechafin = $('#txtFecfin').val().toString();
		
		var vSite = $('#cboSite').val().toString();
		
		var src = "ServletTablero";
		
		$.post(src, {strAccion : 'ListReportT3',SITE : vSite,FECHAINICIO : vFechaini,FECHAFIN :vFechafin, CLASS : vClass, OWNER : vOwner,STATUS : vStatus},
				function(pdata) {
					 
		  var obj = JSON.parse(pdata);
	
		  var dataReporte = [];
		  var columnsReport = [];
		
		  if(obj.listReportT3[0].Team != 'No hay registros' && obj.listReportT3[0].Team != null){
		  
			  for(i = 0 ; i < obj.listReportT3.length ; i++ )
			  	{
				var arr = [];
				arr.push(i+1);//1
				arr.push(obj.listReportT3[i].Team.replace('null','Sin Team'));//2
				arr.push(obj.listReportT3[i].SquadIntergroup);//3
				arr.push(obj.listReportT3[i].SquadMultiIndustria1);//4
				arr.push(obj.listReportT3[i].SquadMultiIndustria2);//5
				arr.push(obj.listReportT3[i].SquadCommercial);//6
				arr.push(obj.listReportT3[i].IBM);//7
				arr.push(obj.listReportT3[i].Total);//8
			
			
				dataReporte.push(arr);
				}
			  
			  columnsReport = [ {title : "NRO"},//1
				{title : "Team"},//2
				{title : "Squad Intergroup"},//3				
				{title : "Squad MultiIndustria 1"},//4
				{title : "Squad MultiIndustria 2"},//5
				{title : "Squad Commercial"},//6
				{title : "IBM"},//7
				{title : "Grand TOTAL"}//8
				
				
	          ];		  
		    setDataListReport3(dataReporte);
		    
		    $('#tbcontainer3 p').remove();
			$('#tbcontainer3').removeClass('overlay');
			listReport1();
		    
		  }else{
			  
			    $('#tbcontainer3 p').remove();
				$('#tbcontainer3').removeClass('overlay');
				document.getElementById('tbcontainer3').innerHTML = '<h3 align="center">No hay Registros con los Filtros Seleccionados</h3>';
				listReport1();
			  
		  }
		});

	});
}

var htmlTableListReport3 = '<table id=\"tblReportes3\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\">'

								+'<tr>'
									+'<th >Nro</th>'
									+'<th >Team</th>'
									+'<th >Squad InterGroup</th>'
									+'<th >Squad MultiIndustria 1</th>'
									+'<th >Squad MultiIndustria 2</th>'
									+'<th >Squad Commercial</th>'									
									+'<th >IBM</th>'									
									+'<th >Grand Total</th>'
									
								+'</tr>'
								
							+'</thead>'
								
							+'<thead class=\"filters\" >'
								+ "<tr class='filtros'>"
										+ '<th style=\"border: hidden\"></th>'
										+ '<th style=\"border: hidden\"></th>'
										+ '<th style=\"border: hidden\"></th>'
										+ '<th style=\"border: hidden\"></th>'
										+ '<th style=\"border: hidden\"></th>'
										+ '<th style=\"border: hidden\"></th>'
										+ '<th style=\"border: hidden\"></th>'
										+ '<th style=\"border: hidden\"></th>'
								+'</tr>'
							+'</thead>'								
						+'</table>';

function setDataListReport3(pdataReporte)
		{
		document.getElementById('tbcontainer3').innerHTML = htmlTableListReport3;
		
		if(typeof tableReporte === 'undefined') 
		{
		
		var tableReporte = $('#tblReportes3').DataTable(
				{
			processing : false,
			language : {
				processing : "Procesando...",
				search : '<i class="fa fa-search fa-lg"/>',
				searchPlaceholder : "Buscar..."
			},
			serverSide : false,
			data: pdataReporte,			
			dom: 'Bfrtip',
			lengthMenu : [
				[-1, 5, 10,15],
				['Mostrar Todo',
					'5 registros',
					'10 registros',
					'15 registros']
			],
			fnRowCallback: function(nRow, data, iDisplayIndex, iDisplayIndexFull) {
				if ( data[1] == "GRAND TOTAL" )
	            {
	                $('td:eq(1)', nRow).html( '<b>Grand Total</b>' );
	                $('td', nRow).css('background-color', '#4CAF50');
	                $('td', nRow).css('color', 'white');
	            }
              },
			columnDefs: [
				{ "className": "text-center", "targets": [0,1,2,3,4,5,6,7] },				
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
					text : '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel',
					filename: "ReporteTabla3",
					sheetName: "REPORTE",
					title: "Reporte Generado por IBM del Perú",
					header: true,
					customize: function( xlsx ) {
		                var sheet = xlsx.xl.worksheets['sheet1.xml'];
		                console.log("Generando Excel");
		                $('row c', sheet).each( function () {
		                	// Get the row value
		                	console.log($(this));
		                	var attr = $(this).context.parentElement.attributes.r.value;
		                	//Row number
		                	var ind = parseInt(attr);
		                	//Customize the cell style
		                	if (ind % 2 == 0) {
		                		$(this).attr( 's', '45' );
							}else{
								$(this).attr( 's', '25' );
							}
		                	//Rotate 90 degrees
		                	if (ind == 2) {
		                		console.log("Special validation");
		                		//Value of the cell
		                		var val = parseInt($(this).context.textContent);		   

		                		//Validates if the cell value is integer
 								if (isNaN(val)) {
 									console.log(' Is not a number');
 									var cell = $(this).context.attributes.r.value; //A2
 									var col = cell.replace(/[0-9]/g, '');
			                		$('row:first c[r^="'+col+'"]', sheet).attr('s', '42');
 								}else{
 									console.log(' Is a number');
 									var cell = $(this).context.attributes.r.value; //A2
			                		var col = cell.replace(/[0-9]/g, '');
			                		var nCell = col + '1';
			                		console.log("Affected field: "+nCell);
			                		$('row:first c[r^="'+col+'"]', sheet).attr('s', '45');
 								}
							}
		                });
		            }
				}
			],
			destroy : true				
		});
		
						// Setup - add a text input to each footer cell
					    $('#tblReportes3 .filters th').each( function () {
					        var title = $('#tblReportes3 thead th').eq( $(this).index() ).text();
					        $(this).html( '<input type="text" placeholder="Buscar '+title+'" style="width:100%"  />' );
					    } );
				
							table3 = $('#tblReportes3').DataTable();
					
					// Apply the search
				    table3.columns().eq( 0 ).each( function ( colIdx ) {
				        $( 'input', $('#tblReportes3 .filters th')[colIdx] ).on( 'keyup change', function () {
				            table3
				                .column( colIdx )
				                .search( this.value )
				                .draw();
				        } );
				   		 } );

		}
		else {
		    console.log('in else');	   
		    tableReporte.fnClearTable();
		    tableReporte.fnAddData(dataReporte);
		    tableReporte.fnAdjustColumnSizing();
		}
	}
	
	
	


</script>
<style>

.overlay {
  opacity: 0.2;
}

.filtros th{
	    	padding: 10px 7px !important;
	    }


#tblReportes1 {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#tblReportes1 td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#tblReportes1 tr:nth-child(even){background-color: #f2f2f2;}

#tblReportes1 tr:hover {background-color: #ddd;}

#tblReportes1 th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #4CAF50;
  
}




#tblReportes2 {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#tblReportes2 td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#tblReportes2 tr:nth-child(even){background-color: #f2f2f2;}

#tblReportes2 tr:hover {background-color: #ddd;}

#tblReportes2 th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #4CAF50;
  
}

#tblReportes3 {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#tblReportes3 td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#tblReportes3 tr:nth-child(even){background-color: #f2f2f2;}

#tblReportes3 tr:hover {background-color: #ddd;}

#tblReportes3 th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #4CAF50;
  
}




</style>

</html>