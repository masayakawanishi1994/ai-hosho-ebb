class CategoriesController < ApplicationController
  def edit
    @all_bank = Bank.all #サイドバーに必要（共通）
    @all_category = Category.all #サイドバーに必要（共通）
    @category = Category.find(params[:id])
  end

  def update
    @all_bank = Bank.all #サイドバーに必要（共通）
    @all_category = Category.all #サイドバーに必要（共通）
    @category = Category.find(params[:id])
    begin
      if @category.update(category_params)
        redirect_to root_path,notice: "更新しました。"
      else
        render :edit,notice: "内容を確認してください。"
      end
    rescue  StandardError => e
      logger.error e
      logger.error e.backtrace.join("\n")
      redirect_to root_path,notice: "更新できませんでした。内容を確認してください。"
    end
  end
  def index
    @all_bank = Bank.all #サイドバーに必要（共通）
    @all_category = Category.all #サイドバーに必要（共通）
    @all_content = Content.all #ホーム画面に必要（共通）
    @content = Content.select(:detail)
  end

  def new
    @all_bank = Bank.all #サイドバーに必要（共通）
    @all_category = Category.all #サイドバーに必要（共通）
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    begin
      if @category.save
        redirect_to root_path,notice: "詳細情報を登録してください。"
      else
        render :new,notice: "すでに登録済みです。再度登録してください。"
      end
    rescue StandardError => e
      logger.error e
      logger.error e.backtrace.join("\n")
      render :new ,notice: "登録できませんでした。内容を確認してください。"
    end
  end
  def destroy
    @category = Category.find(params[:id])
    begin
      if @category.destroy
        redirect_to root_path,notice: "削除しました。"
      else
        redirect_to edit_category_path(category),notice: "削除できませんでした。再度やり直してください。"
      end
    rescue StandardError => e
      logger.error e
      logger.error e.backtrace.join("\n")
      redirect_to edit_category_path(category),notice: "削除できませんでした。再度やり直してください。"
    end
  end

  private

  def category_params
    params.require(:category).permit(:subject,:number,bank_ids:[])
  end
end