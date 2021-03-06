# frozen_string_literal: true

class CreateCabins < ActiveRecord::Migration[5.2]
  def change
    create_table :cabins do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
