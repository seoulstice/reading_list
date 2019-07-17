class ArticleDecorator < SimpleDelegator

    def self.wrap(collection)
        collection.map do |obj|
            new obj
        end
    end

    def authors
        byline.split.map do |word|
            word.capitalize
        end.join(" ")
    end

end
