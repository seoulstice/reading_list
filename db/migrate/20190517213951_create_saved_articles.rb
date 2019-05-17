class CreateSavedArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :saved_articles do |t|
      t.string :abstract
      t.string :authors
      t.bigint :nyt_id
      t.string :photo
      t.string :published_date
      t.string :section
      t.string :title
      t.string :url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
