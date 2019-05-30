class ArticleDecorator < Draper::Decorator
  delegate_all

  def authors
    object.byline.split.map do |word|
      word.capitalize
    end.join(" ")
  end

  def pretty_date
    Date.parse(object.published_date).readable_inspect
  end

end
