class User < ApplicationRecord
  include SoftDeletable

  has_many :inns

  has_one_attached :avatar
  has_secure_password
end