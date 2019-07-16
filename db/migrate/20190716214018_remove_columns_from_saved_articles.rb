class RemoveColumnsFromSavedArticles < ActiveRecord::Migration[5.1]
    def change
        remove_column :saved_articles, :read, :boolean
        remove_column :saved_articles, :section, :string
        remove_column :saved_articles, :published_date, :date
    end
end
