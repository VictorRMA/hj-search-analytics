class ArticlesController < ApplicationController

  def index
    Search.store_query(query) if query.present?
    respond_to do |format|
       format.html { render locals: { searches: searches} }
       format.js { render locals: { searches: searches} }
       format.json { render json: searches_as_json }
    end
  end

  # nao identa isso pelo amor de deus kkkkkk
  private

  # nao precisa do require porque voce so passa um parametro especifico
  # strong parameters e pra quando voce passa uma lista de parametros
  # e quer fazer whitelist de somente alguns (nao e o caso)
  def query
    params[:query]
  end

  def searches
    ordered_searches = Search.ordered
    if query.present?
      ordered_searches.where(query: query)
    else
      ordered_searches
    end
  end

  def searches_as_json
    {
      success: true,
      searches: searches.map do |search|
        {
          id: search.id,
          query: search.query,
          score: search.score
        }
      end
    }
  end
end
