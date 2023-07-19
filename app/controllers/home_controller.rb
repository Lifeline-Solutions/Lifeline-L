class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @patient = Patient.all.order('created_at DESC')
    @patient = Patient.find_by_gender(params[:id])

  end
end
