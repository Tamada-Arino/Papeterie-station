class CategoriesController < ApplicationController
  def show
    @q = Product.ransack(params[:q])
    @category = Category.find(params[:id])
    all_category_ids = @category.self_and_descendants.pluck(:id)

    order = params[:order]
    case order
    when "old"
      @order_text = "古い順"
      @products = Product.where(category_id: all_category_ids).order(created_at: :asc)
    when "favorites"
      @order_text = "いいねが多い順"
      @products = Product.joins(:favorites).where(category_id: all_category_ids).group(:id).order('COUNT(favorites.id) DESC')
    else
      @order_text = "新しい順"
      @products = Product.where(category_id: all_category_ids).order(created_at: :desc)
    end
  end
end
