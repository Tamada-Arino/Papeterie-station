class HomeController < ApplicationController
  def index
    @new_products = Product.order(created_at: :desc).limit(4)
    @popular_products = Product.joins(:favorites)
                          .group('products.id')
                          .order('COUNT(favorites.id) DESC')
                          .limit(4)
  end
end
