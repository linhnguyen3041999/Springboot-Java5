<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/common/taglib.jsp"%>
<c:url var="categoryAPI" value="/api/category" />
<c:url var="categoryURL" value="/admin/category/list" />
<!-- Main content -->
		<!-- Small boxes (Stat box) -->
		<div class="row">
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box bg-info">
					<div class="inner">
						<h3>150</h3>

						<p>New Orders</p>
					</div>
					<div class="icon">
						<i class="ion ion-bag"></i>
					</div>
					<a href="#" class="small-box-footer">More info <i
						class="fas fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box bg-success">
					<div class="inner">
						<h3>
							53<sup style="font-size: 20px">%</sup>
						</h3>

						<p>Bounce Rate</p>
					</div>
					<div class="icon">
						<i class="ion ion-stats-bars"></i>
					</div>
					<a href="#" class="small-box-footer">More info <i
						class="fas fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box bg-warning">
					<div class="inner">
						<h3>44</h3>

						<p>User Registrations</p>
					</div>
					<div class="icon">
						<i class="ion ion-person-add"></i>
					</div>
					<a href="#" class="small-box-footer">More info <i
						class="fas fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
			<div class="col-lg-3 col-6">
				<!-- small box -->
				<div class="small-box bg-danger">
					<div class="inner">
						<h3>65</h3>

						<p>Unique Visitors</p>
					</div>
					<div class="icon">
						<i class="ion ion-pie-graph"></i>
					</div>
					<a href="#" class="small-box-footer">More info <i
						class="fas fa-arrow-circle-right"></i></a>
				</div>
			</div>
			<!-- ./col -->
		</div>
		<!-- /.row -->

		<div class="row">
			<!-- right col (We are only adding the ID to make the widgets sortable)-->
			<section class="col-lg-12 connectedSortable">
				<!-- solid sales graph -->
				<div class="card">
					<div class="card-header border-0">
						<h3 class="card-title">
							<i class="fas fa-th mr-1"></i> Sales Graph
						</h3>

						<div class="card-tools">
							<button type="button" class="btn bg-info btn-sm"
								data-card-widget="collapse">
								<i class="fas fa-minus"></i>
							</button>
							<button type="button" class="btn bg-info btn-sm"
								data-card-widget="remove">
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
					<div class="card-body">
						<canvas id="canvasChart"
							style="min-height: 350px; height: 350px; max-height: 350px; max-width: 100%;"></canvas>
					</div>
			</section>
			<!-- right col -->
		</div>
		<script type="text/javascript">
	var totalPriceLast6Months =[<c:forEach items="${chartData}" var="childArray" >
    [
        <c:forEach items="${childArray}" var="val" >
	   ${val},
	</c:forEach>
    ],
</c:forEach>];
	
	var arrayLabels = totalPriceLast6Months[0];
	var arrayData = totalPriceLast6Months[1];
		
	var ctx = document.getElementById('canvasChart').getContext('2d');
	var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: arrayLabels,
	        datasets: [{
	            label: 'Doanh thu 6 tháng gần nhất',
	            data: arrayData,
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	    	responsive: true,
	    	maintainAspectRatio: false,
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: false,
	                    callback: function(value, index, values) {
	                        return value.toLocaleString("vi-VN",{style:"currency", currency:"VND"});
	                      }
	                }
	            }]
	        }
	    }
	});
</script>