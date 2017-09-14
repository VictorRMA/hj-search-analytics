$("#query-form").on('submit', function(e) {
  searchArticles($("#query").val());

  return false;
});

function searchArticles(query) {
  $.get({
    url: '/articles',
    dataType: 'script',
    data: { query: query }
  });
}
