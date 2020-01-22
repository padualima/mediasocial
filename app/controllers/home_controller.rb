class HomeController < ApplicationController
  def index
    @posts = Post.order('created_at desc').page(params[:page]).per(10)
    # @posts = Post.limit(20).order('created_at desc')
  end
end
