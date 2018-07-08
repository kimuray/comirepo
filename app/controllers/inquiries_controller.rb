class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      redirect_to root_url, notice: 'お問い合わせいただきありがとうございます。'
    else
      render :new
    end
  end

  private

  def inquiry_params
    params.fetch(:inquiry, {}).permit(:kind, :name, :email, :content)
  end
end
