$(document).ready( function() {
	var $votes;
	var catchNumbers = /-*\d+/

	$('body').on('ajax:success', '.vote', function(){
		$votes = $(this.parentElement)
		value = parseInt(catchNumbers.exec(this.href.substring(this.href.indexOf('value='))))
		updateVotes(value)
	});

	function updateVotes(val) {
		var voteCount = (parseInt(catchNumbers.exec($votes.eq(0).find('.vote-count').eq(0).text())) + val).toString() + " Votes";
		$votes.eq(0).find('.vote-count').eq(0).text(voteCount)
	}

});


