class HomeController < ApplicationController
  def index
    prepare_form
    # for call of kind HTML
    @posts = Post.order('created_at desc').page(params[:page]).per(40)
  end

  def show
    render :index
  end

  def search
    prepare_form
    respond_to do |format|
      format.js {
        search_by_input
        search_by_list
        search_by_account_post

        #find if there is any date blank
        date_first = params[:date_first].values
        date_end = params[:date_end].values
        dates = date_first + date_end

        dates.each do |d|
          break unless d.blank? ? dates = false : dates = true
        end
        if dates
          search_by_date(date_first, date_end)
        else
          redirect_to root_path
        end
      }
    end
  end

  private

  def search_params
    params.permit(:q, :lists, :accounts)
  end

  def prepare_form
    @lists = List.all.pluck(:description, :id)
    @accounts = Account.all.pluck(:description, :id)
  end

  def search_by_input
    if params[:q].present?
      @posts = Post.search(search_params[:q])
    end
  end

  def search_by_list
    if params[:lists].present?
      return @posts = Post.search_lists(search_params[:lists])
    end
  end

  def search_by_account_post
    if params[:accounts].present?
      return @posts = Post.search_account(search_params[:accounts])
    end
  end

  def search_by_date(date_first, date_end)
      date_first = date_first.reverse.join("-")
      date_end = date_end.reverse.join("-")
      @posts = Post.created_between(date_first, date_end)
  end

end
