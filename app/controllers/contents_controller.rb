class ContentsController < ApplicationController
# カテゴリーに応じたデータの保存の実装（⇨Formも）
  def new
    @content = Content.new
  end

  def index
    @banks = Bank.all
    @categories = Category.select(:subject)
    @content =Content.new
    @bank = Bank.find(params[:bank_id])
    @contents = @bank.contents
        # @category = Category.find_by(subject: params[:subject])
    # @category = @bank.categories.flat_map(&:categories)
  end

  def create
    @bank = Bank.find(params[:bank_id])
    @category = Category.find_by(params[:category_id])
    @content = @bank.contents.new(content_params)
    if @content.save
      redirect_to bank_contents_path(@bank)
    else
      @contents = @bank.contents.includes(:category)
      render :index,notice: "登録できていません。"
    end
  end

  private
  def content_params
    params.require(:content).permit(:detail).merge(category_id: category.id)
  end
end