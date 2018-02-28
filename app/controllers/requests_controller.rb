class RequestsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    if @request.save!
      redirect_to request_path(@request)
    else
      render :new
    end
  end

  private

  def request_params
    params.require(:request).permit(:status, :user_id, :product_id)
  end

end