class User 
  include Mongoid::Document
  include Mongoid::Timestamps
  
  mount_uploader :avatar, AvatarUploader

  has_many :answers, dependent: :destroy
  has_many :questions, dependent: :destroy

  field :name, type: String
  field :avatar, type: String

  validates :name, presence: true, length: { minimum: 4 }
end
