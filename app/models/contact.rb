# frozen_string_literal: true

class Contact < ApplicationRecord
  validate :rut_is_correct
  belongs_to :booking

  def rut_is_correct
    errors.add(:rut, 'is not a valid rut') unless Chilean::Rutify.valid_rut?(rut)
  end
end
