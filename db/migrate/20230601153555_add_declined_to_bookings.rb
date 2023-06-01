class AddDeclinedToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :declined, :boolean, default: :false
  end
end
