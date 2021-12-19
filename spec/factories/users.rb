FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'S00000'}
    password_confirmation {password}
    family_name           {'山田'}
    first_name            {'太郎'}
    family_name_kana      {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birth_day             {'2021-12-17'}


  end


end