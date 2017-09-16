$("#query-form").on('submit', function(e) {
  searchArticles($("#query").val());

  return false;
});

$("#query").on('keyup', _.debounce(function() {
  searchArticles($(this).val());

  return false;
}, 3000));

function searchArticles(query) {
  $.get({
    url: '/articles',
    dataType: 'script',
    data: { query: query }
  });
}
