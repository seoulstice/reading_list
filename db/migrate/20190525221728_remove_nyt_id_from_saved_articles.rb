class RemoveNytIdFromSavedArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :saved_articles, :nyt_id, :bigint
  end
end
