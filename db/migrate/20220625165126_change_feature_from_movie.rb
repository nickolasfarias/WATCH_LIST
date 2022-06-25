class ChangeFeatureFromMovie < ActiveRecord::Migration[6.1]
  def change
    change_column :movies, :title, :string
    change_column :bookmarks, :comment, :text
  end
end
