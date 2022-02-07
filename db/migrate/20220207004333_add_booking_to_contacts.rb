# frozen_string_literal: true

class AddBookingToContacts < ActiveRecord::Migration[5.2]
  def change
    add_reference :contacts, :booking, foreign_key: true
  end
end
