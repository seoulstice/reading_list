class SavedArticle < ApplicationRecord
  validates_uniqueness_of :nyt_id
  belongs_to :user





end
