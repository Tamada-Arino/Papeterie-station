class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.invalid?
      render :new
    end
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      flash[:notice] = "問い合わせ内容を送信しました。"
      redirect_to root_path
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :address, :text)
  end
end
