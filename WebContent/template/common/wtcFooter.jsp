	<%@page import="com.pe.ibm.bean.BeanSession"%>
<%
	BeanSession objBeanSessionCFooter = new BeanSession();
	objBeanSessionCFooter = (BeanSession) session.getAttribute("usuarioLogin");
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>

<style>
audio { 
   display:none;
}
</style>

<!-- <div class="container"> -->
<div class="row">
	<div class="col-lg-12 text-center">
		<div class="copyright" style="color: white;">2017 &copy; IBM -
			Portal Operations</div>
	</div>
</div>


<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
		<div style="position: fixed; max-width: 650px; bottom: -20px; right: 5px;">
			<div class="box box-primary box-solid direct-chat direct-chat-primary collapsed-box">
				<div class="box-header with-border" style="background: #003F69; background: -webkit-linear-gradient(left, #003F69 , #00B2EF);
background: -o-linear-gradient(right, #003F69, #00B2EF); background: -moz-linear-gradient(right, #003F69, #00B2EF); background: linear-gradient(to right, #003F69 , #00B2EF);">
					<h3 class="box-title" data-widget="collapse" style="cursor:pointer"><i class="fa fa-comments" aria-hidden="true"></i>  Asistente Operations 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
					<div class="box-tools pull-right">
						<span data-toggle="tooltip" title="Sayri puede hablar" class="badge bg-purple-active pull-right"><label class="label checkbox-inline"><i class="fa fa-volume-up" aria-hidden="true"></i> Lectura en voz alta &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" id="chkVoice" value="voice" ></label></span>
					</div>
				</div>
				<div class="box-body bodyChat-ImgBackground">
					<div class="bg-ImgBackground"></div>
					<div id="dvDirectChat" class="direct-chat-messages">
						
	<!-- 					<div class="row"></div> -->
	<!-- 					</div> -->
						
					</div>
					<div class="box-footer">
						<div class="input-group">
							<input type="text" id="txtInput" name="message" placeholder="Escribeme algo ..." class="form-control" onkeypress="keyPress1(event)">
							<span class="input-group-btn">
								<a id="btnEnviarInput" data-toggle="tooltip" title="Enviar" onclick="enviarInput('')" class="btn btn-social-icon btn-facebook"><i class="fa fa-paper-plane" aria-hidden="true"></i></a>
	<!-- 							<a id="btnEnviarVoice" data-toggle="tooltip" title="Hablar" onclick="enviarInput('')" class="btn btn-social-icon btn-facebook"><i class="fa fa-microphone" aria-hidden="true"></i></a> -->
							</span>
						</div>
					</div>
				</div>
			</div>
			<audio id="audio_player" controls="controls" autobuffer="autobuffer"></audio>
		</div>
	</div>
</div>



	<!-- Modal -->
	<div class="modal fade" id="mdTicketsReporte" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i>DETALLE DE TICKETS</h3>
					</div>
					<div class="box-body"> 
						<div class="row">
							<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
								<div class="form-inline">
									<div class="form-group">
										<span>Periodo:</span> 
										<input type="text" class="form-control datePicker" id="txtInicio"> 
										<input type="text" class="form-control datePicker" id="txtFin">
									</div>
									<div class="form-group">
										<a href="#" class="btn btn-primary"  onclick="listReport('getMaximoTicketsResueltos')">Consultar</a>
									</div>
								</div>
							</div>
						</div>
						<br/>
						<div class="row">
							<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
								<div id="tbcontainer" class="table-responsive">
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a class="btn btn-default" data-dismiss="modal"><i class="fa fa-undo" aria-hidden="true"></i> Atras</a>
					</div>
					<div id="dvLoadTicketsReporte"></div>
				</div>
			</div>
		</div>
	</div>
	
	
		<!-- Modal PDF -->
	<div class="modal fade" id="mdProcedimientos" role="dialog">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title"> <i class="fa fa-table" aria-hidden="true"></i>PROCEDIMIENTOS</h3>
					</div>
					<div class="box-body"> 
						<div class="row">
							<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12" style="height: 100%">
								<div id="dviframe"></div>
<!-- 								<iframe id="ifrProcedimiento" src="" width="100%" height="100%" frameborder="0" allowfullscreen webkitallowfullscreen msallowfullscreen></iframe> -->
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<a class="btn btn-default" data-dismiss="modal"><i class="fa fa-undo" aria-hidden="true"></i> Atras</a>
					</div>
					<div id="dvLoadTicketsReporte"></div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
<script type="text/javascript">

	var f = new Date();
	var date = f.getFullYear()
			+ '-'
			+ ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f.getMonth() + 1)) + '-'
			+ (f.getDate() < 10 ? '0' + f.getDate() : f.getDate());
	
	var vTeam = document.getElementById('hdIdTeam').value;
	//	var vCodCliente = document.getElementById('hdCliente').value;
	var vCliente = document.getElementById("hdCliente").value;
	
	document.getElementById("txtInicio").value = date;
	document.getElementById("txtFin").value = date;
	
	$('#mdProcedimientos .box-body').css('overflow-y', 'auto'); 
    $('#mdProcedimientos .box-body').css('max-height', $(window).height() * 0.7);
    $('#mdProcedimientos .box-body').css('height', $(window).height() * 0.7);
    
	
	function changeProcedure(strProcedimiento){
		console.log('procedimiento==> ' + strProcedimiento);
		var htmliframe = '<iframe id="ifrProcedimiento" src="' + strProcedimiento + '" width="100%" height="100%" frameborder="0" allowfullscreen webkitallowfullscreen msallowfullscreen></iframe>';
		document.getElementById('dviframe').innerHTML = htmliframe;
		$('#ifrProcedimiento').css('overflow-y', 'auto');
	    $('#ifrProcedimiento').css('max-height', $(window).height() * 0.7);
	    $('#ifrProcedimiento').css('height', $(window).height() * 0.7);
		
	    if(strProcedimiento != '0'){
	    	$('#mdProcedimientos').modal('show');
	    }
		//$('#ifrProcedimiento').attr('src', strProcedimiento);
	}
	
	
	function keyPress1(e) {
	  var vtecla = (document.all) ? e.keyCode : e.which;
	  if (vtecla==13) {
		enviarInput();
	  }
	}
	
	enviarInput('init');
	
	
	function enviarInput(pInput) {
		
		var htmlConversation = "";
		var src = "ServletWatsonConversation";
		var vInput = ($('#txtInput').val().trim() != "" ? $('#txtInput').val().trim() : pInput.trim());
		var vchkVoice = (document.getElementById('chkVoice').checked ? 1 : 0);
		var vCliente = document.getElementById("hdCliente").value;
		var vTeam = document.getElementById('hdIdTeam').value;

		var d = new Date();
		
		if(vInput == "")
			return false;
		
		
		if(vInput != 'init'){
			var vname = "<%=objBeanSessionCFooter.getObjBeanPersonal().getStrNombre()%> <%=objBeanSessionCFooter.getObjBeanPersonal().getStrApPaterno()%>";
			
			htmlConversation = document.getElementById('dvDirectChat').innerHTML;
			htmlConversation += '<div class="direct-chat-msg right">' + 
				'<div class="direct-chat-info clearfix">	' +
				'<span class="direct-chat-name pull-right">' + 
				'<b>' + vname + '</b></span>' +
				'<span class="direct-chat-timestamp pull-left">' + d.getDate() + '/' + (d.getMonth() + 1) + ' ' + d.getHours() + ':' + d.getMinutes() + '</span>' +
				'</div>' +
				'<img class="direct-chat-img" src="<%=objBeanSessionCFooter.getObjBeanPersonal().getStrPhoto()%>" alt="Usuario">' +
				'<div class="direct-chat-text">' + vInput + '</div>' +
				'</div>';
			document.getElementById('dvDirectChat').innerHTML = htmlConversation;
			
			
			htmlConversation = document.getElementById('dvDirectChat').innerHTML;
			htmlConversation += '<div class="sk-folding-cube">' +
				  '<div class="sk-cube1 sk-cube"></div>' +
				  '<div class="sk-cube2 sk-cube"></div>' +
				  '<div class="sk-cube4 sk-cube"></div>' +
				  '<div class="sk-cube3 sk-cube"></div>' +
				'</div>';
			document.getElementById('dvDirectChat').innerHTML = htmlConversation;
			
			
			var height = 10000;
			$('#dvDirectChat .direct-chat-msg').each(function(i, value){
			    height += parseInt($(this).height());
			});

			height += '';

			$('#dvDirectChat').animate({scrollTop: height});
		}
		else
			vInput = '';
		
// 		alert(vInput);
		
		htmlConversation = "";
		$.post(src, {
			strOperation : "conversationInput",
			strInput : vInput,
			strVoice : vchkVoice,
			strCliente : vCliente,
			iTeam : vTeam
		}, function(pdata) {
			
			var fecha= new Date();
			var horas= fecha.getHours();
			var minutos = fecha.getMinutes();
			var segundos = fecha.getSeconds();
			var idtb = "asd" + horas + minutos + segundos;
			
			if (pdata != 'error') {
				console.log(pdata);
				var obj = JSON.parse(pdata.split("=").join(":"));
				console.log(obj);
				$('.sk-folding-cube').remove();
				 
				htmlConversation = document.getElementById('dvDirectChat').innerHTML;
				htmlConversation += '<div class="direct-chat-msg">' + 
					'<div class="direct-chat-info clearfix">' +
					'<span class="direct-chat-name pull-left"><b>Sayri &#x1f916</b></span>' +
					'<span class="direct-chat-timestamp pull-right">' + d.getDate() + '/' + (d.getMonth() + 1) + ' ' + d.getHours() + ':' + d.getMinutes() + '</span>' +
					'</div>' +
					'<video class="direct-chat-img" autoplay="" data-widget="videolooper" loop data-playtimes="100" style="width: 40px;height:auto;">' +
// 	                  '<source src="https://www.ibm.com/watson/assets/duo/video/Watson_Avatar_Ambient-square-071817-homepage.mp4" type="video/mp4">' +
// 	                  '<source src="https://www.ibm.com/watson/assets/duo/video/Watson_Avatar_Ambient-square-071817-homepage.webm" type="video/webm">' +
// 	                  '<source src="https://www.ibm.com/watson/assets/duo/video/Watson_Avatar_Ambient-square-071817.ogv" type="video/ogv"><img src="https://www.ibm.com/watson/assets/duo/img/hero/hero-big-blue-watson.png" title="Your browser does not support the <video> tag">' +
					  '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817-homepage.mp4" type="video/mp4">' +
	                  '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817-homepage.webm" type="video/webm">' +
	                  '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817.ogv" type="video/ogv"><img src="<%=request.getContextPath()%>/resources/image/hero-big-blue-watson.png" title="Your browser does not support the <video> tag">' +
	                '</video>' +
<%-- 					'<img class="direct-chat-img" src="<%=request.getContextPath()%>/resources/image/favicon.jpg" alt="Automation">' + --%>
					'<div class="direct-chat-text">' + obj.watson[0].response + '</div>' +
					'</div>';
				document.getElementById('dvDirectChat').innerHTML = htmlConversation;
				
				var height = 10000;
				$('#dvDirectChat .direct-chat-msg').each(function(i, value){
				    height += parseInt($(this).height());
				});

				height += '';

				$('#dvDirectChat').animate({scrollTop: height});
				
				if(obj.watson[0].action == 'menu'){
					$('#carrierChatBot').remove();
					htmlConversation = document.getElementById('dvDirectChat').innerHTML;
					htmlConversation += '<div id="carrierChatBot" class="carousel slide">' +
					  '<ol class="carousel-indicators">' +
					    '<li data-target="#imgChatBot1" data-slide-to="0" class="active"></li>' +
					    '<li data-target="#imgChatBot2" data-slide-to="1"></li>' +
					    '<li data-target="#imgChatBot3" data-slide-to="2"></li>' +
					  '</ol>' +

					  '<div class="carousel-inner">' +
					    '<div class="item active">' +
						 	'<div class="row">' +
						      '<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-centered">' +
						        '<div class="thumbnail">' +
						          '<img src="<%=request.getContextPath()%>/resources/image/chatbot/imgTickets.png" alt="Tickets" class="img-rounded">' +
						          '<div class="caption">' +
						            '<h3>Tickets Maximo</h3>' +
						            '<p>Aqui se podrá obtener información de los tickets registrados en Maximo</p>' +
						            '<p><a href="#" onclick="enviarInput(\'mis ultimos tickets\')" class="btn bg-light-blue btn-block" role="button"><b>Mostrar mis ultimos 30 tickets creados</b></a></p>' +
						            '<p><a href="#" onclick="enviarInput(\'mis tickets del mes\')" class="btn bg-light-blue btn-block" role="button"><b>Mostrar mis tickets del presente mes</b></a></p></p>' +
						            '<p><a href="#" onclick="enviarInput(\'buscar tickets por fechas personalizadas\')" class="btn bg-light-blue btn-block" role="button"><b>Mostrar mis tickets según rango de fechas</b></a></p></p>' +
						            '<p><a href="#" onclick="enviarInput(\'buscar ticket\')" class="btn bg-light-blue btn-block" role="button"><b>Buscar detalle de un ticket</b></a></p></p>' +
						            '<p><a href="#" onclick="enviarInput(\'ingresar comentario\')" class="btn bg-light-blue btn-block" role="button"><b>Registrar comentario a un ticket</b></a></p></p>' +
						            '<p><a href="#" onclick="enviarInput(\'listar comentarios\')" class="btn bg-light-blue btn-block" role="button"><b>Listar todos los comentarios de un ticket</b></a></p></p>' +
						          '</div>' +
						        '</div>' +
						      '</div>' +
						    '</div>' +
					    '</div>' +

					    '<div class="item">' +
					    
						    '<div class="row">' +
						      '<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-centered">' +
						        '<div class="thumbnail">' +
						          '<img src="<%=request.getContextPath()%>/resources/image/chatbot/imgProcedimientos1.png" alt="Tickets" class="img-rounded">' +
						          '<div class="caption">' +
						            '<h3>Procedimientos</h3>' +
						            '<p>En este espacio se obtendrá información de los procedimientos.</p>' +
						            '<p><a href="#" onclick="enviarInput(\'procedimientos\')" class="btn bg-light-blue btn-block" role="button"><b>Listar todos los procedimientos</b></a></p></p>' +
						            '<p><a href="#" onclick="enviarInput(\'procedimiento windows\')" class="btn bg-light-blue btn-block" role="button"><b>Buscar un procedimiento</b></a></p></p>' +
						          '</div>' +
						        '</div>' +
						      '</div>' +
						    '</div>' +
					    
					    '</div>' +

					    '<div class="item">' +
					    
					    '<div class="row">' +
					      '<div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-centered">' +
					        '<div class="thumbnail">' +
					          '<img src="<%=request.getContextPath()%>/resources/image/chatbot/imgContactos.png" alt="Tickets" class="img-rounded">' +
					          '<div class="caption">' +
					            '<h3>Contactos</h3>' +
					            '<p>¿Necesitas información sobre nuestro servicio? Aqui te podré ayudar.</p>' +
					            '<p><a href="#" onclick="enviarInput(\'responsables del servicio\')" class="btn bg-light-blue btn-block" role="button"><b>Mostar información de responsables</b></a></p></p>' +
					            '<p><a href="#" onclick="enviarInput(\'escalamiento\')" class="btn bg-light-blue btn-block" role="button"><b>Escalamiento falta de atención</b></a></p></p>' +
		                        '<p><a href="#" onclick="enviarInput(\'informacionMesa\')" class="btn bg-light-blue btn-block" role="button"><b>Información del servicio Mesa de Ayuda</b></a></p></p>' +
		                        '<p><a href="#" onclick="enviarInput(\'horarioMesa\')" class="btn bg-light-blue btn-block" role="button"><b>Horarios de atención</b></a></p></p>' +
					          '</div>' +
					        '</div>' +
					      '</div>' +
					    '</div>' +
					    
					    '</div>' +
					    
					  '</div>' +

					  '<a class="left carousel-control" href="#carrierChatBot" data-slide="prev">' +
					    '<span class="glyphicon glyphicon-chevron-left"></span>' +
					    '<span class="sr-only">Previous</span>' +
					  '</a>' +
					  '<a class="right carousel-control" href="#carrierChatBot" data-slide="next">' +
					    '<span class="glyphicon glyphicon-chevron-right"></span>' +
					    '<span class="sr-only">Next</span>' +
					 '</a>' +
					'</div>' +
					'</div>';
					
					document.getElementById('dvDirectChat').innerHTML = htmlConversation;
					
// 					$('#carrierChatBot').on("carousel",function(){
// 						pause:"null"; interval: 5000;
// 					});
					
// 					$('#carrierChatBot').removeClass();
// 					$('#carrierChatBot').addClass('carousel slide');
					
					$('#carrierChatBot').carousel('pause');
				}
				else if(obj.watson[0].action == 'listar30ultimosTickets' || obj.watson[0].action == 'listarTicketsPendientes' || obj.watson[0].action == 'listarTicketsMes'){
					htmlConversation = document.getElementById('dvDirectChat').innerHTML;
					if(obj.watson[0].objMaximo.length > 0){
						
						
						
// 						htmlConversation += '<div class="row"><div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><div class="panel"><div class="table-responsive"><table class="table table-bordered table-condensed table-hover" style="font-size: 12px;">' +
						htmlConversation += '<div class="row"><div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><div class=""><table id="' + idtb + '" class="table table-bordered table-condensed" style="font-size: 12px;width:100%">' +
						'<thead>' +
						'<tr class="bg-primary">' +
// 						'<th>Nro</th>' +
						'<th>&nbsp;&nbsp;&nbsp;&nbsp;Fecha&nbsp;&nbsp;&nbsp;&nbsp;</th>' +
						'<th>Ticket</th>' +
						'<th>Estado</th>' +
						'<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Descripción&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>' +
						'<th>Propietario</th>' +
						'<th>Inicio</th>' +
						'<th>Minutos</th>' +
						'</tr>' +
						'</thead>' +
						'<tbody>';
						for(var i = 0 ; i < obj.watson[0].objMaximo.length ; i ++){
							htmlConversation += '<tr class="active">' + 
// 							'<td>' + obj.watson[0].objMaximo[i].nro + '</td>' +
							'<td>' + obj.watson[0].objMaximo[i].fecha.substring(0,10) + '</td>' +
							'<td>' + obj.watson[0].objMaximo[i].idticket + '</td>' +
							'<td><span class="badge ' + (obj.watson[0].objMaximo[i].ticketEstado == 'En cola' ? 'bg-gray"' : obj.watson[0].objMaximo[i].ticketEstado == 'En progreso' ? 'bg-light-blue"' : obj.watson[0].objMaximo[i].ticketEstado == 'En espera' ? 'bg-yellow"' : obj.watson[0].objMaximo[i].ticketEstado == 'CANCELLED' ? 'bg-red"' : 'bg-green"') + '>' + obj.watson[0].objMaximo[i].ticketEstado + '</span></td>' +
							'<td>' + obj.watson[0].objMaximo[i].ticketTitulo + '</td>' +
							'<td>' + obj.watson[0].objMaximo[i].ticketPropietario + '</td>' +
							'<td>' + obj.watson[0].objMaximo[i].fechaInicio + '</td>' +
							'<td>' + obj.watson[0].objMaximo[i].cantidad + ' minutos </td>' +
							'</tr>';
						}
						htmlConversation += '</tbody>' + '</table></div></div></div>';
						
					}
					else{
						htmlConversation += '<div class="direct-chat-msg">' + 
						'<div class="direct-chat-info clearfix"' +
						'<span class="direct-chat-name pull-left"><b>Sayri &#x1f916</b></span>' +
						'<span class="direct-chat-timestamp pull-right">' + d.getDate() + '/' + (d.getMonth() + 1) + ' ' + d.getHours() + ':' + d.getMinutes() + '</span>' +
						'</div>' +
						'<video class="direct-chat-img" autoplay="" data-widget="videolooper" loop data-playtimes="100" style="width: 40px;height:auto;">' +
						  '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817-homepage.mp4" type="video/mp4">' +
		                  '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817-homepage.webm" type="video/webm">' +
		                  '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817.ogv" type="video/ogv"><img src="<%=request.getContextPath()%>/resources/image/hero-big-blue-watson.png" title="Your browser does not support the <video> tag">' +
		                '</video>' +
		                '<div class="direct-chat-text">No encontré resultados para la consulta.</div>' +
						'</div>';
					}
					document.getElementById('dvDirectChat').innerHTML = htmlConversation;
				}
// 				else if(obj.watson[0].action == 'listarTicketsMes'){
// 					htmlConversation = document.getElementById('dvDirectChat').innerHTML;
// 					if(obj.watson[0].objMaximo.length > 0){
// 						htmlConversation += '<div class="row"><div class="col-lg-12"><div class="panel"><div class="table-responsive"><table class="table table-bordered">' +
// 						'<thead>' +
// 						'<tr class="bg-primary">' +
// 						'<th>Nro</th>' +
// 						'<th>Fecha</th>' +
// 						'<th>Nro Ticket</th>' +
// 						'<th>Estado</th>' +
// 						'<th>Descripción</th>' +
// 						'<th>Propietario</th>' +
// 						'</tr>' +
// 						'</thead>' +
// 						'<tbody>';
// 						for(var i = 0 ; i < obj.watson[0].objMaximo.length ; i ++){
// 							htmlConversation += '<tr>' + 
// 							'<td>' + obj.watson[0].objMaximo[i].nro + '</td>' +
// 							'<td>' + obj.watson[0].objMaximo[i].fecha + '</td>' +
// 							'<td>' + obj.watson[0].objMaximo[i].idticket + '</td>' +
// 							'<td>' + obj.watson[0].objMaximo[i].ticketEstado + '</td>' +
// 							'<td>' + obj.watson[0].objMaximo[i].ticketTitulo + '</td>' +
// 							'<td>' + obj.watson[0].objMaximo[i].ticketPropietario + '</td>' +
// 							'</tr>';
// 						}
// 						htmlConversation += '</tbody>' +
// 						'</table></div></div></div></div>';
// 					}
// 					else{
// 						htmlConversation += '<div class="direct-chat-msg">' + 
// 						'<div class="direct-chat-info clearfix"' +
// 						'<span class="direct-chat-name pull-left"><b>Sayri &#x1f916</b></span>' +
// 						'<span class="direct-chat-timestamp pull-right">' + d.getDate() + '/' + (d.getMonth() + 1) + ' ' + d.getHours() + ':' + d.getMinutes() + '</span>' +
// 						'</div>' +
// 						'<video class="direct-chat-img" autoplay="" data-widget="videolooper" loop data-playtimes="100" style="width: 40px;height:auto;">' +
<%-- 						  '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817-homepage.mp4" type="video/mp4">' + --%>
<%-- 		                  '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817-homepage.webm" type="video/webm">' + --%>
<%-- 		                  '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817.ogv" type="video/ogv"><img src="<%=request.getContextPath()%>/resources/image/hero-big-blue-watson.png" title="Your browser does not support the <video> tag">' + --%>
// 		                '</video>' +
// 		                '<div class="direct-chat-text">No encontré resultados para la consulta.</div>' +
// 						'</div>';
// 					}
// 					document.getElementById('dvDirectChat').innerHTML = htmlConversation;
// 				}
				else if(obj.watson[0].action == 'buscarTicket'){
					htmlConversation = document.getElementById('dvDirectChat').innerHTML;
					if(obj.watson[0].objMaximo.length > 0){
						htmlConversation += '<div class="box box-info">' +
						'<div class="box-header">' +
							'<h3 class="box-title">Información de ticket</h3>' +
						'</div>' +
						'<div class="box-body"><div class="contain3er"><div class="row">' +
							'<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"><div class="form-group">' +
								'<label>Id Ticket</label>' +
								'<div class="input-group">' +
									'<input type="text" readonly class="form-control" value="' + obj.watson[0].objMaximo[0].idTicket + '">' +
									'<div class="input-group-addon">' +
										'<i class="fa fa-ticket" aria-hidden="true"></i>' +
									'</div>' +
								'</div>' +
							'</div></div>' +
							
							'<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"><div class="form-group">' +
								'<label>Estado</label>' +
								'<div class="input-group">' +
									'<input type="text" readonly class="form-control" value="' + obj.watson[0].objMaximo[0].ticketEstado + '">' +
									'<div class="input-group-addon">' +
										'<i class="fa fa-calendar" aria-hidden="true"></i>' +
									'</div>' +
								'</div>' +
							'</div></div>' +
							
							'<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"><div class="form-group">' +
								'<label>Fecha Creación</label>' +
								'<div class="input-group">' +
									'<input type="text" readonly class="form-control" value="' + obj.watson[0].objMaximo[0].fecha + '">' +
									'<div class="input-group-addon">' +
										'<i class="fa fa-info-circle" aria-hidden="true"></i>' +
									'</div>' +
								'</div>' +
							'</div></div>' +
							
							'<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"><div class="form-group">' +
								'<label>Fecha Inicio</label>' +
								'<div class="input-group">' +
									'<input type="text" readonly class="form-control" value="' + obj.watson[0].objMaximo[0].fechaInicio + '">' +
									'<div class="input-group-addon">' +
										'<i class="fa fa-check-square-o" aria-hidden="true"></i>' +
									'</div>' +
								'</div>' +
							'</div></div>' +
							
							'<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"><div class="form-group">' +
								'<label>Fecha Fin</label>' +
								'<div class="input-group">' +
									'<input type="text" readonly class="form-control" value="' + obj.watson[0].objMaximo[0].fechaFin + '">' +
									'<div class="input-group-addon">' +
										'<i class="fa fa-info-circle" aria-hidden="true"></i>' +
									'</div>' +
								'</div>' +
							'</div></div>' +
							
							'<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"><div class="form-group">' +
								'<label>Tiempo de atención</label>' +
								'<div class="input-group">' +
									'<input type="text" readonly class="form-control" value="' + obj.watson[0].objMaximo[0].cantidad + ' min">' +
									'<div class="input-group-addon">' +
										'<i class="fa fa-check-square-o" aria-hidden="true"></i>' +
									'</div>' +
								'</div>' +
							'</div></div>' +
							
							'<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"><div class="form-group">' +
							'<label>Grupo Propietario</label>' +
							'<div class="input-group">' +
								'<input type="text" readonly class="form-control" value="' + obj.watson[0].objMaximo[0].ticketGrupoPropietario + '">' +
								'<div class="input-group-addon">' +
									'<i class="fa fa-info-circle" aria-hidden="true"></i>' +
								'</div>' +
							'</div>' +
						'</div></div>' +
						
						'<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"><div class="form-group">' +
							'<label>Propietario</label>' +
							'<div class="input-group">' +
								'<input type="text" readonly class="form-control" value="' + obj.watson[0].objMaximo[0].ticketEmailPropietario + '">' +
								'<div class="input-group-addon">' +
									'<i class="fa fa-check-square-o" aria-hidden="true"></i>' +
								'</div>' +
							'</div>' +
						'</div></div>' +
							
							'<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><div class="form-group">' +
								'<label>Propietario</label>' +
								'<div class="input-group">' +
									'<input type="text" readonly class="form-control" value="' + obj.watson[0].objMaximo[0].ticketTitulo + '">' +
									'<div class="input-group-addon">' +
										'<i class="fa fa-check-square-o" aria-hidden="true"></i>' +
									'</div>' +
								'</div>' +
							'</div></div>' +
							
							'<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><div class="form-group">' +
								'<label>Detalle</label>' +
								'<div class="input-group2">' +
									'<textarea rows="6" readonly class="form-control">' + obj.watson[0].objMaximo[0].ticketDescripcion + '</textarea>' +
								'</div>' +
							'</div></div>' +
							'</div>';
							
							if(obj.watson[0].objWO.length > 0){
								for(i = 0 ; i < obj.watson[0].objWO.length ; i++){
									htmlConversation += '<ul class="timeline">' +
						            '<li class="time-label">' +
						                  '<span class="bg-red">TICKET WORK ORDER</span>' +
						            '</li>' +
						            '<li>' +
						            
						            '<i class="' + (obj.watson[0].objWO[i].woestado == 'En cola' ? 'fa fa-list-ol bg-gray"' : obj.watson[0].objWO[i].woestado == 'En progreso' ? 'fa fa-cog fa-spin bg-light-blue"' : obj.watson[0].objWO[i].woestado == 'En espera' ? 'fa fa-clock-o bg-yellow"' : obj.watson[0].objWO[i].woestado == 'CANCELLED' ? 'fa fa-ban bg-red"' : 'fa fa-check bg-green"') + '></i>' +

						              '<div class="timeline-item">' +
						                '<span class="time"><i class="fa fa-clock-o"></i>' + (obj.watson[0].objWO[i].cantidad == 0 ? '0' : obj.watson[0].objWO[i].cantidad) + ' min</span>' +

						                '<h3 class="timeline-header"><a href="#">' + obj.watson[0].objWO[i].woid + '</a> <span class="label label-' + (obj.watson[0].objWO[i].woestado == 'En cola' ? 'default"' : obj.watson[0].objWO[i].woestado == 'En progreso' ? 'primary"' : obj.watson[0].objWO[i].woestado == 'En espera' ? 'warning"' : obj.watson[0].objWO[i].woestado == 'CANCELLED' ? 'danger"' : 'success"') + '">' + obj.watson[0].objWO[i].woestado + '</span></h3>' +

						                '<div class="timeline-body">' + obj.watson[0].objWO[i].wodescripcion + 
						                '<br/><strong>Grupo Propietario: </strong>' + obj.watson[0].objWO[i].wogrupopropietario + 
						                '<br/><strong>Propietario: </strong>' + obj.watson[0].objWO[i].wopropietario + 
						                '<br/><strong>Fecha Creación: </strong>' + obj.watson[0].objWO[i].wofechacreacion +
						                '<br/><strong>Fecha Inicio: </strong>' + obj.watson[0].objWO[i].wofechainicio +
						                '<br/><strong>Fecha Fin: </strong>' + obj.watson[0].objWO[i].wofechafin +
						                '</div>' +
//		 				                <div class="timeline-footer">
//		 				                  <a class="btn btn-primary btn-xs">Read more</a>
//		 				                  <a class="btn btn-danger btn-xs">Delete</a>
//		 				                </div>
						              '</div>' +
						            '</li>' +
						            '<li>' +
						              '<i class="fa fa-ticket bg-gray"></i>' +
						            '</li>' +
						          '</ul>';
								}
								
							}
							
							htmlConversation += '</div></div>' +
					'</div>';
			                  
					document.getElementById('dvDirectChat').innerHTML = htmlConversation;
				}
				else{
					htmlConversation += '<div class="direct-chat-msg">' + 
					'<div class="direct-chat-info clearfix"' +
					'<span class="direct-chat-name pull-left"><b>Sayri &#x1f916</b></span>' +
					'<span class="direct-chat-timestamp pull-right">' + d.getDate() + '/' + (d.getMonth() + 1) + ' ' + d.getHours() + ':' + d.getMinutes() + '</span>' +
					'</div>' +
					'<video class="direct-chat-img" autoplay="" data-widget="videolooper" loop data-playtimes="100" style="width: 40px;height:auto;">' +
					  '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817-homepage.mp4" type="video/mp4">' +
	                  '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817-homepage.webm" type="video/webm">' +
	                  '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817.ogv" type="video/ogv"><img src="<%=request.getContextPath()%>/resources/image/hero-big-blue-watson.png" title="Your browser does not support the <video> tag">' +
	                '</video>' +
	                '<div class="direct-chat-text">No encontré resultados para la consulta.</div>' +
					'</div>';
				}
			}
			else if(obj.watson[0].action == 'listarTicketsFechasPersonalizadas'){
				htmlConversation = document.getElementById('dvDirectChat').innerHTML;
				htmlConversation += '<div class="row"><div class="col-lg-12 col-centered"><a class="btn bg-purple btn-block" onclick="openModal()"><i class="fa fa-external-link-square"></i> Reporte</a></div></div>';
				document.getElementById('dvDirectChat').innerHTML = htmlConversation;
			}
			else if(obj.watson[0].action == 'listarComentarios'){
				htmlConversation = document.getElementById('dvDirectChat').innerHTML;
				if(obj.watson[0].objMaximo.length > 0){
					htmlConversation += '<div class="row"><div class="col-lg-12"><div class="panel"><div class="table-responsive"><table class="table table-bordered">' +
					'<thead>' +
					'<tr class="bg-primary">' +
					'<th>Nro</th>' +
					'<th>Ticket</th>' +
					'<th>Fecha</th>' +
					'<th>Titulo</th>' +
					'<th>Descripción</th>' +
					'</tr>' +
					'</thead>' +
					'<tbody>';
					for(var i = 0 ; i < obj.watson[0].objMaximo.length ; i ++){
						htmlConversation += '<tr>' + 
						'<td>' + obj.watson[0].objMaximo[i].nro + '</td>' +
						'<td>' + obj.watson[0].objMaximo[i].idTicket + '</td>' +
						'<td>' + obj.watson[0].objMaximo[i].fecha + '</td>' +
						'<td>' + obj.watson[0].objMaximo[i].descripcion + '</td>' +
						'<td>' + obj.watson[0].objMaximo[i].descripcion_log + '</td>' +
						'</tr>';
					}
					htmlConversation += '</tbody>' +
					'</table></div></div></div></div>';
				}
				else{
					htmlConversation += '<div class="direct-chat-msg">' + 
					'<div class="direct-chat-info clearfix"' +
					'<span class="direct-chat-name pull-left"><b>Sayri &#x1f916</b></span>' +
					'<span class="direct-chat-timestamp pull-right">' + d.getDate() + '/' + (d.getMonth() + 1) + ' ' + d.getHours() + ':' + d.getMinutes() + '</span>' +
					'</div>' +
					'<video class="direct-chat-img" autoplay="" data-widget="videolooper" loop data-playtimes="100" style="width: 40px;height:auto;">' +
					  '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817-homepage.mp4" type="video/mp4">' +
	                  '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817-homepage.webm" type="video/webm">' +
	                  '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817.ogv" type="video/ogv"><img src="<%=request.getContextPath()%>/resources/image/hero-big-blue-watson.png" title="Your browser does not support the <video> tag">' +
	                '</video>' +
	                '<div class="direct-chat-text">No encontré resultados para la consulta.</div>' +
					'</div>';
				}
				document.getElementById('dvDirectChat').innerHTML = htmlConversation;
			}
// 			else if(obj.watson[0].action == 'procedimiento'){
// 				htmlConversation = document.getElementById('dvDirectChat').innerHTML;
// 				if(obj.watson[0].objMaximo.length > 0){
// 					htmlConversation += '<div class="row"><div class="col-lg-12 col-centered"><a class="btn bg-purple btn-block" onclick="changeProcedure(\'' + obj.watson[0].objMaximo[0].urlProcedimiento + '\')"><i class="fa fa-external-link-square"></i> ' + obj.watson[0].objMaximo[0].nombreProcedimiento + '</a></div></div>';
// 				}
// 				document.getElementById('dvDirectChat').innerHTML = htmlConversation;
// 			}
			else if(obj.watson[0].action == 'listarProcedimientos' || obj.watson[0].action == 'procedimiento'){
				htmlConversation = document.getElementById('dvDirectChat').innerHTML;
				if(obj.watson[0].objMaximo.length > 0){
					htmlConversation += '<div class="row"><div class="col-lg-12 col-centered">';
					for(var i = 0 ; i < obj.watson[0].objMaximo[0].procedimientos.length ; i ++){
						htmlConversation += '<br/><a class="btn bg-purple btn-block" onclick="changeProcedure(\'' + obj.watson[0].objMaximo[0].procedimientos[i].urlprocedimiento + '\')"><i class="fa fa-external-link-square"></i> ' + obj.watson[0].objMaximo[0].procedimientos[i].nprocedimiento + '</a>';
					}
					htmlConversation += '</div></div>';
				}
				document.getElementById('dvDirectChat').innerHTML = htmlConversation;
			}
			else if(obj.watson[0].action == 'informacionResponsables'){
				htmlConversation = document.getElementById('dvDirectChat').innerHTML;
				if(obj.watson[0].objMaximo.length > 0){
					htmlConversation += '<div class="row"><div class="col-lg-12 col-centered">';
					htmlConversation += '<ul class="users-list clearfix">';
					for(var i = 0 ; i < obj.watson[0].objMaximo.length ; i ++){
						htmlConversation += '<li>';
						htmlConversation += '<img src="' + obj.watson[0].objMaximo[i].foto.split("email:").join("email=") + '" alt="' + obj.watson[0].objMaximo[i].nombre + '">';
						htmlConversation += '<a class="users-list-name" href="#" data-toggle="tooltip" title="' + obj.watson[0].objMaximo[i].nombre + '">' + obj.watson[0].objMaximo[i].nombre + '</a>';
						htmlConversation += '<span class="users-list-date">' + obj.watson[0].objMaximo[i].cargo + '</span>';
						htmlConversation += '</li>';
					}
					htmlConversation += '</ul>';
					htmlConversation += '</div></div>';
				}
				console.log(htmlConversation);
				document.getElementById('dvDirectChat').innerHTML = htmlConversation;
			}
			
			var snd = new Audio("data:audio/wav;base64," + obj.watson[0].wav);
			snd.play();
			setDatatable(idtb);
		}
		else{
			$('.sk-folding-cube').remove();
			htmlConversation = document.getElementById('dvDirectChat').innerHTML;
			htmlConversation += '<div class="direct-chat-msg">' + 
			'<div class="direct-chat-info clearfix"' +
			'<span class="direct-chat-name pull-left"><b>Sayri &#x1f916</b></span>' +
			'<span class="direct-chat-timestamp pull-right">' + d.getDate() + '/' + (d.getMonth() + 1) + ' ' + d.getHours() + ':' + d.getMinutes() + '</span>' +
			'</div>' +
			'<video class="direct-chat-img" autoplay="" data-widget="videolooper" loop data-playtimes="100" style="width: 40px;height:auto;">' +
			  '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817-homepage.mp4" type="video/mp4">' +
              '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817-homepage.webm" type="video/webm">' +
              '<source src="<%=request.getContextPath()%>/resources/video/Watson_Avatar_Ambient-square-071817.ogv" type="video/ogv"><img src="<%=request.getContextPath()%>/resources/image/hero-big-blue-watson.png" title="Your browser does not support the <video> tag">' +
            '</video>' +
            '<div class="direct-chat-text">Bueno esto es embarazoso &#x1F625 , no pude obtener los resultados a tu consulta, por favor vuelve a intentarlo en unos minutos o de lo contrario refresca esta página y vuelve a preguntarme.</div>' +
			'</div>';
			
			
// 			htmlConversation += '<div class="direct-chat-msg">' + 
// 				'<div class="direct-chat-info clearfix"' +
// 				'<span class="direct-chat-name pull-left"><b>Sayri &#x1f916</b></span>' +
// 				'<span class="direct-chat-timestamp pull-right">' + d.getDate() + '/' + (d.getMonth() + 1) + ' ' + d.getHours() + ':' + d.getMinutes() + '</span>' +
// 				'</div>' +
<%-- 				'<img class="direct-chat-img" src="<%=request.getContextPath()%>/resources/image/favicon.jpg" alt="Automation">' + --%>
// 				'<div class="direct-chat-text">Bueno esto es embarazoso &#x1F625 , no pude obtener los resultados a tu consulta, por favor vuelve a intentarlo en unos minutos o de lo contrario refresca esta página y vuelve a preguntarme.</div>' +
// 				'</div>';
			document.getElementById('dvDirectChat').innerHTML = htmlConversation;
		}
	});
	
		$('#txtInput').val('');
		$('#txtInput').focus();
		
		var height = 10000;
		$('#dvDirectChat .direct-chat-msg').each(function(i, value){
		    height += parseInt($(this).height());
		});
		height += '';
		$('#dvDirectChat').animate({scrollTop: height});
		
	}
	
	
	function openModal(){
		$('#mdTicketsReporte').modal('show');
	}
	
	function setDatatable(idtb){
// 			if(typeof tableReporte2 === 'undefined') 
// 		    {
		    
// 			var tableReporte2 = 
				$('#' + idtb).DataTable({
				responsive: true,
				"info":     false,
				"bPaginate": false,
				"ordering": false,
				"pageLength": 1000,
				dom: '',
// 				"autoWidth": false,
// 				columns: [
// 				    { width: '20%' },
// 				    { width: '20%' },
// 				    { width: '20%' },
// 				    { width: '40%' },
// 				    null,
// 				    null,
// 				    null
// 				  ],
				"columnDefs": [
				    { "width": "20%", "targets": 0 }
// 				    { "width": "20%", "targets": 1 },
// 				    { "width": "20%", "targets": 2 },
// 				    { "width": "35%", "targets": 3 },
// 				    { "width": "0%", "targets": 4 },
// 				    { "width": "0%", "targets": 5 },
// 				    { "width": "0%", "targets": 6 }
				  ],
// 				columnDefs: [
// 			           { responsivePriority: 1, width: '25%', targets: 0 },
// 			           { responsivePriority: 2, width: '25%', targets: 1 },
// 			           { responsivePriority: 3, width: '15%', targets: 2 },
// 			           { responsivePriority: 4, width: '35%', targets: 3 }
// 			       ],
				buttons: [
		            'copy', 'csv', 'excel', 'pdf', 'print'
		        ]
			});
// 		    }
// 		    else {
// 		    // how to change the data contained inside datatable?
// 		        tableReporte2.fnClearTable();
// 		        tableReporte2.fnAddData(dataReporte);
// 		        tableReporte2.fnAdjustColumnSizing();
// 		    }
	}
	
	function listReport(strOp) {
		
		$(document).ready(
						function() {
							var vtxtInicio = $('#txtInicio').val();
							var vtxtFin = $('#txtFin').val();
							var onVip = '0';
							var vCliente = document.getElementById("hdCliente").value;

							var htmlTable = '<table id=\"tblTickets\" class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
							document.getElementById('tbcontainer').innerHTML = htmlTable;

							$('#dvLoadTicketsReporte').removeClass('overlay');
							$('#dvLoadTicketsReporte').addClass('overlay');
							document.getElementById('dvLoadTicketsReporte').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';

							var src = 'ServletMaximoMobility';
							$.post(src,{
												strOperation : strOp,
												ptxtInicio : vtxtInicio,
												ptxtFin : vtxtFin,
												pcboClientes : vCliente,
												ptipo : '0',
												pOnVip : onVip
											},
											function(pdata) {
												
												if(pdata != 'error'){
												try{
												var obj = JSON.parse(pdata);
												var dataReporte = [];

												for (i = 0; i < obj.ticketsReporte.length; i++) {
													var arr = [];
													arr.push(obj.ticketsReporte[i].idTicket);
													arr.push(obj.ticketsReporte[i].ticketTitulo);
													arr.push(obj.ticketsReporte[i].ticketClass);
													arr.push(obj.ticketsReporte[i].ticketEstado);
													arr.push(obj.ticketsReporte[i].ticketUsuarioVip);
													arr.push(obj.ticketsReporte[i].ticketCliente);
													arr.push(obj.ticketsReporte[i].ticketIdCliente);
													arr.push(obj.ticketsReporte[i].ticketLugar);
													arr.push(obj.ticketsReporte[i].ticketIdLugar);
													arr.push(obj.ticketsReporte[i].ticketClassNivel2);
													arr.push(obj.ticketsReporte[i].ticketITGrupoResolutor);
													arr.push(obj.ticketsReporte[i].ticketGrupoResolutor);
													arr.push(obj.ticketsReporte[i].ticketIdGrupoResolutor);
													arr.push(obj.ticketsReporte[i].ticketFechaCreacion);
													arr.push(obj.ticketsReporte[i].ticketFechaFin);
													arr.push(obj.ticketsReporte[i].ticketPersonaReportado);
													arr.push(obj.ticketsReporte[i].ticketEmailPersonaAfectada);
													arr.push(obj.ticketsReporte[i].ticketPersonaAfectada);
													arr.push(obj.ticketsReporte[i].ticketNumeroCI);
													dataReporte.push(arr);
												}

												columnsReport = [ {
													title : "TICKET"}, {
													title : "TITULO"}, {
													title : "CLASE"}, {
													title : "ESTADO"}, {
													title : "USUARIO VIP"}, {	
													title : "CLIENTE"}, {
													title : "IDCLIENTE"}, {
													title : "LUGAR"}, {
													title : "IDLUGAR"}, {
													title : "NIVELCLASS2"},{
													title : "ITGRUPORESOLUTOR"}, {
													title : "GRUPORESOLUTOR"}, {
													title : "IDGRUPORESOLUTOR"}, {
													title : "FECHACREACION"}, {
													title : "FECHAFIN"}, {
													title : "PERSONAREPORTADO"}, {
													title : "EMAILPERSONAAFECTADA"}, {
													title : "PERSONAAFECTADA"}, {
													title : "NUMEROCI"
												} ];
												setData(dataReporte,
														columnsReport);
												document.getElementById('dvLoadTicketsReporte').innerHTML = '';
												$('#dvLoadTicketsReporte').removeClass('overlay');
													}
													catch(err){
														console.log(err.message);
														document.getElementById('dvLoadTicketsReporte').innerHTML = '';
														$('#dvLoadTicketsReporte').removeClass('overlay');
													}
												
												}
												else{
													document.getElementById('dvLoadTicketsReporte').innerHTML = '';
													$('#dvLoadTicketsReporte').removeClass('overlay');
												}
													
											});
						});
	}

	function setData(pdataReporte, pcolumnsReport) {
		
		var fecha= new Date();
		var horas= fecha.getHours();
		var minutos = fecha.getMinutes();
		var segundos = fecha.getSeconds();
		var idtb = "asd" + horas + minutos + segundos;

		var htmlTable = '<table id=\"' + idtb + '\"class=\"display table table-bordered table-hover\"><thead class=\"bg-primary\"></thead></table>';
		document.getElementById('tbcontainer').innerHTML = htmlTable;

// 		if (typeof tableReporte === 'undefined') {

// 			var tableReporte = 
				$('#'+idtb)
					.DataTable(
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
										[ '10 registros', '25 registros', '50 registros', 'Mostrar todo' ] ],
								buttons : [
										{
											extend : 'pageLength',
											text : '<i class="fa fa-list-ol" aria-hidden="true"></i> Mostrar',
										},
										{
											extend : 'excelHtml5',
											text : '<i class="fa fa-file-excel-o"></i> Descargar en Excel',
											// 								className : 'btn btn-default',
											customize : function(xlsx) {
												var sheet = xlsx.xl.worksheets['reporte.xml'];

												// jQuery selector to add a border
												$('row c[r*="10"]', sheet)
														.attr('s', '25');
											}
										} ],
								destroy : true
							});
			$('.dataTables_filter input').addClass(
					'form-control-search-datatable');
			// 		$('.dataTables_filter input').attr('size',10);
// 		} else {
// 			// how to change the data contained inside datatable?
// 			tableReporte.fnClearTable();
// 			tableReporte.fnAddData(dataReporte);
// 			tableReporte.fnAdjustColumnSizing();
// 		}
	}
	

</script>

</html>