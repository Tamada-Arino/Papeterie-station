class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    all_category_ids = @category.self_and_descendants.pluck(:id)

    order = params[:order]
    case order
    when "new"
      @order_text = "新しい順"
      @products = Product.where(category_id: all_category_ids).order(created_at: :desc)
    when "old"
      @order_text = "古い順"
      @products = Product.where(category_id: all_category_ids).order(created_at: :asc)
    when "favorites"
      @order_text = "いいねの数順"
      @products = Product.joins(:favorites).where(category_id: all_category_ids).group(:id).order('COUNT(favorites.id) DESC')
    else
      @products = Product.where(category_id: all_category_ids)
    end
  end
end
