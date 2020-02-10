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

$('.icheck').iCheck({
	checkboxClass: 'icheckbox_square-blue',
	radioClass: 'iradio_square-blue',
	increaseArea: '20%' // optional
});
	
</script>

<link rel="stylesheet" type="text/css" href="http://www.bootstraptoggle.com/css/bootstrap-toggle.css">
<script src="http://www.bootstraptoggle.com/js/bootstrap-toggle.js"  type="text/javascript"></script>
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
                   <h4 class="modal-title"><a style="color:white">ACCESO A UNIDADES DE RED&nbsp;&nbsp;</a><a style="color:red;font-weight: bold;"></a></h4>
              </div>
              <div class="modal-body">
              		<div class="form-group validar">
	              	   	<label  class="control-label">Unidad</label>
				        <select class="form-control unidadRed select2" name="c_turno" style="width: 100%;" id="cboUnidadRed" data-placeholder="Seleccione">
		         		<option></option>
				        <option value="1"> D:\CENTRIA </option>
						<option value="2"> D:\PUBLICO </option>
				        </select>
			        </div>
			        <div class="form-group validar">
				        <label  class="control-label">Tipo de Acceso</label>
			        	<br>
				 		<label class="radio-inline"><input id="chkLectura" class="icheck" type="radio" name="optRadioLecturaEscritura" value="L">Sólo lectura</label>
				 		<label class="radio-inline"><input id="chkEscritura" class="icheck" type="radio" name="optRadioLecturaEscritura" value="E">Lectura y escritura</label>	        
			        </div>
			        <div class="form-group validar">
				        <label  class="control-label">1er Nivel</label>
				        <select class="form-control unidadRed select2" name="c_turno" style="width: 100%;" id="cboNivel1" data-placeholder="Seleccione">
		         		<option></option>
				        <option value="1"> Auditoría </option>
						<option value="2"> Contraloría </option>
						<option value="3"> Finanzas </option>
						<option value="4"> Gerencia General </option>
						<option value="5"> Gestión Humana </option>
						<option value="6"> Legal </option>
						<option value="7"> Riesgos y Logística </option>
						<option value="8"> TI </option>
				        </select>
				    </div>
				    <div class="form-group">
				        <label  class="control-label">2do Nivel</label>
				        <select class="form-control unidadRed select2" name="c_turno" style="width: 100%;" id="cboNivel2" data-placeholder="Seleccione">
		         		<option></option>
				        <option value="1">Auditori 2 TEST </option>
						<option value="2">Auditoria Interna </option>
						<option value="3">Comites </option>
						<option value="4">Informes Auditoria </option>
				        </select>
				    </div>
			        <div class="form-group">
				        <label  class="control-label">3er Nivel</label>
				        <select class="form-control unidadRed select2" name="c_turno" style="width: 100%;" id="cboNivel3" data-placeholder="Seleccione">
		         		<option></option>
				        <option value="1" > 2017 </option>
				        <option value="2" > 2018 </option>
				        </select>
					</div>
					<div class="form-group">
				        <label  class="control-label">Observaciones</label>
				         <textarea id="txtObsUnidadRed" style="width: 100% !important; background-image: -webkit-gradient(linear,0% 0,0% 100%,color-stop(1%,#eee),color-stop(7%,#fff));" class="form-control" rows="3"></textarea> 
					</div>  
                    <div class="trans text-center text-white"> 
                    <button id="btnAgregarUnidadRed" name="singlebutton" class="btn btn-success  button_agregar_unidadRed"><i class="fa fa-plus"></i> Agregar</button> 
                    <button id="btnLimpiarUnidadRed" name="singlebutton" class="btn btn-warning  button_agregar_unidadRed"><i class="fa fa-eraser"></i> Limpiar</button> 
                    </div>
                    <br>                                            
                    <table class="table table-hover" style="display:none;" id="tblUnidadRed">
					  <thead style="background-color: aliceblue;">
					    <tr>
					      <th scope="col">Unidad</th>
					      <th scope="col">Tipo de Acceso</th>
					      <th scope="col">1er Nivel</th>
					      <th scope="col">2do Nivel</th>
					      <th scope="col">3er Nivel</th>
					      <th scope="col">Observaciones</th>
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


<!-- Inicio Modal Cancelar Solicitud -->
 <div class="modal fade" id="modalCancelar" role="dialog" aria-labelledby="exampleModalLongTitle2" aria-hidden="true">
         <div class="modal-dialog" role="document">
         <div class="modal-content">
         	<div class="modal-header" style="background-color: #d73925">
                   <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                   </button>
                   <h4 class="modal-title"><a style="color:white">CANCELAR SOLICITUD&nbsp;&nbsp;</a><a style="color:red;font-weight: bold;"></a></h4>
              </div>
              <div class="modal-body">
              
              		<label  class="control-label">Motivo de cancelación</label>
                   	<textarea class="form-control" id="" rows="4"></textarea>
                   	<br> 
                    
           		</div>
                <div class="modal-footer">
                    <button id="btnGuardarCancelar" type="submit" class="btn btn-primary "><i class="fa fa-floppy-o"></i> Guardar</button>
                 	<button type="button" class="btn btn-danger " data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
                </div>                                                                   
         </div>
         </div>
  </div>

<!-- Fin Modal Cancelar Solicitud -->

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
			       <div id="nivelesNuevaCarpeta" class="flex"> 
	              		<div class="form-group validar col" id="NCUnidad">
		              	   	<label  class="control-label">Unidad</label>
					        <select class="form-control select2" name="c_turno" id="cboUnidadRedNC" data-placeholder="Seleccione">
			         		<option></option>
					        <option value="1"> D:\CENTRIA </option>
							<option value="2"> D:\PUBLICO </option>
					        </select>
				        </div>
				        <div class="form-group col" id="NCPrimerNivel">
					        <label  class="control-label">1er Nivel</label>
					        <select class="form-control select2" name="c_turno" id="cboNivel1NC" data-placeholder="Seleccione">
			         		<option></option>
					        <option value="1"> Auditoría </option>
							<option value="2"> Contraloría </option>
							<option value="3"> Finanzas </option>
							<option value="4"> Gerencia General </option>
							<option value="5"> Gestión Humana </option>
							<option value="6"> Legal </option>
							<option value="7"> Riesgos y Logística </option>
							<option value="8"> TI </option>
					        </select>
					    </div>
					    <div class="form-group col" id="NCSegundoNivel">
					        <label  class="control-label">2do Nivel</label>
					        <select class="form-control select2" id="cboNivel2NC" data-placeholder="Seleccione">
			         		<option></option>
					        <option value="1">Auditori 2 TEST </option>
							<option value="2">Auditoría Interna </option>
							<option value="3">Comites </option>
							<option value="4">Informes Auditoría </option>
					        </select>
					    </div>
			        </div>

				    <div class="form-group validar">
					    <label class="control-label">Nombre de la carpeta</label>
	                   	<input type="text" maxlength="10" class="form-control" id="txtNombreCarpeta">
				    </div>
				    <div class="form-group validar" id="nuevaCarpetaAccesos" style="display:none;">
				    	<label class="control-label">Accesos</label>
				    
					    <table class="table table-bordered" id="tblAccesosNuevaCarpeta">
						  <thead style="background-color: #367fa9;color:white;">
						    <tr>
						      <th rowspan="2">Usuario</th>
						      <th colspan="2">Tipo de Acceso</th>
						    </tr>
						    <tr>
						      <th style="width:90px;">Lectura</th>
						      <th style="width:90px;">Escritura</th>
						    </tr>
						  </thead>
						  <tbody id="tbodyAccesosNuevaCarpeta">
						    
						  </tbody>
						</table>
					</div>
				    
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
              		
              		<label><input class="icheck" id="chkCelular" type="checkbox"/>Celular</label>
              		<br><br>
              	   	<label  class="control-label">Operador: </label>
			        <p id="" class="text-danger" style='display:none;'></p>
			        <select class="form-control select2" name="c_turno" style="width: 100%;" id="cboOperadorCelular" data-placeholder="Seleccione" disabled>
	         		<option></option>
			         <option value="1"> BITEL </option>
			         <option value="2"> CLARO </option>
			         <option value="3"> ENTEL </option>
			         <option value="4"> MOVISTAR </option>
			        </select>
			        <br>
			        <hr>
			        <label><input class="icheck" id="chkInternetMovil" type="checkbox"/>Internet Móvil</label>
                    <br><br>
              	   	<label  class="control-label">Operador</label>
			        <p id="" class="text-danger" style='display:none;'></p>
			        <select class="form-control select2" name="c_turno" style="width: 100%;" id="cboOperadorInternetMovil" data-placeholder="Seleccione" disabled>
	         		<option></option>
			         <option value="1"> BITEL </option>
			         <option value="2"> CLARO </option>
			         <option value="3"> ENTEL </option>
			         <option value="4"> MOVISTAR </option>
			        </select>
			        <br>
			        <br>
                    </div>
                <div class="modal-footer">
                    <button id="btnGuardarEquipoMovil" type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> Guardar</button>
                 	<button id="btnCancelarEquipoMovil" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
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
			 		<label class="radio-inline"><input class="icheck" type="radio" name="optRadioTipoCuenta" id="radioPersonal">Personal</label>
			 		<label class="radio-inline"><input class="icheck" type="radio" name="optRadioTipoCuenta" id="radioGenerica">Genérica</label>
                    <p id="" class="text-danger" style='display:none;'></p> 
                    <br>
                    <div class="cuentaGenerica" style="display:none;">
                    <br>              
              		<label  class="control-label">Propietario</label>
                    <p id="" class="text-danger" style='display:none;'></p>
                   	<input type="text" style="width: 100%;" class="form-control" id="inputPropietario" disabled>
                   	<br>
                   	<label  class="control-label">Dirección</label>
                    <p id="" class="text-danger" style='display:none;'></p>
                   	<input type="text" style="width: 100%;" class="form-control txtCuentaGenerica" id="inputDireccion">
                   	<br>
              	   	<label  class="control-label">Grupo de Correo</label>
                    <p id="" class="text-danger" style='display:none;'></p>
                   	<input type="text" style="width: 100%;" class="form-control txtCuentaGenerica" id="inputGrupoCorreo">
              	   	<br>
              	   	</div>  
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
           	<label class="control-label">Perfil</label>
        <p id="" class="text-danger" style='display:none;'></p>
        <select class="form-control select2" id="cboInternet" data-placeholder="Seleccione">
       		 <option></option>
         <option value="1"> Inet_Media </option>
		 <option value="1"> Inet_Directivos </option>
        </select>
        <br>
        <br>
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
 <div class="modal fade" id="modalPuestoTrabajo" role="dialog" aria-hidden="true">
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
			 		<label class="radio-inline"><input class="icheck" type="radio" name="optRadioTipoActivo" id="radioDesktop" />Desktop</label>
			 		<label class="radio-inline"><input class="icheck" type="radio" name="optRadioTipoActivo" id="radioLaptop" />Laptop</label>
                    <p id="" class="text-danger" style='display:none;'></p> 
                    <br><br> 
              		<label  class="control-label">Acción</label>
			        <p id="" class="text-danger" style='display:none;'></p>
			        <select class="form-control select2" style="width: 100%;" id="cboPuestoTrabajo" data-placeholder="Seleccione" disabled>
	         		<option></option>
			         <option value="1"> Nueva Asignación </option>
					 <option value="2"> Reasignación </option>
			        </select>
			        <br>
			        <div class="codigoActivo" style="display:none;">
			        <br>
			        <label  class="control-label">Código de Activo</label>
                    <p id="" class="text-danger" style='display:none;'></p>
                   	<input type="text" style="width: 100%;" class="form-control" id="inputCodigoActivo">
              	   	<br>
                    <p id="" class="text-danger" style='display:none;'></p>	
                    </div>
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
              		<label  class="control-label">Acción</label>
			        <p id="" class="text-danger" style='display:none;'></p>
			        <select class="form-control select2" style="width: 100%;" id="cboEquipoTelefonico" data-placeholder="Seleccione">
	         		<option></option>
			         <option value="1"> Nueva Asignación </option>
					 <option value="2"> Reasignación </option>
			        </select>
			        <br>
			        <div class="EquipoTelefonico" style="display:none;">
			        <br>
			        <label  class="control-label">Número de Anexo</label>
                    <p id="" class="text-danger" style='display:none;'></p>
                   	<input type="text" style="width: 100%;" class="form-control" id="inputNumeroAnexo">
              	   	<br>
              	   	</div>
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
              		
              		<label  class="control-label">Tipo de Salida:</label>
              		<br>
              		<label class="radio-inline"><input class="icheck claveLlamada" id="chkLocales" type="checkbox" />Locales&nbsp;&nbsp;</label>
              		<label class="radio-inline"><input class="icheck claveLlamada" id="chkCelulares" type="checkbox" />Celulares&nbsp;&nbsp;</label>
			        <label class="radio-inline"><input class="icheck claveLlamada" id="chkNacionales" type="checkbox" />Nacionales&nbsp;&nbsp;</label>
              		<label class="radio-inline"><input class="icheck claveLlamada" id="chkInternacionales" type="checkbox" />Internacionales&nbsp;&nbsp;</label>
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
			 		<label class="radio-inline"><input class="icheck" type="radio" name="optRadioTipoLicencia" id="radioE1">E1</label>
			 		<label class="radio-inline"><input class="icheck" type="radio" name="optRadioTipoLicencia" id="radioE2">E2</label>
			        <br>
              		<br>
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
              		
              		<label  class="control-label">Descripción</label>
                   	<input type="text" style="width: 100%;" class="form-control" id="inputDescripcionOtroEquipo" required>
              	   	<br>
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
  		<div class="row">
  		<div class="col-12 text-center">
		<img src="<%=request.getContextPath()%>/resources/image/smartRequestCabecera.jpg" class="img-fluid" style="transform:scale(1.3);">
  		</div>
  		<div class="col-12 text-center"  style="transform:scale(1.1);">
			<label>N° Solicitud:&nbsp;</label><label style="font-size: large; font-weight: normal;">F000001</label>
		</div>
		</div>
	<br><br>
   <!-- Step wizard -->
   <div class="stepwizard">
    <div class="stepwizard-row setup-panel">
        <div class="stepwizard-step">
            <a class="btn btn-primary btn-circle"><i class="glyphicon glyphicon-pushpin"></i></a>
            <p>Nuevo</p>
        </div>
        <div class="stepwizard-step">
            <a class="btn btn-default btn-circle"><i class="glyphicon glyphicon-time"></i></a>
            <p>Pendiente</p><p class="stepwizard-second">Revisor</p>
        </div>
        <div class="stepwizard-step">
            <a class="btn btn-default btn-circle"><i class="glyphicon glyphicon-time"></i></a>
            <p>Pendiente</p><p class="stepwizard-second">Aprobador</p>
        </div>
        <div class="stepwizard-step">
            <a class="btn btn-default btn-circle"><i class="glyphicon glyphicon-ok"></i></a>
            <p>Aprobado</p>
        </div>
        <div class="stepwizard-step">
            <a class="btn btn-default btn-circle"><i class="glyphicon glyphicon-remove"></i></a>
            <p>Cancelado</p>
        </div>
     </div>
	</div>
	<!-- Fin de step-wizard -->
	
   <br><br>
   
		<div class="panel panel-primary" style="max-width:95%;margin-left:auto;margin-right:auto;">
		  <div class="panel-heading">
		    <h3 class="panel-title">I. DATOS SOLICITANTE</h3>
		  </div>
		  <div class="panel-body">
		  <div class="row">
		     <div class="col-md-3 clear validar">
			  	 <label class="control-label">Empresa: </label>
		         <select class="form-control select2"  id="cboEmpresa" data-placeholder="Seleccione">
		         <option></option>
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
			 <div class="col-md-4 clear">
				 <label for="email">Nombres y Apellidos:</label>
				 <input type="text" class="form-control" id="txtUsuarioRegistro" disabled>
			 </div>
			 <div class="clear col-md-3">
				 <label for="email">Correo:</label>
				 <input type="email" class="form-control" id="txtCorreoRegistro" disabled>
			 </div>
			 <div class="clear col-md-2">
				 <label for="pwd">Fecha de Solicitud:</label>
				 <input type="date" class="form-control" id="txtFechaRegistro" disabled>
			 </div>
		 </div>	
		 </div>
		</div>
		
		<div class="panel panel-primary" style="max-width:95%;margin-left:auto;margin-right:auto;">
		  <div class="panel-heading">
		    <h3 class="panel-title">II. TIPO DE SOLICITUD</h3>
		  </div>
		  <div class="panel-body">
		  <div class="row">
		  	<div class="col-md-3 clear validar">
		  	 <label class="control-label">Tipo: </label>
	         <select class="form-control select2"   id="idcboTipoSolicitud" data-placeholder="Seleccione">
	         	 <option></option>
		         <option value="1">ALTA </option>
		         <option value="2">MODIFICACIÓN </option>
		         <option value="3">BAJA </option>
	         </select>
			 </div>
			 <div class="col-md-3 clear">
		  	 <label class="control-label">Acción: </label>
	         <select class="form-control select2"   id="idcboAccion"  data-placeholder="Seleccione" disabled>
	         		<option></option>
	         </select>
			 </div>
			 <div class="col-md-3 clear">
			 <label for="pwd">Fecha de Ingreso:</label>
			 <input type="date" class="form-control datepicker" id="">
			 </div>
			 <div class="col-md-3 clear">
			 <label for="pwd">Fecha de Retiro:</label>
			 <input type="date" class="form-control" id="">
			 </div>
		   </div>
		  </div>
		</div>
		
		<div id="datosPersonales" class="panel panel-primary" style="max-width:95%;margin-left:auto;margin-right:auto;">
		  <div class="panel-heading">
		    <h3 class="panel-title">III. DATOS PERSONALES</h3>
		  </div>
		  <div class="panel-body">
		    <div class="row">
							  	 <div class="col-md-2 clear validar">
									 <label for="email">DNI/CE:</label>
									 <input id="txtDNI" type="text" class="form-control" >
								 </div>
								 <div class="col-md-2 clear validar">
									 <label	for="email">Primer Nombre:</label>
									 <input id="txtPrimerNombre" type="text" class="form-control" >
								 </div>
							     <div class="col-md-2 clear">
									 <label for="email">Segundo Nombre:</label>
									 <input id="txtSegundoNombre" type="text" class="form-control" >
								 </div>
								 <div class="col-md-3 clear validar">
									 <label for="email">Apellido Paterno:</label>
									 <input id="txtApellidoPaterno" type="text" class="form-control" >
								 </div>
								 <div class="col-md-3 clear validar">
									 <label for="email">Apellido Materno:</label>
									 <input id="txtApellidoMaterno" type="text" class="form-control" >
								 </div>
							  </div>
							  <div class="row">
								  <div class="col-md-2 clear validar">
								 <label class="control-label">Gerencia: </label>
						         <select class="form-control select2"  id="cboGerencia"  data-placeholder="Seleccione">
							         <option></option>
							         <option value="1"> Finanzas </option>
							         <option value="2"> Logística </option>
							         <option value="3"> Sistemas </option>
						         </select>
						         </div>
						         <div class="col-md-2 clear validar">
						         <label class="control-label">Área: </label>
						         <select class="form-control select2"  id="cboArea"  data-placeholder="Seleccione">
						         	 <option></option>
							         <option value="1"> Almacén </option>
							         <option value="2"> Inventarios </option>
							         <option value="3"> Cargos </option>
						         </select>
						         </div>
						         <div class="col-md-3 clear validar">
									 <label>Cargo</label>
									 <input id="txtCargo" type="text" class="form-control">
								 </div>
								 <div class="col-md-3 clear validar">
									 <label class="control-label">Sede: </label>
							         <select class="form-control select2"  id="cboSede"  data-placeholder="Seleccione">
							         	 <option></option>
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
					   			 <div class="col-md-2 clear">
									 <label class="control-label" >Anexo de contacto</label>
									 <input id="txtAnexoContacto" type="text" class="form-control">
								 </div>
								 </div>
								 <br>
								 <div class="trans text-center text-white"> 
				                    <button id="btnAgregarUsuario" name="singlebutton" class="btn btn-success"><i class="fa fa-plus"></i> Agregar</button> 
				                    <button id="btnLimpiarUsuario" name="singlebutton" class="btn btn-warning"><i class="fa fa-eraser"></i> Limpiar</button> 
				                  </div>
								 
								 <br>
								 <div class="col-md-12">
								 <table class="table table-hover" id="tblUsuario" style="display:none;">
								  <thead style="background-color: #337ab71a;">
								    <tr>
								      <th scope="col">DNI / CE</th>
								      <th scope="col">Primer Nombre</th>
								      <th scope="col">Segundo Nombre</th>
								      <th scope="col">Apellido Paterno</th>
								      <th scope="col">Apellido Materno</th>
								      <th scope="col">Gerencia</th>
								      <th scope="col">Área</th>
								      <th scope="col">Cargo</th>
								      <th scope="col">Sede</th>
								      <th scope="col">Anexo de contacto</th>
								      <th scope="col">Acción</th>
								    </tr>
								  </thead>
								  <tbody id="tbodyUsuario">
								    
								  </tbody>
								</table>
								</div>
		  </div>	
		</div>
		
		<div class="panel panel-primary" style="max-width:95%;margin-left:auto;margin-right:auto;">
		  <div class="panel-heading">
		    <h3 class="panel-title">IV. SERVICIOS</h3>
		  </div>
		  <div class="panel-body">
		  <div class="row clear">
		  
			  <div class="col-sm-4 col-md-4 col-xs-4">
				  <div class="col-md-6">Acceso a Unidades de red </div>
				  <div class="col-md-6">
					  <input id="chkUnidadRed" data-toggle="toggle" data-on="Requerido" data-off="No requerido" type="checkbox">
					  <button title="Editar" type="button" style="padding-left:6px; padding-right:6px; display:none;" class="btn btn-ls" id="btnEditarUnidadRed" data-toggle="modal" data-target="#modalUnidadRed"><img width="20px" src="<%=request.getContextPath()%>/resources/image/smartRequest/edit.png" /></button>
				  </div>
			  </div>
		  
		  <div class="col-sm-4 col-md-4 col-xs-4">
			  <div class="col-md-6">Creación de Nueva Carpeta </div>
			  <div class="col-md-6">
			  	  <input id="chkNuevaCarpeta" data-toggle="toggle" data-on="Requerido" data-off="No requerido" type="checkbox">
				  <button title="Editar" type="button" style="padding-left:6px; padding-right:6px;display:none;" class="btn btn-ls" id="btnEditarNuevaCarpeta" data-toggle="modal" data-target="#modalNuevaCarpeta"><img width="20px" src="<%=request.getContextPath()%>/resources/image/smartRequest/edit.png" /></button>		
			  </div>
		  </div>
		  
		  <div class="col-sm-4 col-md-4 col-xs-4">
	  		  <div class="col-md-6">Equipo Móvil </div>
			  <div class="col-md-6">
			      <input id="chkEquipoMovil" data-toggle="toggle" data-on="Requerido" data-off="No requerido" type="checkbox">
				  <button title="Editar" type="button" style="padding-left:6px; padding-right:6px;display:none;" class="btn btn-ls" id="btnEditarEquipoMovil" data-toggle="modal" data-target="#modalEquipoMovil"><img width="20px" src="<%=request.getContextPath()%>/resources/image/smartRequest/edit.png" /></button>				  		
			  </div>	
		  </div>
		  
		  </div>
		  
		  <div class="row clear">
		  <div class="col-sm-4 col-md-4 col-xs-4">
			  <div class="col-md-6">Correo Electrónico </div>
			  <div class="col-md-6">
			  	  <input id="chkCorreoElectronico" data-toggle="toggle" data-on="Requerido" data-off="No requerido" type="checkbox">
				  <button title="Editar" type="button" style="padding-left:6px; padding-right:6px;display:none;" class="btn btn-ls" id="btnEditarCorreoElectronico" data-toggle="modal" data-target="#modalCorreoElectronico"><img width="20px" src="<%=request.getContextPath()%>/resources/image/smartRequest/edit.png" /></button>				  		
			  </div>
		  </div>
		  
		  <div class="col-sm-4 col-md-4 col-xs-4">
			  <div class="col-md-6">Internet </div>
			  <div class="col-md-6">
			  	  <input id="chkInternet" data-toggle="toggle" data-on="Requerido" data-off="No requerido" type="checkbox">
				  <button title="Editar" type="button" style="padding-left:6px; padding-right:6px;display:none;" class="btn btn-ls" id="btnEditarInternet" data-toggle="modal" data-target="#modalInternet"><img width="20px" src="<%=request.getContextPath()%>/resources/image/smartRequest/edit.png" /></button>				  		
			  </div>	
		  </div>
		  
		  <div class="col-sm-4 col-md-4 col-xs-4">
			  <div class="col-md-6">Puesto de Trabajo</div>
			  <div class="col-md-6">
			   	  <input id="chkPuestoTrabajo" data-toggle="toggle" data-on="Requerido" data-off="No requerido" type="checkbox">
				  <button title="Editar" type="button" style="padding-left:6px; padding-right:6px;display:none;" class="btn btn-ls" id="btnEditarPuestoTrabajo" data-toggle="modal" data-target="#modalPuestoTrabajo"><img width="20px" src="<%=request.getContextPath()%>/resources/image/smartRequest/edit.png" /></button>				  	
			  </div>
		  </div>
		  </div>
		  
		  <div class="row clear">
		  <div class="col-sm-4 col-md-4 col-xs-4">
			  <div class="col-md-6">Equipo Telefónico</div>
			  <div class="col-md-6">
			  	  <input id="chkEquipoTelefonico" data-toggle="toggle" data-on="Requerido" data-off="No requerido" type="checkbox">
				  <button title="Editar" type="button" style="padding-left:6px; padding-right:6px;display:none;" class="btn btn-ls" id="btnEditarEquipoTelefonico" data-toggle="modal" data-target="#modalEquipoTelefonico"><img width="20px" src="<%=request.getContextPath()%>/resources/image/smartRequest/edit.png" /></button>				  	
			  </div>
		  </div>
		  
		  <div class="col-sm-4 col-md-4 col-xs-4">
			  <div class="col-md-6">Clave de Llamadas</div>
			  <div class="col-md-6">
			  	  <input id="chkClaveLlamada" data-toggle="toggle" data-on="Requerido" data-off="No requerido" type="checkbox">
				  <button title="Editar" type="button" style="padding-left:6px; padding-right:6px;display:none;" class="btn btn-ls" id="btnEditarClaveLlamada" data-toggle="modal" data-target="#modalClaveLlamada"><img width="20px" src="<%=request.getContextPath()%>/resources/image/smartRequest/edit.png" /></button>				  	
			  </div>
		  </div>

		  <div class="col-sm-4 col-md-4 col-xs-4">
			  <div class="col-md-6">Licencia O365 </div>
			  <div class="col-md-6">
			  	  <input id="chkLicenciaO365" data-toggle="toggle" data-on="Requerido" data-off="No requerido" type="checkbox">
				  <button title="Editar" type="button" style="padding-left:6px; padding-right:6px;display:none;" class="btn btn-ls" id="btnEditarLicenciaO365" data-toggle="modal" data-target="#modalLicenciaO365"><img width="20px" src="<%=request.getContextPath()%>/resources/image/smartRequest/edit.png" /></button>				  			  
			  </div>
		  </div>
		  </div>
		  
		  <div class="row">
  		  <div class="col-sm-4 col-md-4 col-xs-4">
			  <div class="col-md-6">Otro Equipo </div>
			  <div class="col-md-6">
			  	  <input id="chkOtroEquipo" data-toggle="toggle" data-on="Requerido" data-off="No requerido" type="checkbox">
				  <button title="Editar" type="button" style="padding-left:6px; padding-right:6px;display:none;" class="btn btn-ls" id="btnEditarOtroEquipo" data-toggle="modal" data-target="#modalOtroEquipo"><img width="20px" src="<%=request.getContextPath()%>/resources/image/smartRequest/edit.png" /></button>				  			  
			  </div>		  
		  </div>
		  <div class="col-sm-4 col-md-4 col-xs-4">
			  <div class="col-md-6">Clave Impresión </div>
			  <div class="col-md-6">
			  	  <input id="chkClaveImpresion" data-toggle="toggle" data-on="Requerido" data-off="No requerido" type="checkbox">
			  </div>		  
		  </div>

		  </div>
		  </div> <!-- Fin panel body -->
		  </div> <!-- Fin panel SERVICIOS -->
		  
		<div class="panel panel-primary" style="max-width:95%;margin-left:auto;margin-right:auto;">
		  <div class="panel-heading">
		    <h3 class="panel-title">V. APLICACIONES</h3>
		  </div>
		  <div class="panel-body">
		  <div class="row">
		  <div class="col-sm-6 col-md-6 col-xs-6">
			  <div class="col-md-4">Hyperion - HFM</div>
			  <div class="col-md-8 inline-flex">
				  <input class="col-md-4 col-xs-4" id="chkHyperionHFM" data-style="ios" data-toggle="toggle" data-on="Sí" data-off="No" type="checkbox">
				  <input type="text" value="No Requerido" style="width:65%; margin-left:3px;" class="form-control"  id="inputHyperionHFM" disabled>
			  </div>
		  </div>
		  <div class="col-sm-6 col-md-6 col-xs-6">
			  <div class="col-md-4">DLO (Backup "Mis Documentos")</div>
			  <div class="col-md-8 inline-flex">
			  	  <input class="col-md-4 col-xs-4" id="chkDLO" data-style="ios" data-toggle="toggle" data-on="Sí" data-off="No" type="checkbox">
			  	  <input type="text" style="width:65%; margin-left:3px;" value="No Requerido" class="form-control" id="inputDLO" disabled>
			  </div>
		  </div>
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-sm-6 col-md-6 col-xs-6">
			  <div class="col-md-4">Hyperion - FCM</div>
			  <div class="col-md-8 inline-flex">
			  	  <input class="col-md-4 col-xs-4" data-style="ios" id="chkHyperionFCM" data-toggle="toggle" data-on="Sí" data-off="No" type="checkbox">
			  	  <input type="text" style="width:65%; margin-left:3px;" value="No Requerido" class="form-control" id="inputHyperionFCM" disabled>
			  </div>
		  </div>
		  <div class="col-sm-6 col-md-6 col-xs-6">
			  <div class="col-md-4">Hyperion - Planing</div>
			  <div class="col-md-8 inline-flex">
			  	  <input class="col-md-4 col-xs-4" data-style="ios" id="chkHyperionPlaning" data-toggle="toggle" data-on="Sí" data-off="No" type="checkbox">
				  <input type="text" style="width:65%; margin-left:3px;"" value="No Requerido" class="form-control" id="inputHyperionPlaning" disabled>
			  </div>	
		  </div>
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-sm-6 col-md-6 col-xs-6">
			  <div class="col-md-4">Hyperion - OBI</div>
			  <div class="col-md-8 inline-flex">
			  		<input data-style="ios" id="chkHyperionOBI" data-toggle="toggle" data-on="Sí" data-off="No" type="checkbox">
			  		<input type="text" style="width:65%; margin-left:3px;" value="No Requerido" class="form-control" id="inputHyperionOBI" disabled>
			  </div>
		  </div>
		  <div class="col-sm-6 col-md-6 col-xs-6">
			  <div class="col-md-4">Onbase</div>
			  <div class="col-md-8 inline-flex">
			  		<input data-style="ios" id="chkOnbase" data-toggle="toggle" data-on="Sí" data-off="No" type="checkbox">
			   	    <input type="text" style="width:65%; margin-left:3px;" value="No Requerido" class="form-control" id="inputOnbase" disabled>
			  </div>
		  </div>
		  </div>
		  <br>  
		  <div class="row">
		  <div class="col-sm-6 col-md-6 col-xs-6">
			  <div class="col-md-4">Sist. encriptación (SYMANTEC)</div>
			  <div class="col-md-8 inline-flex">
			  		<input data-style="ios" id="chkSistEncriptacion" data-toggle="toggle" data-on="Sí" data-off="No" type="checkbox">		  
		    	    <input type="text" style="width:65%; margin-left:3px;" value="No Requerido" class="form-control" id="inputSistEncriptacion" disabled>
			  </div>
		  </div>
		  <div class="col-sm-6 col-md-6 col-xs-6">
			  <div class="col-md-4">Cloud - Backup</div>
			  <div class="col-md-8 inline-flex">
			  		<input data-style="ios" id="chkCloudBackup" data-toggle="toggle" data-on="Sí" data-off="No" type="checkbox">
				    <input type="text" style="width:65%; margin-left:3px;" value="No Requerido" class="form-control" id="inputCloudBackup" disabled>
			  </div>
		  </div>
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-sm-6 col-md-6 col-xs-6">
			  <div class="col-md-4">Portal Logístico</div>
			  <div class="col-md-8 inline-flex">
			  		<input data-style="ios" id="chkPortalLogistico" data-toggle="toggle" data-on="Sí" data-off="No" type="checkbox">
		    	    <input type="text" style="width:65%; margin-left:3px;" value="No Requerido" class="form-control" id="inputPortalLogistico" disabled>
			  </div>
		  </div>
		  <div class="col-sm-6 col-md-6 col-xs-6">
			  <div class="col-md-4">VPN (Especificar si el generador de clave  se instalará en Laptop y/o Smartphone)</div>
			  <div class="col-md-8 inline-flex">
			  		<input data-style="ios" id="chkVPN" data-toggle="toggle" data-on="Sí" data-off="No" type="checkbox">
			  		<input type="text" style="width:65%; margin-left:3px;" value="No Requerido" class="form-control" id="inputVPN" disabled>
			  </div>
		  </div>
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-sm-6 col-md-6 col-xs-6">
			  <div class="col-md-4">Administrador local (Colocar justificación)</div>
			  <div class="col-md-8 inline-flex">
			  		<input data-style="ios" id="chkAdministradorLocal" data-toggle="toggle" data-on="Sí" data-off="No" type="checkbox">
				    <input type="text" style="width:65%; margin-left:3px;" value="No Requerido" class="form-control" id="inputAdministradorLocal" disabled>
			  </div>
		  </div>	
		  <div class="col-sm-6 col-md-6 col-xs-6">  
			  <div class="col-md-4">GIT</div>
			  <div class="col-md-8 inline-flex">
			  		<input data-style="ios" id="chkGIT" data-toggle="toggle" data-on="Sí" data-off="No" type="checkbox">
				    <input type="text" style="width:65%; margin-left:3px;" value="No Requerido" class="form-control" id="inputGIT" disabled>
			  </div>
		  </div>
		  </div>
		  <br>  
		  <div class="row">
		  <div class="col-sm-6 col-md-6 col-xs-6">
			  <div class="col-md-4">SAP Portal</div>
			  <div class="col-md-8 inline-flex">
			  		<input data-style="ios" id="chkSapPortal" data-toggle="toggle" data-on="Sí" data-off="No" type="checkbox">
		 		    <input type="text" style="width:65%; margin-left:3px;" value="No Requerido" class="form-control" id="inputSapPortal" disabled>
			  </div>
		  </div>
		  <div class="col-sm-6 col-md-6 col-xs-6">
			  <div class="col-md-4">Sistema de Asignación</div>
			  <div class="col-md-8 inline-flex">
			  		<input data-style="ios" id="chkSistemaAsignacion" data-toggle="toggle" data-on="Sí" data-off="No" type="checkbox">
			  		<input type="text" style="width:65%; margin-left:3px;" value="No Requerido" class="form-control" id="inputSistemaAsignacion" disabled>
			  </div>
		  </div>
		  </div>
		  <br>
		  <div class="row">
		  <div class="col-sm-6 col-md-6 col-xs-6">
			  <div class="col-md-4">Otros (Especificar aplicación)</div>
			  <div class="col-md-8 inline-flex">
			  		<input data-style="ios" id="chkOtros" data-toggle="toggle" data-on="Sí" data-off="No" type="checkbox">
			  		<input type="text" style="width:65%; margin-left:3px;" value="No Requerido" class="form-control" id="inputOtros" disabled>
			  </div>
		  </div>
		  </div>
		  <br>
		  </div>
		</div>
		<div class="panel panel-primary" style="max-width:95%;margin-left:auto;margin-right:auto;">
		  <div class="panel-heading">
		    <h3 class="panel-title text-center">APROBADORES</h3>
		  </div>
		  <div class="panel-body">
		  <div class="row clear">
		  <div class="col-md-2">Revisor</div>
		  <div class="col-md-4"><input type="text" class="form-control" style="width:100%;" onKeyPress="activarReloj1()"></div>
		  <div class="col-md-6" id="reloj1" style='display:none;'><i  class="fa fa-clock-o fa-2x" style="color:#51acc7"></i></div>		  
		  </div>
		  <div class="row clear">
		  <div class="col-md-2">Aprobador</div>
		  <div class="col-md-4"><input type="text" class="form-control" style="width:100%;" onKeyPress="activarReloj4()"></div>
		  <div class="col-md-6" id="reloj4" style='display:none;'><i class="fa fa-clock-o fa-2x" style="color:#51acc7"></i></div>		  
		  </div>
		  </div>
		</div>
		<!-- correcto -->
		<div class="trans text-center"> 
		    <button id="btnRegistrar" name="singlebutton" class="btn btn-success btn-app"><i class="fa fa-save"> </i>Guardar</button> 
		    <button id="btnLimpiar" name="singlebutton" class="btn btn-primary btn-app"><i class="fa fa-eraser"> </i>Limpiar</button>
		    <button id="btnCancelar" name="singlebutton" class="btn btn-danger btn-app"><i class="fa fa-times"> </i>Cancelar</button>  
		</div>
		
</div>
</div>
</div>
<!-- /.row (main row) --> 

<div class="row container-fluid" id="divConfirmacion" style='display:none;'>

		<div class="panel panel-success" style="max-width:65%;margin-left:auto;margin-right:auto;">
		  <div class="panel-heading">
		    <h3 class="panel-title">CONFIRMACIÓN</h3>
		  </div>
		  <div class="panel-body text-center">

			 <i class="fa fa-check-circle fa-pull-center text-green" style="font-size:5em;"></i>
			 <h4>Se ha registrado satisfactoriamente la solicitud F000001.</h4>
			 <h4><i class="fa fa-envelope"></i>  Se ha enviado una notificación al primer revisor.</h4>

		</div> <!-- Fin Panel TBODY -->
		</div> <!-- Fin Panel CONFIRMACIÓN -->
</div>

<div class="row container-fluid" id="divCancelacion" style='display:none;'>

		<div class="panel panel-danger" style="max-width:60%;margin-left:auto;margin-right:auto;">
		  <div class="panel-heading">
		    <h3 class="panel-title">CANCELACIÓN</h3>
		  </div>
		  <div class="panel-body text-center">

			 <i class="fa fa-times-circle fa-pull-center text-red" style="font-size:5em;"></i>
			 <h4>Se ha rechazado la solicitud F000001.</h4>
			 <h4><i class="fa fa-envelope"></i>  Se ha enviado una notificación al usuario solicitante para su revisión.</h4>

		</div> <!-- Fin Panel TBODY -->
		</div> <!-- Fin Panel CONFIRMACIÓN -->
</div>

</section><!-- /.content --> </aside>
<!-- /.right-side -->

<script type="text/javascript">
$(document).ready(function() {

	
});


function activarReloj1(){
	 document.getElementById('reloj1').style.display = 'block';
}
function activarReloj2(){
	 document.getElementById('reloj2').style.display = 'block';
}
function activarReloj3(){
	 document.getElementById('reloj3').style.display = 'block';
}
function activarReloj4(){
	 document.getElementById('reloj4').style.display = 'block';
}
function activarReloj5(){
	 document.getElementById('reloj5').style.display = 'block';
}

//Acciones Boton Registrar Formulario
	$('#btnRegistrar').click(function(){
		document.getElementById('divFormulario').style.display = 'none';	
		document.getElementById('divConfirmacion').style.display = 'block';
		$("#aside").addClass("sizeHeight");
	});
	
//Botón Cancelar
 	$('#btnCancelar').click(function(){
 		$("#modalCancelar").modal('show');
	});
	
	//Botón Guardar-Cancelar
	$('#btnGuardarCancelar').click(function(){
		document.getElementById('divFormulario').style.display = 'none';
		$("#modalCancelar").modal('hide');
		document.getElementById('divCancelacion').style.display = 'block';
		$("#aside").addClass("sizeHeight");
	});
	       
//Validación de combos
function valSelect(myID)   
{
	$(myID + " select").each(function(){
	    if($(this).val()=="" || $(this).val()==null){
	    	$('div.validar:has(#' + $(this).attr('id') + ')').addClass('error');
	    	
	    	if($('div.validar:has(#' + $(this).attr('id') + ') p.mensaje-error').length == 0)
	    		$('div.validar:has(#' + $(this).attr('id') + ')').append('<p class="mensaje-error">Seleccione una opción</p>');
	    }
	});
}

//Validación de radios
function valRadios(myID)   
{
	$(myID + " input[type=radio]").each(function(){
		if($('[name=' + $(this).attr('name') + ']:checked').val() == null)
	    {
			$('div.validar:has([name=' + $(this).attr('name') + '])').addClass('error');
	    	
	    	if($('div.validar:has([name=' + $(this).attr('name') + ']) p.mensaje-error').length == 0)
	    		$('div.validar:has([name=' + $(this).attr('name') + '])').append('<p class="mensaje-error">Seleccione una opción</p>');
	    }
	});
}

function valCheckbox(myID)   
{
	$(myID + " [name=" + $(this).attr('name') + "]").each(function(){
		if($($(this).attr('name') + ':checked').val() == null)
	    {
			$('div.validar:has([name=' + $(this).attr('name') + '])').addClass('error');
	    	
	    	if($('div.validar:has([name=' + $(this).attr('name') + ']) p.mensaje-error').length == 0)
	    		$('div.validar:has([name=' + $(this).attr('name') + '])').append('<p class="mensaje-error">Seleccione una opción</p>');
	    }
	});
}

//Quitar class error
function quitarVal(myID){
	if($(myID + ' p.mensaje-error').length > 0){
			$(myID + ' p').remove('.mensaje-error');	
			$(myID + ' div').removeClass('error');
		}
}

//Validación de campos personalizados
function valCustom(myID)   
{
    if($(myID).val()=="" || $(myID).val()==null){
    	$('div.validar:has(#' + myID + ')').addClass('error');
    	
    	if($('div.validar:has(#' + myID + ') p.mensaje-error').length == 0)
    		$('div.validar:has(#' + myID + ')').append('<p class="mensaje-error">Seleccione una opción</p>');
    }
}

//Validación de los combos (Cuando seleccionan un valor)
   $(".select2").on( 'change', function() {
	    if( $(this).val() >= -1) {
	    	$('div.validar:has(#' + $(this).attr('id') + ')').removeClass('error');
	    	$('div.validar:has(#' + $(this).attr('id') + ') p').remove('.mensaje-error');
	    }
	});
	
 //Validación de los radios (Cuando seleccionan un valor)
	$('[type=radio]').on('ifChecked', function(event){
		
		$('div.validar:has(#' + $(this).attr('id') + ')').removeClass('error');
   		$('div.validar:has(#' + $(this).attr('id') + ') p').remove('.mensaje-error');
	});  

 
//Validación de los checkbox (Cuando seleccionan un valor)
	$('input[type=checkbox]').on('ifChecked', function(event){
		
		$('div.validar:has(#' + $(this).attr('id') + ')').removeClass('error');
	  		$('div.validar:has(#' + $(this).attr('id') + ') p').remove('.mensaje-error');
	});

//Validación de los inputs type text (Cuando se escribe)
  $("input[type=text]").on( 'keyup', function() {
    if( $(this).val().trim().length > 0) {
    	$('div.validar:has(#' + $(this).attr('id') + ')').removeClass('error');
    	$('div.validar:has(#' + $(this).attr('id') + ') p').remove('.mensaje-error');
    }else{
    	$('div.validar:has(#' + $(this).attr('id') + ')').addClass('error');
    	
    	if($('div.validar:has(#' + $(this).attr('id') + ') p.mensaje-error').length == 0)
    		$('div.validar:has(#' + $(this).attr('id') + ')').append('<p class="mensaje-error">Debe completar el campo</p>');
    }
});

//Validación de inputs type text en blanco
function valInput(myID)
{
	$(myID + " input[type=text]").each(function(){
	    if($(this).val().trim()=="" || $(this).val()==null){
	    	$('div.validar:has(#' + $(this).attr('id') + ')').addClass('error');
	    	
	    	if($('div.validar:has(#' + $(this).attr('id') + ') p.mensaje-error').length == 0)
	    		$('div.validar:has(#' + $(this).attr('id') + ')').append('<p class="mensaje-error">Debe completar el campo</p>');
	    }
	});
}

//Limpiar campos
function limpiarCampos(myID){
	//Inputs type text
	$(myID + " input[type=text]").each(function(){
		$(this).val("");
	}); 
	
	//Select
 	$(myID + " select").each(function(){
 		$(this).val(-1).trigger('change');
		
	}); 
	
	//Radio
	$(myID + " input[type=radio]").each(function(){
		$(this).iCheck('uncheck');
	}); 
	
	//Checkbox
	$(myID + " input[type=checkbox]").each(function(){
		$(this).iCheck('uncheck');
	}); 	
}

//Validar campos en blancos requeridos
function valRequerido(myID){
	var ok=true;
 	//Inputs type text
	$(myID + " div.validar:has(input[type=text]) input").each(function(){
		if($(this).val().trim()=="" || $(this).val()==null)
	    	ok=false;
	}); 
	
	//Select
 	$(myID + " div.validar:has(select) select").each(function(){
		if($(this).val()=="" || $(this).val()==null)
	    	ok=false;
	});
	
 	//Radio
 	$(myID + " div.validar:has(input[type=radio]) input").each(function(){
 		$(this).on('ifUnchecked', function(event){
	  		ok=false;
		});
	});
	
 	//Radios
 	
 	//Checkbox
 	$(myID + " div.validar:has(input[type=checkbox]) input").each(function(){
 		$(this).on('ifUnchecked', function(event){
	  		ok=false;
		});
	});
 	
	return ok;
}

//Funciones tabla Usuario

//Agregar fila nueva tabla Usuarios 	
$('#btnAgregarUsuario').click(function(){

var dni = $('#txtDNI').val();
var primerNombre = $('#txtPrimerNombre').val();
var segundoNombre = $('#txtSegundoNombre').val();
var apellidoPaterno = $('#txtApellidoPaterno').val();
var apellidoMaterno = $('#txtApellidoMaterno').val();
var gerencia = $('#cboGerencia option:selected').text();
var area = $('#cboArea option:selected').text();
var cargo = $('#txtCargo').val();
var sede = $('#cboSede option:selected').text();
var anexoContacto = $('#txtAnexoContacto').val();

	if(valRequerido("#datosPersonales"))
	{
		$('#tblUsuario').show();
		$('#tbodyUsuario').append('<tr>'+
			      '<td>'+dni+'</td>'+
			      '<td>'+primerNombre+'</td>'+
			      '<td>'+segundoNombre+'</td>'+
			      '<td>'+apellidoPaterno+'</td>'+
			      '<td>'+apellidoMaterno+'</td>'+
			      '<td>'+gerencia+'</td>'+
			      '<td>'+area+'</td>'+
			      '<td>'+cargo+'</td>'+
			      '<td>'+sede+'</td>'+
			      '<td>'+anexoContacto+'</td>'+
			      '<td><button title="Eliminar" type="button" class="btn btn-danger btn-ls btnEliminarUsuario" ><i class="fa fa-trash fa-sm"></i></button></td>'+
			      '</tr>');
		
		$('#nuevaCarpetaAccesos').show();
		$('#tbodyAccesosNuevaCarpeta').append('<tr>'+
			      '<td>'+ primerNombre + " " + apellidoPaterno + " " + apellidoMaterno + '</td>'+
			      '<td><center><input class="icheck" type="radio" name="opt' + dni +'" value="L"></center></td>'+
			      '<td><center><input class="icheck" type="radio" name="opt' + dni +'" value="E"></center></td>'+
			      '</tr>');
		$('#tbodyAccesosNuevaCarpeta input').iCheck({
		    checkboxClass: 'icheckbox_square-blue',
		    radioClass: 'iradio_square-blue'
		});
		
		$('#tbodyAccesosNuevaCarpeta input').on('ifChecked', function(event){
			
		 		$('div.validar:has([name=' + $(this).attr('name') + '])').removeClass('error');
		   		$('div.validar:has([name=' + $(this).attr('name') + ']) p').remove('.mensaje-error');
				
		}); 
		
		limpiarCampos('#datosPersonales');
	}
	else
	{
		valSelect('#datosPersonales');
		valInput('#datosPersonales');
	}
});


//Eliminar fila tabla Usuario
$('#tblUsuario').on('click', '.btnEliminarUsuario', function(){
   var index= $(this).closest('td').parent()[0].sectionRowIndex;
   $(this).parents('tr').eq(0).remove();
   $('#tbodyAccesosNuevaCarpeta tr').eq(index).remove();   
   
   if($('#tbodyUsuario tr').length == 0)
	   $('#tblUsuario').hide();
   
   if($('#tbodyAccesosNuevaCarpeta tr').length == 0)
	   $('#nuevaCarpetaAccesos').hide();
});

//Funciones Modal Unidad de Red
	
	//Limpiar campos de unidad de red
	$('#btnLimpiarUnidadRed').click(function(){
		$('.unidadRed').val(-1).trigger('change');
	});
	
	//Agregar fila nueva tabla Unidad de Red. 	
	$('#btnAgregarUnidadRed').click(function(){
	
	var unidad = $('#cboUnidadRed option:selected').text();
	var tipo = $('input[name=optRadioLecturaEscritura]:checked').val();
	var nivel1 = $('#cboNivel1 option:selected').text();
	var nivel2 = $('#cboNivel2 option:selected').text();
	var nivel3 = $('#cboNivel3 option:selected').text();
	var obs = $('#txtObsUnidadRed').val();
	
	if(valRequerido("#modalUnidadRed")){
		$('#tblUnidadRed').show()
		$('#tbodyUnidadRed').append('<tr class="filaUnidadRed">'+
			      '<td>'+unidad+'</td>'+
			      '<td>'+tipo+'</td>'+
			      '<td>'+nivel1+'</td>'+
			      '<td>'+nivel2+'</td>'+
			      '<td>'+nivel3+'</td>'+
			      '<td>'+obs+'</td>'+
			      '<td><button title="Eliminar" type="button" class="btn btn-danger btn-ls btnEliminarUnidadRed" ><i class="fa fa-trash fa-sm"></i></button></td>'+
			      '</tr>');
			      
		limpiarCampos('#modalUnidadRed');
		
		if($('#modalUnidadRed > div > div > div p.mensaje-error').length > 0)
			$('#modalUnidadRed > div > div > div p').remove('.mensaje-error');
		
	}else{
		valSelect('#modalUnidadRed');
		valRadios('#modalUnidadRed');
	} 
	
	});
	
	var guardarUnidadRed=false;
	//Cuando el modal se oculta
	$('#modalUnidadRed').on('hidden.bs.modal', function(){
		//Validar si ha sido seleccionado el botón "Guardar"
		if(!guardarUnidadRed){
			if($('#chkUnidadRed').is(':checked')){
				$('#chkUnidadRed').bootstrapToggle('off');
			}
		}
	});
	
	//Eliminar fila tabla Unidad de Red. 
	   $('#tblUnidadRed').on('click', '.btnEliminarUnidadRed', function(){
	      $(this).parents('tr').eq(0).remove();
	      
	      if($('#tbodyUnidadRed tr').length == 0)
	    	$('#tblUnidadRed').hide();  
	   });
	//Activar/Desactivar Servicio  Unidad de Red
	   $("#chkUnidadRed").change(function() {
		    if( $(this).is(':checked') ) {
		        // Hacer algo si el checkbox ha sido seleccionado
		       $("#modalUnidadRed").modal('show');

		    } else {
		        // Hacer algo si el checkbox ha sido deseleccionado
		    	$("#btnEditarUnidadRed").hide();
		    	guardarUnidadRed = false;
		    	//Limpiar
		    	$(".filaUnidadRed").remove();
		    	$('#tblUnidadRed').hide();
		    	limpiarCampos('#modalUnidadRed');
		        if($('#modalUnidadRed p.mensaje-error').length > 0)
					$('#modalUnidadRed > div > div > div p').remove('.mensaje-error');
		    }
		});
	   
	 //Guardar Unidad de Red
	 
	 $('#btnGuardarUnidadRed').click(function(){
		if($('.filaUnidadRed').length > 0){
	 		$("#modalUnidadRed").modal('hide');
	 	    $("#btnEditarUnidadRed").show();
	 	    guardarUnidadRed = true;
	 	}else{
	 		if($('#modalUnidadRed > div > div > div p.mensaje-error').length == 0)
	 			$('#modalUnidadRed > div > div > div:nth-child(2)').append('<p class="mensaje-error">Debe agregar una unidad de red para guardar los cambios.</p>');
	 	}
	 });
	 
//Funciones Modal Nueva Carpeta
		
		var guardarNuevaCarpeta=false;
		//Cuando el modal se oculta
		$('#modalNuevaCarpeta').on('hidden.bs.modal', function(){
			//Limpiar validaciones
			quitarVal('#modalNuevaCarpeta');
			//Validar si ha sido seleccionado el botón "Guardar"
			if(!guardarNuevaCarpeta){
				if($('#chkNuevaCarpeta').is(':checked')){
					$('#chkNuevaCarpeta').bootstrapToggle('off');
				}
			}
		});

		//Activar/Desactivar Servicio Nueva Carpeta
		   $("#chkNuevaCarpeta").on( 'change', function() {
			    if( $(this).is(':checked') ) {
			        // Hacer algo si el checkbox ha sido seleccionado
			       $("#modalNuevaCarpeta").modal('show');
			    } else {
			        // Hacer algo si el checkbox ha sido deseleccionado
			        guardarNuevaCarpeta=false;
			    	$("#btnEditarNuevaCarpeta").hide();
			    	limpiarCampos("#modalNuevaCarpeta");
			    }
			});
		   
		 //Guardar Nueva carpeta
		 $('#btnGuardarNuevaCarpeta').click(function(){
  
			 if(valRequerido("#modalNuevaCarpeta")){
				 if($('#tbodyAccesosNuevaCarpeta tr').length > 0){
					
			 		$("#modalNuevaCarpeta").modal('hide');
					
			 		if($('#modalNuevaCarpeta p.mensaje-error').length > 0){
			 			$('#modalNuevaCarpeta p').remove('.mensaje-error');	
			 			$('#modalNuevaCarpeta p').removeClass('error');
			 		}
			 			
			 		$("#btnEditarNuevaCarpeta").show();
			 	    guardarNuevaCarpeta = true;
			 	    
				 	}else{
				 		
				 		if($('#modalNuevaCarpeta > div > div > div p.mensaje-error').length == 0)
				 			$('#modalNuevaCarpeta > div > div > div:nth-child(2)').append('<p class="mensaje-error">Debe agregar 1 usuario como mínimo.</p>');
				 	
				 	}
				 
				}else{
					
					valSelect('#modalNuevaCarpeta');
					valRadios('#modalNuevaCarpeta');
					valInput('#modalNuevaCarpeta');
				} 

		 });
	 		 
//Funciones Modal Equipo Móvil

		var guardarEquipoMovil=false;
		//Cuando el modal se oculta
		$('#modalEquipoMovil').on('hidden.bs.modal', function(){
			//Validar si ha sido seleccionado el botón "Guardar"
			if(!guardarEquipoMovil){
				if($('#chkEquipoMovil').is(':checked')){
					$('#chkEquipoMovil').bootstrapToggle('off');
				}
			}
		});
		 
	 //Activar/Desactivar combo Celular Operador
	  	$('#chkCelular').on('ifChecked', function(event){
	  		$("#cboOperadorCelular").removeAttr('disabled');
		});
	  	
	  	$('#chkCelular').on('ifUnchecked', function(event){
	  		$("#cboOperadorCelular").attr('disabled', 'disabled');
	  		$('#cboOperadorCelular').val('-1');
	        $('#cboOperadorCelular').trigger('change');
		});
	  	
	 //Activar/Desactivar combo Celular Internet Móvil
	  	$('#chkInternetMovil').on('ifChecked', function(event){
	  		$("#cboOperadorInternetMovil").removeAttr('disabled');
		});
	  	
	  	$('#chkInternetMovil').on('ifUnchecked', function(event){
	  		$("#cboOperadorInternetMovil").attr('disabled', 'disabled');
	  		$('#cboOperadorInternetMovil').val('-1');
	        $('#cboOperadorInternetMovil').trigger('change');
		});
	  
	 //Activar/Desactivar Servicio  Equipo Movil
		   $("#chkEquipoMovil").on( 'change', function() {
			    if( $(this).is(':checked') ) {
			        // Hacer algo si el checkbox ha sido seleccionado
			       $("#modalEquipoMovil").modal('show');
			    } else {
			        // Hacer algo si el checkbox ha sido deseleccionado
			    	$("#btnEditarEquipoMovil").hide();
			    	$('#chkCelular').iCheck('uncheck');
			    	$('#chkPlanDatos').iCheck('uncheck');
			    	$('#chkInternetMovil').iCheck('uncheck');
			    	guardarEquipoMovil=false;
			    }
			});
		   
	  //Guardar Equipo Movil
		 $('#btnGuardarEquipoMovil').click(function(){
			 	   $("#modalEquipoMovil").modal('hide');
			 	   $("#btnEditarEquipoMovil").show();
			 	   guardarEquipoMovil=true;
		 });
	  
//Funciones Modal Correo Electronico

			var guardarCorreoElectronico=false;
			//Cuando el modal se oculta
			$('#modalCorreoElectronico').on('hidden.bs.modal', function(){
				//Validar si ha sido seleccionado el botón "Guardar"
				if(!guardarCorreoElectronico){
					if($('#chkCorreoElectronico').is(':checked')){
						$('#chkCorreoElectronico').bootstrapToggle('off');
					}
				}
			});
			
			//Activar/Desactivar Servicio Correo Electronico
			   $("#chkCorreoElectronico").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				        // Hacer algo si el checkbox ha sido seleccionado
				       $("#modalCorreoElectronico").modal('show');
				    } else {
				        // Hacer algo si el checkbox ha sido deseleccionado
				        $("input[name=optRadioTipoCuenta]").iCheck('uncheck');
				        $(".cuentaGenerica").hide();
				    	$("#btnEditarCorreoElectronico").hide();
				    	if($('#modalCorreoElectronico p.mensaje-error').length > 0)
							$('#modalCorreoElectronico > div > div > div p').remove('.mensaje-error');
				    	guardarCorreoElectronico=false;
				    	camposCorreoElectronico=false;
				    }
				});
			   
			 //Guardar Correo Electronico
			 $('#btnGuardarCorreoElectronico').click(function(){
				 if(camposCorreoElectronico){
					 if($('#radioGenerica').is(':checked')){
						 console.log('hola');
					 }else{
				 	   $("#modalCorreoElectronico").modal('hide');
				 	   $("#btnEditarCorreoElectronico").show();
				 	   guardarCorreoElectronico=true;
					 }
				 }else{
					 if($('#modalCorreoElectronico > div > div > div p.mensaje-error').length == 0)
				 			$('#modalCorreoElectronico > div > div > div:nth-child(2)').append('<p class="mensaje-error">Debe seleccionar una opción.</p>');
				 }
			 });
			 
			 var camposCorreoElectronico=false;
			 //Opción Cuenta Personal Activar campos
			   	$('#radioPersonal').on('ifChecked', function(event){
			   		 $(".cuentaGenerica").hide();
			   		 if($('#modalCorreoElectronico p.mensaje-error').length > 0)
						$('#modalCorreoElectronico > div > div > div p').remove('.mensaje-error');
			   		 camposCorreoElectronico=true;
				});
			 
			   	$('#radioGenerica').on('ifChecked', function(event){
			   		 $(".cuentaGenerica").show();
			   		 $(".txtCuentaGenerica").val('');
			   		 $("#inputPropietario").val('ajcanale@pe.ibm.com');
			   		 if($('#modalCorreoElectronico p.mensaje-error').length > 0)
						$('#modalCorreoElectronico > div > div > div p').remove('.mensaje-error');
			   		 camposCorreoElectronico=true;
				});
			  	

//Funciones Modal INTERNET
				var guardarInternet=false;
				//Cuando el modal se oculta
				$('#modalInternet').on('hidden.bs.modal', function(){
					//Validar si ha sido seleccionado el botón "Guardar"
					if(!guardarInternet){
						if($('#chkInternet').is(':checked')){
							$('#chkInternet').bootstrapToggle('off');
						}
					}
				});
				
				//Activar/Desactivar Servicio Internet
				   $("#chkInternet").on( 'change', function() {
					    if( $(this).is(':checked') ) {
					        // Hacer algo si el checkbox ha sido seleccionado
					       $("#modalInternet").modal('show');
					    } else {
					        // Hacer algo si el checkbox ha sido deseleccionado
					        guardarInternet=false;
					    	$("#btnEditarInternet").hide();
					    	$('#cboInternet').val('-1');
					        $('#cboInternet').trigger('change');
					    }
					});
				   
				 //Guardar Internet
				 $('#btnGuardarInternet').click(function(){
					 	   $("#modalInternet").modal('hide');
					 	   $("#btnEditarInternet").show();
					 	  guardarInternet=true;
				 });

				 
//Funciones Modal PUESTO DE TRABAJO

				var guardarPuestoTrabajo=false;
				//Cuando el modal se oculta
				$('#modalPuestoTrabajo').on('hidden.bs.modal', function(){
					//Validar si ha sido seleccionado el botón "Guardar"
					if(!guardarPuestoTrabajo){
						if($('#chkPuestoTrabajo').is(':checked')){
							$('#chkPuestoTrabajo').bootstrapToggle('off');
						}
					}
				});
				
				 //Activar/Desactivar Puesto de Trabajo
				 $("#chkPuestoTrabajo").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				       $("#modalPuestoTrabajo").modal('show');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       guardarPuestoTrabajo=false;
				   	   $("#btnEditarPuestoTrabajo").hide();
				   	   $("input[name=optRadioTipoActivo]").iCheck('uncheck');
				    }
				  });
				  
				 //Guardar Puesto de Trabajo
				 $('#btnGuardarPuestoTrabajo').click(function(){
				    $("#modalPuestoTrabajo").modal('hide');
				    $("#btnEditarPuestoTrabajo").show();
				    guardarPuestoTrabajo=true;
				 });
				 
				 //Opción Tipo de activo - Activación combo Accion

			 
			   	$('input[name=optRadioTipoActivo]').on('ifChecked', function(event){
			   		 $(".codigoActivo").hide();
			   		 $("#cboPuestoTrabajo").removeAttr('disabled');
			   		 $('#inputCodigoActivo').val('');
			   		 $("#cboPuestoTrabajo").val('-1');
			   		 $("#cboPuestoTrabajo").trigger('change');
				});
			   	
			   	$('input[name=optRadioTipoActivo]').on('ifUnchecked', function(event){
			   		 $(".codigoActivo").hide();
			   		 $("#cboPuestoTrabajo").attr('disabled', 'disabled');
			   		 $("#cboPuestoTrabajo").val('-1');
			   		 $("#cboPuestoTrabajo").trigger('change');
				});
			   	
				 //Activación/Desactivación Codigo Activo
				 $("#cboPuestoTrabajo").on( 'change', function() {
						
						var option = $("#cboPuestoTrabajo").val();
						
						switch(option){
						
						case "1":
							$(".codigoActivo").hide();
							break;
						case "2":
							$(".codigoActivo").show();
							break;						
						}
				 });


//Funciones Modal EQUIPO TELEFONICO

				var guardarEquipoTelefonico=false;
				//Cuando el modal se oculta
				$('#modalEquipoTelefonico').on('hidden.bs.modal', function(){
					//Validar si ha sido seleccionado el botón "Guardar"
					if(!guardarEquipoTelefonico){
						if($('#chkEquipoTelefonico').is(':checked')){
							$('#chkEquipoTelefonico').bootstrapToggle('off');
						}
					}
				});
				
				 //Activar/Desactivar servicio Equipo Telefonico
				 $("#chkEquipoTelefonico").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				       $("#modalEquipoTelefonico").modal('show');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $('#cboEquipoTelefonico').val(-1);
				       $('#cboEquipoTelefonico').trigger('change');
				       guardarEquipoTelefonico=false;
				   	   $("#btnEditarEquipoTelefonico").hide();
				   	   $(".EquipoTelefonico").hide();
				    }
				  });
				  
				 //Guardar Equipo Telefonico
				 $('#btnGuardarEquipoTelefonico').click(function(){
				    $("#modalEquipoTelefonico").modal('hide');
				    guardarEquipoTelefonico=true;
				    $("#btnEditarEquipoTelefonico").show();
				 });
				 
				 //Activación/Desactivación Numero Anexo
				 $("#cboEquipoTelefonico").on( 'change', function() {
						
						var option = $("#cboEquipoTelefonico").val();
						$('#inputNumeroAnexo').val('');
						
						switch(option){
						
						case "1":
							$(".EquipoTelefonico").hide();
							break;
						case "2":
							$(".EquipoTelefonico").show();
							break;						
						}
				 });
				 
				 
//Funciones Modal CLAVE DE LLAMADAS
				
				var guardarClaveLlamada=false;
				//Cuando el modal se oculta
				$('#modalClaveLlamada').on('hidden.bs.modal', function(){
					//Validar si ha sido seleccionado el botón "Guardar"
					if(!guardarClaveLlamada){
						if($('#chkClaveLlamada').is(':checked')){
							$('#chkClaveLlamada').bootstrapToggle('off');
						}
					}
				});
				
				 //Activar/Desactivar servicio Clave de Llamadas
				 $("#chkClaveLlamada").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				       $("#modalClaveLlamada").modal('show');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       guardarClaveLlamada=false;
				       $(".claveLlamada").iCheck('uncheck');
				   	   $("#btnEditarClaveLlamada").hide();
				    }
				  });
				  
				 //Guardar Clave de Llamadas
				 $('#btnGuardarClaveLlamada').click(function(){
				    $("#modalClaveLlamada").modal('hide');
				    guardarClaveLlamada=true;
				    $("#btnEditarClaveLlamada").show();
				 });
	
				 
//Funciones Modal LICENCIA O365
				
				var guardarLicenciaO365=false;
				//Cuando el modal se oculta
				$('#modalLicenciaO365').on('hidden.bs.modal', function(){
					//Validar si ha sido seleccionado el botón "Guardar"
					if(!guardarLicenciaO365){
						if($('#chkLicenciaO365').is(':checked')){
							$('#chkLicenciaO365').bootstrapToggle('off');
						}
					}
				});
				
				 //Activar/Desactivar Puesto de Trabajo
				 $("#chkLicenciaO365").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				       $("#modalLicenciaO365").modal('show');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       guardarLicenciaO365=false;
				   	   $("#btnEditarLicenciaO365").hide();
				   	   $("input[name=optRadioTipoLicencia]").iCheck('uncheck');
				    }
				  });
				  
				 //Guardar Puesto de Trabajo
				 $('#btnGuardarLicenciaO365').click(function(){
				    $("#modalLicenciaO365").modal('hide');
				    guardarLicenciaO365=true;
				    $("#btnEditarLicenciaO365").show();
				 });				 
				  
				 
//Funciones Modal OTRO EQUIPO

				var guardarOtroEquipo=false;
				//Cuando el modal se oculta
				$('#modalOtroEquipo').on('hidden.bs.modal', function(){
					//Validar si ha sido seleccionado el botón "Guardar"
					if(!guardarOtroEquipo){
						if($('#chkOtroEquipo').is(':checked')){
							$('#chkOtroEquipo').bootstrapToggle('off');
						}
					}
				});

				 //Activar/Desactivar Puesto de Trabajo
				 $("#chkOtroEquipo").on( 'change', function() {
				    if( $(this).is(':checked') ) {
				     // Hacer algo si el checkbox ha sido seleccionado
				       $("#modalOtroEquipo").modal('show');
				    } else {
				     // Hacer algo si el checkbox ha sido deseleccionado
				       $('#inputDescripcionOtroEquipo').val('');
				       guardarOtroEquipo=false;
				   	   $("#btnEditarOtroEquipo").hide();
				    }
				  });
				  
				 //Guardar Puesto de Trabajo
				 $('#btnGuardarOtroEquipo').click(function(){
				    $("#modalOtroEquipo").modal('hide');
				    guardarOtroEquipo=true;
				    $("#btnEditarOtroEquipo").show();
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
	  			$('<option></option>')		
  	);
	
	var optionSelect = [];

	switch(option){
	
	case "1":
		$("#idcboAccion").removeAttr('disabled');

		optionSelect.push("Usuario nuevo");
		optionSelect.push("Usuario temporal");
		optionSelect.push("Sólo usuario de red");
		
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
		optionSelect.push("Cambio de área y/o puesto");
		
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
		optionSelect.push("Baja de usuario");
		$('#idcboAccion').append(
	  			$('<option>',{
	  				value: 1,
	  				text: optionSelect[0]
	  			})		
	  		);
		$("#idcboAccion").val('1').trigger('change');
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