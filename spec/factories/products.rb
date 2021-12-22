FactoryBot.define do
  factory :product do
    name              {"apple"}
    price             {1111}
    description       {"aaa"}
    status_id         {2}
    shipping_days_id  {2}
    shipping_cost_id  {2}
    prefecture_id     {2}
    category_id       {2}
    association :user
    
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/hero.jpg'), filename: 'item-sample.png')
    end

  end
end
