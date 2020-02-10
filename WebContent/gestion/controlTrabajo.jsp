<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Customizer -->
<script src="<%=request.getContextPath()%>/resources/custom/js/custom_execution.js"></script>
</head>
<body>



<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
	<section class="content-header">
	<h1>
		Gestión <small>Control de Actividades TWS</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-th-large"></i> Gestión</a></li>
		<li class="active">Control de Actividades TWS</li>
	</ol>
	</section> <!-- Main content --> 
	<section class="content"> <!-- top row -->
	<input type="hidden" id="hdControlTrabajo1" value="0">
	
	
<!-- 	<div class="row"> -->
<!-- 		<div class="col-lg-3 col-xs-6"> -->
<!-- 		    small box -->
<!-- 		    <div class="small-box bg-green"> -->
<!-- 		  		<a class="small-box-footer">Desarrollo Web</a> -->
<!-- 		    <div class="inner"> -->
		  
<!-- 		    <h3>53<sup style="font-size: 20px">%</sup></h3> -->
		
<!-- 		    <p>Pacifico</p> -->
<!-- 		    </div> -->
<!-- 		    <div class="icon" style="padding:20px 0px 0px 0px"> -->
<!-- 		    	<i class="fa fa-cog fa-spin fa-fw"></i> -->
<!-- 		    </div> -->
<!-- 		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a> -->
<!-- 		    </div> -->
<!-- 	    </div> -->
<!-- 	</div> -->
	
	
	
	
	<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	<div class="box">
    <div class="box-header with-border">
    <h3 class="box-title">Control de Iniciativas de Mejoras</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
    	
    	<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<a class="btn btn-primary" data-toggle="modal" data-target=".modalControlTrabajo"><i class="fa fa-file-o" aria-hidden="true"></i> Nuevo plan de trabajo</a>
			</div>
		</div>
    	</br>
    	<div class="row">
		<div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	    <div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	    <div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	    <div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	</div>
	
	<div class="row">
		<div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	    <div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	    <div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	    <div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	</div><div class="row">
		<div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	    <div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	    <div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	    <div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	</div><div class="row">
		<div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	    <div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	    <div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	    <div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	</div><div class="row">
		<div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	    <div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	    <div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	    <div class="col-lg-3 col-xs-6">

		    <div class="small-box bg-green">
		  		<a class="small-box-footer">Desarrollo Web</a>
		    <div class="inner">
		  
		    <h3>90<sup style="font-size: 20px">%</sup></h3>
		
		    <p>Pacifico</p>
		    <span>
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=RDELASCASAS@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Renzo De las Casas Jaramillo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=MCAMACHO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Manuel Camacho" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=DCAZO@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="David Cazo" style="height: 25px; width: 25px">
		    <img src="http://w3-pics.ibm.com/bluepages/photo/Photo.jsp?email=YAVELLAN@PE.IBM.COM" class="direct-chat-img" data-toggle="tooltip" data-container="body" data-placement="bottom" title="" data-original-title="Yisella Avellaneda" style="height: 25px; width: 25px">
		    </span>
		    </br>
		    </div>
		    <div class="icon" style="padding: 40px 0 0 0">
		    	<i class="fa fa-cog fa-spin fa-fw"></i>
		    </div>
		    <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
		    </div>
	    </div>
	</div>
	
    	
    </div>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    <div class="modal fade modalControlTrabajo" id="mdDetalleControlTrabajo" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="tituloControlTrabajo">Iniciativa de Mejora</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						
						<div class="box box-primary">
							<div class="box-header with-border">
								<i class="fa fa-teal"></i>
								<h3 class="box-title">GENERAL</h3>
							</div>
						<!-- /.box-header -->
							<div class="box-body">
								<table>
									<tbody>
										<tr>
											<td>Proyecto</td>
											<td>
												<input id="txtResumenProyecto" type="text" class="form-control input-sm">
											</td>
										</tr>
										<tr>
										<td colspan="2">
										<p></p>
										</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="form-inline">
													<div class="form-group">Fecha Inicio</div>
													<div class="form-group">
														<div class="input-group">
															<input id="txtGeneralFechaInicio" type="text" class="form-control">
																<span class="input-group-addon">
																<span class="fa fa-calendar-o"></span>
																</span>
														</div>
													</div>
													<div class="form-group">Fecha Fin</div>
													<div class="form-group">
														<div class="input-group">
															<input id="txtGeneralFechaFin" type="text" class="form-control">
																<span class="input-group-addon">
																<span class="fa fa-calendar-o"></span>
																</span>
														</div>
<!-- 														<input type="text" class="form-control input-sm"> -->
													</div>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="box box-primary">
							<div class="box-header with-border">
								<i class="fa fa-teal"></i>
								<h3 class="box-title">DETALLE</h3>
							</div>
						<!-- /.box-header -->
							<div class="box-body">
								<table class="table" border="0">
									<tbody>
										<tr>
											<td>Owner</td>
											<td>
											<select id="cboDetalleOwner" class="form-control input-sm cbo2" style="width: 100%">
												<option value="0">--Seleccionar--</option>
												<option value="1">Jean Paul</option>
												<option value="2">Jorge</option>
												<option value="3">Efrain</option>
												<option value="4">David Cazo</option>
												<option value="5">Manuel Camacho</option>
											</select>
											<label id="cboDetalleOwner_" style="color: red;"></label>
											</td>
										</tr>
										<tr>
												<td>Actividad</td>
												<td>
												<select id="cboDetalleActividad" class="form-control input-sm cbo2" style="width: 100%">
													<option value="0">--Seleccionar--</option>
													<option value="1">Actividad1</option>
													<option value="2">Actividad2</option>
													<option value="3">Actividad3</option>
													<option value="4">Actividad4</option>
													<option value="5">Actividad5</option>
												</select>
												<label id="cboDetalleActividad_" style="color: red;"></label>
												</td>
										</tr>
										<tr>
											<td colspan="2">
												<div class="form-inline">
													<div class="form-group">Fecha
														<div class="input-group">
															<input id="txtDetalleFecha" type="text" class="form-control input-sm datePicker">
																<span class="input-group-addon">
																<span class="fa fa-calendar-o"></span>
																</span>
														</div>
														<label id="txtDetalleFecha_" style="color: red;"></label>
													</div>
													<div class="form-group">Horas
<!-- 													</div> -->
<!-- 													<div class="form-group"> -->
														<div class="input-group">
															<input id="txtDetalleHoras" type="number" min="0" max="100" class="form-control input-sm">
															<span class="input-group-addon">
															<span class="fa fa-clock-o"></span>
															</span>
														</div>
														<label id="txtDetalleHoras_" style="color: red;"></label>
													</div>
													<div class="form-group">
														<a id="btnAgregar" class="btn btn-primary btn-sm"><i class="fa fa-plus-circle" aria-hidden="true"></i> Agregar</a>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<label id="lblInfoControlTrabajo"></label>
											</td>
										</tr>
										<tr>
											<td colspan="2">
												<table id="tblControlTrabajo" class="table table-striped table-bordered table-condensed table-hover">
													<thead><tr class="bg-primary"><td>Mensaje</td></tr></thead><tbody><tr><td> <i class="fa fa-info-circle" aria-hidden="true"></i> Aún no se han seleccionado parámetros</td></tr></tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

							</div>
							<!-- /.box-body -->
						</div>
				
							<table>
							<tbody>
							<tr>
							<td></td>
							</tr>
							</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    
	


<div class="table-responsive">
	<div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Control de Actividades TWS</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            <div class="table-responsive">
              <table class="table table-bordered">
              <thead>
              <tr>
              	<th>Nro</th>
              	<th>Owner</th>
              	<th>Activity</th>
              	<th>%Estimado</th>
              	<th>Fecha Inicio</th>
              	<th>Fecha Fin</th>
              	<th>% Avance</th>
              	<th>Estado</th>
              	<th>Frecuencia</th>
              	<th>Cantidad</th>
              	<th>Ejecuciones al Día</th>
              	<th>Tiempo por ejecución (min)</th>
              	<th>Total Time (Hras.) /semana</th>
              	<th>FTE REQUERIDO</th>
              	<th>FTEs GANADOS</th>
              	<th>OWNER</th>
              	<th>INVESTIGACIÓN</th>
              	<th>ANALISIS</th>
              	<th>DESARROLLO</th>
              	<th>PRUEBAS</th>
              	<th>DIAS ENTREGA</th>
              	<th>OBSERVACIÓN</th>
              </tr>
              </thead>
                <tbody>
                <tr><td>1</td><td>Jorge Layme</td><td>Revision de inicio de Procesos Bancarios (TOT*)</td><td><span class="badge bg-green">100%</span></td><td>42800</td><td>42826</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Diario</td><td>7</td><td>16</td><td>5</td><td>9.333333333333330.233333333333333</td><td>0Jorge Layme</td><td>SI</td><td></td><td></td><td></td><td></td></tr>
<tr><td>2</td><td>Jorge Layme</td><td>Revision de inicio de Procesos Bancarios (BCO*)</td><td><span class="badge bg-green">100%</span></td><td>42800</td><td>42824</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Diario</td><td>7</td><td>16</td><td>5</td><td>9.333333333333330.233333333333333</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>3</td><td>Efrain Perez</td><td>Informe de estado OAS</td><td><span class="badge bg-green">100%</span></td><td>42767</td><td>42809</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Diario</td><td>7</td><td>5</td><td>15</td><td>8.750.21875</td><td>0Efrain Perez</td><td>SI</td><td>5</td><td>2</td><td>2</td><td>9</td></tr>
<tr><td>4</td><td>Efrain Perez</td><td>Reset de las centrales Hotbilling SM*</td><td><span class="badge bg-green">100%</span></td><td></td><td></td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 0%"></div>
                    </div></td><td><i class="fa fa-exclamation-triangle text-warning" aria-hidden="true"></i></td><td>Diario</td><td>7</td><td>5</td><td>10</td><td>5.833333333333330.145833333333333</td><td>0Efrain Perez</td><td>SI</td><td></td><td></td><td></td><td></td></tr>
<tr><td>5</td><td>Efrain Perez</td><td>Reset de las centrales Hotbilling AM*</td><td><span class="badge bg-green">100%</span></td><td></td><td></td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 0%"></div>
                    </div></td><td><i class="fa fa-exclamation-triangle text-warning" aria-hidden="true"></i></td><td>Diario</td><td>7</td><td>5</td><td>10</td><td>5.833333333333330.145833333333333</td><td>0Efrain Perez</td><td>SI</td><td></td><td></td><td></td><td></td></tr>
<tr><td>6</td><td>Efrain Perez</td><td>Contestar mensajes de Job CICB terminado el proceso anterior.
CICB1893
CICB1895
CICB1896 </td><td><span class="badge bg-green">100%</span></td><td></td><td></td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 0%"></div>
                    </div></td><td><i class="fa fa-exclamation-triangle text-warning" aria-hidden="true"></i></td><td>Diario</td><td>7</td><td>16</td><td>3</td><td>5.60.14</td><td>0Efrain Perez</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>7</td><td>Jorge Layme</td><td>Validacion inicio de proceso Diario  c4bco243 (ACTDES*) Archivos de reconexcion pendientes </td><td><span class="badge bg-green">100%</span></td><td>42809</td><td>42854</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Diario</td><td>7</td><td>8</td><td>5</td><td>4.666666666666670.116666666666667</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>8</td><td>Jorge Layme</td><td>Automatizar Procesos masivos en AS400 (SIP)</td><td><span class="badge bg-green">100%</span></td><td>42870</td><td>42947</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 5%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Diario</td><td>7</td><td>4</td><td>10</td><td>4.666666666666670.116666666666667</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>9</td><td>Jorge Layme</td><td>Inicializacion de cintas para backup diario (Fcfull) - SSCL800</td><td><span class="badge bg-green">100%</span></td><td></td><td></td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 0%"></div>
                    </div></td><td><i class="fa fa-exclamation-triangle text-warning" aria-hidden="true"></i></td><td>Diario</td><td>7</td><td>2</td><td>10</td><td>2.333333333333330.0583333333333333</td><td>0Jorge Layme</td><td>SI</td><td></td><td></td><td></td><td></td></tr>
<tr><td>10</td><td>Jorge Layme</td><td>Depuracion de Biblioteca Libmovil </td><td><span class="badge bg-green">100%</span></td><td></td><td></td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 0%"></div>
                    </div></td><td><i class="fa fa-exclamation-triangle text-warning" aria-hidden="true"></i></td><td>Diario</td><td>7</td><td>1</td><td>20</td><td>2.333333333333330.0583333333333333</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>11</td><td>Jorge Layme</td><td>Depuracion de Bibliotecas Temporal - SSCL802A</td><td><span class="badge bg-green">100%</span></td><td></td><td></td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 0%"></div>
                    </div></td><td><i class="fa fa-exclamation-triangle text-warning" aria-hidden="true"></i></td><td>Diario</td><td>7</td><td>2</td><td>10</td><td>2.333333333333330.0583333333333333</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>12</td><td>Efrain Perez</td><td>Monitoreo de Bloqueo de proceso RSPC0023 - TWS - Segmentación</td><td><span class="badge bg-green">100%</span></td><td>42879</td><td>42879</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Diario</td><td>7</td><td>1</td><td>10</td><td>1.166666666666670.0291666666666667</td><td>0Efrain Perez</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>31</td><td>Jorge Layme</td><td>Automatizar Limpieza de Colas STC400_B </td><td><span class="badge bg-green">100%</span></td><td>42819</td><td>42822</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Diario</td><td>7</td><td>2</td><td>5</td><td>1.166666666666670.0291666666666667</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>13</td><td>Jorge Layme</td><td>Integracion de Alerta AS400 con Patrol y Proactive - Alerta WRKPRB (SIP)</td><td><span class="badge bg-green">100%</span></td><td>42770</td><td>42791</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Diario</td><td>7</td><td>3</td><td>2</td><td>0.70.0175</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>25</td><td>Jean Rivera</td><td>Automatizar reinicio de servicios SAS en el servidor SUN42, mediante herramienta TWS y monitorarlo por alertas.</td><td><span class="badge bg-green">100%</span></td><td>42795</td><td>42854</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Domingo</td><td>1</td><td>1</td><td>40</td><td>0.6666666666666670.0166666666666667</td><td>0Jean Paul</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>30</td><td>Jorge Layme</td><td>Update de procesos 'MASIVO' </td><td><span class="badge bg-green">100%</span></td><td>42779</td><td>42781</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Semanal</td><td>4</td><td>1</td><td>10</td><td>0.6666666666666670.0166666666666667</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>14</td><td>Jorge Layme</td><td>Proceso PDCL05 (msg respuesta " S")</td><td><span class="badge bg-green">100%</span></td><td>42812</td><td>42824</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Diario</td><td>7</td><td>1</td><td>5</td><td>0.5833333333333330.0145833333333333</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>15</td><td>Jorge Layme</td><td>Backup BK_DTAQALL (Direccionado a la unidad Tap18- Modificar asignación )</td><td><span class="badge bg-green">100%</span></td><td>42781</td><td>42824</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Diario</td><td>7</td><td>1</td><td>5</td><td>0.5833333333333330.0145833333333333</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>16</td><td>Jorge Layme</td><td>TWS: Automatizar Optimización de Colas Hot Billing (SIP)</td><td><span class="badge bg-green">100%</span></td><td>42772</td><td>42821</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Domingo</td><td>1</td><td>1</td><td>30</td><td>0.50.0125</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>17</td><td>Jorge Layme</td><td>TWS: Automatizar Mantenimiento cola SRDISPON (SIP)</td><td><span class="badge bg-green">100%</span></td><td>42800</td><td>42854</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Domingo</td><td>1</td><td>1</td><td>30</td><td>0.50.0125</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>26</td><td>Jean Rivera</td><td>Automatizar sincronizacion de TDS del sistema GOYA mediante herramienta TWS.</td><td><span class="badge bg-green">100%</span></td><td>42880</td><td>42901</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 0%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Viernes</td><td>1</td><td>1</td><td>30</td><td>0.50.0125</td><td>0Jean Paul</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>18</td><td>Jorge Layme</td><td>Validacion de activación de procesos IVR (QMQM) - Domingo</td><td><span class="badge bg-green">100%</span></td><td>42849</td><td>42855</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Domingo</td><td>1</td><td>1</td><td>15</td><td>0.250.00625</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>19</td><td>Jorge Layme</td><td>Depuración  HBTRAINT & HBTRAMOV SSCL803 - SSCL806 (Depuraciones Semanales) (Parte I)</td><td><span class="badge bg-green">100%</span></td><td>42839</td><td>42856</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Domingo</td><td>1</td><td>1</td><td>15</td><td>0.250.00625</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>21</td><td>Jorge Layme</td><td>HBNOKREC - SSCL807 - SSCL810  (Depuraciones Semanales)</td><td><span class="badge bg-green">100%</span></td><td>42839</td><td>42856</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Domingo</td><td>1</td><td>1</td><td>15</td><td>0.250.00625</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>22</td><td>Jorge Layme</td><td>P4RAS* & HBRAS*- SSCL811 (Depuraciones Semanales)</td><td><span class="badge bg-green">100%</span></td><td>42839</td><td>42856</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Domingo</td><td>1</td><td>1</td><td>15</td><td>0.250.00625</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>20</td><td>Jorge Layme</td><td>Depuración  HBTRAINT & HBTRAMOV SSCL803 - SSCL806 (Depuraciones Semanales) (Parte II)</td><td><span class="badge bg-green">100%</span></td><td>42856</td><td>42859</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Domingo</td><td>1</td><td>1</td><td>10</td><td>0.1666666666666670.00416666666666667</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>23</td><td>Jorge Layme</td><td>Backup SSCL603 -  QPFRDATA</td><td><span class="badge bg-green">100%</span></td><td>42770</td><td>42773</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Domingo</td><td>1</td><td>1</td><td>10</td><td>0.1666666666666670.00416666666666667</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>24</td><td>Efrain Perez</td><td>Automatizacion del cambio de prioridad de procesos DMCB.</td><td><span class="badge bg-green">100%</span></td><td>42880</td><td></td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 0%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Diario</td><td>1</td><td>1</td><td>10</td><td>0.1666666666666670.00416666666666667</td><td>0Efrain Perez</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>27</td><td>Jorge Layme</td><td>Reporte de extraccion de Objetos por librerias y agrupacion de discos- Clte TELEFONICA - Servidor NCPTPROD</td><td><span class="badge bg-green">100%</span></td><td>42770</td><td>42821</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Mensual</td><td>0.5</td><td>1</td><td>15</td><td>0.1250.003125</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>29</td><td>Jorge Layme</td><td>QPRFDATA(SSCL603). Direccionado a la unidad Tap19. Modificar asignacion de la unidad </td><td><span class="badge bg-green">100%</span></td><td>42799</td><td>42824</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Domingo</td><td>1</td><td>1</td><td>5</td><td>0.08333333333333330.00208333333333333</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>32</td><td>Jorge Layme</td><td>BKCRUCES, Direccionado unidad Tap20 /Modificar asignacion de la unidad en NCPTPROD</td><td><span class="badge bg-green">100%</span></td><td>42770</td><td>42821</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Domingo</td><td>1</td><td>1</td><td>5</td><td>0.08333333333333330.00208333333333333</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>28</td><td>Jorge Layme</td><td>BK_FIN_MES - NCPTPROD  Modificar asignacion de la unidad Tap18 - NCPTPROD</td><td><span class="badge bg-green">100%</span></td><td>42809</td><td>42823</td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 100%"></div>
                    </div></td><td><i class="fa fa-check-circle-o text-success" aria-hidden="true"></i></td><td>Mensual</td><td>0.25</td><td>1</td><td>5</td><td>0.02083333333333330.000520833333333333</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>33</td><td>Jorge Layme</td><td>SSCL824 Depuracion Parte I Modificacion de acuerdo a nueva politica y fecha de ejecucion</td><td><span class="badge bg-green">100%</span></td><td></td><td></td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 0%"></div>
                    </div></td><td><i class="fa fa-exclamation-triangle text-warning" aria-hidden="true"></i></td><td>Mensual</td><td>0.25</td><td>1</td><td>5</td><td>0.02083333333333330.000520833333333333</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>34</td><td>Jorge Layme</td><td>SSCL827 Depuracion Parte II Modificacion de acuerdo a nueva politica y fecha de ejecucion</td><td><span class="badge bg-green">100%</span></td><td></td><td></td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 0%"></div>
                    </div></td><td><i class="fa fa-exclamation-triangle text-warning" aria-hidden="true"></i></td><td>Mensual</td><td>0.25</td><td>1</td><td>5</td><td>0.02083333333333330.000520833333333333</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
<tr><td>35</td><td>Jorge Layme</td><td>SSCL820 Depuraciones de OAS Modificacion de acuerdo a nueva politica y fecha de ejecucion</td><td><span class="badge bg-green">100%</span></td><td></td><td></td><td><div class="progress progress-xs progress-striped active">
                      <div class="progress-bar progress-bar-success" style="width: 0%"></div>
                    </div></td><td><i class="fa fa-exclamation-triangle text-warning" aria-hidden="true"></i></td><td>Mensual</td><td>0.25</td><td>1</td><td>5</td><td>0.02083333333333330.000520833333333333</td><td>0Jorge Layme</td><td></td><td></td><td></td><td></td><td></td></tr>
                
                
                
                
                
                
                
                
                
                
<!--                 <tr> -->
<!--                   <td>1.</td> -->
<!--                   <td>Update software</td> -->
<!--                   <td> -->
<!--                     <div class="progress progress-xs"> -->
<!--                       <div class="progress-bar progress-bar-danger" style="width: 55%"></div> -->
<!--                     </div> -->
<!--                   </td> -->
<!--                   <td><span class="badge bg-red">55%</span></td> -->
<!--                 </tr> -->
<!--                 <tr> -->
<!--                   <td>2.</td> -->
<!--                   <td>Clean database</td> -->
<!--                   <td> -->
<!--                     <div class="progress progress-xs"> -->
<!--                       <div class="progress-bar progress-bar-yellow" style="width: 70%"></div> -->
<!--                     </div> -->
<!--                   </td> -->
<!--                   <td><span class="badge bg-yellow">70%</span></td> -->
<!--                 </tr> -->
<!--                 <tr> -->
<!--                   <td>3.</td> -->
<!--                   <td>Cron job running</td> -->
<!--                   <td> -->
<!--                     <div class="progress progress-xs progress-striped active"> -->
<!--                       <div class="progress-bar progress-bar-primary" style="width: 30%"></div> -->
<!--                     </div> -->
<!--                   </td> -->
<!--                   <td><span class="badge bg-light-blue">30%</span></td> -->
<!--                 </tr> -->
<!--                 <tr> -->
<!--                   <td>4.</td> -->
<!--                   <td>Fix and squish bugs</td> -->
<!--                   <td> -->
<!--                     <div class="progress progress-xs progress-striped active"> -->
<!--                       <div class="progress-bar progress-bar-success" style="width: 90%"></div> -->
<!--                     </div> -->
<!--                   </td> -->
<!--                   <td><span class="badge bg-green">90%</span></td> -->
<!--                 </tr> -->
              </tbody></table>
              </div>
            </div>
          </div>
</div>
</div>
	</section>
	</aside>

<script type="text/javascript">

$('#btnAgregar').click(function () {
            var val = '';
            if ($('#cboDetalleOwner').val() == 0) {
                $('#cboDetalleOwner_').text('*');
                val = '1';
            }
            else { $('#cboDetalleOwner_').text(''); }

            if ($('#cboDetalleActividad').val() == 0) {
                $('#cboDetalleActividad_').text('*');
                val = '1';
            }
            else { $('#cboDetalleActividad_').text(''); }

            if ($('#txtDetalleFecha').val() == '') {
                $('#txtDetalleFecha_').text('*');
                val = '1';
            }
            else { $('#txtDetalleFecha_').text(''); }

            if ($('#txtDetalleHoras').val() == '') {
                $('#txtDetalleHoras_').text('*');
                val = '1';
            }
            else { $('#txtDetalleHoras_').text(''); }


            if (val == '1') {
                $('#lblInfoControlTrabajo').text('Verificar formulario');
                $('#lblInfoControlTrabajo').removeClass();
                $('#lblInfoControlTrabajo').addClass('label label-danger');
            }
            else {
                $('#tblControlTrabajo tr.parametro').each(function () {
                    if ($(this).find('td').eq(1).text() == $('#cboParameter option:selected').val()) {
                        $('#lblInfoControlTrabajo').text('Ya seleccionó: ' + $('#cboDetalleActividad').text());
                        $('#lblInfoControlTrabajo').removeClass();
                        $('#lblInfoControlTrabajo').addClass('label label-danger');
                        val = '1';
                        return false;
                    }
                });
                if (val != '1') {
                    $('#lblInfoControlTrabajo').removeClass();
                    $('#lblInfoControlTrabajo').text('');
                    if ($('#hdControlTrabajo1').val() == '0') {
                        $('#tblControlTrabajo').empty();
                        $('#hdControlTrabajo1').val('1');
                        
                        $('#tblControlTrabajo').append('<thead class=' + "'" + 'bg-primary' + "'" + '><tr><td>Acción</td><td>Owner</td><td>Actividad</td><td>Fecha</td><td>Horas</td></tr></thead><tbody id=' + "'" + 'tbd' + "'" + '>');
                        $('#tblControlTrabajo').append('<tr class=' + "'" + 'parametro' + "'" + '><td><img src=' + "'" + '<%=request.getContextPath()%>/resources/image/delete.png' + "'" + ' class=' + "'" + 'operacion' + "'" + ' alt=' + "'" + 'Eliminar' + "'" + '/></td><td>' + $('#cboDetalleOwner option:selected').text() + '</td><td>' + $('#cboDetalleActividad option:selected').text() + '</td><td>' + $('#txtDetalleFecha').val() + '</td><td>' + $('#txtDetalleHoras').val() + '</td></tr>');
                        
                        $('#cboDetalleOwner').val('0').trigger("change");;
                        $('#cboDetalleActividad').val('0').trigger("change");;
                        $('#txtDetalleFecha').val('');
                        $('#txtDetalleHoras').val('');                        
                        
//                         $('#cboParameter option[value=0]').prop('selected', true);
//                         $('#cboOperator option[value=0]').prop('selected', true);
                        //$('#cboParameter option:selected').val('0')
                    }
                    else {
                        $('#tbd').append('<tr class=' + "'" + 'parametro' + "'" + '><td><img src=' + "'" + '<%=request.getContextPath()%>/resources/image/delete.png' + "'" + ' class=' + "'" + 'operacion' + "'" + ' alt=' + "'" + 'Eliminar' + "'" + '/></td><td>' + $('#cboDetalleOwner option:selected').text() + '</td><td>' + $('#cboDetalleActividad option:selected').text() + '</td><td>' + $('#txtDetalleFecha').val() + '</td><td>' + $('#txtDetalleHoras').val() + '</td></tr>');
                        $('#cboDetalleOwner').val('0').trigger("change");;
                        $('#cboDetalleActividad').val('0').trigger("change");;
                        $('#txtDetalleFecha').val('');
                        $('#txtDetalleHoras').val(''); 
                        
//                         $('#valBuscado').val('');
//                         $('#valBuscado2').val('');
//                         $('#cboParameter option[value=0]').prop('selected', true);
//                         $('#cboOperator option[value=0]').prop('selected', true);
                    }
                }
            }
        });
        
$("#tblControlTrabajo").on("click", "tbody tr td img.operacion", function () {
            var valor = [];
            var pulsacion = $(this).attr('alt');
            if (pulsacion == 'Eliminar') {
                $(this).parent().parent().remove();
                if ($('#tblControlTrabajo tbody tr').length == 0) {
                    $("#tblControlTrabajo").empty();
                    document.getElementById('tblControlTrabajo').innerHTML = '';
                    $("#tblControlTrabajo").removeClass();
                    $("#tblControlTrabajo").addClass('table table-bordered table-condensed');
                    $("#tblControlTrabajo").append('<thead><tr class="bg-primary"><td>Mensaje</td></tr></thead><tbody><tr><td> <i class=\'fa fa-info-circle\' aria-hidden=\'true\'></i> Aún no se han seleccionado parámetros</td></tr></tbody>');
                    $('#hdControlTrabajo1').val('0');
                }
            }
        });

</script>


</html>