# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :cabin
  belongs_to :user
  has_many :contacts, dependent: :destroy

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :contact_email, presence: true
  validate :all_dates_are_free

  def all_dates_are_free
    if !start_date.nil? && !end_date.nil? # rubocop:disable Style/GuardClause
      bookings = Booking.where(['cabin_id =?', cabin_id])
      date_ranges = bookings.map { |bk| bk.start_date..bk.end_date }

      (start_date.to_date..end_date.to_date).to_a.each do |date|
        date_ranges.each do |range|
          if range.include? date
            errors.add(:cabin_id, 'is taken during those days, please pick another one')
            return
          end
        end
      end
    end
  end
end
