class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  enum role: %i[patient nurse doctor admin]
  after_initialize :set_default_role, if: :new_record?
  def set_default_role
    self.role ||= :patient
  end
  has_one :patient
  belongs_to :patient, optional: true
end
