class Inn < ApplicationRecord
  include SoftDeletable

  belongs_to :user

  has_many :rooms

  has_many_attached :images
end