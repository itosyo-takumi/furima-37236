class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :purchase_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :product_id, :user_id, :token
 
  with_options presence: true do
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select'}
    validates :phone_number, format: { with: /\A\d{11}\z/, message: 'Input only number'}
    validates :product_id
    validates :user_id
    validates :token
  end
  

  def save
    @purchase_destination = Purchase.create(product_id: product_id, user_id: user_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: @purchase_destination.id)
  end
end
