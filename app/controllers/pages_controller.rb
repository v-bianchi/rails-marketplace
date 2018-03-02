class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: (:index, :show)
  skip_after_action :verify_authorized

  def home
  end
end
