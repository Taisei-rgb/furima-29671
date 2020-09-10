FactoryBot.define do
  factory :user do
    nickname { 'yamada' }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 7)}
    password_confirmation { password }
    family_name {'山田'}
    first_name {'美帆'}
    family_name_kana {'ヤマダ'}
    first_name_kana {'ミホ'}
    birth_date {'2000/01/01'}
  end
end
