class NinstructionsController < ApplicationController
  before_action :require_user_logged_in
  def index
    @patients = Patient.all.includes(:ninstructions)
    @ninstructions = Ninstruction.all

    def import
      # fileはtmpに自動で一時保存される
      Ninstruction.import(params[:file])
      redirect_to ninstructions_url, notice: "追加しました。"
    end

  end

  def show
    @patient = Patient.find(params[:id])
    @ninstructions = @patient.ninstructions.order("yoteitime ASC")

  end

  def new
    @ninstruction = Ninstruction.new
  end

  def create
    @ninstruction = Ninstruction.new(ninstruction_params)

    if @ninstruction.save
      flash[:success] = '正常に投稿されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def edit
    @ninstruction = Ninstruction.find(params[:id])
  end

  def update
    @ninstruction = Ninstruction.find(params[:id])

    if @ninstruction.update(ninstruction_params)
      flash[:success] = '正常に更新されました'
      redirect_to action: 'index'
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @ninstruction = Ninstruction.find(params[:id])
    @ninstruction.destroy

    flash[:success] = '正常に削除されました'
    redirect_to ninstructions_url

  end

  private

  def ninstruction_params
    params.require(:ninstruction).permit(:patient_id,
:yoteitime,:acttime,:actflag,:sijiname,:siji,:gotime
    )
  end

end

