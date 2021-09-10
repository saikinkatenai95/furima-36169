FactoryBot.define do
  factory :buy_residence do
    gimei = Gimei.address

    token             {"tok_abcdefghijk00000000000000000"}
    postal_code       {"123-2345"}
    prefecture_id     { 2 }
    city              {gimei.city.kanji}
    address           { 1-1 }
    build_name        {gimei.city.kanji + "303"}
    phone_number      {Faker::Number.number(digits: 11)}
  end
end
