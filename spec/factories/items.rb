FactoryBot.define do
  factory :item do
    name               {Faker::Name.initials(number: 2)}
    info               {Faker::Lorem.sentence}
    category_id           { 2 }
    itemcondition_id      { 2 }
    deliveryfee_id        { 2 }
    prefecture_id         { 2 }
    readtime_id           { 2 }
    price              {Faker::Number.number(digits: 6) }
    association :user

    after(:build) do|item|
      item.image.attach(io: File.open("public/images/test_image.png"), filename: "test_image.png")
    end
  end
end
