$(document).ready(function() {
	function cleanEncyclo() {
		$(document).ready(function() {   
			$('.mw-editsection').hide()
			$('table[style^="font-size:small; padding: 3px; width: 20%; float: right; clear: right;"]').hide()
			$('td[width="33%"]').hide()
			$('td[width="50%"]').hide()
			$('td[width="100%"]').hide()
			$('#Liens_internes').text('Liens internes a Ekopedia')

			let links = $('#article-show a')
			links.each(function() {
				$(this).attr('href', ('https://www.ekopedia.fr' + $(this).attr('href')));
			});

			let menuLinks = $('*[class="toc"] a')
			menuLinks.each(function() {
				$(this).attr('href', $(this).attr('href').substring(23));
			});

			let refLinks = $('ol[class="references"] a')
			refLinks.each(function() {
				$(this).attr('href', $(this).attr('href').substring(23));
			});

			let ref2Links = $('sup[class="reference"] a')
			ref2Links.each(function() {
				$(this).attr('href', $(this).attr('href').substring(23));
			});

			let image = $('a[class="image"] > img')
			image.each(function() {
				$(this).attr('src', ('https://www.ekopedia.fr' + $(this).attr('src')));
			});
		});
	};
});
