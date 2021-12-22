class ProductsController < ApplicationController
  before_action :authenticate_user!, only:[:new]
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
     if @product.valid?
        @product.save
        redirect_to root_path
    else
      render :new
    end
  end
  



  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :status_id, :shipping_cost_id, :shipping_days_id, :prefecture_id, :category_id, :user, :image).merge(user_id: current_user.id)
  end
end
