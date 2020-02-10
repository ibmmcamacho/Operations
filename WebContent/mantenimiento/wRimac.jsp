<%@page import="com.pe.ibm.bean.BeanSession"%>
<%
	BeanSession objBeanSessionCHeader = new BeanSession();
	objBeanSessionCHeader = (BeanSession) session.getAttribute("usuarioLogin");		
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<input type="hidden" id="idUsuario" value="<%=objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin()%>" />
<input type="hidden" id="idTeam" value="<%=objBeanSessionCHeader.getObjBeanPersonal().getiTeam()%>" /> 

<head>
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/custom/css/styleDispatch.css"> --%>
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/clockpicker/css/bootstrap-clockpicker.min.css"> --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%-- <script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script> --%>
<script src="<%=request.getContextPath()%>/resources/Charts/ChartJS/js/jquery.knob.min.js"></script>

 

 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<!--  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>  
 <link rel="stylesheet" src="WebContent/mantenimiento/res/coreui-standalone.min.css"/>  -->
 
     <!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->
     
<!--      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jQuery-Knob/1.2.13/jquery.knob.min.js"> -->
<!-- <link rel="stylesheet" href="WebContent/resources/Charts/ChartJS/js/jquery.knob.min.js"> -->
 <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">  -->




</head>

<body >
	<aside class="right-side"  > 
	
<!-- LOGO CON COMBO  -->
		<section class="content-header">		
			<div class="row">
			
			<!-- LOGO RIMAC -->
				<div class="col-sm-12 col-sm-12 col-md-12 col-lg-1" align="center">
					<div class="form-inline">
						<div class="form-group" id="imagencabecera">
	 						<img class="img-responsive img-rounded" width="117" height="56" src="https://1000logos.net/wp-content/uploads/2017/02/IBM-Symbol-1946-2017.jpg">
						</div>
					</div>
				</div>
				
				
			<!-- FIN LOGO RIMAC -->	
				<div class="col-sm-12 col-sm-12 col-md-12 col-lg-11" style="align-content: center;"align="center">
					
					<div class="form-inline">
					
						<div class="form-group col-xs-7 col-sm-4 col-md-4 col-lg-2" style="padding-top: 10px;">
							<select id="cboSelectSquad" onchange="llenaComboCliente()" disabled class="cbo2 input-sm place4" style="width: 100%;height: 100%;">
								
							</select>
						</div>
					
						<div class=" form-group col-sm-7 col-sm-4 col-md-4 col-lg-3" style="padding-top: 10px;">
							<select id="cboSelectClient" disabled multiple="multiple" onchange="llenaComboGrupo()" class="place1" style="width: 100%;height: 100%;">
								
							</select>
						</div>
						
						
						<div class="form-group col-sm-7 col-sm-4 col-md-4 col-lg-3" style="padding-top: 10px;">
							<select  id="cboSelectGroupOwner" disabled multiple="multiple" onchange="llenaComboOwner();muestracheckboxMA()"  class="cbo2 input-sm place2"  style="width: 100%;height: 100%">
								
							</select>		
							
												
							<a id="mesaservicio" class="hidden">							
								<input type="checkbox" id="checkSR2" onchange="checkSR2m();checks()"> Tickets sin Wo
							</a>
							
							<a id="checkboxTodos">								
								<input type="checkbox" id="checkSR" > SR
								<input type="checkbox" id="checkInc"> Incidentes
								<input type="checkbox" id="checkPro"> Problemas 
								<input type="checkbox" id="checkCam"> Cambios 
								<input type="checkbox" id="checkWO"> WO
								<input type="checkbox" id="checkAct"> Activity								
							</a>
							
						</div>
						
						<div class="form-group col-sm-7 col-sm-3 col-md-3 col-lg-3" style="padding-top: 10px;">
							<select  id="cboSelectOwner" disabled onchange="validar()" multiple="multiple" class="cbo2 input-sm place3" style="width: 3%;height: 10%" >
								

							</select>
						</div>
						
						<div class="form-group col-sm-1 col-sm-1 col-md-1 col-lg-1" style="padding-top: 3px;" align="center">
							<button id="btnShow" class="btn-circle btn-info btn-xl hidden" onmousedown="validar()" onclick="showContent(1)">
								<i class="fa fa-check"></i>
							</button>
						</div>
					</div>
					
				</div>
			</div>
		</section> 
		
<!-- FIN LOGO CON COMBO  -->

<!-- TICKETS Y USUARIO -->
				
		<!-- Main content -->
		<section class="content" style="height:1200px" >
			
			
			<!-- FILA DE TICKETS -->
		<div id="tickets" class="row hidden">
			<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12 form-inline" align="center" >
						
						<div id="ticket1" >
						<div class="col-sm-12 col-sm-4 col-md-4 col-lg-3" >						
				          <div class="small-box bg-yellow">
				            <div  class="inner">
				             <div id="acumuladosTicket"></div>
				              <h4>Tickets Acumulados</h4>				             
				              
				            </div>
				            <div class="icon">
				              <i class="fa fa-ticket"></i>
				            </div>
				            <a href="#" class="small-box-footer">
				          	<!-- BOTON -->
					          <button type="submit" class="btn btn-warning" id="btnInfoAcum"  onclick="abrirmodalACUM('0')" >
	    						<i class="fa fa-id-card-o" aria-hidden="true"></i> Mostrar Info</button>
	    						
    						  <button type="submit" class="btn btn-warning hidden" id="btnWOGroup"  onclick="ListarWOGroup()" >
	    						<i class="fa fa-id-card-o" aria-hidden="true"></i> Wo Grupo</button>
	    						
				            </a>
				          </div>
				       
						 <text id="acumuladosTicket2"  fill="#707070" font-size="35" font-family="SegoeUI-Bold, Segoe UI" font-weight="700"></text>
						</div>
						</div>
						
						<div id="ticket2">
						<div class="col-sm-12 col-sm-4 col-md-4 col-lg-3">
						
						<div class="small-box bg-yellow">
				            <div  class="inner">
				            <div id="sinasignarTicket"></div>
				               <h4>Tickets Sin Asignar</h4>				              
				              
				            </div>
				            <div class="icon">
				              <i class="fa fa-ticket"></i>
				            </div>
				            <a href="#" class="small-box-footer">
				            <!-- BOTON -->
					          <button type="submit" class="btn btn-warning" id="btnInfoSin" onclick="abrirmodalSIN()">
	    						<i class="fa fa-id-card-o" aria-hidden="true"></i> Mostrar Info</button>
							</a>
				          </div>
						
							</div>
						</div>
						
						<div id="ticket3">
						
						<div class="col-sm-12 col-sm-4 col-md-4 col-lg-3">
						
								<div class="small-box bg-yellow">
				            <div  class="inner">
				                <div id="prioridadTicket"></div>
				               <h4>Tickets Prioridad P1 & P2</h4>				             
				              
				            </div>
				            <div class="icon">
				              <i class="fa fa-ticket"></i>
				            </div>
				            <a href="#" class="small-box-footer">
				            <!-- BOTON -->
					          <button type="submit" class="btn btn-warning" id="btnInfoPrio" onclick="abrirmodalPRIO()" >
	    						<i class="fa fa-id-card-o" aria-hidden="true"></i> Mostrar Info</button>
				            </a>
				          </div>
						
								
						</div>
						</div>
						
						<div id="activos">
								<div class="col-sm-12 col-sm-12 col-md-12 col-lg-3">							
									<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
										<div id="divAssistance" class="col-sm-12 col-sm-12 col-md-12 col-lg-12 avatars"></div>
										
									</div>
									<div id="divAssistancetext" class="col-sm-12 col-sm-12 col-md-12 col-lg-12"></div>
									
								</div>
						</div>
				</div>
		</div>
			<!-- FIN FILA DE TICKETS -->
			
			
			<!-- SLA -->
			
			<br>
		   <div id="ticketSLA" class="row hidden" >
			<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12" >
			
				<div class="col-sm-12 col-sm-12 col-md-12 col-lg-2" align="center" style="padding-top: 10px;padding-bottom: 50px">					
					<svg xmlns="http://www.w3.org/2000/svg" width="161.621" height="55" viewBox="0 0 161.621 55">
					  <text id="SLA" transform="translate(2 43)" fill="#fff" font-size="40" font-family="SegoeUI-Bold, Segoe UI" font-weight="700"><tspan x="0" y="0">SLA</tspan></text>
					  <g id="Grupo_106" data-name="Grupo 106" transform="translate(-161 -398)">
					    <path id="Trazado_2007" data-name="Trazado 2007" d="M2383,5792h99.057v-30.837h58.5" transform="translate(-2220 -5341)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="4"/>
					    <line id="Línea_64" data-name="Línea 64" x2="14" y2="14" transform="translate(306.5 405.5)" fill="none" stroke="#fff" stroke-linecap="round" stroke-width="3"/>
					    <path id="Trazado_2008" data-name="Trazado 2008" d="M0,14,14,0" transform="translate(306.5 420.5)" fill="none" stroke="#fff" stroke-linecap="round" stroke-width="3"/>
					  </g>
					</svg>
				</div>
			
				<div class="col-sm-12 col-sm-6 col-md-6 col-lg-2" style="padding-right:20px" >	
					<div class="infobox-data-mc">
						<div class="row text-center col-centered">
							<div class="col-xs-20 col-sm-16 col-md-16 col-lg-16"><!-- Small boxes (Start box) -->
								<div class="info-box bg-aqua">
									<span class="info-box-icon">
										<i class="fa fa-line-chart">
										</i>
									</span>
									<div class="info-box-content">
										<span class="info-box-text">MESA DE AYUDA</span>
<!-- 										13000 -->
										<span id="txtMesaAyuda" class="info-box-number"></span>
									<div class="progress">
										<div class="progress-bar" style="width: 100%">
										</div>
									</div>
										<span class="progress-description">Más Información&nbsp;&nbsp;<i class="fa fa-arrow-circle-right" aria-hidden="true" data-toggle="tooltip" title="" data-original-title="LINEA BASE (INPUTS)">
											</i>
										</span>
									</div><!-- /.info-box-content -->
								</div><!-- /.info-box -->
							</div>
						</div>
					</div>
				</div> 
				
			  	
			    
			    <div class="col-sm-12 col-sm-6 col-md-6 col-lg-2" style="padding-right:20px" >
			   	 <div class="infobox-data-mc">
			   	 <div class="row text-center col-centered">
			   	 <div class="col-xs-20 col-sm-16 col-md-16 col-lg-16">	<!-- Small boxes (Stat box) -->  
			   	  <div class="info-box bg-maroon-active">  
			   	    <span class="info-box-icon"><i class="fa fa-pie-chart"></i></span>  
			   	      <div class="info-box-content">    
			   	        <span class="info-box-text">% RESOLUCIÓN 1er NIVEL</span> 
<!-- 			   	        80%    -->
			   	          <span id="txtResPriLvl" class="info-box-number"></span>    
			   	            <div class="progress">     
			   	             <div class="progress-bar" style="width: 100%"></div>  
			   	                 </div>   
			   	                    <span class="progress-description">Más Información&nbsp;&nbsp;
			   	                    <i class="fa fa-arrow-circle-right" aria-hidden="true" data-toggle="tooltip" title="Fórmula: Llamadas Resueltas Telefónicamente = Total Llamadas resueltas en 1er nivel del tipo FCR1/ Total Llamadas recibidas de Posible Resolución en 1er nivel (FCR1)"></i> 
			   	                         </span>  
			   	                            </div><!-- /.info-box-content --> 
			   	                             </div><!-- /.info-box -->
			   	                             </div>
			   	                             </div>
			   	                             </div>	   
			   	</div>
			
		
			
				<div class="col-sm-12 col-sm-6 col-md-6 col-lg-2" style="padding-right:20px">			   
				   	  <div class="infobox-data-mc">
							<div class="infobox-data-mc">
							<div class="row text-center col-centered">
							<div class="col-xs-20 col-sm-16 col-md-16 col-lg-16"><!-- Small boxes (Stat box) -->   
							<div class="info-box bg-maroon">    
							<span class="info-box-icon">
							<i class="fa fa-pie-chart">
							</i>
							</span> 
							<div class="info-box-content">
							<span class="info-box-text">GESTIÓN TICKETS WEB</span>      
<!-- 							99.50% -->
							<span id="txtGestTicket" class="info-box-number"></span>      
							<div class="progress">      
							<div class="progress-bar" style="width: 100%"></div>      
							</div>      
							<span class="progress-description">        Más Información&nbsp;&nbsp;
							<i class="fa fa-arrow-circle-right" aria-hidden="true" data-toggle="tooltip" title="" data-original-title="GESTIóN TICKETS WEB">
							</i>      
							</span>     
							</div><!-- /.info-box-content -->  
							</div><!-- /.info-box -->
							</div>
							</div>
							</div>
				
				
					 </div>			   
			   	</div>
			   	
		   	 <div class="col-sm-12 col-sm-6 col-md-6 col-lg-2" >			   
			 	<div class="infobox-data-mc">			   	  
			   	  <div class="infobox-data-mc">
				   	  <div class="row text-center col-centered">
					   	  <div class="col-xs-20 col-sm-16 col-md-16 col-lg-16">	<!-- Small boxes (Stat box) -->   
						   	  <div class="info-box bg-red">    
								   	  <span class="info-box-icon">
									   	  <i class="fa fa-bar-chart">
									   	  </i>
								   	  </span>    
						   	  
						   	  <div class="info-box-content">      
							   	  <span class="info-box-text">TASA DE ABANDONO</span>
<!-- 							   	  10%       -->
							   	  <span id="txtTasaAban" class="info-box-number"></span>      
								   	  <div class="progress">      
								   	 	 <div class="progress-bar" style="width: 100%"></div>      
								   	  </div>      
							   	  <span class="progress-description">Más Información&nbsp;&nbsp;
								   	  <i class="fa fa-arrow-circle-right" aria-hidden="true" data-toggle="tooltip" title="" data-original-title="Fórmula: Tasa de Abandono = Total de Llamadas Abandonadas > 15 segundos/ Total de llamadas ingresadas">
								   	  </i>      
							   	  </span>
							   	       
						   	  </div><!-- /.info-box-content -->
						   	    
						   	  </div><!-- /.info-box -->
					   	  </div>
				   	  </div>
			   	  </div>			   	
			   	</div>			   
		   	 </div>
			   	
			   	
			</div>
		</div>
			
			<!-- FIN SLA -->
			
			<!-- TAAAAAAAAAAAAAAAAAAAAAAGGGGGGGGGG -->
			
			<div  id ="options" class="row form-group hidden" align="center" style="padding-left: 40%">
			    <a  href="javascript:void(0)" onclick="openCity(event, 'slider');">
			      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">Productividad</div>
			    </a>
			   
			    <a id="tag2"href="javascript:void(0)" onclick="openCity(event, 'tablas');" class="hidden">
			      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">Tablas</div>
			    </a>
			  
			</div>
			
			<!-- FIN TAAAAAAAAAAAAAAAAAAAAAAGGGGGGGGGG -->
			
			<!-- PERFILES DE USUARIO -->			
			<br>			
			<!-- <div id="tarjeta" class="row col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12 " style="padding-left: 2%;padding-right: 2%;" align="center"> -->
			
		<div id="slider" class="container col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12 w3-container city" >
		
		
		<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" style="background-color:;height:190px">
		 <a id="izq" class=" hidden left carousel-control col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-2" href="#myCarousel" data-slide="prev" style="background-color: ;width:100%">
		      <span class="glyphicon glyphicon-chevron-left" style="font-size: 50px;color: black"></span>
		      <span class="sr-only">Previous</span>
		    </a>
	    </div>  
		  
		  <div id="myCarousel" class="col-xs-10 col-sm-10 col-md-10 col-lg-10 carousel slide" style="background-color: " align="center" >		     
			 <div  id="tarjeta" class="row col-xs-12 col-sm-12 col-md-12 col-lg-12 carousel-inner" style="background-color: "></div>
		  </div>
		  
		  <div  class="col-xs-1 col-sm-1 col-md-1 col-lg-1" style="background-color:;height:190px">
		  	 <a id="der" class="hidden right carousel-control col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-2" href="#myCarousel" data-slide="next" style="background-color: ;width:100%">
		      <span class="glyphicon glyphicon-chevron-right" style="font-size: 50px;color: black"></span>
		      <span class="sr-only">Next</span>
		    </a><!-- Fiin botones derecha e izquierda -->
		  </div>
		</div>
		
				<!-- OPCIOOOON TABLA -->
				<div id="tablas" style="display:none" align="center" class="w3-container city">
				
					<div class="row">
						<div class="col-lg-12 connectedSortable">
							<div class="box box-primary">
								<div class="box-header with-border ">					
										
										<h3 class="box-title"> <i class="fa fa-clock-o" aria-hidden="true"></i> TIEMPO DE RESPUESTA</h3>
											<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="padding-left: 95%">			
														<button  class="btn-primary" onclick="Tabla1()"><i class="fa fa-refresh fa-spin" style="font-size:20px;color: black;"></i>Refresh</button>
											</div>		
								</div>
								<div class="box-body">
									<label id="lblMessage" class="label label-info"></label>
										<div id="tabla1container" class="table-responsive">
										</div>
										
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-lg-12 connectedSortable">
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> TIEMPO DE SOLUCIÓN</h3>
								</div>
								<div class="box-body">
									<label id="lblMessage" class="label label-info"></label>
										<div id="tabla2container" class="table-responsive">
										</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-lg-12 connectedSortable">
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i> NO APLICA SLA </h3>
								</div>
								<div class="box-body">
									<label id="lblMessage" class="label label-info"></label>
										<div id="tabla3container" class="table-responsive">
										</div>
								</div>
							</div>
						</div>
					</div>
				
				</div>
				
				<!-- FIN OPCION TABLAS -->
				</div>
			<!-- FIN DE PERFILES DE USUARIO -->			
			<br>
			<br>

			
		</section>
 	</aside>
 	
 <!-- MODAL BOTON ONLINE Y OFFLINE -->
<div class="modal fade" id="mdListaUsuarios" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document" style="width: 800px">
    <div class="modal-content">
      <div class="modal-header" align="center">
        <div id="titulonline"class="modal-title"></div>
      </div>
      
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        		<input type="hidden" id="hdIdPerfil">
        		<div class="form-group">
        			
        			<div id="onlineUser" class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">       	
        			
        			</div>
        			
        			
        			</div> 
        			       			
        		</div>  
        				
        	</div>
        </div>
      </div>
      
    </div>
  </div>
</div>


			<div class="modal fade" id="mdListaAcumulados" tabindex="-1" role="dialog">
			  <div class="modal-dialog" role="document" style="width: 1300px">
			    <div class="modal-content">
			    
			      <div class="modal-header" align="center">
			        <h4 class="modal-title" id ="TituloModal"></h4>
			      </div>      
			      
				      <div class="modal-body">
				      	<div class="row">
				        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				        		<input type="hidden" id="hdIdPerfil">
				        		
				        		<div class="form-group">				        			
				        			<div id="tbcontainerTicketAcumulados" class="table-responsive" align="center"></div>				        			
				       			</div> 
				       			       			       			
				        	</div>         				
				       	</div>
				       </div>
				       
			     </div>      
			   </div>
			 </div>


		<div class="modal fade" id="mdListaWOGroup"  role="dialog">
			  <div class="modal-dialog" role="document" style="width: 1300px">
			    <div class="modal-content">
			    
			      <div class="modal-header" align="center">
			        <h4 class="modal-title" id ="TituloModalWOGroup">Lista por grupo de WO </h4>
			      </div>      
			      
				      <div class="modal-body">
				      	<div class="row">
				        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				        		<input type="hidden" id="hdIdPerfil">
				        		
				        		<div class="form-group">				        			
				        			<div id="tbcontainerWOGROUP" class="table-responsive" align="center"></div>				        			
				       			</div> 
				       			       			       			
				        	</div>         				
				       	</div>
				       </div>
				       
			     </div>      
			   </div>
			 </div>


 	 <script type="text/javascript"> 

 	   
 	 $('.knob').each(function () {

         var $this = $(this);
         var myVal = $this.attr("rel");
         $this.knob();

         $({
             value: 0
         }).animate({
             value: myVal
         }, {
             duration: 500,
             easing: 'swing',
             step: function () {
                 $this.val(Math.ceil(this.value)).trigger('change');

             }
         })

     });
	
 	 
 	$(".place1").select2({
 	    placeholder: "Seleccione Cliente"
 	});
 	$(".place2").select2({
 	    placeholder: "Seleccione Grupo"
 	});
 	$(".place3").select2({
 	    placeholder: "Seleccione Propietario"
 	});
 	$(".place4").select2({
 	    placeholder: "Seleccione Tribu"
 	});
	
 	llenaComboSquad();
	/* llenaComboCliente(); */
	ListPersonal();
	
	
	/*  //Función para programar recarga de Dashboard
		setInterval(function(){ 
		if($('#cboSelectClient').val() != null){
			if($('#cboSelectGroupOwner').val() != null){
				if($('#cboSelectOwner').val() != null){
 					showContent(2);
				}
				else
					console.log('Fail3');
			}
			else
				console.log('Fail2');
		}
		else
			console.log('Fail1');
		}, 600000); // cada 10 minutos
		
		//Función para programar tablas con SLA Mesa de Ayuda Rimac Onsite
		setInterval(function(){
			Tabla1();
			}, 300000); // cada 5 minutos
	 
	 */
	
	function showContent(par1){		
		
		/* alert ($('#cboSelectClient').val()+'----'+$('#cboSelectGroupOwner').val()+'----'+$('#cboSelectOwner').val()); */
		if(par1 == 1){
		$('#options').removeClass('hidden');
		
		/* alert($('#cboSelectClient').val()+'    '+$('#cboSelectGroupOwner').val()+'    '+$('#cboSelectOwner').val()); */ 
		
		$('#divAssistance tspan').remove();
		$('#divAssistance span').remove();
		$('#divAssistance p').remove();
		$('#divAssistance input').remove();
		
		$('#divAssistancetext span').remove();
		$('#divAssistancetext p').remove();
		$('#divAssistancetext a').remove();
		$('#divAssistancetext input').remove();
		
		/* TICKET */
		$('#tickets').removeClass('hidden');//muestra los Tickets
		$('#acumuladosTicket h3').remove();
		$('#sinasignarTicket h3').remove();
		$('#prioridadTicket h3').remove();
		$('#acumuladosTicket').append('<i class="fa fa-refresh fa-spin" style="font-size:50px;color: black;"></i>');
		$('#sinasignarTicket').append('<i class="fa fa-refresh fa-spin" style="font-size:50px;color: black;"></i>');
		$('#prioridadTicket').append('<i class="fa fa-refresh fa-spin" style="font-size:50px;color: black;"></i>');
		$('#ticket1').addClass('overlay');
		$('#ticket2').addClass('overlay');
		$('#ticket3').addClass('overlay');
		$('#btnInfoAcum').prop('disabled',true);
		$('#btnWOGroup').prop('disabled',true);
		
		
		$('#btnInfoSin').prop('disabled',true);
		$('#btnInfoPrio').prop('disabled',true);
		
		
		/* FIN TICKET */
		
		/* ACTIVOS */
		$('#activos').addClass('overlay');
		$('#activos i').remove();
		$('#activos tspan').remove();
		$('#activos button').remove();
		$('#activos').append('<i class="fa fa-refresh fa-spin" style="font-size:50px;color: black;"></i>');
		/* FIN ACTIVOS */
		
		/* SLA */		
		$('#ticketSLA').addClass('hidden');
		
		/* FIN SLA */
		
		/* TARJETA */
		$('#izq').addClass('hidden');
		$('#der').addClass('hidden');
		$('#slider').removeClass('hidden');//muestra los Div Tarjetas
		$('#tarjeta').addClass('overlay');
		$('#tarjeta div').remove();
		$('#tarjeta').append('<i class="fa fa-refresh fa-spin" style="font-size:50px;color: black;"></i>');
		/* FIN TARJETA */
		
		/* BOTON CHECK */
		
		$('#btnShow').prop('disabled',true);
		/* FIN BOTON CHECK */
		
		ticketsCountP();				
		listOnline();
		
		
		
		}else {		
			
			ticketsCountP();
			setTimeout(function(){listOnline();}, 900);
			
		}
		/* nomatch(); si hay usuarios en linea se inicia esta funcion		 */ 
		
		
		
	}
	
	function checks(){		
		
		var chk = document.getElementById("checkSR2").checked;
		var chk1 = document.getElementById("checkSR").checked;
		var chk2 = document.getElementById("checkInc").checked;
		var chk3 = document.getElementById("checkPro").checked;
		
	 	var chk4 = document.getElementById("checkCam").checked;
		var chk5 = document.getElementById("checkWO").checked;
		var chk6 = document.getElementById("checkAct").checked; 		
		
		if (chk == true){										
			
			document.getElementById("checkSR2").value = "1";
			document.getElementById("checkSR").value = "0";
			document.getElementById("checkInc").value = "0";
			document.getElementById("checkPro").value = "0";
			document.getElementById("checkCam").value = "0";
			document.getElementById("checkWO").value = "0";
			document.getElementById("checkAct").value = "0";				
			
			document.getElementById("checkSR").checked = false;
			document.getElementById("checkInc").checked = false;
			document.getElementById("checkPro").checked = false;
			document.getElementById("checkCam").checked = false;
			document.getElementById("checkWO").checked = false;
			document.getElementById("checkAct").checked = false;
			
			
		}else{
			document.getElementById("checkSR2").value = "0"
		}
		if (chk1 == true){										
			document.getElementById("checkSR").value = "1"					
		}else{
			document.getElementById("checkSR").value = "0"
		}
		if (chk2 == true){										
			document.getElementById("checkInc").value = "1"					
		}else{
			document.getElementById("checkInc").value = "0"
		}
		if (chk3 == true){										
			document.getElementById("checkPro").value = "1"					
		}else{
			document.getElementById("checkPro").value = "0"
		}
		if (chk4 == true){										
			document.getElementById("checkCam").value = "1"					
		}else{
			document.getElementById("checkCam").value = "0"
		}
		if (chk5 == true){										
			document.getElementById("checkWO").value = "1"					
		}else{
			document.getElementById("checkWO").value = "0"
		}
		if (chk6 == true){										
			document.getElementById("checkAct").value = "1"					
		}else{
			document.getElementById("checkAct").value = "0"
		} 
		
		
		
	}
	
    /* VALIDA LOS COMBOS PARA MOSTRAR EL BOTON */
	function validar(){
		
		var a = $('#cboSelectClient').val();		
		var b = $('#cboSelectGroupOwner').val();	
		var c = $('#cboSelectOwner').val();      
		         
		if(a != "" || a != null  && b != "" || b != null && c != "" || c != null){					
			 $('#btnShow').removeClass('hidden');
		}else{						
			 $('#btnShow').addClass('hidden');
		}			
	}
	/*FIIIN VALIDA LOS COMBOS PARA MOSTRAR EL BOTON */
	
	
	/* CAMBIARIMAGEN */
		 $('#cboSelectClient').change(function (){
			
			var a = $('#cboSelectClient').val();
			
			if(a == 'PE-BELC-SO'){		
				$('#imagencabecera img').remove();
				$('#imagencabecera').append($('<img class="img-responsive img-rounded" width="217" height="56" src="https://proactivo.com.pe/wp-content/uploads/2016/10/belcorp.png">'));
				
			}else if(a == 'PE-RIMAC-SO'){
				$('#imagencabecera img').remove();
				$('#imagencabecera').append($('<img class="img-responsive img-rounded" width="117" height="56" src="data:image/png;base64,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">'));
				
			}else {
				$('#imagencabecera img').remove();
				$('#imagencabecera').append($('<img class="img-responsive img-rounded" width="117" height="56" src="https://1000logos.net/wp-content/uploads/2017/02/IBM-Symbol-1946-2017.jpg">'));
				
				
			}
		}); 
	
		
		/* CAMBIARIMAGEN */
		
		
		function ListarWOGroup()	{	
			$('#mdListaWOGroup').modal('show');
			$('#tbcontainerWOGROUP div').remove();
			$('#tbcontainerWOGROUP').addClass('overlay');
			$('#tbcontainerWOGROUP').append('<i class="fa fa-refresh fa-spin" style="font-size:50px;color: black;"></i>');
			ModalTicketsWOGROUP();
		}
		
		function ModalTicketsWOGROUP()	{
			
			$(document).ready(function() {			
				var src = "ServletMaximoView";	
				var tribu = $('#cboSelectSquad').val().toString();
				$.post(src, {strAccion : 'ListarGrupoWO',tribu:tribu , idcliente : $('#cboSelectClient').val().toString(),
													   			 idgrupo : $('#cboSelectGroupOwner').val().toString()},
			   			function(pdata) {
								var obj = JSON.parse(pdata);
								console.log(obj)
								var dataReporte = [];
								var columnsReporte = [];
								
									for(i = 0; i < obj.ListarWOGrupo.length ; i++){
										var arr = [];
										arr.push(i+1);
										arr.push(obj.ListarWOGrupo[i].CodigoTicket.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].PrioridadInterna.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].WO_Group);
										arr.push(obj.ListarWOGrupo[i].Status.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].Source.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].PersonaAfectada.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].IdGrupo.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].Grupo.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].IdPropietario.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].Propietario.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].ParentClient.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].Summary.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].CI.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].CI_Nombre.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].IdClasificacion.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].Clasificacion.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].FechaDeCreacion.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].FechaReporte.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].InicioActual.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].COPR.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].Backlog.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].TimeToResolve.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].AC.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].WORKLOG.replace('NULL','-').replace('null','-'));
										arr.push(obj.ListarWOGrupo[i].ParentTicket.replace('NULL','-').replace('null','-'));
										
										dataReporte.push(arr);							
									}
							
									
									columnsReporte=[ 
										{title : "NRO"},
										{title : "CodigoTicket"},
							            {title : "PrioridadInterna"},
							            {title : "WO_Group"},
							            {title : "Status"},
							            {title : "Source"},
							            {title : "PersonaAfectada"},
							            {title : "IdGrupo"},
							            {title : "Grupo"},
							            {title : "IdPropietario"},
							            {title : "Propietario"},
							            {title : "ParentClient"},
							            {title : "Summary"},
							            {title : "CI"},
							            {title : "CI_Nombre"},
							            {title : "IdClasificacion"},
							            {title : "Clasificacion"},
							            {title : "FechaDeCreacion"},
							            {title : "FechaReporte"},
							            {title : "InicioActual"},
							            {title : "COPR"},
							            {title : "Backlog"},
							            {title : "TimeToResolve"},
							            {title : "AC"},
							            {title : "WORKLOG"},
							            {title : "Parent Ticket"}
							           
							            
							       ];
																		
									setDataTicketWOGROUP(dataReporte, columnsReporte);
									$('#tbcontainerWOGROUP i').remove();
									$('#tbcontainerWOGROUP').removeClass('overlay');
							});
			});
		}
		
		var htmlTableWOGROUP = '<table id=\"tblReporteWOGROUP\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';


		/* SETDATA PARA EL TICKET ACUMULADOS */
		
		function setDataTicketWOGROUP(pdataReporte, pcolumnsReporte){	
			
 			document.getElementById('tbcontainerWOGROUP').innerHTML = htmlTableWOGROUP;	
			
			if(typeof tableReporte === 'undefined'){
		    
			var tableReporte = $('#tblReporteWOGROUP').DataTable(
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
	
		function llenaComboSquad()	{			
			$(document).ready(function() {
				$('#cboSelectClient').prop("disabled", true);
				
				var src = "ServletMaximoView";
				$.post(src, {strAccion : 'SelectSquad'},
						function(pdata) {
						  var obj = JSON.parse(pdata);						
						  $('#cboSelectSquad option').remove();			
							if(obj.selectSquad.length > 0){
								$('#cboSelectSquad').append($('<option>', {value: '0',text : 'Seleccionar Tribu'}));
				    				$.each(obj.selectSquad, function (i, item) {
				    				    $('#cboSelectSquad').append($('<option>', { 
				    				        value: item.ticketIdSquad,
				    				        text : item.ticketSquad			    				    
				    				    }));
				    				});			    				
			  				}else{
			  					$('#cboSelectSquad').append($('<option>', { 
			    				    value: '0',
			    				    text : 'Seleccionar'
			    				}));
			  				}$('#cboSelectSquad').prop("disabled", false);
			  				
						});
			})
		}
		
		
		function llenaComboCliente()	{
			
			
			var varSQUAD = document.getElementById("cboSelectSquad").value.toString();
				
			$('#cboSelectClient').prop("disabled", true);
			$(document).ready(function() {
				$('#btnShow').addClass('hidden');
				$('#cboSelectGroupOwner').prop("disabled", true);
				$('#cboSelectOwner').prop("disabled", true);
				var src = "ServletMaximoView";
				$.post(src, {strAccion : 'SelectClient',SQUAD : varSQUAD},
						function(pdata) {
						  var obj = JSON.parse(pdata);console.log(obj)						
							$('#cboSelectClient option').remove();						
							if(obj.CboClient.length > 0){
								$('#cboSelectClient').append($('<option>', {value: '0',text : 'Todos los Clientes'}));
				    				$.each(obj.CboClient, function (i, item) {
				    				    $('#cboSelectClient').append($('<option>', { 
				    				        value: item.ticketIdCliente,
				    				        text : item.ticketCliente			    				    
				    				    }));
				    				});			    				
			  				}else{
			  					$('#cboSelectClient').append($('<option>', { 
			    				    value: '0',
			    				    text : 'Seleccionar'
			    				}));
			  				}$('#cboSelectClient').prop("disabled", false);
						});
			})
		}
		
		
		function llenaComboGrupo()	{
			
			$(document).ready(function() {	
				
				
				$('#btnShow').addClass('hidden');
				$('#cboSelectGroupOwner').prop("disabled", true);		
				$('#cboSelectOwner').prop("disabled", true);
				
				var src = "ServletMaximoView";
				$.post(src, {strAccion : 'SelectGroupOwner',
					ticketIdCliente : $('#cboSelectClient').val().toString()},
						function(pdata) {
						  var obj = JSON.parse(pdata);
						  console.log(obj)
							$('#cboSelectGroupOwner option').remove();						
							if(obj.CboGroupOwner.length > 0){
								$('#cboSelectGroupOwner').append($('<option>', {value: '0',text : 'Todos los Grupos'}));
				    				$.each(obj.CboGroupOwner, function (i, item) {
				    				    $('#cboSelectGroupOwner').append($('<option>', { 
				    				        value: item.ticketIdGrupoPropietario,
				    				        text : item.ticketGrupoPropietario			    				    
				    				    }));
				    				});			    				
			  				}else{
			  					$('#cboSelectGroupOwner').append($('<option>', { 
			    				    value: '0',
			    				    text : 'No Hay Registros'
			    				}));
			  				}
							
							  $('#cboSelectGroupOwner').prop("disabled", false);
						});
			}) 
		}
		
		
		function llenaComboOwner()	{
			$(document).ready(function() {
				$('#cboSelectOwner').val('0').trigger('change.select2');
				$('#btnShow').addClass('hidden');
				$('#cboSelectOwner').prop("disabled", true);				
				
				
				var src = "ServletMaximoView";
				var tribu = $('#cboSelectSquad').val().toString();
				var ticketEmailPropietario = "0";
				$.post(src, {strAccion : 'SelectOwner',tribu : tribu,ticketIdCliente : $('#cboSelectClient').val().toString(),
														ticketIdGrupoPropietario : $('#cboSelectGroupOwner').val().toString(),
														ticketEmailPropietario : ticketEmailPropietario,
														  checkbox  : '0',
														  checkbox1 : '0',
														  checkbox2 : '0',
														  checkbox3 : '0',
														  checkbox4 : '0',
														  checkbox5 : '0',
														  checkbox6 : '0',
														},             
						function(pdata) {
						  var obj = JSON.parse(pdata);						
							$('#cboSelectOwner option').remove();
							console.log(obj)
							if(obj.CboOwner.length > 0){								
								$('#cboSelectOwner').append($('<option>', {value: '0',text : 'Todos los Propietarios'}));
				    				$.each(obj.CboOwner, function (i, item) {
				    				    $('#cboSelectOwner').append($('<option>', { 
				    				        value: item.OwnerId,
				    				        text : item.Owner			    				    
				    				    }));
				    				});			    				
			  				}else{
			  					$('#cboSelectOwner').append($('<option>', { 
			    				    value: '0',
			    				    text : 'No Hay Registros'
			    				}));
			  				}
							
							 $('#cboSelectOwner').prop("disabled", false);
							 
						});
			});
		}
		
		
		function ListPersonal()	{			
			$(document).ready(function() {			
				var src = "ServletMaximoView";
				$.post(src, {strAccion : 'ListPersonal'},
						function(pdata) {
						  var obj = JSON.parse(pdata);						
							console.log(obj)
						});
			})
		}
		
		/* MUESTRA CHECKBOX PARA ONSITE O NO  */
		function muestracheckboxMA(){			
			var vcg = $('#cboSelectGroupOwner').val().toString();
			
				if(vcg.includes('-DCS-') || vcg.includes('-SDD-')){// para MESA DE AYUDA
					
					$('#mesaservicio').removeClass('hidden');
					$('#tag2').removeClass('hidden');
					document.getElementById("options").style.paddingLeft = "30%";
					
				} else{
					$('#mesaservicio').addClass('hidden');
					document.getElementById("checkSR2").value = "0";
					document.getElementById("checkSR2").checked = false;
					checks();
					$('#checkboxTodos').removeClass('hidden');
					$('#tag2').addClass('hidden');				
					document.getElementById("options").style.paddingLeft = "40%";					
					
				}
		}
		
		// si el check Aplicar Filtros : esta seleccionado muestra los demas
		function checkSR2m(){			
			var vcp = document.getElementById("checkSR2").checked;
			
			if(vcp == true){
				$('#checkboxTodos').addClass('hidden');			
				
			} else{
				$('#checkboxTodos').removeClass('hidden');
			}
			
		}
		
		/* FIN MUESTRA CHECKBOX PARA WORK ORDER O NO  */
		
		$('#cboSelectClient').change(function(){			
			var vCboGroupOwner = $('#cboSelectClient').val().toString();			
					
			if(vCboGroupOwner.startsWith('0')){				
				$('#cboSelectClient').val(0).trigger('change.select2');			  			  	
		  	}else{		  		
			}
		});
		
		
		$('#cboSelectGroupOwner').change(function(){			
			var vCboGroupOwner = $('#cboSelectGroupOwner').val().toString();			
					
			if(vCboGroupOwner.startsWith('0')){
				$('#cboSelectGroupOwner').val(0).trigger('change.select2');			  			  	
		  	}else{		  		
			}
		});
		
		
		$('#cboSelectOwner').change(function(){			
			var vCboOwner = $('#cboSelectOwner').val().toString();			
					
			if(vCboOwner.startsWith('0')){				
				$('#cboSelectOwner').val(0).trigger('change.select2');			  	
		  	}else{	  		
			}
		});
		
var porcentaje ='';
		/* TICKETS */		
		function ticketsCountP()	{
			checks();
			$(document).ready(function() {				
				var src = "ServletMaximoView";
				
				var tribu = $('#cboSelectSquad').val().toString();
				var client = $('#cboSelectClient').val().toString();
				
				var groupowner = $('#cboSelectGroupOwner').val().toString();
				var owner = "0";
					/* $('#cboSelectOwner').val().toString(); */
				
				
				$.post(src, {strAccion : "TicketsCount",tribu :tribu  ,ticketIdCliente : client,
														ticketIdGrupoPropietario : groupowner,
														ticketEmailPropietario : owner,
														checkbox : $('#checkSR2').val().toString(), 
														checkbox1 : $('#checkSR').val().toString(),
														  checkbox2 : $('#checkInc').val().toString(),
														  checkbox3 : $('#checkPro').val().toString(),
														  checkbox4 : $('#checkWO').val().toString(),
														  checkbox5 : $('#checkAct').val().toString(),
														  checkbox6 : $('#checkCam').val().toString()},
														
				function(pdata) {
				 var obj = JSON.parse(pdata);				 
				  console.log(obj)				  
				  $('#acumuladosTicket h3').remove(); $('#sinasignarTicket h3').remove(); $('#prioridadTicket h3').remove();
				  $('#acumuladosTicket h5').remove(); $('#sinasignarTicket h5').remove(); $('#prioridadTicket h5').remove();
				  $('#acumuladosTicket i').remove(); $('#sinasignarTicket i').remove();  $('#prioridadTicket i').remove();
				  				  
				  	/* if(obj.ticketsCount.length > 0){ */
					  
				  		if(obj.ticketsCount[0].ticketsAcu != 'No hay registros' && obj.ticketsCount[0].ticketsAcu != null){
				  			
		    				$.each(obj.ticketsCount, function (i,item) {//i = posicion del array , item = valor elegido del objeto
		    					porcentaje = parseInt(parseInt(item.ticketsAcu)-parseInt(item.ticketsSAS));
		    				    $('#acumuladosTicket').append($('<h3>'+item.ticketsAcu.replace('NULL','-').replace('null','-')+'</h3>'));
		    				    $('#sinasignarTicket').append($('<h3>'+item.ticketsSAS.replace('NULL','-').replace('null','-')+'</h3>'));
		    				    $('#prioridadTicket').append($('<h3>'+item.ticketsPri.replace('NULL','-').replace('null','-')+'</h3>'));  
		    				});	
		    				
				  		}else{
				  			
				  			 $('#acumuladosTicket').append($('<h3>-</h3>'));
		    				    $('#sinasignarTicket').append($('<h3>-</h3>'));
		    				    $('#prioridadTicket').append($('<h3>-</h3>'));
				  			
				  		}		    				
		    		
				  
				  $('#ticket1').removeClass('overlay');
				  $('#ticket2').removeClass('overlay');
				  $('#ticket3').removeClass('overlay');
				  $('#btnInfoAcum').prop('disabled',false);
				  $('#btnInfoSin').prop('disabled',false);
				  $('#btnInfoPrio').prop('disabled',false);				  
				
				  
				   checks();
				   var WOG = document.getElementById("checkWO").value;
				   if(WOG == '1'){
					   $('#btnWOGroup').removeClass('hidden');
					   $('#btnWOGroup').prop('disabled',false);
				   
				   }else{
					   $('#btnWOGroup').addClass('hidden');
				   }
				
				  setTimeout(function(){setSLA();}, 600);  
				  setTimeout(function(){setUsers();}, 900); 
			});
	    						    			
		});
		 }
		/* FIN TICKETS */
		
		
		function listUserImages(obj){	
			var strHTML2 = "";
		 	var result = obj.length-5;
		 	
			if (obj.length > 5) {		
					for(i = 0; i < 5; i++){				
						strHTML2 +="<span class='avatar'>"+
								   "<img  src='http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email="+obj[i].ticketEmailPropietario+"'>"+
								   "</span>";
					}
					strHTML2 += "<tspan>+"+result+"</tspan>";
					
			}else {
				
				for(i = 0; i < obj.length; i++){
					
					strHTML2 +="<span class='avatar'>"+	
							   "<img  src='http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email="+obj[i].ticketEmailPropietario+"'>"+
							   "</span>";
				}		
			}
			document.getElementById('divAssistance').innerHTML = strHTML2; 
			
			var strHTML = "";
				
				if (obj.length > 0) {					
					/* strHTML +="<p><b>"+obj.length+" Usuario(s) seleccionado(s)</b></p>" */
					/* strHTML +="<p><b>"+obj.length+" Usuario(s) seleccionado(s)</b></p>" */
			strHTML	+="<button onclick='abrirmodal()' class='btn-info' style='font-family:arial;font-size:18px'>"+obj.length+"  Usuario(s) Online</button>";			
				}else{
					strHTML = "";
				}
				
			document.getElementById('divAssistancetext').innerHTML = strHTML;
			
		
		}
		
		
		/* BOTON DE USUARIOS ACTIVOS */
		
		 function listOnline()	{
			
	 	var vidTeam = $('#idTeam').val(); //MatchActiveUsers
	 	vidTeam = 2; //MCCS TODO: Hardcoded
	 	var ticketIdCliente = $('#cboSelectClient').val().toString();
	 	var ticketIdGrupoPropietario = document.getElementById("cboSelectGroupOwner").value;
								 /* alert(ticketIdGrupoPropietario); */
		$(document).ready(function() {
			var src = "ServletMaximoView";
			$.post(src, {strAccion : 'MatchActiveUsers', idTeam : vidTeam,
														ticketIdCliente : ticketIdCliente,
														ticketIdGrupoPropietario : $('#cboSelectGroupOwner').val().toString()},
					function(pdata) {
					  var obj = JSON.parse(pdata);		
					  console.log(obj)
					  
						$('#onlineUser div').remove();
					  $('#activos tspan').remove();
					  $('#titulonline h3').remove();
						
		/* if(obj.matchActiveUsers.length > 0){ */ 
					   if(obj.matchActiveUsers[0].idEmpleado != 'No hay registros'){
						   
									listUserImages(obj.matchActiveUsers);
										
									
				    				$.each(obj.matchActiveUsers, function (i, item) {
									  var uppper = item.ticketEmailPropietario.toUpperCase();	
					  				  var email = uppper.replace('@','').replace('.','').replace('.','').replace('.','');
					  				  
				  				    $('#onlineUser').append($('<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
				 		'<img class="img-responsive avatar" style="height:55px;width:55px" src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email='+item.ticketEmailPropietario+'">'+
				   		'</div>'+
						'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="height:60px;padding-top:10px">'+item.nombre+' '+item.apPaterno+'</div>'+
						'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" id="'+email+'tiempo'+'" style="height:60px;padding-top:10px"><i class="fa fa-circle"></i>  Activo</div>'));
							    				
				  				    /* AQUI TIEMPO SERVLET*/
				  				 var uppper = item.ticketEmailPropietario.toUpperCase();	
					  			 var email = uppper.replace('@','').replace('.','').replace('.','').replace('.','');
				  				 var idEmpleado = item.idEmpleado;
				  				  idTeam = 2;
									var src2 = "ServletMaximoView";
									
									$.post(src2, {strAccion:"ListEyS", idTeam : idTeam,idEmpleado : idEmpleado}, 
							 					function(pdata) {
							 					  var obj = JSON.parse(pdata);
							 					 
							 					 
							 						 $.each(obj.listEyS, function (i, item) {			 							
							 							
												$('#'+email+'tiempo').append($('<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" ><i>'+item.strDateE+
																			   '</i>'+
																			   '</div>'));
							 							 
									});});});	 	
				    				$('#titulonline').append($('<h3>Usuarios en Línea ('+obj.matchActiveUsers.length+')</h3>'));
				    				nomatch();
							    				
						}// nombre no null
						else{$('#activos').append($('<tspan style="font-size:20px">Sin Usuarios Registrados</tspan>'));}
	
						
						
						
						$('#activos').removeClass('overlay');
						$('#activos i').remove();
						 
						
					});
		});
								 
			}
		 
	function nomatch(){
	
	
	var idTeam = $('#idTeam').val(); //MatchActiveUsers
	idTeam = 2; //MCCS TODO: Hardcoded
	var ticketIdCliente = $('#cboSelectClient').val().toString();
	var ticketIdGrupoPropietario = document.getElementById("cboSelectGroupOwner").value;
			$(document).ready(function() {
				var src = "ServletMaximoView";
				$.post(src, {strAccion : 'NoMatchActiveUsers', idTeam : idTeam,
															ticketIdCliente : ticketIdCliente,
															ticketIdGrupoPropietario : $('#cboSelectGroupOwner').val().toString()},
						function(pdata) {
						  var obj = JSON.parse(pdata);		
						  console.log(obj)
						
	if(obj.nomatchActiveUsers[0].ticketPropietario != null && obj.nomatchActiveUsers[0].ticketPropietario != 'No hay registros' && obj.nomatchActiveUsers[0].ticketPropietario != 'undefined'){
					
				    				$.each(obj.nomatchActiveUsers, function (i, item) {
				    					
						    $('#onlineUser').append($('<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">'+
				'<img class="img-responsive avatar" style="height:55px;width:55px" src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email='+item.ticketEmailPropietario+'">'+
						    		'</div>'+
				        			'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="height:60px;padding-top:10px">'+item.ticketPropietario+'</div>'+
				        			'<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="height:60px;padding-top:10px"><i class="fa fa-circle2"></i> No Activo</div>'));
				    				
				    				
				    				});	 	    				
			  				}else{
			  					
			  				
			  				}
						  
						 
						});
			});	 
			
	
	
}
		/* SSSSSSSSSSLLLLLLLLLLLAAAAAAAAAAA */
		function setSLA(){
			var src = "ServletMaximoView";
			var select = $('#cboSelectClient').val().toString();
	 	 	var clientId = select.options[select.selectedIndex].value
	 		//Inicio POST para  listar información en la tabla
	 	 	$.post(src, {strAccion:"ClientTicketsSLA", ticketIdCliente : clientId}, 
	 					function(pdata) {
	 					  var obj = JSON.parse(pdata);
	 					  console.log(obj);		  
	 					  
	 					 if(obj.Sla[0].slaTitulo != 'No hay registros' && obj.Sla[0].slaTitulo != null){
	 					 
	 					var vcg = $('#cboSelectGroupOwner').val().toString();
	 					
	 					if(vcg.includes('-DCS-') || vcg.includes('-SDD-')){
	 					  $('#ticketSLA').removeClass('hidden');}	 					
	 					 showSLA(obj.Sla);	 				 					
	 					 
 	 					 }else{	 						 
 	 						$('#ticketSLA').addClass('hidden'); 	 						
 	 					 }
	 					
	 					
	 	 	});
		}
		
		function showSLA(obj){
			
			var txtMesaAyuda = document.getElementById("txtMesaAyuda");
			txtMesaAyuda.textContent = obj[0].slaNumerico + " INPUTS"
			  
			if(obj.length > 4){
				
		    var txtResPriLvl = document.getElementById("txtResPriLvl");
			txtResPriLvl.textContent = obj[5].slaNumerico + " %"
			
			var txtGestTicket = document.getElementById("txtGestTicket");
			txtGestTicket.textContent = obj[8].slaNumerico + " %"
			
			var txtTasaAban = document.getElementById("txtTasaAban");
			txtTasaAban.textContent = obj[10].slaNumerico + " %"
			
			}
			
			
			/* show.hidden = false */
			
		}
		
		/* FIN SSSSSSSSSSLLLLLLLLLLLAAAAAAAAAAA */

			function OwnerGrade2()	{	
				checks();		 	 		 	 	
		 	 	var ticketIdCliente = $('#cboSelectClient').val().toString();
		 	 	var ticketIdGrupoPropietario = document.getElementById("cboSelectGroupOwner").value;
		 	 	var src = "ServletMaximoView"; 
		 	 	
		 	//Inicio POST para  listar información en la tabla
		 	 $.post(src, {strAccion : 'OwnerGrade',ticketIdCliente : ticketIdCliente,
													ticketIdGrupoPropietario : $('#cboSelectGroupOwner').val().toString(),
													ticketEmailPropietario : $('#cboSelectOwner').val().toString(),
													 checkbox : $('#checkSR2').val().toString(),
													  checkbox1 : $('#checkSR').val().toString(),
													  checkbox2 : $('#checkInc').val().toString(),
													  checkbox3 : $('#checkPro').val().toString(),
													  checkbox4 : $('#checkWO').val().toString(),
													  checkbox5 : $('#checkAct').val().toString(),
													  checkbox6 : $('#checkCam').val().toString()}, 
														        
					function(pdata) {
						  var obj = JSON.parse(pdata);						
							console.log(obj)
							
							
						$.each(obj.OwnerGrade, function (i,item) {
							
							var a = 'grado'+item.OwnerId.replace('@','').replace('.','').replace('.','').replace('.','').replace('.','');
							
							if(item.Grado == 'Blues'){
 								 $('#'+a).addClass('text-teal');	 								
 							}else if (item.Grado == 'Rhythm'){	 								
 								$('#'+a).addClass('text-info');	 								
 							}else if(item.Grado == null || item.Grado == 'null' || item.Grado == 'NULL'){	 							
 								$('#'+a).addClass('text-warning');
 							}else {	 							
 								$('#'+a).addClass('text-primary');	 	 								
 							} 
 							 $('#'+a).append('Nivel :<strong> '+item.Grado+'</strong>'); 
 							 /* alert(a);
 							 alert(item.Grado); */
 							
						});
							
					});
				}

		function setUsers(){
			checks();
	 	 	var idTeam = $('#idTeam').val() //MatchActiveUsers
	 	 	idTeam = 2; //MCCS TODO: Hardcoded
	 	 	var ticketIdCliente = $('#cboSelectClient').val().toString();
	 	 	var ticketIdGrupoPropietario = document.getElementById("cboSelectGroupOwner").value;
	 	 	var src = "ServletMaximoView";
	 	 	var tribu = $('#cboSelectSquad').val().toString();
	 	 	
	 	//Inicio POST para  listar información en la tabla
	 	 $.post(src, {strAccion : 'SelectOwner',tribu : tribu,ticketIdCliente : ticketIdCliente,
												ticketIdGrupoPropietario : $('#cboSelectGroupOwner').val().toString(),
												ticketEmailPropietario : $('#cboSelectOwner').val().toString(),
												 checkbox : $('#checkSR2').val().toString(),
												  checkbox1 : $('#checkSR').val().toString(),
												  checkbox2 : $('#checkInc').val().toString(),
												  checkbox3 : $('#checkPro').val().toString(),
												  checkbox4 : $('#checkWO').val().toString(),
												  checkbox5 : $('#checkAct').val().toString(),
												  checkbox6 : $('#checkCam').val().toString()}, 
	 					function(pdata) {
	 					  var obj = JSON.parse(pdata);
	 					  console.log(obj)
	 					  $('#tarjeta div').remove();	 					   
				 /* alert(porcentaje); */ 
	  if(obj.CboOwner[0].OwnerId != 'No hay registros' && obj.CboOwner[0].OwnerId != null && obj.CboOwner[0].OwnerId != 'null' && obj.CboOwner[0].OwnerId != 'undefined' ){
		  if(obj.CboOwner.length > 6){$('#izq').removeClass('hidden');$('#der').removeClass('hidden');}else {$('#izq').addClass('hidden');$('#der').addClass('hidden');}
		  /* alert(porcentaje); */
	 						 var vTarjeta = '';
								vTarjeta +='<div class="item active">';	 						
	 						$.each(obj.CboOwner, function (i,item) {//se ejecuta por cada objeto
	 						
				var porc = parseInt((parseInt(item.Totales) / parseInt(porcentaje)) * 100 );	 						
				
	 							
	 							if(i > 0 && i % 6 == 0){
									vTarjeta +='</div><div class="item">';	 							
	 							}
	 		 					var email = "'"+item.OwnerId+"'";
	 		 					
 					vTarjeta +='<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-4" style="border-radius: 50px">'+
 					      '<div class="shadow">'+
 					      '<div class="panel panel-success" style="border-color: #22E63D">'+
 					      '<div class="panel-heading" style="background-color: #22E63D; color: white;">'+
 					      '<div class="panel-title row">'+
 					      '<div class="col-sm-12 col-md-12 col-lg-12 col-xs-12 vcenter" style="font-size: 100%; font-weight: bold;">'+
 					      
 					      '<div class="col-sm-12 col-md-12 col-lg-12 col-xs-12"><tspan>'+item.Dia.replace('NULL','-').replace('null','-')+' : Dia(s) '+' '+item.Horas.replace('NULL','-').replace('null','-')+' : Hora(s) '+' '+item.Minutos.replace('NULL','-').replace('null','-')+' : Minuto(s) '+'</tspan></div>'+
 						  '<div class="col-sm-12 col-md-12 col-lg-12 col-xs-12">Ticket con mayor Tiempo Trancurrido</div>'+
 						  
 					      '</div>'+
 					      '<div class="col-sm-6 col-md-6 col-lg-6 col-xs-6 vcenter text-right" style="font-size: 120%; font-weight: bold;">'+
 					      '</div>'+
 					      '</div>'+
 					      '</div>'+
 					      '<div class="panel-body">'+
 					      '<div class="row">'+
 					      '<div id="cardimg" class="col-sm-3 col-md-3 col-lg-3 col-xs-12" style="padding-left: 5%" align="center">'+
 						  '<img class="img-responsive " src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email='+item.OwnerId+'" style="height:75px">'+
 					      '</div>'+                  
 					      '<div class="col-sm-5 col-md-5 col-lg-5 col-xs-12 ">'+
 					      '<div class="row" align="center">'+
 					      '<div class="col-sm-12 col-md-12 col-lg-12 col-xs-12" style="font-weight: bold; font-size: 100%">'+item.Owner+'</div>'+
 					      '<div class="col-sm-12 col-md-12 col-lg-12 col-xs-12">'+
 					      '</div>'+
 					      '</div>'+
 					      '</div>'+
 					      '<div class="col-sm-4 col-md-4 col-lg-4 col-xs-4 " align="center">'+ 
 					      '<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">'+						    		
 					      '<h5 style="align-content: center"><b></b>'+
 					      '<h3 id="grado'+item.OwnerId.replace('@','').replace('.','').replace('.','').replace('.','').replace('.','')+'"></h3>'+
 					      '</h5>'+     
 					      '</div>'+ 					      
 					      '</div>'+
 					      '</div>'+
 					      '<div class="row">'+
 					      '<div class="col-sm-7 col-md-7 col-lg-7 col-xs-7 ">'+
 					      '<div class="row">'+
 					      '<div class="col-sm-5 col-md-5 col-lg-5 col-xs-12 " align="right">Total:</div>'+
 					      '<div class="col-sm-7 col-md-7 col-lg-7 col-xs-7 vcenter">'+
 					      '<button id="totales" class="btn btn-info" onclick="abrirmodalACUM('+email+')" style="background-color: #00bfa5;border-color: #00bfa5">'+
 					      '<div class="fa fa-calendar"><tspan style="font-family: Arial;font-size :15px;padding-left: 5px">'+item.Totales.replace('NULL','0').replace('null','')+'</tspan>'+'</div>'+
 					      '</button>'+
 					      '</div>'+
 					      '</div>'+
 					      '<div class="row">'+
 					      '<div class="col-sm-5 col-md-5 col-lg-5 col-xs-12 "align="right">Vigentes:</div>'+
 					      '<div class="col-sm-7 col-md-7 col-lg-7 col-xs-7 vcenter">'+
 					      '<button id="vigentes" id=""type="button" onclick="abrirmodalvigentes('+email+')" class="btn btn-primary" style="background-color: #0818F4; border-color: #0818F4">'+
 					      '<div class="fa fa-calendar"><tspan style="font-family: Arial;font-size :15px;padding-left: 5px">'+item.Vigentes.replace('NULL','').replace('null','')+'</tspan></div>'+
 					      '</button>'+
 					      '</div>'+
 					      '</div>'+
 						  '<div class="row">'+
 					      '<div class="col-sm-5 col-md-5 col-lg-5 col-xs-12 ">Vencidos:</div>'+
 					      '<div class="col-sm-7 col-md-7 col-lg-7 col-xs-7 vcenter">'+
 					      '<button id="vencidos" type="button" onclick="abrirmodalvencidos('+email+')" class="btn btn-info" style="background-color: #D8B839; border-color: #D8B839">'+
 					      '<div class="fa fa-calendar"><tspan style="font-family: Arial;font-size :15px;padding-left: 5px">'+item.Vencidos.replace('NULL','0')+'</tspan></div>'+
 					      '</button>'+
 					      '</div>'+
 					      '</div>'+
 					      '</div>'+
 					      '<div class="col-sm-5 col-md-5 col-lg-5 col-xs-12 " align="center">'+  
 					      '<input class="knob" value="'+item.Totales+'" rel="'+porc+'" readonly>'+ 		 					     	 		 					    
 					      '</div>'+
 					      '</div>'+
 					      '</div>'+
 					      '</div>'+
 					      '</div>'+
 					      '</div>';
 					      
		 					 
	 		 					   
	 						});
	 						vTarjeta+='</div>';
	 						$('#iact').remove();
	 						document.getElementById('tarjeta').innerHTML = vTarjeta;
	 						
	 						$('.knob').each(function () {

	 				           var $this = $(this);
	 				           var myVal = $this.attr("rel");
	 				           $this.knob();

	 				           $({
	 				               value: 0
	 				           }).animate({
	 				               value: myVal
	 				           }, {
	 				               duration: 500,
	 				               easing: 'swing',
	 				               step: function () {
	 				                   $this.val(Math.ceil(this.value)).trigger('change');

	 				               }
	 				           })

	 				       });
	 						
	 						$('#tarjeta').removeClass('overlay');
	 	 					$('#tarjeta i').remove();
	 	 					$('#btnShow').prop('disabled',false);
	 	 					OwnerGrade2();
	 	 					
	 	 					
	  }else {
		  $('#btnShow').prop('disabled',false);
		  $('#tarjeta').removeClass('overlay');
		  $('#tarjeta i').remove();
		  $('#tarjeta').append('<div class ="col-sm-12 col-md-12 col-lg-12 col-xs-12"><i class="fa fa-refresh fa-spin" style="font-size:50px;color: black;"></i><h3>No hay Usuarios con los filtros Seleccionados </h3></div>');
		  $('#izq').addClass('hidden');$('#der').addClass('hidden');
	  }	  
	 						
	 					
	 	 	}).done(function(){// hace match con el Assistance 
	 	 		$.post(src, {strAccion:"OwnersTicketsView", idTeam : idTeam, 
		 	 		ticketIdCliente:ticketIdCliente,ticketIdGrupoPropietario:ticketIdGrupoPropietario}, 
		 					function(pdata) {
		 					  var obj = JSON.parse(pdata);
		 					 
	 	 		});
	 					
	 	 	}).done(function(){// hace match con el TicketsView 
	 	 		$.post(src, {strAccion:"OwnersTicketsAssistance", idTeam : idTeam, 
		 	 		ticketIdCliente:ticketIdCliente,ticketIdGrupoPropietario:ticketIdGrupoPropietario}, 
		 					function(pdata) {
		 					  var obj = JSON.parse(pdata);		 							 					  
		 					  		 					  
		 	 	}); 					
	 	 	});
		}
		
		function ModalTicketsAcum(itemEmail)	{
			
			checks();
			$(document).ready(function() {			
				var src = "ServletMaximoView";
				var tribu = $('#cboSelectSquad').val().toString();
				$.post(src, {strAccion : 'ModalAcumuladosTicket', tribu : tribu ,checkbox : $('#checkSR2').val().toString(),
																  checkbox1 : $('#checkSR').val().toString(),
																  checkbox2 : $('#checkInc').val().toString(),
																  checkbox3 : $('#checkPro').val().toString(),
																  checkbox4 : $('#checkWO').val().toString(),
																  checkbox5 : $('#checkAct').val().toString(),
																  checkbox6 : $('#checkCam').val().toString(),
																  idcliente : $('#cboSelectClient').val().toString(),
													   			 idgrupo : $('#cboSelectGroupOwner').val().toString(),
													   			 email : itemEmail.toString()},
			   			function(pdata) {
								var obj = JSON.parse(pdata);
								console.log(obj)
								var dataReporte = [];
								var columnsReporte = [];
								
			if(obj.modalacumuladosticket[0].CodigoTicket != 'No hay registros' && obj.modalacumuladosticket[0].CodigoTicket != null){
								
									for(i = 0; i < obj.modalacumuladosticket.length ; i++){
										var arr = [];
										arr.push(i+1);
										arr.push(obj.modalacumuladosticket[i].CodigoTicket.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].PrioridadInterna.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].Status.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].Source.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].PersonaAfectada.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].IdGrupo.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].Grupo.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].IdPropietario.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].Propietario.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].ParentClient.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].Summary.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].CI.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].CI_Nombre.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].IdClasificacion.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].Clasificacion.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].FechaDeCreacion.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].FechaReporte.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].InicioActual.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].COPR.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].Backlog.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].TimeToResolve.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].AC.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].WORKLOG.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalacumuladosticket[i].ParentTicket.replace('NULL','-').replace('null','-'));
										
										dataReporte.push(arr);							
									}
									
   			}else {  
				var arr = [];
				dataReporte.push(arr);	
			}
									
									
									columnsReporte=[ 
										{title : "NRO"},
										{title : "CodigoTicket"}, 
							            {title : "PrioridadInterna"},
							            {title : "Status"},
							            {title : "Source"},
							            {title : "PersonaAfectada"},
							            {title : "IdGrupo"},
							            {title : "Grupo"},
							            {title : "IdPropietario"},
							            {title : "Propietario"},
							            {title : "ParentClient"},
							            {title : "Summary"},
							            {title : "CI"},
							            {title : "CI_Nombre"},
							            {title : "IdClasificacion"},
							            {title : "Clasificacion"},
							            {title : "FechaDeCreacion"},
							            {title : "FechaReporte"},
							            {title : "InicioActual"},
							            {title : "COPR"},
							            {title : "Backlog"},
							            {title : "TimeToResolve"},
							            {title : "AC"},
							            {title : "WORKLOG"},
							            {title : "Parent Ticket"}
							            
							            
							       ];
																		
									setDataTicketAcum(dataReporte, columnsReporte);
									$('#tbcontainerTicketAcumulados i').remove();
									$('#tbcontainerTicketAcumulados').removeClass('overlay');
									
									/* $('#btnInfoAcum').prop('disabled',false); */
							});
			});
		}
		
		var htmlTableacum = '<table id=\"tblReporteAcum\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';


		/* SETDATA PARA EL TICKET ACUMULADOS */
		
		function setDataTicketAcum(pdataReporte, pcolumnsReporte){	
			
 			document.getElementById('tbcontainerTicketAcumulados').innerHTML = htmlTableacum;	
			
			if(typeof tableReporte === 'undefined'){
		    
			var tableReporte = $('#tblReporteAcum').DataTable(
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
		
		function ModalTicketsSinA()	{
			checks();
			$(document).ready(function() {			
				var src = "ServletMaximoView";	
				var tribu = $('#cboSelectSquad').val().toString();
				$.post(src, {strAccion : 'ModalSinAsignarTicket',tribu:tribu,checkbox : $('#checkSR2').val().toString(),
																  checkbox1 : $('#checkSR').val().toString(),
																  checkbox2 : $('#checkInc').val().toString(),
																  checkbox3 : $('#checkPro').val().toString(),
																  checkbox4 : $('#checkWO').val().toString(),
																  checkbox5 : $('#checkAct').val().toString(),
																  checkbox6 : $('#checkCam').val().toString(),
																 idcliente : $('#cboSelectClient').val().toString(),
													   			 idgrupo : $('#cboSelectGroupOwner').val().toString()},
			   			function(pdata) {
								var obj = JSON.parse(pdata);
								console.log(obj)
								var dataReporte = [];
								var columnsReporte = [];
								
		if(obj.modalsinasignarticket[0].CodigoTicket != 'No hay registros' && obj.modalsinasignarticket[0].CodigoTicket != null){
								
									for(i = 0; i < obj.modalsinasignarticket.length ; i++){
										var arr = [];
										arr.push(i+1);
										arr.push(obj.modalsinasignarticket[i].CodigoTicket.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].PrioridadInterna.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].Status.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].Source.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].PersonaAfectada.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].IdGrupo.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].Grupo.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].IdPropietario.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].Propietario.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].ParentClient.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].Summary.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].CI.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].CI_Nombre.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].IdClasificacion.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].Clasificacion.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].FechaDeCreacion.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].FechaReporte.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].InicioActual.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].COPR.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].Backlog.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].TimeToResolve.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].AC.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].WORKLOG.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalsinasignarticket[i].ParentTicket.replace('NULL','-').replace('null','-'));
										dataReporte.push(arr);							
									}
									
		}else {  
			var arr = [];
			dataReporte.push(arr);	
		}
									
									
									columnsReporte=[
										{title : "NRO"},
										{title : "CodigoTicket"}, 
							            {title : "PrioridadInterna"},
							            {title : "Status"},
							            {title : "Source"},
							            {title : "PersonaAfectada"},
							            {title : "IdGrupo"},
							            {title : "Grupo"},
							            {title : "IdPropietario"},
							            {title : "Propietario"},
							            {title : "ParentClient"},
							            {title : "Summary"},
							            {title : "CI"},
							            {title : "CI_Nombre"},
							            {title : "IdClasificacion"},
							            {title : "Clasificacion"},
							            {title : "FechaDeCreacion"},
							            {title : "FechaReporte"},
							            {title : "InicioActual"},
							            {title : "COPR"},
							            {title : "Backlog"},
							            {title : "TimeToResolve"},
							            {title : "AC"},
							            {title : "WORKLOG"},
							            {title : "Parent Ticket"}
							            
									];
									
									setDataTicketSinA(dataReporte, columnsReporte);
									$('#tbcontainerTicketAcumulados i').remove();
									$('#tbcontainerTicketAcumulados').removeClass('overlay');
									/* $('#btnInfoSin').prop('disabled',false); */
							});
			});
		}
	
		
		var htmlTablesinasig = '<table id=\"tableReporteTicketSinAsignar\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';


		/* SETDATA PARA EL TICKET ACUMULADOS */
		
		function setDataTicketSinA(pdataReporte, pcolumnsReporte){	
			
			document.getElementById('tbcontainerTicketAcumulados').innerHTML = htmlTablesinasig;	
			
			if(typeof tableReporte === 'undefined'){
		    
			var tableReporte = $('#tableReporteTicketSinAsignar').DataTable(
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
		
		
		
		function ModalTicketsPrio()	{
			checks();
			$(document).ready(function() {			
				var src = "ServletMaximoView";	
				var tribu = $('#cboSelectSquad').val().toString();
				$.post(src, {strAccion : 'ModalPrioridadTicket',tribu : tribu ,checkbox : $('#checkSR2').val().toString(),
																  checkbox1 : $('#checkSR').val().toString(),
																  checkbox2 : $('#checkInc').val().toString(),
																  checkbox3 : $('#checkPro').val().toString(),
																  checkbox4 : $('#checkWO').val().toString(),
																  checkbox5 : $('#checkAct').val().toString(),
																  checkbox6 : $('#checkCam').val().toString(),
																idcliente : $('#cboSelectClient').val().toString(),
													   			 idgrupo : $('#cboSelectGroupOwner').val().toString()},
				   			function(pdata) {
									var obj = JSON.parse(pdata);
									console.log(obj)
									var dataReporte = [];
									var columnsReporte = [];
									
			if(obj.modalprioridadticket[0].CodigoTicket != 'No hay registros' && obj.modalprioridadticket[0].CodigoTicket != null){
									
										for(i = 0; i < obj.modalprioridadticket.length ; i++){
											var arr = [];
											arr.push(i+1);
											arr.push(obj.modalprioridadticket[i].CodigoTicket.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].PrioridadInterna.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].Status.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].Source.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].PersonaAfectada.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].IdGrupo.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].Grupo.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].IdPropietario.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].Propietario.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].ParentClient.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].Summary.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].CI.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].CI_Nombre.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].IdClasificacion.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].Clasificacion.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].FechaDeCreacion.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].FechaReporte.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].InicioActual.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].COPR.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].Backlog.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].TimeToResolve.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].AC.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].WORKLOG.replace('NULL','-').replace('null','-'));
											arr.push(obj.modalprioridadticket[i].ParentTicket.replace('NULL','-').replace('null','-'));
											dataReporte.push(arr);							
										}
										
			}else {  
				var arr = [];
				dataReporte.push(arr);	
			}
										
										
										columnsReporte=[
											{title : "NRO"},
											{title : "CodigoTicket"}, 
								            {title : "PrioridadInterna"},
								            {title : "Status"},
								            {title : "Source"},
								            {title : "PersonaAfectada"},
								            {title : "IdGrupo"},
								            {title : "Grupo"},
								            {title : "IdPropietario"},
								            {title : "Propietario"},
								            {title : "ParentClient"},
								            {title : "Summary"},
								            {title : "CI"},
								            {title : "CI_Nombre"},
								            {title : "IdClasificacion"},
								            {title : "Clasificacion"},
								            {title : "FechaDeCreacion"},
								            {title : "FechaReporte"},
								            {title : "InicioActual"},
								            {title : "COPR"},
								            {title : "Backlog"},
								            {title : "TimeToResolve"},
								            {title : "AC"},
								            {title : "WORKLOG"},
								            {title : "Parent Ticket"},
								            
								            
								           
								            
										];
										
										setDataTicketPrio(dataReporte, columnsReporte);
										$('#tbcontainerTicketAcumulados i').remove();
										$('#tbcontainerTicketAcumulados').removeClass('overlay');
										/* $('#btnInfoPrio').prop('disabled',false); */
								});
			});
		}
		
		var htmlTablePrioridad = '<table id=\"tblReportePrioridad\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
		
		function setDataTicketPrio(pdataReporte, pcolumnsReporte){	
			
			document.getElementById('tbcontainerTicketAcumulados').innerHTML = htmlTablePrioridad;	
			
			if(typeof tableReporte === 'undefined'){
		    
			var tableReporte = $('#tblReportePrioridad').DataTable(
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
		
		
			function ModalVigentes(itemEmail)	{
			checks();
			$(document).ready(function() {			
				var src = "ServletMaximoView";	
				var tribu = $('#cboSelectSquad').val().toString();
				$.post(src, {strAccion : 'ModalVigentes',tribu : tribu,checkbox : $('#checkSR2').val().toString(),
														  checkbox1 : $('#checkSR').val().toString(),
														  checkbox2 : $('#checkInc').val().toString(),
														  checkbox3 : $('#checkPro').val().toString(),
														  checkbox4 : $('#checkWO').val().toString(),
														  checkbox5 : $('#checkAct').val().toString(),
														  checkbox6 : $('#checkCam').val().toString(),
														  idcliente : $('#cboSelectClient').val().toString(),
													   			 idgrupo : $('#cboSelectGroupOwner').val().toString(),
													   			 email : itemEmail.toString()},
			   			function(pdata) {
								var obj = JSON.parse(pdata);
								console.log(obj)
								var dataReporte = [];
								var columnsReporte = [];
								
				if(obj.modalvigentesticket[0].CodigoTicket != 'No hay registros' && obj.modalvigentesticket[0].CodigoTicket != null){
								
									for(i = 0; i < obj.modalvigentesticket.length ; i++){
										var arr = [];
										arr.push(i+1);
										arr.push(obj.modalvigentesticket[i].CodigoTicket.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].PrioridadInterna.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].Status.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].Source.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].PersonaAfectada.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].IdGrupo.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].Grupo.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].IdPropietario.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].Propietario.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].ParentClient.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].Summary.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].CI.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].CI_Nombre.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].IdClasificacion.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].Clasificacion.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].FechaDeCreacion.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].FechaReporte.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].InicioActual.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].COPR.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].Backlog.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].TimeToResolve.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].AC.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvigentesticket[i].WORKLOG.replace('NULL','-').replace('null','-'));
										 arr.push(obj.modalvigentesticket[i].ParentTicket.replace('NULL','-').replace('null','-'));
										dataReporte.push(arr);							
									}	
									
				}else {  
					var arr = [];
					dataReporte.push(arr);	
				}
									
									columnsReporte=[
										{title : "NRO"},
										{title : "CodigoTicket"}, 
							            {title : "PrioridadInterna"},
							            {title : "Status"},
							            {title : "Source"},
							            {title : "PersonaAfectada"},
							            {title : "IdGrupo"},
							            {title : "Grupo"},
							            {title : "IdPropietario"},
							            {title : "Propietario"},
							            {title : "ParentClient"},
							            {title : "Summary"},
							            {title : "CI"},
							            {title : "CI_Nombre"},
							            {title : "IdClasificacion"},
							            {title : "Clasificacion"},
							            {title : "FechaDeCreacion"},
							            {title : "FechaReporte"},
							            {title : "InicioActual"},
							            {title : "COPR"},
							            {title : "Backlog"},
							            {title : "TimeToResolve"},
							            {title : "AC"},
							            {title : "WORKLOG"},
							            {title : "Parent Ticket"}
							            
							            
							           
									];
																		
									setDataTicketVigentes(dataReporte, columnsReporte);
									$('#tbcontainerTicketAcumulados i').remove();
									$('#tbcontainerTicketAcumulados').removeClass('overlay');
									
									/* $('#btnInfoAcum').prop('disabled',false); */
			   					
									
									
							});
			});
		}
		
		var htmlTablevigentes = '<table id=\"tblReporteVigentes\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';


		/* SETDATA PARA EL TICKET ACUMULADOS */
		
		function setDataTicketVigentes(pdataReporte, pcolumnsReporte){	
			
 			document.getElementById('tbcontainerTicketAcumulados').innerHTML = htmlTablevigentes;	
			
			if(typeof tableReporte === 'undefined'){
		    
			var tableReporte = $('#tblReporteVigentes').DataTable(
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
		
		
			 function ModalVencidos(itemEmail)	{
			
			$(document).ready(function() {			
				var src = "ServletMaximoView";
				var tribu = $('#cboSelectSquad').val().toString();
				$.post(src, {strAccion : 'ModalVencidos',tribu : tribu,checkbox : $('#checkSR2').val().toString(),
														  checkbox1 : $('#checkSR').val().toString(),
														  checkbox2 : $('#checkInc').val().toString(),
														  checkbox3 : $('#checkPro').val().toString(),
														  checkbox4 : $('#checkWO').val().toString(),
														  checkbox5 : $('#checkAct').val().toString(),
														  checkbox6 : $('#checkCam').val().toString(),
														  idcliente : $('#cboSelectClient').val().toString(),
													   			 idgrupo : $('#cboSelectGroupOwner').val().toString(),
													   			 email : itemEmail.toString()},
			   			function(pdata) {
								var obj = JSON.parse(pdata);
								console.log(obj)
								var dataReporte = [];
								var columnsReporte = [];
								
			if(obj.modalvencidosticket[0].CodigoTicket != 'No hay registros' && obj.modalvencidosticket[0].CodigoTicket != null){
				
			
									for(i = 0; i < obj.modalvencidosticket.length ; i++){
										var arr = [];
										arr.push(i+1);
										arr.push(obj.modalvencidosticket[i].CodigoTicket.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].PrioridadInterna.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].Status.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].Source.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].PersonaAfectada.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].IdGrupo.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].Grupo.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].IdPropietario.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].Propietario.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].ParentClient.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].Summary.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].CI.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].CI_Nombre.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].IdClasificacion.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].Clasificacion.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].FechaDeCreacion.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].FechaReporte.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].InicioActual.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].COPR.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].Backlog.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].TimeToResolve.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].AC.replace('NULL','-').replace('null','-'));
										arr.push(obj.modalvencidosticket[i].WORKLOG.replace('NULL','-').replace('null','-'));
										 arr.push(obj.modalvencidosticket[i].ParentTicket.replace('NULL','-').replace('null','-'));
										dataReporte.push(arr);							
									}
									
	   			}else {  
					var arr = [];					
					dataReporte.push(arr);	
				}
									
									columnsReporte=[
										{title : "NRO"},
										{title : "CodigoTicket"}, 
							            {title : "PrioridadInterna"},
							            {title : "Status"},
							            {title : "Source"},
							            {title : "PersonaAfectada"},
							            {title : "IdGrupo"},
							            {title : "Grupo"},
							            {title : "IdPropietario"},
							            {title : "Propietario"},
							            {title : "ParentClient"},
							            {title : "Summary"},
							            {title : "CI"},
							            {title : "CI_Nombre"},
							            {title : "IdClasificacion"},
							            {title : "Clasificacion"},
							            {title : "FechaDeCreacion"},
							            {title : "FechaReporte"},
							            {title : "InicioActual"},
							            {title : "COPR"},
							            {title : "Backlog"},
							            {title : "TimeToResolve"},
							            {title : "AC"},
							            {title : "WORKLOG"},
							            {title : "Parent Ticket"}
							            
									];
																		
									setDataTicketVencidos(dataReporte, columnsReporte);
									$('#tbcontainerTicketAcumulados i').remove();
									$('#tbcontainerTicketAcumulados').removeClass('overlay');
									
									
							});
			});
		}
		
		var htmlTablevencidos = '<table id=\"tblReporteVencidos\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';


		
		
		function setDataTicketVencidos(pdataReporte, pcolumnsReporte){	
			
 			document.getElementById('tbcontainerTicketAcumulados').innerHTML = htmlTablevencidos;	
			
			if(typeof tableReporte === 'undefined'){
		    
			var tableReporte = $('#tblReporteVencidos').DataTable(
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

			function abrirmodal(){
			
			$('#mdListaUsuarios').modal('show');			
			}
		
			function abrirmodalACUM(ValuePropietario){
				
			 var vp = ValuePropietario;
			
			$('#mdListaAcumulados').modal('show');
			$('#TituloModal tspan').remove();
			$('#TituloModal').append('<tspan>Descripcion Tickets Acumulados</tspan>');
			$('#tbcontainerTicketAcumulados i').remove();
			$('#tbcontainerTicketAcumulados div').remove();
			$('#tbcontainerTicketAcumulados').append('<i class="fa fa-refresh fa-spin" style="font-size:50px;color: black;"></i>');
			$('#tbcontainerTicketAcumulados').addClass('overlay');
			$('#tbcontainerTicketAcumulados table').remove();
		    ModalTicketsAcum(vp);		
			  
			}
			
			
			function abrirmodalvigentes(ValuePropietario){
				
				 var vp = ValuePropietario;
				
				$('#mdListaAcumulados').modal('show');
				$('#TituloModal tspan').remove();
				$('#TituloModal').append('<tspan>Descripcion Tickets Vigentes</tspan>');
				$('#tbcontainerTicketAcumulados i').remove();
				$('#tbcontainerTicketAcumulados div').remove();
				$('#tbcontainerTicketAcumulados').append('<i class="fa fa-refresh fa-spin" style="font-size:50px;color: black;"></i>');
				$('#tbcontainerTicketAcumulados').addClass('overlay');
				$('#tbcontainerTicketAcumulados table').remove();
				ModalVigentes(vp);		
				  
				}
			
			
			function abrirmodalvencidos(ValuePropietario){
				
				 var vp = ValuePropietario;
				
				$('#mdListaAcumulados').modal('show');
				$('#TituloModal tspan').remove();
				$('#TituloModal').append('<tspan>Descripcion Tickets Vencidos</tspan>');
				$('#tbcontainerTicketAcumulados i').remove();
				$('#tbcontainerTicketAcumulados div').remove();
				$('#tbcontainerTicketAcumulados').append('<i class="fa fa-refresh fa-spin" style="font-size:50px;color: black;"></i>');
				$('#tbcontainerTicketAcumulados').addClass('overlay');
				$('#tbcontainerTicketAcumulados table').remove();
				ModalVencidos(vp);		
				  
				}
		
			function abrirmodalSIN(){
			
			$('#mdListaAcumulados').modal('show');
			$('#TituloModal tspan').remove();
			$('#TituloModal').append('<tspan>Descripcion Tickets Sin Asignar</tspan>');
			$('#tbcontainerTicketAcumulados i').remove();
			$('#tbcontainerTicketAcumulados div').remove();
			$('#tbcontainerTicketAcumulados').append('<i class="fa fa-refresh fa-spin" style="font-size:50px;color: black;"></i>');
			$('#tbcontainerTicketAcumulados').addClass('overlay');
			$('#tbcontainerTicketAcumulados table').remove();
			ModalTicketsSinA();
			}
			
			function abrirmodalPRIO(){
				
			$('#mdListaAcumulados').modal('show');
			$('#TituloModal tspan').remove();
			$('#TituloModal').append('<tspan>Descripcion Tickets Prioridad 1 & 2</tspan>');
			$('#tbcontainerTicketAcumulados i').remove();
			$('#tbcontainerTicketAcumulados div').remove();
			$('#tbcontainerTicketAcumulados').append('<i class="fa fa-refresh fa-spin" style="font-size:50px;color: black;"></i>');
			$('#tbcontainerTicketAcumulados').addClass('overlay');
			$('#tbcontainerTicketAcumulados table').remove();
			ModalTicketsPrio();
			}
	
		
			
		
			function openCity(evt, cityName) {
				  var i, x, tablinks;
				  x = document.getElementsByClassName("city");
				  for (i = 0; i < x.length; i++) {
				    x[i].style.display = "none";
				  }
				  tablinks = document.getElementsByClassName("tablink");
				  for (i = 0; i < x.length; i++) {
				    tablinks[i].className = tablinks[i].className.replace(" w3-border-blue", "");
				  }
				  document.getElementById(cityName).style.display = "block";
				  evt.currentTarget.firstElementChild.className += " w3-border-blue";
				}
			
			
			function Tabla1()	{
				//Activar barra de progreso
				$('#tabla1container i').remove();
				$('#tabla1container').append('<i class="fa fa-refresh fa-spin" style="font-size:50px;color: black;"></i>');
				$('#tabla1container').addClass('overlay');
				
				$('#tabla2container i').remove();
				$('#tabla2container').append('<i class="fa fa-refresh fa-spin" style="font-size:50px;color: black;"></i>');
				$('#tabla2container').addClass('overlay');
				
				$('#tabla3container i').remove();
				$('#tabla3container').append('<i class="fa fa-refresh fa-spin" style="font-size:50px;color: black;"></i>');
				$('#tabla3container').addClass('overlay');
				
				checks();// setea los valores de los filtros
				
				$(document).ready(function() {			
					
					var idcliente = $('#cboSelectClient').val().toString();
					var src = "ServletMaximoView";			
					
					$.post(src, {strAccion : 'Tabla1',checkbox : $('#checkSR2').val().toString(),
													  checkbox1 : $('#checkSR').val().toString(),
													  checkbox2 : $('#checkInc').val().toString(),
													  checkbox3 : $('#checkPro').val().toString(),
													  checkbox4 : $('#checkWO').val().toString(),
													  checkbox5 : $('#checkAct').val().toString(),
													  checkbox6 : $('#checkCam').val().toString(),
													  idcliente : idcliente},
					   			function(pdata) {
										var obj = JSON.parse(pdata);
										var dataReporteTbl1 = [];
										var columnsReporteTbl1 = [];
										
										var dataReporteTbl2 = [];
										var columnsReporteTbl2 = [];
										
										var dataReporteTbl3 = [];
										var columnsReporteTbl3= [];
										
										if(obj.tabla1[0].CodigoTicket != 'No hay registros' && obj.tabla1[0].CodigoTicket != null){
											  
											for(i = 0; i < obj.tabla1.length ; i++){
												var sla = 0 ;
												var strsla = "";
												var estadosla = 0; // 1 Dentro, 2 Por exceder, 3 Excedido
												if(obj.tabla1[i].ProcesamientoTRespuesta == "EN PROGRESO"){
													if(obj.tabla1[i].CodigoTicket.startsWith("IN")){//Es incidente
													
														if(obj.tabla1[i].OwnerGroup.indexOf("SOPORTE ONSITE PROVINCIA") > -1){ //
															console.log(obj.tabla1[i].OwnerGroup);
															if(obj.tabla1[i].InternalPriority.indexOf("2")  > -1){
																sla = 4; strsla = "04:00:00";	
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoRespuesta, 10) / sla )* 100 ;
																if(valor1 > 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 1;	}
																
															}
															if(obj.tabla1[i].InternalPriority.indexOf("3")  > -1){
																sla = 4;  strsla = "04:00:00";	
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoRespuesta, 10) / sla )* 100 ;
																if(valor1 > 100  && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 1;	}
															}
															if(obj.tabla1[i].InternalPriority.indexOf("4")  > -1){
																sla = 4;  strsla = "04:00:00";	
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoRespuesta, 10) / sla )* 100 ;
																if(valor1 > 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49){estadosla = 1;	}
															}
														}else if(obj.tabla1[i].OwnerGroup.indexOf("SOPORTE ONSITE NO RESIDENTE")  > -1){
															console.log(obj.tabla1[i].OwnerGroup);
															if(obj.tabla1[i].InternalPriority.indexOf("2") > -1 ){
																sla = 2; strsla = "02:00:00";
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoRespuesta, 10) / sla )* 100 ;
																if(valor1 > 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 1;	}
															}
															if(obj.tabla1[i].InternalPriority.indexOf("3")  > -1){
																sla = 4; strsla = "04:00:00";	
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoRespuesta, 10) / sla )* 100 ;
																if(valor1 > 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 1;	}
															}
															if(obj.tabla1[i].InternalPriority.indexOf("4")  > -1){
																sla = 6; strsla = "06:00:00";
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoRespuesta, 10) / sla )* 100 ;
																if(valor1 > 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 1;	}
															}
														}else if(obj.tabla1[i].OwnerGroup.indexOf("SOPORTE ONSITE RESIDENTE")  > -1){
															console.log(obj.tabla1[i].OwnerGroup);
															if(obj.tabla1[i].InternalPriority.indexOf("2")  > -1){
																sla = 0.5; strsla = "00:30:00";
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoRespuesta, 10) / sla )* 100 ;
																if(valor1 > 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 1;	}
															}
															if(obj.tabla1[i].InternalPriority.indexOf("3")  > -1){
																sla = 2; strsla = "02:00:00";
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoRespuesta, 10) / sla )* 100 ;
																if(valor1 > 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 1;	}
															}
															if(obj.tabla1[i].InternalPriority.indexOf("4") > -1 ){
																sla = 4; strsla = "04:00:00";	
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoRespuesta, 10) / sla )* 100 ;
																if(valor1 > 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49 && obj.tabla1[i].ResultadoTiempoRespuesta != "-1.0"){estadosla = 1;	}
															}
														}
														
													}
													
													var arr = [];
													arr.push(obj.tabla1[i].CodigoTicket.replace('NULL','-').replace('null','-'));
	 												arr.push(obj.tabla1[i].Summary.replace('NULL','-').replace('null','-'));
													arr.push(obj.tabla1[i].CreationDate.replace('NULL','-').replace('null','-'));											
													arr.push(obj.tabla1[i].OwnerGroup.replace('NULL','-').replace('null','-'));
	 												arr.push(obj.tabla1[i].InternalPriority.replace('NULL','-').replace('null','-'));
	 												arr.push(obj.tabla1[i].Owner.replace('NULL','-').replace('null','-'));
	 												arr.push(obj.tabla1[i].Worklog.replace('NULL','-').replace('null','-'));
													arr.push(obj.tabla1[i].Status.replace('NULL','-').replace('null','-'));
													arr.push(sla);
													arr.push(strsla);
													arr.push(obj.tabla1[i].strTiempoRespuesta.replace('NULL','-').replace('null','-'));
													arr.push(obj.tabla1[i].ResultadoTiempoRespuesta.replace('NULL','-').replace('null','-'));
													arr.push(obj.tabla1[i].ProcesamientoTRespuesta.replace('NULL','-').replace('null','-'));
													arr.push(estadosla);
													dataReporteTbl1.push(arr);	
													
													
												}else if (obj.tabla1[i].ProcesamientoTRespuesta == "FINALIZADO" && obj.tabla1[i].ProcesamientoTSolucion != "NO APLICA"){
													
													if(obj.tabla1[i].CodigoTicket.startsWith("IN")){//Es incidente
														
														if(obj.tabla1[i].OwnerGroup.indexOf("SOPORTE ONSITE PROVINCIA") > -1){ //
															console.log(obj.tabla1[i].OwnerGroup);
															if(obj.tabla1[i].InternalPriority.indexOf("2")  > -1){
																sla = 8; strsla = "08:00:00";	
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoSolucion, 10) / sla )* 100 ;
																if(valor1 > 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 1;	}
																
															}
															if(obj.tabla1[i].InternalPriority.indexOf("3")  > -1){
																sla = 8;  strsla = "08:00:00";	
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoSolucion, 10) / sla )* 100 ;
																if(valor1 > 100  && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 1;	}
															}
															if(obj.tabla1[i].InternalPriority.indexOf("4")  > -1){
																sla = 8;  strsla = "08:00:00";	
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoSolucion, 10) / sla )* 100 ;
																if(valor1 > 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49){estadosla = 1;	}
															}
														}else if(obj.tabla1[i].OwnerGroup.indexOf("SOPORTE ONSITE NO RESIDENTE")  > -1){
															console.log(obj.tabla1[i].OwnerGroup);
															if(obj.tabla1[i].InternalPriority.indexOf("2") > -1 ){
																sla = 3; strsla = "03:00:00";
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoSolucion, 10) / sla )* 100 ;
																if(valor1 > 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 1;	}
															}
															if(obj.tabla1[i].InternalPriority.indexOf("3")  > -1){
																sla = 8; strsla = "08:00:00";	
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoSolucion, 10) / sla )* 100 ;
																if(valor1 > 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 1;	}
															}
															if(obj.tabla1[i].InternalPriority.indexOf("4")  > -1){
																sla = 14; strsla = "14:00:00";
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoSolucion, 10) / sla )* 100 ;
																if(valor1 > 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 1;	}
															}
														}else if(obj.tabla1[i].OwnerGroup.indexOf("SOPORTE ONSITE RESIDENTE")  > -1){
															console.log(obj.tabla1[i].OwnerGroup);
															if(obj.tabla1[i].InternalPriority.indexOf("2")  > -1){
																sla = 1; strsla = "01:00:00";
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoSolucion, 10) / sla )* 100 ;
																if(valor1 > 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 1;	}
															}
															if(obj.tabla1[i].InternalPriority.indexOf("3")  > -1){
																sla = 4; strsla = "04:00:00";
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoSolucion, 10) / sla )* 100 ;
																if(valor1 > 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 1;	}
															}
															if(obj.tabla1[i].InternalPriority.indexOf("4") > -1 ){
																sla = 8; strsla = "08:00:00";	
																var valor1 = (parseInt(obj.tabla1[i].ResultadoTiempoSolucion, 10) / sla )* 100 ;
																if(valor1 > 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 3;	}
																if(valor1 > 49 && valor1 <= 100 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 2;	}
																if(valor1 <= 49 && obj.tabla1[i].ResultadoTiempoSolucion != "-1.0"){estadosla = 1;	}
															}
														}
														
													}
													
													var arr = [];
													arr.push(obj.tabla1[i].CodigoTicket.replace('NULL','-').replace('null','-'));
	 												arr.push(obj.tabla1[i].Summary.replace('NULL','-').replace('null','-'));
													arr.push(obj.tabla1[i].CreationDate.replace('NULL','-').replace('null','-'));											
													arr.push(obj.tabla1[i].OwnerGroup.replace('NULL','-').replace('null','-'));
	 												arr.push(obj.tabla1[i].InternalPriority.replace('NULL','-').replace('null','-'));
	 												arr.push(obj.tabla1[i].Owner.replace('NULL','-').replace('null','-'));
	 												arr.push(obj.tabla1[i].Worklog.replace('NULL','-').replace('null','-'));
													arr.push(obj.tabla1[i].Status.replace('NULL','-').replace('null','-'));
													arr.push(sla);
													arr.push(strsla);
													arr.push(obj.tabla1[i].strTiempoRespuesta.replace('NULL','-').replace('null','-'));
													arr.push(obj.tabla1[i].ResultadoTiempoRespuesta.replace('NULL','-').replace('null','-'));
													arr.push(obj.tabla1[i].ProcesamientoTRespuesta.replace('NULL','-').replace('null','-'));
													arr.push(obj.tabla1[i].ResultadoTiempoSolucion.replace('NULL','-').replace('null','-'));
													arr.push(obj.tabla1[i].strTiempoSolucion.replace('NULL','-').replace('null','-'));
													arr.push(obj.tabla1[i].ProcesamientoTSolucion.replace('NULL','-').replace('null','-'));
													arr.push(estadosla);
													dataReporteTbl2.push(arr);		
													
													
												}else{
													var arr = [];
													arr.push(obj.tabla1[i].CodigoTicket.replace('NULL','-').replace('null','-'));
	 												arr.push(obj.tabla1[i].Summary.replace('NULL','-').replace('null','-'));
													arr.push(obj.tabla1[i].CreationDate.replace('NULL','-').replace('null','-'));											
													arr.push(obj.tabla1[i].OwnerGroup.replace('NULL','-').replace('null','-'));
	 												arr.push(obj.tabla1[i].InternalPriority.replace('NULL','-').replace('null','-'));
	 												arr.push(obj.tabla1[i].Owner.replace('NULL','-').replace('null','-'));
	 												arr.push(obj.tabla1[i].Worklog.replace('NULL','-').replace('null','-'));
	 												arr.push(obj.tabla1[i].Status.replace('NULL','-').replace('null','-'));
													dataReporteTbl3.push(arr);
												}
																		
											}
											
											
											columnsReporteTbl1=[
												{title : "CodigoTicket"}, 
									            {title : "Summary"},
									            {title : "CreationDate"},
									            {title : "OwnerGroup"},
									            {title : "InternalPriority"},
									            {title : "Owner"}
									            ,{title : "WorkLog"}
									            ,{title : "Status"}
									            ,{title : "sla"}
									            ,{title : "SLA"}
									            ,{title : "Tiempo Respuesta"}
									            ,{title : "T. Respuesta"}
												,{title : "Procesamiento"}
												,{title : "estado SLA"}
											];
											
											columnsReporteTbl2=[
												{title : "CodigoTicket"}, 
									            {title : "Summary"},
									            {title : "CreationDate"},
									            {title : "OwnerGroup"},
									            {title : "InternalPriority"},
									            {title : "Owner"}
									            ,{title : "WorkLog"}
									            ,{title : "Status"}
									            ,{title : "sla"}
									            ,{title : "SLA"}
									            ,{title : "Tiempo Respuesta"}
									            ,{title : "T. Respuesta"}
												,{title : "Procesamiento"}
												,{title : "T. Solucion"}
									            ,{title : "Tiempo Solucion"}
									            ,{title : "Procesamiento"}
									            ,{title : "estado SLA"}
											];
											
											columnsReporteTbl3=[
												{title : "CodigoTicket"}, 
									            {title : "Summary"},
									            {title : "CreationDate"},
									            {title : "OwnerGroup"},
									            {title : "InternalPriority"},
									            {title : "Owner"},
									            {title : "WorkLog"},
									            {title : "Status"}
											];
											
											setDataTabla1(dataReporteTbl1, columnsReporteTbl1);
											setDataTabla2(dataReporteTbl2, columnsReporteTbl2);
											setDataTabla3(dataReporteTbl3, columnsReporteTbl3);
											//Ocultar barra de progreso
											$('#tabla1container i').remove();
											$('#tabla1container').removeClass('overlay');
											$('#tabla2container i').remove();
											$('#tabla2container').removeClass('overlay');
											$('#tabla3container i').remove();
											$('#tabla3container').removeClass('overlay');
										
				}else {  
					var arr = [];					
					dataReporteTbl1.push(arr);
					columnsReporteTbl1=[
						{title : "Sin Datos"}
						
					];
					dataReporteTbl2.push(arr);
					columnsReporteTbl2=[
						{title : "Sin Datos"}
						
					];
					
					dataReporteTbl3.push(arr);
					columnsReporteTbl3=[
						{title : "Sin Datos"}
						
					];
					setDataTabla1(dataReporteTbl1, columnsReporteTbl1);
					setDataTabla2(dataReporteTbl2, columnsReporteTbl2);
					setDataTabla3(dataReporteTbl3, columnsReporteTbl3);
					$('#tabla1container i').remove();
					$('#tabla1container').removeClass('overlay');
				}
				
				
				
									});
				});
			}
			
			var htmlTableTabla1 = '<table id=\"tblReporteTabla1\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
			
			function setDataTabla1(pdataReporte, pcolumnsReporte){	
				
				document.getElementById('tabla1container').innerHTML = htmlTableTabla1;	
				
				if(typeof tableReporte === 'undefined'){
			    
				var tableReporte = $('#tblReporteTabla1').DataTable(
						{
							processing : false,
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
							serverSide : false,
							order: [[ 11, "desc" ]],
							data: pdataReporte,
							columns: pcolumnsReporte,
							// Verde: #90EE90
							// Rojo: #E60026
							// Naranja: #E65F00
							// Azul: #ADD8E6

							rowCallback:function(row,data){
								if(data[13] == 1){ //verde
									$($(row).find("td")[9]).css("background-color","#008000");
									$($(row).find("td")[9]).css("color","#ffffff ");
									$($(row).find("td")[9]).css("font-weight","bold ");
								}
								else if(data[13] == 2){ //amarrillo
									$($(row).find("td")[9]).css("background-color","#ffd700");
									$($(row).find("td")[9]).css("font-weight","bold ");
								}
								else if(data[13] == 3){ //rojo
									$($(row).find("td")[9]).css("background-color","#c51d34");
									$($(row).find("td")[9]).css("color","#ffffff ");
									$($(row).find("td")[9]).css("font-weight","bold ");
									
								}
							},
							columnDefs: [
								{ "className": "text-center", "targets": [4] },
								{"targets": 8 ,"visible": false, "searchable": false},
         	                	{"targets": 11 ,"visible": false, "searchable": false}
								,{"targets": 12 ,"visible": false, "searchable": false}
         	                	,{"targets": 13 ,"visible": false, "searchable": false}
           				    ],
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
										columns: [0,1,2,3,4,5,6,7,8,9,15,16]
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
			
			
			var htmlTableTabla2 = '<table id=\"tblReporteTabla2\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
			
			function setDataTabla2(pdataReporte, pcolumnsReporte){	
				
				document.getElementById('tabla2container').innerHTML = htmlTableTabla2;	
				
				if(typeof tableReporte === 'undefined'){
			    
				var tableReporte = $('#tblReporteTabla2').DataTable(
						{
							processing : false,
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
							rowCallback:function(row,data){
								if(data[16] == 1){ //verde
									$($(row).find("td")[10]).css("background-color","#008000");
									$($(row).find("td")[10]).css("color","#ffffff ");
									$($(row).find("td")[10]).css("font-weight","bold ");
								}
								else if(data[16] == 2){ //amarrillo
									$($(row).find("td")[10]).css("background-color","#ffd700");
									$($(row).find("td")[10]).css("font-weight","bold ");
								}
								else if(data[16] == 3){ //rojo
									$($(row).find("td")[10]).css("background-color","#c51d34");
									$($(row).find("td")[10]).css("color","#ffffff ");
									$($(row).find("td")[10]).css("font-weight","bold ");
									
								}
							},
							serverSide : false,
							order: [[ 13, "desc" ]],
							data: pdataReporte,
							columns: pcolumnsReporte,
							columnDefs: [
								{ "className": "text-center", "targets": [4] },
         	                	{"targets": 8 ,"visible": false, "searchable": false},
         	                	{"targets": 11 ,"visible": false, "searchable": false},
         	                	{"targets": 12 ,"visible": false, "searchable": false},
         	                	{"targets": 13 ,"visible": false, "searchable": false}
         	                	,{"targets": 16 ,"visible": false, "searchable": false}
           				    ],
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
										columns: [0,1,2,3,4,5,6,7,8,9,15,16]
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
	
			
			var htmlTableTabla3 = '<table id=\"tblReporteTabla3\" style="width: 99%;" class=\"table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';

			
			function setDataTabla3(pdataReporte, pcolumnsReporte){	
				
				document.getElementById('tabla3container').innerHTML = htmlTableTabla3;	
				
				if(typeof tableReporte === 'undefined'){
			    
				var tableReporte = $('#tblReporteTabla3').DataTable(
						{
							processing : false,
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
							serverSide : false,
							data: pdataReporte,
							columns: pcolumnsReporte,
							columnDefs: [
								{ "className": "text-center", "targets": [4] },
         	                	
           				    ],
							dom: 'Bfrtip',
							lengthMenu : [
								[5, 10, 15, -1],
								['5 registros',
									'10 registros',
									'15 registros',
									'Mostrar todo']
							],
							destroy : true,
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
										columns: [0,1,2,3,4,5,6,7,8,9,15,16]
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
								responsive: true
						});
				
				table = $('#tblReporteTabla3').DataTable();
				
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
			        tableReporte.fnClearTable();
			        tableReporte.fnAddData(dataReporte);
			        tableReporte.fnAdjustColumnSizing();
			    }
			}
			
			
	</script>
</body>
 <style>

.avatars {
  padding-top:20px;
  display: inline-block;
  /* transform:scale(-1,1); */
  padding-left:50px;
}

.avatar {
  margin-left: -25px;
  position: relative;
  display:inline-block;
  border:1px solid #fff;
  border-radius: 50%;
  overflow:hidden;
  width:60px;
  height:60px;
}

.avatar img {
  width:60px;
  height:60px;
  transform:scale(-1,1);
}

.example2 {
  border: 2px solid red;
  padding: 10px;
  border-radius: 50px 20px;
}

/* .aside{ 
   /* background-color: silver;   */
 	   background: linear-gradient(90deg,silver, white); 
}  */

.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 40%;
}

.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}

.container {
  padding: 2px 16px;
}

/* Button */
.btn-circle.btn-xl {
  width: 70px;
  height: 70px;
  padding: 10px 16px;
  font-size: 24px;
  line-height: 1.33;
  border-radius: 35px;
  
  -webkit-box-shadow: 10px 10px 0px 0px rgba(0,0,0,0.75);
	-moz-box-shadow: 10px 10px 0px 0px rgba(0,0,0,0.75);
	box-shadow: 5px 5px 8px 0px rgba(0,0,0,0.75);
}

#btnShow:disabled{
opacity: 0.5;
}


.shadow{
    -webkit-filter: drop-shadow(10px 10px 2px #BDBDBD);
}

.vcenter {
    display: inline-block;
    vertical-align: middle;
    float: none;
    padding-bottom: 5px;
}


.fa-circle{
    color: #22E63D;
}
.fa-circle2{
    color: silver;
}

.overlay {
  opacity: 0.2;
}

.overlay2 {
  opacity: 0.7;
}


</style> 

</html>



