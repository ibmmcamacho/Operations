<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> --%>
<html>
  <head>
<!--    <meta charset="UTF-8" content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'> -->
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--     <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<style>
    #chartContainer {
  	width: 40%
	};
	
	#myChart2 {
	  width: 40%
	};    

.example2 {
  border: 2px solid red;
  padding: 10px;
  border-radius: 50px 20px;
}

.aside2{ 
   /* background-color: silver;   */
 	   background: linear-gradient(90deg,black, white); 
} 

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

/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}


</style>
    
    <title>SCHEDULE  | CROSS</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
   
    </head>
    <body>
    
    <aside class="right-side aside">

		<section class="content-header">		
			<div class="row">
			
			<!-- LOGO BASELINE -->
				<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12" align="center">				
					<div class="row" align="center">
							<div class="col-xs-5 col-sm-1 col-md-1 col-lg-1" align="right">							
								<img alt="" style="width: 50px;height: 50px;" src="http://darsistemas.com/wp-content/uploads/2017/06/004abf8b7946c4ed5605806fa445c476-monitor-de-escritorio-plana-by-vexels.png" >					
							
							</div>
							
							<div class="col-xs-5 col-sm-2 col-md-2 col-lg-2" align="left">
								<h3>Linea Base</h3>						
							</div>
						
							<div div class="col-xs-2 col-sm-9 col-md-9 col-lg-9" align="right">
							</div>
						
							
					</div>					
				</div>
				
			<!-- FIN BASELINE -->	
			
			
				<!-- COMBO -->
				<div class="col-xs-12 col-sm-9 col-md-9 col-lg-5" style="align-content: center;"align="center">
					<div class="form-inline">
						<div class=" form-group col-xs-12 col-sm-6 col-md-6 col-lg-6" style="padding-top: 10px;">
							<select class="cbo2 input-sm" style="width: 100%;height: 100%">
								<option> Cliente </option>
							</select>
						</div>
						
						<div class=" form-group col-xs-12 col-sm-6 col-md-6 col-lg-6" style="padding-top: 10px;">
							<select class="cbo2 input-sm" style="width: 100%;height: 100%">
								<option > Grupo </option>
							</select>
						</div>	
					</div>					
				</div>
				<!-- FIN COMBO -->
				
				<!-- BOTON -->
				<div class="form-group col-sxs-12 col-sm-3 col-md-3 col-lg-2" style="padding-top: 10px;" align="center">
					<button class="btn-circle fa fa-check btn-xl" style="background-color: lime; align-content: center;height: 30px;width: 30px" ></button>
				</div>
				<!-- FIN BOTON -->
				
				<!-- BOTONES -->
				
				<div class="col-sm-4 col-sm-4 col-md-4 col-lg-5" align="center">
				
					
						<a class="btn btn-success btn-sm" href="#" onclick="" id ="btnValores">
							<i class="fa fa-check" aria-hidden="true"></i> VALORES
						</a>						
						
						<button type="button" class="btn btn-danger btn-sm" href="#" id ="btnNuevo" data-toggle="modal" data-target="#openModalRPLL">
							<i class="fa fa-file-text-o" aria-hidden="true"></i> Nuevo
						</button>
						
						<a class="btn btn-info btn-sm" href="#" onclick="openModalRT()" id ="btnRT">
							<i class="fa fa-schedule" aria-hidden="true"></i> Reporte de Tickets
						</a>
						
						<a class="btn btn-warning btn-sm" href="#" onclick="openModalWO()" id ="btnWO">
							<i class="fas fa-anchor" aria-hidden="true"></i> WO
						</a>
					
					
				</div>
				
				<!-- FIN BOTONES -->
			</div>
		</section> 
		
			<div class="row" align="center" style="padding-left: 400px;">
			    <a href="javascript:void(0)" onclick="openCity(event, 'Mesa');">
			      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">Mesa de Ayuda</div>
			    </a>
			   
			    <a href="javascript:void(0)" onclick="openCity(event, 'OnSite');">
			      <div class="w3-third tablink w3-bottombar w3-hover-light-grey w3-padding">OnSite</div>
			    </a>
			  
			</div>
			
			
			<br>
			<br>

<!-- SLA -->
				
		<!-- Main content -->
		<section class="content">
		
		<div id="Mesa" class="w3-container city" style="display:none">								
						
						<div class="row" align="center">
								
							<div class="col-lg-3"></div>	
							
							<!-- SLA PRINCIPAL -->														
							<div class="col-lg-6">
								<div class="box box-primary">									
									<div class="box-body" >
										<div id="tbcontainerPerfilDet" class="table-responsive"> 							         
											
											<div class="col-sm-12 col-sm-3 col-md-3 col-lg-3"align="left">
												<img src="http://zanaro.com.br/wp-content/uploads/2017/05/capa-planilha-excel.jpg" style="width: 100%;height: 100%;">
											</div>										
										
											<div class="col-sm-12 col-sm-9 col-md-9 col-lg-9" align="center">
										    	
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"><h1>13057</h1>(%99)Resultado</div>
				   									<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h1><b>/</b></h1></div>
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"> <h1>13000</h1>Linea Base</div>
															   																		
				   								</div>
				   								
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><h4>Mesa de Ayuda</h4></div>
				   									
															   																		
				   								</div>
				   								
				   								
				   								<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 btn" style="background-color: #34495e;height: 30px;color: white;font-family: verdana"   data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
													Detalle
												</div>
												
	   										</div>
   										
   										
										
										</div> <!-- TBCONTAINER -->
										
										<div class="collapse" id="collapseExample">
						  						 <div class="col-xs-0 col-sm-3 col-md-3 col-lg-3"></div>  	
										   		<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>TICKETS ORIGEN TELEFONO</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>8318</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>CORREOS</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>4705</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>TICKETS ORIGEN WEB TOTALES</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>34</h5>
														</div>
														
														
														
												</div>
						   	
						  				</div>
										
										</div>
									</div>
								</div>
							<!-- FIN SLA PRINCIPAL -->	
							
							<div class="col-lg-3"></div>
							
															
						</div>
							
				<!-- 4 SLA fila -->
							
							
							<div class="row" align="center">	
							
									<!-- segundo cuadro -->				
									<div class="col-lg-3 ">
										<div class="box box-primary">									
										<div class="box-body" >
											<div id="tbcontainerPerfilDet" class="table-responsive"> 							         
												<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"align="left">
													<img src="http://zanaro.com.br/wp-content/uploads/2017/05/capa-planilha-excel.jpg" style="width: 100%;height: 160px;">
												</div>										
											
											<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9" align="center">
											    	
					   								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
					   									
					   									<div class="col-sm-5 col-sm-5 col-md-5 col-lg-5" align="center"><h1>1000</h1>(%99)Resultado</div>
					   									<div class="col-sm-2 col-sm-2 col-md-2 col-lg-2" align="center"><h1><b>/</b></h1></div>
					   									<div class="col-sm-5 col-sm-5 col-md-5 col-lg-5" align="center"> <h1>1097</h1>Linea Base</div>
																   																		
					   								</div>
					   								
					   								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
					   									
					   									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><h4>Onsite Lima</h4></div>
					   									
																   																		
					   								</div>
					   								
					   								
					   								<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 btn" style="background-color: #34495e;height: 30px;color: white;font-family: verdana"   data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample2">
														Detalle
													</div>
													
		   										</div>
	   										
	   										
											
											</div> <!-- TBCONTAINER -->
											
											<div class="collapse" id="collapseExample2">
						  						 <div class="col-xs-0 col-sm-3 col-md-3 col-lg-3"></div>  	
										   		<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>TICKETS ORIGEN TELEFONO</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>8318</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>CORREOS</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>4705</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>TICKETS ORIGEN WEB TOTALES</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>34</h5>
														</div>
														
														
														
												</div>
						   	
						  				</div>
											
											</div>
										</div>
									</div>
									
									<!-- fin segundo cuadro -->
									
									
									<!-- tercer cuadro -->
									<div class="col-lg-3 ">
									<div class="box box-primary">									
										<div class="box-body" >
											<div id="tbcontainerPerfilDet" class="table-responsive"> 							         
												<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"align="left">
													<img src="http://zanaro.com.br/wp-content/uploads/2017/05/capa-planilha-excel.jpg" style="width: 100%;height: 160px;">
												</div>										
											
												<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9" align="center">
											    	
					   								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
					   									
					   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"><h1>12</h1>(%99)Resultado</div>
					   									<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h1><b>/</b></h1></div>
					   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"> <h1>20</h1>Linea Base</div>
																   																		
					   								</div>
					   								
					   								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
					   									
					   									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><h4>Onsite Provincia</h4></div>					   									
																   																		
					   								</div>
					   								
					   								<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 btn" style="background-color: #34495e;height: 30px;color: white;font-family: verdana"   data-toggle="collapse" href="#collapseExample3" role="button" aria-expanded="false" aria-controls="collapseExample3">
														Detalle
													</div>
													
		   										 </div>
	   										
	   										
											
											</div> <!-- TBCONTAINER -->
											
											<div class="collapse" id="collapseExample3">
						  						 <div class="col-xs-0 col-sm-3 col-md-3 col-lg-3"></div>  	
										   		<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>TICKETS ORIGEN TELEFONO</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>8318</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>CORREOS</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>4705</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>TICKETS ORIGEN WEB TOTALES</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>34</h5>
														</div>
														
														
														
												</div>
						   	
						  				</div>
											
											</div>
										</div>
									</div>
									
									<!-- fin tercercuadro -->


									<!-- cuarto cuadro -->
									<div class="col-lg-3 ">
									<div class="box box-primary">									
										<div class="box-body" >
											<div id="tbcontainerPerfilDet" class="table-responsive"> 							         
												<div class="col-sm-12 col-sm-3 col-md-3 col-lg-3"align="left">
													<img src="http://zanaro.com.br/wp-content/uploads/2017/05/capa-planilha-excel.jpg" style="width: 100%;height: 160px;">
												</div>										
											
												<div class="col-sm-12 col-sm-9 col-md-9 col-lg-9" align="center">
											    	
					   								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
					   									
					   									<div class="col-sm-5 col-sm-5 col-md-5 col-lg-5" align="center"><h1>211</h1>(%99)Resultado</div>
					   									<div class="col-sm-2 col-sm-2 col-md-2 col-lg-2" align="center"><h1><b>/</b></h1></div>
					   									<div class="col-sm-5 col-sm-5 col-md-5 col-lg-5" align="center"> <h1>300</h1>Linea Base</div>
																   																		
					   								</div>
					   								
					   								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
					   									
					   									<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12"><h4>IMAC LIMA</h4></div>					   									
																   																		
					   								</div>
					   								
					   								<div class=" col-sm-12 col-sm-12 col-md-12 col-lg-12 btn" style="background-color: #34495e;height: 30px;color: white;font-family: verdana"   data-toggle="collapse" href="#collapseExample4" role="button" aria-expanded="false" aria-controls="collapseExample4">
														Detalle
													</div>
													
		   										 </div>
	   										
	   										
											
											</div> <!-- TBCONTAINER -->
											
											<div class="collapse" id="collapseExample4">
						  						 <div class="col-xs-0 col-sm-3 col-md-3 col-lg-3"></div>  	
										   		<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>TICKETS ORIGEN TELEFONO</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>8318</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>CORREOS</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>4705</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>TICKETS ORIGEN WEB TOTALES</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>34</h5>
														</div>
														
														
														
												</div>
						   	
						  				</div>
											
											</div>
										</div>
									</div>
									
									<!-- fin cuartocuadro -->
									
									
									<!-- quinto cuadro -->
									<div class="col-lg-3 ">
									<div class="box box-primary">									
										<div class="box-body" >
											<div id="tbcontainerPerfilDet" class="table-responsive"> 							         
												<div class="col-xs-12 col-sm-3 col-md-3 col-lg-3"align="left">
													<img src="http://zanaro.com.br/wp-content/uploads/2017/05/capa-planilha-excel.jpg" style="width: 100%;height: 160px;">
												</div>										
											
												<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9" align="center">
											    	
					   								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
					   									
					   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"><h1>0</h1>(%99)Resultado</div>
					   									<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h1><b>/</b></h1></div>
					   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"> <h1>4</h1>Linea Base</div>
																   																		
					   								</div>
					   								
					   								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
					   									
					   									<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12"><h4>IMAC PROVINCIA	</h4></div>					   									
																   																		
					   								</div>
					   								
					   								<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 btn" style="background-color: #34495e;height: 30px;color: white;font-family: verdana"   data-toggle="collapse" href="#collapseExample5" role="button" aria-expanded="false" aria-controls="collapseExample5">
														Detalle
													</div>
													
		   										 </div>
	   										
	   										
											
											</div> <!-- TBCONTAINER -->
											
											<div class="collapse" id="collapseExample5">
						  						 <div class="col-xs-0 col-sm-3 col-md-3 col-lg-3"></div>  	
										   		<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>TICKETS ORIGEN TELEFONO</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>8318</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>CORREOS</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>4705</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>TICKETS ORIGEN WEB TOTALES</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>34</h5>
														</div>
														
														
														
												</div>
						   	
						  				</div>
											
											</div>
										</div>
									</div>
									
									<!-- fin quintocuadro -->									
									
									
								</div>
								
		</div>
						
				<!-- FIN 4 SLA-->	
				
				
				<!-- SLA SDD -->
		<div id="OnSite" class="w3-container city" style="display:none">
			
				<div class="row" align="center">	
				<div class="col-lg-4">
								<div class="box box-primary">									
									<div class="box-body" >
										<div id="tbcontainerPerfilDet" class="table-responsive"> 							         
											
											<div class="col-sm-12 col-sm-3 col-md-3 col-lg-3"align="left">
												<img src="https://es.seaicons.com/wp-content/uploads/2015/08/green-chart-icon.png" style="width: 100%;height: 100%;">
											</div>										
										
											<div class="col-sm-12 col-sm-9 col-md-9 col-lg-9" align="center">
										    	
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"><h1>98.88%</h1>Resultado</div>
				   									<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h1><b>/</b></h1></div>
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"> <h1>85%</h1>Valor SLA</div>
															   																		
				   								</div>
				   								
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><h4> % de Resoluci�n en 1er nivel (de los factibles de resolver en el 1er nivel) </h4></div>
				   									
															   																		
				   								</div>
				   								
				   								
				   								<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 btn" style="background-color: #34495e;height: 30px;color: white;font-family: verdana"   data-toggle="collapse" href="#collapseExample6" role="button" aria-expanded="false" aria-controls="collapseExample6">
													Detalle
												</div>
												
	   										</div>
   										
   										
										
										</div> <!-- TBCONTAINER -->
										
										<div class="collapse" id="collapseExample6">
						  						 <div class="col-xs-0 col-sm-3 col-md-3 col-lg-3"></div>  	
										   		<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Atenciones FCR resueltas por Primer Nivel </h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>2913</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Total de atenciones FCR presentados durante el mes</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>2946</h5>
														</div>
												</div>
						   	
						  				</div>
										
										</div>
									</div>
						</div>
					
				<div class="col-lg-4">
								<div class="box box-primary">									
									<div class="box-body" >
										<div id="tbcontainerPerfilDet" class="table-responsive"> 							         
											
											<div class="col-sm-12 col-sm-3 col-md-3 col-lg-3"align="left">
												<img src="https://es.seaicons.com/wp-content/uploads/2015/08/green-chart-icon.png" style="width: 100%;height: 100%;">
											</div>										
										
											<div class="col-sm-12 col-sm-9 col-md-9 col-lg-9" align="center">
										    	
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"><h1>0</h1>Resultado</div>
				   									<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h1><b>/</b></h1></div>
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"> <h1>0</h1>Valor SLA</div>
															   																		
				   								</div>
				   								
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><h4>% Tickets reabiertos (*)</h4></div>
				   									
															   																		
				   								</div>
				   								
				   								
				   								<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 btn" style="background-color: #34495e;height: 30px;color: white;font-family: verdana"   data-toggle="collapse" href="#collapseExample7" role="button" aria-expanded="false" aria-controls="collapseExample7">
													Detalle
												</div>
												
	   										</div>
   										
   										
										
										</div> <!-- TBCONTAINER -->
										
										<div class="collapse" id="collapseExample7">
						  						 <div class="col-xs-0 col-sm-3 col-md-3 col-lg-3"></div>  	
										   		<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Total de tickets reabiertos por no conformidad (SDD)</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>4</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Total de tickets atendidos de los tickets FCR</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>2913</h5>
														</div>
												</div>
						   	
						  				</div>
										
										</div>
									</div>
								</div>
				
				<div class="col-lg-4">
								<div class="box box-primary">									
									<div class="box-body" >
										<div id="tbcontainerPerfilDet" class="table-responsive"> 							         
											
											<div class="col-sm-12 col-sm-3 col-md-3 col-lg-3"align="left">
												<img src="https://es.seaicons.com/wp-content/uploads/2015/08/green-chart-icon.png" style="width: 100%;height: 100%;">
											</div>										
										
											<div class="col-sm-12 col-sm-9 col-md-9 col-lg-9" align="center">
										    	
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"><h1>00:00</h1>Resultado</div>
				   									<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h1><b>/</b></h1></div>
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"> <h1>60</h1>Valor SLA</div>
															   																		
				   								</div>
				   								
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><h4>Tiempo promedio de escalamiento a nivel 2 (s�lo en Lima Metropolitana) </h4></div>
				   									
															   																		
				   								</div>
				   								
				   								
				   								<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 btn" style="background-color: #34495e;height: 30px;color: white;font-family: verdana"   data-toggle="collapse" href="#collapseExample8" role="button" aria-expanded="false" aria-controls="collapseExample8">
													Detalle
												</div>
												
	   										</div>
   										
   										
										
										</div> <!-- TBCONTAINER -->
										
										<div class="collapse" id="collapseExample8">
						  						 <div class="col-xs-0 col-sm-3 col-md-3 col-lg-3"></div>  	
										   		<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Atenciones FCR resueltas por Primer Nivel </h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>2913</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Total de atenciones FCR presentados durante el mes</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>2946</h5>
														</div>
												</div>
						   	
						  				</div>
										
										</div>
									</div>
						</div>	
				</div>
				
				
				<div class="row" align="center">	
				<div class="col-lg-4">
								<div class="box box-primary">									
									<div class="box-body" >
										<div id="tbcontainerPerfilDet" class="table-responsive"> 							         
											
											<div class="col-sm-12 col-sm-3 col-md-3 col-lg-3"align="left">
												<img src="https://es.seaicons.com/wp-content/uploads/2015/08/green-chart-icon.png" style="width: 100%;height: 100%;">
											</div>										
										
											<div class="col-sm-12 col-sm-9 col-md-9 col-lg-9" align="center">
										    	
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"><h1>100%</h1>Resultado</div>
				   									<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h1><b>/</b></h1></div>
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"> <h1>99.50%</h1>Valor SLA</div>
															   																		
				   								</div>
				   								
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><h4>Gesti�n de Tickets WEB</h4></div>
				   									
															   																		
				   								</div>
				   								
				   								
				   								<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 btn" style="background-color: #34495e;height: 30px;color: white;font-family: verdana"   data-toggle="collapse" href="#collapseExample9" role="button" aria-expanded="false" aria-controls="collapseExample9">
													Detalle
												</div>
												
	   										</div>
   										
   										
										
										</div> <!-- TBCONTAINER -->
										
										<div class="collapse" id="collapseExample9">
						  						 <div class="col-xs-0 col-sm-3 col-md-3 col-lg-3"></div>  	
										   		<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Tickets WEB leidos durante el dia</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>34</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Tickets WEB totales</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>34</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>TK OBSERVADOS</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>0</h5>
														</div>
												</div>
						   	
						  				</div>
										
										</div>
									</div>
						</div>	
				
				<div class="col-lg-4">
								<div class="box box-primary">									
									<div class="box-body" >
										<div id="tbcontainerPerfilDet" class="table-responsive"> 							         
											
											<div class="col-sm-12 col-sm-3 col-md-3 col-lg-3"align="left">
												<img src="https://es.seaicons.com/wp-content/uploads/2015/08/green-chart-icon.png" style="width: 100%;height: 100%;">
											</div>										
										
											<div class="col-sm-12 col-sm-9 col-md-9 col-lg-9" align="center">
										    	
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"><h1>68.57%</h1>Resultado</div>
				   									<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h1><b>/</b></h1></div>
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"> <h1>70%</h1>Valor SLA</div>
															   																		
				   								</div>
				   								
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><h4>ENCUESTA</h4></div>
				   									
															   																		
				   								</div>
				   								
				   								
				   								<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 btn" style="background-color: #34495e;height: 30px;color: white;font-family: verdana"   data-toggle="collapse" href="#collapseExample10" role="button" aria-expanded="false" aria-controls="collapseExample10">
													Detalle
												</div>
												
	   										</div>
   										
   										
										
										</div> <!-- TBCONTAINER -->
										
										<div class="collapse" id="collapseExample10">
						  						 <div class="col-xs-0 col-sm-3 col-md-3 col-lg-3"></div>  	
										   		<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Total de tickets satisfechos SDD </h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>24</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Total de tickets encuestados SDD</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>35</h5>
														</div>
												</div>
						   	
						  				</div>
										
										</div>
									</div>
						</div>	
				
				<div class="col-lg-4">
								<div class="box box-primary">									
									<div class="box-body" >
										<div id="tbcontainerPerfilDet" class="table-responsive"> 							         
											
											<div class="col-sm-12 col-sm-3 col-md-3 col-lg-3"align="left">
												<img src="https://es.seaicons.com/wp-content/uploads/2015/08/green-chart-icon.png" style="width: 100%;height: 100%;">
											</div>										
										
											<div class="col-sm-12 col-sm-9 col-md-9 col-lg-9" align="center">
										    	
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"><h1>5.08%</h1>Resultado</div>
				   									<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h1><b>/</b></h1></div>
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"> <h1>10%</h1>Valor SLA</div>
															   																		
				   								</div>
				   								
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><h4>Tasa de Abandono </h4></div>
				   									
															   																		
				   								</div>
				   								
				   								
				   								<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 btn" style="background-color: #34495e;height: 30px;color: white;font-family: verdana"   data-toggle="collapse" href="#collapseExample11" role="button" aria-expanded="false" aria-controls="collapseExample11">
													Detalle
												</div>
												
	   										</div>
   										
   										
										
										</div> <!-- TBCONTAINER -->
										
										<div class="collapse" id="collapseExample11">
						  						 <div class="col-xs-0 col-sm-3 col-md-3 col-lg-3"></div>  	
										   		<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Llamadas Abandonadas Mayores </h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>6963</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Llamadas Recibidas</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>9808</h5>
														</div>
												</div>
						   	
						  				</div>
										
										</div>
									</div>
						</div>	
				</div>
				
				<div class="row" align="center">					
				<div class="col-lg-4">
								<div class="box box-primary">									
									<div class="box-body" >
										<div id="tbcontainerPerfilDet" class="table-responsive"> 							         
											
											<div class="col-sm-12 col-sm-3 col-md-3 col-lg-3"align="left">
												<img src="https://es.seaicons.com/wp-content/uploads/2015/08/green-chart-icon.png" style="width: 100%;height: 100%;">
											</div>										
										
											<div class="col-sm-12 col-sm-9 col-md-9 col-lg-9" align="center">
										    	
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"><h1>77.33%</h1>Resultado</div>
				   									<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h1><b>/</b></h1></div>
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"> <h1>70%</h1>Valor SLA</div>
															   																		
				   								</div>
				   								
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><h4>Tasa de Respuesta</h4></div>
				   									
															   																		
				   								</div>
				   								
				   								
				   								<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 btn" style="background-color: #34495e;height: 30px;color: white;font-family: verdana"   data-toggle="collapse" href="#collapseExample12" role="button" aria-expanded="false" aria-controls="collapseExample12">
													Detalle
												</div>
												
	   										</div>
   										
   										
										
										</div> <!-- TBCONTAINER -->
										
										<div class="collapse" id="collapseExample12">
						  						 <div class="col-xs-0 col-sm-3 col-md-3 col-lg-3"></div>  	
										   		<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Llamadas Contestadas dentro de los 15 segundos</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>6963</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Llamadas Contestadas</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>9004</h5>
														</div>
												</div>
						   	
						  				</div>
										
										</div>
									</div>
						</div>	
						
				<div class="col-lg-4">
								<div class="box box-primary">									
									<div class="box-body" >
										<div id="tbcontainerPerfilDet" class="table-responsive"> 							         
											
											<div class="col-sm-12 col-sm-3 col-md-3 col-lg-3"align="left">
												<img src="https://es.seaicons.com/wp-content/uploads/2015/08/green-chart-icon.png" style="width: 100%;height: 100%;">
											</div>										
										
											<div class="col-sm-12 col-sm-9 col-md-9 col-lg-9" align="center">
										    	
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"><h1>0%</h1>Resultado</div>
				   									<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h1><b>/</b></h1></div>
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"> <h1>2%</h1>Valor SLA</div>
															   																		
				   								</div>
				   								
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><h4>Reclamos</h4></div>
				   									
															   																		
				   								</div>
				   								
				   								
				   								<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 btn" style="background-color: #34495e;height: 30px;color: white;font-family: verdana"   data-toggle="collapse" href="#collapseExample13" role="button" aria-expanded="false" aria-controls="collapseExample13">
													Detalle
												</div>
												
	   										</div>
   										
   										
										
										</div> <!-- TBCONTAINER -->
										
										<div class="collapse" id="collapseExample13">
						  						 <div class="col-xs-0 col-sm-3 col-md-3 col-lg-3"></div>  	
										   		<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Reclamos</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>0</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Tickets Resueltos por Mesa</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>6122</h5>
														</div>														
														
												</div>
						   	
						  				</div>
										
										</div>
									</div>
						</div>	
						
				<div class="col-lg-4">
								<div class="box box-primary">									
									<div class="box-body" >
										<div id="tbcontainerPerfilDet" class="table-responsive"> 							         
											
											<div class="col-sm-12 col-sm-3 col-md-3 col-lg-3"align="left">
												<img src="https://es.seaicons.com/wp-content/uploads/2015/08/green-chart-icon.png" style="width: 100%;height: 100%;">
											</div>										
										
											<div class="col-sm-12 col-sm-9 col-md-9 col-lg-9" align="center">
										    	
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"><h1>100%</h1>Resultado</div>
				   									<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center"><h1><b>/</b></h1></div>
				   									<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" align="center"> <h1>99.5%</h1>Valor SLA</div>
															   																		
				   								</div>
				   								
				   								<div class="col-xs-12 col-sm-12 col-sm-12 col-md-12 col-lg-12" style="background-color: white" align="center">	   								
				   									
				   									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><h4>Correos de RPTA</h4></div>
				   									
															   																		
				   								</div>
				   								
				   								
				   								<div class=" col-xs-12 col-sm-12 col-md-12 col-lg-12 btn" style="background-color: #34495e;height: 30px;color: white;font-family: verdana"   data-toggle="collapse" href="#collapseExample14" role="button" aria-expanded="false" aria-controls="collapseExample14">
													Detalle
												</div>
												
	   										</div>
   										
   										
										
										</div> <!-- TBCONTAINER -->
										
										<div class="collapse" id="collapseExample14">
						  						 <div class="col-xs-0 col-sm-3 col-md-3 col-lg-3"></div>  	
										   		<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9">
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Correos de RPTA</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>0</h5>
														</div>
														
														<div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
															<h5>Correo Mesa de Ayuda</h5>
														</div>
														
														<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
															<h5>4705</h5>
														</div>														
														
												</div>
						   	
						  				</div>
										
										</div>
									</div>
						</div>	
				</div>
				
		</div>
				<!-- FIN SLA SDD -->		

<!-- FIN SLA -->
			
			
		</section>
 	</aside>
    
<!--       <aside class="right-side sizeHeight " style="background-color: #1B3648; color: white">  -->
	  <aside class="right-side sizeHeight"> 
        <section class="content-header">

        </section>
        <section class="content">
        <div class="container">
        
        <a href="javascript:creapdf()">Download PDF</a>
        <br/><br/>
        
        <a href="#" id="downloadPdf">Download Report Page as PDF</a>
		<br/><br/>
		<div id="reportPage">
		  <div id="chartContainer" style="width: 30%;float: left;">
		    <canvas id="myChart"></canvas>
		  </div>
		
		  <div style="width: 30%; float: left;">
		    <canvas id="myChart2"></canvas>
		  </div>
		
		  <br/><br/><br/>
		
		  <div style="width: 30%; height: 400px; clear: both;">
		    <canvas id="myChart3" style="width: 40%"></canvas>
		  </div>
		</div>
<!--         <div class="row"> -->
<!--         <div class="col-sm-6 col-md-6 col-lg-6" align="left"> -->
<!--         	<img class="img-responsive img-rounded" src="resources/image/logo_cliente/IBM128.png" /> -->
        	
<!--         </div> -->
<!--         <div class="col-sm-6 col-md-6 col-lg-6" align="right"> -->
<!--         	<img class="img-responsive img-rounded" src="resources/image/logo_cliente/logo-Rimac.png" /> -->
<!--         </div> -->
<!--         </div> -->
<!--         <div class="row"> -->
<!--         <div class="col-lg-16 text-right"> -->
<!--         	<br><br><br><br> -->
<!--         	<p style="font-size: 37px;">Mesa de Ayuda - Informe Mensual</p><br> -->
<!--         	<p style="font-size: 27px;">Diciembre 2018</p> -->
<!--         	<br><br> -->
<!--         </div> -->
<!--         </div> -->
<!--         <div class="row"> -->
<!--         <div class="col-sm-12 col-md-12 col-lg-12" align="left"> -->
<!--         	<img class="img-responsive img-rounded" src="resources/image/logo_cliente/piePortada.png" /> -->
<!--         </div> -->
<!--         </div> -->
        </div>
        </section>
      </aside>
      
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/Charts/ChartJS/js/Chart.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/jquery/js/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/jsPDF/js1_4/jspdf.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/jsPDF/js1_4/plugins/addhtml.js"></script>
    <script src="<%=request.getContextPath()%>/resources/jsPDF/js1_4/plugins/cell.js"></script>
    <script src="<%=request.getContextPath()%>/resources/jsPDF/js1_4/plugins/jspdf.plugin.autotable.js"></script>
<%--     <script src="<%=request.getContextPath()%>/resources/jsPDF/js1_4/plugins/standard_fonts_metrics.js"></script> --%>
<%--     <script src="<%=request.getContextPath()%>/resources/jsPDF/js1_4/plugins/setLanguage.js"></script> --%>
<%--     <script src="<%=request.getContextPath()%>/resources/jsPDF/js/jspdf.debug.js"></script> --%>
<%--     <script src="<%=request.getContextPath()%>/resources/jsPDF/js/jspdf.plugin.standard_fonts_metrics.js"></script> --%>
<!--       <script src="https://unpkg.com/jspdf@latest/dist/jspdf.min.js"></script> -->
<script>


// function tildes_unicode2(cadena)
// {
// 	var chars={
// 		"á":"\u00e1", "é":"\u00e9", "í":"\u00ed", "ó":"\u00f3", "ú":"\u00fa",
// 		"à":"a", "è":"e", "ì":"i", "ò":"o", "ù":"u", "ñ":"\u00f1",
// 		"Á":"\u00c1", "É":"\u00c9", "Í":"\u00cd", "Ó":"\u00d3", "Ú":"\u00da",
// 		"À":"A", "È":"E", "Ì":"I", "Ò":"O", "Ù":"U", "Ñ":"\u00d1"}
// 	var expr=/[áàéèíìóòúùñ]/ig;
// 	var res=cadena.replace(expr,function(e){return chars[e]});
// 	return res;
// }


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



// var str="Óscar qué tal estás?";
// console.log(tildes_unicode2(str)); // devolvera "Oscar que tal estas?"

		
// console.log(tildes_unicode('Ángel árcangel INTRODUCCIÓN'));


// var chartColors = {
// 		  red: 'rgb(255, 99, 132)',
// 		  orange: 'rgb(255, 159, 64)',
// 		  yellow: 'rgb(255, 205, 86)',
// 		  green: 'rgb(75, 192, 192)',
// 		  blue: 'rgb(54, 162, 235)',
// 		  purple: 'rgb(153, 102, 255)',
// 		  grey: 'rgb(231,233,237)'
// 		};

// 		var randomScalingFactor = function() {
// 		  return (Math.random() > 0.5 ? 1.0 : 1.0) * Math.round(Math.random() * 100);
// 		};

// 		var data =  {
// 		  labels: ["Car", "Bike", "Walking"],
// 		  datasets: [{
// 		    label: 'Fuel',
// 		    backgroundColor: [
// 		      chartColors.red,
// 		      chartColors.blue,
// 		      chartColors.yellow],
// 		    data: [
// 		      randomScalingFactor(), 
// 		      randomScalingFactor(), 
// 		      randomScalingFactor(), 
// 		    ]
// 		  }]
// 		};

// 		var myBar = new Chart(document.getElementById("myChart"), {
// 		  type: 'horizontalBar', 
// 		  data: data, 
// 		  options: {
// 		    responsive: true,
// 		    title: {
// 		      display: true,
// 		      text: "Chart.js - Base Example"
// 		    },
// 		    tooltips: {
// 		      mode: 'index',
// 		      intersect: false
// 		    },
// 		    legend: {
// 		      display: false,
// 		    },
// 		    scales: {
// 		      xAxes: [{
// 		        ticks: {
// 		          beginAtZero: true
// 		        }
// 		      }]
// 		    }
// 		  }
// 		});

// 		var myBar2 = new Chart(document.getElementById("myChart2"), {
// 		  type: 'horizontalBar', 
// 		  data: data, 
// 		  options: {
// 		    responsive: true,
// 		    title: {
// 		      display: true,
// 		      text: "Chart.js - Changing X Axis Step Size"
// 		    },
// 		    tooltips: {
// 		      mode: 'index',
// 		      intersect: false
// 		    },
// 		    legend: {
// 		      display: false,
// 		    },
// 		    scales: {
// 		      xAxes: [{
// 		        ticks: {
// 		          beginAtZero: true,
// 		          stepSize: 2
// 		        }
// 		      }]
// 		    }
// 		  }
// 		});

// 		var myBar3 = new Chart(document.getElementById("myChart3"), {
// 		  type: 'horizontalBar', 
// 		  data: data, 
// 		  options: {
// 		    responsive: true,
// 		    maintainAspectRatio: false,
// 		    title: {
// 		      display: true,
// 		      text: "Chart.js - Setting maintainAspectRatio = false and Setting Parent Width/Height"
// 		    },
// 		    tooltips: {
// 		      mode: 'index',
// 		      intersect: false
// 		    },
// 		    legend: {
// 		      display: false,
// 		    },
// 		    scales: {
// 		      xAxes: [{
// 		        ticks: {
// 		          beginAtZero: true
// 		        }
// 		      }]
// 		    }
// 		  }
// 		});

// 		$('#downloadPdf').click(function(event) {
// 		  // get size of report page
// 		  var reportPageHeight = $('#reportPage').innerHeight();
// 		  var reportPageWidth = $('#reportPage').innerWidth();
		  
// 		  // create a new canvas object that we will populate with all other canvas objects
// 		  var pdfCanvas = $('<canvas />').attr({
// 		    id: "canvaspdf",
// 		    width: reportPageWidth,
// 		    height: reportPageHeight
// 		  });
		  
// 		  // keep track canvas position
// 		  var pdfctx = $(pdfCanvas)[0].getContext('2d');
// 		  var pdfctxX = 0;
// 		  var pdfctxY = 0;
// 		  var buffer = 100;
		  
// 		  // for each chart.js chart
// 		  $("canvas").each(function(index) {
// 		    // get the chart height/width
// 		    var canvasHeight = $(this).innerHeight();
// 		    var canvasWidth = $(this).innerWidth();
		    
// 		    // draw the chart into the new canvas
// 		    pdfctx.drawImage($(this)[0], pdfctxX, pdfctxY, canvasWidth, canvasHeight);
// 		    pdfctxX += canvasWidth + buffer;
		    
// 		    // our report page is in a grid pattern so replicate that in the new canvas
// 		    if (index % 2 === 1) {
// 		      pdfctxX = 0;
// 		      pdfctxY += canvasHeight + buffer;
// 		    }
// 		  });
		  
// 		  // create new pdf and add our new canvas as an image
// 		  var pdf = new jsPDF('l', 'pt', [reportPageWidth, reportPageHeight]);
// 		  pdf.addImage($(pdfCanvas)[0], 'PNG', 0, 0);
		  
// 		  // download the pdf
// 		  pdf.save('filename.pdf');
// 		});


        	
</script>
</body>
</html>
