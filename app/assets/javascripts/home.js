$(document).ready(function(){
  Search.initialize();
});

var Search = {
  initialize: function(){
    $('#search h1').shuffleLetters();
    
    $('#search form').on('submit', function(e) {
      Search.$query = $(this).find('input[name=query]');
      $('#search h1').shuffleLetters({ "text": Search.$query.val() });
    });

    $('#search form').on('ajax:success', Search.renderSearchResults);
  },

  renderSearchResults: function(event,search_results){
    Search.$query.val('');
    $('#search .results').empty();  
    $('#search .results').append(search_results).hide().fadeIn();
  }
}
