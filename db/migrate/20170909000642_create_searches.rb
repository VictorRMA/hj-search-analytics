class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :query
      t.integer :score, default: 1

      t.timestamps
    end
  end
end
