class NaifukusController < ApplicationController
  before_action :require_user_logged_in
  def index
    @patients = Patient.all.includes(:naifukus)
    @naifukus = Naifuku.all

    def import
      # fileはtmpに自動で一時保存される
      Naifuku.import(params[:file])
      redirect_to naifukus_url, notice: "追加しました。"
    end

  end

  def show
    @patient = Patient.find(params[:id])
    @naifukus = @patient.naifukus.order("yoteitime ASC")

  end

  def new
    @naifuku = Naifuku.new
  end

  def create
    @naifuku = Naifuku.new(naifuku_params)

    if @naifuku.save
      flash[:success] = '正常に投稿されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def edit
    @naifuku = Naifuku.find(params[:id])
  end

  def update
    @naifuku = Naifuku.find(params[:id])

    if @naifuku.update(naifuku_params)
      flash[:success] = '正常に更新されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @naifuku = Naifuku.find(params[:id])
    @naifuku.destroy

    flash[:success] = '正常に削除されました'
    redirect_to naifukus_url

  end

  private

  def naifuku_params
    params.require(:naifuku).permit(:patient_id,
:yoteitime,:acttime,:actflag,:sijiname,:siji,:pattern
    )
  end

end

