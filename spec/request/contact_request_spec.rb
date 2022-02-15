# frozen_string_literal: true

require 'rails_helper'

class ContactTest < ActiveSupport::TestCase
  RSpec.describe 'Contacts', type: :request do
    describe 'send contact information' do
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

      it 'fail if rut missing' do
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
          # find_field('Rut').set('21643640-7')
          #   find('#rutfield', visible: false).fill_in(with: '21643640-7')
          # sleep(1)
          find('#infofield', visible: false).fill_in(with: 'testing')
          # fill_in 'Informacion adicional', with: 'testing'
          # sleep(1)
          click_on 'Enviar'

          expect(page).to have_content("Rut can't be blank")
        end.not_to raise_error
      end

      it 'fail if rut is invalid' do
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
          # find_field('Rut').set('21643640-7')
          find('#rutfield', visible: false).fill_in(with: '21643640')
          # sleep(1)
          find('#infofield', visible: false).fill_in(with: 'testing')
          # fill_in 'Informacion adicional', with: 'testing'
          # sleep(1)
          click_on 'Enviar'

          expect(page).to have_content('Rut is not a valid rut')
        end.not_to raise_error
      end

      it 'fail because no info and then send' do
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
          # find_field('Rut').set('21643640-7')
          find('#rutfield', visible: false).fill_in(with: '21643640-7')
          # sleep(1)
          # fill_in 'Informacion adicional', with: 'testing'
          # sleep(1)
          click_on 'Enviar'
          # sleep(1)
          expect(page).to have_content("Info can't be blank")

          find('#infofield', visible: false).fill_in(with: 'testing')
          click_on 'Enviar'
          expect(page).to have_content('La informacion de contacto ha sido enviada correctamente.')

        end.not_to raise_error
      end


    end
  end
end
