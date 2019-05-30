class SavedArticleDecorator < Draper::Decorator
  delegate_all

  def pretty_date
    object.published_date.readable_inspect
  end

end
