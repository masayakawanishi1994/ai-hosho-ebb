class ContentsController < ApplicationController
# カテゴリーに応じたデータの保存の実装（⇨Formも）
  def edit
    @category = Category.find(params[:id])
    @bank = Bank.find(params[:id])
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
      if @content.update(content_params)
        redirect_to content_path
      else
        @content = Content.find(params[:id])
        render :edit
      end
  end

  # def new
    # @content = Content.new
  # end

  def index
    @content =Content.new
    @bank = Bank.find(params[:bank_id])
    @contents = @bank.contents
    @content = Content
    @categories = Category.select("subject")
    @banks = Bank.all 
    
  end

  def create
    @bank = Bank.find(params[:bank_id])
    @content = @bank.contents.new(content_params)
    if @content.save
      redirect_to bank_contents_path(@bank)
    else
      @contents = @bank.contents.includes(:category)
      render :index
    end
  end
  

  private
  def content_params
    params.require(:content).permit(:detail).merge(category_id: category.id)
  end
end