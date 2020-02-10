<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.pe.ibm.bean.BeanSession"%>
<%
BeanSession objBeanSessionCRight = null;
objBeanSessionCRight = (BeanSession) session.getAttribute("usuarioLogin");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/custom/css/styleDispatch.css">

</head>
<body id="ReporteDispatch">
<input type="hidden" id="strCargo" value="<%=objBeanSessionCRight.getObjBeanPersonal().getStrCargo()%>" />
<input type="hidden" id="strEmail" value="<%=objBeanSessionCRight.getObjBeanPersonal().getStrIdLogin().toUpperCase()%>" />
<aside class="right-side"> <!-- Content Header (Page header) -->
<section class="content-header"> 
<h1>
<label id="miTexto"></label>
	Backlog <small>IN & SR</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-th-large"></i> Backlog</a></li>	
	<li class="active">IN & SR</li>
</ol>
</section> <!-- Main content --> <section class="content"> <!-- top row -->
<div class="row">
	<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
		<div class="form-inline">
			<div class="form-group">
				<a id="refresh" class="btn btn-default btn-sm">
				<i class="fa fa-refresh fa-lg" aria-hidden="true"></i>
				</a>
			</div>
		</div>
	</div>
</div>
<br />


<div class="row quickView">
		<!-- ./col -->
		 <div class="col-lg-2 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3 id="lblPV">...</h3>

              <p>P1 & P2 por vencer</p>
            </div>
            <div class="icon">
              <i class="fa fa-warning"></i>
            </div>
            <!--  <a href="#" class="small-box-footer">Ver tickets <i class="fa fa-arrow-circle-right"></i></a> -->
          </div>
        </div>
        
        <div class="col-lg-2 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3 id="lblTSA">...</h3>

              <p>P1 & P2 sin asignar</p>
            </div>
            <div class="icon">
              <i class="fa fa-street-view"></i>
            </div>
            <!--  <a href="#" class="small-box-footer">Ver tickets <i class="fa fa-arrow-circle-right"></i></a> -->
          </div>
        </div>
        
        <div class="col-lg-2 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow" style="background-color: #a471b4 !important;">
            <div class="inner">
              <h3 id="lblV">...</h3>

              <p>P1 & P2 Fuera de criterio</p>
            </div>
            <div class="icon">
              <i class="fa fa-arrow-circle-down "></i>
            </div>
            <!--  <a href="#" class="small-box-footer">Ver tickets <i class="fa fa-arrow-circle-right"></i></a> -->
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-2 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3 id="lblIC">...</h3>

              <p>P1 & P2 Dentro del criterio</p>
            </div>
            <div class="icon">
              <i class="fa fa-hourglass-half"></i>
            </div>
            <!--  <a href="#" class="small-box-footer">Ver tickets <i class="fa fa-arrow-circle-right"></i></a> -->
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-4 col-xs-12"> 
          <fieldset class="scheduler-border" style="padding-top: 0;">
			    <legend class="scheduler-border"><h4 style="margin-top: 0;">Filtros</h4></legend>
			    <div class="control-group">
			        <div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-7" style="display: inline-block;padding-right: 10px;" >
					    <label> Team: </label> <select class="select2" id="cboTeam"></select>
					</div>
					<div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-5" style="display: inline-block;">
					    <label> País: </label> <select class="select2" id="cboPais"></select>
					</div>
					<div class="form-group" style="display: inline-block;margin-top: 25px;">
						<a style="height: 32px;" id="btnBuscar" title="Filtrar" href="#" class="btn btn-sm btn-primary">
						<i style="margin-top: 4px;" class="fa fa-search"></i></a>
			    	</div>
					<div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-10" style="display: inline-block;">
					    <label> Squad: </label> <select class="select2" id="cboSquad"></select>
					</div>					
			    	<div class="form-group col-lg-5 col-md-5 col-sm-5 col-xs-7" style="display: inline-block;">
					    <label> Cliente: </label> <select class="select2" id="cboDispatchCliente"></select>
					</div>
			    </div>
			</fieldset>
        </div>
        <!-- ./col -->
       
        
</div>
<div class="row">	

	<div class="col-lg-4 connectedSortable">
	
		<div class="nav-tabs-custom">
            <ul class="nav nav-tabs pull-right" id="backlog_team">
              <li id="3" class=""><a href="#tab_1-1" data-toggle="tab" aria-expanded="false" onclick="listReport('3',$('#cboTeam').val(),$('#cboPais').val(),$('#cboSquad').val(),$('#cboDispatchCliente').val())">SR</a></li>
              <li id="2" class="active"><a href="tab_1-1" data-toggle="tab" aria-expanded="true" onclick="listReport('2',$('#cboTeam').val(),$('#cboPais').val(),$('#cboSquad').val(),$('#cboDispatchCliente').val())">IN</a></li>
              <li id="1"><a href="tab_1-1" data-toggle="tab" onclick="listReport('1',$('#cboTeam').val(),$('#cboPais').val(),$('#cboSquad').val(),$('#cboDispatchCliente').val())">Total</a></li>
               <li class="pull-left header" ><i class="fa fa-hourglass-3"></i> Squad Backlog</li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1-1">
               <div id="loaderTotal" class="loader"></div>
                <div id="tbcontainer" class="table-responsive" style="padding: 5px 10px;"></div>
              </div>
             
            </div>
            <!-- /.tab-content -->
          </div>
	
		
		</div>
		
	<div class="col-lg-8 connectedSortable">
	
		<div class="nav-tabs-custom">
            <ul class="nav nav-tabs pull-right">
              <li class="pull-left header"><i class="fa fa-warning"></i>Tickets fuera de criterio</li>
            </ul>
            <div class="tab-content">
				<div id="loadertfc" class="loader"></div>
                <div id="tbfccontainer" class="table-responsive" style="padding: 5px 10px;display: none;"></div>
              <!-- /.tab-pane -->
             
            </div>
            <!-- /.tab-content -->
         </div>
	
		
	</div>
</div>
<div class="row">	  
	<div class="col-lg-5 connectedSortable">
	
		<div class="nav-tabs-custom">
            <ul class="nav nav-tabs pull-right">
              <li class="pull-left header"><i class="fa fa-hourglass-half"></i>Tickets Planeados</li>
            </ul>
            <div class="tab-content">
            	<div id="loaderplaneados" class="loader"></div>
                <div id="tbTPcontainer" class="table-responsive" style="padding: 5px 10px;display: none;"></div>
             
            </div>
          </div>
		</div>	
	
	<div class="col-lg-7 connectedSortable">
	
		<div class="nav-tabs-custom">
            <ul class="nav nav-tabs pull-right">
              <li class="pull-left header"><i class="fa fa-hourglass-half"></i>Tickets dentro del criterio</li>
            </ul>
            <div class="tab-content">
            	<div id="loadertic" class="loader"></div>
                <div id="tbInCriteriaContainer" class="table-responsive" style="padding: 5px 10px;display: none;"></div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
		</div>
</div>

<!-- /.row --> <!-- Main row -->
<div class="row"></div>
<!-- /.row (main row) --> </section><!-- /.content --> </aside>

</body>

<!-- Modal Insertar -->
<div class="modal fade" id="mdNuevoPerfil" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Crear un nuevo Perfil</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        		<input type="hidden" id="hdIdPerfil">
        		<div class="form-group">
        			<label>Nombre</label>
        			<input id="txtNombrePerfil1" type="text" class="form-control">
        		</div>
        		<div class="form-inline">
        			<div class="form-group">
        				<a onclick="accionesPerfil('savePerfil')" class="btn btn-primary btn-sm">
		        			<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar
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
</div>

<!-- Modal Actualizar -->
<div class="modal fade" id="mdActualizarPerfil" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Actualizar Perfil</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        		<input type="hidden" id="hdIdPerfil1">
        		<div class="form-group">
        			<label>Nombre</label>
        			<input id="txtNombrePerfil2" type="text" class="form-control">
        		</div>
        		<div class="form-inline">
        			<div class="form-group">
        				<a onclick="accionesPerfil('updatePerfil')" class="btn btn-primary btn-sm">
		        			<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar
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
</div>


<script type="text/javascript">
	
	
	var vTeam = document.getElementById('hdIdTeam').value;	
	var strCargo = document.getElementById('strCargo').value; 
	var strOwnerId = document.getElementById('strEmail').value;
		
	$('#refresh').click(function() {
		visualizar($('#backlog_team li.active').attr('id'),$('#cboTeam').val(),$('#cboPais').val(),$('#cboSquad').val(),$('#cboDispatchCliente').val());		
	});

	visualizar('2','0','0','0','0');
	listarComboTeam('#cboTeam');	
	listarComboCliente(0);		
	comboPais();
	comboSquad();
		
	var iIC;
	var iPV;
	var iV;
	var iTSA;
	
	String.prototype.removeHtml=function(){
		 var cadena;
		 cadena=this.replace(/&nbsp;/gi,"");
		 cadena=cadena.replace(/&lt;/g,'<').replace(/&gt;/g,'>').replace(/&amp;/g,'&').replace(/\t/g, ' ');
		 cadena=cadena.replace(/  +/g, ' ');
		 return cadena.replace(/(<([^>]+)>)/ig,"");
	}
	
	$(document).ready(function(){
		$('#cboSquad').change(function(){
			listarComboCliente($('#cboSquad').val());
		});
	});
	
	function visualizar(idTipo,team, pais,squad,cliente) {
		tablaHtml();
		listar(team, pais,squad,cliente);
		listReport(idTipo,team,pais,squad,cliente);
		tablaP(team, pais,squad,cliente);
		tablaIC(team, pais,squad, cliente);
// 		listarIC('1',team, pais);
		
// 		listarP('2',team, pais);
        $('#dtResultados').removeClass('dtr-inline collapsed');
        $('#dtPlanned').removeClass('dtr-inline collapsed');
        $('#dtInCriteria').removeClass('dtr-inline collapsed');
        
        
//         $('#tbfccontainer').hide();
//         $('#loadertfc').show);

//         $('#tbInCriteriaContainer').hide());
//         $('#loadertic').show();

//         $('#tbTPcontainer').hide();
//         $('#loaderplaneados').show();
        
	}
	
	$( "#btnBuscar" ).click(function() {
		visualizar($('#backlog_team li.active').attr('id'),$('#cboTeam').val(),$('#cboPais').val(),$('#cboSquad').val(),$('#cboDispatchCliente').val());	
	});
	
	function comboSquad(){
		var opciones = {
			    '0' : 'Todos',
			    'IBM' : 'IBM',
			    'Squad Multi Industria 1' : 'Squad Multi Industria 1',
			    'Squad Multi Industria 2' : 'Squad Multi Industria 2',
			    'Squad Credicorp' : 'Squad Credicorp',
			    'Squad Intergroup' : 'Squad Intergroup',
			    'Squad Commercial' : 'Squad Commercial'
			};
			var selectedOption = '0';

			var select = $('#cboSquad');
			if(select.prop) {
			  var options = select.prop('options');
			}
			else {
			  var options = select.attr('options');
			}
			$('option', select).remove();

			$.each(opciones, function(val, text) {
			    options[options.length] = new Option(text, val);
			});
			select.val(selectedOption);
	}
	
	
	function comboPais(){
		$("#cboPais option").remove();
		$("#cboPais").append($('<option>', {
			value : '0',
			text : 'Todos'
		}));
		$("#cboPais").append($('<option>', {
			value : 'Peru',
			text : 'Peru'
		}));
		$("#cboPais").append($('<option>', {
			value : 'India',
			text : 'India'
		}));
	}
	
	
	function listarComboTeam(pIdCombo) {
		//Combo
		$(pIdCombo + " option").remove();
		$(pIdCombo).append($('<option>', {
			value : "0",
			text : "Todos"
		}));
		
		var src = "ServletReporteDispatch";
		$.post(src, {
			strOperacion : 'listTeam'
		}, function(pdata) {

			var obj = JSON.parse(pdata);

			for (i = 0; i < obj.ListaTeam.length; i++) {

				$(pIdCombo).append($('<option>', {
					value : obj.ListaTeam[i].codTeam,
					text : obj.ListaTeam[i].Team
				}));
			}
		});
	} // Fin funcion listarComboOption
	
	function listar(team,pais,squad, cliente) {
		
// 		var $modal = $('.js-loading-bar');
// 		$modal.modal('show');
		
		var src = "ServletReporteDispatch";
		var reporte="1";
		
		$('#tbfccontainer').hide();
		$('#loadertfc').show();
		$("#lblTSA").text('...');
		$("#lblV").text('...');
		
		//Inicio POST para  listar información en la tabla
		$.post(src,{
			strOperacion : reporte,
			team : team,
			squad : squad,
			pais : pais,
			cliente : cliente,
			strCargo :  strCargo,
			strOwnerId : strOwnerId
						},
						function(pdata) {

							var obj = JSON.parse(pdata);

							var datatabla = [];

							if (obj.ListaTFC[0].squad == "") {

								//Ocultar Modal con barra de progreso
								var $modal = $('.js-loading-bar');
								$modal.modal('hide');

							} else {
								
								iV=0;
								
								for (i = 0; i < obj.ListaTFC.length; i++) {

									var arr = [];
	
									//captura de datos
									var squad = obj.ListaTFC[i].squad;	
									var clienteId = obj.ListaTFC[i].clienteId;
									var cliente = obj.ListaTFC[i].cliente;
									var ticket = "<a target='_blank' href='http://ism.ecampus.com.pe/maximo/ui/?event=loadapp&value=" + obj.ListaTFC[i].clase + "&uniqueid="+ obj.ListaTFC[i].unique_id +"'>" + obj.ListaTFC[i].ticket + "</a>";
									var prioridad = obj.ListaTFC[i].prioridad;
									var owner = obj.ListaTFC[i].owner;
									var estado = obj.ListaTFC[i].estado;
									var hrs_vencidas = obj.ListaTFC[i].hrs_vencidas;
									var team = obj.ListaTFC[i].team;
									var Summary = obj.ListaTFC[i].Summary;									
									var Details = obj.ListaTFC[i].Details;									
									var CreatorId = obj.ListaTFC[i].CreatorId;
									var Creator = obj.ListaTFC[i].Creator;
									var CreatorGroup = obj.ListaTFC[i].CreatorGroup.replace("NULL","-");
									var Reported = obj.ListaTFC[i].Reported;
									var AffectedPerson = obj.ListaTFC[i].AffectedPerson;									
									var Ci = obj.ListaTFC[i].Ci;
									var CiName = obj.ListaTFC[i].CiName;
									var CiEnvironment = obj.ListaTFC[i].CiEnvironment;
									var LocationId = obj.ListaTFC[i].LocationId;
									var Location = obj.ListaTFC[i].Location;
									var ParentClientId = obj.ListaTFC[i].ParentClientId;
									var ParentClient = obj.ListaTFC[i].ParentClient;
									
									
									Details=Details.replace(/\n/g, "<br />").replace(/<br\s*[\/]?>/gi, "\r\n").removeHtml();
									
									if (prioridad ==1 || prioridad == 2) {
										iV++;
										if (owner=="No asignado") {
											iTSA++;
										}
									}
									
									//Generación de cadena para tabla tickets fuera de criterio
									arr.push(squad);
									arr.push(clienteId);
									arr.push(cliente);
									arr.push(ticket);
									arr.push(prioridad);
									arr.push(owner);
									arr.push(estado);
									arr.push(hrs_vencidas);
									arr.push(obj.ListaTFC[i].fechaCreacion.substring(0,19));
									arr.push(team);
									arr.push(Summary);
									arr.push(Details);
									
									arr.push(CreatorId);
									arr.push(Creator);
									arr.push(CreatorGroup);
									arr.push(Reported);
									arr.push(AffectedPerson);
									arr.push(Ci);
									arr.push(CiName);
									arr.push(CiEnvironment);
									arr.push(LocationId);
									arr.push(Location);
									arr.push(ParentClientId);
									arr.push(ParentClient);

									datatabla.push(arr);
								}
							}
							
							$("#lblV").text(iV);
							$("#lblTSA").text(iTSA);
							
							// DataTable
							$('#dtResultados tfoot th').each( function () {
							        var title = $(this).text();
							        $(this).html( '<input class="dtResultadostext" type="text" placeholder="'+title+'" />' );
							} );

							 
							var table =  $('#dtResultados').DataTable({
								dom : 'Bfrtip',
								order: [[3, 'asc']], 
								processing : true,
								"columnDefs": [
					            {
					                "targets": [1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23],
					                "visible": false
					            },{
					            	"targets": 2,
					            	"sortable":false
					            }],
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
								autoWidth: false,
								lengthMenu : [
										[ 10, 25, 50],
										[ '10 Registros', '25 registros' , '50 registros'] ],
								data : datatabla,
								buttons : [
									{
										extend : 'pageLength',
										text : '<i class="fa fa-list-ol" aria-hidden="true"></i> Mostrar',
										className: "btn-sm"
									},
									{
										extend: "csv",
										exportOptions: {
											columns: [0,1,2,3,4,5,6,7,8,9]
										},
										className: "btn-sm",
										text : '<i class="fa fa-file-text-o" aria-hidden="true"></i> CSV'
									},
									{
										extend: "excel",
										exportOptions: {
											columns: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23]
										},
										className: "btn-sm",
										text : '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
									}]
							});

							// Apply the search
						    table.columns().every( function () {
						        var that = this;
						 
						        $( '.dtResultadostext', this.footer() ).on('keyup change', function () {
						            if ( that.search() !== this.value ) {
						                that.search( this.value ).draw();
						                console.log('dentro de if : dtResultados: that.search()='+ that.column() + ' - ' + that.search() + ' | this.value=' + this.value);
						            }
						            console.log('fuera de if : dtResultados: that.search()=' + that.search() + ' | this.value=' + this.value);
						        } );
						    } );
							
						}).always(function() {
							$('#tbfccontainer').show();
							$('#loadertfc').hide();
						});

		// Fin del POST listar tabla

	}
	
function listarIC(idTipo,team,pais,squad, cliente) {
		
// 		var $modal = $('.js-loading-bar');
// 		$modal.modal('show');
		
		var src = "ServletReporteDispatch";
		var reporte="listCriteria";
		
		$('#tbInCriteriaContainer').hide();
		$('#loadertic').show();
		$("#lblPV").text('...');
		$("#lblIC").text('...');

		//Inicio POST para  listar información en la tabla
		$.post(src,{
			strOperacion : reporte,
			team : team,
			pais : pais,
			squad : squad,
			idTipo : idTipo,
			cliente : cliente,
			strCargo :  strCargo,
			strOwnerId : strOwnerId
						},
						function(pdata) {

							var obj = JSON.parse(pdata);

							var datatabla1 = [];

							if (obj.ListaReporteDispatch[0].squad == "") {

								//Ocultar Modal con barra de progreso
								//var $modal = $('.js-loading-bar');
       							//$modal.modal('hide');

							} else {
								iIC=0;
								iTSA=0;
								iPV=0;
																
								for (i = 0; i < obj.ListaReporteDispatch.length; i++) {

									var arr = [];

									//captura de datos
									var squad = obj.ListaReporteDispatch[i].squad;
									var clienteId = obj.ListaReporteDispatch[i].clienteId;
									var cliente = obj.ListaReporteDispatch[i].cliente;
									var ticket = "<a target='_blank' href='http://ism.ecampus.com.pe/maximo/ui/maximo.jsp?event=loadapp&value=" + obj.ListaReporteDispatch[i].clase + "&uniqueid="+ obj.ListaReporteDispatch[i].unique_id +"'>" + obj.ListaReporteDispatch[i].ticket + "</a>";
									var prioridad = obj.ListaReporteDispatch[i].prioridad;
									var owner = obj.ListaReporteDispatch[i].owner;
									var estado = obj.ListaReporteDispatch[i].status;
									var rango = obj.ListaReporteDispatch[i].tiempoRestante;
									var hrs_vencidas = obj.ListaReporteDispatch[i].horasVencer;
									var team = obj.ListaReporteDispatch[i].team;
									var fechaCreacion = obj.ListaReporteDispatch[i].fechaCreacion.substring(0,19);
									
									var Summary = obj.ListaReporteDispatch[i].Summary;
									var Details = obj.ListaReporteDispatch[i].Details;									
									var CreatorId = obj.ListaReporteDispatch[i].CreatorId;
									var Creator = obj.ListaReporteDispatch[i].Creator;
									var CreatorGroup = obj.ListaReporteDispatch[i].CreatorGroup.replace("NULL","-");
									var Reported = obj.ListaReporteDispatch[i].Reported;
									var AffectedPerson = obj.ListaReporteDispatch[i].AffectedPerson;									
									var Ci = obj.ListaReporteDispatch[i].Ci;
									var CiName = obj.ListaReporteDispatch[i].CiName;
									var CiEnvironment = obj.ListaReporteDispatch[i].CiEnvironment;
									var LocationId = obj.ListaReporteDispatch[i].LocationId;
									var Location = obj.ListaReporteDispatch[i].Location;
									var ParentClientId = obj.ListaReporteDispatch[i].ParentClientId;
									var ParentClient = obj.ListaReporteDispatch[i].ParentClient;
																	
									
									if (prioridad == 1 || prioridad == 2) {
										iIC++;
										if (rango=="Entre 0 y 4 Hrs") {
											iPV++;
										}
										
										if (owner=="No asignado") {
											iTSA++;	
										}
									}	
									
									//Generación de cadena para tabla tickets fuera de criterio
									arr.push(squad);
									arr.push(clienteId);
									arr.push(cliente);
									arr.push(ticket);
									arr.push(prioridad);
									arr.push(owner);
									arr.push(estado);
									arr.push(rango);
									arr.push(hrs_vencidas);
									arr.push(fechaCreacion);
									arr.push(team);	//10								
									arr.push(Summary);
									arr.push(Details);									
									arr.push(CreatorId);
									arr.push(Creator);
									arr.push(CreatorGroup);
									arr.push(Reported);
									arr.push(AffectedPerson);
									arr.push(Ci);
									arr.push(CiName);
									arr.push(CiEnvironment);//20
									arr.push(LocationId);
									arr.push(Location);
									arr.push(ParentClientId);
									arr.push(ParentClient);											
									
									datatabla1.push(arr);
								}
							}
							
							$("#lblPV").text(iPV);
							$("#lblIC").text(iIC);
							
							// DataTable
							$('#dtInCriteria tfoot th').each( function () {
							        var title = $(this).text();
							        $(this).html( '<input class="dtInCriteriatext" type="text" placeholder="'+title+'" data-index="'+i+'" />' );
							} );
	     				    


						var table1 = $('#dtInCriteria').DataTable({
							dom : 'Bfrtip',
							order: [[3, 'asc']], 
							processing : true,
							"columnDefs": [
				            {
				            	"targets": [1,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24],
				                "visible": false
				            },{
				            	"targets": 2,
				            	"sortable":false
				            }],
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
							lengthMenu : [
									[10, 25, 50],
									['10 Registros', '25 registros' , '50 registros'] ],
							data : datatabla1,
							buttons : [
								{
									extend : 'pageLength',
									text : '<i class="fa fa-list-ol" aria-hidden="true"></i> Mostrar',
									className: "btn-sm"
								},
								{
									extend: "csv",
									exportOptions: {
										columns: [0,1,2,3,4,5,6,7,8,9]
									},
									className: "btn-sm",
									text : '<i class="fa fa-file-text-o" aria-hidden="true"></i> CSV'
								},
								{
									extend: "excel",
									exportOptions: {
										columns: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
									},
									className: "btn-sm",
									text : '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
								},
								{
									extend: "pdfHtml5",
									exportOptions: {
										columns: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
									},
									className: "btn-sm",
									text : '<i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF'
								},
								{
									extend: "print",
									exportOptions: {
										columns: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24]
									},
									className: "btn-sm",
									text : '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'
								}]	
						});
							
						    table1.columns().every( function () {
						        var that = this;
						 
						        $('.dtInCriteriatext', this.footer() ).on( 'keyup change', function () {
						            if(that.search() !== this.value){
						                that.search(this.value).draw();
						                console.log('dentro de if : dtInCriteria: that.search()=' + that.search() + ' | this.value=' + this.value);
						            }
						            console.log('fuera de if : dtInCriteria: that.search()=' + that.search() + ' | this.value=' + this.value);
						        });
						    });
						}).always(function() {
							$('#tbInCriteriaContainer').show();
							$('#loadertic').hide();
						});
		// Fin del POST listar tabla

	}
	
function listarP(idTipo,team,pais,squad, cliente) {
	
// 	var $modal = $('.js-loading-bar');
// 	$modal.modal('show');
	
// 	$('#tbTPcontainer').hide();
    $('#loaderplaneados').show();
    $('#tbTPcontainer').hide();
	
	var src = "ServletReporteDispatch";
	var reporte="listCriteria";

	//Inicio POST para  listar información en la tabla
	$.post(src,{
		strOperacion : reporte,
		team : team,
		pais : pais,
		squad : squad,
		idTipo : idTipo,
		cliente : cliente,
		strCargo :  strCargo,
		strOwnerId : strOwnerId
					},
					function(pdata) {
console.log('RUTA ==> ' + reporte + ' - ' + idTipo);
						var obj = JSON.parse(pdata);

						var datatabla2 = [];

						if (obj.ListaReporteDispatch[0].squad == "") {

							//Ocultar Modal con barra de progreso
							//var $modal = $('.js-loading-bar');
							//$modal.modal('hide');

						} else {
							
							for (i = 0; i < obj.ListaReporteDispatch.length; i++) {

								var arr = [];

								//captura de datos
								var squad = obj.ListaReporteDispatch[i].squad;
								var cliente = obj.ListaReporteDispatch[i].cliente;
								var ticket = "<a target='_blank' href='http://ism.ecampus.com.pe/maximo/ui/maximo.jsp?event=loadapp&value=" + obj.ListaReporteDispatch[i].clase + "&uniqueid="+ obj.ListaReporteDispatch[i].unique_id +"'>" + obj.ListaReporteDispatch[i].ticket + "</a>";
								var prioridad = obj.ListaReporteDispatch[i].prioridad;
								var owner = obj.ListaReporteDispatch[i].owner;
								var estado = obj.ListaReporteDispatch[i].status;
								var fechaCreacion = obj.ListaReporteDispatch[i].fechaCreacion.substring(0,19);
								var team = obj.ListaReporteDispatch[i].team;							
								
								//Generación de cadena para tabla tickets fuera de criterio
								arr.push(squad);
								arr.push(cliente);
								arr.push(ticket);
								arr.push(prioridad);
								arr.push(owner);
								arr.push(estado);
	arr.push(fechaCreacion);
									arr.push(team);

									datatabla2.push(arr);
								}
							}

							// DataTable
							$('#dtPlanned tfoot th')
									.each(
											function() {
												var title = $(this).text();
												$(this)
														.html(
																'<input class="dtPlannedtext" type="text" placeholder="'+title+'" />');
											});

							var table2 = $('#dtPlanned')
									.DataTable(
											{
												dom : 'Bfrtip',
												data : datatabla2,
												order : [ [ 3, 'asc' ] ],
												processing : true,
												"columnDefs" : [ {
													"targets" : 7,
													"visible" : false
												}, {
													"targets" : 2,
													"sortable" : false
												} ],
												language : {
													processing : "Procesando...",
													search : '<i class="fa fa-search fa-lg"></i>',
													searchPlaceholder : "Buscar...",
													emptyTable : "Ningún dato disponible en esta tabla",
													lengthMenu : "Mostrar _MENU_ registros",
													zeroRecords : "Sin resultados encontrados",
													info : "Mostrando registros del _START_ al _END_ de un total de _TOTAL_",
													infoEmpty : "No hay registros disponibles",
													infoFiltered : "(filtrado de un total de _MAX_ registros)",
													paginate : {
														first : "Primero",
														last : "Último",
														next : "Siguiente",
														previous : "Anterior"
													}
												},
												lengthMenu : [
														[ 10, 25, 50 ],
														[ '10 Registros',
																'25 registros',
																'50 registros' ] ],
												buttons : [
														{
															extend : 'pageLength',
															text : '<i class="fa fa-list-ol" aria-hidden="true"></i> Mostrar',
															className : "btn-sm"
														},
														{
															extend : "csv",
															exportOptions : {
																columns : [ 0,
																		1, 2,
																		3, 4,
																		5, 6, 7 ]
															},
															className : "btn-sm",
															text : '<i class="fa fa-file-text-o" aria-hidden="true"></i> CSV'
														},
														{
															extend : "excel",
															exportOptions : {
																columns : [ 0,
																		1, 2,
																		3, 4,
																		5, 6, 7 ]
															},
															className : "btn-sm",
															text : '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
														},
														{
															extend : "pdfHtml5",
															exportOptions : {
																columns : [ 0,
																		1, 2,
																		3, 4,
																		5, 6, 7 ]
															},
															className : "btn-sm",
															text : '<i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF'
														},
														{
															extend : "print",
															exportOptions : {
																columns : [ 0,
																		1, 2,
																		3, 4,
																		5, 6, 7 ]
															},
															className : "btn-sm",
															text : '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'
														} ]
											});

							// Apply the search
							table2
									.columns()
									.every(
											function() {
												var that = this;

												$('.dtPlannedtext',
														this.footer())
														.on(
																'keyup change',
																function() {
																	if (that
																			.search() !== this.value) {
																		that
																				.search(
																						this.value)
																				.draw();
																		//console.log('dentro de if : dtPlanned: that.search()=' + that.search() + ' | this.value=' + this.value);
																	}
																	//console.log('fuera de if : dtPlanned: that.search()=' + that.search() + ' | this.value=' + this.value);
																});
											});
						}).always(function() {
					$('#tbTPcontainer').show();
					$('#loaderplaneados').hide();
				});

		// Fin del POST listar tabla

	}

	function tablaHtml() {

		var tabla = "<table id=\"dtResultados\" class=\"display table table-hover\" "
				+ " style=\"font-size:12px; font-weight:bold; width:100%\"> "
				+ "	<thead class=\"bg-primary\">"
				+ "          <tr>"
				+ "            <th>Squad</th>"
				+ "            <th>Codigo Cliente</th>"
				+ "            <th>Cliente</th>"
				+ "            <th>Ticket</th>"
				+ "            <th width='63px'>Prioridad</th>"
				+ "            <th>Owner</th>"
				+ "            <th>Estado</th>"
				+ "            <th>Horas vencidas</th>"
				+ "            <th>Fecha de creación</th>"
				+ "            <th>Team</th>"
				+ "            <th>Resumen</th>"
				+ "            <th>Detalles</th>"
				+ "            <th>Correo Creador</th>"
				+ "            <th>Creador</th>"
				+ "            <th>Grupo creador</th>"
				+ "            <th>Reportador por</th>"
				+ "            <th>Persona afectada</th>"
				+ "            <th>CI</th>"
				+ "            <th>Nombre de CI</th>"
				+ "            <th>Ambiente</th>"
				+ "            <th>Codigo Sede</th>"
				+ "            <th>Sede</th>"
				+ "            <th>Codigo Cliente Principal</th>"
				+ "            <th>Cliente Principal</th>";

		tabla += " </tr> </thead><tbody></tbody>" + "	<tfoot>"
				+ "          <tr>" + "            <th>Squad</th>"
				+ "            <th>Codigo Cliente</th>"
				+ "            <th>Cliente</th>"
				+ "            <th>Ticket</th>"
				+ "            <th>Prioridad</th>"
				+ "            <th>Owner</th>" + "            <th>Estado</th>"
				+ "            <th>Horas vencidas</th>"
				+ "            <th>Fecha de creación</th>"
				+ "            <th>Team</th>" + "            <th>Resumen</th>"
				+ "            <th>Detalles</th>"
				+ "            <th>Correo Creador</th>"
				+ "            <th>Creador</th>"
				+ "            <th>Grupo creador</th>"
				+ "            <th>Reportador por</th>"
				+ "            <th>Persona afectada</th>"
				+ "            <th>CI</th>"
				+ "            <th>Nombre de CI</th>"
				+ "            <th>Ambiente</th>"
				+ "            <th>Codigo Sede</th>"
				+ "            <th>Sede</th>"
				+ "            <th>Codigo Cliente Principal</th>"
				+ "            <th>Cliente Principal</th>";

		tabla += "	      </tr>" + "	     </tfoot>" + "      </table>";

		document.getElementById("tbfccontainer").innerHTML = tabla;
	}

	function tablaIC(team, pais, squad, cliente) {
		var tabla = "<table id=\"dtInCriteria\" class=\"display table table-hover\" "
				+ " style=\"font-size:12px; font-weight:bold; width:100%\"> "
				+ "	<thead class=\"bg-primary\">"
				+ "          <tr>"
				+ "            <th>Squad</th>"
				+ "            <th>Codigo Cliente</th>"
				+ "            <th>Cliente</th>"
				+ "            <th>Ticket</th>"
				+ "            <th width='63px'>Prioridad</th>"
				+ "            <th>Owner</th>"
				+ "            <th>Estado</th>"
				+ "            <th>Rango</th>"
				+ "            <th>Horas para vencer</th>"
				+ "            <th>Fecha de creación</th>"
				+ "            <th>Team</th>"
				+ "            <th>Resumen</th>"
				+ "            <th>Detalles</th>"
				+ "            <th>Correo Creador</th>"
				+ "            <th>Creador</th>"
				+ "            <th>Grupo creador</th>"
				+ "            <th>Reportador por</th>"
				+ "            <th>Persona afectada</th>"
				+ "            <th>CI</th>"
				+ "            <th>Nombre de CI</th>"
				+ "            <th>Ambiente</th>"
				+ "            <th>Codigo Sede</th>"
				+ "            <th>Sede</th>"
				+ "            <th>Codigo Cliente Principal</th>"
				+ "            <th>Cliente Principal</th>";

		tabla += " </tr> </thead><tbody></tbody>" + "	<tfoot>"
				+ "          <tr>" + "            <th>Squad</th>"
				+ "            <th>Codigo Cliente</th>"
				+ "            <th>Cliente</th>"
				+ "            <th>Ticket</th>"
				+ "            <th width='63px'>Prioridad</th>"
				+ "            <th>Owner</th>" + "            <th>Estado</th>"
				+ "            <th>Rango</th>"
				+ "            <th>Horas para vencer</th>"
				+ "            <th>Fecha de creación</th>"
				+ "            <th>Team</th>" + "            <th>Resumen</th>"
				+ "            <th>Detalles</th>"
				+ "            <th>Correo Creador</th>"
				+ "            <th>Creador</th>"
				+ "            <th>Grupo creador</th>"
				+ "            <th>Reportador por</th>"
				+ "            <th>Persona afectada</th>"
				+ "            <th>CI</th>"
				+ "            <th>Nombre de CI</th>"
				+ "            <th>Ambiente</th>"
				+ "            <th>Codigo Sede</th>"
				+ "            <th>Sede</th>"
				+ "            <th>Codigo Cliente Principal</th>"
				+ "            <th>Cliente Principal</th>";

		tabla += "</tr>" + "	     </tfoot>" + "      </table>";

		document.getElementById("tbInCriteriaContainer").innerHTML = tabla;

		listarIC('1', team, pais, squad, cliente);
	}

	function tablaP(team, pais, squad, cliente) {
		var tabla = "<table id=\"dtPlanned\" class=\"display table table-hover\" "
				+ " style=\"font-size:12px; font-weight:bold; width:100%\"> "
				+ "	<thead class=\"bg-primary\">"
				+ "          <tr>"
				+ "            <th>Squad</th>"
				+ "            <th>Cliente</th>"
				+ "            <th>Ticket</th>"
				+ "            <th width='63px'>Prioridad</th>"
				+ "            <th>Owner</th>"
				+ "            <th>Estado</th>"
				+ "            <th>Fecha de creación</th>"
				+ "            <th>Team</th>";

		tabla += " </tr> </thead><tbody></tbody>" + "	<tfoot>"
				+ "          <tr>" + "            <th>Squad</th>"
				+ "            <th>Cliente</th>"
				+ "            <th>Ticket</th>"
				+ "            <th width='63px'>Prioridad</th>"
				+ "            <th>Owner</th>" + "            <th>Estado</th>"
				+ "            <th>Fecha de creación</th>"
				+ "            <th>Team</th>";

		tabla += "</tr>" + "	     </tfoot>" + "      </table>";

		document.getElementById("tbTPcontainer").innerHTML = tabla;

		listarP('2', team, pais, squad, cliente);
	}

	function listReport(idTipo, team, pais, squad, cliente) {

		$(document).ready(function() {

			$('#loaderTotal').show();
			$('#tbcontainer').hide();
			
			var src = "ServletReporteDispatch";
			$.post(src, {

				strOperacion : 'listTotal',
				idTipo : idTipo,
				team : team,
				squad : squad,
				pais : pais,
				cliente : cliente,
				strCargo : strCargo,
				strOwnerId : strOwnerId
			}, function(pdata) {

				var obj = JSON.parse(pdata);
				var dataReporte = [];
				var columnsReport = [];
				//var arr = [];

				for (i = 0; i < obj.ListaReporteDispatch.length; i++) {
					console.log(obj.ListaReporteDispatch[0].squad);
					var arr = [];
					arr.push(obj.ListaReporteDispatch[i].squad);
					arr.push(obj.ListaReporteDispatch[i].in_criteria);
					arr.push(obj.ListaReporteDispatch[i].out_of_criteria);
					arr.push(obj.ListaReporteDispatch[i].planificado);
					arr.push(obj.ListaReporteDispatch[i].total);
					dataReporte.push(arr);
				}

				columnsReport = [ {
					"title" : "Squad",
					"sWidth" : "77px"
				}, {
					title : "In criteria"
				}, {
					title : "Out of criteria"
				}, {
					title : "Planned"
				}, {
					title : "Total"
				} ];

				setData(dataReporte, columnsReport);

			});

		});
	}

	var htmlTable = '<table id=\"tblReportes\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';

	function openModalUpdate(idPerfil, Descripcion) {
		$(document).ready(function() {
			// 			alert(idPerfil + ' || ' + Descripcion);
			$('#mdActualizarPerfil').modal('show');
			$('#hdIdPerfil1').text(idPerfil);
			$('#txtNombrePerfil2').val(Descripcion);
		});
	}

	function openModalDelete(idPerfil) {
		$(document).ready(function() {
			$('#mdPregunta').modal('show');
			$('#hdIdPerfil2').text(idPerfil);
		});
	}

	function setData(pdataReporte, pcolumnsReport) {
		document.getElementById('tbcontainer').innerHTML = htmlTable;
		
		$('#tbcontainer').show();
		$('#loaderTotal').hide();

		if (typeof tableReporte === 'undefined') {
			console.log('in if');

			var tableReporte = $('#tblReportes')
					.DataTable(
							{
								responsive : false,
								order : [ [ 2, 'asc' ] ],
								rowGroup : {
									dataSrc : 2
								},
								processing : false,
								serverSide : false,
								"paging" : false,
								"ordering" : false,
								"info" : false,
								"searching" : false,
								data : pdataReporte,
								columns : pcolumnsReport,
								dom: "<'row'<'col-sm-6'B><'col-sm-6 text-right'f>>" +
								"<'row'<'col-sm-12'tr>>" +
								"<'row'<'col-sm-5'i><'col-sm-7 text-right'p>>",
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
												}],
								destroy : true
							});
			$('.dataTables_filter input').addClass(
					'form-control-search-datatable');
			tableReporte.buttons().remove();
			
		} else {
			tableReporte.fnClearTable();
			tableReporte.fnAddData(dataReporte);
			tableReporte.fnAdjustColumnSizing();
		}
		
		
	}

	$(function() {
		//Initialize Select2 Elements
		$(".select2").select2();

		$('#cboPais').select2({
			minimumResultsForSearch : -1
		});
	});

	function listarComboCliente(pParentClient) {
		$('#cboDispatchCliente option').remove();
		$('#cboDispatchCliente').append($('<option>', {
			value : '0',
			text : "Todos"
		}));

		var src = "ServletReporteDispatch";
		$.post(src, {
			strOperacion : 'listParentCliente', strParentClient : pParentClient
		}, function(pdata) {
			var obj = JSON.parse(pdata);
			if (obj.cliente.length > 0) {
				$.each(obj.cliente, function(i, item) {
					$('#cboDispatchCliente').append($('<option>', {
						value : item.idParentClient,
						text : item.descripcionParentClient
					}));
				});
			}
		});
	}
</script>

</html>