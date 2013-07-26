$(document).ready( function() {
	var $votes;
	var catchNumbers = /\d+/


	$('.resources').delegate(".upvote","click",function() {
		$votes = $(this.parentElement)
		$.ajax({
			type: 'POST',
			url: '/votes', 
			data: {'relationship_id' : this.id, 'value' : 1} 
			})
		.done(function() { updateVotes() });
	});
	
	function updateVotes() {
			var voteCount = (parseInt(catchNumbers.exec($votes.eq(0).find('p').eq(0).text())) + 1).toString() + " votes";
			$votes.eq(0).find('p').eq(0).text(voteCount)
	}

});


