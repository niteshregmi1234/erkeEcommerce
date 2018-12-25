
if ($.cookie("theme_csspath")) {
	$('link#theme-stylesheet').attr("href", $.cookie("theme_csspath"));
}

$(function() {

	animations();
	carousels();
	utils();
	demo();
});


$(window).load(function() {
	$(this).alignElementsSameHeight();
});

$(window).resize(function() {
	setTimeout(function() {
		$(this).alignElementsSameHeight();
	}, 150);
});

/* for demo purpose only - can be deleted */

function demo() {

	if ($.cookie("theme_csspath")) {
		$('link#theme-stylesheet').attr("href", $.cookie("theme_csspath"));
	}

	$("#colour").change(function() {

		if ($(this).val() !== '') {

			var theme_csspath = 'css/style.' + $(this).val() + '.css';

			$('link#theme-stylesheet').attr("href", theme_csspath);

			$.cookie("theme_csspath", theme_csspath, {expires: 365, path: '/'});
		}

		return false;
	});
}

/* product detail gallery */


function utils() {


	/* click on the box activates the radio */

	$('#checkout').on('click', '.box.shipping-method, .box.payment-method', function(e) {
		var radio = $(this).find(':radio');
		radio.prop('checked', true);
	});
	/* click on the box activates the link in it */

	$('.box.clickable').on('click', function(e) {

		window.location = $(this).find('a').attr('href');
	});
	/* external links in new window*/

	$('.external').on('click', function(e) {

		e.preventDefault();
		window.open($(this).attr("href"));
	});
	/* animated scrolling */

	$('.scroll-to, .scroll-to-top').click(function(event) {

		var full_url = this.href;
		var parts = full_url.split("#");
		if (parts.length > 1) {

			scrollTo(full_url);
			event.preventDefault();
		}
	});
	function scrollTo(full_url) {
		var parts = full_url.split("#");
		var trgt = parts[1];
		var target_offset = $("#" + trgt).offset();
		var target_top = target_offset.top - 100;
		if (target_top < 0) {
			target_top = 0;
		}

		$('html, body').animate({
			scrollTop: target_top
		}, 1000);
	}
}

/* carousels */

function carousels() {

	$("#get-inspired").owlCarousel({
		navigation: true, // Show next and prev buttons
		slideSpeed: 300,
		paginationSpeed: 400,
		autoPlay: true,
		stopOnHover: true,
		singleItem: true,
		afterInit: ''
	});

    $('.product-slider1').owlCarousel({
        navigation: true, // Show next and prev buttons
        slideSpeed: 300,
        paginationSpeed: 400,
        items:5,
        center:true,
        afterInit: function() {
            $('.product-slider1 .item').css('visibility', 'visible');
        }
    });
    $('.product-slider2').owlCarousel({
        navigation: true, // Show next and prev buttons
        slideSpeed: 300,
        paginationSpeed: 400,
        items:5,
        center:true,
        afterInit: function() {
            $('.product-slider2 .item').css('visibility', 'visible');
        }
    });

	$('.product-slider').owlCarousel({
		navigation: true, // Show next and prev buttons
		slideSpeed: 300,
		paginationSpeed: 400,
		items:5,
		center:true,
		afterInit: function() {
			$('.product-slider .item').css('visibility', 'visible');
		}
	});
	$('#main-slider').owlCarousel({
		navigation: true, // Show next and prev buttons
		slideSpeed: 300,
		paginationSpeed: 400,
		autoPlay: true,
		stopOnHover: true,
		singleItem: true,
		afterInit: ''
	});

}

/* animations */

function animations() {
	delayTime = 0;
	$('[data-animate]').css({opacity: '0'});
	$('[data-animate]').waypoint(function(direction) {
			delayTime += 150;
			$(this).delay(delayTime).queue(function(next) {
				$(this).toggleClass('animated');
				$(this).toggleClass($(this).data('animate'));
				delayTime = 0;
				next();
				//$(this).removeClass('animated');
				//$(this).toggleClass($(this).data('animate'));
			});
		},
		{
			offset: '90%',
			triggerOnce: true
		});

	$('[data-animate-hover]').hover(function() {
		$(this).css({opacity: 1});
		$(this).addClass('animated');
		$(this).removeClass($(this).data('animate'));
		$(this).addClass($(this).data('animate-hover'));
	}, function() {
		$(this).removeClass('animated');
		$(this).removeClass($(this).data('animate-hover'));
	});

}

$.fn.alignElementsSameHeight = function() {
		$('.same-height-row').each(function() {

			var maxHeight = 0;

			var children = $(this).find('.same-height');

			children.height('auto');

			if ($(document).width() > 768) {
				children.each(function() {
					if ($(this).innerHeight() > maxHeight) {
						maxHeight = $(this).innerHeight();
					}
				});

				children.innerHeight(maxHeight);
			}

			maxHeight = 0;
			children = $(this).find('.same-height-always');

			children.height('auto');

			children.each(function() {
				if ($(this).innerHeight() > maxHeight) {
					maxHeight = $(this).innerHeight();
				}
			});

			children.innerHeight(maxHeight);

		});



	}

