class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
 
  def index
    @purchase_destination = PurchaseDestination.new
    @product = Product.find(params[:product_id])
    if current_user == @product.user || @product.purchase.present?
      redirect_to root_path
    end
  end

  def create
      @product = Product.find(params[:product_id])
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
    params.require(:purchase_destination).permit(:purchase_id,:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id,).merge(product_id:params[:product_id],user_id:current_user.id, token: params[:token])
  end

  def pay_product
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,  
      card: destination_params[:token],    
      currency: 'jpy'                 
    )
  end
end
