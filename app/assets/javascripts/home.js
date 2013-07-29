$(document).ready(function(){
  Search.inititialize();
});

var Search = {
  inititialize: function(){
    $('#search h1').shuffleLetters();

    $('#search_query').bind('keypress',function(event){
    
      if(event.keyCode == 13){
        $('#search h1').shuffleLetters({ "text": $(event.target).val() });
        $(event.target).val("")
      }
    });
  }
}
