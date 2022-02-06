# frozen_string_literal: true

require 'test_helper'

class BookingMailerTest < ActionMailer::TestCase
  test 'booking_created' do
    mail = BookingMailer.booking_created
    assert_equal 'Booking created', mail.subject
    assert_equal ['to@example.org'], mail.to
    assert_equal ['from@example.com'], mail.from
    assert_match 'Hi', mail.body.encoded
  end
end
