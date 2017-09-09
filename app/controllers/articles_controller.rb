class ArticlesController < ApplicationController

  def index
  end

  def search
    if Search.store_query(downcase_query_in_params)
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

    def downcase_query_in_params
      search_params[:query].downcase
    end
end
