class ConversationsController < ApplicationController
  # before_action :authenticate_user

  def index
    @users = User.all
    @conversations = policy_scope(Conversation).all
    @products = current_user.products
    @sent_requests = Request.where(user: current_user)
    @received_requests = Request.joins(:product).where(products: {user: current_user})
    @request = Request.new
  end

  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
      authorize @conversation
    else
      @conversation = Conversation.new(conversation_params)
      authorize @conversation
      @conversation.save!
    end
    redirect_to conversation_path(@conversation)
  end

  def show
    @conversation = Conversation.find(params[:id])
    authorize @conversation
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true;
      end
    end
    @message = Message.new
  end

  private

  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
