<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
<meta charset="UTF-8" content="width=device-width, initial-scale=1" name='viewport' />

<script type="text/javascript">

var f=new Date();
var date = f.getFullYear() + '-' + ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f.getMonth() + 1)) + '-' + ((f.getDate()) < 10 ? '0' + f.getDate() : f.getDate());

document.getElementById("txtFechaRegistro").value = date;
document.getElementById("txtUsuarioRegistro").value = "Anthony Canales Celis";
document.getElementById("txtCorreoRegistro").value = "ajcanale@pe.ibm.com";

</script>

<!-- Right side column. Contains the navbar and content of the page -->
<aside id="aside" class="right-side"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	SMART REQUEST <small>SOLICITUD</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-dashboard"></i> SMART REQUEST</a></li>
	<li class="active">SOLICITUD</li>
</ol>
</section> <!-- Main content --> <section class="content"> <!-- top row -->

<!-- Inicio Modal Unidades de Red -->
 <div class="modal fade" id="modalUnidadRed" role="dialog" aria-labelledby="exampleModalLongTitle2" aria-hidden="true">
         <div class="modal-dialog" role="document">
         <div class="modal-content">
         	<div class="modal-header" style="background-color: #68DFF0">
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                   </button>
                   <h4 class="modal-title" id="exampleModalLongTitle2"><a style="color:white">ACCESO A UNIDADES DE RED&nbsp;&nbsp;</a><a style="color:red;font-weight: bold;"></a></h4>
              </div>
              <div class="modal-body">
              
              	   	<label for="recipient-name" class="control-label">Unidad</label>
			        <p id="alerticboTurno" class="text-danger" style='display:none;'></p>
			        <select class="form-control select2" name="c_turno" style="width: 100%;" id="cboUnidadRed">
			        <option value="0" disabled selected> --SELECCIONE-- </option>
			        <option value="1"> D:\CENTRIA </option>
					<option value="2"> D:\PUBLICO </option>
			        </select>
			        <br><br>  
			        <label for="recipient-name" class="control-label">Tipo de Acceso</label>
			        <p id="alerticboTurno" class="text-danger" style='display:none;'></p>
			        <select class="form-control select2" name="c_turno" style="width: 100%;" id="cboTipoAcceso">
			        <option value="0" disabled selected> --SELECCIONE-- </option>
			        <option value="1"> Lectura </option>
			        <option value="2"> Escritura </option>
			        </select>
			        <br><br>  
			        <label for="recipient-name" class="control-label">1er Nivel</label>
			        <p id="alerticboTurno" class="text-danger" style='display:none;'></p>
			        <select class="form-control select2" name="c_turno" style="width: 100%;" id="cboNivel1">
			        <option value="0" disabled selected> --SELECCIONE-- </option>
			        <option value="1"> Auditoria </option>
					<option value="2"> Contraloria </option>
					<option value="3"> Finanzas </option>
					<option value="4"> Gerencia General </option>
					<option value="5"> Gestion Humana </option>
					<option value="6"> Legal </option>
					<option value="7"> Riesgos y Logistica </option>
					<option value="8"> TI </option>
			        </select>
			        <br><br>  
			        <label for="recipient-name" class="control-label">2do Nivel</label>
			        <p id="alerticboTurno" class="text-danger" style='display:none;'></p>
			        <select class="form-control select2" name="c_turno" style="width: 100%;" id="cboNivel2">
			        <option value="0" disabled selected> --SELECCIONE-- </option>
			        <option value="1">Auditori 2 TEST </option>
					<option value="2">Auditoria Interna </option>
					<option value="3">Comites </option>
					<option value="4">Informes Auditoria </option>
			        </select>
			        <br><br>  
			        <label for="recipient-name" class="control-label">3er Nivel</label>
			        <p id="alerticboTurno" class="text-danger" style='display:none;'></p>
			        <select class="form-control select2" name="c_turno" style="width: 100%;" id="cboNivel3">
			        <option value="0" disabled selected> --SELECCIONE-- </option>
			        <option value="1" > 2017 </option>
			        <option value="2" > 2018 </option>
			        </select>
					<br><br>      
                    <div class="trans text-center text-white"> 
                    <button id="btnAgregarUnidadRed" name="singlebutton" class="btn btn-success  button_agregar_unidadRed"><i class="fa fa-plus"> Agregar</i></button> 
                    <button id="btnAgregarUnidadRed" name="singlebutton" class="btn btn-warning  button_agregar_unidadRed"><i class="fa fa-eraser"> Limpiar</i></button> 
                    </div>                                              
                    <hr>
                    <table class="table table-hover" id="tblUnidadRed">
					  <thead style="background-color: dark">
					    <tr>
					      <th scope="col">Unidad</th>
					      <th scope="col">Tipo de Acceso</th>
					      <th scope="col">1er Nivel</th>
					      <th scope="col">2do Nivel</th>
					      <th scope="col">3er Nivel</th>
					      <th scope="col">Acción</th>
					    </tr>
					  </thead>
					  <tbody id="tbodyUnidadRed">
					    
					  </tbody>
					</table>
                    <p id="mensajeRegistrar" class="text-danger" style='display:none;'></p> 
                    
           		</div>
                <div class="modal-footer">
                    <button id="btnGuardarUnidadRed" type="submit" class="btn btn-primary "><i class="fa fa-floppy-o"></i> Guardar</button>
                 	<button type="button" class="btn btn-danger " data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
                </div>                                                                   
         </div>
         </div>
  </div>

<!-- Fin Modal  Unidades de Red -->

<!-- Inicio Modal Nueva Carpeta -->
 <div class="modal fade" id="modalNuevaCarpeta" role="dialog" aria-labelledby="exampleModalLongTitle2" aria-hidden="true">
         <div class="modal-dialog" role="document">
         <div class="modal-content">
         	<div class="modal-header" style="background-color: #68DFF0">
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                   </button>
                   <h4 class="modal-title" id="exampleModalLongTitle2"><a style="color:white">CREACIÓN DE NUEVA CARPETA&nbsp;&nbsp;</a><a style="color:red;font-weight: bold;"></a></h4>
              </div>
              <div class="modal-body">
              
              		<label for="recipient-name" class="control-label">Ruta de la nueva carpeta</label>
                    <p id="" class="text-danger" style='display:none;'></p>
                   	<input type="text" style="width: 100%;" class="form-control" id="" >
                   	<br>
                   	<label for="recipient-name" class="control-label">Nombre de la carpeta</label>
                    <p id="" class="text-danger" style='display:none;'></p>
                   	<input type="text" style="width: 100%;" class="form-control" id="" >
                   	<br>
              	   	<label for="recipient-name" class="control-label">Usuarios con ESCRITURA</label>
                    <p id="" class="text-danger" style='display:none;'></p>
                   	<input type="text" style="width: 100%;" class="form-control" id="" >
              	   	<br>  
              	   	<label for="recipient-name" class="control-label">Usuarios con LECTURA</label>
                    <p id="" class="text-danger" style='display:none;'></p>
                   	<input type="text" style="width: 100%;" class="form-control" id="" >
              	   	<br> 
              	   	<label>Mantener herencia de permisos</label><br>
			 		<label class="radio-inline"><input type="radio" name="optradio">Si</label>
			 		<label class="radio-inline"><input type="radio" name="optradio">No</label>
                    <p id="" class="text-danger" style='display:none;'></p> 
                    
           		</div>
                <div class="modal-footer">
                    <button id="btnGuardarNuevaCarpeta" type="submit" class="btn btn-primary "><i class="fa fa-floppy-o"></i> Guardar</button>
                 	<button type="button" class="btn btn-danger " data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
                </div>                                                                   
         </div>
         </div>
  </div>

<!-- Fin Modal  Nueva Carpeta -->

<!-- Inicio Modal Equipo Movil -->
 <div class="modal fade" id="modalEquipoMovil" role="dialog" aria-labelledby="exampleModalLongTitle2" aria-hidden="true">
         <div class="modal-dialog" role="document">
         <div class="modal-content">
         	<div class="modal-header" style="background-color: #68DFF0">
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                   </button>
                   <h4 class="modal-title" id="exampleModalLongTitle2"><a style="color:white">EQUIPO MÓVIL&nbsp;&nbsp;</a><a style="color:red;font-weight: bold;"></a></h4>
              </div>
              <div class="modal-body">
              		
              		<label><input id="chkCelular" type="checkbox"/>Celular</label>
              		<br><br>
              	   	<label for="recipient-name" class="control-label">Operador : </label>
			        <p id="" class="text-danger" style='display:none;'></p>
			        <select class="form-control select2" name="c_turno" style="width: 100%;" id="cboOperadorCelular" disabled>
			         <option value="0" disabled selected> --SELECCIONE-- </option>
			         <option value="1"> BITEL </option>
			         <option value="2"> CLARO </option>
			         <option value="3"> ENTEL </option>
			         <option value="4"> MOVISTAR </option>
			        </select>
			        <br><br>
			        <label><input id="" type="checkbox" style="float:right"/>Plan de Datos &nbsp;&nbsp;</label>
			        <br><br>
			        <hr>
			        <label><input id="chkInternetMovil" type="checkbox"/>Internet Móvil</label>
                    <br><br>
              	   	<label for="recipient-name" class="control-label">Operador</label>
			        <p id="" class="text-danger" style='display:none;'></p>
			        <select class="form-control select2" name="c_turno" style="width: 100%;" id="cboOperadorInternetMovil" disabled>
			         <option value="0" disabled selected> --SELECCIONE-- </option>
			         <option value="1"> BITEL </option>
			         <option value="2"> CLARO </option>
			         <option value="3"> ENTEL </option>
			         <option value="4"> MOVISTAR </option>
			        </select>
			        <br>
			        <br>
                    <p id="" class="text-danger" style='display:none;'></p> 
                    </div>
                <div class="modal-footer">
                    <button id="btnGuardarEquipoMovil" type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> Guardar</button>
                 	<button type="btnCancelarEquipoMovil" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
                </div>                                                                   
         </div>
         </div>
  </div>

<!-- Fin Modal  Equipo Movil -->

<!-- Inicio Modal Correo Electronico -->
 <div class="modal fade" id="modalCorreoElectronico" role="dialog" aria-labelledby="exampleModalLongTitle2" aria-hidden="true">
         <div class="modal-dialog" role="document">
         <div class="modal-content">
         	<div class="modal-header" style="background-color: #68DFF0">
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                   </button>
                   <h4 class="modal-title" id="exampleModalLongTitle2"><a style="color:white">CORREO ELECTRÓNICO&nbsp;&nbsp;</a><a style="color:red;font-weight: bold;"></a></h4>
              </div>
              <div class="modal-body">
              		<label>Tipo de cuenta</label><br>
			 		<label class="radio-inline"><input type="radio" name="optradio" id="radioPersonal">Personal</label>
			 		<label class="radio-inline"><input type="radio" name="optradio" id="radioGenerica">Genérica</label>
                    <p id="" class="text-danger" style='display:none;'></p> 
                    <br><br>              
              		<label for="recipient-name" class="control-label">Propietario</label>
                    <p id="" class="text-danger" style='display:none;'></p>
                   	<input type="text" style="width: 100%;" class="form-control" id="inputPropietario" disabled>
                   	<br>
                   	<label for="recipient-name" class="control-label">Dirección</label>
                    <p id="" class="text-danger" style='display:none;'></p>
                   	<input type="text" style="width: 100%;" class="form-control" id="inputDireccion" disabled>
                   	<br>
              	   	<label for="recipient-name" class="control-label">Grupo de Correo</label>
                    <p id="" class="text-danger" style='display:none;'></p>
                   	<input type="text" style="width: 100%;" class="form-control" id="inputGrupoCorreo" disabled>
              	   	<br>  
           		</div>
                <div class="modal-footer">
                    <button id="btnGuardarCorreoElectronico" type="submit" class="btn btn-primary "><i class="fa fa-floppy-o"></i> Guardar</button>
                 	<button type="button" class="btn btn-danger " data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
                </div>                                                                   
         </div>
         </div>
  </div>

<!-- Fin Modal Correo Electronico -->


<!-- Inicio Modal INTERNET -->
 <div class="modal fade" id="modalInternet" role="dialog" aria-labelledby="exampleModalLongTitle2" aria-hidden="true">
         <div class="modal-dialog" role="document">
         <div class="modal-content">
         	  <div class="modal-header" style="background-color: #68DFF0">
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                   </button>
                   <h4 class="modal-title" id="exampleModalLongTitle2"><a style="color:white">INTERNET&nbsp;&nbsp;</a></h4>
              </div>
              <div class="modal-body">
              	<label for="recipient-name" class="control-label">Perfil</label>
			        <p id="" class="text-danger" style='display:none;'></p>
			        <select class="form-control select2" style="width: 100%;" id="cboInternet">
			         <option value="0" disabled selected> --SELECCIONE-- </option>
			         <option value="1"> Inet_Media </option>
					 <option value="1"> Inet_Directivos </option>
			        </select>
			        <br>
			        <br>
                    <p id="" class="text-danger" style='display:none;'></p>	
           	  </div>
              <div class="modal-footer">
                    <button id="btnGuardarInternet" type="submit" class="btn btn-primary "><i class="fa fa-floppy-o"></i> Guardar</button>
                 	<button type="button" class="btn btn-danger " data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
              </div>                                                                   
         </div>
         </div>
  </div>

<!-- Fin Modal INTERNET -->


<!-- Inicio Modal Puesto Trabajo -->
 <div class="modal fade" id="modalPuestoTrabajo" role="dialog" aria-labelledby="exampleModalLongTitle2" aria-hidden="true">
         <div class="modal-dialog" role="document">
         <div class="modal-content">
         	  <div class="modal-header" style="background-color: #68DFF0">
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                   </button>
                   <h4 class="modal-title" id="exampleModalLongTitle2"><a style="color:white">PUESTO DE TRABAJO&nbsp;&nbsp;</a></h4>
              </div>
              <div class="modal-body">
              		<label>Tipo de Activo</label><br>
			 		<label class="radio-inline"><input type="radio" name="optradio" id="radioDesktop">Desktop</label>
			 		<label class="radio-inline"><input type="radio" name="optradio" id="radioLaptop">Laptop</label>
                    <p id="" class="text-danger" style='display:none;'></p> 
                    <br><br> 
              		<label for="recipient-name" class="control-label">Acción</label>
			        <p id="" class="text-danger" style='display:none;'></p>
			        <select class="form-control select2" style="width: 100%;" id="cboPuestoTrabajo" disabled>
			         <option value="0" disabled selected> --SELECCIONE-- </option>
			         <option value="1"> Nueva Asignación </option>
					 <option value="2"> Reasignación </option>
			        </select>
			        <br><br>
			        <label for="recipient-name" class="control-label">Codigo de Activo</label>
                    <p id="" class="text-danger" style='display:none;'></p>
                   	<input type="text" style="width: 100%;" class="form-control" id="inputCodigoActivo" disabled>
              	   	<br>
                    <p id="" class="text-danger" style='display:none;'></p>	
           	  </div>
              <div class="modal-footer">
                    <button id="btnGuardarPuestoTrabajo" type="submit" class="btn btn-primary "><i class="fa fa-floppy-o"></i> Guardar</button>
                 	<button type="button" class="btn btn-danger " data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
              </div>                                                                   
         </div>
         </div>
  </div>

<!-- Fin Modal Puesto Trabajo -->

<!-- Inicio Equipo Telefonico  -->
 <div class="modal fade" id="modalEquipoTelefonico" role="dialog" aria-labelledby="exampleModalLongTitle2" aria-hidden="true">
         <div class="modal-dialog" role="document">
         <div class="modal-content">
         	  <div class="modal-header" style="background-color: #68DFF0">
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                   </button>
                   <h4 class="modal-title" id="exampleModalLongTitle2"><a style="color:white">EQUIPO TELEFÓNICO&nbsp;&nbsp;</a></h4>
              </div>
              <div class="modal-body">
              		<label for="recipient-name" class="control-label">Acción</label>
			        <p id="" class="text-danger" style='display:none;'></p>
			        <select class="form-control select2" style="width: 100%;" id="cboEquipoTelefonico">
			         <option value="0" disabled selected> --SELECCIONE-- </option>
			         <option value="1"> Nueva Asignación </option>
					 <option value="2"> Reasignación </option>
			        </select>
			        <br><br>
			        <label for="recipient-name" class="control-label">Número de Anexo</label>
                    <p id="" class="text-danger" style='display:none;'></p>
                   	<input type="text" style="width: 100%;" class="form-control" id="inputNumeroAnexo" disabled>
              	   	<br>
                    <p id="" class="text-danger" style='display:none;'></p>	
           	  </div>
              <div class="modal-footer">
                    <button id="btnGuardarEquipoTelefonico" type="submit" class="btn btn-primary "><i class="fa fa-floppy-o"></i> Guardar</button>
                 	<button type="button" class="btn btn-danger " data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
              </div>                                                                   
         </div>
         </div>
  </div>

<!-- Fin Modal Equipo Telefonico -->


<!-- Inicio Clave Llamadas  -->
 <div class="modal fade" id="modalClaveLlamada" role="dialog" aria-labelledby="exampleModalLongTitle2" aria-hidden="true">
         <div class="modal-dialog" role="document">
         <div class="modal-content">
         	  <div class="modal-header" style="background-color: #68DFF0">
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                   </button>
                   <h4 class="modal-title" id="exampleModalLongTitle2"><a style="color:white">CLAVE DE LLAMADAS&nbsp;&nbsp;</a></h4>
              </div>
              <div class="modal-body">
              		
              		<label for="recipient-name" class="control-label">Tipo de Salida:</label>
              		<br><br>
              		<label><input id="" type="checkbox" />Locales&nbsp;&nbsp;</label>
              		<label><input id="" type="checkbox" />Celulares&nbsp;&nbsp;</label>
			        <label><input id="" type="checkbox" />Nacionales&nbsp;&nbsp;</label>
              		<label><input id="" type="checkbox" />Internacionales&nbsp;&nbsp;</label>
			        <br>
              		<br>
                    <p id="" class="text-danger" style='display:none;'></p>	
           	  </div>
              <div class="modal-footer">
                    <button id="btnGuardarClaveLlamada" type="submit" class="btn btn-primary "><i class="fa fa-floppy-o"></i> Guardar</button>
                 	<button type="button" class="btn btn-danger " data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
              </div>                                                                   
         </div>
         </div>
  </div>
<!-- Fin Modal Clave Llamadas -->

<!-- Inicio Licenica O365  -->
 <div class="modal fade" id="modalLicenciaO365" role="dialog" aria-labelledby="exampleModalLongTitle2" aria-hidden="true">
         <div class="modal-dialog" role="document">
         <div class="modal-content">
         	  <div class="modal-header" style="background-color: #68DFF0">
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                   </button>
                   <h4 class="modal-title" id="exampleModalLongTitle2"><a style="color:white">LICENCIA O365&nbsp;&nbsp;</a></h4>
              </div>
              <div class="modal-body">
              		
              		<label>Tipo de licencia</label><br>
			 		<label class="radio-inline"><input type="radio" name="optradio" id="radioE1">E1</label>
			 		<label class="radio-inline"><input type="radio" name="optradio" id="radioE2">E2</label>
			        <br>
              		<br>
                    <p id="" class="text-danger" style='display:none;'></p>	
           	  </div>
              <div class="modal-footer">
                    <button id="btnGuardarLicenciaO365" type="submit" class="btn btn-primary "><i class="fa fa-floppy-o"></i> Guardar</button>
                 	<button type="button" class="btn btn-danger " data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
              </div>                                                                   
         </div>
         </div>
  </div>
<!-- Fin Modal Clave Llamadas -->

<!-- Inicio Otro Equipo  -->
 <div class="modal fade" id="modalOtroEquipo" role="dialog" aria-labelledby="exampleModalLongTitle2" aria-hidden="true">
         <div class="modal-dialog" role="document">
         <div class="modal-content">
         	  <div class="modal-header" style="background-color: #68DFF0">
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                   </button>
                   <h4 class="modal-title" id="exampleModalLongTitle2"><a style="color:white">OTRO EQUIPO&nbsp;&nbsp;</a></h4>
              </div>
              <div class="modal-body">
              		
              		<label for="recipient-name" class="control-label">Descripción</label>
                    <p id="" class="text-danger" style='display:none;'></p>
                   	<input type="text" style="width: 100%;" class="form-control" id="inputDescripcionOtroEquipo" >
              	   	<br>
                    <p id="" class="text-danger" style='display:none;'></p>	
           	  </div>
              <div class="modal-footer">
                    <button id="btnGuardarOtroEquipo" type="submit" class="btn btn-primary "><i class="fa fa-floppy-o"></i> Guardar</button>
                 	<button type="button" class="btn btn-danger " data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
              </div>                                                                   
         </div>
         </div>
  </div>
<!-- Fin Modal Clave Llamadas -->

<!-- /.row --> <!-- Main row -->
<div class="row container-fluid" id="divFormulario" style='display:block;'>

		<div class="box box-primary" style="max-width:90%;margin-left:auto;margin-right:auto;">
  		<div class="box-body">
  		<div class="row col-12 text-center">
		<img src="<%=request.getContextPath()%>/resources/image/smartRequestCabecera.jpg" class="img-fluid" alt="Responsive image">
  		</div>
  		
  		<div class="row col-12 text-right">
  			
			<label>N° Solicitud:&nbsp;&nbsp;</label><input  value="F000001" disabled/>&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<br><br>
		<div class="row container col-center">
  		<div class="col-md-1 center-block">
    		<input class="bg-green" style="width:130px; border: 0;outline: none;" disabled>
    		<small >NUEVO</small><br><br>
  		</div>
  		<div class="col-md-1 center-block">
    		<input class="bg-green" style="width:130px; border: 0;outline: none;" disabled>
    		<small >PENDIENTE REVISOR 1</small>
  		</div>&nbsp;
  		<div class="col-md-1 center-block">
    		<input  style="width:130px; border: 0;outline: none;" disabled>
    		<small >PENDIENTE REVISOR 2</small>
  		</div>&nbsp;
  		<div class="col-md-1 center-block">
    		<input  style="width:130px; border: 0;outline: none;" disabled>
    		<small >PENDIENTE REVISOR 3</small>
  		</div>&nbsp;
  		<div class="col-md-1 center-block">
    		<input  style="width:130px; border: 0;outline: none;"  disabled>
    		<small >PENDIENTE APROBADOR</small>
  		</div>&nbsp;
  		<div class="col-md-1 center-block">
    		<input  style="width:130px; border: 0;outline: none;"  disabled>
    		<small >PENDIENTE VISADOR</small>
  		</div>&nbsp;
  		<div class="col-md-1 center-block">
    		<input  style="width:130px; border: 0;outline: none;"  disabled>
    		<small >APROBADO</small><br><br>
  		</div>&nbsp;
  		<div class="col-md-1 center-block">
    		<input style="width:130px; border: 0;outline: none;"  disabled>
    		<small >CANCELADO</small><br><br>
  		</div>&nbsp;
  		</div>
  		
		<hr style="height:1.2px; background-color:black;"><br>

		<div class="panel panel-primary" style="max-width:90%;margin-left:auto;margin-right:auto;">
		  <div class="panel-heading">
		    <h3 class="panel-title">I. DATOS SOLICITANTE</h3>
		  </div>
		  <div class="panel-body">
		     <div class="col-md-3">
		  	 <label class="control-label">Empresa: </label>
	         <select class="form-control select2"  id="" >
	         <option value="0" disabled selected>--SELECCIONE--</option>
	         <option value="1"> AESA </option>
	         <option value="2"> CENTRIA </option>
			 <option value="3"> AESA </option>
			 <option value="4"> APORTA </option>
			 <option value="5"> URBANOVA </option>
			 <option value="6"> PROTEPERSA </option>
			 <option value="7"> ESTRATEGICA </option>
			 <option value="8"> BRECA </option>
	         </select>
			 </div>
			 <div class="col-md-4">
			 <label for="email">Nombres y Apellidos:</label>
			 <input type="text" class="form-control" id="txtUsuarioRegistro" disabled>
			 </div>
			 <div class="col-md-3">
			 <label for="email">Correo:</label>
			 <input type="email" class="form-control" id="txtCorreoRegistro" disabled>
			 </div>
			 <div class="col-md-2">
			 <label for="pwd">Fecha de Solicitud:</label>
			 <input type="date" class="form-control" id="txtFechaRegistro" disabled>
			 </div>
		 </div>	
		</div>
			
		<div class="panel panel-primary" style="max-width:90%;margin-left:auto;margin-right:auto;">
		  <div class="panel-heading">
		    <h3 class="panel-title">II. DATOS PERSONALES</h3>
		  </div>
		  <div class="panel-body">
		  <div class="row">
		  	 <div class="col-md-2">
			 <label for="email">DNI/CE:</label>
			 <input type="text" class="form-control" >
			 </div>
			 <div class="col-md-2">
			 <label for="email">Primer Nombre:</label>
			 <input type="text" class="form-control" >
			 </div>
		     <div class="col-md-2">
			 <label for="email">Segundo Nombre:</label>
			 <input type="text" class="form-control" >
			 </div>
			 <div class="col-md-2">
			 <label for="email">Apellido Paterno:</label>
			 <input type="text" class="form-control" >
			 </div>
			 <div class="col-md-2">
			 <label for="email">Apellido Materno:</label>
			 <input type="text" class="form-control" >
			 </div>
			 <div class="col-md-2">
			 <label class="control-label" >Anexo de contacto</label>
			 <input type="text" class="form-control">
			 </div>
		  </div>
		  <br>
		  <div class="row">
			 
			  <div class="col-md-3">
			 <label class="control-label">Gerencia: </label>
	         <select class="form-control select2"  id="" >
	         <option value="0" disabled selected>--SELECCIONE--</option>
	         <option value="1"> Finanzas </option>
	         <option value="2"> Logistica </option>
	         <option value="3"> Sistemas </option>
	         </select>
	         </div>
	         <div class="col-md-3">
	         <label class="control-label">Area: </label>
	         <select class="form-control select2"  id="" >
	         <option value="0" disabled selected>--SELECCIONE--</option>
	         <option value="1"> Almacen </option>
	         <option value="2"> Inventarios </option>
	         <option value="3"> Cargos </option>
	         </select>
	         </div>
	         <div class="col-md-3">
			 <label for="email">Cargo</label>
			 <input type="text" class="form-control" >
			 </div>
			 <div class="col-md-3">
			 <label class="control-label">Sede: </label>
	         <select class="form-control select2"  id="" >
	         <option value="0" disabled selected>--SELECCIONE--</option>
	         <option value="1"> TORRE BEGONIAS </option>
			 <option value="2"> LA RAMBLA BRASIL  </option>
			 <option value="3"> UNIDAD SAN RAFAEL </option>
			 <option value="4"> TORRE DEL ARTE  </option>
			 <option value="5"> PLAZA DEL SOL   </option>
			 <option value="6"> UNIDAD CARAHUACRA  </option>
			 <option value="7"> UNIDAD RAURA   </option>
			 <option value="8"> UNIDAD SAN CRISTOBAL   </option>
			 <option value="9"> RAMBLA SAN BORJA - TORRE I Y TORRE II  </option>
			 <option value="10"> TORRE TRAZO    </option>
			 <option value="11"> TORRE DEL PARQUE      </option>
			 <option value="12"> CENTRAL 652    </option>
			 <option value="13"> ALTO CARAL   </option>
			 <option value="14"> CONSORCIO    </option>
			 <option value="15"> UNIDAD CERRO LINDO     </option>
			 <option value="16"> UNIDAD TICLLIO </option>
			 <option value="17"> UNIDAD YANACOCHA </option>
			 <option value="18"> OFICINA CHINCHON     </option>
			 <option value="19"> UNIDAD COLQUISIRI  </option>
			 <option value="20"> UNIDAD REGINA  </option>
			 <option value="21"> UNIDAD TUNEL INTEGRACION  </option>
			 <option value="22"> CHINCHA </option>
			 <option value="23"> MOLINA PLAZA   </option>
			 <option value="24"> VÍCTOR ANDRÉS BELAUNDE 332  </option>
			 <option value="25"> PASO 28 DE JULIO  </option>
			 <option value="26"> UNIDAD MARTA </option>
	         </select>
	         </div>
		  </div>
		  </div>
		</div>
		
		<div class="panel panel-primary" style="max-width:90%;margin-left:auto;margin-right:auto;">
		  <div class="panel-heading">
		    <h3 class="panel-title">III. TIPO DE SOLICITUD</h3>
		  </div>
		  <div class="panel-body">
		  <div class="row">
		  	<div class="col-md-3">
		  	 <label class="control-label">Tipo: </label>
	         <select class="form-control select2"   id="idcboTipoSolicitud" >
	         <option value="0" disabled selected>--SELECCIONE--</option>
	         <option value="1"> ALTA </option>
	         <option value="2"> MODIFICACIÓN </option>
	         <option value="3"> BAJA </option>
	         </select>
			 </div>
			 <div class="col-md-3">
		  	 <label class="control-label">Acción: </label>
	         <select class="form-control select2"   id="idcboAccion" disabled>
	         <option value="0" disabled selected>--SELECCIONE--</option>
	         </select>
			 </div>
			 <div class="col-md-3">
			 <label for="pwd">Fecha de Ingreso:</label>
			 <input type="date" class="form-control datepicker" id="">
			 </div>
			 <div class="col-md-3">
			 <label for="pwd">Fecha de Retiro:</label>
			 <input type="date" class="form-control" id="">
			 </div>
		   </div>
		  </div>
		</div>
		
		<div class="panel panel-primary" style="max-width:90%;margin-left:auto;margin-right:auto;">
		  <div class="panel-heading">
		    <h3 class="panel-title">IV. SERVICIOS</h3>
		  </div>
		  <div class="panel-body">
		  
		  <div class="row">
		  <div class="col-md-2">Acceso a Unidades de red </div>
		  <div class="col-md-4"><label><input id="chkUnidadRed" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputUnidadRed" disabled/>
		  <button title="Editar" type="button" class="btn btn-primary btn-ls" id="btnEditarUnidadRed" data-toggle="modal" data-target="#modalUnidadRed" disabled><i class="fa fa-edit"> Editar</i></button>
		  </div>		  
		  <div class="col-md-2">Creación de Nueva Carpeta </div>
		  <div class="col-md-4"><label><input id="chkNuevaCarpeta" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputNuevaCarpeta" disabled>
		  <button title="Editar" type="button" class="btn btn-primary btn-ls" id="btnEditarNuevaCarpeta" data-toggle="modal" data-target="#modalNuevaCarpeta" disabled><i class="fa fa-edit"> Editar</i></button>
		  </div>
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-md-2">Equipo Móvil </div>
		  <div class="col-md-4"><label><input id="chkEquipoMovil" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputEquipoMovil" disabled>
		  <button title="Editar" type="button" class="btn btn-primary btn-ls" id="btnEditarEquipoMovil" data-toggle="modal" data-target="#modalEquipoMovil" disabled><i class="fa fa-edit"> Editar</i></button>
		  </div>		  
		  <div class="col-md-2">Correo Electrónico </div>
		  <div class="col-md-4"><label><input id="chkCorreoElectronico" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputCorreoElectronico" disabled>
		  <button title="Editar" type="button" class="btn btn-primary btn-ls" id="btnEditarCorreoElectronico" data-toggle="modal" data-target="#modalCorreoElectronico" disabled><i class="fa fa-edit"> Editar</i></button>
		  </div>
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-md-2">Internet </div>
		  <div class="col-md-4"><label><input id="chkInternet"  type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputInternet" disabled>
		  <button title="Editar" type="button" class="btn btn-primary btn-ls" id="btnEditarInternet" data-toggle="modal" data-target="#modalInternet" disabled ><i class="fa fa-edit"> Editar</i></button>
		  </div>		  
		  <div class="col-md-2">Puesto de Trabajo</div>
		  <div class="col-md-4"><label><input id="chkPuestoTrabajo" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputPuestoTrabajo" disabled>
		  <button title="Editar" type="button" class="btn btn-primary btn-ls" id="btnEditarPuestoTrabajo" data-toggle="modal" data-target="#modalPuestoTrabajo" disabled ><i class="fa fa-edit"> Editar</i></button>
		  </div>
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-md-2">Equipo Telefónico</div>
		  <div class="col-md-4"><label><input id="chkEquipoTelefonico" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputEquipoTelefonico" disabled>
		  <button title="Editar" type="button" class="btn btn-primary btn-ls" id="btnEditarEquipoTelefonico" data-toggle="modal" data-target="#modalEquipoTelefonico" disabled ><i class="fa fa-edit"> Editar</i></button>
		  </div>		  
		  <div class="col-md-2">Clave de Llamadas</div>
		  <div class="col-md-4"><label><input id="chkClaveLlamada" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputClaveLlamada" disabled>
		  <button title="Editar" type="button" class="btn btn-primary btn-ls" id="btnEditarClaveLlamada" data-toggle="modal" data-target="#modalClaveLlamada" disabled><i class="fa fa-edit"> Editar</i></button>
		  </div>
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-md-2">Licencia O365 </div>
		  <div class="col-md-4"><label><input id="chkLicenciaO365" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputLicenciaO365" disabled>
		  <button title="Editar" type="button" class="btn btn-primary btn-ls" id="btnEditarLicenciaO365" data-toggle="modal" data-target="#modalLicenciaO365" disabled><i class="fa fa-edit"> Editar</i></button>
		  </div>
		  <div class="col-md-2">Clave Impresión </div>
		  <div class="col-md-4"><label><input id="chkClaveImpresion" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputClaveImpresion" disabled>
		  </div>		  
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-md-2">Otro Equipo </div>
		  <div class="col-md-4"><label><input id="chkOtroEquipo" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputOtroEquipo" disabled>
		  <button title="Editar" type="button" class="btn btn-primary btn-ls" id="btnEditarOtroEquipo" data-toggle="modal" data-target="#modalOtroEquipo" disabled><i class="fa fa-edit"> Editar</i></button>
		  </div>		  
		  </div>
		  
		  </div> <!-- Fin panel body -->
		  </div> <!-- Fin panel SERVICIOS -->
		  
		<div class="panel panel-primary" style="max-width:90%;margin-left:auto;margin-right:auto;">
		  <div class="panel-heading">
		    <h3 class="panel-title">V. APLICACIONES</h3>
		  </div>
		  <div class="panel-body">
		  <div class="row">
		  <div class="col-md-2">Hyperion - HFM</div>
		  <div class="col-md-4"><label><input id="chkHyperionHFM" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputHyperionHFM" disabled>
		  </div>
		  <div class="col-md-2">DLO (Backup "Mis Documentos")</div>
		  <div class="col-md-4"><label><input id="chkDLO" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputDLO" disabled>
		  </div>
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-md-2">Hyperion - FCM</div>
		  <div class="col-md-4"><label><input id="chkHyperionFCM" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputHyperionFCM" disabled>
		  </div>
		  <div class="col-md-2">Hyperion - Planing</div>
		  <div class="col-md-4"><label><input id="chkHyperionPlaning" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputHyperionPlaning" disabled>
		  </div>	
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-md-2">Hyperion - OBI</div>
		  <div class="col-md-4"><label><input id="chkHyperionOBI" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputHyperionOBI" disabled>
		  </div>
		  <div class="col-md-2">Onbase</div>
		  <div class="col-md-4"><label><input id="chkOnbase" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputOnbase" disabled>
		  </div>
		  </div>
		  <br>  
		  <div class="row">
		  <div class="col-md-2">Sist. encriptación (SYMANTEC)</div>
		  <div class="col-md-4"><label><input id="chkSistEncriptacion" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputSistEncriptacion" disabled>
		  </div>
		  <div class="col-md-2">Cloud - Backup</div>
		  <div class="col-md-4"><label><input id="chkCloudBackup" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputCloudBackup" disabled>
		  </div>
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-md-2">Portal Logistico</div>
		  <div class="col-md-4"><label><input id="chkPortalLogistico" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputPortalLogistico" disabled>
		  </div>
		  <div class="col-md-2">VPN (Especificar si el generador de clave  se instalará en Laptop y/o Smartphone)</div>
		  <div class="col-md-4"><label><input id="chkVPN" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputVPN" disabled>
		  </div>
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-md-2">Administrador local (Colocar justificación)</div>
		  <div class="col-md-4"><label><input id="chkAdministradorLocal" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputAdministradorLocal" disabled>
		  </div>		  
		  <div class="col-md-2">GIT</div>
		  <div class="col-md-4"><label><input id="chkGIT" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputGIT" disabled>
		  </div>
		  </div>
		  <br>  
		  <div class="row">
		  <div class="col-md-2">SAP Portal</div>
		  <div class="col-md-4"><label><input id="chkSapPortal" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputSapPortal" disabled>
		  </div>
		  <div class="col-md-2">Sistema de Asignación</div>
		  <div class="col-md-4"><label><input id="chkSistemaAsignacion" type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputSistemaAsignacion" disabled>
		  </div>
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-md-2">Otros (Especificar aplicación)</div>
		  <div class="col-md-4"><label><input id="chkOtros"  type="checkbox"/></label>
		  <input type="text" style="width:70%;" value="No Requerido" class="text-center" id="inputOtros" disabled>
		  </div>
		  </div>
		  <br>
		  </div>
		</div>
		<div class="panel panel-primary" style="max-width:90%;margin-left:auto;margin-right:auto;">
		  <div class="panel-heading">
		    <h3 class="panel-title text-center">APROBADORES</h3>
		  </div>
		  <div class="panel-body">
		  <div class="row bg-info">
		  <div class="col-md-2">Revisor 1 </div>
		  <div class="col-md-4"><input type="text" style="width:100%;" value="Anthony Canales" disabled></div>
		  <div class="col-md-6"><i class="fa fa-clock-o fa-2x" style="color:#51acc7"></i></div>		  
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-md-2">Revisor 2 </div>
		  <div class="col-md-4"><input type="text" style="width:100%;" disabled></div>
		  <div class="col-md-6"></i></div>		  
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-md-2">Revisor 3 </div>
		  <div class="col-md-4"><input type="text" style="width:100%;" disabled></div>
		  <div class="col-md-6"></i></div>		  
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-md-2">Aprobador</div>
		  <div class="col-md-4"><input type="text" style="width:100%;" value="Anthony Canales" disabled></div>
		  <div class="col-md-6"><i class="fa fa-clock-o fa-2x" style="color:#51acc7"></i></div>		  
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-md-2">Visador</div>
		  <div class="col-md-4"><input type="text" style="width:100%;" value="Anthony Canales" disabled></div>
		  <div class="col-md-6"><i class="fa fa-clock-o fa-2x" style="color:#51acc7"></i></div>		  
		  </div>
		  <br>
		  </div>
		</div>
		<!-- correcto -->
		<div class="trans text-center"> 
		    <button id="btnAprobar" name="singlebutton" class="btn btn-success btn-lg"><i class="fa fa-check"> Aprobar</i></button> 
		    <button id="btnRechazar" name="singlebutton" class="btn btn-danger btn-lg"><i class="fa fa-times"> Rechazar</i></button> 
		</div>
		
	
</div>
</div>
</div>
<!-- /.row (main row) --> 

<div class="row container-fluid" id="divConfirmacion" style='display:none;'>

		<div class="panel panel-success" style="max-width:60%;margin-left:auto;margin-right:auto;">
		  <div class="panel-heading">
		    <h3 class="panel-title">CONFIRMACIÓN</h3>
		  </div>
		  <div class="panel-body text-center">

			 <i class="fa fa-check-circle fa-pull-center text-green" style="font-size:5em;"></i>
			 <h4>Usted ha aprobado la solicitud F000001.</h4>
			 <h4><i class="fa fa-envelope"></i>  Se ha enviado una notificación al siguiente Aprobador.</h4>

		</div> <!-- Fin Panel TBODY -->
		</div> <!-- Fin Panel CONFIRMACIÓN -->
</div>


</section><!-- /.content --> </aside>
<!-- /.right-side -->

<script type="text/javascript">
$(document).ready(function() {

});
	

//Acciones Boton Registrar Formulario
	$('#btnAprobar').click(function(){
		document.getElementById('divFormulario').style.display = 'none';	
		document.getElementById('divConfirmacion').style.display = 'block';
		$("#aside").addClass("sizeHeight");
	});
	
	$('#btnRechazar').click(function(){
		
	});
	
	
//Funciones Modal Unidad de Red

	//Agregar fila nueva tabla Unidad de Red. 	
	$('#btnAgregarUnidadRed').click(function(){
	
	var unidad = $('#cboUnidadRed option:selected').text();
	var tipo = $('#cboTipoAcceso option:selected').text();
	var nivel1 = $('#cboNivel1 option:selected').text();
	var nivel2 = $('#cboNivel2 option:selected').text();
	var nivel3 = $('#cboNivel3 option:selected').text();
	
	$('#tbodyUnidadRed').append('<tr>'+
		      '<td>'+unidad+'</td>'+
		      '<td>'+tipo+'</td>'+
		      '<td>'+nivel1+'</td>'+
		      '<td>'+nivel2+'</td>'+
		      '<td>'+nivel3+'</td>'+
		      '<td><button title="Eliminar" type="button" class="btn btn-danger btn-ls btnEliminarUnidadRed" ><i class="fa fa-trash fa-sm"></i></button></td>'+
		      '</tr>')
	});


	//Eliminar fila tabla Unidad de Red. 
	   $('#tblUnidadRed').on('click', '.btnEliminarUnidadRed', function(){
	      $(this).parents('tr').eq(0).remove();
	   });
	//Activar/Desactivar Servicio  Unidad de Red
	   $("#chkUnidadRed").on( 'change', function() {
		    if( $(this).is(':checked') ) {
		        // Hacer algo si el checkbox ha sido seleccionado
		       $("#modalUnidadRed").modal('show');
		    } else {
		        // Hacer algo si el checkbox ha sido deseleccionado
		        $("#inputUnidadRed").val('No Requerido');
		    	$("#btnEditarUnidadRed").attr('disabled', 'disabled');
		    }
		});
	   
	 //Guardar Unidad de Red
	 $('#btnGuardarUnidadRed').click(function(){
		 	   $("#modalUnidadRed").modal('hide');
		 	   $("#inputUnidadRed").val('Requerido');
		 	   $("#btnEditarUnidadRed").removeAttr('disabled');
		 	  
	 });
	 
//Funciones Modal Nueva Carpeta

		//Activar/Desactivar Servicio Nueva Carpeta
		   $("#chkNuevaCarpeta").on( 'change', function() {
			    if( $(this).is(':checked') ) {
			        // Hacer algo si el checkbox ha sido seleccionado
			       $("#modalNuevaCarpeta").modal('show');
			    } else {
			        // Hacer algo si el checkbox ha sido deseleccionado
			        $("#inputNuevaCarpeta").val('No Requerido');
			    	$("#btnEditarNuevaCarpeta").attr('disabled', 'disabled');
			    }
			});
		   
		 //Guardar Unidad de Red
		 $('#btnGuardarNuevaCarpeta').click(function(){
			 	   $("#modalNuevaCarpeta").modal('hide');
			 	   $("#inputNuevaCarpeta").val('Requerido');
			 	   $("#btnEditarNuevaCarpeta").removeAttr('disabled');
			 	  
		 });
	 

		 
		 
//Funciones Modal Equipo Móvil

	 //Activar/Desactivar combo Celular Operador
	  	$("#chkCelular").on( 'change', function() {
    	if( $(this).is(':checked') ) {
        // Hacer algo si el checkbox ha sido seleccionado
      	$("#cboOperadorCelular").removeAttr('disabled');
    	} else {
        // Hacer algo si el checkbox ha sido deseleccionado
    	$("#cboOperadorCelular").attr('disabled', 'disabled');
    	}
	  	});
	 //Activar/Desactivar combo Celular Internet Móvil
	  	$("#chkInternetMovil").on( 'change', function() {
    	if( $(this).is(':checked') ) {
        // Hacer algo si el checkbox ha sido seleccionado
      	$("#cboOperadorInternetMovil").removeAttr('disabled');
    	} else {
        // Hacer algo si el checkbox ha sido deseleccionado
    	$("#cboOperadorInternetMovil").attr('disabled', 'disabled');
    	}
	  	});
	  
	 //Activar/Desactivar Servicio  Equipo Movil
		   $("#chkEquipoMovil").on( 'change', function() {
			    if( $(this).is(':checked') ) {
			        // Hacer algo si el checkbox ha sido seleccionado
			       $("#modalEquipoMovil").modal('show');
			    } else {
			        // Hacer algo si el checkbox ha sido deseleccionado
			        $("#inputEquipoMovil").val('No Requerido');
			    	$("#btnEditarEquipoMovil").attr('disabled', 'disabled');
			    }
			});

	  //Guardar Equipo Movil
		 $('#btnGuardarEquipoMovil').click(function(){
			 	   $("#modalEquipoMovil").modal('hide');
			 	   $("#inputEquipoMovil").val('Requerido');
			 	   $("#btnEditarEquipoMovil").removeAttr('disabled');
			 	  
		 });
	 
	  
//Funciones Modal Correo Electronico

			//Activar/Desactivar Servicio Correo Electronico
			   $("#chkCorreoElectronico").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				        // Hacer algo si el checkbox ha sido seleccionado
				       $("#modalCorreoElectronico").modal('show');
				    } else {
				        // Hacer algo si el checkbox ha sido deseleccionado
				        $("#inputCorreoElectronico").val('No Requerido');
				    	$("#btnEditarCorreoElectronico").attr('disabled', 'disabled');
				    }
				});
			   
			 //Guardar Correo Electronico
			 $('#btnGuardarCorreoElectronico').click(function(){
				 	   $("#modalCorreoElectronico").modal('hide');
				 	   $("#inputCorreoElectronico").val('Requerido');
				 	   $("#btnEditarCorreoElectronico").removeAttr('disabled');
			 });
			 
			 //Opción Cuenta Personal Activar campos
			 $('#radioPersonal').click(function(){
				 $("#inputPropietario").val('');
				 $("#inputDireccion").removeAttr('disabled');
				 $("#inputGrupoCorreo").removeAttr('disabled');
			 });
			 
			//Opción Cuenta Generica Activar campos
			 $('#radioGenerica').click(function(){
				 $("#inputPropietario").val('ajcanale@pe.ibm.com');
				 $("#inputDireccion").removeAttr('disabled');
				 $("#inputGrupoCorreo").removeAttr('disabled');
			 });


//Funciones Modal INTERNET

				//Activar/Desactivar Servicio Internet
				   $("#chkInternet").on( 'change', function() {
					    if( $(this).is(':checked') ) {
					        // Hacer algo si el checkbox ha sido seleccionado
					       $("#modalInternet").modal('show');
					    } else {
					        // Hacer algo si el checkbox ha sido deseleccionado
					        $("#inputInternet").val('No Requerido');
					    	$("#btnEditarInternet").attr('disabled', 'disabled');
					    }
					});
				   
				 //Guardar Internet
				 $('#btnGuardarInternet').click(function(){
					 	   $("#modalInternet").modal('hide');
					 	   $("#inputInternet").val('Requerido');
					 	   $("#btnEditarInternet").removeAttr('disabled');
				 });

				 
//Funciones Modal PUESTO DE TRABAJO

				 //Activar/Desactivar Puesto de Trabajo
				 $("#chkPuestoTrabajo").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				       $("#modalPuestoTrabajo").modal('show');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputPuestoTrabajo").val('No Requerido');
				   	   $("#btnEditarPuestoTrabajo").attr('disabled', 'disabled');
				    }
				  });
				  
				 //Guardar Puesto de Trabajo
				 $('#btnGuardarPuestoTrabajo').click(function(){
				    $("#modalPuestoTrabajo").modal('hide');
				    $("#inputPuestoTrabajo").val('Requerido');
				    $("#btnEditarPuestoTrabajo").removeAttr('disabled');
				 });
				 
				 //Opción Tipo de activo - Activación combo Accion
				 $('#radioDesktop').click(function(){
					 $("#cboPuestoTrabajo").removeAttr('disabled');
				 });
				 $('#radioLaptop').click(function(){
					 $("#cboPuestoTrabajo").removeAttr('disabled');
				 });

				 //Activación/Desactivación Codigo Activo
				 $("#cboPuestoTrabajo").on( 'change', function() {
						
						var option = $("#cboPuestoTrabajo").val();
						
						switch(option){
						
						case "1":
							$("#inputCodigoActivo").attr('disabled', 'disabled');
							break;
						case "2":
							$("#inputCodigoActivo").removeAttr('disabled');
							break;						
						}
				 });


//Funciones Modal EQUIPO TELEFONICO

				 //Activar/Desactivar servicio Equipo Telefonico
				 $("#chkEquipoTelefonico").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				       $("#modalEquipoTelefonico").modal('show');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputEquipoTelefonico").val('No Requerido');
				   	   $("#btnEditarEquipoTelefonico").attr('disabled', 'disabled');
				    }
				  });
				  
				 //Guardar Equipo Telefonico
				 $('#btnGuardarEquipoTelefonico').click(function(){
				    $("#modalEquipoTelefonico").modal('hide');
				    $("#inputEquipoTelefonico").val('Requerido');
				    $("#btnEditarEquipoTelefonico").removeAttr('disabled');
				 });
				 
				 //Activación/Desactivación Numero Anexo
				 $("#cboEquipoTelefonico").on( 'change', function() {
						
						var option = $("#cboEquipoTelefonico").val();
						
						switch(option){
						
						case "1":
							$("#inputNumeroAnexo").attr('disabled', 'disabled');
							break;
						case "2":
							$("#inputNumeroAnexo").removeAttr('disabled');
							break;						
						}
				 });
				 
				 
//Funciones Modal CLAVE DE LLAMADAS

				 //Activar/Desactivar servicio Clave de Llamadas
				 $("#chkClaveLlamada").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				       $("#modalClaveLlamada").modal('show');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputClaveLlamada").val('No Requerido');
				   	   $("#btnEditarClaveLlamada").attr('disabled', 'disabled');
				    }
				  });
				  
				 //Guardar Clave de Llamadas
				 $('#btnGuardarClaveLlamada').click(function(){
				    $("#modalClaveLlamada").modal('hide');
				    $("#inputClaveLlamada").val('Requerido');
				    $("#btnEditarClaveLlamada").removeAttr('disabled');
				 });
	
				 
//Funciones Modal LICENCIA O365

				 //Activar/Desactivar Puesto de Trabajo
				 $("#chkLicenciaO365").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				       $("#modalLicenciaO365").modal('show');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputLicenciaO365").val('No Requerido');
				   	   $("#btnEditarLicenciaO365").attr('disabled', 'disabled');
				    }
				  });
				  
				 //Guardar Puesto de Trabajo
				 $('#btnGuardarLicenciaO365').click(function(){
				    $("#modalLicenciaO365").modal('hide');
				    $("#inputLicenciaO365").val('Requerido');
				    $("#btnEditarLicenciaO365").removeAttr('disabled');
				 });				 

				
//Funciones Modal CLAVE DE IMPRESION

				 //Activar/Desactivar Puesto de Trabajo
				 $("#chkClaveImpresion").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
					   $("#inputClaveImpresion").val('Requerido');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputClaveImpresion").val('No Requerido');
				    }
				  });
				  
				 
//Funciones Modal OTRO EQUIPO

				 //Activar/Desactivar Puesto de Trabajo
				 $("#chkOtroEquipo").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				       $("#modalOtroEquipo").modal('show');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputOtroEquipo").val('No Requerido');
				   	   $("#btnEditarOtroEquipo").attr('disabled', 'disabled');
				    }
				  });
				  
				 //Guardar Puesto de Trabajo
				 $('#btnGuardarOtroEquipo').click(function(){
				    $("#modalOtroEquipo").modal('hide');
				    $("#inputOtroEquipo").val('Requerido');
				    $("#btnEditarOtroEquipo").removeAttr('disabled');
				 });				 
	

//Funciones PANEL APLICACIONES

				 //Activar/Desactivar HyperionHFM
				 $("#chkHyperionHFM").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				    	$("#inputHyperionHFM").removeAttr('disabled');
				    	$("#inputHyperionHFM").val('');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputHyperionHFM").val('No Requerido');
				   	   $("#inputHyperionHFM").attr('disabled', 'disabled');
				    }
				  });
				  
				//Activar/Desactivar DLO
				 $("#chkDLO").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				    	$("#inputDLO").removeAttr('disabled');
				    	$("#inputDLO").val('');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputDLO").val('No Requerido');
				   	   $("#inputDLO").attr('disabled', 'disabled');
				    }
				  });
				
				//Activar/Desactivar DLO
				 $("#chkHyperionFCM").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				    	$("#inputHyperionFCM").removeAttr('disabled');
				    	$("#inputHyperionFCM").val('');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputHyperionFCM").val('No Requerido');
				   	   $("#inputHyperionFCM").attr('disabled', 'disabled');
				    }
				  });
				
				//Activar/Desactivar HyperionPlaning
				 $("#chkHyperionPlaning").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				    	$("#inputHyperionPlaning").removeAttr('disabled');
				    	$("#inputHyperionPlaning").val('');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputHyperionPlaning").val('No Requerido');
				   	   $("#inputHyperionPlaning").attr('disabled', 'disabled');
				    }
				  });
				
				//Activar/Desactivar HyperionOBI
				 $("#chkHyperionOBI").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				    	$("#inputHyperionOBI").removeAttr('disabled');
				    	$("#inputHyperionOBI").val('');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputHyperionOBI").val('No Requerido');
				   	   $("#inputHyperionOBI").attr('disabled', 'disabled');
				    }
				  });
				 
				//Activar/Desactivar Onbase
				 $("#chkOnbase").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				    	$("#inputOnbase").removeAttr('disabled');
				    	$("#inputOnbase").val('');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputOnbase").val('No Requerido');
				   	   $("#inputOnbase").attr('disabled', 'disabled');
				    }
				  });
				
				//Activar/Desactivar SistEncriptacion
				 $("#chkSistEncriptacion").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				    	$("#inputSistEncriptacion").removeAttr('disabled');
				    	$("#inputSistEncriptacion").val('');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputSistEncriptacion").val('No Requerido');
				   	   $("#inputSistEncriptacion").attr('disabled', 'disabled');
				    }
				  });
				
				//Activar/Desactivar CloudBackup
				 $("#chkCloudBackup").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				    	$("#inputCloudBackup").removeAttr('disabled');
				    	$("#inputCloudBackup").val('');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputCloudBackup").val('No Requerido');
				   	   $("#inputCloudBackup").attr('disabled', 'disabled');
				    }
				  });
				
				//Activar/Desactivar PortalLogistico
				 $("#chkPortalLogistico").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				    	$("#inputPortalLogistico").removeAttr('disabled');
				    	$("#inputPortalLogistico").val('');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputPortalLogistico").val('No Requerido');
				   	   $("#inputPortalLogistico").attr('disabled', 'disabled');
				    }
				  });
				
				//Activar/Desactivar VPN
				 $("#chkVPN").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				    	$("#inputVPN").removeAttr('disabled');
				    	$("#inputVPN").val('');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputVPN").val('No Requerido');
				   	   $("#inputVPN").attr('disabled', 'disabled');
				    }
				  });
				
				//Activar/Desactivar AdministradorLocal
				 $("#chkAdministradorLocal").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				    	$("#inputAdministradorLocal").removeAttr('disabled');
				    	$("#inputAdministradorLocal").val('');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputAdministradorLocal").val('No Requerido');
				   	   $("#inputAdministradorLocal").attr('disabled', 'disabled');
				    }
				  });
				
				//Activar/Desactivar GIT
				 $("#chkGIT").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				    	$("#inputGIT").removeAttr('disabled');
				    	$("#inputGIT").val('');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputGIT").val('No Requerido');
				   	   $("#inputGIT").attr('disabled', 'disabled');
				    }
				  });
				
				//Activar/Desactivar SapPortal
				 $("#chkSapPortal").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				    	$("#inputSapPortal").removeAttr('disabled');
				    	$("#inputSapPortal").val('');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputSapPortal").val('No Requerido');
				   	   $("#inputSapPortal").attr('disabled', 'disabled');
				    }
				  });
				
				//Activar/Desactivar SistemaAsignacion
				 $("#chkSistemaAsignacion").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				    	$("#inputSistemaAsignacion").removeAttr('disabled');
				    	$("#inputSistemaAsignacion").val('');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputSistemaAsignacion").val('No Requerido');
				   	   $("#inputSistemaAsignacion").attr('disabled', 'disabled');
				    }
				  });
				
				//Activar/Desactivar Otros
				 $("#chkOtros").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				    	$("#inputOtros").removeAttr('disabled');
				    	$("#inputOtros").val('');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $("#inputOtros").val('No Requerido');
				   	   $("#inputOtros").attr('disabled', 'disabled');
				    }
				  });
				
//Funciones PANEL TIPO DE SOLICITUD			 
	$("#idcboTipoSolicitud").on( 'change', function() {
		
	var option = $("#idcboTipoSolicitud").val();
	
	$("#idcboAccion option").remove();
	$("#idcboAccion").append(
	  			$('<option>',{
	  				value: "0",
	  				text: " --SELECCIONE-- ",
	  				selected: true,
	  				disabled: true
	  			})		
	  		);
	
	var optionSelect = [];

	switch(option){
	
	case "1":
		$("#idcboAccion").removeAttr('disabled');

		
		optionSelect.push("Usuario Nuevo");
		optionSelect.push("Usuario Temporal");
		optionSelect.push("Traslado de Empresa");
		
		for(i = 0; i < optionSelect.length ; i++){
				  
				$('#idcboAccion').append(
	    	  			$('<option>',{
	    	  				value: i+1,
	    	  				text: optionSelect[i]
	    	  			})		
	    	  		);
			  }	
		break;
	case "2":
		$("#idcboAccion").removeAttr('disabled');
		optionSelect.push("Adición");
		optionSelect.push("Retirar");
		optionSelect.push("Cambio de Area y/o Puesto");
		
		for(i = 0; i < optionSelect.length ; i++){
				  
				$('#idcboAccion').append(
	    	  			$('<option>',{
	    	  				value: i+1,
	    	  				text: optionSelect[i]
	    	  			})		
	    	  		);
			  }	
		break;
	case "3":
		$("#idcboAccion").attr('disabled', 'disabled');
		break;
	
	}

	});
	
$("#idchkUnidadRed").on( 'change', function() {
    if( $(this).is(':checked') ) {
        // Hacer algo si el checkbox ha sido seleccionado
       $("#modalUnidadRed").modal('show');
    } else {
        // Hacer algo si el checkbox ha sido deseleccionado
    }
});

$("#idchkEquipoMovil").on( 'change', function() {
    if( $(this).is(':checked') ) {
        // Hacer algo si el checkbox ha sido seleccionado
       $("#modalEquipoMovil").modal('show');
    } else {
        // Hacer algo si el checkbox ha sido deseleccionado
    }
});

$("#idchkCorreoElectonico").on( 'change', function() {
    if( $(this).is(':checked') ) {
        // Hacer algo si el checkbox ha sido seleccionado
       $("#modalCorreoElectonico").modal('show');
    } else {
        // Hacer algo si el checkbox ha sido deseleccionado
    }
});

$("#idchkInternet").on( 'change', function() {
    if( $(this).is(':checked') ) {
        // Hacer algo si el checkbox ha sido seleccionado
       $("#modalInternet").modal('show');
    } else {
        // Hacer algo si el checkbox ha sido deseleccionado
    }
});

$("#idchkPuestoTrabajo").on( 'change', function() {
    if( $(this).is(':checked') ) {
        // Hacer algo si el checkbox ha sido seleccionado
       $("#modalPuestoTrabajo").modal('show');
    } else {
        // Hacer algo si el checkbox ha sido deseleccionado
    }
});

$("#idchkEquipoTelefonico").on( 'change', function() {
    if( $(this).is(':checked') ) {
        // Hacer algo si el checkbox ha sido seleccionado
       $("#modalEquipoTelefonico").modal('show');
    } else {
        // Hacer algo si el checkbox ha sido deseleccionado
    }
});

$("#idchkClaveLlamada").on( 'change', function() {
    if( $(this).is(':checked') ) {
        // Hacer algo si el checkbox ha sido seleccionado
       $("#modalClaveLlamada").modal('show');
    } else {
        // Hacer algo si el checkbox ha sido deseleccionado
    }
});

$("#idchkLicenciaO365").on( 'change', function() {
    if( $(this).is(':checked') ) {
        // Hacer algo si el checkbox ha sido seleccionado
       $("#modalLicenciaO365").modal('show');
    } else {
        // Hacer algo si el checkbox ha sido deseleccionado
    }
});

$("#idchkClaveImpresion").on( 'change', function() {
    if( $(this).is(':checked') ) {
        // Hacer algo si el checkbox ha sido seleccionado
       $("#modalClaveImpresion").modal('show');
    } else {
        // Hacer algo si el checkbox ha sido deseleccionado
    }
});


$(function () {
    //Initialize Select2 Elements
    $(".select2").select2();

});
</script>

</html>