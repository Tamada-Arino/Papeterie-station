class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :access_right_check, only: [:edit, :update, :destroy]
  
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "投稿しました"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: '投稿を変更しました'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path, notice: '投稿を削除しました'
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def access_right_check
    if @product.user_id != current_user.id
      redirect_to root_path, alert: 'アクセス権がありません'
    end
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :user_id, :images)
  end
end
