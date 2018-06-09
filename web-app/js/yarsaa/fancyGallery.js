
var width=$(window).width();
var index=0;
jQuery(function($) {
    var element = document.getElementById("thumb0");
    element.className += " active";
    // define the gallery object
    var $gallery = $('#thumbs');

    // Build array of objects to open in Fancybox.
    var $imgs = [];
    $('a', $gallery).each(function() {
        $imgs.push({'src': $(this).data('zoom-image')});
    });
    // Initiate ElevateZoom
    if(width>=1000) {
        $("#zoom").elevateZoom(
            {
                gallery: $gallery.attr('id'),
                cursor: 'pointer',
                zoomWindowWidth:500,
                zoomWindowHeight:500,
                galleryActiveClass: 'active',
                responsive: true,
                imageCrossfade: true
            }
        );
    }
    else{
        $("#zoom").elevateZoom(
            {
                gallery: $gallery.attr('id'),
                zoomType: "inner",
                cursor: "crosshair",
                responsive: true
            }
        );
    }
    // Bind Fancybox to clicking the zoom image.
    // Open it to the currently active index.
    $("#zoom").on("click", function(e) {
        $.fancybox.open($imgs, false,index);
        e.preventDefault();
    });
});
$(".thumb").click(function(e) {
     switchImage($(this));
        index = $(".thumb").index(this);
        e.preventDefault();
    }
);


function switchImage(thumb) {
    $('.thumb').removeClass('active');
    thumb.addClass('active');
}
