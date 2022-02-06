# frozen_string_literal: true

class AddPriceToCabins < ActiveRecord::Migration[5.2]
  def change
    add_column :cabins, :price, :integer
  end
end
