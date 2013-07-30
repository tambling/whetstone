class MessagesController < ApplicationController
  def index
    if  current_user
      @partners = current_user.message_partners
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @partner = User.find(params[:id])
    @messages = current_user.messages_with(@partner)
    @message = Message.new(to_id: @partner.id)
  end

  def create
    message = Message.create(params[:message])
    flash[:success] = "Message Sent!"
    redirect_to message_path(message.to_id)
  end
end

