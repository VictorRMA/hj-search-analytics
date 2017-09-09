class ArticlesController < ApplicationController

  def index
  end

  def search
    if Search.store_query(search_params[:query])
      puts "Search stored!"
    else
      puts "Search not stored!"
    end

    redirect_to root_path
  end

  private
    def search_params
      params.permit(:query)
    end
end
