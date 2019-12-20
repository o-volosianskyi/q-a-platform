class Answer < ApplicationRecord
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :question
  belongs_to :user

  field :text, type: String
  field :upvotes, type: Integer
  field :most_helpful, type: Boolean

  validates :text, presence: true, length: { minimum: 4 }
end
