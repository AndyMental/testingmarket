$(function () {
"use strict"; // Start of use strict

/*------------------------------------------------
 * Preloader
------------------------------------------------*/
  $(window).load(function() {
    $('#loading').fadeOut();
    $('#preloader').delay(300).fadeOut('slow');
       $('#modal1').modal('show');
 });
/*------------------------------------------------
 * Affix
------------------------------------------------*/
    // jQuery for page scrolling feature - requires jQuery Easing plugin
    $('a.page-scroll').on('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: ($($anchor.attr('href')).offset().top - 0)
        }, 1250, 'easeInOutExpo');
        event.preventDefault();
    });

    // Highlight the top nav as scrolling occurs
    $('body').scrollspy({
        target: '.scroll',
        offset: 0
    })

    // Offset for Main Navigation
    $('#mainNav').affix({
        offset: {
            top: 100
        }
    })
/*------------------------------------------------
 * Initialize WOW.js Scrolling Animations
------------------------------------------------*/

    new WOW().init();
});


$(function () {
    productDetailGallery(4000);
});

function productDetailGallery(confDetailSwitch) {
    $('#productMain .thumb:first').addClass('active');
    timer = setInterval(autoSwitch, confDetailSwitch);
    $("#productMain .thumb").click(function (e) {

    switchImage($(this));
    clearInterval(timer);
    timer = setInterval(autoSwitch, confDetailSwitch);
    e.preventDefault();
    }
    );
    $('#productMain #mainImage').hover(function () {
    clearInterval(timer);
    }, function () {
    timer = setInterval(autoSwitch, confDetailSwitch);
    });
    function autoSwitch() {
    var nextThumb = $('#productMain .thumb.active').closest('div').next('div').find('.thumb');
    if (nextThumb.length == 0) {
        nextThumb = $('#productMain .thumb:first');
    }
    switchImage(nextThumb);
    }

    function switchImage(thumb) {

    $('#productMain .thumb').removeClass('active');
    var bigUrl = thumb.attr('href');
    thumb.addClass('active');
    $('#productMain #mainImage img').attr('src', bigUrl);
    }
}
