/**
 * Store query after submit form
 */
$("#query-form").on('submit', function(e) {
  searchArticles(
    removeSpacesBeforeAndAfter($("#query").val())
  );

  return false;
});

/**
 * Submit query after period of time passed using debounce
 */
$("#query").on('keyup', _.debounce(function(e) {
  if(e.keyCode != 13) {
    searchArticles(
      removeSpacesBeforeAndAfter($(this).val())
    );
  }

  return false;
}, 3000));

/**
 * removeSpacesBeforeAndAfter
 * Remove spaces before and after a string using jQuery trim()
 */
function removeSpacesBeforeAndAfter(query) {
  return $.trim(query);
}

/**
 * searchArticles
 * Request for store and update query list
 */
function searchArticles(query) {
  $.get({
    url: '/articles',
    dataType: 'script',
    data: { query: query }
  });
}
