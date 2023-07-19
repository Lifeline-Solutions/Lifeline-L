class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @patients = User.where(role: :patient)
  end
end
