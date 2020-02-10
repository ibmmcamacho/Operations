<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>




<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
<section class="content-header">
<h1>Mantenimiento <small>Periodos</small>
</h1>
<ol class="breadcrumb">
	<li><a href="#"><i class="fa fa-th-large"></i> Mantenimiento</a></li>
	<li class="active">Periodos</li>
</ol>
</section> <!-- Main content --> <section class="content"> <!-- top row -->
<div class="row">
	<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
		<div class="form-inline">
			<div class="form-group">
				<a class="btn btn-default btn-sm" data-toggle="modal" data-target="#mdNuevo">
				<i class="fa fa-file-text-o" aria-hidden="true"></i> Nuevo
				</a>
				
				<a class="btn btn-default btn-sm" onclick="listReport()">
				<i class="fa fa-refresh fa-lg" aria-hidden="true"></i>
				</a>
			</div>
		</div>
	</div>
</div>



<br />
<div class="row">
	<div class="col-lg-12 connectedSortable">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> LISTA DE PERIODOS</h3>
			</div>
			<div class="box-body">
				<label id="lblMessage" class="label label-info"></label>
				<div id="tbcontainer" class="table-responsive">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.row --> <!-- Main row -->
<div class="row"></div>
<!-- /.row (main row) --> </section><!-- /.content --> </aside>

</body>

<!-- Modal Insertar -->
<div class="modal fade" id="mdNuevo" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Crear un nuevo Periodo</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        		<input type="hidden" id="hdIdHorario1">
        		
        		<table class="table borderless" >
				<tr>
					<td><label>Descripcion</label></td>
					<td>
						<input id="txtDescripcion" type="text" class="form-control">
					</td>
				</tr>
				<tr>
					<td><label>Frecuencia</label></td>
					<td>
						<div class="input-group">
							<select id="cboFrecuencia" class="form-control cbo2">
				        			<option value="0">Diario</option>
				        			<option value="1">Semana</option>
				        			<option value="2">Mensual / Anual</option>
			        			</select>
						</div>
					</td>
				</tr>
				<tr>
					<td><label>Fecha Inicio</label></td>
					<td>
						<div class="input-group">
							<input id="txtFechaInicio" type="text" class="form-control" readonly="readonly">
						</div>
					</td>
				</tr>
			</table>
			<hr/>
			<div id="dvFrecuenciaSemanal" class="hidden">
				<table class="table borderless">
					<tr>
						<td>Días:</td>
						<td>
							<select id="cboDiasSemanal" class="form-control">
								<option value="0">Lunes</option>
								<option value="1">Martes</option>
								<option value="2">Miercoles</option>
								<option value="3">Jueves</option>
								<option value="4">Viernes</option>
								<option value="5">Sábado</option>
								<option value="6">Domingo</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			<div id="dvFrecuenciaMensualAnual" class="hidden">
				<table class="table borderless">
					<tr>
						<td>Tipo:</td>
						<td>
							<label class="radio-inline">
							  <input type="radio" name="radioGroupTipoCalendario" id="rdbCalendarioEstandar" value="0">Estandar
							</label>
							<label class="radio-inline">
							  <input type="radio" name="radioGroupTipoCalendario" id="rdbCalendarioPersonalizado" value="1"> Personalizado
							</label>
						</td>
						<td><a id="btnGuardar" class="btn btn-primary"><i class="fa fa-plus-circle" aria-hidden="true"></i></a></td>
					</tr>
				</table>
				<table class="table borderless" id="tblCalendarioEstandar">
					<tr>
						<td>Fecha:</td>
						<td>
							<div class="input-group">
								<input id="txtFecha" type="text" class="form-control">
							</div>
						</td>
					</tr>
				</table>
				<table class="table borderless" id="tblCalendarioPersonalizado">
					<tr>
						<td>Año:</td>
						<td>
							<select id="cboAnio" class="form-control">
								<option value="2017">2017</option>
								<option value="2018">2018</option>
								<option value="2019">2019</option>
								<option value="2020">2020</option>
								<option value="2021">2021</option>
							</select>
						</td>
						<td>
							<label class="checkbox-inline">
								<input type="checkbox" id="chkIndefinidoAnio" value="option1">Indefinido
							</label>
						</td>
					</tr>
					<tr>
						<td>Mes:</td>
						<td>
							<select id="cboMes" class="form-control">
								<option value="1">Enero</option>
								<option value="2">Febrero</option>
								<option value="3">Marzo</option>
								<option value="4">Abril</option>
								<option value="5">Mayo</option>
								<option value="6">Junio</option>
								<option value="7">Julio</option>
								<option value="8">Agosto</option>
								<option value="9">Septiembre</option>
								<option value="10">Octubre</option>
								<option value="11">Noviembre</option>
								<option value="12">Diciembre</option>
							</select>
						</td>
						<td>
							<label class="checkbox-inline">
								<input type="checkbox" id="chkIndefinidoAnio" value="option1">Indefinido
							</label>
						</td>
					</tr>
					<tr>
						<td>Semana:</td>
						<td>
							<select id="cboSemana" class="form-control">
								<option value="1">Semana 1</option>
								<option value="2">Semana 2</option>
								<option value="3">Semana 3</option>
								<option value="4">Semana 4</option>
							</select>
						</td>
						<td>
							<label class="checkbox-inline">
								<input type="checkbox" id="chkIndefinidoAnio" value="option1">Indefinido
							</label>
						</td>
					</tr>
					<tr>
						<td>Tipo día:</td>
						<td colspan="2">
							<label class="radio-inline"><input type="radio" name="radioGroupTipoDia" id="rdbDiaSemana" value="1"> Día Semana |</label> 
							<label class="radio-inline"><input type="radio" name="radioGroupTipoDia" id="rdbDiaS" value="2"> Día |</label> 
							<label class="radio-inline"><input type="radio" name="radioGroupTipoDia" id="rdbDiaCat" value="3"> Día categorizado</label>
						</td>
					</tr>
					<tr>
						<td>Día:</td>
						<td>
							<select id="cboAnio" class="form-control">
								<option value="1Lunes">1er Lunes</option>
								<option value="2Lunes">2do Lunes</option>
								<option value="3Lunes">3er Lunes</option>
								<option value="4Lunes">4to Lunes</option>
								<option value="1Martes">1er Martes</option>
								<option value="2Martes">2do Martes</option>
								<option value="3Martes">3er Martes</option>
								<option value="4Martes">4to Martes</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			<hr/>
			<table class="table table-bordered" id="tblPeriodo">
			<thead>
			<tr class="bg-primary">
				<th>Año</th>
				<th>Mes</th>
				<th>Semana</th>
				<th>Tipo día</th>
				<th>día</th>
				<th>Acción</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>2017</td>
				<td>Enero</td>
				<td></td>
				<td>Personalizado</td>
				<td>2do Lunes</td>
				<td>
					<a class="btn btn-info"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a> 
					<a class="btn btn-danger"><i class="fa fa-trash-o" aria-hidden="true"></i></a>
				</td>
			</tr>
			</tbody>
			</table>
        	</div>
        </div>
      </div>
      
   <div class="box-footer">
      <div class="row">
      		<div class="col-xs-12  col-sm-12 col-md-12 col-lg-12">
      			<div class="form-inline">
      				<div class="form-group">
      					<a id="btnGuardar" onclick="accionesPersonal('save')" class="btn btn-primary btn-sm">
      						<i class="fa fa-floppy-o" aria-hidden="true"></i> Guardar
      					</a>
						<a role="button" class="btn btn-default btn-sm" data-dismiss="modal">
							<i class="fa fa-reply" aria-hidden="true"></i> Volver
						</a>
						<label id="lblMessageImg"></label>
					</div>
				</div>
			</div>
		</div>
	</div>
      
      
    </div>
  </div>
</div>

<!-- Modal Pregunta -->
<div class="modal fade" id="mdPregunta" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Mantenimiento de Periodo</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        	<input type="hidden" id="hdIdHorario2">
        		<div class="form-group">
        			<label>¿Desea eliminar este periodo?</label>
        		</div>
        		<div class="form-inline">
        			<div class="form-group">
        				<a onclick="accionesHorario('delete')" class="btn btn-danger btn-sm">
		        			<i class="fa fa-floppy-o" aria-hidden="true"></i> ELIMINAR
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
var vUsuario = $('#smUsuario').text();


	$(document).ready(function(){
		
		
		
		$('#cboFrecuencia').change(function(){
			var vFrecuencia = $('#cboFrecuencia').val();
			if(vFrecuencia == 1){
				$('#dvFrecuenciaSemanal').removeClass();
				$('#dvFrecuenciaMensualAnual').removeClass();
				$('#tblCalendarioEstandar').removeClass('hidden');
				$('#tblCalendarioPersonalizado').removeClass('hidden');
				$('#tblPeriodo').removeClass('hidden');
				
				$('#dvFrecuenciaMensualAnual').addClass('hidden');
				$('#tblCalendarioEstandar').addClass('hidden');
				$('#tblCalendarioPersonalizado').addClass('hidden');
				$('#tblPeriodo').addClass('hidden');
				
				
				$("#rdbCalendarioEstandar").prop("checked", true);
			}
			else if(vFrecuencia == 2){
				$('#dvFrecuenciaSemanal').removeClass();
				$('#dvFrecuenciaMensualAnual').removeClass();
				$('#tblCalendarioEstandar').removeClass('hidden');
				$('#tblCalendarioPersonalizado').removeClass('hidden');
				$('#tblPeriodo').removeClass('hidden');
				
				$('#dvFrecuenciaSemanal').addClass('hidden');
				$('#tblCalendarioEstandar').removeClass('hidden');
				$('#tblCalendarioPersonalizado').removeClass('hidden');
				$('#tblCalendarioPersonalizado').addClass('hidden');
			}
			else{
				$('#dvFrecuenciaSemanal').removeClass();
				$('#dvFrecuenciaMensualAnual').removeClass();
				$('#tblCalendarioEstandar').removeClass('hidden');
				$('#tblCalendarioPersonalizado').removeClass('hidden');
				$('#tblPeriodo').removeClass('hidden');
				
				$('#dvFrecuenciaSemanal').addClass('hidden');
				$('#dvFrecuenciaMensualAnual').addClass('hidden');
				$('#tblCalendarioEstandar').addClass('hidden');
				$('#tblCalendarioPersonalizado').addClass('hidden');
				$('#tblPeriodo').addClass('hidden');
			}
		});
		
		
		$("input[name='radioGroupTipoCalendario']").click(function(){
			$('#tblCalendarioEstandar').removeClass();
			$('#tblCalendarioPersonalizado').removeClass();
			var vTipoDia = $("input[name='radioGroupTipoCalendario']:checked").val();
			
			if(vTipoDia == 0){
				$('#tblCalendarioEstandar').removeClass('hidden');
				$('#tblCalendarioPersonalizado').removeClass('hidden');
				$('#tblCalendarioPersonalizado').addClass('hidden');
			}
			else if(vTipoDia == 1){
				$('#tblCalendarioEstandar').removeClass('hidden');
				$('#tblCalendarioPersonalizado').removeClass('hidden');
				$('#tblCalendarioEstandar').addClass('hidden');
			}
		});
	});
	
	function openModalUpdate(idHorario,Descripcion)
	{
		$(document).ready(function(){
// 			alert(idPerfil + ' || ' + Descripcion);
			$('#mdActualizar').modal('show');
			$('#hdIdHorario1').text(idHorario);
			$('#txtHorario2').val(Descripcion);
		});
	}
	
	function openModalDelete(idHorario)
	{
		$(document).ready(function(){
			$('#mdPregunta').modal('show');
			$('#hdIdHorario2').text(idHorario);
		});
	}
	
</script>

</html>