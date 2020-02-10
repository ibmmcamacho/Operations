<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SCHEDULE  | CROSS</title>
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
            Mantenimiento
            <small>Actividad</small>
          </h1>
          <ol class="breadcrumb">
            <li><i class="fa fa-th-large"></i> Schedule</li>
            <li class="active"> Administrar Actividad</li>
          </ol>
        </section>
		
        <!-- Main content -->
        <section class="content">
           <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalNew" onclick="limpiarModalNew()"><i class="fa fa-file-text-o fa-sm"></i> Nuevo</button>
           <button title="Actualizar lista de Actividades" type="button" class="btn btn-info" onclick="listar()"><i class="fa fa-refresh fa-sm"></i> Actualizar</button>  
           <br><br> 
            
         <div id="alertaConfirmacion" class="alert alert-success alert-dismissable fade in" style='display:none;'>
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong>¡Éxito!</strong>  Su operación se ha realizado satisfactoriamente.
		  </div>
		  
		  <div id="alertaNegativa" class="alert alert-danger alert-dismissable fade in" style='display:none;'>
		    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    <strong>¡Error!</strong>  Su operación no se ha realizado.
		  </div>

<!--      INICIO MODAL  NUEVO  -->
         <div class="modal fade" id="modalNew" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
         <div class="modal-dialog" role="document">
         <div class="modal-content">
         <div class="modal-header" style="background-color: #68DFF0">
	         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	         	<span aria-hidden="true">&times;</span>
	         </button>
         <h4 class="modal-title" id="exampleModalLongTitle"><a style="color:white">Registro de nueva Actividad</a><a style="color:red;font-weight: bold;"></a></h4>
         </div>
         
         <div class="modal-body">                                                                           
                 
                                                                                  
	         <label for="recipient-name" class="control-label">Turno</label>
	         <p id="alerticboTurno" class="text-danger" style='display:none;'></p>
	         <select class="form-control select2" name="c_turno" style="width: 100%;" id="icboTurno">
	         <option value=""> --SELECCIONE-- </option>
	         </select>
	         <br><br>
                                                              
         	<label for="recipient-name" class="control-label">Hora Ejecución</label>
         	<p id="alertiHoraEjecucion" class="text-danger" style='display:none;'></p>
	     	<div class="input-group clockpicker">
			<input type="text" class="form-control" id="iHoraEjecucion" readonly>
			<span class="input-group-addon">
			<span class="glyphicon glyphicon-time"></span>
			</span>
			</div>																		
			<br>
															                
			<label for="recipient-name" class="control-label">Descripcion</label>
			<p id="alertiDescripcion" class="text-danger" style='display:none;'></p>
            <input type="text" style="width: 100%;" class="form-control" name="t_desc" 
            onkeypress="return validar(event)" id="iDescripcion">
            <br>
                                                                            
            <label for="recipient-name" class="control-label">Hora Termino</label>
            <p id="alertiHoraTermino" class="text-danger" style='display:none;'></p>
	        <div class="input-group clockpicker">
			<input type="text" class="form-control" id="iHoraTermino" readonly>
			<span class="input-group-addon">
			<span class="glyphicon glyphicon-time"></span>
			</span>
			</div>																		
			<br>
															                
			<label for="recipient-name" class="control-label">Plataforma</label>
			<p id="alerticboPlataforma" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_plataforma" style="width: 100%;" id="icboPlataforma">
            <option value=""> --SELECCIONE-- </option>
            </select>
            <br><br>
                                                                            
            <label for="recipient-name" class="control-label">Tipo Respaldo</label>
            <p id="alerticboTipoRespaldo" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_tipo_respaldo" style="width: 100%;" id="icboTipoRespaldo">
            <option value=""> --SELECCIONE-- </option>
            </select>
            <br><br>
                                                                            
            <label for="recipient-name" class="control-label">Periodo</label>
            <p id="alerticboPeriodo" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_periodo" style="width: 100%;" id="icboPeriodo">
            <option value=""> --SELECCIONE-- </option>
            </select>
            <br><br>
                                                                           
            <label for="recipient-name" class="control-label">Sede</label>
            <p id="alerticboSede" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_sede" style="width: 100%;" id="icboSede">
            <option value=""> --SELECCIONE-- </option>
            </select>
            <br><br>
                                                                            
            <label for="recipient-name" class="control-label">Procedimiento</label>
            <p id="alerticboProcedimiento" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_procedimiento" style="width: 100%;" id="icboProcedimiento">
            <option value=""> --SELECCIONE-- </option>
            </select>
            <br><br>
                                                                           
            <label for="recipient-name" class="control-label">Servidor</label>
            <p id="alerticboServidor" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_servidor" style="width: 100%;" id="icboServidor">
            <option value=""> --SELECCIONE-- </option>
            </select>
            <br><br>
                                                                            
            <label for="recipient-name" class="control-label">Cliente</label>
            <p id="alerticboCliente" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_cliente" style="width: 100%;" id="icboCliente">
            <option value=""> --SELECCIONE-- </option>
            </select>
            <br><br>
                 
            <label for="recipient-name" class="control-label">Estado</label>
            <p id="alerticboEstado" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_estado" style="width: 100%;" id="icboEstado">
            <option value=""> --SELECCIONE-- </option>
            <option value="0"> INACTIVO </option>
            <option value="1"> ACTIVO </option>
            </select>
            <br><br>
                                                                            
            <label for="recipient-name" class="control-label">Job Stream</label>
            <p id="alertiJobStream" class="text-danger" style='display:none;'></p>
            <input type="text" style="width: 100%;" class="form-control" name="t_job_stream" id="iJobStream" onkeypress="return validar(event)">
            <br>
                                                                            
            <label for="recipient-name" class="control-label">Comentario</label>
            <p id="alertiComentario" class="text-danger" style='display:none;'></p>
            <textarea name="ta_comentario" id="iComentario" class="form-control" rows="8" onkeypress="return validar(event)" required></textarea>
            <br>
                                                                            
            <label for="recipient-name" class="control-label">Ventana Máxima</label>
            <p id="alertiVentanaMax" class="text-danger" style='display:none;'></p>
	        <div class="input-group clockpicker">
			<input type="text" class="form-control" id="iVentanaMax" readonly>
			<span class="input-group-addon">
			<span class="glyphicon glyphicon-time"></span>
			</span>
			</div>																		
			<br>
															                
			<label for="recipient-name" class="control-label">Acción</label>
			<p id="alertiAccion" class="text-danger" style='display:none;'></p>
            <input type="text" style="width: 100%;" class="form-control" name="t_accion" onkeypress="return validar(event)" id="iAccion">
            <br>
                                                                           
            <label for="recipient-name" class="control-label">TWS</label>
            <p id="alerticboTWS" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_estado" style="width: 100%;" id="icboTWS">
            <option value=""> --SELECCIONE-- </option>
            <option value="1"> SI </option>
            <option value="2"> NO </option>
            </select>
            <br><br>
                                                                    
            <label for="recipient-name" class="control-label">Tipo Actividad</label>
            <p id="alerticboTipoActividad" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_estado" style="width: 100%;" id="icboTipoActividad">
            <option value=""> --SELECCIONE-- </option>
            </select>
            <br><br>
             <p id="mensajeNew" class="text-danger" style='display:none;'></p>                                                                   
      </div>
      <div class="modal-footer">
            <button id="btnRegistrar" type="submit" class="btn btn-primary" ><i class="fa fa-floppy-o"></i> Guardar</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
      </div>
   </div>
   </div>
   </div>
<!--      FIN MODAL NUEVO -->  

         
<!--      INICIO MODAL EDITAR -->
         <div class="modal fade" id="modalEdit" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
         <div class="modal-dialog" role="document">
         <div class="modal-content">
         <div class="modal-header" style="background-color: #68DFF0">
	         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	         	<span aria-hidden="true">&times;</span>
	         </button>
         <h4 class="modal-title" id="exampleModalLongTitle"><a style="color:white">Editar Actividad</a><a style="color:red;font-weight: bold;"></a></h4>
         </div>
         
         <div class="modal-body">                                                                           
              
             <input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="uNumeracion">    
             <input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="uId"> 
                                                                        
	         <label for="recipient-name" class="control-label">Turno</label>
	         <p id="alertucboTurno" class="text-danger" style='display:none;'></p>
	         <select class="form-control select2" name="c_turno" style="width: 100%;" id="ucboTurno" required>
	         <option value=""> --SELECCIONE-- </option>
	         </select>
	         <br><br>
                                                              
         	<label for="recipient-name" class="control-label">Hora Ejecución</label>
         	<p id="alertuHoraEjecucion" class="text-danger" style='display:none;'></p>
	     	<div class="input-group clockpicker">
			<input type="text" class="form-control" id="uHoraEjecucion" readonly >
			<span class="input-group-addon">
			<span class="glyphicon glyphicon-time"></span>
			</span>
			</div>																		
			<br>
															                
			<label for="recipient-name" class="control-label">Descripcion</label>
			<p id="alertuDescripcion" class="text-danger" style='display:none;'></p>
            <input type="text" style="width: 100%;" class="form-control" name="t_desc" onkeypress="return validar(event)"  id="uDescripcion">
            <br>
                                                                            
            <label for="recipient-name" class="control-label">Hora Termino</label>
            <p id="alertuHoraTermino" class="text-danger" style='display:none;'></p>
	        <div class="input-group clockpicker">
			<input type="text" class="form-control" id="uHoraTermino" readonly>
			<span class="input-group-addon">
			<span class="glyphicon glyphicon-time"></span>
			</span>
			</div>																		
			<br>
															                
			<label for="recipient-name" class="control-label">Plataforma</label>
			<p id="alertucboPlataforma" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_plataforma" style="width: 100%;" id="ucboPlataforma">
            <option value=""> --SELECCIONE-- </option>
            </select>
            <br><br>
                                                                            
            <label for="recipient-name" class="control-label">Tipo Respaldo</label>
            <p id="alertucboTipoRespaldo" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_tipo_respaldo" style="width: 100%;" id="ucboTipoRespaldo">
            <option value=""> --SELECCIONE-- </option>
            </select>
            <br><br>
                                                                            
            <label for="recipient-name" class="control-label">Periodo</label>
            <p id="alertucboPeriodo" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_periodo" style="width: 100%;" id="ucboPeriodo">
            <option value=""> --SELECCIONE-- </option>
            </select>
            <br><br>
                                                                           
            <label for="recipient-name" class="control-label">Sede</label>
            <p id="alertucboSede" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_sede" style="width: 100%;" id="ucboSede">
            <option value=""> --SELECCIONE-- </option>
            </select>
            <br><br>
                                                                            
            <label for="recipient-name" class="control-label">Procedimiento</label>
            <p id="alertucboProcedimiento" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_procedimiento" style="width: 100%;" id="ucboProcedimiento">
            <option value=""> --SELECCIONE-- </option>
            </select>
            <br><br>
                                                                           
            <label for="recipient-name" class="control-label">Servidor</label>
            <p id="alertucboServidor" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_servidor" style="width: 100%;" id="ucboServidor">
            <option value=""> --SELECCIONE-- </option>
            </select>
            <br><br>
                                                                            
            <label for="recipient-name" class="control-label">Cliente</label>
            <p id="alertucboCliente" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_cliente" style="width: 100%;" id="ucboCliente">
            <option value=""> --SELECCIONE-- </option>
            </select>
            <br><br>
                 
            <label for="recipient-name" class="control-label">Estado</label>
            <p id="alertucboEstado" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_estado" style="width: 100%;" id="ucboEstado">
            <option value=""> --SELECCIONE-- </option>
            <option value="0"> INACTIVO </option>
            <option value="1"> ACTIVO </option>
            </select>
            <br><br>
                                                                            
            <label for="recipient-name" class="control-label">Job Stream</label>
            <p id="alertuJobStream" class="text-danger" style='display:none;'></p>
            <input type="text" style="width: 100%;" class="form-control" name="t_job_stream" id="uJobStream" onkeypress="return validar(event)" >
            <br>
                                                                            
            <label for="recipient-name" class="control-label">Comentario</label>
            <p id="alertuComentario" class="text-danger" style='display:none;'></p>
            <textarea name="ta_comentario" id="uComentario" class="form-control" rows="8" onkeypress="return validar(event)" required></textarea>
            <br>
                                                                            
            <label for="recipient-name" class="control-label">Ventana Máxima</label>
            <p id="alertuVentanaMax" class="text-danger" style='display:none;'></p>
	        <div class="input-group clockpicker">
			<input type="text" class="form-control" id="uVentanaMax" readonly>
			<span class="input-group-addon">
			<span class="glyphicon glyphicon-time"></span>
			</span>
			</div>																		
			<br>
															                
			<label for="recipient-name" class="control-label">Acción</label>
			<p id="alertuAccion" class="text-danger" style='display:none;'></p>
            <input type="text" style="width: 100%;" class="form-control" name="t_accion" onkeypress="return validar(event)"  id="uAccion">
            <br>
                                                                           
            <label for="recipient-name" class="control-label">TWS</label>
            <p id="alertucboTWS" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_estado" style="width: 100%;" id="ucboTWS">
            <option value=""> --SELECCIONE-- </option>
            <option value="1"> SI </option>
            <option value="2"> NO </option>
            </select>
            <br><br>
                                                                            
            <label for="recipient-name" class="control-label">Tipo Actividad</label>
            <p id="alertucboTipoActividad" class="text-danger" style='display:none;'></p>
            <select class="form-control select2" name="c_estado" style="width: 100%;" id="ucboTipoActividad">
            <option value=""> --SELECCIONE-- </option>
            </select>
            <br><br>
            
            <hr>
            
            <label for="recipient-name" class="control-label" style="width: 100%;"><p class="bg-primary text-center" ><strong>MOTIVO</strong></p></label>
			<p id="alertuMotivo" class="text-danger" style='display:none;'></p>
            <input type="text" style="width: 100%;" class="form-control" name="t_desc" onkeypress="return validar(event)" id="uMotivo"
            placeholder="Ingrese el motivo de la actualización">
            <br>
            <hr>
             <p id="mensajeEdit" class="text-danger" style='display:none;'></p>                                                                   
      </div>
      
      <div class="modal-footer">
            <button id="btnActualizar" type="submit" class="btn btn-primary" ><i class="fa fa-floppy-o"></i> Guardar</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-reply"></i> Cerrar</button>
      </div>

   </div>
   </div>
   </div>
<!--      FIN MODAL EDITAR -->         

<!--      INICIO MODAL  HISTORIAL  -->

         <div class="modal fade" id="modalHistory" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
         <div class="modal-dialog modal-lg" role="document">
         <div class="modal-content">
         <div class="modal-header" style="background-color: #68DFF0">
	         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	         	<span aria-hidden="true">&times;</span>
	         </button>
         <h4 class="modal-title" id="exampleModalLongTitle"><a style="color:white">Historial Actividad</a><a style="color:red;font-weight: bold;"></a></h4>
         </div>
         
         <div class="modal-body">                                                                           
                 
              <div class="row"> 
              <div class="col-12">
                
                
                <div class="box-body">
                <div class="table-responsive">
                  <table id="example2" class="table table-bordered table-striped table-responsive table-hover"
                  class="display" width="99%" cellspacing="0" style="font-size:10px; font-weight:bold">
                    <thead class="bg-primary">
                      <tr>
                        <th>TURNO</th>
                        <th>SEDE</th>
                        <th>HORA EJECUCIÓN</th>
                        <th>DESCRIPCIÓN</th>
                        <th>HORA TERMINO</th>
                        <th>PERIODO</th>
                        <th>PLATAFORMA</th>
                        <th>PROCEDIMIENTO</th>
                        <th>SERVIDOR</th>
                        <th>CLIENTE</th>
                        <th>JOBSTREAM</th>
                        <th>TIPO ACTIVIDAD</th>
                        <th>ESTADO</th>
                        <th>USUARIO</th>
                        <th>FECHA</th>
                        <th>TIPO</th>
                        <th>MOTIVO</th>
                      </tr>
                    </thead>
                    <thead class="filters2" >
			         <tr>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
			         </tr>
			        </thead>
                    
                  </table>
                  </div>
                </div><!-- /.box-body -->
         
             </div>
         </div>
          <!-- END TYPOGRAPHY -->                                                
                                                
      </div>
      <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="limpiarModalHistorial()"><i class="fa fa-reply"></i> Cerrar</button>
      </div>
   </div>
   </div>
   </div>
<!--      FIN MODAL HISTORIAL -->         

<!--      INICIO MODAL  MOTIVO ACTIVACION / DESACTIVACION  -->

         <div class="modal fade" id="modalEstado" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
         <div class="modal-dialog modal-lg" role="document">
         <div class="modal-content">
         <div class="modal-header" style="background-color: #68DFF0">
	         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	         	<span aria-hidden="true">&times;</span>
	         </button>
         <h4 class="modal-title" id="exampleModalLongTitle"><a style="color:white">ACTIVIDAD - MODIFICACIÓN DE ESTADO </a><a style="color:red;font-weight: bold;"></a></h4>
         </div>
         
         <div class="modal-body">                                                                           
                
                <label for="recipient-name" class="control-label">Motivo</label>
	            <p id="alertMotivo" class="text-danger" style='display:none;'></p>
	            <textarea name="ta_motivo" id="iMotivo" class="form-control" rows="6" onkeypress="return validar(event)" required></textarea>
	            <br>
	            <input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_Numeracion"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_Id"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_cboTurno"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_cboPlataforma"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_cboTipoRespaldo"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_cboSede"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_cboProcedimiento"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_cboServidor"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_cboCliente"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_cboTipoActividad"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_cboPeriodo"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_cboEstado"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_cboTWS"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_HoraEjecucion"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_Descripcion"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_HoraTermino"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_JobStream"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_Comentario"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_VentanaMax"> 
            	<input type="hidden" style="width: 100%;" class="form-control" name="t_desc" id="temp_Accion">          
                                            

                                                                        
      </div>
      <div class="modal-footer">
      		<button id="btnEstado" type="submit" class="btn btn-primary" ><i class="fa fa-floppy-o"></i> Guardar</button>
            <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="limpiarModalEstado()"><i class="fa fa-reply"></i> Cerrar</button>
      </div>
   </div>
   </div>
   </div>
<!--      FIN MODAL MOTIVO ACTIVACION / DESACTIVACION -->                                                     
         
         <div class="row"> 
             <div class="col-md-12">
                <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Resultados de Busqueda</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                <div class="table-responsive">
                  <table id="example1" class="table table-bordered table-striped table-responsive table-hover"
                  class="display" width="99%" cellspacing="0" style="font-size:10px; ">
                    <thead class="bg-primary">
                      <tr>
                        <th>N</th>
                        <th>TEAM</th>
                        <th>TURNO</th>
                        <th>SEDE</th>
                        <th>HORA EJECUCIÓN</th>
                        <th>DESCRIPCIÓN</th>
                        <th>HORA TERMINO</th>
                        <th>PERIODO</th>
                        <th>PLATAFORMA</th>
                        <th>PROCEDIMIENTO</th>
                        <th>SERVIDOR</th>
                        <th>CLIENTE</th>
                        <th>JOBSTREAM</th>
                        <th>TIPO ACTIVIDAD</th>
                        <th>ESTADO</th>
                        <th>ACCIONES</th>
                      </tr>
                    </thead>
                    <thead class="filters" >
			         <tr>
			         	<th style="border: hidden"></th>
			            <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden"></th>
                        <th style="border: hidden" hidden></th>
			         </tr>
			        </thead>
                    
                  </table>
                  </div>
                </div><!-- /.box-body -->
              </div><!-- /.box --> 
             </div>
         </div>
          <!-- END TYPOGRAPHY -->

        </section><!-- /.content -->
<!-- 		     </div>  -->
 <!-- /.content-wrapper -->
      </aside>

    <!-- page script -->
    
<script>
        $(document).ready(function() {
        	
        	
        refreshCombos();	
        setTimeout("listar()", 3000);
        }); // Fin del $(document)
        
        function limpiarModalNew(){
        	
        	$('#icboPlataforma').val("").trigger('change');
        	$('#icboTipoRespaldo').val("").trigger('change');
        	$('#icboSede').val("").trigger('change');
        	$('#icboProcedimiento').val("").trigger('change');
        	$('#icboServidor').val("").trigger('change');
        	$('#icboCliente').val("").trigger('change');
        	$('#icboTipoActividad').val("").trigger('change');
        	$('#icboTurno').val("").trigger('change');
        	$('#icboPeriodo').val("").trigger('change');
        	$('#icboEstado').val("").trigger('change');
			$('#icboTWS').val("").trigger('change');
			$('#iHoraEjecucion').val('00:00');
			$('#iDescripcion').val("");
			$('#iHoraTermino').val('00:00');
			$('#iJobStream').val("");
			$('#iComentario').val("");
			$('#iVentanaMax').val('00:00');
			$('#iAccion').val("");
        }
        
        function refreshCombos(){
        	listarComboTurno();	
            listarComboPeriodo();
            listarComboOption();

        }
      //Inicio Registrar Actividad
		 $('#btnRegistrar').click(function(){

			limpiarAlertasNew();

			var icboTurno = $('#icboTurno').val(); 
			var icboPlataforma = $('#icboPlataforma').val();
			var icboTipoRespaldo = $('#icboTipoRespaldo').val();
			var icboSede = $('#icboSede').val();
			var icboProcedimiento = $('#icboProcedimiento').val();
			var icboServidor = $('#icboServidor').val();
			var icboCliente = $('#icboCliente').val();
			var icboTipoActividad = $('#icboTipoActividad').val();
			var icboPeriodo = $('#icboPeriodo').val();
			var icboEstado = $('#icboEstado').val();
			var icboTWS = $('#icboTWS').val();
			var iHoraEjecucion = $('#iHoraEjecucion').val();
			var iDescripcion = $('#iDescripcion').val().replace(/['"]+/g,'\\\'').trim();
			var iHoraTermino = $('#iHoraTermino').val();
			var iJobStream = $('#iJobStream').val().replace(/[^a-zA-Z 0-9.]+/g,' ').trim();
			var iComentario = $('#iComentario').val().split("\n").join(" ").replace(/[^a-zA-Z 0-9.]+/g,' ').replace(/['"]+/g,'\\\'').trim();
			var iVentanaMax = $('#iVentanaMax').val();
			var iAccion = $('#iAccion').val().replace(/[^a-zA-Z 0-9.]+/g,' ').trim();

			var resultado;
			 
			resultado = validarModalNew();
			 
			 if (resultado == "0"){
				 var src = "ServletActividad";	
				 	$.post(src, {strAccion:"1" ,strTurno: icboTurno ,strPlataforma: icboPlataforma ,strTipoRespaldo: icboTipoRespaldo,strSede: icboSede ,strProcedimiento: icboProcedimiento ,strServidor: icboServidor ,
				  		strCliente: icboCliente ,strTipoActividad: icboTipoActividad ,strPeriodo: icboPeriodo ,strEstado: icboEstado ,strTWS: icboTWS ,strHoraEjecucion: iHoraEjecucion ,strDescripcion: iDescripcion ,strHoraTermino: iHoraTermino ,strJobStream: iJobStream ,
				  		strComentario: iComentario ,strVentanaMax: iVentanaMax ,accion: iAccion }, 
				 		function(pdata) {   
				  			var obj = JSON.parse(pdata);
			 	  			if(obj.RegistrarActividad[0].codigo == "0"){
		 	 	  				document.getElementById('mensajeNew').style.display = 'block';
		 	 	  				$("#mensajeNew").text(obj.RegistrarActividad[0].resultado);	 	  				
			 	  			}else{
			 	  				listar();
		 	 	  				document.getElementById('mensajeNew').style.display = 'none';
		 	 	  				$("#mensajeNew").text("");	
		 	 	  				$("#modalNew").modal('hide');	
		 	 	  				activarAlertaConfirmacion('alertaConfirmacion');
			 	  			}		    
				  		});//Fin del POST
			 }else{ // resultado  == "1" -- se detectan errores

			 }

		});//Fin Registrar Actividad
        
      //Inicio Actualizar Actividad
		 $('#btnActualizar').click(function(){

			 limpiarAlertasEdit();
			
			var numeracion = $('#uNumeracion').val().trim(); 
			var idActividad = $('#uId').val().trim(); 
			var ucboTurno = $('#ucboTurno').val().trim(); 
			var ucboPlataforma = $('#ucboPlataforma').val().trim();
			var ucboTipoRespaldo = $('#ucboTipoRespaldo').val().trim();
			var ucboSede = $('#ucboSede').val().trim();
			var ucboProcedimiento = $('#ucboProcedimiento').val().trim();
			var ucboServidor = $('#ucboServidor').val().trim();
			var ucboCliente = $('#ucboCliente').val().trim();
			var ucboTipoActividad = $('#ucboTipoActividad').val().trim();
			var ucboPeriodo = $('#ucboPeriodo').val().trim();
			var ucboEstado = $('#ucboEstado').val().trim();
			var ucboTWS = $('#ucboTWS').val().trim();
			var uHoraEjecucion = $('#uHoraEjecucion').val().trim();
			var uDescripcion = $('#uDescripcion').val().replace(/['"']+/g,'\\\'').trim();
			var uHoraTermino = $('#uHoraTermino').val().trim();
			var uJobStream = $('#uJobStream').val().replace(/[^a-zA-Z 0-9.]+/g,' ').trim();
			var uComentario = $('#uComentario').val().split("\n").join(" ").replace(/[^a-zA-Z 0-9.]+/g,' ').replace(/['"]+/g,'\\\'').trim();
			var uVentanaMax = $('#uVentanaMax').val().trim();
			var uAccion = $('#uAccion').val().replace(/[^a-zA-Z 0-9.]+/g,' ').trim();
			var uMotivo = $('#uMotivo').val().split("\n").join(" ").replace(/[^a-zA-Z 0-9.]+/g,' ').trim();

			var resultado;
			 
			resultado = validarModalEdit();
			 
			 if (resultado == "0"){
				 var src = "ServletActividad";	
				 	$.post(src, {strAccion:"3" ,strId: idActividad ,strTurno: ucboTurno ,strPlataforma: ucboPlataforma ,strTipoRespaldo: ucboTipoRespaldo,strSede: ucboSede ,strProcedimiento: ucboProcedimiento ,strServidor: ucboServidor ,
				  		strCliente: ucboCliente ,strTipoActividad: ucboTipoActividad ,strPeriodo: ucboPeriodo ,strEstado: ucboEstado ,strTWS: ucboTWS ,strHoraEjecucion: uHoraEjecucion ,strDescripcion: uDescripcion ,strHoraTermino: uHoraTermino ,strJobStream: uJobStream ,
				  		strComentario: uComentario ,strVentanaMax: uVentanaMax ,accion: uAccion , strMotivo: uMotivo}, 
				 		function(pdata) {   
				  			var obj = JSON.parse(pdata);
			 	  			if(obj.ActualizarActividad[0].codigo == "0"){
		 	 	  				document.getElementById('mensajeEdit').style.display = 'block';
		 	 	  				$("#mensajeEdit").text(obj.ActualizarActividad[0].resultado);	 	  				
			 	  			}else{
	 	  					
			 	  				// Inicio POST Consulta Actividad Actualizada en la BD
			 	  				
			 	  				$.post(src, {strAccion:"6" ,strIdActividad: idActividad}, 
						 		function(pdata) {   
						  			var obj = JSON.parse(pdata);
					 	  			if(obj.ListaActividad[0].idActividad != ""){
				 	 	  			
					 	  				var idActividad = obj.ListaActividad[0].idActividad;
	       							    var idTurno = obj.ListaActividad[0].idTurno;
	       							 	var descripcionTurno = obj.ListaActividad[0].descripcionTurno;
	       							 	var idSede = obj.ListaActividad[0].idSede;
	       							 	var descripcionSede = obj.ListaActividad[0].descripcionSede;
	       								var horaEjecucion = obj.ListaActividad[0].horaEjecucion;
	       								var descripcion = obj.ListaActividad[0].descripcion;
	       								var horaTermino = obj.ListaActividad[0].horaTermino;
	       								var idPeriodo = obj.ListaActividad[0].idPeriodo;
	       								var descripcionPeriodo = obj.ListaActividad[0].descripcionPeriodo;
	       								var idPlataforma = obj.ListaActividad[0].idPlataforma;
	       								var descripcionPlataforma = obj.ListaActividad[0].descripcionPlataforma;
	       								var idProcedimiento = obj.ListaActividad[0].idProcedimiento;
	       								var descripcionProcedimiento = obj.ListaActividad[0].descripcionProcedimiento;
	       								var idServidor = obj.ListaActividad[0].idServidor;
	       								var descripcionServidor = obj.ListaActividad[0].descripcionServidor;
	       								var idCliente = obj.ListaActividad[0].idCliente;
	       								var descripcionCliente = obj.ListaActividad[0].descripcionCliente;
	       								var jobStream = obj.ListaActividad[0].jobStream;
	       								var idTipoActividad = obj.ListaActividad[0].idTipoActividad;
	       								var descripcionTipoActividad = obj.ListaActividad[0].descripcionTipoActividad;
	       								var estado = obj.ListaActividad[0].estado;
	       								var accion = obj.ListaActividad[0].accion;
	       								var idTipoRespaldo = obj.ListaActividad[0].idTipoRespaldo;
	       								var descripcionTipoRespaldo = obj.ListaActividad[0].descripcionTipoRespaldo;
	       								var duracion = obj.ListaActividad[0].duracion;
	       								var comentario = obj.ListaActividad[0].comentario;
	       								var ventanaMax = obj.ListaActividad[0].ventanaMax;
	       								var tws = obj.ListaActividad[0].tws;
					 	  				var descripcionEstado = "";
					 	  				var btn = "";
					 	  				var descripcionTWS = "";
					 	  				var botonEdit = "";
	       								
	       								if(estado == "1"){
	       									descripcionEstado = "Activo";
	       								    btn = "<button title=\"Desactivar Actividad\" type=\"button\" class=\"btn bg-red\" onclick=\"editarEstado('"+idActividad+"','"+idTurno+"','"+idPlataforma+"', '"+idTipoRespaldo+"', '"+idSede+"', '"+idProcedimiento+"', '"+idServidor+"', '"+idCliente+"', '"+idTipoActividad+"' , '"+idPeriodo+"', '0','"+tws+"', "+
	    										" '"+horaEjecucion+"', '"+descripcion+"', '"+horaTermino+"', '"+jobStream+"', '"+comentario+"', '"+accion+"', '"+ventanaMax+"','"+numeracion+"' )\"><i class=\"fa fa-close\"></i></button>";	
	       								}else{
	       									descripcionEstado = "Inactivo";	
	       									btn = "<div class=\"btn-group\" role=\"group\"><button title=\"Activar Actividad\" type=\"button\" class=\"btn bg-green\"  onclick=\"editarEstado('"+idActividad+"','"+idTurno+"','"+idPlataforma+"', '"+idTipoRespaldo+"', '"+idSede+"', '"+idProcedimiento+"', '"+idServidor+"', '"+idCliente+"', '"+idTipoActividad+"' , '"+idPeriodo+"', '1','"+tws+"', "+
	    										" '"+horaEjecucion+"', '"+descripcion+"', '"+horaTermino+"', '"+jobStream+"', '"+comentario+"', '"+accion+"', '"+ventanaMax+"' ,'"+numeracion+"' )\"><i class=\"fa fa-check\"></i></button></div>";	
	       									
	       								}
	       								
	       								if(tws == "1"){
	       									descripcionTWS = "Si";
	       								}else{
	       									descripcionTWS = "No";
	       								}
	       								
	       								botonEdit = "<button title=\"Editar Actividad\" type=\"button\" class=\"btn bg-yellow\"  data-toggle=\"modal\" data-target=\"#modalEdit\" "+  
													"onclick=\"modalEditar('"+idActividad+"','"+idTurno+"','"+idPlataforma+"', '"+idTipoRespaldo+"', '"+idSede+"', '"+idProcedimiento+"', "+ 
													"'"+idServidor+"', '"+idCliente+"', '"+idTipoActividad+"' , '"+idPeriodo+"', '"+estado+"','"+tws+"', '"+horaEjecucion+"', '"+descripcion+"',"+ 
													"'"+horaTermino+"', '"+jobStream+"', '"+comentario+"', '"+accion+"', '"+ventanaMax+"' ,'"+numeracion+"'  )\"> "+
													"<i class=\"fa fa-edit\"></i></button>"+
													btn+
													"<button title=\"Ver historial\" type=\"button\" class=\"btn bg-blue\"  data-toggle=\"modal\" data-target=\"#modalHistory\" "+  
													"onclick=\"listarHistorial('"+idActividad+"' )\"><i class=\"fa fa-history\"></i></button>"; 
	       								
										//Actualización valores del datatable actualizado
													
	       								$("#pTurno"+numeracion).text(descripcionTurno);
	    		 	 	  				$("#pSede"+numeracion).text(descripcionSede);
	    		 	 	  				$("#pHEjecucion"+numeracion).text(horaEjecucion);
	    		 	 	  				$("#pDescripcion"+numeracion).text(descripcion);
	    		 	 	  				$("#pHTermino"+numeracion).text(horaTermino);
	    		 	 	  				$("#pPeriodo"+numeracion).text(descripcionPeriodo);
	    		 	 					$("#pPlataforma"+numeracion).text(descripcionPlataforma);
	    		 	 					$("#pProcedimiento"+numeracion).text(descripcionProcedimiento);
	    		 	 					$("#pServidor"+numeracion).text(descripcionServidor);
	    		 	 					$("#pCliente"+numeracion).text(descripcionCliente);
	    		 	 					$("#pJobStream"+numeracion).text(uJobStream);
	    		 	 					$("#pTipoActividad"+numeracion).text(descripcionTipoActividad);
	    		 	 					$("#pEstado"+numeracion).text(descripcionEstado);
	    		 	 					$("#divBoton"+numeracion).empty().append(botonEdit);
					 	  				
	    		 	 					
	    		 	 				
	    		 	 					document.getElementById('mensajeEdit').style.display = 'none';
	    		 	 	  				$("#mensajeEdit").text("");	
	    		 	 	  				$("#modalEdit").modal('hide');	
	    		 	 	  				activarAlertaConfirmacion('alertaConfirmacion'); 	
		       							
					 	  			}else{
					 	  				//No se encontró la actividad
			 	  					} 
					 	  			
						  		});//Fin del POST Consulta Actividad Actualizada en la BD
							
							
			 	  			
				  			}
			 	  			$('#uMotivo').val();
				  		});//Fin del POST
			 
			 }else{ // resultado  == "1" -- se detectan errores
			 }

		});//Fin Actualizar Actividad
   
		//Inicio Registrar MOTIVO CAMBIO DE ESTADO
		 $('#btnEstado').click(function(){

			 limpiarAlertasEstado();

			var pMotivo= $('#iMotivo').val().split("\n").join(" ").trim();
			var numeracion = $('#temp_Numeracion').val().trim(); 
			var idActividad = $('#temp_Id').val().trim(); 
			var pIdTurno = $('#temp_cboTurno').val().trim(); 
			var pIdPlataforma = $('#temp_cboPlataforma').val().trim();
			var pIdTipoRespaldo = $('#temp_cboTipoRespaldo').val().trim();
			var pIdSede = $('#temp_cboSede').val().trim();
			var pIdProcedimiento = $('#temp_cboProcedimiento').val().trim();
			var pIdServidor = $('#temp_cboServidor').val().trim();
			var pIdCliente = $('#temp_cboCliente').val().trim();
			var pIdTipoActividad = $('#temp_cboTipoActividad').val().trim();
			var pIdPeriodo = $('#temp_cboPeriodo').val().trim();
			var pEstado = $('#temp_cboEstado').val().trim();
			var pTWS = $('#temp_cboTWS').val().trim();
			var pHoraEjecucion = $('#temp_HoraEjecucion').val().trim();
			var pDescripcion = $('#temp_Descripcion').val().split("\n").join(" ").trim();
			var pHoraTermino = $('#temp_HoraTermino').val().trim();
			var pJobStream = $('#temp_JobStream').val().split("\n").join(" ").trim();
			var pComentario = $('#temp_Comentario').val().split("\n").join(" ").trim();
			var pVentanaMax = $('#temp_VentanaMax').val().trim();
			var pAccion = $('#temp_Accion').val().split("\n").join(" ").trim();

			var resultado;
			 
			resultado = validarModalEstado();
			 
			 if (resultado == "0"){
				 var src = "ServletActividad";	 
	        		//Inicio POST actualizar estado Turno
	        		  	$.post(src, {strAccion:"4", strId: idActividad ,strTurno: pIdTurno ,strPlataforma: pIdPlataforma ,strTipoRespaldo: pIdTipoRespaldo,
	        		  		strSede: pIdSede ,strProcedimiento: pIdProcedimiento ,strServidor: pIdServidor ,
					  		strCliente: pIdCliente ,strTipoActividad: pIdTipoActividad ,strPeriodo: pIdPeriodo ,strEstado: pEstado ,strTWS: pTWS ,
					  		strHoraEjecucion: pHoraEjecucion ,strDescripcion: pDescripcion ,strHoraTermino: pHoraTermino ,strJobStream: pJobStream ,
					  		strComentario: pComentario ,strVentanaMax: pVentanaMax ,accion: pAccion, strMotivo: pMotivo }, 
	        		 		function(pdata) {   
	        		  			var obj = JSON.parse(pdata);
	        		  			if(obj.ActualizarActividadEstado[0].codigo == "0"){
	        		  				activarAlertaConfirmacion('alertaNegativa');
	        		  				listar();
	        		  			}else{
	        		  			// Inicio POST Consulta Actividad Actualizada en la BD
				 	  				
				 	  				$.post(src, {strAccion:"6" ,strIdActividad: idActividad}, 
							 		function(pdata) {   
							  			var obj = JSON.parse(pdata);
						 	  			if(obj.ListaActividad[0].idActividad != ""){
					 	 	  			
						 	  				var idActividad = obj.ListaActividad[0].idActividad;
		       							    var idTurno = obj.ListaActividad[0].idTurno;
		       							 	var descripcionTurno = obj.ListaActividad[0].descripcionTurno;
		       							 	var idSede = obj.ListaActividad[0].idSede;
		       							 	var descripcionSede = obj.ListaActividad[0].descripcionSede;
		       								var horaEjecucion = obj.ListaActividad[0].horaEjecucion;
		       								var descripcion = obj.ListaActividad[0].descripcion;
		       								var horaTermino = obj.ListaActividad[0].horaTermino;
		       								var idPeriodo = obj.ListaActividad[0].idPeriodo;
		       								var descripcionPeriodo = obj.ListaActividad[0].descripcionPeriodo;
		       								var idPlataforma = obj.ListaActividad[0].idPlataforma;
		       								var descripcionPlataforma = obj.ListaActividad[0].descripcionPlataforma;
		       								var idProcedimiento = obj.ListaActividad[0].idProcedimiento;
		       								var descripcionProcedimiento = obj.ListaActividad[0].descripcionProcedimiento;
		       								var idServidor = obj.ListaActividad[0].idServidor;
		       								var descripcionServidor = obj.ListaActividad[0].descripcionServidor;
		       								var idCliente = obj.ListaActividad[0].idCliente;
		       								var descripcionCliente = obj.ListaActividad[0].descripcionCliente;
		       								var jobStream = obj.ListaActividad[0].jobStream;
		       								var idTipoActividad = obj.ListaActividad[0].idTipoActividad;
		       								var descripcionTipoActividad = obj.ListaActividad[0].descripcionTipoActividad;
		       								var estado = obj.ListaActividad[0].estado;
		       								var accion = obj.ListaActividad[0].accion;
		       								var idTipoRespaldo = obj.ListaActividad[0].idTipoRespaldo;
		       								var descripcionTipoRespaldo = obj.ListaActividad[0].descripcionTipoRespaldo;
		       								var duracion = obj.ListaActividad[0].duracion;
		       								var comentario = obj.ListaActividad[0].comentario;
		       								var ventanaMax = obj.ListaActividad[0].ventanaMax;
		       								var tws = obj.ListaActividad[0].tws;
						 	  				var descripcionEstado = "";
						 	  				var btn = "";
						 	  				var descripcionTWS = "";
						 	  				var botonEdit = "";
		       								
		       								if(estado == "1"){
		       									descripcionEstado = "Activo";
		       								    btn = "<button title=\"Desactivar Actividad\" type=\"button\" class=\"btn bg-red\" onclick=\"editarEstado('"+idActividad+"','"+idTurno+"','"+idPlataforma+"', '"+idTipoRespaldo+"', '"+idSede+"', '"+idProcedimiento+"', '"+idServidor+"', '"+idCliente+"', '"+idTipoActividad+"' , '"+idPeriodo+"', '0','"+tws+"', "+
		    										" '"+horaEjecucion+"', '"+descripcion+"', '"+horaTermino+"', '"+jobStream+"', '"+comentario+"', '"+accion+"', '"+ventanaMax+"','"+numeracion+"' )\"><i class=\"fa fa-close\"></i></button>";	
		       								}else{
		       									descripcionEstado = "Inactivo";	
		       									btn = "<div class=\"btn-group\" role=\"group\"><button title=\"Activar Actividad\" type=\"button\" class=\"btn bg-green\"  onclick=\"editarEstado('"+idActividad+"','"+idTurno+"','"+idPlataforma+"', '"+idTipoRespaldo+"', '"+idSede+"', '"+idProcedimiento+"', '"+idServidor+"', '"+idCliente+"', '"+idTipoActividad+"' , '"+idPeriodo+"', '1','"+tws+"', "+
		    										" '"+horaEjecucion+"', '"+descripcion+"', '"+horaTermino+"', '"+jobStream+"', '"+comentario+"', '"+accion+"', '"+ventanaMax+"' ,'"+numeracion+"' )\"><i class=\"fa fa-check\"></i></button></div>";	
		       									
		       								}
		       								
		       								if(tws == "1"){
		       									descripcionTWS = "Si";
		       								}else{
		       									descripcionTWS = "No";
		       								}
		       								
		       								botonEdit = "<button title=\"Editar Actividad\" type=\"button\" class=\"btn bg-yellow\"  data-toggle=\"modal\" data-target=\"#modalEdit\" "+  
														"onclick=\"modalEditar('"+idActividad+"','"+idTurno+"','"+idPlataforma+"', '"+idTipoRespaldo+"', '"+idSede+"', '"+idProcedimiento+"', "+ 
														"'"+idServidor+"', '"+idCliente+"', '"+idTipoActividad+"' , '"+idPeriodo+"', '"+estado+"','"+tws+"', '"+horaEjecucion+"', '"+descripcion+"',"+ 
														"'"+horaTermino+"', '"+jobStream+"', '"+comentario+"', '"+accion+"', '"+ventanaMax+"' ,'"+numeracion+"'  )\"> "+
														"<i class=\"fa fa-edit\"></i></button>"+
														btn+
														"<button title=\"Ver historial\" type=\"button\" class=\"btn bg-blue\"  data-toggle=\"modal\" data-target=\"#modalHistory\" "+  
														"onclick=\"listarHistorial('"+idActividad+"' )\"><i class=\"fa fa-history\"></i></button>"; 
		       								
											//Actualización valores del datatable actualizado
														
		       								$("#pTurno"+numeracion).text(descripcionTurno);
		    		 	 	  				$("#pSede"+numeracion).text(descripcionSede);
		    		 	 	  				$("#pHEjecucion"+numeracion).text(horaEjecucion);
		    		 	 	  				$("#pDescripcion"+numeracion).text(descripcion);
		    		 	 	  				$("#pHTermino"+numeracion).text(horaTermino);
		    		 	 	  				$("#pPeriodo"+numeracion).text(descripcionPeriodo);
		    		 	 					$("#pPlataforma"+numeracion).text(descripcionPlataforma);
		    		 	 					$("#pProcedimiento"+numeracion).text(descripcionProcedimiento);
		    		 	 					$("#pServidor"+numeracion).text(descripcionServidor);
		    		 	 					$("#pCliente"+numeracion).text(descripcionCliente);
		    		 	 					$("#pJobStream"+numeracion).text(jobStream);
		    		 	 					$("#pTipoActividad"+numeracion).text(descripcionTipoActividad);
		    		 	 					$("#pEstado"+numeracion).text(descripcionEstado);
		    		 	 					$("#divBoton"+numeracion).empty().append(botonEdit);
						 	  				
		    		 	 					
		    		 	 				
		    		 	 					$("#modalEstado").modal("hide");
			        		  				activarAlertaConfirmacion('alertaConfirmacion');	
			       							
						 	  			}else{
						 	  				//No se encontró la actividad
				 	  					} 
						 	  			
							  		});//Fin del POST Consulta Actividad Actualizada en la BD
								
							  		
	        		  				
	        		  				
	        		  			}		    
	        		  	});
	        		//Fin Actualizar estado Turno
			 }else{ // resultado  == "1" -- se detectan errores

			 }

		});//Fin Registrar MOTIVO CAMBIO DE ESTADO
        
		function limpiarAlertasEstado(){
        	document.getElementById("alertMotivo").style.display = 'none';
        	$("#alertMotivo").text("");
    	} // Fin funcion limpiarAlertasEdit
    
        function limpiarAlertasEdit(){
            	document.getElementById("alertucboTurno").style.display = 'none';
                 document.getElementById('alertucboPlataforma').style.display = 'none';
                 document.getElementById('alertucboTipoRespaldo').style.display = 'none';
                 document.getElementById('alertucboSede').style.display = 'none';
                 document.getElementById('alertucboProcedimiento').style.display = 'none';
                 document.getElementById('alertucboServidor').style.display = 'none';
                 document.getElementById('alertucboCliente').style.display = 'none';
                 document.getElementById('alertucboTipoActividad').style.display = 'none';
                 document.getElementById('alertucboPeriodo').style.display = 'none';
                 document.getElementById('alertucboEstado').style.display = 'none';
                 document.getElementById('alertucboTWS').style.display = 'none';
                 document.getElementById('alertuHoraEjecucion').style.display = 'none';
                 document.getElementById('alertuDescripcion').style.display = 'none';
                 document.getElementById('alertuHoraTermino').style.display = 'none';
                 document.getElementById('alertuJobStream').style.display = 'none';
                 document.getElementById('alertuComentario').style.display = 'none';
                 document.getElementById('alertuVentanaMax').style.display = 'none';
                 document.getElementById('alertuAccion').style.display = 'none';
                 document.getElementById('alertuMotivo').style.display = 'none';
        } // Fin funcion limpiarAlertasEdit
        
        function limpiarAlertasNew(){
        	document.getElementById("alerticboTurno").style.display = 'none';
             document.getElementById('alerticboPlataforma').style.display = 'none';
             document.getElementById('alerticboTipoRespaldo').style.display = 'none';
             document.getElementById('alerticboSede').style.display = 'none';
             document.getElementById('alerticboProcedimiento').style.display = 'none';
             document.getElementById('alerticboServidor').style.display = 'none';
             document.getElementById('alerticboCliente').style.display = 'none';
             document.getElementById('alerticboTipoActividad').style.display = 'none';
             document.getElementById('alerticboPeriodo').style.display = 'none';
             document.getElementById('alerticboEstado').style.display = 'none';
             document.getElementById('alerticboTWS').style.display = 'none';
             document.getElementById('alertiHoraEjecucion').style.display = 'none';
             document.getElementById('alertiDescripcion').style.display = 'none';
             document.getElementById('alertiHoraTermino').style.display = 'none';
             document.getElementById('alertiJobStream').style.display = 'none';
             document.getElementById('alertiComentario').style.display = 'none';
             document.getElementById('alertiVentanaMax').style.display = 'none';
             document.getElementById('alertiAccion').style.display = 'none';
    	} // Fin funcion limpiarAlertasNew
        
        function validarModalEdit(){
        	
        	limpiarAlertasEdit();
        	var flag = 0; // 0 validacion OK, 1 validación con alertas

			
        	var idActividad = $('#uId').val().trim(); 
			var ucboTurno = $('#ucboTurno').val().trim(); 
			var ucboPlataforma = $('#ucboPlataforma').val().trim();
			var ucboTipoRespaldo = $('#ucboTipoRespaldo').val().trim();
			var ucboSede = $('#ucboSede').val().trim();
			var ucboProcedimiento = $('#ucboProcedimiento').val().trim();
			var ucboServidor = $('#ucboServidor').val().trim();
			var ucboCliente = $('#ucboCliente').val().trim();
			var ucboTipoActividad = $('#ucboTipoActividad').val().trim();
			var ucboPeriodo = $('#ucboPeriodo').val().trim();
			var ucboEstado = $('#ucboEstado').val().trim();
			var ucboTWS = $('#ucboTWS').val().trim();
			var uHoraEjecucion = $('#uHoraEjecucion').val().trim();
			var uDescripcion = $('#uDescripcion').val().trim();
			var uHoraTermino = $('#uHoraTermino').val().trim();
			var uJobStream = $('#uJobStream').val().trim();
			var uComentario = $('#uComentario').val().trim();
			var uVentanaMax = $('#uVentanaMax').val().trim();
			var uAccion = $('#uAccion').val().trim();
			var uMotivo = $('#uMotivo').val().trim();
			
			if(idActividad == "" || idActividad == null){
				flag = 1;
				alert("Error al detectar idActividad");}
			if(ucboTurno == "" || ucboTurno == null){
				flag = 1;
                document.getElementById('alertucboTurno').style.display = 'block';
                $("#alertucboTurno").text("*Este campo es obligatorio");}
			if(ucboPlataforma == "" || ucboPlataforma == null){
				flag = 1;
                document.getElementById('alertucboPlataforma').style.display = 'block';
                $("#alertucboPlataforma").text("*Este campo es obligatorio");}
			if(ucboTipoRespaldo == "" || ucboTipoRespaldo == null){
				flag = 1;
                document.getElementById('alertucboTipoRespaldo').style.display = 'block';
                $("#alertucboTipoRespaldo").text("*Este campo es obligatorio");}
			if(ucboSede == "" || ucboSede == null){
				flag = 1;
                document.getElementById('alertucboSede').style.display = 'block';
                $("#alertucboSede").text("*Este campo es obligatorio");}
			if(ucboProcedimiento == "" || ucboProcedimiento == null){
				flag = 1;
                document.getElementById('alertucboProcedimiento').style.display = 'block';
                $("#alertucboProcedimiento").text("*Este campo es obligatorio");}
			if(ucboServidor == "" || ucboServidor == null){
				flag = 1;
                document.getElementById('alertucboServidor').style.display = 'block';
                $("#alertucboServidor").text("*Este campo es obligatorio");}
			if(ucboCliente == "" || ucboCliente == null){
				flag = 1;
                document.getElementById('alertucboCliente').style.display = 'block';
                $("#alertucboCliente").text("*Este campo es obligatorio");}
			if(ucboTipoActividad == "" || ucboTipoActividad == null){
				flag = 1;
                document.getElementById('alertucboTipoActividad').style.display = 'block';
                $("#alertucboTipoActividad").text("*Este campo es obligatorio");}
			if(ucboPeriodo == "" || ucboPeriodo == null){
				flag = 1;
                document.getElementById('alertucboPeriodo').style.display = 'block';
                $("#alertucboPeriodo").text("*Este campo es obligatorio");}
			if(ucboEstado == "" || ucboEstado == null){
				flag = 1;
                document.getElementById('alertucboEstado').style.display = 'block';
                $("#alertucboEstado").text("*Este campo es obligatorio");}
			if(ucboTWS == "" || ucboTWS == null){
				flag = 1;
                document.getElementById('alertucboTWS').style.display = 'block';
                $("#alertucboTWS").text("*Este campo es obligatorio");}
			if(uHoraEjecucion == "" || uHoraEjecucion == null ){
				flag = 1;
                document.getElementById('alertuHoraEjecucion').style.display = 'block';
                $("#alertuHoraEjecucion").text("*Este campo es obligatorio");}
			if(uDescripcion == "" || uDescripcion == null){
				flag = 1;
                document.getElementById('alertuDescripcion').style.display = 'block';
                $("#alertuDescripcion").text("*Este campo es obligatorio");}
			if(uHoraTermino == "" || uHoraTermino == null){
				flag = 1;
                document.getElementById('alertuHoraTermino').style.display = 'block';
                $("#alertuHoraTermino").text("*Este campo es obligatorio");}
			if(uVentanaMax == "" || uVentanaMax == null){
				flag = 1;
                document.getElementById('alertuVentanaMax').style.display = 'block';
                $("#alertuVentanaMax").text("*Este campo es obligatorio");}
			if(uMotivo == "" || uMotivo == null){
				flag = 1;
                document.getElementById('alertuMotivo').style.display = 'block';
                $("#alertuMotivo").text("*Este campo es obligatorio");}
			       	
        	return flag;
        }// Fin funcion validarModalEdit
        
		function validarModalNew(){
        	
        	var flag = 0; // 0 validacion OK, 1 validación con alertas
        	
			var icboTurno = $('#icboTurno').val().trim(); 
			var icboPlataforma = $('#icboPlataforma').val().trim();
			var icboTipoRespaldo = $('#icboTipoRespaldo').val().trim();
			var icboSede = $('#icboSede').val().trim();
			var icboProcedimiento = $('#icboProcedimiento').val().trim();
			var icboServidor = $('#icboServidor').val().trim();
			var icboCliente = $('#icboCliente').val().trim();
			var icboTipoActividad = $('#icboTipoActividad').val().trim();
			var icboPeriodo = $('#icboPeriodo').val().trim();
			var icboEstado = $('#icboEstado').val().trim();
			var icboTWS = $('#icboTWS').val().trim();
			var iHoraEjecucion = $('#iHoraEjecucion').val().trim();
			var iDescripcion = $('#iDescripcion').val().trim();
			var iHoraTermino = $('#iHoraTermino').val().trim();
			var iJobStream = $('#iJobStream').val().trim();
			var iComentario = $('#iComentario').val().trim();
			var iVentanaMax = $('#iVentanaMax').val().trim();
			var iAccion = $('#iAccion').val().trim();
			
			if(icboTurno == ""){
				flag = 1;
                document.getElementById('alerticboTurno').style.display = 'block';
                $("#alerticboTurno").text("*Este campo es obligatorio");}
			if(icboPlataforma == ""){
				flag = 1;
                document.getElementById('alerticboPlataforma').style.display = 'block';
                $("#alerticboPlataforma").text("*Este campo es obligatorio");}
			if(icboTipoRespaldo == ""){
				flag = 1;
                document.getElementById('alerticboTipoRespaldo').style.display = 'block';
                $("#alerticboTipoRespaldo").text("*Este campo es obligatorio");}
			if(icboSede == ""){
				flag = 1;
                document.getElementById('alerticboSede').style.display = 'block';
                $("#alerticboSede").text("*Este campo es obligatorio");}
			if(icboProcedimiento == ""){
				flag = 1;
                document.getElementById('alerticboProcedimiento').style.display = 'block';
                $("#alerticboProcedimiento").text("*Este campo es obligatorio");}
			if(icboServidor == ""){
				flag = 1;
                document.getElementById('alerticboServidor').style.display = 'block';
                $("#alerticboServidor").text("*Este campo es obligatorio");}
			if(icboCliente == ""){
				flag = 1;
                document.getElementById('alerticboCliente').style.display = 'block';
                $("#alerticboCliente").text("*Este campo es obligatorio");}
			if(icboTipoActividad == ""){
				flag = 1;
                document.getElementById('alerticboTipoActividad').style.display = 'block';
                $("#alerticboTipoActividad").text("*Este campo es obligatorio");}
			if(icboPeriodo == ""){
				flag = 1;
                document.getElementById('alerticboPeriodo').style.display = 'block';
                $("#alerticboPeriodo").text("*Este campo es obligatorio");}
			if(icboEstado == ""){
				flag = 1;
                document.getElementById('alerticboEstado').style.display = 'block';
                $("#alerticboEstado").text("*Este campo es obligatorio");}
			if(icboTWS == ""){
				flag = 1;
                document.getElementById('alerticboTWS').style.display = 'block';
                $("#alerticboTWS").text("*Este campo es obligatorio");}
			if(iHoraEjecucion == ""){
				flag = 1;
                document.getElementById('alertiHoraEjecucion').style.display = 'block';
                $("#alertiHoraEjecucion").text("*Este campo es obligatorio");}
			if(iDescripcion == ""){
				flag = 1;
                document.getElementById('alertiDescripcion').style.display = 'block';
                $("#alertiDescripcion").text("*Este campo es obligatorio");}
			if(iHoraTermino == ""){
				flag = 1;
                document.getElementById('alertiHoraTermino').style.display = 'block';
                $("#alertiHoraTermino").text("*Este campo es obligatorio");}
		
			if(iVentanaMax == ""){
				flag = 1;
                document.getElementById('alertiVentanaMax').style.display = 'block';
                $("#alertiVentanaMax").text("*Este campo es obligatorio");}
			
			       	
        	return flag;
        }// Fin funcion validarModalNew
        
        
        function modalEditar(pId, pIdTurno, pIdPlataforma, pIdTipoRespaldo, pIdSede, pIdProcedimiento, pIdServidor, pIdCliente, 
        		pIdTipoActividad, pIdPeriodo, pEstado, pTWS, pHoraEjecucion, pDescripcion, pHoraTermino, pJobStream, pComentario, 
        		pAccion, pVentanaMax, idNumeracion){
			

        	limpiarAlertasEdit();
        	// Select the option with a value of '1' AND Notify any JS components that the value changed
        	$('#uNumeracion').val(idNumeracion);
        	$('#uId').val(pId); 
			$('#ucboTurno').val(pIdTurno).trigger('change'); 
			$('#ucboPlataforma').val(pIdPlataforma).trigger('change');
			$('#ucboTipoRespaldo').val(pIdTipoRespaldo).trigger('change');
			$('#ucboSede').val(pIdSede).trigger('change');
			$('#ucboProcedimiento').val(pIdProcedimiento).trigger('change');
			$('#ucboServidor').val(pIdServidor).trigger('change');
			$('#ucboCliente').val(pIdCliente).trigger('change');
			$('#ucboTipoActividad').val(pIdTipoActividad).trigger('change');
			$('#ucboPeriodo').val(pIdPeriodo).trigger('change');
			$('#ucboEstado').val(pEstado).trigger('change');
			$('#ucboTWS').val(pTWS).trigger('change');
			$('#uHoraEjecucion').val(pHoraEjecucion);
			$('#uDescripcion').val(pDescripcion.replace(/['']+/g,'\"'));
			$('#uHoraTermino').val(pHoraTermino);
			$('#uJobStream').val(pJobStream);
			$('#uComentario').val(pComentario.replace(/['']+/g,'\"'));
			$('#uVentanaMax').val(pVentanaMax);
			$('#uAccion').val(pAccion);
			$('#uMotivo').val('');
			
	
        }// Fin funcion modalEditar
        
        
		function validarModalEstado(){
        	
        	var flag = 0; // 0 validacion OK, 1 validación con alertas
        	
        	var pMotivo= $('#iMotivo').val();
			
			
			if(pMotivo == "" || pMotivo == "null" || pMotivo == null || pMotivo == " "){
				flag = 1;
                document.getElementById('alertMotivo').style.display = 'block';
                $("#alertMotivo").text("*Este campo es obligatorio");
            }
			
			       	
        	return flag;
        }// Fin funcion validar Modal Estado
        
        function editarEstado(pId, pIdTurno, pIdPlataforma, pIdTipoRespaldo, pIdSede, pIdProcedimiento, pIdServidor, pIdCliente, 
        		pIdTipoActividad, pIdPeriodo, pEstado, pTWS, pHoraEjecucion, pDescripcion, pHoraTermino, pJobStream, pComentario, 
        		pAccion, pVentanaMax, pIdNumeracion ){
        	
        	$('#iMotivo').val("");
        	$('#temp_Numeracion').val(pIdNumeracion)
        	$('#temp_Id').val(pId); 
			$('#temp_cboTurno').val(pIdTurno); 
			$('#temp_cboPlataforma').val(pIdPlataforma);
			$('#temp_cboTipoRespaldo').val(pIdTipoRespaldo);
			$('#temp_cboSede').val(pIdSede);
			$('#temp_cboProcedimiento').val(pIdProcedimiento);
			$('#temp_cboServidor').val(pIdServidor);
			$('#temp_cboCliente').val(pIdCliente);
			$('#temp_cboTipoActividad').val(pIdTipoActividad);
			$('#temp_cboPeriodo').val(pIdPeriodo);
			$('#temp_cboEstado').val(pEstado);
			$('#temp_cboTWS').val(pTWS);
			$('#temp_HoraEjecucion').val(pHoraEjecucion);
			$('#temp_Descripcion').val(pDescripcion);
			$('#temp_HoraTermino').val(pHoraTermino);
			$('#temp_JobStream').val(pJobStream);
			$('#temp_Comentario').val(pComentario);
			$('#temp_VentanaMax').val(pVentanaMax);
			$('#temp_Accion').val(pAccion);
        	        	
        	if(pEstado == "0"){
        	
        		if(confirm('¿Está seguro que desea DESACTIVAR la actividad "'+pDescripcion+'"?')) { 
        			$("#modalEstado").modal("show"); 	
			      }else {
			               return false;
			             } 
        	}else{
        		
        		if(confirm('¿Está seguro que desea ACTIVAR la actividad "'+pDescripcion+'"?')) { 
        			$("#modalEstado").modal("show");
			      }else {
			               return false;
			             } 
        		
        	}

    		
    	} // Fin funcion editar
        
        function listarComboTurno(){
						
			$("#ucboTurno option").remove();
			$("#ucboTurno").append(
	    	  			$('<option>',{
	    	  				value: "",
	    	  				text: " --SELECCIONE-- "
	    	  			})		
	    	  		);
			$("#icboTurno option").remove();
			$("#icboTurno").append(
	    	  			$('<option>',{
	    	  				value: "",
	    	  				text: " --SELECCIONE-- "
	    	  			})		
	    	  		);
			
        	var src = "ServletTurno";  
        	$.post(src, {strAccion:"2"}, 
       				function(pdata) {
       				  var obj = JSON.parse(pdata);
       				  //BG001 - Nuevo Turno Listar comprobacion
       				  console.log("Turnos V2");
       				  console.log(obj);
       				  
       				  for(i = 0; i < obj.ListaTurno.length ; i++){
       					$('#ucboTurno').append(
           	    	  			$('<option>',{
           	    	  				value: obj.ListaTurno[i].idTurno,
           	    	  				text: obj.ListaTurno[i].descripcion
           	    	  			})		
           	    	  		);
       					$('#icboTurno').append(
           	    	  			$('<option>',{
           	    	  				value: obj.ListaTurno[i].idTurno,
           	    	  				text: obj.ListaTurno[i].descripcion
           	    	  			})		
           	    	  		);
       				  }	
        	});
        	
        } // Fin funcion listarComboTurno
        
        function listarComboPeriodo(){
			
			
			$("#ucboPeriodo option").remove();
			$("#ucboPeriodo").append(
	    	  			$('<option>',{
	    	  				value: "",
	    	  				text: " --SELECCIONE-- "
	    	  			})		
	    	  		);
			
			$("#icboPeriodo option").remove();
			$("#icboPeriodo").append(
	    	  			$('<option>',{
	    	  				value: "",
	    	  				text: " --SELECCIONE-- "
	    	  			})		
	    	  		);
			
        	var src = "ServletPeriodo";  
        	//$.post(src, {strAccion:"2"},  --BG001
        	$.post(src, {strAccion:"6"}, 	//++BG001
       				function(pdata) {
       				  var obj = JSON.parse(pdata);
       				  //BG001 - Comprobar el listado de Periodos
       				  console.log("Le dimos a los Periodos");
       				  console.log(obj);
       				  //for(i = 0; i < obj.ListaPeriodo.length; i++){ //--BG001
       				  for(i = 0; i < obj.ListaReportePeriodo.length; i++){ //--BG001
       					  
       					$('#ucboPeriodo').append(
           	    	  			$('<option>',{
           	    	  				//value: obj.ListaPeriodo[i].idPeriodo, //--BG001
           	    	  				//text: obj.ListaPeriodo[i].descripcion //--BG001
           	    	  				value: obj.ListaReportePeriodo[i].idPeriodo, //++BG001
           	    	  				text: obj.ListaReportePeriodo[i].titulo //++BG001
           	    	  			})		
           	    	  		);
       					$('#icboPeriodo').append(
           	    	  			$('<option>',{
           	    	  				//value: obj.ListaPeriodo[i].idPeriodo, //--BG001
           	    	  				//text: obj.ListaPeriodo[i].descripcion //--BG001
           	    	  				value: obj.ListaReportePeriodo[i].idPeriodo, //++BG001
           	    	  				text: obj.ListaReportePeriodo[i].titulo //++BG001
           	    	  			})		
           	    	  		);
       				  }	
        	});
        	
        }// Fin funcion listarComboPeriodo
        
        
        function listarComboOption(){
        
		var i = 1;
            
            for(i=1; i<=7; i++){
            	
            if( i == 1){
            	generaComboOption('1','#ucboPlataforma');	
            	generaComboOption('1','#icboPlataforma');
            }else if( i == 2){
            	generaComboOption('2','#ucboTipoRespaldo');	
            	generaComboOption('2','#icboTipoRespaldo');	
            }else if( i == 3){            	
            	generaComboOption('3','#ucboCliente');
            	generaComboOption('3','#icboCliente');
            }else if( i == 4){
            	generaComboOption('4','#ucboProcedimiento');
            	generaComboOption('4','#icboProcedimiento');
            }else if( i == 5){
            	generaComboOption('5','#ucboSede');
            	generaComboOption('5','#icboSede');
            }else if( i == 6){
            	generaComboOption('6','#ucboServidor');
            	generaComboOption('6','#icboServidor');
            }else if( i == 7){
            	generaComboOption('7','#ucboTipoActividad');
            	generaComboOption('7','#icboTipoActividad');
            }
            	
            }
        	
        	
        }
        
		function generaComboOption(pAccion, pIdCombo){
        	
			//Combo
			$(pIdCombo+" option").remove();
			$(pIdCombo).append(
	    	  			$('<option>',{
	    	  				value: "",
	    	  				text: " --SELECCIONE-- "
	    	  			})		
	    	  		);

	
        	var src = "ServletOption";  
        	$.post(src, {strAccion: pAccion}, 
       				function(pdata) {
       			     
       				  var obj = JSON.parse(pdata);

       				  for(i = 0; i < obj.ListaOption.length ; i++){
       					  
       					$(pIdCombo).append(
           	    	  			$('<option>',{
           	    	  				value: obj.ListaOption[i].idOption,
           	    	  				text: obj.ListaOption[i].descripcion
           	    	  			})		
           	    	  		);
       				  }	
        	});
		} // Fin funcion listarComboOption
        	
		function activarAlertaConfirmacion(id) { 

   		 	document.getElementById(id).style.display = 'block';    
   		 	setTimeout(function() {      
   			 	desactivarAlertaConfirmacion(id);  
   	     	}, 3000)
   		}// Fin funcion activarAlertaConfirmacion
   	 
  	 	function desactivarAlertaConfirmacion(id) { 

   		 	document.getElementById(id).style.display = 'none';    

   		}// Fin funcion desactivarAlertaConfirmacion
   		
   		
   		function limpiarModalHistorial(){
   		
   			var table = $('#example2').DataTable();
   			table.clear().draw();
   			
		    
   		}
   		

   		
   		function listarHistorial(pIdActividd){
   			
   			
   			
   			var src = "ServletActividad";
        	
   	       	//Inicio POST para completar listar información en la tabla
   	        	$.post(src, {strAccion:"5", strIdActividad: pIdActividd  }, 
   	       				function(pdata) {
   	       			     
   	       				  var obj = JSON.parse(pdata);
   	       				  var datatabla2 = [];
   	       				  var numeracion = 0;
   	       				    
   	       				  if(obj.ListaActividad[0].idActividad == ""){
   	       						
   	       					}else{
   	       						  
   	       						  for(i = 0 ; i < obj.ListaActividad.length ; i++ ){	
   	       							  
   	       							  numeracion = numeracion + 1;
   	       							  var arr = [];
   	       							  
   	       							  //captura de datos
   	       							    var idActividad = obj.ListaActividad[i].idActividad;
   	       							    var idTurno = obj.ListaActividad[i].idTurno;
   	       							 	var descripcionTurno = obj.ListaActividad[i].descripcionTurno;
   	       							 	var idSede = obj.ListaActividad[i].idSede;
   	       							 	var descripcionSede = obj.ListaActividad[i].descripcionSede;
   	       								var horaEjecucion = obj.ListaActividad[i].horaEjecucion;
   	       								var descripcion = obj.ListaActividad[i].descripcion;
   	       								var horaTermino = obj.ListaActividad[i].horaTermino;
   	       								var idPeriodo = obj.ListaActividad[i].idPeriodo;
   	       								var descripcionPeriodo = obj.ListaActividad[i].descripcionPeriodo;
   	       								var idPlataforma = obj.ListaActividad[i].idPlataforma;
   	       								var descripcionPlataforma = obj.ListaActividad[i].descripcionPlataforma;
   	       								var idProcedimiento = obj.ListaActividad[i].idProcedimiento;
   	       								var descripcionProcedimiento = obj.ListaActividad[i].descripcionProcedimiento;
   	       								var idServidor = obj.ListaActividad[i].idServidor;
   	       								var descripcionServidor = obj.ListaActividad[i].descripcionServidor;
   	       								var idCliente = obj.ListaActividad[i].idCliente;
   	       								var descripcionCliente = obj.ListaActividad[i].descripcionCliente;
   	       								var jobStream = obj.ListaActividad[i].jobStream;
   	       								var idTipoActividad = obj.ListaActividad[i].idTipoActividad;
   	       								var descripcionTipoActividad = obj.ListaActividad[i].descripcionTipoActividad;
   	       								var estado = obj.ListaActividad[i].estado;
   	       								var accion = obj.ListaActividad[i].accion;
   	       								var idTipoRespaldo = obj.ListaActividad[i].idTipoRespaldo;
   	       								var descripcionTipoRespaldo = obj.ListaActividad[i].descripcionTipoRespaldo;
   	       								var duracion = obj.ListaActividad[i].duracion;
   	       								var comentario = obj.ListaActividad[i].comentario;
   	       								var ventanaMax = obj.ListaActividad[i].ventanaMax;
   	       								var tws = obj.ListaActividad[i].tws;
   	       								var userMod = obj.ListaActividad[i].userMod;
   	       								var fechaMod = obj.ListaActividad[i].fechaMod;
   	       								var tipoMod = obj.ListaActividad[i].tipoMod;
   	       								var motivo = obj.ListaActividad[i].motivo;

   	       								if(estado == "1"){
   	       									descripcionEstado = "Activo";
   	       								
   	       								}else{
   	       									descripcionEstado = "Inactivo";	
   	       								}
   	       								
   	       								if(tws == "1"){
   	       									descripcionTWS = "Si";
   	       								}else{
   	       									descripcionTWS = "No";
   	       								}
   	       								

   	       							  //Generación de cadena para tabla  turno
   	       							  
   	       							  	arr.push(descripcionTurno);
   	       							 	arr.push(descripcionSede);
   	       							 	arr.push(horaEjecucion);
   	       							 	arr.push(descripcion);
   	       							 	arr.push(horaTermino);
   	       							 	arr.push(descripcionPeriodo);
   		       							arr.push(descripcionPlataforma);
   		       							arr.push(descripcionProcedimiento);
   		       							arr.push(descripcionServidor);
   		       							arr.push(descripcionCliente);
   		       							arr.push(jobStream);
   		       							arr.push(descripcionTipoActividad);
   		       							arr.push(descripcionEstado);
   		       							arr.push(userMod);
   		       							arr.push(fechaMod);
   		       							arr.push(tipoMod);
   		       							arr.push(motivo);
   		       							
   	       							 	datatabla2.push(arr);
   	       							  }  
   	       					  }
   			
   		// DataTable 2
			    var table = $('#example2').DataTable();
			    table.clear().draw();
			    table.destroy();
			    
			    
			  $('#example2').DataTable( {
			    	language: {
			            searchPlaceholder: "Buscar...",
			            search : '<i class="fa fa-search fa-lg">',
			            
			        },
			        dom: 'Bfrtip',
			        data : datatabla2,
			     	lengthMenu: [[3, 5, 10, -1], [3, 5, 10, "Todos"]],
			    	columnDefs: [
			     	 { "width": "7%", "targets": 14 }
			   		 ],
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
			    
		// Setup - add a text input to each footer cell
		    $('#example2 .filters2 th').each( function () {
		        var title = $('#example2 thead th').eq( $(this).index() ).text();
		        $(this).html( '<input type="text" placeholder="Buscar '+title+'" style="width:100%"  />' );
		    } );

		table = $('#example2').DataTable();
		
		// Apply the search
	    table.columns().eq( 0 ).each( function ( colIdx ) {
	        $( 'input', $('.filters2 th')[colIdx] ).on( 'keyup change', function () {
	            table
	                .column( colIdx )
	                .search( this.value )
	                .draw();
	        		} );
	    		} );
		


			});// Fin del POST listar tabla
		} // Fin funcion Listar

        function listar(){
        	// Setup
            this.$('.js-loading-bar').modal({
              backdrop: 'static',
              show: false
            });

           
              var $modal = $('.js-loading-bar');
              $modal.modal('show');
              
       	 var src = "ServletActividad";
        	
       	//Inicio POST para completar listar información en la tabla
        	$.post(src, {strAccion:"2"}, 
       				function(pdata) {
       			     
       				  var obj = JSON.parse(pdata);
       				  var datatabla = [];
       				  var numeracion = 0;
       				    
       				  if(obj.ListaActividad[0].idActividad == ""){
       						
       					}else{
       						  
       						  for(i = 0 ; i < obj.ListaActividad.length ; i++ ){	
       							  
       							  numeracion = numeracion + 1;
       							  var arr = [];
       							 
       							  //captura de datos
       							    var idActividad = obj.ListaActividad[i].idActividad;//1
       							    var idTurno = obj.ListaActividad[i].idTurno;
       							 	var descripcionTurno = obj.ListaActividad[i].descripcionTurno;
       							 	var idSede = obj.ListaActividad[i].idSede;
       							 	var descripcionSede = obj.ListaActividad[i].descripcionSede;
       								var horaEjecucion = obj.ListaActividad[i].horaEjecucion;
       								var descripcion = obj.ListaActividad[i].descripcion;
       								var horaTermino = obj.ListaActividad[i].horaTermino;
       								var idPeriodo = obj.ListaActividad[i].idPeriodo;
       								var descripcionPeriodo = obj.ListaActividad[i].descripcionPeriodo;//10
       								var idPlataforma = obj.ListaActividad[i].idPlataforma;
       								var descripcionPlataforma = obj.ListaActividad[i].descripcionPlataforma;
       								var idProcedimiento = obj.ListaActividad[i].idProcedimiento;
       								var descripcionProcedimiento = obj.ListaActividad[i].descripcionProcedimiento;
       								var idServidor = obj.ListaActividad[i].idServidor;//15 
       								var descripcionServidor = obj.ListaActividad[i].descripcionServidor;
       								var idCliente = obj.ListaActividad[i].idCliente;//17
       								var descripcionCliente = obj.ListaActividad[i].descripcionCliente;
       								var jobStream = obj.ListaActividad[i].jobStream;
       								var idTipoActividad = obj.ListaActividad[i].idTipoActividad;
       								var descripcionTipoActividad = obj.ListaActividad[i].descripcionTipoActividad;
       								var estado = obj.ListaActividad[i].estado;//22
       								var accion = obj.ListaActividad[i].accion;
       								var idTipoRespaldo = obj.ListaActividad[i].idTipoRespaldo;
       								var descripcionTipoRespaldo = obj.ListaActividad[i].descripcionTipoRespaldo;
       								var duracion = obj.ListaActividad[i].duracion;
       								var comentario = obj.ListaActividad[i].comentario;
       								var ventanaMax = obj.ListaActividad[i].ventanaMax;
       								var tws = obj.ListaActividad[i].tws;
       								var descripcionTeam = obj.ListaActividad[i].descripcionTeam;
       								
//        								descripcion = descripcion.replace(/['"]+/g,'\\"');
       								
       								if(estado == "1"){
       									descripcionEstado = "Activo";
       								    btn = "<button title=\"Desactivar Actividad\" type=\"button\" class=\"btn bg-red\" onclick=\"editarEstado('"+idActividad+"','"+idTurno+"','"+idPlataforma+"', '"+idTipoRespaldo+"', '"+idSede+"', '"+idProcedimiento+"', '"+idServidor+"', '"+idCliente+"', '"+idTipoActividad+"' , '"+idPeriodo+"', '0','"+tws+"', "+
											" '"+horaEjecucion+"', '"+descripcion.replace(/['"]+/g,'\\\'')+"', '"+horaTermino+"', '"+jobStream+"', '"+comentario+"', '"+accion+"', '"+ventanaMax+"','"+numeracion+"' )\"><i class=\"fa fa-close\"></i></button>";	
       								}else{
       									descripcionEstado = "Inactivo";	
       									btn = "<button title=\"Activar Actividad\" type=\"button\" class=\"btn bg-green\"  onclick=\"editarEstado('"+idActividad+"','"+idTurno+"','"+idPlataforma+"', '"+idTipoRespaldo+"', '"+idSede+"', '"+idProcedimiento+"', '"+idServidor+"', '"+idCliente+"', '"+idTipoActividad+"' , '"+idPeriodo+"', '1','"+tws+"', "+
											" '"+horaEjecucion+"', '"+descripcion.replace(/['"]+/g,'\\\'')+"', '"+horaTermino+"', '"+jobStream+"', '"+comentario+"', '"+accion+"', '"+ventanaMax+"' ,'"+numeracion+"' )\"><i class=\"fa fa-check\"></i></button>";	
       									
       								}
       								
       								if(tws == "1"){
       									descripcionTWS = "Si";
       								}else{
       									descripcionTWS = "No";
       								}
       								

       							  //Generación de cadena para tabla  
       							  	arr.push(numeracion);       							  
       							 	arr.push("<p id=\"pTeam"+numeracion+"\" >"+descripcionTeam+"</p>");
       							  	arr.push("<p id=\"pTurno"+numeracion+"\" >"+descripcionTurno+"</p>");
       							 	arr.push("<p id=\"pSede"+numeracion+"\" >"+descripcionSede+"</p>");
       							 	arr.push("<p id=\"pHEjecucion"+numeracion+"\" >"+horaEjecucion+"</p>");
       							 	arr.push("<p id=\"pDescripcion"+numeracion+"\" >"+descripcion.replace(/['']+/g,'\"')+"</p>");
       							 	arr.push("<p id=\"pHTermino"+numeracion+"\" >"+horaTermino+"</p>");
       							 	arr.push("<p id=\"pPeriodo"+numeracion+"\" >"+descripcionPeriodo+"</p>");
	       							arr.push("<p id=\"pPlataforma"+numeracion+"\" >"+descripcionPlataforma+"</p>");
	       							arr.push("<p id=\"pProcedimiento"+numeracion+"\" >"+descripcionProcedimiento+"</p>");
	       							arr.push("<p id=\"pServidor"+numeracion+"\" >"+descripcionServidor+"</p>");
	       							arr.push("<p id=\"pCliente"+numeracion+"\" >"+descripcionCliente+"</p>");
	       							arr.push("<p id=\"pJobStream"+numeracion+"\" >"+jobStream+"</p>");
	       							arr.push("<p id=\"pTipoActividad"+numeracion+"\" >"+descripcionTipoActividad+"</p>");
	       							arr.push("<p id=\"pEstado"+numeracion+"\" >"+descripcionEstado+"</p>");
	       							arr.push("<center><div id=\"divBoton"+numeracion+"\" class=\"btn-group\" role=\"group\"><button title=\"Editar Actividad\" type=\"button\" class=\"btn bg-yellow\"  data-toggle=\"modal\" data-target=\"#modalEdit\" "+  
	       									"onclick=\"modalEditar('"+idActividad+"','"+idTurno+"','"+idPlataforma+"', '"+idTipoRespaldo+"', '"+idSede+"', '"+idProcedimiento+"', '"+idServidor+"', '"+idCliente+"', '"+idTipoActividad+"' , '"+idPeriodo+"', '"+estado+"','"+tws+"', "+
	       											" '"+horaEjecucion+"', '"+descripcion.replace(/['"]+/g,'\\\'')+"', '"+horaTermino+"', '"+jobStream+"', '"+comentario.replace(/['"]+/g,'\\\'')+"', '"+accion+"', '"+ventanaMax+"' ,'"+numeracion+"'  )\"> "+
	       									"<i class=\"fa fa-edit\"></i></button>"+
					        				btn+
					        				"<button title=\"Ver historial\" type=\"button\" class=\"btn bg-blue\"  data-toggle=\"modal\" data-target=\"#modalHistory\" "+  
	       									"onclick=\"listarHistorial('"+idActividad+"' )\"> "+
	       									"<i class=\"fa fa-history\"></i></button> </div></center>");
       							 	datatabla.push(arr);
       							  }  
       					  }
       				  
       				  
       				  
       				// DataTable 1
       				    var table = $('#example1').DataTable();
       				    table.destroy();
       				    
       				  $('#example1').DataTable( {
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
   				        dom: 'Bfrtip',
   				     	lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
   				        data : datatabla,
       				     buttons : [
								{
									extend : 'pageLength',
									text : '<i class="fa fa-list-ol" aria-hidden="true"></i> Mostrar',
									className: "btn-sm"
								},
								{
								 	extend: "copy",
									exportOptions: {
										columns: [0,1,2,3,4,5,6,7,8,9,15,16]
									},
									className: "btn-sm",
									text : '<i class="fa fa-clipboard" aria-hidden="true"></i> Copiar'
								},
								{
									extend: "csv",
									exportOptions: {
										columns: [0,1,2,3,4,5,6,7,8,9,15,16]
									},
									className: "btn-sm",
									text : '<i class="fa fa-file-text-o" aria-hidden="true"></i> CSV'
								},
								{
									extend: "excel",
									exportOptions: {
										columns: [0,1,2,3,4,5,6,7,8,9,10,11,14,15]
									},
									className: "btn-sm",
									text : '<i class="fa fa-file-excel-o" aria-hidden="true"></i> Excel'
								},
								{
									extend: "pdfHtml5",
									exportOptions: {
										columns: [0,1,2,3,4,5,6,7,8,9,15,16]
									},
									className: "btn-sm",
									text : '<i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF'
								},
								{
									extend: "print",
									exportOptions: {
										columns: [0,1,2,3,4,5,6,7,8,9,15,16]
									},
									className: "btn-sm",
									text : '<i class="fa fa-print" aria-hidden="true"></i> Imprimir'
								}],
       						responsive: true,
       				    	columnDefs: [
       				    		{ "width": "1%", "targets": 0 },
       				    		{ "width": "1%", "targets": 1 },
       				    		{ "width": "1%", "targets": 2 },
       				    		{ "width": "1%", "targets": 3 },
       				     		{ "width": "20%", "targets": 5 },
       				     		{ "width": "1%", "targets": 6 },
       				     		{ "width": "1%", "targets": 7 },
	       				     	{ "width": "1%", "targets": 8 },
	   				     		{ "width": "1%", "targets": 9 },
	   				     		{ "width": "1%", "targets": 10 },
   				     			{ "width": "1%", "targets": 11 },
					     		{ "width": "1%", "targets": 12 },
					     		{ "width": "1%", "targets": 13 },
					     		{ "width": "1%", "targets": 14 },
       				     		{ "width": "15%", "targets": 15 },
       				   		 ]
       				    } );
       				    
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
					
					//Ocultar Modal con barra de progreso
				    var $modal = $('.js-loading-bar');
			        $modal.modal('hide');
        	
        });// Fin del POST listar tabla
        
        	
       	} // Fin funcion Listar
</script>

<script type="text/javascript">
$('.clockpicker').clockpicker({
    donetext: 'OK'
});
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

 <script type="text/javascript">
			function validar(e) {
			    tecla = (document.all) ? e.keyCode : e.which;
			    patron =/[\x5C'"]/;
			    te = String.fromCharCode(tecla);
			    return !patron.test(te);
			}
			
			function validar_solo_numeros(e) {
				var key = window.Event ? e.which : e.keyCode
				return (key >= 48 && key <= 57)
			} 
</script>
</body>
</html>
