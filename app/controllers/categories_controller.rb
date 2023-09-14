class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    all_category_ids = @category.self_and_descendants.pluck(:id)

    order = params[:order]
    @q = Product.ransack(params[:q])

    @q.sorts = 'created_at desc' if params[:order] == 'new'
    @q.sorts = 'created_at asc' if params[:order] == 'old'
    @q.sorts = 'favorites_count desc' if params[:order] == 'favorites'

    @order_text =
      case params[:order]
      when 'old' then '古い順'
      when 'favorites' then 'いいねが多い順'
      else '新しい順'
    end

    @products = @q.result(distinct: true).where(category_id: all_category_ids)
  end
end
