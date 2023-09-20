class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Rails.application.routes.url_helpers
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_one_attached :photo_id

  enum role: %i[patient admin]
  after_initialize :set_default_role, if: :new_record?
  def set_default_role
    self.role ||= :patient
  end
  has_one :patient
  belongs_to :patient, optional: true

  has_one_attached :qr_code, dependent: :destroy
  after_create :generate_qr_code

  def generate_qr_code
    # Get the host
    qr_url = url_for(controller: 'patient',
                     action: 'index',
                     id:,
                     only_path: false,
                     host: 'https://lifeline.fly.dev/',
                     source: 'from_qr')
    qrcode = RQRCode::QRCode.new(qr_url)

    png = qrcode.as_png(
      resize_gte_to: false,
      resize_exactly_to: false,
      fill: 'white',
      color: 'black',
      size: 250,
      border_modules: 2,
      module_px_size: 6,
      file: nil # path to write
    )
    image_name = SecureRandom.hex
    File.binwrite("tmp/#{image_name}.png", png.to_s)

    blob = ActiveStorage::Blob.create_and_upload!(
      io: File.open("tmp/#{image_name}.png"),
      filename: "#{first_name}_#{last_name}_qr_code.png",
      content_type: 'png'
    )
    qr_code.attach(blob)
  end
end
