# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :rut
      t.string :email
      t.text :info
      t.string :name

      t.timestamps
    end
  end
end
