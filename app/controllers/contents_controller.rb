class ContentsController < ApplicationController
# カテゴリーに応じたデータの保存の実装（⇨Formも）

  def new
    @content = Content.new
  end

  def index
    @banks = Bank.all
    @categories = Category.all
    @content =Content.new
    @bank = Bank.find(params[:bank_id])
    @category = @bank.categories.find(params[:category_id])
    # @contents = @category.contents
  end

  def create
    @bank = Bank.find(params[:bank_id])
    @category = @bank.categories
    @content = @category.contents.new(content_params)
    if @content.save
      redirect_to bank_contents_path(@bank)
    else
      @contents = @bank.contents.includes(:category)
      render :index
    end
  end
  

  private
  def content_params
    params.require(:content).permit(:detail).merge(user_id: current_user.id)
  end
end