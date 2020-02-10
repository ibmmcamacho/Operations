<%@page import="com.pe.ibm.bean.BeanSession"%>
<%
	BeanSession objBeanSession = new BeanSession();
	if(session.getAttribute("usuarioLogin") != null)
	{
		objBeanSession = (BeanSession) session.getAttribute("usuarioLogin");
		if (objBeanSession != null) {
			response.sendRedirect("whome.jsp");
			return;
		} else
			objBeanSession = null;
	}
	
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-101093319-1', 'auto');
  ga('send', 'pageview');
</script>




<meta charset="UTF-8" content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
<title>IBM Operations</title>

<!-- bootstrap 3.0.2 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css">
<!-- font-awesome 4.7.0 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.min.css">
<!-- bootstrap extra -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/adminlte/css/AdminLTE_login.css">
<!-- personalizado -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/custom/css/custom.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/adminlte/css/AdminLTE.min.css">

<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/pace/css/pace.flash.min.css"> --%>

<%-- <script src="<%=request.getContextPath()%>/resources/pace/js/pace.min.js" type="text/javascript"></script> --%>



<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
<link rel="shortcut icon" type="image/jpg" href="<%=request.getContextPath()%>/resources/image/favicon.jpg"/>
</head>
<body style="overflow hidden; background #111;  background: url('<%=request.getContextPath()%>/resources/image/bg/backgroundPortal.jpg') no-repeat fixed center; background-size: cover;">
	<br />
	<br />
<!-- 	<div class="global-overlay" style="opacity: 1; transform: translateX(10%);"> -->
<!-- 		<canvas id="constellationel" width="1600" height="809"></canvas> -->
<!-- 		<div class="overlay skew-part"></div> -->
<!-- 	</div> -->

	<div style="position: absolute;"><canvas id="cvBg" width="100%" heigth="100%"></canvas></div>

	<div class="container">
		<div class="row">
			<div class="col-lg-12">
			<form class="login-form" method="POST" action="ServletWindex">
				<input id="hdUser" name="hdUser" type="hidden">
				<div class="form-box" id="login-box">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<h1 class="text-center" style="color: #FFF;"><b>Portal Operations</b></h1>
						
						<div class="body" style="background: rgba(0,0,0,0.8); border-radius:5px 5px 0px 0px;">
							<div id="load"></div>
<!-- 							<div class="text-center"> -->
<!-- 								<img src="resources/image/IBM128.png"> -->
<!-- 							</div> -->
							
							<div class="h2 text-center" style="color:white" >Ingresa</div>
							
							<div class="form-group text-center">
<%-- 								<label id="lblMsg" class="label label-info"><%=(session.getAttribute("usuarioLogin") != null) ? objBeanSession.getStrMessage() : ""%></label> --%>
								<label id="lblMsg" class="label label-info"></label>
							</div>

							<div id="group1" class="form-group">
								<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
<!-- 								<label class="control-label visible-ie8 visible-ie9" style="color: white;">User</label> -->

								<div class="input-group">
									<div class="input-group-addon">
										<span class="fa fa-user"></span>
									</div>
									<input class="form-control placeholder-no-fix" type="text"
										autocomplete="off" placeholder="Usuario" name="username" id="IdUserName"
										value="" />
								</div>
							</div>
							<div id="group2" class="form-group">
<!-- 								<label class="control-label visible-ie8 visible-ie9" style="color: white;">Password</label> -->

								<div class="input-group">
									<div class="input-group-addon">
										<span class="fa fa-key"></span>
									</div>
									<input class="form-control placeholder-no-fix" type="password"
										autocomplete="off" placeholder="Contraseña" name="password" id="strPwd"
										value="" />
								</div>
							</div>
							<div id="group3" class="form-group hidden">
								<div class="box box-widget" style="background: rgba(255, 255, 255, 0.7);">
									<div class="box-body">
										<div class="direct-chat-msg">
					                      <div class="direct-chat-info clearfix">
					                        <span id="spNombre" class="direct-chat-name pull-left" style="color: #035297 !important;"></span>
					                        <span id="spEmail" class="direct-chat-name pull-left" style="color: !important;"></span>
					                      </div>
					                      <canvas id="imgFoto1" class="direct-chat-img" width="40" height="40"></canvas>
						                      <div id="dvMsg" class="direct-chat-text">
						                      </div>
					                    </div>	
									</div>
								</div>
							</div>
							<div id="group4" class="form-group hidden">
								<label class="control-label visible-ie8 visible-ie9" style="color: white;">Source</label>
								<div class="row">
									<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
										<div class="input-group">
											<div class="input-group-addon">
												<span class="fa fa-database"></span>
											</div>
											<select class="form-control placeholder-no-fix" id="cboTeam" name="cboTeam">
												<option value="0">Seleccionar</option>
											</select>
										</div>
									</div>
									<div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
<!-- 										<button id="btnIngresar" type="submit" class="btn btn-success btn-circle" style="background: rgba(0, 176, 218, 0.9);"><i class="glyphicon glyphicon-log-in"></i></button> -->
										<button id="btnIngresar" type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-new-window"></i> In</button>
									</div>
								</div>
							</div>
							<div id="group5" class="form-inline">
								
<!-- 								<div style="display: none;"> -->
									<div class="form-group">
										   <div class="material-switch pull-right">
					                            <input id="chkImbrs" type="checkbox" checked="checked"/>
					                            <label for="chkImbrs" class="label-primary"></label>
					                            <span class="label">IBMer/Maximo</span>
					                        </div>
									</div>
<!-- 								</div> -->

									<div class="form-group pull-right">
										<a id="btnEnviar" href="#" class="btn btn-primary" onclick="login()" style="background: rgba(0, 176, 218, 0.9);">
											<i class="fa fa-sign-in"></i> Enviar
										</a>
									</div>
									<br/>
									<br/>
<!-- 								<div class="text-center" style="color:#FFF"><strong>v 1.5.0.1</strong></div> -->
							</div>
							
					</div>
					<div class="body" style="background: rgba(0, 176, 218, 0.9); border-radius: 0px 0px 5px 5px; padding: 5px 10px; ">
					<div id="group6" class="form-group" style="margin-top: 5px; margin-bottom: 5px;">
<!-- 								<p> -->
				                	<a href="windex.jsp"><img src="resources/image/ibmlogo.png" height="30px"></a>
<!-- 				                </p> -->
							</div>
					</div>
					<center>
<!-- 				                FORMATO  v[año].[mes].[dia].[INICIALES DE LA PERSONA QUE DESPLIEGUA][NUMERO DEL DESPLIEGUE EN EL DIA] -->					
						<div class="copyright" style="color: white">2020 &copy; IBM - Operations _ v20.02.05.MC1</div>
					</center>
				</div>
			</div>
			</form>
		</div>
	</div>
	</div>
	<br/>
	<br/>
  

	<!-- jQuery 2.2.4 -->
	<script src="<%=request.getContextPath()%>/resources/jquery/js/jquery-2.2.4.min.js"></script>
<!-- 	<script src="resources/custom/js/jquery.validate.min.js" type="text/javascript"></script> -->
<!-- 	<script src="resources/custom/js/jquery.backstretch.min.js" type="text/javascript"></script> -->
	
<!-- 	<script src="resources/custom/js/login.js" type="text/javascript"></script> -->
	<!-- Bootstrap -->
	<!-- 	<script src="../../js/bootstrap.min.js" type="text/javascript"></script> -->
	
	<script src="<%=request.getContextPath()%>/resources/custom/js/constellation.js" type="text/javascript"></script>

</body>

<script type="text/javascript">
$(document).ready(function(){
		
	  $(window).keydown(function(event){
	    if(event.keyCode == 13) {
	      if(!$('#group1').hasClass('hidden')){
// 	      	login_redirect();
			event.preventDefault();
		    login();
		    return false;
	      }
// 	      else{
// 	      	event.preventDefault();
// 		    alert($('#group1').hasClass('hidden') + ' ==> FALSE');
// 		    login();
// 		    return false;
// 	      }
	    }
	  });
});



function listSource(username){
	var src = "ServletWTeam";
	$.post(src, {strOperation : 'listUsuario', strIdEmpleado : username},
			function(pdata) {
				var obj = JSON.parse(pdata);
				
				$('#cboTeam option').remove();
				$('#cboTeam').append($('<option>', {value: '0',text : 'Seleccionar'}));
				
				if(obj.team.length > 0){
					$.each(obj.team, function (i, item) {
					    $('#cboTeam').append($('<option>', { 
					        value: item.idTeam,
					        text : item.descripcion
					    }));
					});
					$('#dvMsg').text("Seleccione el ambiente a ingresar");
				}
				else
					$('#dvMsg').text("No tiene acceso en el sistema, por favor contactese con el administrador.");
				
	 			if(obj.team.length == 1){
	 				document.getElementById("cboTeam").selectedIndex = "1";
					document.getElementById("btnIngresar").click();
	 			}
	 			else{
	 				$('#group1').removeClass('hidden');
					$('#group1').addClass('hidden');
					$('#group2').removeClass('hidden');
					$('#group2').addClass('hidden');
					
					$('#group3').removeClass('hidden');
					$('#group4').removeClass('hidden');
					
					$('#group5').removeClass('hidden');
					$('#group5').addClass('hidden');
					
					document.getElementById('load').innerHTML = '';
					$('#load').removeClass('overlay');
	 			}
	});
}


function login(){
	$(document).ajaxStart(function() { 
		$('#load').removeClass('overlay');
		$('#load').addClass('overlay');
		document.getElementById('load').innerHTML = '<i class="fa fa-refresh fa-spin"></i>';
	});
	
	
	var src = "ServletWindex";
	var pstrIdLogin = document.getElementById("IdUserName").value;
	var pstrPwd = document.getElementById("strPwd").value;
	var pstrImbrs = document.getElementById("chkImbrs").checked ? 'SI': 'NO';
	$.post(src, {strOperation : 'autenticacion', strIdLogin : pstrIdLogin, strPwd : pstrPwd, strImbrs : pstrImbrs},
			function(pdata) {
			
				var obj = JSON.parse(pdata);
				
				if(obj.Usuario[0].codigo == '0'){
				
					$('#spNombre').text(obj.Usuario[0].NombreCompleto);
					$('#spEmail').text(obj.Usuario[0].cuenta);
					
					showImage(pstrIdLogin);
					
					$('#hdUser').val(pstrIdLogin);
					$('#lblMsg').text('');
					
					listSource(pstrIdLogin);
		 			
				}
				else if(obj.Usuario[0].codigo == '1'){
					$('#lblMsg').text('La contraseña o usuario incorrecto.');
					document.getElementById('load').innerHTML = '';
					$('#load').removeClass('overlay');
				}
				else{
					$('#lblMsg').text('Hubo un error al validar su usuario, vuelva a intentarlo por favor.');
					document.getElementById('load').innerHTML = '';
					$('#load').removeClass('overlay');
				}
				
			});
}

function login_redirect(){
	var src = "ServletWindex";
	var pstrIdLogin = document.getElementById("IdUserName").value;
	var piTeam = document.getElementById("cboTeam").value;
	$.post(src, {strOperation : 'ingresar', strIdLogin : pstrIdLogin, iTeam : piTeam, password : document.getElementById("strPwd").value},
			function(pdata) {
			var obj = JSON.parse(pdata);
			
			alert(obj.Usuario.codigo + ' | '+ obj.Usuario.cuenta + ' | '+ obj.Usuario.NombreCompleto + ' | '+ obj.Usuario.Id);
			});
}


function showImage(pstrIdLogin)
{
	var canvas = document.getElementById("imgFoto1");
	canvas.width = 40;
    canvas.height = 40;
	var ctx = canvas.getContext("2d");
	var img = new Image();
// 	img.src = "http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=" + pstrIdLogin;
//  	ctx.drawImage(img, 0, 0, 300,150);
	
	img.onload = function(){
		ctx.drawImage(img, 0, 0, 40,40);
		}
	img.src = "http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=" + pstrIdLogin;
};
</script>

</html>