class ResultsController < ApplicationController
  def show
    @patient = Patient.find(params[:id])
    @saiketus = @patient.saiketus.order("id ASC")
  end
end
