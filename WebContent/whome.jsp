
<%
	if (session.getAttribute("usuarioLogin") == null) {
		response.sendRedirect("windex.jsp");
		return;
	} else {
		BeanSession objBeanSession = (BeanSession) session.getAttribute("usuarioLogin");
		if (objBeanSession == null) {
			response.sendRedirect("windex.jsp");
			return;
		} else
			objBeanSession = null;
	}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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



<title>IBM Operations</title>


<!-- SIDE CSS -->
<!-- bootstrap 3.3.7 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css">

<!-- font-awesome 4.7.0 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/font-awesome/css/font-awesome.min.css">
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/font-awesome/css/fontawesome-all.min.css"> --%>

<!-- Theme style -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/adminlte/css/AdminLTE.min.css">

<!-- bootstrap extra skin -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/adminlte/css/skins/skin-blue.min.css">

<!-- Pace Loader -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/pace/css/pace.flash.min.css">

<!-- DataTable -->
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/datetable/css/jquery.dataTables.min.css"> --%>
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/datetable/css/buttons.dataTables.css"> --%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/datatable2/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/datatable2/css/buttons.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/datatable2/css/responsive.bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/datatable2/css/fixedHeader.bootstrap.min.css">

<!-- DatatimePicker -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/datetimepicker/css/bootstrap-datetimepicker.min.css">

<!-- Select2 -->
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/select2/select2.min.css"> --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/select2/css/select2.min.css">

<!-- ClockPicker CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/clockpicker/css/bootstrap-clockpicker.min.css">

<!-- personalizado -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/custom/css/custom.css">

<!-- Librerias para Gritter -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/gritter/css/jquery.gritter.css" />
  
 
<!-- Librerias para Kartik -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/kartik-v-bootstrap-fileinput-d66e684/css/fileinput.css" media="all"/>

<!-- Custom CSS [SmartRequest] -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/custom/css/style.css">

<!-- Librerias para Feedback -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/feedBack/css/feedback.css" media="all"/>

<!-- Librerias para toggle -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap-toggle/css/bootstrap-toggle.min.css" />

<!-- <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet"> -->


<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" /> -->

<!-- SIDE JAVASCRIPT -->
<!-- jQuery 2.2.4 -->
<script src="<%=request.getContextPath()%>/resources/jquery/js/jquery-2.2.4.min.js"></script>

<!-- Bootstrap -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/adminlte/js/app.min.js"></script>

<!-- Pace Loader -->
<script src="<%=request.getContextPath()%>/resources/pace/js/pace.min.js" type="text/javascript"></script>

<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom.js"></script>

<!-- Favicon -->
<link rel="shortcut icon" type="image/jpg" href="<%=request.getContextPath()%>/resources/image/favicon.jpg"/>

<!-- DateTimePicker -->
<script src="<%=request.getContextPath()%>/resources/datetimepicker/js/moment.js" type="text/javascript"></script>

<!-- Select2 -->
<%-- <script src="<%=request.getContextPath()%>/resources/select2/select2.full.min.js" type="text/javascript"></script> --%>
<script src="<%=request.getContextPath()%>/resources/select2/js/select2.min.js" type="text/javascript"></script>

<!-- DataTable -->
<%-- <script src="<%=request.getContextPath()%>/resources/datetable/js/jquery.dataTables.min.js"></script> --%>
<%-- <script src="<%=request.getContextPath()%>/resources/datetable/js/dataTables.buttons.min.js"></script> --%>
<%-- <script src="<%=request.getContextPath()%>/resources/datetable/js/buttons.html5.min.js"></script> --%>
<script src="<%=request.getContextPath()%>/resources/datatable2/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/datatable2/js/dataTables.buttons.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/datatable2/js/buttons.flash.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/datatable2/js/jszip.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/datatable2/js/pdfmake.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/datatable2/js/vfs_fonts.js"></script>
<script src="<%=request.getContextPath()%>/resources/datatable2/js/buttons.html5.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/datatable2/js/buttons.print.min.js"></script>

<script src="<%=request.getContextPath()%>/resources/datatable2/js/dataTables.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/datatable2/js/buttons.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/datatable2/js/dataTables.responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/datatable2/js/responsive.bootstrap.js"></script>



<!-- JSZip -->
<%-- <script src="<%=request.getContextPath()%>/resources/jszip/js/jszip.min.js"></script>  --%>

<!-- DatetimePicker -->
<script src="<%=request.getContextPath()%>/resources/datetimepicker/js/bootstrap-datetimepicker.min.js"></script>

<!-- ClockPicker JS -->
<script src="<%=request.getContextPath()%>/resources/clockpicker/js/bootstrap-clockpicker.min.js"></script>

<!-- Librerias para Gritter -->
<script src="<%=request.getContextPath()%>/resources/gritter/js/jquery.gritter.js"></script>
<script src="<%=request.getContextPath()%>/resources/gritter/js/gritter-conf.js"></script>


<!-- Librerias para convertir de Base64String a File y generar descargar de archivo -->
<script src="<%=request.getContextPath()%>/resources/base64/js/download.js"></script>

<!-- Librerias para Kartik -->
<script src="<%=request.getContextPath()%>/resources/kartik-v-bootstrap-fileinput-d66e684/js/fileinput.js" type="text/javascript"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.5/js/fileinput.min.js"></script> -->


<!-- Librerias para iCheck -->
<script src="<%=request.getContextPath()%>/resources/iCheck/js/icheck.min.js" type="text/javascript"></script>

<!-- Librerias para feedBack -->
<%-- <script src="<%=request.getContextPath()%>/resources/feedBack/js/feedback.js" type="text/javascript"></script> --%>

<!-- Librerias para toggle -->
<script   src="<%=request.getContextPath()%>/resources/bootstrap-toggle/js/bootstrap-toggle.min.js" type="text/javascript" ></script>

<!-- <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script> -->

<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />

<meta charset="UTF-8" content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport' />

</head>

<body class="hold-transition skin-blue sidebar-mini sidebar-collapse" style="height: auto; min-height: 100%; font-family: 'Open Sans'; ">

	<!-- 		<div id="header"> -->
	<!-- 	<div class="wrapper"> -->
	<%@ include file="/template/common/wtcHeader.jsp"%>
	<!-- 	</div> -->

	<div class="wrapper row-offcanvas row-offcanvas-left">
		<div id="content">
			<div id="wcontentLeft">
				<%@ include file="/template/common/wtcContentLeft.jsp"%>
			</div>
			<div id="wcontentRight">
				<%@ include file="/template/common/wtcContentRight.jsp"%>
<%-- 					<%@ include file="/dashboard/wDashboard.jsp"%> --%>
			</div>
<%-- 			<% if(objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin().toLowerCase().contains("ajcanale@pe.ibm.com") ||objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin().toLowerCase().contains("cieza@pe.ibm.com") || objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin().toLowerCase().contains("nachavez@pe.ibm.com") || objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin().toLowerCase().contains("kberru@pe.ibm.com") || objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin().toLowerCase().contains("jsantama@pe.ibm.com") || objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin().toLowerCase().contains("mcamacho@pe.ibm.com") || objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin().toLowerCase().contains("jazmin.luna@ibm.com") ||objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin().toLowerCase().contains("dcazo@pe.ibm.com") ||objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin().toLowerCase().contains("rcabanas@pe.ibm.com") ||objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin().toLowerCase().contains("pvitorc@pe.ibm.com") ||objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin().toLowerCase().contains("mario.canales@ibm.com") ||objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin().toLowerCase().contains("mhuapaya@pe.ibm.com") ||objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin().toLowerCase().contains("felix.acuna@ibm.com") ||objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin().toLowerCase().contains("mcadillo@pe.ibm.com") ||objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin().toLowerCase().contains("rbustama@pe.ibm.com") ||objBeanSessionCHeader.getObjBeanPersonal().getStrIdLogin().toLowerCase().contains("mhidalgo@pe.ibm.com")){ %>  --%>
<%-- 				<%@ include file="/template/common/wtcFooter.jsp" %> --%>
<%-- 			<%} %> --%>
		</div>
	</div>
</body>

	<script>
		var AdminLTEOptions = {
			animationSpeed : 400,
			sidebarSlimScroll : false
		};
	</script>
</html>