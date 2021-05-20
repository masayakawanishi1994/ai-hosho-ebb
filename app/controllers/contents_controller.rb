class ContentsController < ApplicationController

  def index 
    @all_content = Content.all
    @all_bank = Bank.all #サイドバーに必要（共通）
    @all_category = Category.all#サイドバーに必要（共通）
    @content =Content.new
    @bank = Bank.find(params[:bank_id]) #一覧表示に必要（共通）
    @categories = @bank.categories.select(:subject)#一覧表示に必要（共通）
  end

  def index2
    @category = Category.find(params[:category_id])#一覧表示に必要（共通）
    @all_bank = Bank.all #サイドバーに必要（共通）
    @all_category = Category.all#サイドバーに必要（共通）
    @content =Content.new
  end

  def new
    @content = Content.new
    @all_bank = Bank.all #サイドバーに必要（共通）
    @all_category = Category.all #サイドバーに必要（共通）
    @bank = Bank.find(params[:bank_id])#一覧表示に必要（共通）
    @categories = @bank.categories.select(:subject)#一覧表示に必要（共通）
    @category = Category.find(params[:category_id])#登録・編集画面に必要
  end

  def create
    @all_bank = Bank.all #サイドバーに必要（共通）
    @all_category = Category.all #サイドバーに必要（共通）
    @category = Category.find(params[:category_id]) #登録・編集画面に必要
    @bank = Bank.find(params[:bank_id])
    @categories = @bank.categories.select(:subject)
    @content = @bank.contents.new(content_params)
    begin
      @content.save
      if @content == ""
        redirect_to bank_contents_path(@bank),notice: "情報を登録してください。"
      else
      redirect_to bank_contents_path(@bank),notice: "登録しました。"
      end
    rescue StandardError => e
      logger.error e
      logger.error e.backtrace.join("\n")
      redirect_to bank_contents_path(@bank),notice: "すでに登録済みです。編集ボタンから更新が必要です。"
    end
  end

  def edit
    @all_bank = Bank.all #サイドバーに必要（共通）
    @all_category = Category.all#サイドバーに必要（共通）
    @bank = Bank.find(params[:bank_id])#一覧表示に必要（共通）
    @categories = @bank.categories.select(:subject)#一覧表示に必要（共通）
    @category = Category.find(params[:category_id])#登録・編集画面に必要
    @content = Content.find(params[:id])
  end

  def update
    @bank = Bank.find(params[:bank_id])#一覧表示に必要（共通）
    @content = Content.find(params[:id])
    if @content.update(content_params)
      redirect_to bank_contents_path(@bank),notice: "更新しました。"
    else
      @contents = @bank.contents.includes(:category)
      redirect_to bank_contents_path(@bank),notice: "更新に失敗しました。"
    end
  end

  private
  def content_params
    params.require(:content).permit(:detail).merge(bank_id: params[:bank_id], category_id: params[:category_id] ,user_id: current_user.id)
  end
end