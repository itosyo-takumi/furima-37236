require 'rails_helper'

RSpec.describe Product, type: :model do
  
  before do
    @product = FactoryBot.build(:product)
  end

  describe Product do
    
          context '登録ができるとき' do
            it 'image, name, price, description, status_id, shipping_cost_id, shipping_days_id, prefecture_id, category_id,の値が存在すれば登録できること' do
              expect(@product).to be_valid
            end
          end

          context '_idが空では登録できないこと' do
            it 'imageが空では登録できないこと' do
              @product.image = nil
              @product.valid?
              expect(@product.errors.full_messages).to include("Image can't be blank")
            end
            
            it 'nameが空では登録できないこと' do
              @product.name = ''
              @product.valid?
              expect(@product.errors.full_messages).to include("Name can't be blank")
            end

            it 'priceが空では登録出来ないこと' do
              @product.price = ''
              @product.valid?
              expect(@product.errors.full_messages).to include("Price is not a number")
            end

            it 'priceは半角数字以外では登録できないこと' do
              @product.price = 'あああああ'
              @product.valid?
              expect(@product.errors.full_messages).to include("Price is not a number")
            end

            it 'priceが299円以下は登録出来ないこと' do
              @product.price = 299
              @product.valid?
              expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
            end

            it 'priceが9,999,999円以下は登録出来ないこと' do
              @product.price = 10000000
              @product.valid?
              expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
            end

            it 'descriptionが空では登録できないこと' do
              @product.description = ''
              @product.valid?
              expect(@product.errors.full_messages).to include("Description can't be blank")
            end
            
            it 'status_idが空では登録できないこと' do
              @product.status_id = ''
              @product.valid?
              expect(@product.errors.full_messages).to include("Status is not a number")
            end

            it 'shipping_cost_idが空では登録できないこと' do
              @product.shipping_cost_id = ''
              @product.valid?
              expect(@product.errors.full_messages).to include("Shipping cost is not a number")
            end

            it 'shipping_days_idが空では登録できないこと' do
              @product.shipping_days_id = ''
              @product.valid?
              expect(@product.errors.full_messages).to include("Shipping days is not a number")
            end
        
            it 'prefecture_idが空では登録できないこと' do
              @product.prefecture_id = ''
              @product.valid?
              expect(@product.errors.full_messages).to include("Prefecture is not a number")
            end
            
            it 'category_idが空では登録できないこと' do
              @product.category_id = ''
              @product.valid?
              expect(@product.errors.full_messages).to include("Category is not a number")
            end
        end
  end 
end
