class Search < ApplicationRecord
  validates :query, presence: true

  scope :ordered, -> { order(score: :desc) }

  def self.store_query(query)
    Search.find_or_create_by(query: query.downcase).increment(:score).save
  end

end
