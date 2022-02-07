# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show; end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit; end

  # POST /bookings or /bookings.json
  def create
    better_params = booking_params
    better_params[:start_date] = better_params[:dates][0..9].to_date
    better_params[:end_date] = better_params[:dates][14..23].to_date
    better_params.delete(:dates)

    @booking = Booking.new(better_params)

    respond_to do |format|
      if @booking.save
        BookingMailer.with(user: @booking.user, booking: @booking).booking_created.deliver_now
        # format.html { redirect_to booking_url(@booking), notice: 'Booking was successfully created.' }
        format.html do
          redirect_to new_contact_path(params: { email: @booking.contact_email,
                                                 booking_id: @booking.id,
                                                 name: @booking.name }),
                      notice: 'Booking was successfully created.'
        end
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :cabin_id, :user_id, :dates, :contact_email, :name)
  end
end
