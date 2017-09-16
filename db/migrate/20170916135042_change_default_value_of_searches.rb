class ChangeDefaultValueOfSearches < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:searches, :score, nil)
  end
end
