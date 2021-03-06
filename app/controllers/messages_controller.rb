class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
    authorize @conversation
  end

  def new
    @message = @conversation.messages.new
    authorize @message
  end

  def create
    @message = @conversation.messages.new(message_params)
    authorize @message
    if @message.save
      redirect_to conversation_path(@conversation)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
