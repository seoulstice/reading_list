class CreateSavedArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :saved_articles do |t|
      t.string :abstract
      t.string :authors
      t.string :photo
      t.date :published_date
      t.string :section
      t.string :title
      t.string :url
      t.boolean :read
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
