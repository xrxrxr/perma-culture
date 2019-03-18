FactoryBot.define do
  factory :event do
    title { "MyString" }
    description { "MyText" }
    start_date { "2019-03-18 11:08:23" }
    end_date { "2019-03-18 11:08:23" }
    longitude { 1.5 }
    latitude { 1.5 }
    address { "MyString" }
  end
end
