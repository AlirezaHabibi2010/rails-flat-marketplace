class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  validates_presence_of :start_date, :end_date, :flat

  validates_comparison_of :start_date, less_than: :end_date, message: 'should be greater than checkout date'
  validates_comparison_of :start_date, greater_than_or_equal_to: Date.today, message: 'can be today or future'
end
