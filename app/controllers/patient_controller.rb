class PatientController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @patient = User.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user_id = current_user.id
    respond_to do |format|
      if @patient.save
        format.html { redirect_to "/patient/#{current_user.id}", notice: 'Patient was successfully created.' }
      else
        format.html { redirect_to patient_index_url notice: 'Failure' }
      end
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.delete
    respond_to do |format|
      format.html { redirect_to patient_index_path, notice: 'Patient was successfully deleted.' }
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to patient_index_path(@patient), notice: 'Patient was successfully updated.' }
      else
        format.html { redirect_to patient_index_url, notice: 'Failure' }
      end
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:gender, :marital_status, :phone_number, :residence, :photo, :user_id)
  end
end
