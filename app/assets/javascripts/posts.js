function indexPosts (catsize){
  $('#toggle-post-form').click( function() {
    $('#target-post-form').show()
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