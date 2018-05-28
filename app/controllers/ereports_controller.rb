class EreportsController < ApplicationController
  before_action :require_user_logged_in
  def index
    @patients = Patient.all.includes(:ereports)
    @ereports = Ereport.all
  end

  def show
    @patient = Patient.find(params[:id])
    @ereports = @patient.ereports
  end

  def new
    @ereport = Ereport.new
  end

  def create
    @ereport = Ereport.new(ereport_params)

    if @ereport.save
      flash[:success] = '正常に投稿されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def edit
    @ereport = Ereport.find(params[:id])
  end

  def update
    @ereport = Ereport.find(params[:id])

    if @ereport.update(ereport_params)
      flash[:success] = '正常に更新されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @ereport = Ereport.find(params[:id])
    @ereport.destroy

    flash[:success] = '正常に削除されました'
    redirect_to ereports_url

  end

  private

  def ereport_params
    params.require(:ereport).permit(:patient_id,
:ers,:ert,:erm
    )
  end

end
