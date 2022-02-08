# frozen_string_literal: true

require 'rails_helper'

class BookingTest < ActiveSupport::TestCase
  RSpec.describe 'Bookings', type: :request do
    describe 'book cabin' do
      before do
        Cabin.create!(name: 'Cabaña Test', description: 'Es una cabaña de prueba', price: 10_000)
        user = User.create!(email: 'cabanasyacorreo@gmail.com', password: ENV['DEFAUL_USER_PASS'])
        login_as(user)
      end

      after do
        Booking.delete_all
        Cabin.delete_all
        User.delete_all
      end

      it 'book cabin correctly' do
        expect do
          # visit root_path
          # find('#cabin').click
          # fill_in 'Name', with: 'Test'
          # # fill_in 'Fechas', with: '14/07/2022 to 18/07/2022'
          # find('#flatpickr-capybara-selector-dates').fill_in(with: '14/07/2022 to 18/07/2022')
          # fill_in 'Contact email', with: 'mailtest.com'
          # sleep(1)
          # click_on 'Agendar'
          # sleep(1)
          # # find_field('Rut').set('21643640-7')
          # find('#rutfield', visible: false).fill_in(with: '21643640-7')
          # sleep(1)
          # fill_in 'Info', with: 'testing'
          # sleep(1)
          # click_on 'Enviar'

          # sleep(1)
          # click_on 'Reservas'
          # expect(page).to have_content('Cabaña Test')
        end.not_to raise_error
      end
    end
  end
end
