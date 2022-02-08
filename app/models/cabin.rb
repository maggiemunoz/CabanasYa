# frozen_string_literal: true

class Cabin < ApplicationRecord
  has_one_attached :image
  has_many :bookings, dependent: :destroy
end
