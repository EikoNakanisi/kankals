class EnshusController < ApplicationController
  before_action :require_user_logged_in

  def index
    @enshus = Enshu.all.order("id ASC")
    
    respond_to do |format|
      format.html
      format.csv { send_data @enshus.to_csv }
      format.xls { send_data @enshus.to_csv(col_sep: "\t") }
    end

    def import
      # fileはtmpに自動で一時保存される
      Enshu.import(params[:file])
      redirect_to enshus_url, notice: "追加しました。"
    end

  end




  def show
    @enshu = Enshu.find(params[:id])
  end

  def new
    @enshu = Enshu.new
  end

  def create
    @enshu = Enshu.new(enshu_params)

    if @enshu.save
      flash[:success] = '正常に投稿されました'
      redirect_to @enshu
    else
      flash.now[:danger] = '投稿されませんでした'
      render :new
    end
  end

  def edit
    @enshu = Enshu.find(params[:id])
  end

  def update
    @enshu = Enshu.find(params[:id])

    if @enshu.update(enshu_params)
      flash[:success] = '正常に更新されました'
      redirect_to @enshu
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end

  def destroy
    @enshu = Enshu.find(params[:id])
    @enshu.destroy

    flash[:success] = '正常に削除されました'
    redirect_to enshus_url

  end

  private

  def enshu_params
    params.require(:enshu).permit(:kisaibi,:age,:kiou,:katudou,:ninsiki,:haisetu,
:med1,:med2,:med3,:med4,:med5,:kankyo1,:kankyo2,:goukei,:kikendo,:yobou
    )
  end

end
