FactoryBot.define do
  factory :purchase_destination do
    post_code       {"123-4567"}
    prefecture_id   {2}
    city            {"北海道"}
    address         {"1-1"}
    phone_number    {"09012345678"}
    building_name   {"柳ビル1"}
    token {"tok_abcdefghijk00000000000000000"}
  end
end