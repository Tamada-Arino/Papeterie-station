class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :access_right_check, only: [:edit, :update, :destroy]

  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

  def show
    @comment = Comment.new
    @items = RakutenWebService::Ichiba::Item.search(keyword: @product.name)
    @related_products = Product.related_to_category(@product.category_id, @product.id)
                        .limit(4)
  end

  def new
    @product = Product.new
    @categories = Category.all.pluck(:name, :id)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "投稿しました"
      redirect_to root_path
    else
      @categories = Category.all.pluck(:name, :id)
      render :new
    end
  end

  def edit
    @categories = Category.all.pluck(:name, :id)
  end

  def update
    if params[:product][:image_ids]
      params[:product][:image_ids].each do |image_id|
        image = @product.images.find(image_id)
        image.purge
      end
    end
    if @product.update(product_params)
      redirect_to @product, notice: '投稿を変更しました'
    else
      @categories = Category.all.pluck(:name, :id)
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
    params.require(:product).permit(:name, :description, :price, :user_id, :category_id, images: [])
  end
end
