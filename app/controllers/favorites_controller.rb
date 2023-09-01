class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    current_user.favorites.create(product: @product)
    redirect_to @product
  end

  def destroy
    @product = Product.find(params[:product_id])
    current_user.favorites.find_by(product: @product).destroy
    redirect_to @product
  end

end
