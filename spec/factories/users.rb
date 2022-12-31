FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nick_name             { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    first_name            { person.first.kanji }
    family_name           { person.family.kanji }
    kana_first_name       { person.first.katakana }
    kana_family_name      { person.family.katakana }
    birthday              { Faker::Date.birthday }
  end
end
