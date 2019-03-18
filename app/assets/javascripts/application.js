// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require assets/js/core/popper.min
//= require bootstrap
//= require assets/js/plugins/moment.min
//= require assets/js/plugins/bootstrap-switch
//= require assets/js/plugins/bootstrap-tagsinput
//= require assets/js/plugins/bootstrap-selectpicker
//= require assets/js/plugins/jasny-bootstrap.min
//= require assets/js/plugins/nouislider.min
//= require assets/js/plugins/bootstrap-datetimepicker.min
//= require assets/js/now-ui-kit
//= require activestorage
//= require_tree .



// ------------------------ REPARATION RESPONSIVE  NAVBAR ---------------------
$(document).ready(function() {
    $('#navbar-btn').click(function () {
        $('.collapse').show(500);
    });
});

// --------------------------- ENCYLO --------------------------------
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

// ---------------------------------- CHAT -------------------------------------
// 
// 
(function() {
  $(document).on('click', '.toggle-window', function(e) {
    e.preventDefault();
    var card = $(this).parent().parent();
    var messages_list = card.find('.messages-list');

    card.find('.card-body').toggle();
    card.attr('class', 'card bg-light');

    if (card.find('.card-body').is(':visible')) {
      var height = messages_list[0].scrollHeight;
      messages_list.scrollTop(height);
    }
  });
})();

// ------------------------------- POSTS -------------------------------

    // function showComments (postid) {
    //   $(`#comments-toggle-${post.id}`).click(function(e) {
    //     $(`#comments-area-${post.id}`).toggle();  
    //   })
    // }
    
function indexPosts (catsize){
  let posts = $('div').find('[data-type="post"]');
  let x = 15

  showXFirsts(x)

  function showXFirsts(x) {
    hideAll()
    $('#load-more').show()
    for(let i = 0; i < x; i++) {
      $(posts[i]).show();
    };
  };

  $('#load-more').click(function(){
    x += 5;
    showXFirsts(x)
  });
  
  function hideAll() {
    posts.hide();
  };

  $('#cat-all').click(function() {
    x = 15
    showXFirsts(x)
  });

  for(let i = 1; i <= catsize; i++) {
    $(`#cat-${i}`).click(function() {
      hideAll();
      $(`.category-${i}`).show();
      $('#load-more').hide()
    });
  };
}