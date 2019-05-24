class AddReadToSavedArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :saved_articles, :read, :boolean
  end
end
