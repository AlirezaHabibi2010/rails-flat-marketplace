class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.references :flat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :confirmed_by_owner, default: :false

      t.timestamps
    end
  end
end
