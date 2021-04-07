class ContentsController < ApplicationController

  def index
    @banks = Bank.all #サイドバーに必要（共通）
    @content =Content.new
    @bank = Bank.find(params[:bank_id])#一覧表示に必要（共通）
    logger.debug(@test.inspect)
    @categories = @bank.categories.select(:subject)#一覧表示に必要（共通）
  end

  def new
    @content = Content.new
    @banks = Bank.all #サイドバーに必要（共通）
    @bank = Bank.find(params[:bank_id])#一覧表示に必要（共通）
    @categories = @bank.categories.select(:subject)#一覧表示に必要（共通）
    @category = Category.find(params[:category_id])#登録・編集画面に必要
  end

  def confirm
    @category = Category.find(params[:category_id])#登録・編集画面に必要
    @content = Content.new(content_params)
    render :new if @content.invalid?
  end

  def back
    render :new
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

  def edit
    @banks = Bank.all #サイドバーに必要（共通）
    @bank = Bank.find(params[:bank_id])#一覧表示に必要（共通）
    @categories = @bank.categories.select(:subject)#一覧表示に必要（共通）
    @category = Category.find(params[:category_id])#登録・編集画面に必要
    @content = Content.find(params[:id])
  end

  def update
    @bank = Bank.find(params[:bank_id])#一覧表示に必要（共通）
    @content = Content.find(params[:id])
    if @content.update(content_params)
      redirect_to bank_contents_path(@bank),notice: "修正しました。"
    else
      @contents = @bank.contents.includes(:category)
      redirect_to bank_contents_path(@bank),notice: "修正に失敗しました。"
    end
  end

  private
  def content_params
    params.require(:content).permit(:detail).merge(bank_id: params[:bank_id], category_id: params[:category_id] ,user_id: current_user.id)
  end
end