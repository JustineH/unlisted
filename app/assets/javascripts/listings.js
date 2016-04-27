var Bookmarks;

$(function(){
  // alert('hi');
  $('.bookmark').on('ajax:success', function(event, data) {
    Bookmarks.add(data);
  });

  $('.user_bookmarks').on('ajax:success', '.remove_bookmark', function () {
    $(this).parent('.bookmark_item').remove();
    // $(this).parent('.bookmark_item').fadeOut(function () { this.remove(); });
  });

  function BookmarksManager () {
    this.template = Handlebars.compile($('#bookmark_item_template').text());

    this.clear = function () {
      $('.user_bookmarks').empty();
    };

    this.add = function (bookmark) {
      var item = this.template(bookmark);
      $('.user_bookmarks').prepend(item);
    }
  }

  Bookmarks = new BookmarksManager();

  if (window.current_user_bookmarks) {
    current_user_bookmarks.forEach(function (bookmark) {
      Bookmarks.add(bookmark);
    });
  }


  
});
