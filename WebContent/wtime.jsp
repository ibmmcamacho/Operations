<%@page import="com.pe.ibm.bean.BeanSession"%>
<%
	BeanSession objBeanSessionCHeader = new BeanSession();
	objBeanSessionCHeader = (BeanSession) session.getAttribute("usuarioLogin");
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8" content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<title>Marcador de Asistencia</title>

<!-- bootstrap 3.0.2 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css">
<!-- font-awesome 4.7.0 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.min.css">
<!-- bootstrap extra -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/adminlte/css/AdminLTE.min.css">
<!-- DigitalClock -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/custom/css/digitalClock.css">
<!-- personalizado -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/custom/css/custom.css">
 

<!-- Fuente -->
<link href="https://fonts.googleapis.com/css?family=Didact+Gothic" rel="stylesheet">

<!-- jQuery 2.2.4 -->
<script src="resources/jquery/js/jquery-2.2.4.min.js" type="text/javascript"></script>
<script src="resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="resources/adminlte/js/app.js" type="text/javascript"></script>
<link rel="shortcut icon" type="image/jpg" href="<%=request.getContextPath()%>/resources/image/favicon.jpg"/>

<script src="<%=request.getContextPath()%>/resources/custom/js/constellation.js" type="text/javascript"></script>

</head>
<%-- <body style="background-image: url('<%=request.getContextPath()%>/resources/image/bg/bgwtime.jpg') no-repeat center top"> --%>
<!-- <body style="background-image: url('https://s-media-cache-ak0.pinimg.com/originals/6f/63/d2/6f63d2367fcfc11735f8cae8606b3350.jpg') no-repeat center top"> -->

<body>
<input id="hdiTeam" type="hidden">
<input id="hdstrTeam" type="hidden">
<input id="hdiHorario" type="hidden">
  
  
<div style="position: absolute;"><canvas width="100%" heigth="100%"></canvas></div>
  
<div class="wrapper">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="pull-right">
			
			<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- User Account: style can be found in dropdown.less -->
				<%if(objBeanSessionCHeader != null){%>
				<li class="dropdown user user-menu" style="background: rgba(210,214,222, 0.2); border-radius:5px;">
					<a id="dusu" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" style="color: white;">
						<img src="<%=objBeanSessionCHeader.getObjBeanPersonal().getStrPhoto()%>" class="user-image" alt="Usuario"> 
						<span class="hidden-xs">Bienvenido <%=objBeanSessionCHeader.getObjBeanPersonal().getStrNombre()%>
							<i class="caret"></i>
						</span>
					</a>
					<ul class="dropdown-menu" aria-labelledby="dusu"">
						<!-- User image -->
						<li class="user-header" style="color: #000;">
							<img class="img-circle" src="<%=objBeanSessionCHeader.getObjBeanPersonal().getStrPhoto()%>" alt="User"/>
							<p style="color: #000;">
							<input id="hdIdTeam" type="hidden" value="<%=objBeanSessionCHeader.getObjBeanPersonal().getiTeam()%>">
							<input id="hdIdEmpleado" type="hidden" value="<%=objBeanSessionCHeader.getObjBeanPersonal().getiIdEmpleado()%>">
								<%=objBeanSessionCHeader.getObjBeanPersonal().getStrNombre() + " " + objBeanSessionCHeader.getObjBeanPersonal().getStrApPaterno() + " " + objBeanSessionCHeader.getObjBeanPersonal().getStrApMaterno()%>
								<small><%=objBeanSessionCHeader.getObjBeanPersonal().getStrCargo()%></small>
							</p>
						</li>
						
					  <li class="user-body" style="color: #000;">
		                <div class="row">
		                  <div class="col-xs-6 text-center">
		                    <a href="#"><%=objBeanSessionCHeader.getObjBeanPersonal().getStrTeam()%></a>
		                  </div>
		                  <div class="col-xs-6 text-center">
		                    <a href="#"><span id="smUsuario"><%=objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin()%></span></a>
		                  </div>
		                </div>
		                <!-- /.row -->
		              </li>
						
						<li class="user-footer">
							<div class="pull-left">
								<label></label>
			                </div>
							<div class="pull-right">
							
								<a onclick="logout()" href="#"
									class="btn btn-default btn-flat">Salir</a>
							</div>
						</li>
					</ul>
				</li>
				<%} else { %>
				<li class="dropdown user user-menu" style="background: rgba(210,214,222, 0.2); border-radius:5px;">
					<a id="dusu" target="_blank" href="<%=request.getRequestURL().toString().replace("wtime.jsp", "")%>" style="color: white;">
						<i class="fa fa-user-circle-o fa-lg" aria-hidden="true"></i>
						<span>Iniciar Sessión</span>
					</a>
				</li>
				<% } %>
			</ul>
		</div>
		</div>
	</div>
</div>
	<div style="padding-top: 5%"></div>

	<div class="container" style="background: rgba(210,214,222, 0.2); border-radius:5px;">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
				<img src="resources/image/IBM128.png" alt="IBM">
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
				<label id="lblFecha" class="dateString"></label>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<table align="center" cellspacing="0" cellpadding="0" border="0">
					<tr>
						<td rowspan="2" class="clock" id="dc"></td>
						<td class="clocklg" id="dc_hour"></td>
					</tr>
					<tr>
						<td class="clocklg" id="dc_second"></td>
					</tr>
				</table>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center">
						<div class="form-inline">
							<div class="form-box">
								<div class="body">
								<div id="load"></div>
								<div class="form-group has-feedback">
								    <input id="idusuario" type="text" class="form-control input-lg" size="12" maxlength="50" placeholder="Código" />
								    <i class="fa fa-id-badge fa-2x form-control-feedback" aria-hidden="true"></i>
								</div>
								
								<div id="dvHorario" class="form-group has-feedback has-feedback-left">
									<select id="cboHorario" class="form-control input-lg">
										<option value="0">Seleccionar</option>
									</select>
									<i class="fa fa-clock fa-2x form-control-feedback" aria-hidden="true"></i>
								</div>
								
								<div class="form-group has-feedback">
								    <input id="obs" type="text" class="form-control input-lg" size="12" maxlength="300" placeholder="Comentario" />
								    <i class="fa fa-comment-o fa-2x form-control-feedback" aria-hidden="true"></i>
								</div>
								
								<div class="form-group">
									<div class="input-group">
										<i id="iloader" class="fa fa-cog fa-spin fa-2x fa-fw" style="color: #fff !important; visibility: hidden;" aria-hidden="true"></i>
										<span class="sr-only">Registrando...</span>
										
										<a id="btnin" class="btn btn-success btn-lg" onclick="executeReg('in')" role="button" style="background-color: rgba(68, 157, 68, 0.6);"> 
											<i class="fa fa-sign-in fa-lg" aria-hidden="true"></i> Ingreso
										</a> &nbsp; 
										<a id="btnout" class="btn btn-danger btn-lg" onclick="executeReg('out')" role="button" style="background-color: rgba(217, 83, 79, 0.6);"> 
											<i class="fa fa-sign-out fa-lg" aria-hidden="true"></i> Salida
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="user-padding"></div>
				<div class="user-padding"></div>
				
				<label class="label label-info"></label>
				
				<div class="user-padding"></div>
				<div class="user-padding"></div>
				
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<label id="lblmessage" class="h4" style="color: white;"></label>
				</div>
				
				<div class="user-padding"></div>
				<div class="user-padding"></div>
				<div class="user-padding"></div>
				<div class="user-padding"></div>
				
				<div id="dvUsers" class="col-xs-12 col-sm-10 col-md-12 col-lg-12 text-center">
					
			</div>
		</div>
		
<!-- 		<div class="row"> -->
<!-- 			<div id="dvUsers" class="col-xs-12 col-sm-10 col-md-12 col-lg-12 text-center"> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</div>
	</div>
	</div>
	</div>
</body>

<!-- Modal Insertar -->
<div class="modal fade" id="mdNuevo" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    	<div class="box box-widget widget-user" style="margin-bottom: 0px;">
        	<div class="widget-user-header bg-blue-gradient text-center">
            	<h3 class="widget-user-username">TEAM</h3>
            </div>
        <div class="widget-user-image img-responsive">
        	<img id="imgFoto1" class="img-circle img-lg" src="resources/image/imgSeleccion.jpg" alt="Usuario">
        </div>
        <div class="box-body">
        	
					<br/><br/>
               			<h5 class="description-header">Selección de Team</h5>
               			<div id="dvTeams"></div>
                   </div>
                </div>
             </div>
    	</div>
  	</div>

<script type="text/javascript">


// var viIdEmpleado = document.getElementById('hdIdEmpleado').value;

$(document).ready(function() {
	$('#hdiTeam').val(0);
	listTeams();
	$('#mdNuevo').modal('show');
});

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

function executeReg(type)
{
	$(document).ajaxStart(function() { 
		$('#load').removeClass('overlay');
		$('#load').addClass('overlay');
		document.getElementById('load').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
	});
	
	$(document).ready(function() {
	document.getElementById('iloader').style.visibility = 'visible';
	var src = "ServletWTime";
	try
	{
		if($('#hdiTeam').val() == '0'){
			$('#mdNuevo').modal('show');
		}
		else{
			document.getElementById('btnin').disabled = true;
			document.getElementById('btnout').disabled = true;
			
			var user = document.getElementById('idusuario').value;
			var hours = document.getElementById('cboHorario').value;
			var strObs = document.getElementById('obs').value;
			var piHorario = document.getElementById('hdiHorario').value;
			
			if(user.trim() == "")
			{
				alert("Por favor ingrese un su código antes de registrar.");
			}
			else
			{
			$.post(src, {username: user, operacion: type, hour : hours, iTeam : $('#hdiTeam').val(), obs : strObs, iHorario : piHorario},
					function(pdata) {
					var obj = JSON.parse(pdata);
					  document.getElementById('lblmessage').innerHTML = obj.message;
					  document.getElementById('idusuario').value = '';
					  document.getElementById('obs').value = '';
					  listUsers();
			});
			}
		}
	}
	catch(err)
	{
		alert('registro ==> ' + err.message);
	}
	finally
	{
		document.getElementById('iloader').style.visibility = 'hidden';
	}
	
	document.getElementById('load').innerHTML = '';
	$('#load').removeClass('overlay');
	});
}

function listSelect(idTeam,strTeam)
{
// 	$(document).ajaxStart(function() { Pace.restart(); });
	$(document).ready(function() {
		$('#hdiTeam').val(idTeam);
		$('#hdstrTeam').val(strTeam);
		$('#mdNuevo').modal('hide');
		listHorario();
		listUsers();
		validarHorario();
	});
}

function validarHorario(){
	$(document).ready(function() {
		var src = "ServletWTime";
		$.post(src, {operacion : 'validarHorario', iTeam : $('#hdiTeam').val()},
				function(pdata) {
			if(pdata == 'hide')
				{
				$('#dvHorario').removeClass('hide');
				$('#dvHorario').addClass('hide');
				$('#hdiHorario').val('0');
				}
			else{
				$('#dvHorario').removeClass('hide');
				$('#hdiHorario').val('1');
			}
		});
	});
}

function listTeams()
{
// 	$(document).ajaxStart(function() { Pace.restart(); });
	$(document).ready(function() {
		
		var src = "ServletWTeam";
 		$.post(src, {strOperation : 'list'},
//		$.post(src, {strOperation : 'listPetro'},
				function(pdata) {
					var strHTML = "";
			  		var obj = JSON.parse(pdata);

			  		if(obj.team.length > 0)
			  		{
			  		if(obj.team[0].idTeam != "null")
			  			{
			  				strHTML = "<div class=\"row\">";
					  		for(i = 0 ; i < obj.team.length ; i ++)
					  			{
					  			strHTML += "<div class=\"col-xs-12 col-sm-6 col-md-6 col-lg-6\">" +
					  			"<div class=\"info-box\">" +
									"<a href=\"#\" onclick=\"listSelect('" + obj.team[i].idTeam + "','" + obj.team[i].descripcion + "')\"><span class=\"info-box-icon bg-aqua\" style=\"padding:20px\"><i class=\"fa fa-database fa-lg\" aria-hidden=\"true\"></i></span></a>" +
									"<div class=\"info-box-content\">" +
										"<span class=\"info-box-text\">TEAM</span>" +
										"<span class=\"info-box-number\">" + obj.team[i].descripcion + "</span>" +
									"</div>" +
								"</div></div>";
					  			}
					  		strHTML += "</div>";
			  			}
			  		}
			  		document.getElementById('dvTeams').innerHTML = strHTML;
		});
	});
}

function listImage(pstrIdPersonal,piTeam,img)
{
	var strImage;
// 	$(document).ajaxStart(function() { Pace.restart(); });
	$(document).ready(function() {
	
		var src = "ServletWPersonal";
		strImage = $.post(src, {strOperation : 'listImage', strIdEmpleado : pstrIdPersonal, iTeam : piTeam},
				function(pdata) {
				  var obj = JSON.parse(pdata);
					img.attr('src',obj.image);
		});
	});
	return strImage;
}

function listUsers()
{
// 	$(document).ajaxStart(function() { Pace.restart(); });
	var src = "ServletWTime";
	$.post(src, {operacion: "users", iTeam : $('#hdiTeam').val()},
			function(pdata) {
			
	  		var strHTML = "";
	  		var obj = JSON.parse(pdata);
	  		
	  		var f=new Date();
    		var fechaActual = (f.getFullYear() < 10 ? '0' + f.getFullYear() : f.getFullYear()) + "-" + ((f.getMonth() + 1) < 10 ? '0' + (f.getMonth() + 1) : (f.getMonth() + 1)) + "-" + ((f.getDate()) < 10 ? '0' + (f.getDate()) : (f.getDate())); 
	  		
	  		if(obj.length > 0)
	  		{
	  		if(obj[0].nombre != "null")
	  			{
			  		strHTML = "<div class=\"box box-primary\">" +
								"<div class=\"box-header\">" +
									"<div class=\"box-title\">" +
										"<i class=\"fa fa-cog fa-spin fa-lg fa-fw\"></i> <span class=\"sr-only\">Loading...</span> Usuarios conectados, TEAM: <strong>" + $('#hdstrTeam').val() + 
									"</strong></div>" +
								"</div>" +
							  "<div class=\"box-body\">";
			  		
			  		for(i = 0 ; i < obj.length ; i ++)
			  			{
			  			
			  			strHTML += "<div class=\"infobox\" style=\"background: #fff; border: 0;\">" +
						"<div class=\"row text-center col-centered\">" +
							"<div class=\"col-xs-12 col-sm-12 col-md-12 col-lg-12\">" + 
								"<div class=\"row\">" + 
		                    	   "<div class=\"box " + (fechaActual == obj[i].fechaEntrada ? "box-success" : "box-danger") + " widget-user-2\" style=\"margin-bottom:0px; float:none;\">" +
											"<div class=\"widget-user-header\" style=\"padding:10px;\">" + 
										    	"<div class=\"widget-user-image img-responsive\">" +
										        	"<img class=\"img-circle\" src=\"resources/image/personal/default_avatar.jpg\" alt=\"" + obj[i].nombre + "\" style=\"float:none;height: 65px; width: 65px;\">" +
										        "</div>" +
										    "</div>" +
										    "<label class=\"label label-info\"><i class=\"fa fa-id-badge\" aria-hidden=\"true\"></i> " + obj[i].serial + "</label> </br>" +
									    	"<label>" + obj[i].nombre + "</label> </br>" +
									    	"<label>" + obj[i].area + "</label> </br>" +
											"<h5><label class=\"label " + (fechaActual == obj[i].fechaEntrada ? "label-success" : "label-danger") + "\"><i class=\"fa fa-calendar\" aria-hidden=\"true\"></i> " + obj[i].fechaEntrada + "</label> <label class=\"label " + (fechaActual == obj[i].fechaEntrada ? "label-success" : "label-danger") + "\"><i class=\"fa fa-clock-o\" aria-hidden=\"true\"></i> " + obj[i].horaEntrada + "</label> </h5>" +
									    "</div>" +
									"</div>" +
								"</div>" +
							"</div>" +
						"</div>";
						console.log(fechaActual + ' -- ' + obj[i].fechaEntrada);
			  			}
			  			
			  		strHTML += "</div></div>";
	  			}
	  		else
	  			{
	  			strHTML = "";
	  			}
	  		document.getElementById('dvUsers').innerHTML = strHTML;
		  		
		  			$('#dvUsers img').each(function (i)
		  			        {
		  						listImage(obj[i].idEmpleado,$('#hdiTeam').val(),$(this));
		  			        });
	  		}
  });
}
</script>


<script src="resources/custom/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="resources/custom/js/jquery.backstretch.min.js" type="text/javascript"></script>
<script src="resources/custom/js/login.js" type="text/javascript"></script>

<!-- DigitalClock -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/custom/js/digitalClock.js"></script>

</html>