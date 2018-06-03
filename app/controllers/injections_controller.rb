class InjectionsController < ApplicationController
  before_action :require_user_logged_in
  def index
    @patients = Patient.all.includes(:injections)
    @injections = Injection.all

    def import
      # fileはtmpに自動で一時保存される
      Injection.import(params[:file])
      redirect_to injections_url, notice: "追加しました。"
    end

  end

  def show
    @patient = Patient.find(params[:id])
    @injections = @patient.injections.order("yoteitime ASC")

  end

  def new
    @injection = Injection.new
  end

  def create
    @injection = Injection.new(injection_params)

    if @injection.save
      flash[:success] = '正常に投稿されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def edit
    @injection = Injection.find(params[:id])
  end

  def update
    @injection = Injection.find(params[:id])

    if @injection.update(injection_params)
      flash[:success] = '正常に更新されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @injection = Injection.find(params[:id])
    @injection.destroy

    flash[:success] = '正常に削除されました'
    redirect_to injections_url

  end

  private

  def injection_params
    params.require(:injection).permit(:patient_id,
:yoteitime,:acttime,:actflag,:sijiname,:siji,:pattern
    )
  end

end

