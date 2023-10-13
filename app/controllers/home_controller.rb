class HomeController < ApplicationController
  def index
    @new_products = Product.order(created_at: :desc).limit(4)
    @popular_products = Product.joins(:favorites)
                          .group('products.id')
                          .order('COUNT(favorites.id) DESC')
                          .limit(4)
    @new_users = User.order(created_at: :desc).limit(5)
    if user_signed_in?                      
      @follower_products = Product.where(user: current_user
                            .following_users).order(created_at: :desc)
                            .limit(4)
    end
  end
end
