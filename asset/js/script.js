$(window).on('load',function(){
        $('.hrd-link').click(function(){
            var submenu = $(this).parent().children('.hrd-sub-menu');
            if (submenu.css('display') == 'none') {
                $('.hrd-sub-menu').slideUp(); //first hide any previously showing submenu's
                submenu.slideDown(); //then show the current submenu
            } else {
                submenu.slideUp(); //hide the current submenu again
            }
        });
    });

$(function(){
	var url = window.location;
    // var element = $('ul.nav a').filter(function() {
    //     return this.href == url;
    // }).addClass('active').parent().parent().addClass('in').parent();
    var element = $('ul.hrd-sub-menu a').filter(function() {
        return this.href == url;
    }).addClass('is-active').parent();

    while (true) {
        if (element.is('li')) {
            element = element.parent().addClass('collapse').parent();
        } else {
            break;
        }
    }
});
function getPage(a,b){
	$("#loading").show();
	$("#main").load(a,function(response,status,xhr){
		if (status=="success"){
			$("#loading").hide();
		}
	});
	for (i = 0; i < 100; i++) {
		var delclass = "url"+i;
		$('#'+delclass).removeClass();
	}
	$('#' + b).addClass("is-active");
	//$("#loading").hide();
}