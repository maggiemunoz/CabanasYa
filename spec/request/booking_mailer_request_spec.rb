# frozen_string_literal: true

require 'rails_helper'

class BookingMailerTest < ActiveSupport::TestCase
  RSpec.describe 'Booking Mailer', type: :request do
    before(:each) do
      ActionMailer::Base.delivery_method = :test
      ActionMailer::Base.perform_deliveries = true
      ActionMailer::Base.deliveries = []
      cabin = Cabin.create!(name: 'Cabaña Test', description: 'Es una cabaña de prueba', price: 10_000)
      user = User.create!(email: 'test@gmail.com', password: '123456')
      @booking = Booking.create!(start_date: Date.new(2022, 7, 14),
                                 end_date: Date.new(2022, 7, 18),
                                 name: 'Test',
                                 contact_email: 'test@gmail.com',
                                 cabin: cabin,
                                 user: user)
    end

    after(:each) do
      ActionMailer::Base.deliveries.clear
      Booking.delete_all
      Cabin.delete_all
      User.delete_all
    end

    it 'should send an email' do
      BookingMailer.with(user: @booking.user, booking: @booking).booking_created.deliver_now
      expect(ActionMailer::Base.deliveries.count).to eq(1)
    end

    it 'sends to the correct receiver' do
      BookingMailer.with(user: @booking.user, booking: @booking).booking_created.deliver_now
      expect(ActionMailer::Base.deliveries.first.to.first).to eq('test@gmail.com')
    end

    it 'should set the subject correctly' do
      BookingMailer.with(user: @booking.user, booking: @booking).booking_created.deliver_now
      expect(ActionMailer::Base.deliveries.first.subject).to eq('Reserva hecha')
    end
  end
end
