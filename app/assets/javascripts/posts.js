function indexPosts (catsize){
  $('#toggle_post_form').click( function() {
    $('.target-post-form').show()
  });

  $('#search').click( function() {
    $('#search-btn-target').show()
  })

  $('.col-ext').click( function() {
    $('.target-post-form').hide()
    $('#search-btn-target').hide()
  });

  $('.page-header.page-header-mini').click( function() {
    $('.target-post-form').hide()
    $('#search-btn-target').hide()
  });

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

$(document).on('submit', '.new_post', function() {
  $(this).trigger('reset');
});

