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

    if (@user.id == 1) || (@booking.contact_email != @user.email)
      mail(
        to: @booking.contact_email,
        subject: 'Reserva hecha'
      )
    else
      mail(
        to: @user.email,
        subject: 'Reserva hecha'
      )
    end
  end

  def contact_sent
    @contact = params[:contact]

    @booking = Booking.find_by(id: @contact.booking_id)
    puts @booking
    cabin = Cabin.find_by(id: @booking.cabin_id).name

    mail(
      to: ENV['GMAIL_ADDRESS'],
      subject: "Se ha reservado #{cabin}"
    )
  end
end
