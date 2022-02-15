# frozen_string_literal: true

require 'rails_helper'

class BookingTest < ActiveSupport::TestCase
  RSpec.describe 'Bookings', type: :request do
    describe 'book cabin' do
      before do
        cabin = Cabin.create!(name: 'Cabaña Test', description: 'Es una cabaña de prueba', price: 10_000)
        user = User.create!(email: 'cabanasyacorreo@gmail.com', password: ENV['DEFAUL_USER_PASS'])
        login_as(user)

        Booking.create!(start_date: Date.new(2022, 7, 20), end_date: Date.new(2022, 7, 22), name: 'Test',
                        contact_email: 'email@test.com', cabin_id: cabin.id, user_id: user.id)
      end

      after(:all) do
        puts 'borrando'
        Contact.delete_all
        Booking.delete_all
        Cabin.delete_all
        User.delete_all
      end

      it 'book cabin correctly' do
        expect do
          visit root_path
          find('#cabin').click
          fill_in 'Name', with: 'Test'
          # fill_in 'Fechas', with: '14/07/2022 to 18/07/2022'
          find('#flatpickr-capybara-selector-dates').fill_in(with: '14/07/2022 to 18/07/2022')
          fill_in 'Contact email', with: 'test@gmail.com'
          # sleep(1)
          click_on 'Agendar'
          # sleep(1)
          expect(page).to have_content('La reserva fue creada correctamente')
          # find_field('Rut').set('21643640-7')
          find('#rutfield', visible: false).fill_in(with: '21643640-7')
          # sleep(3)
          find('#infofield', visible: false).fill_in(with: 'testing')
          # fill_in 'Informacion adicional', with: 'testing'
          # sleep(3)
          click_on 'Enviar'

          expect(page).to have_content('La informacion de contacto ha sido enviada correctamente.')
        end.not_to raise_error
      end

      it 'fail if name missing' do
        expect do
          visit root_path
          find('#cabin').click
          # fill_in 'Fechas', with: '14/07/2022 to 18/07/2022'
          find('#flatpickr-capybara-selector-dates').fill_in(with: '14/07/2022 to 18/07/2022')
          fill_in 'Contact email', with: 'test@gmail.com'
          # # sleep(1)
          click_on 'Agendar'
          # # sleep(1)
          expect(page).to have_content("Name can't be blank")
        end.not_to raise_error
      end

      it 'fail if email missing' do
        expect do
          visit root_path
          find('#cabin').click
          fill_in 'Name', with: 'Test'
          # fill_in 'Fechas', with: '14/07/2022 to 18/07/2022'
          find('#flatpickr-capybara-selector-dates').fill_in(with: '14/07/2022 to 18/07/2022')
          # # sleep(1)
          click_on 'Agendar'
          # # sleep(1)
          expect(page).to have_content("Contact email can't be blank")
        end.not_to raise_error
      end

      it 'fail if dates missing' do
        expect do
          visit root_path
          find('#cabin').click
          fill_in 'Name', with: 'Test'
          # fill_in 'Fechas', with: '14/07/2022 to 18/07/2022'
          fill_in 'Contact email', with: 'test@gmail.com'
          # # sleep(1)
          click_on 'Agendar'
          # # sleep(1)
          expect(page).to have_content("Start date can't be blank")
          expect(page).to have_content("End date can't be blank")
        end.not_to raise_error
      end

      it 'fail and then book correctly' do
        expect do
          visit root_path
          find('#cabin').click
          # fill_in 'Fechas', with: '14/07/2022 to 18/07/2022'
          find('#flatpickr-capybara-selector-dates').fill_in(with: '14/07/2022 to 18/07/2022')
          fill_in 'Contact email', with: 'test@gmail.com'
          # sleep(1)
          click_on 'Agendar'
          # sleep(1)
          fill_in 'Name', with: 'Test'
          find('#flatpickr-capybara-selector-dates').fill_in(with: '14/07/2022 to 18/07/2022')
          # sleep(3)
          click_on 'Agendar'
          # sleep(3)
          expect(page).to have_content('La reserva fue creada correctamente')
        end.not_to raise_error
      end
    end
  end
end
