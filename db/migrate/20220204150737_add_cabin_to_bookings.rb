# frozen_string_literal: true

class AddCabinToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :cabin, foreign_key: true
  end
end
