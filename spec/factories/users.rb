FactoryBot.define do
  factory :user do
    gimei = Gimei.name

    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    lastname              {gimei.last.kanji }
    firstname             {gimei.first.kanji}
    lastname_japanese     {gimei.last.katakana}
    firstname_japanese    {gimei.first.katakana}
    birthday              {Faker::Date.between(from: '2014-09-23', to: '2018-09-25')}
  end
end