class Search < ApplicationRecord
  validates :query, presence: true

  # Use escopos ao invés de métodos estáticos
  # quando retornar um conjunto de registros (ActiveRecord::Relation)
  scope :ordered, -> { order(score: :desc) }

  # Find or create by tira a necessidade do if
  # increment inicializa o campo com zero, se for nil.
  def self.store_query(query)
    Search.find_or_create_by(query: query).increment(:score).save
  end


end
