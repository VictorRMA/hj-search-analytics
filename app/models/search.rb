class Search < ApplicationRecord
  validates :query, presence: true

  # Create or update Search instance based on query uniqueness
  # return search instance
  def self.store_query(query)
    search = Search.find_by(query: query)

    if search
      Search.increment_counter(:score, search)
      search
    else
      Search.create(query: query)
    end
  end

  # Return all Searches ordered by score descent
  def self.get_rank_score_searches
    Search.all.sort_by{ |q| [-q.score] }
  end

end
