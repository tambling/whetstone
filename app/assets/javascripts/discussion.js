var DiscussionController = {
  initialize: function(){
    $('body').on('ajax:success','form.create_discussion', DiscussionViews.renderDiscussion);
    $('body').on('ajax:success','form.create_comment', DiscussionViews.renderComment);
    $('body').on('ajax:success','.show_discussion', DiscussionViews.renderShowDiscussion);
    $('body').on('ajax:success','.get_discussions', DiscussionViews.renderDiscussions);
  }
}

var DiscussionViews = {

  initialize: function(){
    this.$container = $('.content');
  },

   renderDiscussion: function(event,discussion){
    DiscussionViews.$container.find('.discussions').prepend(discussion);
  },

  renderDiscussions: function(event, discussions){
    DiscussionViews.$container.empty()
    DiscussionViews.$container.append(discussions);
  },

  renderShowDiscussion: function(event, discussion) {
    console.log("Showing discussion");
    DiscussionViews.$container.empty()
    DiscussionViews.$container.append(discussion);
  },

  renderComment: function(event, comment) {
    console.log("Rendering Comment");
    $(this).after(comment);
  }
}
