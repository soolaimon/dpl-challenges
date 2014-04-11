$(function() {
	hideFlash();
	setHelp();
	$('.box').hover(
		function() { $(this).css('border-color', '#AB2023'); },
		function() { $(this).css('border-color', '#CCCCCC'); }
	);
	var bgcolor
	$('.itemtable tr').hover(
		function() { bgcolor = $(this).css('background-color'); $(this).css('background-color', '#ffffff'); },
		function() { $(this).css('background-color', bgcolor); }
	);
});

function hideFlash() {
  if($('#flash').length > 0) {
    setTimeout(function() {
      $('#flash').fadeOut('slow');
    }, 5000);
  }
}

function setHelp() {
	if($('.help').length > 0) {
		$('a.help').tooltip({
			tip: '#help'
		});
	}
}
jQuery.fn.extend({
	tooltip: function(options) {
		var box = options['tip'] || this.title;
		var el = this;
		xOffset = 25;//up & down
		yOffset = 15;// left & right
		
		$(box).css({
			'position': 'absolute',
			'z-index': 100,
			'display': 'none',
			'left': ($(el).position().left + $(el).width()),
			'top': $(el).position().top
		});

    $(el).live("mouseenter", function() {
			$(this).css('z-index', 2);
      $(box).fadeIn("fast", function() {
				$(el).mousemove(function(e) {
					$(box)
						.css("top",(e.pageY - xOffset) + "px")
	        	.css("left",(e.pageX + yOffset) + "px");
				});
			});
    });
    $(el).live("mouseleave", function() {

			$(el).css('z-index', 1);
      $(box).fadeOut("fast", function() {
				
			});
    });
	}
});