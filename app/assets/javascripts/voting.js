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
		.done(function() { updateVotes(1) });
	});

	$('.resources').delegate(".downvote","click",function() {
		$votes = $(this.parentElement)
		$.ajax({
			type: 'POST',
			url: '/votes', 
			data: {'relationship_id' : this.id, 'value' : -1} 
		})
		.done(function() { updateVotes(-1) });
	});
	
	// function postNewVote(val) {
	// 	$.ajax({
	// 		type: 'POST',
	// 		url: '/votes', 
	// 		data: {'relationship_id' : this.id, 'value' : val} 
	// 	})
	// 	.done(function() { updateVotes(val) });
	// }

	function updateVotes(val) {
		var voteCount = (parseInt(catchNumbers.exec($votes.eq(0).find('p').eq(0).text())) + val).toString() + " votes";
		$votes.eq(0).find('p').eq(0).text(voteCount)
	}

});


