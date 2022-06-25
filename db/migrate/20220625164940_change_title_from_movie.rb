class ChangeTitleFromMovie < ActiveRecord::Migration[6.1]
  def change
    change_column :movies, :title, :text
  end
end
