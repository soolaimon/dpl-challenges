$(function() {
	newsletter();
	videoPlayer();
	photoGallery();
	$('a[rel^=prettyPhoto]').prettyPhoto({theme: 'dark_rounded'});
	billboard();
	studentSort();
	if(window.location.href.indexOf('?thank-you') != -1) {
		alert('Thank you for signing up!');
	}
});

function newsletter() {
	if($('.email').length > 0) {
		$('input.email').focus(function() {
			if(this.value=='ENTER EMAIL ADDRESS') this.value = '';
		});
		$('input.email').blur(function() {
			if(this.value=='') this.value='ENTER EMAIL ADDRESS';
		});
	}
}

function videoPlayer() {
	if($('#videoWrap').length > 0) {
		//$('a[rel^=prettyPhoto]').prettyPhoto({theme: 'dark_rounded'});
		$('#videobtns a').click(function() {
			var video = this.hash;
			$('#video a:visible').fadeOut('fast', function() {
				$(video).fadeIn('fast', function() {
					
				});
			});
			
			return false;
		});
	}
}

function photoGallery() {
	if($('#photos').length > 0) {
		$('#photos').cycle({
			fx: 'scrollHorz',
			timeout: 5000,
			speed: 'fast',
			pause: 1,
			prev: '.photoleft',
			next: '.photoright'
		});
	}
}

function billboard() {
	if($('#billboard').length > 0) {
		$('#billboard').cycle({
			fx: 'fade',
			timeout: 5000,
			speed: 'fast',
			pause: 1,
			pager: '#controls'
		});
	}
}
function studentSort() {
	if($('#sort').length > 0) {
		$('#sort').change(function() {
			var discipline = $(this).val();
			if(discipline != ' ') {
				window.location = window.location.href.substr(0, window.location.href.indexOf('students') + 8) + '?discipline=' + discipline;
			}
		});
	}
}

function sortByName(a, b) {
	var x = $('span', a).attr('title');
	var y = $('span', b).attr('title');
	return ((x < y) ? -1 : ((x > y) ? 1 : 0));
}
