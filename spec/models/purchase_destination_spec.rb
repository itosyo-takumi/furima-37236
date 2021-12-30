require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  describe '購入内容確認' do
    before do
      @user = FactoryBot.create(:user)
      @product =FactoryBot.create(:product)
      @purchase_destination = FactoryBot.build(:purchase_destination, user_id: @user.id, product_id: @product.id)
      sleep(0.5)
    end

  
    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できること' do
        expect(@purchase_destination).to be_valid
       sleep(0.5)
      end

      it "建物名は空でも保存ができること" do
        @purchase_destination.building_name = ''
        @purchase_destination.valid?
        expect(@purchase_destination).to be_valid
        sleep(0.5)
      end

      it "tokenがあれば保存ができること" do
        @purchase_destination.token = 'tok_abcdefghijk00000000000000000'
        @purchase_destination.valid?
        expect(@purchase_destination).to be_valid
        sleep(0.5)
      end
    end

    context '商品購入がうまくいかない時' do
      it '郵便番号が空だと購入できない' do
        @purchase_destination.post_code = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Post code can't be blank")
        sleep(0.5)
      end

      it '郵便番号にハイフンがないと購入できない' do
        @purchase_destination.post_code = '1234567'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        sleep(0.5)
      end

      it '都道府県が未選択だと登録できない' do
        @purchase_destination.prefecture_id = 1
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Prefecture Select")
        sleep(0.5)
      end

      it '市区町村が空だと購入できない' do
        @purchase_destination.city = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
        sleep(0.5)
      end

      it '番地が空だと購入できない' do
        @purchase_destination.address = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Address can't be blank")
        sleep(0.5)
      end

      it '電話番号が空だと購入できない' do
        @purchase_destination.phone_number = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
        sleep(0.5)
      end

      it '電話番号が9桁以下では購入できない' do
        @purchase_destination.phone_number = '090123456'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number Input only number")
        sleep(0.5)
      end

      it '電話番号が12桁以上では購入できない' do
        @purchase_destination.phone_number = '090123456789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number Input only number")
        sleep(0.5)
      end

      it '電話番号が半角数字以外では購入できないこと' do
        @purchase_destination.phone_number = 'あいうえおアイウエオあ'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include('Phone number Input only number')
        sleep(0.5)
      end

      it "tokenが空では保存できないこと" do
        @purchase_destination.token = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
        sleep(0.5)
      end

      it 'userが紐付いていなければ保存できない' do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
        sleep(0.5)
      end

      it '商品が紐付いていなければ保存できない' do
        @purchase_destination.product_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Product can't be blank")
        sleep(0.5)
      end


    end
  end
end