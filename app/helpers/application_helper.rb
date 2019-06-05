module ApplicationHelper

    def day_choices
      [
        ["Last Day", "1"],
        ["Last Seven Days", "7"],
        ["Last Thirty Days", "30"]
      ]
    end

    def section_choices
      [
        ["Arts", "arts"],
        ["Automobiles", "automobiles"],
        ["Books", "books"],
        ["Business", "business"],
        ["Fashion", "fashion"],
        ["Food", "food"],
        ["Health", "health"],
        ["Home", "home"],
        ["Insider", "insider"],
        ["Magazine", "magazine"],
        ["Movies", "movies"],
        ["National", "national"],
        ["NY Region", "nyregion"],
        ["Obituaries", "obituaries"],
        ["Opinion", "opinion"],
        ["Politics", "politics"],
        ["Real Estate", "realestate"],
        ["Science", "science"],
        ["Sports", "sports"],
        ["Sunday Review", "sundayreview"],
        ["Technology", "technology"],
        ["Theater", "theater"],
        ["T Magazine", "tmagazine"],
        ["Travel", "travel"],
        ["Upshot", "upshot"],
        ["World", "world"]
      ]
    end

    def embedded_svg filename, options={}
       file = File.read(Rails.root.join('app', 'assets', 'images', filename))
       doc = Nokogiri::HTML::DocumentFragment.parse file
       svg = doc.at_css 'svg'
       if options[:class].present?
         svg['class'] = options[:class]
       end
       doc.to_html.html_safe
    end


end
