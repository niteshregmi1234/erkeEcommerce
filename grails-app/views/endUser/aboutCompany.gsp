<!--
	Author: W3layouts
	Author URL: http://w3layouts.com
	License: Creative Commons Attribution 3.0 Unported
	License URL: http://creativecommons.org/licenses/by/3.0/
--> 
<!DOCTYPE html>
<html lang="zxx"> 
<!-- Head -->
<head>

<meta name="layout" content="endUserYamsaa">
</head>
<!-- //Head -->



<!-- Body -->
<body>



	<!-- Header -->
	<!-- //Header -->
<div class="agileheader-banner">
	<img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.coverImage}")}" width="1291" height="379">

</div>


<!-- Heading -->



	<!-- About-Us --><div class="wthreeabout">
		<div class="about-us-grids">
			<div class="col-md-6 about-us-grid about-us-images">
				<div class="col-md-6 about-us-image about-us-image1">
					<img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.aboutUs1Image}")}" width="321" height="215">

				</div>
				<div class="col-md-6 about-us-image about-us-image2">
					<img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.aboutUs2Image}")}" width="321" height="215">

				</div>
				<div class="col-md-6 about-us-image about-us-image3">
					<img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.aboutUs3Image}")}" width="321" height="215">

				</div>
				<div class="col-md-6 about-us-image about-us-image4">
					<img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.aboutUs4Image}")}" width="321" height="215">

				</div>
				<div class="clearfix"></div>
			</div>

			<div class="col-md-6 about-us-grid about-us-text">
				<h1>ABOUT US</h1>
				<p>
					${aboutUsInstance.aboutUsDescription}
				</p>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //About-Us -->



	<!-- Be-Yourself -->
	<div class="aitsyourself">
		<div class="aitsyourself-grids">

			<div class="col-md-5 aitsyourself-grid aitsyourself-grid1">
				
			</div>

			<div class="col-md-3 aitsyourself-grid aitsyourself-grid2">

				<h3>“${aboutUsInstance.quote}”</h3>
				<h4>― ${CompanyInformation.list()[0].proprietorName}</h4>
			</div>

			<div class="col-md-4 aitsyourself-grid aitsyourself-grid3">
				
			</div>
			<div class="clearfix"></div>

		</div>
	</div>
	<!-- //Be-Yourself -->



	<!-- Commercial -->
	<div class="aitscommercial">
			
		<div class="col-md-6 aitscommercial-grid aitscommercial-grid1">
			<h2>SHOPPING VIDEO</h2>
			<p>${aboutUsInstance.videoDescription}</p>
			<p class="w3teaseraits">Check out our latest commercial, teaser and behind the scenes film.</p>
			<a class="popup-with-zoom-anim" href="#small-dialog4">WATCH NOW</a>
		</div>

		<div class="col-md-6 aitscommercial-grid aitscommercial-grid2">
			<img src="${resource(dir: "images/otherStuffs",file: "${aboutUsInstance.videoDescrptionImage}")}" width="645" height="431">

		</div>
		<div class="clearfix"></div>

		<div id="small-dialog4" class="mfp-hide agileinfo">
			<div class="pop_up">
				<iframe src="https://player.vimeo.com/video/184401441"></iframe>
			</div>
			<button title="Close this" type="button" class="mfp-close">×</button>
		</div>

	</div>
	<!-- //Commercial -->



	<!-- Accessories -->
	<div class="w3laccessoriesaits">
		<div class="col-md-6 w3laccessoriesaits-grids w3laccessoriesaits-grids1">
			<div class="w3laccessoriesaits-grid w3laccessoriesaits-grid1">
				<div class="grid">
					<figure class="effect-apollo">
						<img class="b" src="${resource(dir: "images/allProducts/specialImage",file: "${aboutUsInstance.specialProduct1.specialImageName}")}">
						<figcaption></figcaption>
					</figure>
				</div>
				<h4>${aboutUsInstance.specialProduct1.productDetails.productName}</h4><br>
				<h6><g:link action="singleProduct" id="${aboutUsInstance.specialProduct1.id}" controller="endUser">Shop Now</g:link></h6>
			</div>
		</div>
		<div class="col-md-6 w3laccessoriesaits-grids w3laccessoriesaits-grids2">
			<div class="w3laccessoriesaits-grid w3laccessoriesaits-grid2">
				<div class="grid">
					<figure class="effect-apollo">
						<img class="b" src="${resource(dir: "images/allProducts/specialImage",file: "${aboutUsInstance.specialProduct2.specialImageName}")}">

						<figcaption></figcaption>
					</figure>
				</div>
				<h4>${aboutUsInstance.specialProduct2.productDetails.productName}</h4><br>
				<h6><g:link action="singleProduct" id="${aboutUsInstance.specialProduct2.id}" controller="endUser">Shop Now</g:link></h6>

			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- //Accessories -->
<style>
.b{
	position: relative;
	float: left;
	width:  600px;
	height: 330px;
	background-position: 50% 50%;
	background-repeat:   no-repeat;
	background-size:     cover;
}

</style>


	<!-- Shoes -->
	<div class="w3lsshoesaits">
		<div class="w3lsshoesaits-info">
			<h3>${aboutUsInstance.specialProductSubCategory.subCategoryName} TO DIE FOR</h3>
			<div class="wthreeshop-a">
				<g:link controller="endUser" action="allSubCategoryProducts" id="${aboutUsInstance.specialProductSubCategory.id}">SHOP ${aboutUsInstance.specialProductSubCategory.subCategoryName}</g:link>
			</div>
		</div>
	</div>





	<div class="agilenwew3lsfashions">
		<div class="container">

			%{--<h3>AVANT-GARDE FASHION</h3>--}%
			%{--<h4>Star Studded Launching of the Festival Collection in NYFW in</h4>--}%

			%{--<div class="agilenwew3lsfashions-aitstimer">--}%
				%{--<div class="clock">--}%
					%{--<div class="column days">--}%
						%{--<div class="timer" id="days"></div>--}%
						%{--<div class="text">DAYS</div>--}%
					%{--</div>--}%
					%{--<div class="timer days">:</div>--}%
					%{--<div class="column">--}%
						%{--<div class="timer" id="hours"></div>--}%
						%{--<div class="text">HOURS</div>--}%
					%{--</div>--}%
					%{--<div class="timer">:</div>--}%
					%{--<div class="column">--}%
						%{--<div class="timer" id="minutes"></div>--}%
						%{--<div class="text">MINUTES</div>--}%
					%{--</div>--}%
					%{--<div class="timer">:</div>--}%
					%{--<div class="column">--}%
						%{--<div class="timer" id="seconds"></div>--}%
						%{--<div class="text">SECONDS</div>--}%
					%{--</div>--}%
				%{--</div>--}%
			%{--</div>--}%

		</div>
	</div>
	<!-- //New-Fashions -->



	<!-- Newsletter -->
	<!-- //Newsletter -->
<script>

	window.onload=function () {
		$.ajax({
			url: "${createLink(controller:'endUser', action:'fetchAboutUrl')}"
		}).done(function(fileLocation){
			$('.aitsyourself-grid1').css('background-image', 'url(' + fileLocation[0] + ')');
			$('.aitsyourself-grid3').css('background-image', 'url(' + fileLocation[1] + ')');
			$('.w3lsshoesaits').css('background-image', 'url(' + fileLocation[2] + ')');
			$('.agilenwew3lsfashions').css('background-image', 'url(' + fileLocation[3] + ')');



		});


		};

</script>


	<!-- Footer -->
	<!-- //Footer -->



	<!-- Copyright -->
	<!-- //Copyright -->



	<!-- Custom-JavaScript-File-Links -->
	<!-- Custom-JavaScript-File-Links -->

	<!-- cart-js -->
	<!-- //cart-js -->


		<!-- Dropdown-Menu-JavaScript -->
		<!-- //Dropdown-Menu-JavaScript -->

		<!-- Popup-Box-JavaScript -->

		<!-- Countdown-Timer-JavaScript-File-Links -->

		<!-- //Countdown-Timer-JavaScript-File-Links -->

	<!-- //Custom-JavaScript-File-Links -->

	<!-- Bootstrap-JavaScript -->

</body>
<!-- //Body -->



</html>