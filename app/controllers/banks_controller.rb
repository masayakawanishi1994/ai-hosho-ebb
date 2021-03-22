class BanksController < ApplicationController
  def edit
    @bank = Bank.find(params[:id])
  end

  def update
    @bank = Bank.find(params[:id])
    if @bank.update(bank_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)
    if @bank.save
      redirect_to root_path,notice: "詳細情報を登録してください。"
    else
      render :new
    end
  end

  def destroy
    @bank = Bank.find(params[:id])
    @bank.destroy
    redirect_to root_path
  end

  private
  def bank_params
    params.require(:bank).permit(:name,category_ids:[])
  end
  
end