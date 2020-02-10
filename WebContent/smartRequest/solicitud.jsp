<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">
<meta charset="UTF-8" content="width=device-width, initial-scale=1" name='viewport' />



<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>
	SMART REQUEST <small>SOLICITUD</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-dashboard"></i> SMART REQUEST</a></li>
	<li class="active">SOLICITUD</li>
</ol>
</section> <!-- Main content --> <section class="content"> <!-- top row -->


<!-- /.row --> <!-- Main row -->
<div class="row container-fluid">

		<div class="panel panel-default" >
  		<div class="panel-body">
  		<div class="row col-12 text-center">
  		<h2>SOLICITUD</h2><br><br>
  		</div>
  		<div class="row">
			<div class="col-md-6 text-center"><label>N° Solicitud:&nbsp;&nbsp;</label><input disabled></div>
			<div class="col-md-6 text-center"><label>Estado:&nbsp;&nbsp;</label><input disabled></div>
		</div>
		<br>
<!-- 		<div class="row"> -->
<!-- 			<div class="col-md-12 text-center"> -->
<!-- 			<label>Tipo de Solicitud: &nbsp;&nbsp;&nbsp;&nbsp;</label>  -->
<!-- 			<label class="radio-inline"><input type="radio" name="optradio">Alta</label> -->
<!-- 		    <label class="radio-inline"><input type="radio" name="optradio">Modificación</label> -->
<!-- 		    <label class="radio-inline"><input type="radio" name="optradio">Baja</label> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<hr style= "height: 1px; width: 95%; background-color: #b2aeae"/> -->
<!-- 		<br> -->
		<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title">I. DATOS SOLICITANTE</h3>
		  </div>
		  <div class="panel-body">
		     <div class="col-md-3">
		  	 <label class="control-label">Empresa: </label>
	         <select class="form-control select2"  id="" >
	         <option value="0" disabled selected>--SELECCIONE--</option>
	         <option value=1"> AESA </option>
	         <option value="2"> BRECA </option>
	         <option value="3"> CENTRIA </option>
	         <option value="4"> HOJA REDONDA </option>
	         </select>
			 </div>
			 <div class="col-md-4">
			 <label for="email">Nombres y Apellidos:</label>
			 <input type="text" class="form-control" id="">
			 </div>
			 <div class="col-md-3">
			 <label for="email">Correos:</label>
			 <input type="email" class="form-control" id="">
			 </div>
			 <div class="col-md-2">
			 <label for="pwd">Fecha de Solicitud:</label>
			 <input type="date" class="form-control" id="">
			 </div>
		 </div>	
		</div>
		
		<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title">II. TIPO DE SOLICITUD</h3>
		  </div>
		  <div class="panel-body">
		  <div class="row">
		  	<div class="col-md-3">
		  	 <label class="control-label">Tipo: </label>
	         <select class="form-control select2"   id="" >
	         <option value="0" disabled selected>--SELECCIONE--</option>
	         <option value="1"> ALTA </option>
	         <option value="2"> MODIFICACIÓN </option>
	         <option value="3"> BAJA </option>
	         </select>
			 </div>
			 <div class="col-md-3">
		  	 <label class="control-label">Acción: </label>
	         <select class="form-control select2"   id="" >
	         <option value="0" disabled selected>--SELECCIONE--</option>
	         <option value="1"> USUARIO NUEVO </option>
	         <option value="2"> USUARIO TEMPORAL </option>
	         <option value="3"> TRASLADO DE EMPRESA </option>
	         </select>
			 </div>
			 <div class="col-md-2">
			 <label>N° Usuarios afectados:</label>
			 
			 <label class="radio-inline"><input type="radio" name="optradio">Individual</label>
			 <label class="radio-inline"><input type="radio" name="optradio">Masivo</label>
			 
			 </div>
			 <div class="col-md-2">
			 <label for="pwd">Fecha de Ingreso:</label>
			 <input type="date" class="form-control" id="">
			 </div>
			 <div class="col-md-2">
			 <label for="pwd">Fecha de Retiro:</label>
			 <input type="date" class="form-control" id="">
			 </div>
		   </div>
		  </div>
		</div>
		
		<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title">III. DATOS PERSONALES</h3>
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
			 <label class="control-label" >Anexo / Celular</label>
			 <input type="text" class="form-control">
			 </div>
		  </div>
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
	         <option value="1"> Finanzas </option>
	         <option value="2"> Logistica </option>
	         <option value="3"> Sistemas </option>
	         </select>
	         </div>
	         
		  </div>


		  </div>
		</div>
		
		
		<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title">IV. SERVICIOS</h3>
		  </div>
		  <div class="panel-body">

		    <div class="col-xs-4 col-sm-3 col-md-2 col-md-offset-2 everything-checkbox"> 
			  <div class="checkbox">
			    <label for="checkbox1">
			        <span>Text goes here....</span>
			    </label>
			    <input type="checkbox" id="checkbox1" class="checkbox style-2 pull-right" checked="checked"/>
			  </div>
			</div>
		  

		  </div>
		</div>
		
		<div class="panel panel-default">
		  <div class="panel-heading">
		    <h3 class="panel-title text-center">APROBADORES</h3>
		  </div>
		  <div class="panel-body">
		    
		  </div>
		</div>

	
</div>
</div>
</div>
<!-- /.row (main row) --> </section><!-- /.content --> </aside>
<!-- /.right-side -->

<script type="text/javascript">
$(function () {
    //Initialize Select2 Elements
    $(".select2").select2();
});
</script>

</html>