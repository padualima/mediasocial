class HomeController < ApplicationController
  def index
    prepare_form
    @posts = Post.order('created_at desc').page(params[:page]).per(40)
  end

  def search
    prepare_form
    respond_to do |format|
      format.js {
        if params[:q].present?
          @posts = Post.search(search_params[:q]).page(params[:page]).per(20)
        end
        if params[:lists].present?
          return @posts = Post.search_lists(search_params[:lists]).page(params[:page]).per(20)
        end
        if params[:accounts].present?
          return @posts = Post.search_account(search_params[:accounts]).page(params[:page]).per(20)
        end
      }
    end
  end

  private


  def prepare_form
    @lists = List.all.map { |l| [l.description, l.id] }
    @accounts = Account.all.map { |ac| [ac.description, ac.id] }
  end

  def search_params
    params.permit(:q, :lists, :accounts)
  end
end
