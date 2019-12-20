class Question < ApplicationRecord
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :answers, dependent: :destroy
  belongs_to :user
  belongs_to :category

  field :title, type: String
  field :text, type: String
  field :upvotes, type: Integer, default: 0

  validates :title, presence: true
  validates :text, presence: true
end
