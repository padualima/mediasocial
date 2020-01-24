class HomeController < ApplicationController
  def index
    prepare_form
    @posts = Post.order('created_at desc').page().per(40)
  end

  def search
    prepare_form
    respond_to do |format|
      format.js {
        if params[:q].present?
          @posts = Post.search(search_params[:q]).page(params[:page]).per(20)
        end
        if params[:lists].present?
          return @posts = Post.search_lists(search_params[:lists]).page().per(20)
        end
        if params[:accounts].present?
          return @posts = Post.search_account(search_params[:accounts]).page(params[:page]).per(20)
        end

        par_first = params[:date_first].values
        par_end = params[:date_end].values
        if (par_first[0].present? && par_first[1].present? && par_first[2].present?) &&
          (par_end[0].present? && par_end[1].present? && par_end[2].present?)
          date_first = par_first.reverse.join('-')
          date_end = par_end.reverse.join('-')
          @posts = Post.where("created_at between (?) and (?)", date_first, date_end).order('created_at desc')

          # RESOLVER O redirect_to root_path
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
    params.permit(:q, :lists, :accounts, :date_first, :date_end)
  end
end
