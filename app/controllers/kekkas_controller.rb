class KekkasController < ApplicationController
  before_action :require_user_logged_in

  def index
    @patients = Patient.all.includes(:saiketus)
    @saiketus = Saiketu.all.order("id ASC")
  end

  def show
    @patient = Patient.find(params[:id])
    @saiketus = @patient.saiketus.order("id ASC")
    @day = @saiketus.find_by(params[:id])
  end


end


