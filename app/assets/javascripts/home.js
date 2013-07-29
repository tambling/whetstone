$(document).ready(function(){
  Search.initialize();
});

var Search = {

  initialize: function(){
    this.$query = $('#search').find('input[name=query]');
    $('#search h1').shuffleLetters();

    $('#search form').on('submit', function(e) {
      $('#search h1').shuffleLetters({ "text": Search.$query.val() });
    });

    $('#search form').on('ajax:success', Search.renderSearchResults);
    $('.mini-search form').on('ajax:success', Search.renderSearchResults);

  },

  renderSearchResults: function(event,search_results){

    if (search_results.mini === true) {
      $('.content').empty();
      $('.content').append(search_results.index_html);
      $('#search h1').shuffleLetters({ "text": search_results.query });
      $('.mini-search form input[name=query]').val('');
    }
    Search.$query.val('');
    $('#search .results').empty();  
    $('#search .results').append(search_results.results_html).hide().fadeIn();  
  }
}
