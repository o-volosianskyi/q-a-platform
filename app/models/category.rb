class Category < ApplicationRecord
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :questions, foreign_key: 'category_id', dependent: :destroy

  field :name, type: String

  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { minimum: 2 }
end
