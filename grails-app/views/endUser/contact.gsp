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
					<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:companyInformation.coverImageName])}" class="img-responsive">

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
	</div>
	<div class="container">
		<div class="col-md-12">
			&nbsp;
		</div>
	</div>
	<div class="container">
		<div>
			<div class="col-md-6">
				<div class="imgwrapper">
					<img src="${createLink(controller: 'imageRender', action:'renderImage',params: [imageName:companyInformation.shopInsideViewImageName])}" class="img-responsive">
				</div>
			</div>
			<div class="col-md-6">
				<div class="box">
					<div>
						&nbsp;
					</div>
						<h1>Where We Are</h1>
							<p>${companyInformation.descriptionWhereWeAre}</p>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="col-md-12">
			&nbsp;
		</div>
		<div class="col-md-12">
			<div class="box" id="contact">
				<h1>Contact</h1>
				<p class="lead">Are you curious about something? Do you have some kind of problem with our products?</p>
				<p>Please feel free to contact us, our customer service center is working for you 24/7.</p>
				<hr>
				<div class="row">
					<div class="col-sm-4">
						<h3><i class="fa fa-map-marker"></i> Address</h3>
						<p>
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
							<ul class="contact-email">
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
					<form action="/checkOut/sendFeedBackMessage" method="post" id="reg_form">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label for="firstname">Firstname</label>
									<input type="text" name="first_name" placeholder="firstName" class="form-control" id="firstname">
								</div>
							</div>
							<div class="col-sm-12">
								<div class="form-group">
									<label for="lastname">Lastname</label>
									<input type="text" name="last_name" placeholder="lastName" class="form-control" id="lastname">
								</div>
							</div>
							<div class="col-sm-12">
								<div class="form-group">
									<label for="email">Email</label>
									<input type="text" name="email" placeholder="email@hostname.com" class="form-control" id="email">
								</div>
							</div>
							<div class="col-sm-12">
								<div class="form-group">
									<label for="subject">Subject</label>
									<input type="text" name="subject" class="form-control" placeholder="atleast 10 letters" id="subject">
								</div>
							</div>
							<div class="col-sm-12">
								<div class="form-group">
									<label for="message">Message</label>
									<textarea id="message" name="message" placeholder="atleast 30 letters" class="form-control"></textarea>
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

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3-VdiQWco8261vT8eXl6gxnT9rm8AhpI&callback=initMap">
</script>

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

<script type="text/javascript">

	$(document).ready(function() {
		$('#reg_form').bootstrapValidator({
					// To use feedback icons, ensure that you use Bootstrap v3.1.0 or later

					fields: {
						first_name: {
							validators: {
								stringLength: {
									min: 2,
								},
								notEmpty: {
									message: 'Please supply your first name'
								}
							}
						},
						last_name: {
							validators: {
								stringLength: {
									min: 2,
								},
								notEmpty: {
									message: 'Please supply your last name'
								}
							}
						},


						email: {
							validators: {
								notEmpty: {
									message: 'Please supply your email address'
								},
								emailAddress: {
									message: 'Please supply a valid email address'

								},

							}
						},
						subject: {
							validators: {
								stringLength: {
									min: 10,
								},
								notEmpty: {
									message: 'Please supply your subject'
								}
							}
						},
						message: {
							validators: {
								stringLength: {
									min: 30,
								},
								notEmpty: {
									message: 'Please supply your message'
								}
							}
						}



					}
				})


				.on('success.form.bv', function(e) {
					$('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
					$('#reg_form').data('bootstrapValidator').resetForm();

					// Prevent form submission
					e.preventDefault();

					// Get the form instance
					var $form = $(e.target);

					// Get the BootstrapValidator instance
					var bv = $form.data('bootstrapValidator');

					// Use Ajax to submit form data
				});
	});

</script>
<g:if test="${flash.message}">
	<script>
		window.addEventListener("load",function(){
			bootbox.alert({
				message:"${flash.message}",
				size: 'small',
				callback: function(){
					location.reload();
				}

			});

		});

	</script>
</g:if>

</body>

</html>