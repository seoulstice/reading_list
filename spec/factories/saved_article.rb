FactoryBot.define do
  factory :saved_article do
    abstract {'abstract'}
    authors {'by authors names'}
    sequence(:nyt_id) {|n| n }
    photo {"photo.jpg"}
    published_date {"date"}
    section {"section"}
    title {"title"}
    url {"www.url.com"}
  end
end
