class CategoriesController < ApplicationController
  def index
    @banks = Bank.all
    @category = Category.all#サイドバーに必要（共通）
    @contents = Content.all
    @content = Content.select(:detail)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path,notice: "詳細情報を登録してください。"
    else
      render :new
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to root_path
  end

  private

  def category_params
    params.require(:category).permit(:subject,:number,bank_ids:[])
  end
end