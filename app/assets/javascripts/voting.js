$(document).ready( function() {
	var $votes;
	var catchNumbers = /\d+/


	$('.resources').delegate(".upvote","click",function() {
		$votes = $(this.parentElement)
		postNewVote(this, 1)
	});

	$('.resources').delegate(".downvote","click",function() {
		$votes = $(this.parentElement)
		postNewVote(this, -1)
	});
	
	function postNewVote(link, val) {
		$.ajax({
			type: 'POST',
			url: '/votes', 
			data: {'resources_stone_id' : link.id, 'value' : val} 
		})
		.done(function() { updateVotes(val) });
	}

	function updateVotes(val) {
		var voteCount = (parseInt(catchNumbers.exec($votes.eq(0).find('p').eq(0).text())) + val).toString() + " votes";
		$votes.eq(0).find('p').eq(0).text(voteCount)
	}

});


