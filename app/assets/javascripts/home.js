$(document).ready(function(){
  Search.initialize();
});

var Search = {
  initialize: function(){
    $('#search h1').shuffleLetters();

    $('#search_query').bind('keypress',function(event){

      if(event.keyCode == 13){
        $('#search h1').shuffleLetters({ "text": $(event.target).val() });
        $(event.target).val("")
      }
    });
  }
}

// var FixedTabs ={
//   initialize: function(){
//     $('body').on('mouseenter','.fixed_tab', function(){
//       $(this).animate({
//         left: '+=100',
//       }, 250);
//     });

//     $('body').on('mouseleave','.fixed_tab', function(){
//       $(this).animate({
//         left: '-=100',
//       }, 250);
//     });
//   }
// }
