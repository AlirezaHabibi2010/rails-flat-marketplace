class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  validates_presence_of :start_date, :end_date, :flat

  validates_comparison_of :start_date, greater_than_or_equal_to: Date.today, message: 'can be today or future'

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  def booked_date_range
    { from: :start_date, to: :end_date }
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
