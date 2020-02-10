
<%@page import="com.pe.ibm.bean.BeanSession"%>
<%
	BeanSession objBeanSessionCHeader = new BeanSession();
	objBeanSessionCHeader = (BeanSession) session.getAttribute("usuarioLogin");	
	
%>

<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%-- 	pageEncoding="ISO-8859-1"%> --%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->

<!-- Push Desktop -->
<script src="<%=request.getContextPath()%>/resources/PushDesktop/pushDesktop.js" type="text/javascript"></script>
<input type="hidden" id="idstrImbrs" value="<%=objBeanSessionCHeader.getObjBeanPersonal().getStrImbrs()%>" />
<header class="main-header"> <!-- Logo --> 
	<a href="<%=request.getContextPath()%>/whome.jsp" class="logo" style="background: #003F69;"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini">
			<img src="<%=request.getContextPath()%>/resources/image/IBM128.png" class="img-responsive" alt="IBM"/>
		</span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg">
			IBM Operations
		</span>
	</a> <!-- Header Navbar: style can be found in header.less --> 
	<nav class="navbar navbar-static-top" role="navigation" style="background: #003F69; background: -webkit-linear-gradient(left, #003F69 , #00B2EF);
background: -o-linear-gradient(right, #003F69, #00B2EF); background: -moz-linear-gradient(right, #003F69, #00B2EF); background: linear-gradient(to right, #003F69 , #00B2EF);"> <!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        	<span class="sr-only">Toggle navigation</span>
    	</a>
	
		<div class="navbar-custom-menu">
			<ul  class="nav navbar-nav">
				<!-- Notifications: style can be found in dropdown.less -->
	           <li id="idNavNotificacion" class="dropdown notifications-menu">
	             <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	               <i class="fa fa-bell-o"></i>
	             </a>
	             <ul class="dropdown-menu">
	               <li class="footer"><a href="#">No tienes notificaciones</a></li>
	             </ul>
	           </li>

			
				<!-- User Account: style can be found in dropdown.less -->
				<li id="dropdown-menu" class="dropdown user user-menu">
					<a id="dusu" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true">
						<img src="<%=objBeanSessionCHeader.getObjBeanPersonal().getStrPhoto()%>" class="user-image" alt="Usuario"> 
						<span class="hidden-xs">Bienvenido <%=objBeanSessionCHeader.getObjBeanPersonal().getStrNombre()%>
							<i class="caret"></i>
						</span>
					</a>
					<ul  class="dropdown-menu mega-dropdown-menu" aria-labelledby="dusu">
						<!-- User image -->
					<li class="user-header">
							<img class="img-circle" src="<%=objBeanSessionCHeader.getObjBeanPersonal().getStrPhoto()%>" alt="User"/>
							<p>
							<input id="hdIdTeam" type="hidden" value="<%=objBeanSessionCHeader.getObjBeanPersonal().getiTeam()%>">
							<input id="hdIdEmpleado" type="hidden" value="<%=objBeanSessionCHeader.getObjBeanPersonal().getiIdEmpleado()%>">
							<input id="hdEmpleado" type="hidden" value="<%=objBeanSessionCHeader.getObjBeanPersonal().getStrNombre() + " " + objBeanSessionCHeader.getObjBeanPersonal().getStrApPaterno()%>">
								<%=objBeanSessionCHeader.getObjBeanPersonal().getStrNombre() + " " + objBeanSessionCHeader.getObjBeanPersonal().getStrApPaterno() + " " + objBeanSessionCHeader.getObjBeanPersonal().getStrApMaterno()%>
								<small><%=objBeanSessionCHeader.getObjBeanPersonal().getStrPerfil()%></small>
							<input id="hdCliente" type="hidden" value="<%=objBeanSessionCHeader.getObjBeanPersonal().getStrCodCliente()%>">
							</p>
					</li>						
						
										
					  <li class="user-body">
		                <div class="row">
		                  <div class="col-xs-4 text-center">
		                    <a href="#"><span id="smTeam"><%=objBeanSessionCHeader.getObjBeanPersonal().getStrTeam()%></span></a>
		                  </div>
		                  <div class="col-xs-7 text-center">
		                    <a href="#"><span id="smUsuario"><%=objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin()%></span></a>
		                  </div>
		                </div>
		                <!-- /.row -->
		              </li>
						
						<li class="user-footer" id="idUserFooter">
							<div class="row" id="idDivCombo">
								<div class="col-md-12">
									<div class="input-group">
												<div id="imgcboTeam" class="input-group-addon">
													<span class="fa fa-database"></span>
												</div>
												<select class="form-control placeholder-no-fix" id="cboTeamHeader" name="cboTeam" onchange="openModalPregunta()">
													<option value="0">Seleccionar</option>
												</select> 
								    </div>
								</div>								
							</div>
							<br>
							<div class="row" >
								<div class="col-md-4" id="divCambioPass">
									<a id="btnMenuCambiarPass" class="btn btn-default btn-flat" onclick="openModalUpdatePassword()"><i class="fa fa-key" aria-hidden="true"></i></a>
								</div>
								<div class="col-md-8">
									<a onclick="logout()" href="#" class="btn btn-default btn-flat btn-block">Salir</a>
								</div>								
							</div>
						</li>						
						
					</ul>
				</li>
			</ul>
		</div>
	</nav>
</header>

<!-- Modal Pregunta -->
<div class="modal fade" id="mdPreguntaHeader" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Cambiar ambiente</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        	<input type="hidden" id="hdIdPerfil2">
        		<div class="form-group">
        			<label id="mensaje"></label>
        		</div>
        		<div class="form-inline">
        			<div class="form-group" id="idFormGroup">
        				<a onclick="cambiarAmbiente()" class="btn btn-primary btn-sm" id="btnCambiar">
		        			<i class="fa fa-refresh fa-lg" aria-hidden="true"></i> CAMBIAR
		        		</a>
		        	</div>		
		        	<div class="form-group">	        		
		        		<a onclick="volverCboHeader()" role="button" class="btn btn-default btn-sm" data-dismiss="modal">
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

<!-- Modal Cambio de Clave -->
<div class="modal fade" id="mdChangePwd" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4  class="modal-title">Cambiar Clave</h4>
      </div>
      <div class="modal-body">
        <div class="row">
        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        	<input type="hidden" id="hdIdPersonal2">  
        		<div class="form-group">
        			<label>Nuevo Password</label>
        			<input id="txtPwd1" type="password" class="form-control" onkeyup="validarTxtPwd()"/>
        		</div>
        		<div class="form-group">
        			<label id="mensaje">Confirmar Password</label>
        			<input id="txtPwd2" type="password" class="form-control" onkeyup="validarTxtPwd()"/>
        		</div>
        		<div class="form-inline">
        			<div class="form-group">
        				<a id="btnupdatePassword" onclick="accionesPersonal('updatePassword')" class="btn btn-primary btn-sm">
		        			<i class="fa fa-floppy-o" aria-hidden="true"></i> CAMBIAR
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

	var vTeam = document.getElementById('hdIdTeam').value; //IdAmbiente
	var vIdUsuario = document.getElementById('hdIdEmpleado').value; //Usuario
	var vIdTeam = document.getElementById('smTeam').innerHTML;	//ambiente
	var vIdEmail = document.getElementById('smUsuario').innerHTML; //correoUsuario		
	var pstrImbrs = document.getElementById('idstrImbrs').value; //Obtiene el SI / NO del inicio de session
		
    $(document).ready(function(){
	//listSource metodo paraCargarComboAmbiente en base al correo del Usuario logeado 
	listSource(vIdEmail);	
	$('#idNavNotificacion').click(function(){ 	  
		buscarNotificaciones(2);
		buscarNotificacionesNuevas();		
		/*if($('#idNavNotificacion').hasClass('open') == true){
			buscarNotificaciones(2);
		}*/
	});
		
	
	//Abrir el menu dropdown-menu
	$('#dropdown-menu').click(function(){
		var comboIndex = document.getElementById("cboTeamHeader").length;		
		var idUserFooter = document.getElementById("idUserFooter");
		var idDivCombo = document.getElementById("idDivCombo");	
			if( pstrImbrs == "SI"){				
				document.getElementById("btnMenuCambiarPass").style.visibility = 'hidden';
			}
			//Si tiene mas de dos ambientes el combo es visible caso contrario se remueve el combo
			if(comboIndex > 2){	
				document.getElementById("cboTeamHeader").style.visibility = 'visible';
				document.getElementById("imgcboTeam").style.visibility = 'visible';		
			}else{
				idUserFooter.removeChild(idDivCombo);
			}
		
	});
	
	//Impide que se cierre el dropdown-menu <li class=user-footer/>
	$('li.user-footer').on('click', function(event){ 		
        event.stopPropagation();   
    }); 
	
});

	
	//Boton salir del menu
	function logout(){		
		var src = "ServletWHome";
		$.post(src, {op : "Logout"},	
			function(pdata) {
				if(pdata == "ok")
					{	
					javascript:location.reload();				
					}
		    });	
	}


	function buscarNotificaciones(ptipo){
		var src = "ServletNotificaciones";
		var htmlNotificacion = "";
			$.post(src, {
				strOperation : "listNotificacionesIni",
				iIdUsuario : vIdUsuario,
				itipo : ptipo
			}, function(pdata) {
			
				if(pdata != 'fail'){
				
					var obj = JSON.parse(pdata);

					if(obj.notificacionIni.length > 0){
						htmlNotificacion = "<a href='#' class='dropdown-toggle' data-toggle='dropdown'><i class='fa fa-bell-o'></i>";
					
						htmlNotificacion = htmlNotificacion + (obj.notificacionNuevosIni.length > 0 ? "<span class='label label-danger'>" + obj.notificacionNuevosIni.length + "</span>" : "");
						htmlNotificacion = htmlNotificacion + "</a>";
						
						htmlNotificacion = htmlNotificacion + "<ul class='dropdown-menu'><li class='header'>Tienes " + obj.notificacionIni.length + " nuevas notificaciones</li><li><ul class='menu'>";
						
						for(i = 0 ; i < obj.notificacionIni.length ; i ++){
							htmlNotificacion = htmlNotificacion + "<li><a href=\"javascript:recargarDiv('wcontentRight', '/WebOperations/dashboard/timeLineTicketAlertas.jsp')\"><i class='fa fa-ticket'></i><b>" + obj.notificacionIni[i].titulo + "</b><br/>" + obj.notificacionIni[i].contenido + "<br/>" + obj.notificacionIni[i].fecha + "</a></li>";
						
							if(obj.notificacionIni[i].tipo == "SCHEDULE"){
								var unique_id = $.gritter.add({
						            // (string | mandatory) the heading of the notification
						            title: 'TAREAS PENDIENTES !!!',
						            // (string | mandatory) the text inside the notification
						            text: 'Para ver la Tareas Pendientes por Cerrar dale click al siguiente Link <a href="/WebOperations/schedule/seleccionarschedule.jsp" target="_blank" style="color:#ffd777">TAREAS PENDIENTE</a>',
						            // (string | optional) the image to display on the left
						            image: 'resources/gritter/images/warning.png',
						            // (bool | optional) if you want it to fade out on its own or just sit there
						            sticky: true,
						            // (int | optional) the time you want it to be alive for before fading out
						            time: '',
						            // (string | optional) the class name you want to apply to that specific message
						            class_name: 'my-sticky-class'
						        });
							}
						}
						
						htmlNotificacion = htmlNotificacion + "</ul></li></ul>";
					}
					else{
						htmlNotificacion = "<a href='#' class='dropdown-toggle' data-toggle='dropdown'><i class='fa fa-bell-o'></i>";
						htmlNotificacion = htmlNotificacion + "</a>";
						htmlNotificacion = htmlNotificacion + "<ul class='dropdown-menu'><li class='footer'><a href='#'>No tienes notificaciones</a></li>";
					}						
					document.getElementById("idNavNotificacion").innerHTML = htmlNotificacion;					
				}
			});
	}
	
	
	function buscarNotificacionesNuevas(){
		var src = "ServletNotificaciones";
		var htmlNotificacion = "";
			$.post(src, {
				strOperation : "listNotificacionesNuevas",
				iIdUsuario : vIdUsuario
			}, function(pdata) {
			
				if(pdata != 'fail'){
				
					var obj = JSON.parse(pdata);

					if(obj.notificacionNuevo.length > 0){
						for(i = 0 ; i < obj.notificacionNuevo.length ; i ++){
							if(obj.notificacionNuevo[i].tipo == "SCHEDULE" && obj.notificacionNuevo[i].enviado == 0){
								var unique_id = $.gritter.add({
						            // (string | mandatory) the heading of the notification
						            title: 'TAREAS PENDIENTES !!!',
						            // (string | mandatory) the text inside the notification
						            text: 'Para ver la Tareas Pendientes por Cerrar dale click al siguiente Link <a href="/WebOperations/schedule/seleccionarschedule.jsp" target="_blank" style="color:#ffd777">TAREAS PENDIENTE</a>',
						            // (string | optional) the image to display on the left
						            image: 'resources/gritter/images/warning.png',
						            // (bool | optional) if you want it to fade out on its own or just sit there
						            sticky: true,
						            // (int | optional) the time you want it to be alive for before fading out
						            time: '',
						            // (string | optional) the class name you want to apply to that specific message
						            class_name: 'my-sticky-class'
						        });
							}
							else{
							if(obj.notificacionNuevo[i].enviado == 0)
								onNotificationButtonClick(obj.notificacionNuevo[i].titulo, obj.notificacionNuevo[i].contenido,obj.notificacionNuevo[i].img,"/WebOperations/whome.jsp")
		 						console.log('NOTIFICACION AHORA! ==> ' + obj.notificacionNuevo[i].enviado);
							}
						}
						buscarNotificaciones(1);
					}
				}
			});
	}
	
	
	//listSource metodo paraCargarCombo  
	function listSource(username){
	   var src = "ServletWTeam";
	   $.post(src, {strOperation : 'listUsuario', strIdEmpleado : username},
			function(pdata) {
				var obj = JSON.parse(pdata);				
				$('#cboTeamHeader option').remove();			
				$('#cboTeamHeader').append($('<option>', {value: '0',text : "seleccionar"}));			
								
				if(obj.team.length > 0){
					$.each(obj.team, function (i, item) {
					    $('#cboTeamHeader').append($('<option>', { 
					        value: item.idTeam,
					        text : item.descripcion
					    }));
					});					
				}				
	   });
	}
	
	
	//Abre Modal Pregunta al seleccionar el combo
	function openModalPregunta(){
	    var combo = document.getElementById("cboTeamHeader").value;//Id del ambiente a cambiar
	    var vTeam = document.getElementById('hdIdTeam').value;//Id del ambiente actual
	    var btnCambiar = document.getElementById("btnCambiar");	   
	    
		$(document).ready(function(){
			if(combo > 0){
				//Si el id del ambiente a cambiar es igual al id del ambiente actual oculta el boton a cambiar caso contrario lo muestra
				if(combo == vTeam){
					$('#mdPreguntaHeader').modal('show');
					$('#mensaje').text('Seleccione un ambiente distinto a ' + vIdTeam);
					document.getElementById('btnCambiar').style.display = 'none';
				}else{
					$('#mdPreguntaHeader').modal('show');	
					$('#mensaje').text('¿Esta seguro de cambiar de ambiente?');
					document.getElementById('btnCambiar').style.display = 'block';
				} 			    	
			}
		});		    
	}
	
		
	//boton cambiar del modal cambiar ambiente
	function cambiarAmbiente(){	
	    var src = "ServletWindex";
	    var pcombo = document.getElementById("cboTeamHeader").value;
		$.post(src, {strOperation : 'cambiarAmbiente', strEmail : vIdEmail, combo : pcombo, strImbrs : pstrImbrs},
	    	function(pdata) { 			
			  	javascript:location.reload();		     	
			});		
	}  
	
	
	//boton volver del modal cambiar ambiente
	function volverCboHeader(){
		document.getElementById('cboTeamHeader').options.selectedIndex = 0;	
	}
	
	
	//Seleccionar el boton para cambiar password
	function openModalUpdatePassword()	{	   
		$(document).ready(function(){
			//Abre el modal mdChangePwd limpia las cajas de texto, desabilita el boton para actualizar password.
			$('#mdChangePwd').modal('show');			
			$('#txtPwd1').val('');
			$('#txtPwd2').val('');			
			$('#btnupdatePassword').addClass("disabled");
			document.getElementById("txtPwd1").style.borderColor = "initial";
			document.getElementById("txtPwd2").style.borderColor = "initial";	
		});	    
	}	
	
	
	//Se activa en ambas cajas de texto
	function validarTxtPwd()
	{
		//Captura valor de la caja de texto txtPwd1, txtPwd2;
		var pwd1 = document.getElementById('txtPwd1').value;
		var pwd2 = document.getElementById('txtPwd2').value;
		
		//Si txtPwd1, txtPwd2 son nulas permanece desabilitado el boton para actualizar password
		if(pwd1 == '' || pwd2 == ''){
			$('#btnupdatePassword').addClass("disabled");	
			document.getElementById("txtPwd1").style.borderColor = "initial";
			document.getElementById("txtPwd2").style.borderColor = "initial";	
		}
		else{	
			//Si txtPwd1, txtPwd2 no son nulas y a la vez son iguales entonces se habilita el boton para actualizar password
			if(pwd1 == pwd2){
				document.getElementById("txtPwd1").style.borderColor = "green";
				document.getElementById("txtPwd2").style.borderColor = "green";				
				$('#btnupdatePassword').removeClass("disabled");
			}else {	//Si txtPwd1, txtPwd2 no son nulas y a la vez son diferentes entonces permanece desabilitado el boton para actualizar password
				document.getElementById("txtPwd1").style.borderColor = "red";
				document.getElementById("txtPwd2").style.borderColor = "red";
				$('#btnupdatePassword').addClass("disabled");
			}
		}
	}
	
	
	//accion personal de cambio de contrasenia
	function accionesPersonal(pOperacion)
	{			
		$(document).ready(function() {
		var src = "ServletWPersonal";
		$.post(src, {
					strOperation : pOperacion, 
					strIdEmpleado : vIdUsuario,
					iModalidad : 0,
					iArea : 0,
					iCargo : 0,
					iPerfil : 0,
					iTeam : 0,
					strClave : $('#txtPwd1').val()
					},
				function(pdata) {
					javascript:location.reload();
			     });		
			});	  	
	}	
	
</script>