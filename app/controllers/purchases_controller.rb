class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_product
  def index
    @purchase_destination = PurchaseDestination.new
    if current_user == @product.user || @product.purchase.present?
      redirect_to root_path
    end
  end

  def create
      @purchase_destination = PurchaseDestination.new(destination_params)
      if @purchase_destination.valid?
        pay_product
        @purchase_destination.save
        redirect_to root_path
      else

        render action: :index
      end
  end



  private

  def destination_params
    params.require(:purchase_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(product_id:params[:product_id],user_id:current_user.id, token: params[:token])
  end

  def pay_product
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,  
      card: destination_params[:token],    
      currency: 'jpy'                 
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
