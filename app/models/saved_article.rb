class SavedArticle < ApplicationRecord
  belongs_to :user
  validates_presence_of :abstract,
                        :authors,
                        :photo,
                        :title,
                        :url,
                        :user_id

end
