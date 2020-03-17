class User 
  include Mongoid::Document
  include Mongoid::Timestamps
  
#  mount_uploader :avatar, AvatarUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { minimum: 4 }

  has_many :answers, dependent: :destroy
  has_many :questions, dependent: :destroy

  field :name, type: String
  field :avatar, type: String

  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  def will_save_change_to_email? 
  end
end
