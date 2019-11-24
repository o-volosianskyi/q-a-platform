class Answer < ApplicationRecord
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :question
  belongs_to :author

  field :text, type: String
  field :upvotes, type: Integer
  field :most_helpful, type: Boolean

  validates :text, presence: true, length: { minumum: 4 }
end
