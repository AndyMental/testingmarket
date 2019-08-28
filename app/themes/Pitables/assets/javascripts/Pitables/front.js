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
