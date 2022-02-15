# frozen_string_literal: true

class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]
  add_flash_types :data

  # GET /contacts or /contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1 or /contacts/1.json
  def show; end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @booking = Booking.find_by(id: params['booking_id'])
    @name = params['name']
  end

  # GET /contacts/1/edit
  def edit; end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        BookingMailer.with(contact: @contact).contact_sent.deliver_now
        format.html { redirect_to root_path, notice: 'La informacion de contacto ha sido enviada correctamente.' }
        format.json { render :show, status: :created, location: @contact }
      else
        @name = @contact.name
        @booking = Booking.find_by(id: @contact.booking_id)
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contact_url(@contact), notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def contact_params
    params.require(:contact).permit(:rut, :email, :info, :booking_id, :name)
  end
end
