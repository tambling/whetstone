$(document).ready( function() {
	var $votes;
	var catchNumbers = /-*\d+/


	$('body').delegate(".comment-upvote","click",function() {
		$votes = $(this.parentElement)
		postCommentVote(this, 1)
	});

	$('body').delegate(".comment-downvote","click",function() {
		$votes = $(this.parentElement)
		postCommentVote(this, -1)
	});



	$('body').delegate(".discussion-upvote","click",function() {
		$votes = $(this.parentElement)
		postDiscussionVote(this, 1)
	});

	$('body').delegate(".discussion-downvote","click",function() {
		$votes = $(this.parentElement)
		postDiscussionVote(this, -1)
	});

	

	$('body').delegate(".resource-upvote","click",function() {
		$votes = $(this.parentElement)
		postResourceVote(this, 1)
	});

	$('body').delegate(".resource-downvote","click",function() {
		$votes = $(this.parentElement)
		postResourceVote(this, -1)
	});
	
	
	function postCommentVote(link, val) {
		$.ajax({
			type: 'POST',
			url: '/votes', 
			data: { 'comment_id' : link.id, 'value' : val} 
		})
		.done(function() { updateVotes(val) });
	}

	function postResourceVote(link, val) {
		$.ajax({
			type: 'POST',
			url: '/votes', 
			data: { 'resources_stone_id' : link.id, 'value' : val} 
		})
		.done(function() { updateVotes(val) });
	}

	function postDiscussionVote(link, val) {
		$.ajax({
			type: 'POST',
			url: '/votes', 
			data: {'discussion_id' : link.id, 'value' : val} 
		})
		.done(function() { updateVotes(val) });
	}

	function updateVotes(val) {
		var voteCount = (parseInt(catchNumbers.exec($votes.eq(0).find('.vote-count').eq(0).text())) + val).toString() + " Votes";
		$votes.eq(0).find('.vote-count').eq(0).text(voteCount)
	}

});


