class HomeController < ApplicationController
  def index

    render json: @posts
  end
end
