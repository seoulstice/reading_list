class ArticleDecorator < Draper::Decorator
  delegate_all

  def authors
    object.byline.split.map do |word|
      word.capitalize
    end.join(" ")
  end

end
