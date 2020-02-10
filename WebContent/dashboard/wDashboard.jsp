<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>

<!-- Chart JS -->
<script src="<%=request.getContextPath()%>/resources/Charts/ChartJS/js/Chart.min.js"></script>


	<!-- Right side column. Contains the navbar and content of the page -->
	<aside class="right-side sizeHeight"> <!-- Content Header (Page header) -->
	<section class="content-header">
	<h1>
		Home <small>Bienvenido</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-home"></i> Home</a></li>
	</ol>
	</section> <!-- Main content --> <section class="content"> <!-- top row -->
	<div class="row">
		<div class="col-sm-12 col-sm-12 col-md-12 col-lg-12">
			<h2>Bienvenido al SmartTime</h2>
		</div>
	</div>

	<div class="row">
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			<div class="box box-default">
				<div class="box-header with-border">
					<h3 class="box-title">Browser Usage</h3>

					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool"
							data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button type="button" class="btn btn-box-tool"
							data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="row">
						<div class="col-md-8">
							<div class="chart-responsive">
								<canvas id="chartTardanza" height="150"></canvas>
							</div>
							<!-- ./chart-responsive -->
						</div>
						<!-- /.col -->
						<div class="col-md-4">
							<ul class="chart-legend clearfix">
								<li><i class="fa fa-circle-o text-red"></i> 100</li>
								<li><i class="fa fa-circle-o text-green"></i> 34</li>
							</ul>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.box-body -->
				<div class="box-footer no-padding">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="#">United States of America <span
								class="pull-right text-red"><i class="fa fa-angle-down"></i>
									12%</span></a></li>
						<li><a href="#">India <span class="pull-right text-green"><i
									class="fa fa-angle-up"></i> 4%</span></a></li>
						<li><a href="#">China <span
								class="pull-right text-yellow"><i
									class="fa fa-angle-left"></i> 0%</span></a></li>
					</ul>
				</div>
				<!-- /.footer -->
			</div>
		</div>
		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			<div class="box box-default">
				<div class="box-header with-border">
					<h3 class="box-title">Browser Usage</h3>

					<div class="box-tools pull-right">
						<button type="button" class="btn btn-box-tool"
							data-widget="collapse">
							<i class="fa fa-minus"></i>
						</button>
						<button type="button" class="btn btn-box-tool"
							data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div class="row">
						<div class="col-md-8">
							<div class="chart-responsive">
								<canvas id="chartAsistencia" height="150"></canvas>
							</div>
							<!-- ./chart-responsive -->
						</div>
						<!-- /.col -->
						<div class="col-md-4">
							<ul class="chart-legend clearfix">
								<li><i class="fa fa-circle-o text-red"></i> Chrome</li>
								<li><i class="fa fa-circle-o text-green"></i> IE</li>
								<li><i class="fa fa-circle-o text-yellow"></i> FireFox</li>
								<li><i class="fa fa-circle-o text-aqua"></i> Safari</li>
								<li><i class="fa fa-circle-o text-light-blue"></i> Opera</li>
								<li><i class="fa fa-circle-o text-gray"></i> Navigator</li>
							</ul>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.box-body -->
				<div class="box-footer no-padding">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="#">United States of America <span
								class="pull-right text-red"><i class="fa fa-angle-down"></i>
									12%</span></a></li>
						<li><a href="#">India <span class="pull-right text-green"><i
									class="fa fa-angle-up"></i> 4%</span></a></li>
						<li><a href="#">China <span
								class="pull-right text-yellow"><i
									class="fa fa-angle-left"></i> 0%</span></a></li>
					</ul>
				</div>
				<!-- /.footer -->
			</div>
		</div>
	</div>


	</section> </aside>
</body>

<script type="text/javascript">
	
var vTeam = document.getElementById('hdIdTeam').value;
var vUsuario = $('#smUsuario').text();
listDashboard();


function listDashboard(){
	
	$(document).ready(function(){
	 var pieChartTardanza = document.getElementById("chartTardanza").getContext("2d");  // $("#chartTardanza").get(0).getContext("2d");
	 var pieChartAsistencia = document.getElementById("chartAsistencia").getContext("2d");  // $("#chartAsistencia").get(0).getContext("2d");
	 
	 
			var src = "ServletWReporteMarcador";
			$.post(src, {strOperation : 'listTopDia', strIdLogin : pstrIdLogin, iTeam : piTeam},
					function(pdata) {
					var obj = JSON.parse(pdata);
					
					alert(obj.Usuario.codigo + ' | '+ obj.Usuario.cuenta + ' | '+ obj.Usuario.NombreCompleto + ' | '+ obj.Usuario.Id);
					});
	 
	 
	 var data = {
			    labels: [
			        "Tardanza",
			        "Puntualidad"
			    ],
			    datasets: [
			        {
			            data: [300, 50],
			            backgroundColor: [
			                "#f56954",
			                "#00a65a"
			            ],
			            hoverBackgroundColor: [
			                "#FF6384",
			                "#36A2EB"
			            ]
			        }]
			};
	 
	  var options = {
	    //Boolean - Whether we should show a stroke on each segment
	    segmentShowStroke: true,
	    //String - The colour of each segment stroke
	    segmentStrokeColor: "#fff",
	    //Number - The width of each segment stroke
	    segmentStrokeWidth: 1,
	    //Number - The percentage of the chart that we cut out of the middle
	    percentageInnerCutout: 50, // This is 0 for Pie charts
	    //Number - Amount of animation steps
	    animationSteps: 100,
	    //String - Animation easing effect
	    animationEasing: "easeOutBounce",
	    //Boolean - Whether we animate the rotation of the Doughnut
	    animateRotate: true,
	    //Boolean - Whether we animate scaling the Doughnut from the centre
	    animateScale: false,
	    //Boolean - whether to make the chart responsive to window resizing
	    responsive: true,
	    // Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
	    maintainAspectRatio: false,
	    //String - A tooltip template
	    tooltipTemplate: "15000 users"
	  };
	  //Create pie or douhnut chart
	  // You can switch between pie and douhnut using the method below.
// 	  pieChart.Doughnut(PieData, pieOptions);
	  
	  var myDoughnutChart = new Chart(pieChartTardanza, {
		    type: 'doughnut',
		    data: data,
		    options: options
		});
	  
	
	});
	  
}





</script>

</html>