class BanksController < ApplicationController
  def edit
    @all_bank = Bank.all #サイドバーに必要（共通）
    @all_category = Category.all #サイドバーに必要（共通）
    @bank = Bank.find(params[:id])
  end

  def update
    @all_bank = Bank.all #サイドバーに必要（共通）
    @all_category = Category.all #サイドバーに必要（共通）
    @bank = Bank.find(params[:id])
    begin
      if @bank.update(bank_params)
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


  def new
    @all_bank = Bank.all #サイドバーに必要（共通）
    @all_category = Category.all #サイドバーに必要（共通）
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)
    begin
      if @bank.save
        redirect_to root_path,notice: "詳細情報を登録してください。"
      else
        redirect_to new_bank_path,notice: "すでに登録済みです。内容を確認してください"
      end
    rescue StandardError => e
      logger.error e
      logger.error e.backtrace.join("\n")
      redirect_to new_bank_path,notice: "登録できませんでした。内容を確認してください。"
    end
  end

  def destroy
    @bank = Bank.find(params[:id])
    begin
      if @bank.destroy
        redirect_to root_path,notice: "削除しました。"
      else
        redirect_to edit_bank_path(bank),notice: "削除できませんでした。やり直してください。"
      end
    rescue StandardError => e
      logger.error e
      logger.error e.backtrace.join("\n")
      redirect_to edit_bank_path(bank),notice: "削除できませんでした。内容を確認してください。"
    end
  end

  private
  def bank_params
    params.require(:bank).permit(:name,category_ids:[])
  end
  
end