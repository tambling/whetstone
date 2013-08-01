var VoteController = {
	initialize: function(){
		$('body').on('click','.vote', VoteController.createVote);
	},

	createVote: function(event){
		event.preventDefault();

		VoteViews.$clicked = $(this)

		var url = $(this).attr('href');
		var value = $(this).data('value');
		var class_name = $(this).data('class-name');
		var id = $(this).data('id')

		$.ajax({
			type: 'post',
			url: url,
			data: { id: id, value: value, class_name: class_name }
		}).done(VoteViews.renderVote);
	}
}

var VoteViews = {

	renderVote: function(message){
		VoteViews.$clicked.closest('.votable').find('.vote_tally').text(message.value)
		alertify.log(message.message);
	}
}
