FactoryBot.define do
  factory :saved_article do
    abstract {'abstract'}
    authors {'by authors names'}
    sequence(:nyt_id) {|n| n }
    photo {"https://static01.nyt.com/images/2019/06/12/arts/12thrones-3/12thrones-3-mediumThreeByTwo210-v3.jpg"}
    published_date {"date"}
    section {"section"}
    sequence(:title) {|n| "title_#{n}" }
    read {false}
    url {"www.url.com"}
  end
end
