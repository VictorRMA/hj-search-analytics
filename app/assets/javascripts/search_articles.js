$(document).ready(function() {

    $("#query").on('keyup', function(e) {
        console.log("Key");        
        if(e.keyCode == 13){
            console.log("Foi!");
            searchArticles($(this).val());
        }
    })
    
    function searchArticles(query) {
        $.ajax({
            url: '/search_articles',
            type: 'GET',
            dataType: 'json',
            data: { query: query }
        });
    }
})
