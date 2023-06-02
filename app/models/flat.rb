class Flat < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address,
  against: [ :name, :address ],
  using: {
    tsearch: { prefix: true }
  }
  scope :available, (lambda do |start_date, end_date|
    Flat.includes(:bookings).where.not("bookings.start_date < ? AND bookings.end_date > ?",
    start_date, end_date).references(:bookings).uniq
  end)

  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  validates_presence_of :name, :description, :address, :price, :user, :photos
  validates_length_of :description, minimum: 6
end
