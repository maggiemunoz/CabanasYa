# frozen_string_literal: true

class BookingMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.booking_created.subject
  #
  def booking_created
    @user = params[:user]
    @booking = params[:booking]

    mail(
      to: @user.email,
      subject: 'Reserva hecha'
    )
  end
end
