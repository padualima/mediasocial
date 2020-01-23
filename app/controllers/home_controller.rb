class HomeController < ApplicationController
  def index
    @posts = Post.order('created_at desc').page(params[:page]).per(10)
    # @posts = Post.limit(20).order('created_at desc')
  end

  def search
    # binding.pry
    @posts_search = Post.search(search_params[:q]).page(params[:page])
  end

  private

  def search_params
    params.permit(:q)
  end
end
