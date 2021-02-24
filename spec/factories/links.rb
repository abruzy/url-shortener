FactoryBot.define do
  factory :link do
    original_url { Faker::Internet.url }
    slug { Faker::Internet.slug }
  end
end
