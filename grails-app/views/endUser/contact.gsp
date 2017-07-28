<!DOCTYPE html>
<html lang="en">

<head>
<meta name="layout" content="userYarsaa">

</head>

<body>
<!-- *** TOPBAR ***
 _________________________________________________________ -->

<!-- *** TOP BAR END *** -->

<!-- *** NAVBAR ***
 _________________________________________________________ -->

<!-- /#navbar -->

<!-- *** NAVBAR END *** -->


	<div id="content">
	<div class="container">
		<div class="col-md-12">
			<div id="main-slider">
				<div class="item coverUp">
					<img src="${resource(dir: "images/companyInformation",file: "${companyInformation.coverImageName}")}" alt="" class="img-responsive">
				</div>
			</div>
			<!-- /#main-slider -->
		</div>
	</div>
	<style>
	.coverUp img{
		height:520px;
		width: 1108px;
	}

	</style>

	<div class="container">

			<div class="col-md-12">
				<ul class="breadcrumb">
					<li><g:link action="userHome" controller="endUser">Home</g:link>
					</li>
					<li>Contact</li>
				</ul>

			</div>

		<div class="col-md-12">
			&nbsp;
</div>
		<div class="col-md-12" data-animate="fadeInUp">
			<div class="col-md-6">
				<div class="imgwrapper">
					<img class="img-responsive" src="${resource(dir: "images/companyInformation",file: "${companyInformation.shopInsideViewImageName}")}">


				</div>

			</div>
			<div class="col-md-6">
				<div class="box" style="height: 393px;">
<div>
	&nbsp;
</div>
					<h1>Where We Are</h1>
					<p>${companyInformation.descriptionWhereWeAre}</p>
				</div>


			</div>
		</div>
		<div class="col-md-12">
			&nbsp;
</div>
			<div class="col-md-12" data-animate="fadeInUp">


				<div class="box" id="contact">
					<h1>Contact</h1>

					<p class="lead">Are you curious about something? Do you have some kind of problem with our products?</p>
					<p>Please feel free to contact us, our customer service center is working for you 24/7.</p>

					<hr>

					<div class="row">
						<div class="col-sm-4">
							<h3><i class="fa fa-map-marker"></i> Address</h3>
							<p>Something mall
								<br>${companyInformation.location1}
								<br>${companyInformation.location2}
								<br>${companyInformation.location3}
								<br>
								<strong>${companyInformation.location4}</strong>
							</p>
						</div>
						<!-- /.col-sm-4 -->
						<div class="col-sm-4">
							<h3><i class="fa fa-phone"></i> Call center</h3>
							<p class="text-muted">This number is toll free if calling from Nepal otherwise we advise you to use the electronic form of communication.</p>
							<p><strong>${companyInformation.mobileNUmber}/${companyInformation.phoneNumber}</strong>

						</p>
						</div>
						<!-- /.col-sm-4 -->
						<div class="col-sm-4">
							<h3><i class="fa fa-envelope"></i> Electronic support</h3>
							<p class="text-muted">Please feel free to write an email to us or to use our electronic ticketing system.</p>
							<ul>
								<li><strong><a href="mailto:">${companyInformation.emailAddress}</a></strong>
								</li>
							</ul>
						</div>
						<!-- /.col-sm-4 -->
					</div>
					<!-- /.row -->

					<hr>

					<div id="map">

					</div>

					<hr>
					<h2>Contact form</h2>

					<form>
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="firstname">Firstname</label>
									<input type="text" class="form-control" id="firstname">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="lastname">Lastname</label>
									<input type="text" class="form-control" id="lastname">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="email">Email</label>
									<input type="text" class="form-control" id="email">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="subject">Subject</label>
									<input type="text" class="form-control" id="subject">
								</div>
							</div>
							<div class="col-sm-12">
								<div class="form-group">
									<label for="message">Message</label>
									<textarea id="message" class="form-control"></textarea>
								</div>
							</div>

							<div class="col-sm-12 text-center">
								<button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i> Send message</button>

							</div>
						</div>
						<!-- /.row -->
					</form>


				</div>


			</div>
			<!-- /.col-md-9 -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /#content -->


	<!-- *** FOOTER ***
 _________________________________________________________ -->
	<!-- /#footer -->

	<!-- *** FOOTER END *** -->




	<!-- *** COPYRIGHT ***
 _________________________________________________________ -->
	<!-- *** COPYRIGHT END *** -->



<!-- /#all -->




<!-- *** SCRIPTS TO INCLUDE ***
 _________________________________________________________ -->


<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCeEMyutLZoUynPVyDpSbSy2SSNa98NPqs&callback=initMap"
		type="text/javascript"></script>

<script>


	function initialize() {

		var mapOptions = {
			zoom: 15,
			center: new google.maps.LatLng(27.713383, 85.345010),
			mapTypeId: google.maps.MapTypeId.ROAD,
			scrollwheel: false
		}
		var map = new google.maps.Map(document.getElementById('map'),
				mapOptions);

		var myLatLng = new google.maps.LatLng(27.713383, 85.345010);
		var marker = new google.maps.Marker({
			position: myLatLng,
			map: map
		});
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>


</body>

</html>