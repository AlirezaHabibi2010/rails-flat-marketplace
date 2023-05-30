class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_many_attached :photos

  validates_presence_of :name, :description, :address, :price, :user, :photos

  validates_length_of :description, minimum: 6
end
