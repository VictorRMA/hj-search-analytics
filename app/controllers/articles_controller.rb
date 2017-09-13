class ArticlesController < ApplicationController

  def index
    @searches = Search.get_rank_score_searches
  end

  def search
    if Search.store_query(downcase_query_in_params)
        puts "Stored!"
    else
        puts "Search not stored!"
    end

    respond_to do |format|
       format.json { redirect_to root_path }
       format.js { redirect_to root_path }
       format.html { redirect_to root_path }
    end
    #redirect_to root_path
  end

  private
    def search_params
      params.permit(:query)
    end

    def downcase_query_in_params
      search_params[:query].downcase
    end
end
