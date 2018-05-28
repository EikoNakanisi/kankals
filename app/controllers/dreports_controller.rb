class DreportsController < ApplicationController
  before_action :require_user_logged_in
  def index
    @patients = Patient.all.includes(:dreports)
    @dreports = Dreport.all
  end

  def show
    @patient = Patient.find(params[:id])
    @dreports = @patient.dreports
  end

  def new
    @dreport = Dreport.new
  end

  def create
    @dreport = Dreport.new(dreport_params)

    if @dreport.save
      flash[:success] = '正常に投稿されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def edit
    @dreport = Dreport.find(params[:id])
  end

  def update
    @dreport = Dreport.find(params[:id])

    if @dreport.update(dreport_params)
      flash[:success] = '正常に更新されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @dreport = Dreport.find(params[:id])
    @dreport.destroy

    flash[:success] = '正常に削除されました'
    redirect_to dreports_url

  end

  private

  def dreport_params
    params.require(:dreport).permit(:patient_id,
:drs,:dro,:dra,:drp,:drt
    )
  end

end
