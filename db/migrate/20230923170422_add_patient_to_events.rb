class AddPatientToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :patient, foreign_key: true
  end
end
