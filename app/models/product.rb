class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  #belongs_to :purchase
  has_one_attached :image


  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_days
  belongs_to :status

  with_options presence: true do

    validates :name
    
    validates :description
    
    validates :image
    
  
  
    validates :category_id, :prefecture_id, :shipping_cost_id, :shipping_days_id, :status_id , numericality: { other_than: 1 } 

  
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
end


