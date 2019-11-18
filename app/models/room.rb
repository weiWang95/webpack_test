class Room < ApplicationRecord
  include SoftDeletable

  belongs_to :inn, counter_cache: true

  has_many_attached :images
end