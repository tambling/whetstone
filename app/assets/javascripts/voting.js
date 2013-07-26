$(document).ready( function() {
	$('.resources').delegate(".upvote","click",function() {
		$.ajax({ 
			type: 'POST', 
			url: '/votes', 
			data: {'relationship_id' : this.id, 'value' : 1}
		});
	});
});
