class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    all_category_ids = @category.self_and_descendants.pluck(:id)

    @products = @q.result(distinct: true).where(category_id: all_category_ids)
  end
end
