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
<title>Groovy Apparel a E-Commerce & Fashion Category Bootstrap Responsive Website Template | Men's Single :: W3layouts</title>

<!-- Meta-Tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="Groovy Apparel a Responsive Web Template, Bootstrap Web Templates, Flat Web Templates, Android Compatible Web Template, Smartphone Compatible Web Template, Free Webdesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
<!-- //Meta-Tags -->
<meta name="layout" content="endUserYamsaa">
<!-- Custom-Stylesheet-Links -->
<!-- Bootstrap-CSS -->

<!-- Fonts -->

</head>
<!-- //Head -->



<!-- Body -->
<body>



	<!-- Header -->
	<!-- //Header -->



	<!-- Single-Product-View -->
<div class="w3aitssinglewthree">
		<div class="container">

			<div class="products">
			<div class="single-page">
				<div class="single-page-row" id="detail-21">
					<div class="col-md-6 single-top-left">
						<div class="flexslider">
							<ul class="slides">
								<li data-thumb="${resource(dir: "images/allProducts/frontImage",file: "${productInstance.frontImageName}")}" >
									<div class="thumb-image detail_images">
										<img class="img-responsive product"  data-imagezoom="true" src="${resource(dir: "images/allProducts/frontImage",file: "${productInstance.frontImageName}")}"></div>

								</li>
								<li data-thumb="${resource(dir: "images/allProducts/backImage",file: "${productInstance.backImageName}")}">

									 <div class="thumb-image">
										 <img class="img-responsive product" data-imagezoom="true" src="${resource(dir: "images/allProducts/backImage",file: "${productInstance.backImageName}")}"></div>


								</li>
								<li data-thumb="${resource(dir: "images/allProducts/sideImage",file: "${productInstance.sideImageName}")}">
									<div class="thumb-image">
										<img class="img-responsive product" data-imagezoom="true" src="${resource(dir: "images/allProducts/sideImage",file: "${productInstance.sideImageName}")}"></div>
								</li>
							</ul>
						</div>
					</div>
					<style>
					.product {
						position: relative;
						float: left;
						height: 725px;
						background-position: 50% 50%;
						background-repeat:   no-repeat;
						background-size:     cover;
					}

					</style>

					<div class="col-md-6 single-top-right">
						<h1 class="item_name">${productInstance.productDetails.productName}</h1>
						<p>This item will be delivered within 5-10 working days.</p>
						<div class="rating">
							<span class="starRating">
								<input id="rating5" type="radio" name="rating" value="5">
								<label for="rating5">5</label>
								<input id="rating4" type="radio" name="rating" value="4" checked>
								<label for="rating4">4</label>
								<input id="rating3" type="radio" name="rating" value="3">
								<label for="rating3">3</label>
								<input id="rating2" type="radio" name="rating" value="2">
								<label for="rating2">2</label>
								<input id="rating1" type="radio" name="rating" value="1">
								<label for="rating1">1</label>
							</span>
						</div>
						<div class="single-price">
							<ul>
								<li>Rs.${productInstance.productDetails.price-(productInstance.productDetails.price*productInstance.productDetails.discountPercentage/100)} <small>${productInstance.productDetails.discountPercentage}% Off</small></li>
								<li><del>Rs.${productInstance.productDetails.price}</del></li>
								<li><a href="#"><i class="fa fa-gift" aria-hidden="true"></i>Apply Coupon</a></li>

							</ul>
						</div>
						<p class="single-price-text">${productInstance.productDetails.briefDescription}</p>
						<div class="cbp-pgcontent aitssinglew3" id="mens_single">
							<button class="btn btn-danger agileits my-cart-btn" data-id="mens_single" data-name="Black Leather Jacket" data-summary="Black Leather Jacket" data-price="67.5" data-quantity="1" data-image="images/s1.jpg"><i class="fa fa-cart-plus" aria-hidden="true"></i> Add To Cart</button>
							<div class="clearfix"></div>
						</div>

						<div class="agilesocialwthree">
							<h4>Share this Product</h4>
							<ul class="social-icons">
								<li><a href="#" class="facebook w3ls" title="Go to Our Facebook Page"><i class="fa w3ls fa-facebook-square" aria-hidden="true"></i></a></li>
								<li><a href="#" class="twitter w3l" title="Go to Our Twitter Account"><i class="fa w3l fa-twitter-square" aria-hidden="true"></i></a></li>
								<li><a href="#" class="instagram wthree" title="Go to Our Instagram Account"><i class="fa wthree fa-instagram" aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>

			<div class="aitsaccordionw3layouts">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne">
							<h4 class="panel-title asd">
								<a class="pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Description <span class="glyphicon glyphicon glyphicon-chevron-down" aria-hidden="true"></span><i class="glyphicon glyphicon-menu-up" aria-hidden="true"></i>
								</a>
							</h4>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
							<div class="panel-body panel_text">
								<div class="scrollbar" id="style-2">
									${productInstance.productDetails.detailDescription}
								</div>
							</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingTwo">
							<h4 class="panel-title asd">
								<a class="pa_italic collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">More Colors (${sameProductList.size()}) <span class="glyphicon glyphicon glyphicon-chevron-down" aria-hidden="true"></span><i class="glyphicon glyphicon-menu-up" aria-hidden="true"></i>
								</a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
							<div class="accordion-image">
								<div class="ac-img">
									<g:each in="${sameProductList}" var="list">
									<g:link action="singleProduct" id="${list.id}" controller="endUser">
										<img src="${resource(dir: "images/allProducts/frontImage",file: "${list.frontImageName}")}" height="341" width="">

									</g:link>
									</g:each>
								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingThree">
							<h4 class="panel-title asd">
								<a class="pa_italic collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Rating & Reviews (40+) <span class="glyphicon glyphicon glyphicon-chevron-down" aria-hidden="true"></span><i class="glyphicon glyphicon-menu-up" aria-hidden="true"></i>
								</a>
							</h4>
						</div>
						<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
							<h3>"Excellent Quality & Fitting!"</h3>
							<h4>Léon, Certified Buyer.</h4>
							<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.</p>
							<span>5 Stars</span>
							<a href="#" class="next">Next Review &rarr;</a>
						</div>
					</div>

					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingFour">
							<h4 class="panel-title asd">
								<a class="pa_italic collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">Shipping Info <span class="glyphicon glyphicon glyphicon-chevron-down" aria-hidden="true"></span><i class="glyphicon glyphicon-menu-up" aria-hidden="true"></i>
								</a>
							</h4>
						</div>
						<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
							<h3>Shipping</h3>
							<ul class="ship">
								<li class="day"><i class="fa fa-calendar" aria-hidden="true"></i> 5-10 Business Days</li>
								<li class="home"><i class="fa fa-truck" aria-hidden="true"></i> Free Home Delivery</li>
								<li class="cod"><i class="fa fa-male" aria-hidden="true"></i> Cash On Delivery Available*</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>

		</div>
	</div>
	<!-- //Single-Product-View -->



	<!-- Newsletter -->
	<div class="w3lsnewsletter" id="w3lsnewsletter">
		<div class="container">
			<div class="w3lsnewsletter-grids">
				<div class="col-md-5 w3lsnewsletter-grid w3lsnewsletter-grid-1 subscribe">
					<h2>Subscribe to our Newsletter</h2>
				</div>
				<div class="col-md-7 w3lsnewsletter-grid w3lsnewsletter-grid-2 email-form">
					<form action="#" method="post">
						<input class="email" type="email" name="Email" placeholder="Email Address" required="">
						<input type="submit" class="submit" value="SUBSCRIBE">
					</form>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- //Newsletter -->



	<!-- Footer -->
	<!-- //Footer -->



	<!-- Copyright -->
	<!-- //Copyright -->



	<!-- Custom-JavaScript-File-Links -->

	<!-- Custom-JavaScript-File-Links -->

	<!-- cart-js -->
	<script>
//        w3l.render();

        w3l.cart.on('w3agile_checkout', function (evt) {
        	var items, len, i;

        	if (this.subtotal() > 0) {
        		items = this.items();

        		for (i = 0, len = items.length; i < len; i++) {
        		}
        	}
        });
    </script>  
	<!-- //cart-js --> 


		<!-- Dropdown-Menu-JavaScript -->
			<script>
				$(document).ready(function(){
					$(".dropdown").hover(
						function() {
							$('.dropdown-menu', this).stop( true, true ).slideDown("fast");
							$(this).toggleClass('open');
						},
						function() {
							$('.dropdown-menu', this).stop( true, true ).slideUp("fast");
							$(this).toggleClass('open');
						}
					);
				});
			</script>
		<!-- //Dropdown-Menu-JavaScript -->

		<!-- Popup-Box-JavaScript -->
			<script>
				$(document).ready(function() {
					$('.popup-with-zoom-anim').magnificPopup({
						type: 'inline',
						fixedContentPos: false,
						fixedBgPos: true,
						overflowY: 'auto',
						closeBtnInside: true,
						preloader: false,
						midClick: true,
						removalDelay: 300,
						mainClass: 'my-mfp-zoom-in'
					});
				});
			</script>
		<!-- //Popup-Box-JavaScript -->

		<!-- FlexSlider-JavaScript -->
			<script>
				$(window).load(function() {
					$('.flexslider').flexslider({
						animation: "slide",
						controlNav: "thumbnails"
					});
				});
			</script>
		<!-- //FlexSlider-JavaScript -->


	<!-- //Custom-JavaScript-File-Links -->


</body>
<!-- //Body -->



</html>