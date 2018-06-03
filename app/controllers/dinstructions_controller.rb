class DinstructionsController < ApplicationController
  before_action :require_user_logged_in
  def index
    @patients = Patient.all.includes(:dinstructions)
    @dinstructions = Dinstruction.all

    def import
      # fileはtmpに自動で一時保存される
      Dinstruction.import(params[:file])
      redirect_to dinstructions_url, notice: "追加しました。"
    end

  end

  def show
    @patient = Patient.find(params[:id])
    @dinstructions = @patient.dinstructions.order("id ASC")

  end

  def new
    @dinstruction = Dinstruction.new
  end

  def create
    @dinstruction = Dinstruction.new(dinstruction_params)

    if @dinstruction.save
      flash[:success] = '正常に投稿されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def edit
    @dinstruction = Dinstruction.find(params[:id])
  end

  def update
    @dinstruction = Dinstruction.find(params[:id])

    if @dinstruction.update(dinstruction_params)
      flash[:success] = '正常に更新されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @dinstruction = Dinstruction.find(params[:id])
    @dinstruction.destroy

    flash[:success] = '正常に削除されました'
    redirect_to dinstructions_url

  end

  private

  def dinstruction_params
    params.require(:dinstruction).permit(:patient_id,
:sijiname,:siji,:sijiflag,:gotime
    )
  end

end


