class ContentsController < ApplicationController
# カテゴリーに応じたデータの保存の実装（⇨Formも）

  def index
    @banks = Bank.all #サイドバーに必要（共通）
    @content =Content.new
    @bank = Bank.find(params[:bank_id])
    @contents = @bank.contents
    @categories = @bank.categories.select(:subject)
  end

  def new
    @content = Content.new
    @banks = Bank.all #サイドバーに必要（共通）
    @bank = Bank.find(params[:bank_id])
    @categories = @bank.categories.select(:subject)
    @category = Category.find(params[:category_id]) 
  end

  def create
    @bank = Bank.find(params[:bank_id])
    @categories = @bank.categories.select(:subject)
    @content = @bank.contents.new(content_params)
    if @content.save
      redirect_to bank_contents_path(@bank),notice: "登録しました。"
    else
      @contents = @bank.contents.includes(:category)
      redirect_to bank_contents_path(@bank),notice: "登録に失敗しました。"
    end
  end

  private
  def content_params
    params.require(:content).permit(:detail).merge(bank_id: params[:bank_id], category_id: params[:category_id] ,user_id: current_user.id)
  end
end