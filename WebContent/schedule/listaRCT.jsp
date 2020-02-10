<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
  
</head>
<body>

<aside class="right-side sizeHeight" style="height: 866px"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	Mantenimiento <small>RCT</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-th-large"></i> Mantenimiento</a></li>
	<li class="active">RCT's</li>
</ol>
</section> <!-- Main content --> <section class="content"> <!-- top row -->
<div class="row">
	<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
		<div class="form-inline">
		
			<div class="form-inline">
				<a class="btn btn-default btn-sm"  onclick="abreModal()">
				<i class="fa fa-file-text-o" aria-hidden="true"></i> Nuevo
				</a>
				
				<!-- <a class="btn btn-default btn-sm" onclick="listRCT(1)">
				<i class="fa fa-refresh fa-lg" aria-hidden="true"></i>
				</a> -->
				
				<select id="CboEstado" class="form-control"  style="width: 15%">
					<option disabled value="0">Seleccionar</option>
					<option value="1" selected>En Curso</option>
					<option value="2">Finalizado</option>
					<option value="3">Todos</option>
				</select>
				
				<button id="btnListarRCTcabecera" onclick="btncboRCT()" class="btn btn-info" ><i class="fa fa-list"></i> Listar</button> 
				
			</div>
		</div>
	</div>
</div>
<br />
<div class="row">
	<div class="col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> LISTA DE RCT's</h3>
			</div>
			<div class="box-body">
				<label id="lblMessage" class="label label-info"></label>
					<div id="tbcontainerRCT" class="table-responsive">
					</div>
			</div>
		</div>
	</div>
</div>
<!-- /.row --> <!-- Main row -->
<div class="row"></div>
<!-- /.row (main row) --> </section><!-- /.content --> </aside>

</body>

<!-- Modal Editar Descripcion Anuncio -->
<div class="modal fade" id="mdEditarAnuncio" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" align="center">Editar Descripcion Anuncio</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        	<input type="hidden" id="hdIdPerfil2">
        		<input onkeyup="validarEditarAnuncio()" class="form-control" type="text" id="txtEditarAnuncio">
        	<br>
        		<div class="form-inline" align="center">
        			<div class="form-group">
        	
		        		<button id="btnEditarAnuncio" class="btn btn-primary" onmousedown="validarEditarAnuncio()"  onclick="EditarAnuncio()">
								<i class="fa fa-save"></i> Editar
						</button>
		        		
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

<!-- Modal ASIGNAR SCHEDULE -->
<div class="modal fade" id="mdAsignarSchedule" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
         <h4 class="modal-title" align="center">Seleccionar Schedule</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        	<input type="hidden" id="hdIdPerfil2">
        		<div class="form-group">        			
        			<select id="cboScheduleUsuario" onchange="validar()"class="form-control input-sm">
						<option > Seleccionar </option>
					</select>
        		</div>
        		
        		<div class="form-inline">
        			<div class="form-group">
        				<button id="btnGuardar" class="btn btn-primary" onmousedown="validar()" onclick="guardarSchedule()">
								<i class="fa fa-check"></i>Asignar
						</button>
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
</div><!-- Modal ASIGNAR SCHEDULE -->


<!-- Modal NUEVO ACTIVIDAD -->
<div class="modal fade" id="mdNuevaActividad"  role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
         <h4 class="modal-title" align="center">CREACION DE RCT</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        	<input type="hidden" id="hdIdPerfil2">
        		
        		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
       				<div style="padding-left: 15%">
        				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" align="right">
        					<button id="btnR" class="btn btn-primary" onclick="mostrarRoA(1)">REQUERIMIENTO</button>
        				</div>
        				<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" align="left">
        					<button id="btnA" class="" onclick="mostrarRoA(2)">   ANUNCIO</button>
       					</div>
        			</div>
        		</div>
        		
        		<br>
        		<br>
        		
        		<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"> </div>
        		
      	<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10"><!-- TODO EL FORMULARIO -->
        		
        		<div id="actividadM" ><!-- PARA ACTIVIDAD -->
        		
        		<div class="form-group"> 
	        		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" align="center">
	        				Cliente :
	        		</div>      
	        		<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" align="left"> 				
						<select id="cboMCliente" onchange="validarModalNuevo();validarModalAnuncio()"  style="width: 100%"></select>
						
					</div>
        		</div>
        		
        		<br>
        		<div class="form-group"> 
        		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" align="center">
        		Servidor :
        		</div>      
        		<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" align="left" > 			
        			<select id="cboMServidor" onchange="validarModalNuevo();validarModalAnuncio()" style="width: 100%">
						
					</select>
				</div>
        		</div>
        		
        		<br>
        		<div class="form-group"> 
        		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" align="center">
        		Turno :
        		</div>      
        		<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" align="left" > 			
        			<select id="cboMTurno" onchange="validarModalNuevo();validarModalAnuncio()" style="width: 100%">						
					</select>
				</div>
        		</div>
        		
        		
        		
        		
        		<br>
        		<div class="form-group"> 
        		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" align="center">
        		Fecha Inicio:
        		</div>      
        		<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" align="left" > 			
        			<input  id="txtfechainicio" onchange="validarModalNuevo();validarModalAnuncio()" type="date" class="form-control input-sm" style="width: 100%">
				</div>
        		</div>
        		
        		<br>
        		<div class="form-group"> 
        		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" align="center">
        		H Ejecucion:
        		</div>      
        		<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" align="left" > 			
        			<input id="txthoraejecucion" onchange="validarModalNuevo();validarModalAnuncio()" type="time" class="form-control input-sm" style="width: 100%">
						
				</div>
        		</div>
        		
        		<br>
        		<div class="form-group"> 
        		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" align="center">
        		Fecha Fin:
        		</div>      
        		<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" align="left" > 			
        			<input  id="txtfechafin" onchange="validarModalNuevo();validarModalAnuncio()" type="date" class="form-control input-sm" style="width: 100%">
				</div>
        		</div>
        		
        		<br>
        		<div class="form-group"> 
	        		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" align="center">
	        		H.Vigencia:
	        		</div>      
	        		<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" align="left" > 			
	        			<input  id="txthoravigencia" onchange="validarModalNuevo();validarModalAnuncio()" type="time" class="form-control input-sm" style="width: 100%">
					</div>
        		</div>
        		
        		</div> <!-- PARA ACTIVIDAD -->
        		<br>
        		<div class="form-group"> 
        		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" align="center">
        		Actividad :
        		</div>      
        		<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" align="left" > 			
        			<input  id="txtactividad" onkeyup="validarModalNuevo();validarModalAnuncio()" type="text" class="form-control input-sm" style="width: 100%">
				</div>
        		</div>
        		
        		<br>
        		<br>
        		
    	</div> <!-- TODO EL FORMULARIO -->
    	<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"> </div>
    	
    	
        			<div class="form-group" class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
        				<button id="btnGuardarModalNuevo" class="btn btn-primary" onmousedown="validarModalNuevo();validarModalAnuncio()" onclick="GuardarMRCT()">
								<i class="fa fa-check"></i>Agregar
						</button>
		        		<a role="button" class="btn btn-default btn-sm" data-dismiss="modal">
		        			<i class="fa fa-reply" aria-hidden="true"></i> Volver
		        		</a>
        			</div>
        		
        	</div> <!-- 12 12 12 12  -->
        </div>
      </div>
    </div>
  </div>
</div><!-- FIN Modal NUEVO ACTIVIDAD -->


<!-- Modal DETALLE ACTIVIDAD -->
<div class="modal fade" id="mdDetalleActividad" role="dialog">
  <div class="modal-dialog" role="document" style="width: 1300px">
    <div class="modal-content">
      <div class="modal-header">
         <h4 class="modal-title" align="center"><b>DETALLE DE TAREA</b></h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        	<input type="hidden" id="hdIdPerfil2">        		
        		
        		<div class="form-inline"> 
        		<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" align="center">
        		Fecha Inicio:
        		</div>   
        		
        		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center">			
        			<input  id="txtfechainicioM2" onchange="validarModalDetalle()"  type="date" class="form-control input-sm" style="width: 100%" align="center">
				</div>
        
       		    <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" align="center">
        		Hora Ejecucion:
        		</div>  
        		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center">			
        			<input id="txthoraejecucionM2" onchange="validarModalDetalle()" type="time" class="form-control input-sm" style="width: 100%" align="center">
				</div>
        
        		<div class="form-inline"> 
        		<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" align="center">
        		Fecha Fin:
        		</div>   
        		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center">			
        			<input  id="txtfechafinM2" type="date" onchange="validarModalDetalle()" class="form-control input-sm" style="width: 100%" align="center">
				</div>
        
	        		 <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" align="center">
	        		Hora Fin:
	        		</div>  
	        		<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center">			
	        			<input  id="txthoravigenciaM2" onchange="validarModalDetalle()" type="time" class="form-control input-sm" style="width: 100%" align="center">
					</div>
        		</div>
        		<br>
        		<br>
        		<br>
        		
        		
        		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"> <!-- AMBOS LADOS -->
        		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" > <!-- LADO IZQUIERDO -->
        		
        		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden"> 
	        		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" align="right">
	        				Tipo :
	        		</div>      
	        		<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" align="center"> 				
						<select id="cboTipoM2" class="modal-open form-control" style="width: 100%" >
								<option value="0">Seleccionar</option>
								<option value="SCHEDULE">SCHEDULE</option>
								<option value="ACTIVIDAD">ACTIVIDAD</option>
						</select>
						
					</div>
        		</div>
        		
        		<br>
        		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden"> 
	        		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" align="right">
        		Id Schedule :
        		</div>      
        		<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" align="center">  			
        			<input id="scheduleM2" class="form-control" style="width: 100%">
						
				</div>
        		</div>
        		<br>
        		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"> 
	        		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" align="right">
        		Usuario Creador :
        		</div>      
        		<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" align="center"> 			
        			<input id="ultimousuarioM2" class="form-control" style="width: 100%">
				</div>
        		</div>
        		<br>
        		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12""> 
	        		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" align="right">
        		Cliente :
        		</div>      
        		<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" align="center">  			
        			<select id="cboClienteM2" onchange="validarModalDetalle()" class="form-control" style="width: 100%"></select>
				</div>
        		</div>
        		<br>
        		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12""> 
	        		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" align="right">
        		Servidor/IP :
        		</div>      
        		<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" align="center"> 			
        			<select id="cboServidorM2" onchange="validarModalDetalle()" class="form-control" style="width: 100%"></select>
				</div>
        		</div>
        		
        		<br>
        		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12""> 
	        		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" align="right">
        		Turno :
        		</div>      
        		<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" align="center"> 			
        			<select id="cboTurnoM2" onchange="validarModalDetalle()" class="form-control" style="width: 100%"></select>
				</div>
        		</div>
        		
        		<br>
        		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12""> 
	        		<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" align="right">
        		Actividad :
        		</div>      
        		<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" align="center">  			
        			<input id="actividadM2" onkeyup="validarModalDetalle()" class="form-control" style="width: 100%">
				</div>
        		</div>
        		</div> <!-- LADO IZQUIERDO -->
        	
        		
        		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6"> <!-- LADO DERECHO -->
        		<div class="form-group"> 
        		
	        		<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3" align="center">
	        		Descripcion :
	        		</div>      
	        		<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9" align="left" > 			
	        			<textarea id="txtDescripcionDetalle" onkeyup="validardescripcion()" rows="10" cols="54" name="comment" form="usrform"></textarea>
	        			<button id="btnGuardarDescDetalle" class="btn btn-primary" onmousedown="validardescripcion()"  onclick="guardarDescripcionDetalle()">
								<i class="fa fa-save"></i> Añadir Descripcion
						</button>
						
						<button id="btnLimpiarDescripcionDetalle" class="btn btn-default" onclick="limpiarTADesc()">
								<i class="fa fa-trash"></i> Limpiar Campo
						</button>
						
					</div>
					
        		</div>
        		</div><!-- LADO DERECHO -->
        		
        		</div> <!-- AMBOS LADOS -->
        		
		    	<div class="row">
					<div class="col-lg-12 connectedSortable"><br><br>
						<div class="box box-primary">
							<div class="box-header with-border">
								
							</div>
							<div class="box-body">
								<label id="lblMessage" class="label label-info"></label>
									<div id="tbcontainerRCTDETALLE" class="table-responsive">
									</div>
							</div>
						</div>
					</div>
				</div>
    	
    	
        			<div class="form-group col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
        				<button id="btnModalDetalle" onmousedown="validarModalDetalle()" class="btn btn-primary"  onclick="updateActividad()">
								<i class="fa fa-check"></i>Guardar Cambios
						</button>
		        		<a role="button" class="btn btn-default btn-sm" data-dismiss="modal">
		        			<i class="fa fa-reply" aria-hidden="true"></i> Volver
		        		</a>
        			</div>
        		
        	</div> <!-- 12 12 12 12  -->
        </div>
      </div>
    </div>
  </div>
</div><!-- FIN Modal DETALLE ACTIVIDAD -->
</div>


<script type="text/javascript"> 


$("#cboMCliente").select2();
$("#cboMServidor").select2();
$("#cboMTurno").select2();
$(document).ready(function() {
    $('.js-example-basic-single').select2();
});



function btncboRCT(){
	var a = document.getElementById('CboEstado').value;
	if(a == '0'){
		alert('Por favor seleccione otra Opcion , Gracias');
		
	}
	else {
		listRCT(a);
	}
}

listRCT(1);

function listRCT(ESTADO)	{	
	var a = ESTADO;
	
	$(document).ready(function() {
		var src = "ServletRCT";
		$.post(src, {strAccion : 'ListRCT', ESTADO : a},
				function(pdata) {
				  var obj = JSON.parse(pdata);						
					console.log(obj)					
					 var dataReporte = [];
					  var columnsReport = [];
					  
		if(obj.listarRCT[0].IdRct != 'No hay registros'){
		
						  for(i = 0 ; i < obj.listarRCT.length ; i++ ){ 
				
							var arr = [];
							
							if(obj.listarRCT[i].Tipo.trim() == 'SCHEDULE'){
						
							arr.push(i+1);	
							arr.push(obj.listarRCT[i].IdRct);//1
							
							
							arr.push(obj.listarRCT[i].Tipo);		
							arr.push(obj.listarRCT[i].IdUsuarioOrigen.replace('NULL','-').replace('null','-'));	
							arr.push(obj.listarRCT[i].IdActividad2.replace('NULL','-').replace('null','-'));
							arr.push(obj.listarRCT[i].IdActividad.replace('NULL','-').replace('null','-'));
							arr.push(obj.listarRCT[i].Descripcion.replace('NULL','-').replace('null','-'));
							arr.push(obj.listarRCT[i].Turno2);//7
							arr.push(obj.listarRCT[i].Cliente2);
							arr.push(obj.listarRCT[i].Servidor2);							
							arr.push(obj.listarRCT[i].FechaInicio);							
							arr.push(obj.listarRCT[i].FechaVigencia);//11
							
							arr.push(obj.listarRCT[i].IdScheduleOrigen2.replace('NULL','-').replace('null','-')); //12
							arr.push(obj.listarRCT[i].IdScheduleOrigen.replace('NULL','-').replace('null','-'));
							arr.push(obj.listarRCT[i].IdScheduleDestino2.replace('NULL','-').replace('null','-'));
							arr.push(obj.listarRCT[i].IdScheduleDestino.replace('NULL','-').replace('null','-'));
							
							arr.push(obj.listarRCT[i].IdUsuarioAtencion.replace('NULL','-').replace('null','-'));
							arr.push(obj.listarRCT[i].FechaReg.replace('NULL','-').replace('null','-'));
							arr.push(obj.listarRCT[i].FechaAsig.replace('NULL','-').replace('null','-'));
							
							
							
							arr.push(obj.listarRCT[i].Cliente);
							arr.push(obj.listarRCT[i].Servidor);
							arr.push(obj.listarRCT[i].Turno);
							arr.push(obj.listarRCT[i].HoraInicio.replace('NULL','-').replace('null','-'));
							arr.push(obj.listarRCT[i].Estado);
			
							}else if(obj.listarRCT[i].Tipo.trim() == 'REQUERIMIENTO'){
								
								arr.push(i+1);	
								arr.push(obj.listarRCT[i].IdRct);//1
								
								arr.push(obj.listarRCT[i].Tipo);		
								arr.push(obj.listarRCT[i].IdUsuarioOrigen.replace('NULL','-').replace('null','-'));
								
								arr.push(obj.listarRCT[i].Descripcion.replace('NULL','-').replace('null','-'));
								arr.push('-');
								
								arr.push('-');
								arr.push(obj.listarRCT[i].Turno2);//7
								arr.push(obj.listarRCT[i].Cliente2);
								arr.push(obj.listarRCT[i].Servidor2);							
								arr.push(obj.listarRCT[i].FechaInicio);							
								arr.push(obj.listarRCT[i].FechaVigencia);//11
								
								arr.push(obj.listarRCT[i].IdScheduleOrigen2.replace('NULL','-').replace('null','-')); //12
								arr.push(obj.listarRCT[i].IdScheduleOrigen.replace('NULL','-').replace('null','-'));
								arr.push(obj.listarRCT[i].IdScheduleDestino2.replace('NULL','-').replace('null','-'));
								arr.push(obj.listarRCT[i].IdScheduleDestino.replace('NULL','-').replace('null','-'));
								
								arr.push(obj.listarRCT[i].IdUsuarioAtencion.replace('NULL','-').replace('null','-'));//16
								arr.push(obj.listarRCT[i].FechaReg.replace('NULL','-').replace('null','-'));
								arr.push(obj.listarRCT[i].FechaAsig.replace('NULL','-').replace('null','-'));
								
								
								arr.push(obj.listarRCT[i].Cliente);
								arr.push(obj.listarRCT[i].Servidor);
								arr.push(obj.listarRCT[i].Turno);
								arr.push(obj.listarRCT[i].HoraInicio.replace('NULL','-').replace('null','-'));
								arr.push(obj.listarRCT[i].Estado);
								
							}else if(obj.listarRCT[i].Tipo.trim() == 'ANUNCIO'){
								
								arr.push(i+1);	
								arr.push(obj.listarRCT[i].IdRct);//1
								arr.push(obj.listarRCT[i].Tipo);//2
								arr.push(obj.listarRCT[i].IdUsuarioOrigen.replace('NULL','-').replace('null','-'));//3
								arr.push(obj.listarRCT[i].Descripcion.replace('NULL','-').replace('null','-')); //4
								arr.push(obj.listarRCT[i].Descripcion.replace('NULL','-').replace('null','-')); //5
								arr.push('-'); 
								
															
								arr.push('-'); //7
								arr.push('-');
								arr.push('-'); 
								
								arr.push('-');//10 						
								arr.push('-'); 
								arr.push('-'); 
								arr.push('-'); //13
								arr.push('-'); 
								arr.push('-'); 
								arr.push('-'); //16
								arr.push('-'); 
								arr.push('-');
								
								arr.push('-'); //19
								arr.push('-'); //20
								arr.push('-');  //21
								arr.push('-');  //22
								arr.push(obj.listarRCT[i].Estado);
								
							}
							dataReporte.push(arr);
							
							}//for
		   
						
						  columnsReport = [ {title : "NRO"},//0
							{title : "IdRCT"},//1
							{title : "Tipo"},//2
							{title : "Usuario que Registro"},//3 IdUsuarioOrigen
							{title : "Actividad"},//4 Actividad2
					        {title : "Actividad"},//5
					        {title : "Descripcion"},//6	
				            {title : "Turno"},//7
				            {title : "Cliente"},//8
				            {title : "Servidor"},//9
				            {title : "Fecha Inicio"},//10				            
				            {title : "Fecha Vigencia"},//11	
				            
				           
				            {title : "IdScheduleOrigen2"},//12				            
				            {title : "IdScheduleOrigen"},//13
				            {title : "IdScheduleDestino2"},//14
				            {title : "IdScheduleDestino"},//15
				            
				            {title : "UsuarioAtencion"},//16
				            {title : "FechaReg"},//17
				            {title : "FechaAsig"},//18	
				            
				            
				            {title : "CLIENTE2"},//19
				            {title : "SERVIDOR2"},//20
				            {title : "TURNO2"},//21
				            {title : "HORAINICIO"},//22
				            {title : "ESTADO"},//23
				            
				            
				            {
				            	"sName" : "editarbtn",
				            	"sWidth" : "100px",
								"title" : "Acciones",
								"bSearchable" : false,
								"bSortable" : false,								 
								"mRender" : function( data, type, columns ) {//this	
									
				if(columns[23].trim() == '1'){//ESTADO EN CURSO
					
							if(columns[2].trim() == 'SCHEDULE'){
								
												 return'<a title="AbrirModalDetalle" class="btn btn-warning btn-sm" onclick="openModalDetalle(\'' +columns[1] + '\',\'' + columns[10] +'\',\'' + columns[11] +'\',\'' + columns[2] +'\',\'' + columns[13] +'\',\'' + columns[3] +'\',\'' + columns[19] +'\',\'' + columns[20] +'\',\'' + columns[21] +'\',\''+columns[4] +'\',\'' + columns[4] +'\')"><i class="fa fa-pencil-square-o" aria-hidden="true">Descripcion</i></a>&nbsp;'+
												 '<br><a title="Asignar" class="btn btn-info btn-sm" onclick="openModalAsignar(\'' + columns[1].trim() + '\',\'' + columns[5] + '\',\'' + columns[13] + '\',\'' + columns[3] + '\',\'' + columns[22] +'\')"><i class="fa fa-pencil-square-o" aria-hidden="true">Asignar</i></a>&nbsp;'+
												 '<br><a title="Finalizar" class="btn btn-danger btn-sm" onclick="finalizarRCT(\'' + columns[1] +'\')"><i class="fa fa-pencil-square-o" aria-hidden="true">Finalizar</i></a>&nbsp;';;
												
							}else if(columns[2].trim() == 'REQUERIMIENTO'){
																								
								return '<a title="AbrirModal" class="btn btn-warning btn-sm" onclick="openModalDetalle(\'' +columns[1] + '\',\'' + columns[10] +'\',\'' + columns[11] +'\',\'' + columns[2] +'\',\'' + columns[13] +'\',\'' + columns[3] +'\',\'' + columns[19] +'\',\'' + columns[20] +'\',\'' + columns[21] +'\',\''+columns[4] +'\',\'' + columns[4] +'\')"><i class="fa fa-pencil-square-o" aria-hidden="true">Descripcion</i></a>&nbsp;'+
								 '<br><a title="Finalizar" class="btn btn-danger btn-sm" onclick="finalizarRCT(\'' + columns[1] +'\')"><i class="fa fa-pencil-square-o" aria-hidden="true">Finalizar</i></a>&nbsp;';
								
							}else if(columns[2].trim() == 'ANUNCIO'){
								
								return '<a title="abrirModal" class="btn btn-primary btn-sm" onclick="abreModalEditarAnuncio(\''+ columns[1] + '\',\'' + columns[5] +'\')"><i class="fa fa-pencil-square-o" aria-hidden="true">Editar Anuncio</i></a>&nbsp;'+
								'<a title="Finalizar" class="btn btn-danger btn-sm" onclick="finalizarRCT(\'' + columns[1] +'\')"><i class="fa fa-pencil-square-o" aria-hidden="true">Finalizar</i></a>&nbsp;';
							}		
				
				
				
				}else if(columns[23].trim() == '2') {//ESTADO 2 FINALIZADO
					
					if(columns[2].trim() == 'SCHEDULE'){
						
						return	'<a class="btn-success btn-sm"><i class="fa fa-check">Asignado</i></a>'+
						'<br><a title="AbrirModalDetalle" class="btn btn-warning btn-sm" onclick="openModalDetalle(\'' +columns[1] + '\',\'' + columns[10] +'\',\'' + columns[11] +'\',\'' + columns[2] +'\',\'' + columns[13] +'\',\'' + columns[3] +'\',\'' + columns[19] +'\',\'' + columns[20] +'\',\'' + columns[21] +'\',\''+columns[4] +'\',\'' + columns[4] +'\')"><i class="fa fa-pencil-square-o" aria-hidden="true">Descripcion</i></a>&nbsp;';
						
					}else if(columns[2].trim() == 'REQUERIMIENTO'){
						
						return	'<a class="btn-danger btn-sm"><i class="fa fa-check">Finalizado</i></a>'+
						'<br><a title="AbrirModalDetalle" class="btn btn-warning btn-sm" onclick="openModalDetalle(\'' +columns[1] + '\',\'' + columns[10] +'\',\'' + columns[11] +'\',\'' + columns[2] +'\',\'' + columns[13] +'\',\'' + columns[3] +'\',\'' + columns[19] +'\',\'' + columns[20] +'\',\'' + columns[21] +'\',\''+columns[4] +'\',\'' + columns[4] +'\')"><i class="fa fa-pencil-square-o" aria-hidden="true">Descripcion</i></a>&nbsp;';
						
					}else if (columns[2].trim() == 'ANUNCIO') { return	'<a class="btn-danger btn-sm"><i class="fa fa-check">Finalizado</i></a>';}
					/* return	'<a class="btn-danger btn-sm"><i class="fa fa-check-circle">Finalizado</i></a>'; */
					
				}
								}//this									 
							}
		
				          ];
					    setDataRCT(dataReporte,columnsReport);
					    
		}else {alert('No hay Registros con los Filtros seleccionados , Seleccione Otro Filtro por favor ');}
					    
			});//PDATA
			
		});
	}
	
var htmlTableRCT = '<table id=\"tblReporteRCT\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';

	function setDataRCT(pdataReporte, pcolumnsReporte){	
		
		document.getElementById('tbcontainerRCT').innerHTML = htmlTableRCT;	
		
		if(typeof tableReporte === 'undefined'){
	    
		var tableReporte = $('#tblReporteRCT').DataTable(
				{
					processing : false,
					language : {
						processing : "Procesando...",
						search : '<i class="fa fa-search fa-lg"/>',
						searchPlaceholder : "Buscar..."
					},
					serverSide : false,
					data: pdataReporte,
					columns: pcolumnsReporte,
					columnDefs: [
						{ "className": "text-center", "targets": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,18,19,20,21,22,23,24] },
						{ "targets": [1,5,12,13,14,15,16,17,18,19,20,21,22,23], "visible": false }  
						
   				    ],
					dom: 'Bfrtip',
					lengthMenu : [
						[5, 10, 20, -1],
						['5 registros',
							'10 registros',
							'20 registros',
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
	
	function finalizarRCT(IDRCT) {
		var a = IDRCT;
		$(document).ready(function() {			
			var src = "ServletRCT";
			$.post(src, {strAccion : 'FinalizarRCT',IDRCT : a},
					function(pdata) {
					  var obj = JSON.parse(pdata);
					});
			 /* setTimeout(function(){listRCT(2);}, 500);  */
			 setTimeout(function(){listRCT(1);$('#CboEstado').val(1);}, 500);
		})		
		
	}

var varIDRCT;
var varIDACTIVIDAD ;	
var varIDSCHEDULEORIGEN ;
var varIDUSUARIOORIGEN ;
var varHORAINICIO;

	function openModalAsignar (IDRCT,IDACTIVIDAD,IDSCHEDULEORIGEN,IDUSUARIOORIGEN,HORAINICIO){	
		
		$('#mdAsignarSchedule').modal('show');			
		varIDACTIVIDAD = IDACTIVIDAD;
		varIDSCHEDULEORIGEN= IDSCHEDULEORIGEN;
		varIDUSUARIOORIGEN= IDUSUARIOORIGEN;
		varIDRCT = IDRCT;
		varHORAINICIO = HORAINICIO;
		llenaComboSchedule();// muestra todos los schedules por USUARIO	
	}
	
	function llenaComboSchedule()	{			
		$(document).ready(function() {			
			var src = "ServletRCT";
			$.post(src, {strAccion : 'ListSchedulePorUsuario'},
					function(pdata) {
					  var obj = JSON.parse(pdata);
					  /* console.log(obj) */
					   $('#cboScheduleUsuario option').remove();
					   $('#cboScheduleUsuario').append($('<option>', {value: '0',text : 'Seleccionar'}));
			    				$.each(obj.listarSchedulePorUsuario, function (i, item) {
			    				    $('#cboScheduleUsuario').append($('<option>', { 
			    				        value: item.IdShedule,
			    				        text : item.DescripionIdShedule			    				    
			    				    }));
			    				});		  				
					});
		})
	}
	
	//GUARDA RCT TIPO SCHEDULE
	function guardarSchedule(){
  		var idscheduledestino = document.getElementById('cboScheduleUsuario').value;
		
	 	 $(document).ready(function() {	 		
			var src = "ServletRCT";
			$.post(src, {strAccion : "SaveActividadSchedule", 
						 IDACTIVIDAD : varIDACTIVIDAD.trim(),
						 IDSCHEDULEORIGEN : varIDSCHEDULEORIGEN,
						 IDSCHEDULEDESTINO : idscheduledestino,
						 IDRCT : varIDRCT,
						 HORAINICIO: varHORAINICIO}
						 
				  );	
			$('#mdAsignarSchedule').modal('hide');
		 	
		}); 	
	 	
	 	 setTimeout(function(){listRCT(1);$('#CboEstado').val(1);}, 500);
	 	
	 	
	}
	
	
	function abreModal(){ //Abre  MODAL Crear Nuevo Actividad o Anuncio
		$('#mdNuevaActividad').modal('show');
		llenaMCliente();
		llenaMServidor();
		llenaMTurno();		
		
		
		$('#txtactividad').val('');	
		$('#txtfechainicio').val('');	
		$('#txthoraejecucion').val('');	
		$('#txtfechafin').val('');
		$('#txthoravigencia').val('');
		
	}
	
	function validarModalNuevo () { // VALIDACION DE CAMPOS PARA EL MODAL DE NUEVO ACTIVIDAD O ANUNCIO
	
		var cliente = document.getElementById('cboMCliente').value.toString();
		var servidor = document.getElementById('cboMServidor').value.toString();
		var turno = document.getElementById('cboMTurno').value.toString();
		
		var actividad = document.getElementById('txtactividad').value.toString();
		var fechainicio = document.getElementById('txtfechainicio').value.toString();
		var horaejecucion = document.getElementById('txthoraejecucion').value.toString();
		var fechafin = document.getElementById('txtfechafin').value.toString();
		var horavigencia = document.getElementById('txthoravigencia').value.toString();
		
		
		
		if(cliente == '0' || servidor == '0' || turno == '0' || actividad == '' || fechainicio == '' || horaejecucion == '' || 
		   fechafin == '' || horavigencia == ''){
			
			 $( "#btnGuardarModalNuevo" ).prop( "disabled", true );
		}else{
			$( "#btnGuardarModalNuevo" ).prop( "disabled", false );
		}
	
	}
	
 	function validarModalAnuncio () { //VALIDACION SI EL USUARIO DESEA UN NUEVO ANUNCIO
		
		var actividad = document.getElementById('txtactividad').value.toString();
	
		if(actividad == ''){
			 $( "#btnGuardarModalNuevo" ).prop( "disabled", true );
		}else{
			$( "#btnGuardarModalNuevo" ).prop( "disabled", false );
		}
	
	} 
	
	function mostrarRoA(VALUE){ //MUESTRA LO QUE EL USUARIO DESEA (RCT o ANUNCIO)
		
		var v = VALUE;
		
		if(v == '1'){
			
			$('#actividadM').removeClass('hidden');
			$('#btnR').addClass('btn btn-primary');
			$('#btnA').removeClass('btn btn-primary');
			var cliente = document.getElementById('cboClienteM2').value.toString();
		
		}else if(v == '2'){
			
			$('#actividadM').addClass('hidden');
			$('#btnA').addClass('btn btn-primary');
			$('#btnR').removeClass('btn btn-primary');
			$('#cboMCliente').val('0');
		
		}
		
	}
	
	
	function validarModalDetalle() { // 
			
		var cliente = document.getElementById('cboClienteM2').value.toString();
		var servidor = document.getElementById('cboServidorM2').value.toString();
		var turno = document.getElementById('cboTurnoM2').value.toString();
		
		var actividad = document.getElementById('actividadM2').value.toString();
		var fechainicio = document.getElementById('txtfechainicioM2').value.toString();
		var horaejecucion = document.getElementById('txthoraejecucionM2').value.toString();
		var fechafin = document.getElementById('txtfechafinM2').value.toString();
		var horavigencia = document.getElementById('txthoravigenciaM2').value.toString();
		
		/* alert (cliente + servidor + turno +actividad +fechainicio + horaejecucion + fechafin + horavigencia);  */
		
		if(cliente == '0' || servidor == '0' || turno == '0' || actividad == '' || fechainicio == '' || horaejecucion == '' || 
		   fechafin == '' || horavigencia == ''){
			
        	$( "#btnModalDetalle" ).prop( "disabled", true );
		}else{
			$( "#btnModalDetalle" ).prop( "disabled", false );
		}
	
	}
	
	function validardescripcion () {
		
		var descripcion = document.getElementById('txtDescripcionDetalle').value.toString();
		
		if(descripcion == '' || descripcion == ' ' || descripcion == '  ' ){					
					 $( "#btnGuardarDescDetalle" ).prop( "disabled", true );
				}else{
					$( "#btnGuardarDescDetalle" ).prop( "disabled", false );
				}
		
	}
	
	function validar(){
		var combo = document.getElementById('cboScheduleUsuario').value;
		if(combo == '0'){				
			 $( "#btnGuardar" ).prop( "disabled", true );
		}else{
			$( "#btnGuardar" ).prop( "disabled", false );
		}
	}
	
	
	function llenaMCliente()	{			// COMBO CLIENTE
		$(document).ready(function() {			
			var src = "ServletRCT";
			$.post(src, {strAccion : 'ListarMCliente'},
					function(pdata) {
					  var obj = JSON.parse(pdata);
					  /* console.log(obj)  */
					   $('#cboMCliente option').remove();
					  $('#cboClienteM2 option').remove();
					   $('#cboMCliente').append($('<option>', {value: '0',text : 'Seleccionar'}));
					   $('#cboClienteM2').append($('<option>', {value: '0',text : 'Seleccionar'}));
			    				$.each(obj.listarMCliente, function (i, item) {
			    				    $('#cboMCliente').append($('<option>', {  value: item.IdCliente, text : item.Descripcion }));
			    				    $('#cboClienteM2').append($('<option>', {  value: item.IdCliente, text : item.Descripcion }));
			    				});
			    				llenaMServidor();
								
					});
		})
	}
	
	
	function llenaMServidor()	{		//COMBO SERVIDOR	
		$(document).ready(function() {			
			var src = "ServletRCT";
			$.post(src, {strAccion : 'ListarMServidor'},
					function(pdata) {
					  var obj = JSON.parse(pdata);
					   /* console.log(obj)  */
					   $('#cboMServidor option').remove();
					   $('#cboServidorM2 option').remove();
					   
					   $('#cboMServidor').append($('<option>', {value: '0',text : 'Seleccionar'}));
					   $('#cboServidorM2').append($('<option>', {value: '0',text : 'Seleccionar'}));
					   
			    				$.each(obj.listarMServidor, function (i, item) {
			    				    $('#cboMServidor').append($('<option>', { value: item.IdServidor,text : item.Descripcion }));
			    				    $('#cboServidorM2').append($('<option>', { value: item.IdServidor,text : item.Descripcion }));
			    				});
			    				llenaMTurno();
					});
		})
	}
	
	
	function llenaMTurno()	{   //COMBO TURNO			
		$(document).ready(function() {			
			var src = "ServletRCT";
			$.post(src, {strAccion : 'ListarMTurno'},
					function(pdata) {
					  var obj = JSON.parse(pdata);
					   console.log(obj)
					   $('#cboMTurno option').remove();
					   $('#cboTurnoM2 option').remove();
					   
					   $('#cboMTurno').append($('<option>', {value: '0',text : 'Seleccionar'}));
					   $('#cboTurnoM2').append($('<option>', {value: '0',text : 'Seleccionar'}));
			    				$.each(obj.listarMTurno, function (i, item) {
			    				    $('#cboMTurno').append($('<option>', {value: item.IdTurno,text : item.Descripcion}));
			    				    $('#cboTurnoM2').append($('<option>', {value: item.IdTurno,text : item.Descripcion}));
			    				});		  				
					});
		})
	}
	
	function GuardarMRCT() {	// GUARDA CAMBIOS EN EL MODAL RCT DETALLE (REQUERIMIENTO)	
		
		var  cliente = document.getElementById('cboMCliente').value;/* alert(cliente); */
		var  servidor = document.getElementById('cboMServidor').value;
		var  turno = document.getElementById('cboMTurno').value;
		var  actividaddescripcion = document.getElementById('txtactividad').value;
		
		var  fechafin = document.getElementById('txtfechafin').value.toString();
		var  horavigencia = document.getElementById('txthoravigencia').value.toString();
		var  fechainicio = document.getElementById('txtfechainicio').value.toString();
		var  horaejecucion = document.getElementById('txthoraejecucion').value.toString();
		
		
		var FECHAFIN = "["+ fechafin + "] " + horavigencia;
		var FECHAINICIO = "["+fechainicio +"] " + horaejecucion;
		
		
		
		$(document).ready(function() {	 		
			var src = "ServletRCT";
			$.post(src, {strAccion : "GuardarModalActividad",
						 IDCLIENTE : cliente,
						 IDSERVIDOR : servidor,
						 IDTURNO : turno,
						 DESCRIPCION : actividaddescripcion,
						 FECHAFIN: FECHAFIN,
						 FECHAINICIO: FECHAINICIO
						 }
						 
				  );	
			
			$('#mdNuevaActividad').modal('hide');
		}); 
		
		 setTimeout(function(){listRCT(1);$('#CboEstado').val(1)}, 500); // cada 5 segundos
		
	}
	
	
var varIDRCTMODALDETALLE;
var varDescDefault;

//ABRE MODAL PARA LA DESCRIPCION DE RCT TIPO REQUERIMIENTO
function openModalDetalle (IDRCT,FECHAINICIO,FECHAVIGENCIA,TIPO,IDSCHEDULE,IDUSUARIOATENCION,CLIENTE,SERVIDOR,TURNO,ACTIVIDAD,DESCRIPCION){
	
				varIDRCTMODALDETALLE = IDRCT;
				
				var a1 = FECHAINICIO.substring(1, 11);
				var a2 = FECHAINICIO.substring(13, 18);
				
				var b1 = FECHAVIGENCIA.substring(1, 11);
				var b2 = FECHAVIGENCIA.substring(13, 18);
				
				
				
				
				
				
			
				$('#txtfechainicioM2').prop("disabled", false );
				$('#txtfechainicioM2').val(a1.trim());
				$('#txtfechainicioM2').prop("disabled", true );
				
				$('#txthoraejecucionM2').prop("disabled", false );
				$('#txthoraejecucionM2').val(a2.trim());
				$('#txthoraejecucionM2').prop("disabled", true );
				
				$('#txtfechafinM2').prop("disabled", false );
				$('#txtfechafinM2').val(b1.trim());				
				$('#txtfechafinM2').prop("disabled", true );
				
				$('#txthoravigenciaM2').prop("disabled", false );
				$('#txthoravigenciaM2').val(b2.trim());
				$('#txthoravigenciaM2').prop("disabled", true );
				
				
				$('#cboTipoM2').prop("disabled", false );
				$('#cboTipoM2').val(TIPO.trim());		
				$('#cboTipoM2').prop("disabled", true );
				
				$('#scheduleM2').prop("disabled", false );
				$('#scheduleM2').val('-');
				$('#scheduleM2').prop("disabled", true );
				
				$('#ultimousuarioM2').prop("disabled", false );
				$('#ultimousuarioM2').val(IDUSUARIOATENCION.trim());
				$('#ultimousuarioM2').prop("disabled", true );
			
				setTimeout(function(){

					llenaMCliente();
					
				}, 5); 
				
				
				
				setTimeout(function(){
					varDescDefault = '1';
					
					listRCTDETALLE();
					
					$('#actividadM2').prop("disabled", false );
					$('#actividadM2').val(DESCRIPCION.trim());
					
					
					$('#txtDescripcionDetalle').val('');
					document.getElementById("btnGuardarDescDetalle").innerHTML = "<i class='fa fa-save'></i> Añadir Descripcion";
					
					$('#mdDetalleActividad').modal('show');
				}, 30); 
				
				setTimeout(function(){
				$('#cboClienteM2').prop("disabled", false );
				$('#cboClienteM2').val(CLIENTE.trim());
				
				
				$('#cboServidorM2').prop("disabled", false );
				$('#cboServidorM2').val(SERVIDOR.trim());
				
				
				$('#cboTurnoM2').prop("disabled", false );
				$('#cboTurnoM2').val(TURNO.trim());
		
				}, 300); 
				
}

function limpiarTADesc () {
	$('#txtDescripcionDetalle').val('');
}


var varIDRCTDETALLE = '0';// envia como parametro  si es 0 inserta nuevo detalle | si no es 0 edita un registro de detalle
	
	function guardarDescripcionDetalle() {	//click en el boton bajo el text area (REQUERIMIENTO DETALLE)	
		
		var descripcion = document.getElementById('txtDescripcionDetalle').value;
		var descripcion2 = descripcion.replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°').replace('\n','°');
		
		$(document).ready(function() {	 		
			var src = "ServletRCT";
			$.post(src, {strAccion : "GuardarDetalleDesc",
						 IDRCT : varIDRCTMODALDETALLE,
						 DESCRIPCION : descripcion2,
						 IDRCTDETALLE : varIDRCTDETALLE
						 }
				  );	
		}); 
		
		  setTimeout(function(){
			  listRCTDETALLE();
			  $('#txtDescripcionDetalle').val('');listRCTDETALLE();varIDRCTDETALLE = '0';
			  document.getElementById("btnGuardarDescDetalle").innerHTML = "<i class='fa fa-save'></i> Añadir Descripcion";
		  }, 500); 
		 
	}
	
	
	function editarDescripcion(DESCRIPCION,IDRCTDETALLE){ //cuando le dan click en editar REQUERIMIENTO DETALLE
		
		/* alert(IDRCTDETALLE); */
		var  actividaddescripcion = document.getElementById('actividadM2').value;		
		$('#txtDescripcionDetalle').val(DESCRIPCION.replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n'));
		
		varIDRCTDETALLE = IDRCTDETALLE;
		document.getElementById("btnGuardarDescDetalle").innerHTML = "<i class='fa fa-refresh'></i>  Actualizar Descripcion";
		
	}
	
	function listRCTDETALLE()	{	
		/* alert(varIDRCTMODALDETALLE); */
		$(document).ready(function() {
			var src = "ServletRCT";
			$.post(src, {strAccion : 'ListarRCTDETALLE',IDRCT : varIDRCTMODALDETALLE},
					function(pdata) {
					  var obj = JSON.parse(pdata);					
										
						  var dataReporte = [];
						  var columnsReport = [];
						  
						  if(obj.listarRCTDETALLE[0].FechaReg != 'No hay registros'){
							 
							  var dataReporte = [];
							  var columnsReport = [];
							  
							  
							  	for(i = 0 ; i < obj.listarRCTDETALLE.length ; i++ )
							  	{
								var arr = [];
								arr.push(i+1);	
								arr.push(obj.listarRCTDETALLE[i].FechaReg);
								arr.push(obj.listarRCTDETALLE[i].Descripcion);							
								arr.push(obj.listarRCTDETALLE[i].UsuarioReg);
								arr.push(obj.listarRCTDETALLE[i].UsuarioReg2);
								arr.push(obj.listarRCTDETALLE[i].IdRctDetalle);
								
								dataReporte.push(arr);
							  	}
			
							  columnsReport = [ {title : "NRO"},//0
								{title : "FechaReg"},//1
								{title : "Descripcion"},//2
								{title : "UsuarioReg"},//3				            
					            {title : "UsuarioReg2"},//4	
					            {title : "IdRctDetalle"},//5	
					           
						 
					            {
					            	"sName" : "editarbtn",
					            	"sWidth" : "170px",
									"title" : "Acciones",
									"bSearchable" : false,
									"bSortable" : false,								 
									"mRender" : function( data, type, columns ) {	
										
										if(columns[1] != 'No hay registros'){
										return '<a title="Asignar" class="btn btn-warning btn-sm" onclick="editarDescripcion(\'' + columns[2] +'\',\''+ columns[5] +'\')"><i class="fa fa-pencil-square-o" aria-hidden="true">Editar</i></a>&nbsp;'+
										'<a title="Eliminar" class="btn btn-danger btn-sm" onclick="eliminarRCTDETALLE(\'' + columns[5] +'\')"><i class="fa fa-trash-o" aria-hidden="true"></i>Eliminar</a>&nbsp;';
										}
									}									 
								}
			
					          ];
							  
								setDataRCTdetalle(dataReporte,columnsReport);
						    	var a = dataReporte[0];
						    	var x = a[2];
						    	if(varDescDefault == '1'){ // setea el ultimo registro de RCTDETALLE solo al momento de abrir el modal
						    	$('#txtDescripcionDetalle').val(x.replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n').replace('°','\n'));
						    	}
						    	setTimeout(varDescDefault = '0', 500); // pone en 0 para que ya no aparezca la ultima descripcion
						    	
						  }//if  
						  else {
							  var dataReporte = [];
							  var columnsReport = [];
							  
							  	var arr = [];
							  	arr.push('-');
								arr.push('-');
								arr.push(obj.listarRCTDETALLE[0].FechaReg);
								arr.push(obj.listarRCTDETALLE[0].FechaReg);
								arr.push('-');
								arr.push('-');
								arr.push('-');
								
								dataReporte.push(arr);
								columnsReport = [ {title : "-"},
												  {title : "-"},
												  {title : "-"},
												  {title : "-"},
												  {title : "-"},
												  {title : "-"},
												  {title : "-"}];
								setDataRCTdetalle(dataReporte,columnsReport);
						  }
							  
							
				});
				
			});
		}
		
	var htmlTableRCTdetalle = '<table id=\"tblReporteRCTdetalle\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';

		function setDataRCTdetalle(pdataReporte, pcolumnsReporte){	
			
				document.getElementById('tbcontainerRCTDETALLE').innerHTML = htmlTableRCTdetalle;	
			
			if(typeof tableReporte === 'undefined'){
		    
			var tableReporte = $('#tblReporteRCTdetalle').DataTable(
					{
						processing : false,
						language : {
							processing : "Procesando...",
							search : '<i class="fa fa-search fa-lg"/>',
							searchPlaceholder : "Buscar..."
						},
						serverSide : false,
						data: pdataReporte,
						columns: pcolumnsReporte,
						columnDefs: [							
							{ "className": "text-center", "targets": [0,1,2,3,4,5,6] },
							
							{ "targets": [3,5], "visible": false }						
	   				    ],
						dom: 'Bfrtip',
						lengthMenu : [
							[5, 10, 15, -1],
							['5 registros',
								'10 registros',
								'15 registros',
								'Mostrar todo']
						],	
						fnRowCallback: function(nRow, data, iDisplayIndex, iDisplayIndexFull) {
     	                   if(iDisplayIndex == 0){
     	                	  $('td', nRow).css('background-color', '#68FF7E');
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
		
		
		function updateActividad(){
			
			var  cliente = document.getElementById('cboClienteM2').value;
			var  servidor = document.getElementById('cboServidorM2').value;
			var  turno = document.getElementById('cboTurnoM2').value;
			var  actividaddescripcion = document.getElementById('actividadM2').value;
			var  idrct = varIDRCTMODALDETALLE;
			
		/* alert(fechainicio+'-'+horaejecucion   +'-'+horavigencia   +'-'+ cliente  +'-'+ servidor  +'-'+turno+'-'+actividaddescripcion); */
		/* alert(idrct); */
			
		var  fechafin = document.getElementById('txtfechafinM2').value.toString();
		var  horavigencia = document.getElementById('txthoravigenciaM2').value.toString();
		var  fechainicio = document.getElementById('txtfechainicioM2').value.toString();
		var  horaejecucion = document.getElementById('txthoraejecucionM2').value.toString();
		
		
		var FECHAFIN = "["+ fechafin + "] " + horavigencia;
		var FECHAINICIO = "["+fechainicio +"] " + horaejecucion;
		
			/* alert (FECHAFIN +'-'+ FECHAINICIO); */
			
			$(document).ready(function() {	 		
				var src = "ServletRCT";
				$.post(src, {strAccion : "ActualizarRCTactividad",							 
							 FECHAINICIO: FECHAINICIO,
							 FECHAVIGENCIA : FECHAFIN,
							 IDCLIENTE : cliente,
							 IDSERVIDOR : servidor,
							 IDTURNO : turno,
							 DESCRIPCION : actividaddescripcion,
							 IDRCT : idrct}
							 
					  );	
				
				$('#mdDetalleActividad').modal('hide');
			}); 
			
			 setTimeout(function(){listRCT(1);}, 500);
		}
		
		function eliminarRCTDETALLE (idrctdetalle){
			
			$(document).ready(function() {	 		
				var src = "ServletRCT";
				$.post(src, {strAccion : "EliminarRCTDETALLE",							 
							 IDRCTDETALLE: idrctdetalle }
							 
					  );					
			}); 
			setTimeout(function(){listRCTDETALLE();
			var valcbo = document.getElementById("CboEstado").value;
			 $('#txtDescripcionDetalle').val('');listRCT(valcbo);varIDRCTDETALLE = '0';
			  document.getElementById("btnGuardarDescDetalle").innerHTML = "<i class='fa fa-save'></i> Añadir Descripcion";
			}, 500);
		}
		
var varIDRCTANUNCIO;	
		
		function abreModalEditarAnuncio(IDRCTANUNCIO,DESCRIPCION){ // Editar Descripcion Anuncio
			$('#mdEditarAnuncio').modal('show');
			$('#txtEditarAnuncio').val(DESCRIPCION);
			
			varIDRCTANUNCIO = IDRCTANUNCIO;
			
		}
		
		function validarEditarAnuncio() {
			
			var txt =  document.getElementById("txtEditarAnuncio").value.toString();
		
			if (txt == '') {
				$('#btnEditarAnuncio').prop("disabled", true);
			}else{
				
				$('#btnEditarAnuncio').prop("disabled", false);
			}
		
		}
		
		function EditarAnuncio(){
		
			var txtEditarAnuncio =  document.getElementById("txtEditarAnuncio").value;
				
			$(document).ready(function() {	 		
				var src = "ServletRCT";
				$.post(src, {strAccion : "EditarDescripcionAnuncio",							 
							 DESCRIPCION: txtEditarAnuncio,
							 IDANUNCIO: varIDRCTANUNCIO}
							 
					  );			
				
				$('#mdEditarAnuncio').modal('hide');
			}); 
			
			 setTimeout(function(){listRCT(1);}, 500);
		}
		
		
</script>
</html>