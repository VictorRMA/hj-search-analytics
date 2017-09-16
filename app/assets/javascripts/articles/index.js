$("#query-form").on('submit', function(e) {
  searchArticles(
    removeSpacesBeforeAndAfter($("#query").val())
  );

  return false;
});

$("#query").on('keyup', _.debounce(function(e) {
  if(e.keyCode != 13) {
    searchArticles(
      removeSpacesBeforeAndAfter($(this).val())
    );
  }

  return false;
}, 3000));

function removeSpacesBeforeAndAfter(query) {
  return $.trim(query);
}

function searchArticles(query) {
  $.get({
    url: '/articles',
    dataType: 'script',
    data: { query: query }
  });
}
