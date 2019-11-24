class Question < ApplicationRecord
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :answers, dependent: :destroy
  belongs_to :user
  belongs_to :category

  field :text, type: String
  field :upvotes, type: Integer

  validates :text, presence: true
end
