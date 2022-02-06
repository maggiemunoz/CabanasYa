class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.booking_created.subject
  #
  def booking_created
    @greeting = "Hi"

    mail to: "cabanasyacorreo@gmail.com"
  end
end
