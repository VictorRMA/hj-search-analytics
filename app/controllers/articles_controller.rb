class ArticlesController < ApplicationController

  def index
    Search.store_query(query) if query.present?

    respond_to do |format|
      format.html { render locals: { searches: searches } }
      format.js { render locals: { searches: searches } }
    end
  end

  def clear
    Search.delete_all
    redirect_to root_path
  end

  private

  def query
    params[:query]
  end

  def searches
    Search.ordered
  end

end
